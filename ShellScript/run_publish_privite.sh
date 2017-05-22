#!/bin/sh

# Text color variables
red=$'\e[0;91m'
grn=$'\e[0;92m'
yel=$'\e[0;93m'
blu=$'\e[0;94m'
mag=$'\e[0;95m'
cyn=$'\e[0;96m'
end=$'\e[0m'


# Icon variables
icon1=$'\360\237\215\270'
icon2=$'\360\237\215\271'
icon3=$'\360\237\215\273'
icon4=$'\360\237\215\274'


### 기본 설정
PODSPEC_FILE="MyLibrary.podspec"
PRIVATE_REPO_NAME="MyLibrary"
GIT_URL="https://~/MyLibrary.git"


### 체크 및 설정
echo ""
echo "======================================="
echo "  MyLibrary Git & Pods Publish Script"
echo "                  created by JosephNK"
echo "======================================="

echo ""
echo "${icon2}  git status Check: "
echo ""

git status;

echo ""
while true; do
    read -p "${icon3}  ${yel}Continue?${end} " yn
    case $yn in
        [Yy]* ) echo ""; break;;
        [Nn]* ) echo ""; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo ""
echo "${icon2}  .podspec file Check: "
echo " => ${grn}${PODSPEC_FILE}${end}"
echo ""
echo "${icon2}  private repo trunk name Check: "
echo " => ${grn}${PRIVATE_REPO_NAME}${end}"
echo ""
echo "${icon2}  git Url Check: "
echo " => ${grn}${GIT_URL}${end}"
echo ""
echo "${icon2}  pop repo push command line Check: "
echo " => ${grn}pod repo push $PRIVATE_REPO_NAME $PODSPEC_FILE${end}"
echo ""

LINE_NUM_VERSION=`echo "$LINE_NUM1" | sed -n "/s.version/=" $PODSPEC_FILE`
LINE_NUM_TAG=`echo "$LINE_NUM2" | sed -n "/s.source[^s.source_files]/=" $PODSPEC_FILE`
C_VERSION=`echo "$VERSION" | sed -n "${LINE_NUM_VERSION}p" $PODSPEC_FILE`
C_TAG=`echo "$VERSION" | sed -n "${LINE_NUM_TAG}p" $PODSPEC_FILE`

echo "${icon2}  Current .podspec Info Check: "
echo " => ${grn}${C_VERSION}${end}"
echo " => ${grn}${C_TAG}${end}"
echo ""

read -p "(Optional) ${icon1}  Please enter a Change Tag(eg., 0.1.0) : "  TAG_ARG
echo ""

if [[ ! -z "${TAG_ARG// }" ]]; then
	REPLASE_STR1="s.version = '$TAG_ARG'"
	REPLASE_STR2="s.source = { :git => \"${GIT_URL}\", :tag => \"$TAG_ARG\" }"

	echo "${icon2}  Will change .podspec Info Check: "
	echo " ${grn}${C_VERSION}${end} \n=> ${grn}${REPLASE_STR1}${end}"
	echo " ${grn}${C_TAG}${end} \n=> ${grn}${REPLASE_STR2}${end}"
	echo ""
	while true; do
	    read -p "${icon3}  ${yel}Continue?${end} " yn
	    case $yn in
	        [Yy]* ) echo ""; break;;
	        [Nn]* ) echo ""; exit;;
	        * ) echo "Please answer yes or no.";;
	    esac
	done
fi

read -p "(Require) ${icon1}  Please enter a Commit Message: "  COMMIT_MESSAGE
echo ""

if [[ -z "${COMMIT_MESSAGE// }" ]]; then
	echo "${red}You must enter a Commint message!!!${end}"; echo""; exit;
fi

while true; do
    read -p "${icon3}  ${red}Do you want to run it?${end} " yn
    case $yn in
        [Yy]* ) echo ""; break;;
        [Nn]* ) echo ""; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done


### podspec 파일 Version & Tag 변경
echo ""
echo "======================================="
echo "  podspec file Modifying"
echo "======================================="

if [[ ! -z "${TAG_ARG// }" ]]; then
    Op="s"

    sed -i '.bak' "$LINE_NUM_VERSION$Op#.*#$REPLASE_STR1#" $PODSPEC_FILE
    rm "$PODSPEC_FILE.bak"

	sed -i '.bak' "$LINE_NUM_TAG$Op#.*#$REPLASE_STR2#" $PODSPEC_FILE
	rm "$PODSPEC_FILE.bak"

	echo ""
    echo "${grn}Success ${PODSPEC_FILE} file Changed.${end}" 

    echo ""
	echo "${icon2}  Running Pod lib lint ..."

	if pod lib lint; then
		echo "${grn}lint Success.${end}"
	else
		echo "${red}lint Failed.${end}"; exit;
	fi
else
	echo "${yel}No changed.${end}"	
fi


### git command
echo ""
echo "======================================="
echo "  Git Publishing"
echo "======================================="

if git pull; then
	echo "${cyn}git pull finished${end}"
fi

if [[ ! -z "${COMMIT_MESSAGE// }" ]]; then
	if git add -A; then
		echo "${cyn}git add -A finished${end}"
	fi

	if git commit -m "${COMMIT_MESSAGE}"; then
		echo "${cyn}git commit -m '${COMMIT_MESSAGE}' finished${end}"
	fi

	if [[ ! -z "${TAG_ARG// }" ]]; then
		if git tag $TAG_ARG; then
			echo "${cyn}git tag $TAG_ARG finished${end}"
		fi
	fi

	if git push -u origin master --tags -v; then
		echo "${cyn}git push was finished${end}"
	else 
		echo "${red}git push was error${end}"
		exit;
	fi
fi	

if [[  -z "${TAG_ARG// }" ]]; then
	echo ""
	echo "${yel}There is no tag, so do not run: CocoaPod Publishing${end}"
	echo "\n"
	exit;
fi

### CocoaPod command
echo ""
echo "======================================="
echo "  CocoaPod Publishing"
echo "======================================="

if pod repo push $PRIVATE_REPO_NAME $PODSPEC_FILE --verbose; then
	echo ""
	echo "${yel}pod repo push $PRIVATE_REPO_NAME $PODSPEC_FILE --verbose finished${end}"	
fi

echo "\n"





