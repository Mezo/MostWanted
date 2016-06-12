CREATE TABLE `bounties` (
  `uid` varchar(64) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `bounty` text NOT NULL,
  `bountyLock` int(1) NOT NULL DEFAULT '0',
  `bountyContract` text NOT NULL,
  `bountyContractCompleted` text NOT NULL,
  `friends` text NOT NULL,
  `friend_last_reset_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_immunity_applied_at` datetime NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
