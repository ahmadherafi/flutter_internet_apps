class EndPoint {
  static String register = 'auth/register';
  static String login = 'auth/login';
  static String groups = 'group/user';
  static String filterGroup = 'group/type';
  static String addGroup = '/group/adding';
  static String myGroup = '/group/mygroups';
  static String deleteGroup(int id) => 'group/$id';
  static String joinUserToGroup = 'group/join/user';
}
