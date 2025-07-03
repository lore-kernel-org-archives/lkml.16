Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CFB296153
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751581347; cv=none; b=r1bkDWV8G4qiZuciV6sqMzzHx5uvyHpJsqptxRBfI2jPB32+w7MAf+iUQqDzk1gcbrxPrngUg8F6nfvwNHuml2Ba5nwMzKdXKMvyZwDXC+FbKnlrXGc6LQWYUftIAat0CYGvDsgi91C56ucDGwtWGZVrbgpLavYycrvudJkT6Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751581347; c=relaxed/simple;
	bh=D/PppK0hDftWiCKNXNsgHrcA+jFHhAFOCWiRLOQNwOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bm8raFmzxk+nIxCfmV3gwMkJZEBcD5kA5ddsh5vujBscAJqyYPvQjfAYDDpg7IXLVlGOGrGRGDyr4lJ+IE2sby5Hbu5aPJaZ7Fxdg7xSPIb0RVBLdtG9TDr6z4yg3uOkuhuxXOuUv8di8HQ1rsY81pIBSLaj09wdaNnvnJUtbnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=BQXnpr9j; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="BQXnpr9j"
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AC8953F91C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751581342;
	bh=47Hy/CVM+m+STHABdIjCLud+sfTnWYA0RBiwXCk0B4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=BQXnpr9jReXUVe8WKSeqxwV7Y+J8VaVdNlI31ORekAmStChoIwYHwbKpEdrCxfNOL
	 y5xAGIhPXbuKhbcZR63ZznOfxTGQBmQIVVSogpbr0dECXSdslKELVdiVP9JGkyl7EX
	 HlNCugjw+CH+3YVCRONgNuuVkgxV+jLjOhINmPnkYOg5uq/614EwxenB1V4/axFDJl
	 x82Zrcxou2rDI4C62RuPs+zPmhhIpkgSSMGBVCO0A0ci58lMs6voRc2OClvhTOPSfP
	 +fBh7Mws6hgyAEVobjxlhr0yIIcF/jF7e63FtmvTgTHUD64/nAWkrBjBTUkzYvsKNO
	 tdMmQuMxE8NQw==
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-607206f0d57so253257a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 15:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751581338; x=1752186138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47Hy/CVM+m+STHABdIjCLud+sfTnWYA0RBiwXCk0B4w=;
        b=kbxoKBAA/Kflpdx3xrz6PBTrfdXEhRFJ9FOY0QPpowxH9TdKy8+F4eAXjomvLN5WQm
         llQMT/NSSoy5nkvyW38PonSO1kps0NYNhBKr5bUVIye2UHHeXXRyR/VunDmXgTuJL4Lj
         bRjUvVbb+3c8vgD8QYlXkA/09xbypjDRroySHes5fKYVm1mqN7tAcbezRj+y8tr2CaQO
         p/rukPqNOVP1U2/NoGaJwS3eBV6b1JnLygy22ZK0cBRWuaI2rTxHWmPAcXlsIb5D7nW6
         GC4JdM7X0unPSmdV8XQGKx5qFyJ+CgeRDLWdo1JvtCav7DfBgPe4AWG2n08e2vfA7fl9
         GYkA==
X-Forwarded-Encrypted: i=1; AJvYcCX31KGs+2WKq+Y03A5smQlP/Uq1EAV/TnH5JjOuCNA9mXFSx5W2X/+asnpzbgKlhzTFvygYK5BWg1KiV8c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza3bfdn2cEKcXNsGYTZoi6rE9jpDUPpnNtsYcZ/7bU+TF6bJLb
	cHrzJ7CAunPVYP3oJftn5CxTULZgxquB2LbpBLBJr/1BzGS6MwWxwWGllkA3mV29rVYORDPR9hX
	nLMhLah/ehRzJW48OnD+l8EppYabsuASstunTBvMVafjTI7peFFvu3U21Cg7Ac6zWZV5STTfrlS
	vkYO2O+A==
X-Gm-Gg: ASbGncu21W+Fs04lI6+/Xh8Kmfc9a0fPXtZzTOAEsyn84jqt5qs0fDaubwrXWtwJjC7
	oXueYNN25vYCYUKUxErmgLVf56NMPX5ntPjCbfcq91sovWH7mASgBfQ4HXRQEOPzthNz6m1mgzr
	d3yu6oRgjhcZ0AZ8Ms8bvUkb+wUX+9vvpdzlZqtpAkfw56lerOhpKCfgBdOn7R86MQXSPUA0rlk
	1ZiG6TYvTR9/VzfWg5aeF2XrXUhSgFGQ7mcF6VCs4FVJBzU523vkfq9bBjBCWgubn/i8jeyJ8G7
	pXHuXQVwzYaXSJieEuSw3ah69+JSbofm6QLswxhocJdR/1EW+w==
X-Received: by 2002:a05:6402:51ce:b0:608:66ce:14d1 with SMTP id 4fb4d7f45d1cf-60fd2f85538mr235494a12.6.1751581337636;
        Thu, 03 Jul 2025 15:22:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhQ34cQJM1kgpxELeCyd/hjVgdKzujKM6mLeKa4YjV8RfISmMTTZ4biTzP94cqtbiU+M/JVg==
X-Received: by 2002:a05:6402:51ce:b0:608:66ce:14d1 with SMTP id 4fb4d7f45d1cf-60fd2f85538mr235469a12.6.1751581337198;
        Thu, 03 Jul 2025 15:22:17 -0700 (PDT)
Received: from amikhalitsyn.lan ([178.24.219.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb2f3122sm352189a12.57.2025.07.03.15.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 15:22:16 -0700 (PDT)
From: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
To: kuniyu@google.com
Cc: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Leon Romanovsky <leon@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Lennart Poettering <mzxreary@0pointer.de>,
	Luca Boccassi <bluca@debian.org>,
	David Rheinsberg <david@readahead.eu>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net-next v3 0/7] allow reaped pidfds receive in SCM_PIDFD
Date: Fri,  4 Jul 2025 00:22:00 +0200
Message-ID: <20250703222209.309633-1-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a logical continuation of a story from [1], where Christian
extented SO_PEERPIDFD to allow getting pidfds for a reaped tasks.

Git tree (based on vfs/vfs-6.17.pidfs):
v3: https://github.com/mihalicyn/linux/commits/scm_pidfd_stale.v3
current: https://github.com/mihalicyn/linux/commits/scm_pidfd_stale

Changelog for version 3:
 - rename __scm_replace_pid() to scm_replace_pid() [ as Kuniyuki suggested ]
 - ("af_unix/scm: fix whitespace errors") commit introduced [ as Kuniyuki suggested ]
 - don't stash pidfs dentry for netlink case [ as Kuniyuki suggested ]
 - splited whitespace changes [ as Kuniyuki suggested ]
 - removed unix_set_pid_to_skb() to simplify changes [ as Kuniyuki suggested ]

Changelog for version 2:
 - renamed __skb_set_pid() -> unix_set_pid_to_skb() [ as Kuniyuki suggested ]
 - get rid of extra helper (__scm_set_cred()) I've introduced before [ as Kuniyuki suggested ]
 - s/__inline__/inline/ for functions I touched [ as Kuniyuki suggested ]
 - get rid of chunk in unix_destruct_scm() with NULLifying UNIXCB(skb).pid [ as Kuniyuki suggested ]
 - added proper error handling in scm_send() for scm_set_cred() return value [ found by me during rework ]
 - don't do get_pid() in __scm_replace_pid() [ as Kuniyuki suggested ]
 - move __scm_replace_pid() from scm.h to scm.c [ as Kuniyuki suggested ]
 - fixed kdoc for unix_maybe_add_creds() [ thanks to Kuniyuki's review ]
 - added RWB tags from Christian and Kuniyuki

Links to previous versions:
v2: https://lore.kernel.org/netdev/20250701083922.97928-1-aleksandr.mikhalitsyn@canonical.com
tree: https://github.com/mihalicyn/linux/commits/scm_pidfd_stale.v2
v1: https://lore.kernel.org/netdev/20250629214449.14462-1-aleksandr.mikhalitsyn@canonical.com
tree: https://github.com/mihalicyn/linux/commits/scm_pidfd_stale.v1

/!\ Notice
Series based on https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/log/?h=vfs-6.17.pidfs
It does not use pidfs_get_pid()/pidfs_put_pid() API as these were removed in a scope of [2].
I've checked that net-next branch currently (still) has these obsolete functions, but it
will eventually include changes from [2], so it's not a big problem.

Link: https://lore.kernel.org/all/20250425-work-pidfs-net-v2-0-450a19461e75@kernel.org/ [1]
Link: https://lore.kernel.org/all/20250618-work-pidfs-persistent-v2-0-98f3456fd552@kernel.org/ [2]

Cc: linux-kernel@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Lennart Poettering <mzxreary@0pointer.de>
Cc: Luca Boccassi <bluca@debian.org>
Cc: David Rheinsberg <david@readahead.eu>

Alexander Mikhalitsyn (7):
  af_unix: rework unix_maybe_add_creds() to allow sleep
  af_unix: introduce unix_skb_to_scm helper
  af_unix: introduce and use scm_replace_pid() helper
  af_unix/scm: fix whitespace errors
  af_unix: stash pidfs dentry when needed
  af_unix: enable handing out pidfds for reaped tasks in SCM_PIDFD
  selftests: net: extend SCM_PIDFD test to cover stale pidfds

 include/net/scm.h                             |   4 +-
 net/core/scm.c                                |  32 ++-
 net/unix/af_unix.c                            |  57 +++--
 .../testing/selftests/net/af_unix/scm_pidfd.c | 217 ++++++++++++++----
 4 files changed, 247 insertions(+), 63 deletions(-)

-- 
2.43.0

