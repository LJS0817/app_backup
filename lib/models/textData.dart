class Name {
  String kor = "";
  String eng = "";
  Name({required this.kor, required this.eng});

  String Get(bool ko) {
    return ko ? kor : eng;
  }
}

class textData {
  static bool isKor = false;
  final Name recipeName = Name(kor: "레시피 이름", eng: "Recipe Name");

  final Name date = Name(kor: "날짜", eng: "Date");

  final Name type = Name(kor: "종류", eng: "Type");

  final List<Name> types = [
    Name(kor: "C.P 고형비누", eng: "Cold Process"),
    Name(kor: "H.P 고형비누", eng: "Hot Process"),
    Name(kor: "연비누", eng: "Soap Paste"),
    Name(kor: "연비누", eng: "Paste"),
  ];

  final Name recipeTitle = Name(kor: "이름을 입력하세요", eng: "ENTER TITLE");
  final Name typeTitle = Name(kor: "종류를 선택하세요", eng: "SELECT TYPE");
  final Name valueTitle = Name(kor: "값을 입력하세요", eng: "ENTER VALUE");

  final Name lyeP = Name(kor: "Lye 순도", eng: "Lye Purity");
  final Name lyeC = Name(kor: "희망 Lye", eng: "Lye Count");
  final Name water = Name(kor: "정제수", eng: "Water");

  final Name pure = Name(kor: "순비누", eng: "Pure Soap");
  final Name solvent = Name(kor: "용제", eng: "Solvent");
  final Name sugar = Name(kor: "설탕", eng: "Sugar");
  final Name gly = Name(kor: "글리세린", eng: "Glycerine");
  final Name ethanol = Name(kor: "에탄올", eng: "Ethanol");

  final Name oilGuide = Name(kor: "오일 추가하기", eng: "Add Oil");
  final Name superGuide = Name(kor: "슈퍼팻 추가하기", eng: "Add Super Fat");
  final Name addGuide = Name(kor: "첨가물 추가하기", eng: "Add Additive");
  final Name memoGuide = Name(kor: "메모 추가하기", eng: "Add Memo");

  final Name prevBtn = Name(kor: "이전", eng: "Previous");
  final Name nextBtn = Name(kor: "다음", eng: "Next");
  final Name saveBtn = Name(kor: "저장하기", eng: "Save");

  String getName() {
    return recipeName.Get(isKor);
  }

  String getDate() {
    return date.Get(isKor);
  }

  String getType() {
    return type.Get(isKor);
  }

  String getTypes(int idx) {
    return types[idx].Get(isKor);
  }

  String getRecipeTitle() {
    return recipeTitle.Get(isKor);
  }

  String getTypeTitle() {
    return typeTitle.Get(isKor);
  }

  String getValueTitle() {
    return valueTitle.Get(isKor);
  }

  String getLyePurity() {
    return lyeP.Get(isKor);
  }

  String getLyeCount() {
    return lyeC.Get(isKor);
  }

  String getWater() {
    return water.Get(isKor);
  }

  String getPureSoap() {
    return pure.Get(isKor);
  }

  String getSolvent() {
    return solvent.Get(isKor);
  }

  String getSugar() {
    return sugar.Get(isKor);
  }

  String getGlycerine() {
    return gly.Get(isKor);
  }

  String getEthanol() {
    return ethanol.Get(isKor);
  }

  String getOilGuide() {
    return oilGuide.Get(isKor);
  }

  String getSuperGuide() {
    return superGuide.Get(isKor);
  }

  String getAddGuide() {
    return addGuide.Get(isKor);
  }

  String getMemoGuide() {
    return memoGuide.Get(isKor);
  }

  String getPrevBtn() {
    return prevBtn.Get(isKor);
  }

  String getNextBtn(bool isLast) {
    return isLast ? saveBtn.Get(isKor) : nextBtn.Get(isKor);
  }
}
