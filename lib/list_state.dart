class ListState{

  bool isLoading;
  bool isEroor;
  String errorMsg;

List<Map<String,dynamic>> noteList=[];
  ListState(
      {
        required this.noteList,
        this.isLoading=false,
        this.isEroor=false,
        this.errorMsg=""

      });
  
}