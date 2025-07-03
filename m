Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8FF2882C5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751581410; cv=none; b=H4Kf0lBh+KDN5P/8IxjI5/drMZFDHG5bmmja6ytzqaEYmyrX+GIXRKK97gdKWIHmUQgpc3xuJX9pyRI6lj19Uj502JqViojGem4RO2E0l0Xb8TSdpJyskQH6hdqi8U2U2mBfd6BhAwLvT3rkNi9rDmyQmOCTy/dKhpPGtsUHdvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751581410; c=relaxed/simple;
	bh=D/PppK0hDftWiCKNXNsgHrcA+jFHhAFOCWiRLOQNwOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VmdArHz3tjdIDUXSt3WC9iDX43IRvh8gksR4Jk38d12W21nH3ww/tM/V+F92gDD2N0h69SC+QJ+uGg4BPlaYxtgLLfVTkG+nrd8z7+dNseVjAc9ADl4+BaEVEeWyqnBFao/wK67J5tY8QAt9OfAOYUe0iepTZQFMtLkD65Y9mnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Zzeosc0I; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Zzeosc0I"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C41613F691
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751581406;
	bh=47Hy/CVM+m+STHABdIjCLud+sfTnWYA0RBiwXCk0B4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=Zzeosc0IE311/XHsADk/4j99tqsq14D2+mJkIYxXIWY/u2H4wdeqKv9FHedvrjS1N
	 UyhyDZ7+zr5d6u5AEbndWTaKtZBuVPS/IVRhnddjYsQd/aKhBvS2tYDw9T5yOLWX3o
	 f/LIR98MA9iYW3I9+Fn81lfjm6cCz25uoIl8EcUHrYvoeITsEfounJo14fS48SIwKj
	 AgmXFVhygutkacK+qkcAUmuInZSUAmx/3Aha7KE0mkkRcfmlEgT+93mf66+8IBzF5/
	 OQTXCKkOV60J5xMgTZGhJrIciCuzsBjrLR/6veSnZp2cpAVc0PBPwt594ooff/sM1L
	 lHdu5KRrSVbvg==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ae0d798398bso21642266b.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 15:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751581406; x=1752186206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47Hy/CVM+m+STHABdIjCLud+sfTnWYA0RBiwXCk0B4w=;
        b=ciSoohYRsP8rDVSyMfSHAJnWq87oTQVt3/kBFtS0EprR3ppau3ogDlcsmimvNuODwF
         C7ikQCxdk6iRHCOh8tzn0IFDgz/NTNsQHtX5ZphKjz4Kt46PJiUVL+jWWG2TwvLpOQsY
         Vgb4hig0SBC30cv11OutXTR8itxI/Ctn+6dBTC0FgEcafLpcnTIayv1kGseXkVNkTaef
         0A+E+RsG1x0M1J3jYevMi45b3N5fv3Tg6ZWRQ5G+I+6czLh+qLxRPJZB1OK/hyZ9uyyX
         RuhOm2TmDygScTN/g24US2B9cCBRVd16o4u09o5rHFTt2mF4Vubj2PDQQmT6HVx6nd1f
         /g7A==
X-Forwarded-Encrypted: i=1; AJvYcCV4K7AXj8VIsyn5+Q+MrWtZwsslSe/KFb0p2icPhVXEaSpgWeaTMcrS06VPp4U3I9CcazEy1RRMZTv12xA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIWuhq4rviPG8nFfsZ1JWmTBLdZBM+r5kE8OXAlGPkSpSrhXvf
	QkhaRJxgpVNA3vXhregxdNpN3WeWkAMUhuKE8rxc3ZsNpXx+C4v2aTnWjqZrT+BjxVifrO5pHSQ
	q69JuA058W0wz7YWXLArT6rtSiNCqEoU7JoaDTW5CSZpsJ4nFqhpsEmLzHABRh/IZmD8Hp/ptip
	16Jh4ZxQ==
X-Gm-Gg: ASbGncvbqL8tR08CG+49Wv4hfc1FVDjiCmb06IojG/HqiCVEvQ+LX/1+P+WQ5DUwpNe
	rO1EgBiCUOljFFRBV8B1z8NN96GkGs8t1nfF7orGa6QOuFw7yszkQGRfIxw0mu+p8eKdvPhJuA9
	DxdgOgeSTJTHYV1dszr7h/voER2Izr8vOX0fXa63Fi+uoWLGxzjWJe+hRFJFHcoOv8CtdBeQbGX
	sOyVZKv5ybeSpMBnQJFazgPg08hhGOJiFh14fPK9sOJJ2qLb5aE4daYAELI4eiX+f3rO/9gL+AF
	3hCa7Xp3yygAkoHpu3OG7BvoMST1FEQ+viARz8vzzH3a8i40zw==
X-Received: by 2002:a17:907:9494:b0:ae0:c976:cc84 with SMTP id a640c23a62f3a-ae3fbca004dmr20075866b.24.1751581405829;
        Thu, 03 Jul 2025 15:23:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFikEpOsYGxSn0v73olb5O1tkvWNghVZKaq0AyowZz/zD/9S5S+ZxPRb0YNqMVPRMsgi4zVAA==
X-Received: by 2002:a17:907:9494:b0:ae0:c976:cc84 with SMTP id a640c23a62f3a-ae3fbca004dmr20072866b.24.1751581405289;
        Thu, 03 Jul 2025 15:23:25 -0700 (PDT)
Received: from amikhalitsyn.lan ([178.24.219.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb1fb083sm355164a12.62.2025.07.03.15.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 15:23:24 -0700 (PDT)
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
	Simon Horman <horms@kernel.org>
Subject: [PATCH net-next v3 0/7] allow reaped pidfds receive in SCM_PIDFD
Date: Fri,  4 Jul 2025 00:23:04 +0200
Message-ID: <20250703222314.309967-1-aleksandr.mikhalitsyn@canonical.com>
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

