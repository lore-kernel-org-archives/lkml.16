Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A27C26A087
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359182; cv=none; b=T8271tB6xtv6UkPiYqEiSLKaTuUjJIaJKn/xMylUvyLGvumKeWDScVbrzMSDyIoJqBwBw+NLvZDG+EKoYpj4aCToF5ubY1jn9snWt78awNieFlxCDmoSzHHLNFKOHiDHtjqBcAiIlTz9mYiPLGMcPs6ARlWsKTZ9BP324tI9Ofs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359182; c=relaxed/simple;
	bh=dNFssYStWjlkvyhvt83/IFm0+gTNQR2fGINvxCNov/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uhIK6QBZb/c4zkrXk+oSFlAoO9dikdiPu4PIDneJmmm/qJynpnOr1HMhPFAtoBRAldkovt8nEN/xvgfuPQoQ5LxNdhSnM8Uwqicn6/6ty4au35ecJsGr4oNKVx8edkNQtcNST1nJe7Jm6nLVnoWKDREnmSOFo//KfFY2ytpkP78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Ckt+g1s9; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Ckt+g1s9"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E002E3F71D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751359178;
	bh=4yp1+vuew+zECrTXb7RcSP/djBI2o2M9gov6DQJnyao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=Ckt+g1s97M2NpPHPActBKVnDMPJJ6wsekaY+LmY14i6rx37PH/84lZh4WjYp47dof
	 V4S5WdnD0UqDI/QvJ2wFdlIroAgLljK59Bt6NX8jyauTvvr4lbggGEAYj5mruSj5Hf
	 dGi0KNH7j7vzyIDAtanUEVAdApgGlyNTDrCrlxLxB3Y5u5tYNC8O148yF0z9byI9Yt
	 quuyXjD+dS0g7k1/kI6txssaLfAEqmbanXIT95jUOOFlfDmxevV7f62jYs+U6O8Mdf
	 UX08cJ4aX300fWGimVELJgOrH6sn4thsEWonpXiYRuwC+rT+lxglWWnofMHHf3zu2T
	 BYFePOs0N1ZPw==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ae0c11adcd2so217200766b.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 01:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751359177; x=1751963977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4yp1+vuew+zECrTXb7RcSP/djBI2o2M9gov6DQJnyao=;
        b=NsDLgVZLGywJZrs8Leq0DrvJ2tPLGYq3/Eygk8DLQIVky/E3ToMb3QhHoPLeiP0sul
         K6bzNSDRq5oqltaShShEr85t8Gf0/QwZeIHhjnIxdaMosvy5h794FZvgUAa1F3h6khnP
         Qq/adGbyLXbRYzCPbrGQW++ZbW5lVEUL+WJLomo7go8a9FUV4lN8Zba8gAmPIYIHDSUJ
         chFjqMhM0qonsTbS7KB1nm9C2Y0ItpEYiTQzchSiBiYXrZTf+vY0sDXd813oQxyRI915
         fzBZtHy0+PL/hLZAhg56TeQ1mVEIR80wytXBSbWO8r3347U8Hy9HkWq0mD/qY8QuG6+3
         wyKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwOtcuz3TWm/MvJNo71IxD5jv3rceZIHoEVPRZXXs+Uv/WdqzhEmUwcO/+1xv5dniff3NiMW4h3BCp/30=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3V+YAR9qf+QS85tccsFs3rjj5atthV7c3m9c3pJY5m921iBrg
	8s2lUGRobb8VcCuW68Biy7JBLvNb+Q39UbZcSNp3KkK3ZPDwhechFp80Avej4hcBOvyDClfyDKo
	a9QxMfnCupUA8TVdSZDcuQaAbrM6zLnz0j2o+kuPUVhQiEFtwY/hNA4NwgqgwtPW+xD2qOu78rb
	E4arwjpw==
X-Gm-Gg: ASbGncsY3pKO0O5NFWENXCwWgutoZFj1tmoKGPBslyPlpCMhWjY6BFcWh63fu1CrMeu
	Qvt4vpXVgLNzfo4Su5TF3XbQQJu9F+2obLf7BjBxfgzfbnI/V8v0WNg5/E8PkpkJevK3ouxjUU4
	BPLyWQ3rcQCMsg6O3FcdV5sUl4FIyqGFI4ulT9L2qlSFJGF4wCWBhHcrcf6erwB7y6RoH/WVZDg
	ccReyVJoGQHvP6zthjQUXifT6BKzoeftl9B0O9XHU6Bizrb7kkuVxUNtocLbMiFLTfeWIMLlJ7u
	cLrAgjAvHiLOCLTwFEWE5BgO26Zu7POwOsiuuwOm0uR4CU0zsw==
X-Received: by 2002:a17:907:1c1d:b0:ae0:c803:c96 with SMTP id a640c23a62f3a-ae34fddefb3mr1615648366b.24.1751359176481;
        Tue, 01 Jul 2025 01:39:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNYW89qpdmfY3sZqsrYphW2DREJSdqhOYO6cQ7meUyqCU15mTrlKFcHLmzEEQga566TkO9uw==
X-Received: by 2002:a17:907:1c1d:b0:ae0:c803:c96 with SMTP id a640c23a62f3a-ae34fddefb3mr1615645566b.24.1751359176025;
        Tue, 01 Jul 2025 01:39:36 -0700 (PDT)
Received: from amikhalitsyn.lan ([178.24.219.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm812427166b.28.2025.07.01.01.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 01:39:35 -0700 (PDT)
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
Subject: [PATCH net-next v2 0/6] allow reaped pidfds receive in SCM_PIDFD
Date: Tue,  1 Jul 2025 10:39:09 +0200
Message-ID: <20250701083922.97928-1-aleksandr.mikhalitsyn@canonical.com>
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
v2: https://github.com/mihalicyn/linux/commits/scm_pidfd_stale.v2
current: https://github.com/mihalicyn/linux/commits/scm_pidfd_stale

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

Alexander Mikhalitsyn (6):
  af_unix: rework unix_maybe_add_creds() to allow sleep
  af_unix: introduce unix_skb_to_scm helper
  af_unix: introduce and use __scm_replace_pid() helper
  af_unix: stash pidfs dentry when needed
  af_unix: enable handing out pidfds for reaped tasks in SCM_PIDFD
  selftests: net: extend SCM_PIDFD test to cover stale pidfds

 include/net/scm.h                             |  33 ++-
 net/core/scm.c                                |  30 ++-
 net/unix/af_unix.c                            |  75 ++++--
 .../testing/selftests/net/af_unix/scm_pidfd.c | 217 ++++++++++++++----
 4 files changed, 285 insertions(+), 70 deletions(-)

-- 
2.43.0

