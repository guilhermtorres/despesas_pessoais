class ConversaoData {
  List<String> months = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'];
  ConversaoData();
  dateBr(DateTime d) {
    return d.day.toString().padLeft(2, '0') + '/' + d.month.toString().padLeft(2, '0') + '/' + d.year.toString();
  }

  dateBrWithMonth(DateTime d) {
    return d.day.toString().padLeft(2, '0') + ' ' + months[d.month - 1].toString().substring(0, 3) + ' ' + d.year.toString();
  }
}
