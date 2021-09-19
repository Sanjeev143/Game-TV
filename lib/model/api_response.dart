// Created by Sanjeev Sangral on 19/09/21.
class APIResponse {
  int code;
  Data data;
  bool success;

  APIResponse({this.code, this.data, this.success});

  APIResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class Data {
  String cursor;
  String tournamentCount;
  List<Tournaments> tournaments;
  bool isLastBatch;

  Data({this.cursor, this.tournamentCount, this.tournaments, this.isLastBatch});

  Data.fromJson(Map<String, dynamic> json) {
    cursor = json['cursor'];
    tournamentCount = json['tournament_count'];
    if (json['tournaments'] != null) {
      tournaments = [];
      json['tournaments'].forEach((v) {
        tournaments.add(new Tournaments.fromJson(v));
      });
    }
    isLastBatch = json['is_last_batch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cursor'] = this.cursor;
    data['tournament_count'] = this.tournamentCount;
    if (this.tournaments != null) {
      data['tournaments'] = this.tournaments.map((v) => v.toJson()).toList();
    }
    data['is_last_batch'] = this.isLastBatch;
    return data;
  }
}

class Tournaments {
  bool isCheckInRequired;
  String tournamentId;
  bool tournamentEnded;
  String tournamentEndDate;
  bool areRandomTeamsAllowed;
  int registeredTeams;
  String adminLocale;
  String regEndDate;
  String startDate;
  String rules;
  int maxTeams;
  String tournamentUrl;
  String prizes;
  String matchStyleType;
  String pwaUrl;
  String tournamentType;
  String geo;
  String maxLevelId;
  bool isPasswordRequired;
  String name;
  String matchStyle;
  String registrationUrl;
  Null gamePkg;
  bool isRegistrationOpen;
  bool isWaitlistEnabled;
  bool incompleteTeamsAllowed;
  bool isAutoResultAllowed;
  int teamSize;
  String status;
  bool isLevelsEnabled;
  bool indexPage;
  String dynamicAppUrl;
  String minLevelId;
  String gameFormat;
  String details;
  String gameIconUrl;
  String regStartDate;
  int winnersCount;
  String coverUrl;
  Null bracketsUrl;
  String tournamentSlug;
  String discordUrl;
  String gameId;
  bool resultSubmissionByAdmin;
  String country;
  String adminUsername;
  String gameName;
  String streamUrl;

  Tournaments(
      {this.isCheckInRequired,
        this.tournamentId,
        this.tournamentEnded,
        this.tournamentEndDate,
        this.areRandomTeamsAllowed,
        this.registeredTeams,
        this.adminLocale,
        this.regEndDate,
        this.startDate,
        this.rules,
        this.maxTeams,
        this.tournamentUrl,
        this.prizes,
        this.matchStyleType,
        this.pwaUrl,
        this.tournamentType,
        this.geo,
        this.maxLevelId,
        this.isPasswordRequired,
        this.name,
        this.matchStyle,
        this.registrationUrl,
        this.gamePkg,
        this.isRegistrationOpen,
        this.isWaitlistEnabled,
        this.incompleteTeamsAllowed,
        this.isAutoResultAllowed,
        this.teamSize,
        this.status,
        this.isLevelsEnabled,
        this.indexPage,
        this.dynamicAppUrl,
        this.minLevelId,
        this.gameFormat,
        this.details,
        this.gameIconUrl,
        this.regStartDate,
        this.winnersCount,
        this.coverUrl,
        this.bracketsUrl,
        this.tournamentSlug,
        this.discordUrl,
        this.gameId,
        this.resultSubmissionByAdmin,
        this.country,
        this.adminUsername,
        this.gameName,
        this.streamUrl});

  Tournaments.fromJson(Map<String, dynamic> json) {
    isCheckInRequired = json['is_check_in_required'];
    tournamentId = json['tournament_id'];
    tournamentEnded = json['tournament_ended'];
    tournamentEndDate = json['tournament_end_date'];
    areRandomTeamsAllowed = json['are_random_teams_allowed'];
    registeredTeams = json['registered_teams'];
    adminLocale = json['admin_locale'];
    regEndDate = json['reg_end_date'];
    startDate = json['start_date'];
    rules = json['rules'];
    maxTeams = json['max_teams'];
    tournamentUrl = json['tournament_url'];
    prizes = json['prizes'];
    matchStyleType = json['match_style_type'];
    pwaUrl = json['pwa_url'];
    tournamentType = json['tournament_type'];
    geo = json['geo'];
    maxLevelId = json['max_level_id'];
    isPasswordRequired = json['is_password_required'];
    name = json['name'];
    matchStyle = json['match_style'];
    registrationUrl = json['registration_url'];
    gamePkg = json['game_pkg'];
    isRegistrationOpen = json['is_registration_open'];
    isWaitlistEnabled = json['is_waitlist_enabled'];
    incompleteTeamsAllowed = json['incomplete_teams_allowed'];
    isAutoResultAllowed = json['is_auto_result_allowed'];
    teamSize = json['team_size'];
    status = json['status'];
    isLevelsEnabled = json['is_levels_enabled'];
    indexPage = json['index_page'];
    dynamicAppUrl = json['dynamic_app_url'];
    minLevelId = json['min_level_id'];
    gameFormat = json['game_format'];
    details = json['details'];
    gameIconUrl = json['game_icon_url'];
    regStartDate = json['reg_start_date'];
    winnersCount = json['winners_count'];
    coverUrl = json['cover_url'];
    bracketsUrl = json['brackets_url'];
    tournamentSlug = json['tournament_slug'];
    discordUrl = json['discord_url'];
    gameId = json['game_id'];
    resultSubmissionByAdmin = json['result_submission_by_admin'];
    country = json['country'];
    adminUsername = json['admin_username'];
    gameName = json['game_name'];
    streamUrl = json['stream_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_check_in_required'] = this.isCheckInRequired;
    data['tournament_id'] = this.tournamentId;
    data['tournament_ended'] = this.tournamentEnded;
    data['tournament_end_date'] = this.tournamentEndDate;
    data['are_random_teams_allowed'] = this.areRandomTeamsAllowed;
    data['registered_teams'] = this.registeredTeams;
    data['admin_locale'] = this.adminLocale;
    data['reg_end_date'] = this.regEndDate;
    data['start_date'] = this.startDate;
    data['rules'] = this.rules;
    data['max_teams'] = this.maxTeams;
    data['tournament_url'] = this.tournamentUrl;
    data['prizes'] = this.prizes;
    data['match_style_type'] = this.matchStyleType;
    data['pwa_url'] = this.pwaUrl;
    data['tournament_type'] = this.tournamentType;
    data['geo'] = this.geo;
    data['max_level_id'] = this.maxLevelId;
    data['is_password_required'] = this.isPasswordRequired;
    data['name'] = this.name;
    data['match_style'] = this.matchStyle;
    data['registration_url'] = this.registrationUrl;
    data['game_pkg'] = this.gamePkg;
    data['is_registration_open'] = this.isRegistrationOpen;
    data['is_waitlist_enabled'] = this.isWaitlistEnabled;
    data['incomplete_teams_allowed'] = this.incompleteTeamsAllowed;
    data['is_auto_result_allowed'] = this.isAutoResultAllowed;
    data['team_size'] = this.teamSize;
    data['status'] = this.status;
    data['is_levels_enabled'] = this.isLevelsEnabled;
    data['index_page'] = this.indexPage;
    data['dynamic_app_url'] = this.dynamicAppUrl;
    data['min_level_id'] = this.minLevelId;
    data['game_format'] = this.gameFormat;
    data['details'] = this.details;
    data['game_icon_url'] = this.gameIconUrl;
    data['reg_start_date'] = this.regStartDate;
    data['winners_count'] = this.winnersCount;
    data['cover_url'] = this.coverUrl;
    data['brackets_url'] = this.bracketsUrl;
    data['tournament_slug'] = this.tournamentSlug;
    data['discord_url'] = this.discordUrl;
    data['game_id'] = this.gameId;
    data['result_submission_by_admin'] = this.resultSubmissionByAdmin;
    data['country'] = this.country;
    data['admin_username'] = this.adminUsername;
    data['game_name'] = this.gameName;
    data['stream_url'] = this.streamUrl;
    return data;
  }
}