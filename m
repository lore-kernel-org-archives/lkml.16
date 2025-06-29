Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C2329B0
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751233500; cv=none; b=lH42v+uxwLv6ywWeADZ82OB0YGUblJFku9VJC2/mKy3bnjd+DOwc/HYFhJInZvqmDZ5L6Hu/pVluR5ThFDiijLEln3hgtRe2lPlsc4Ss8Yo8JlLZ+r/sqXpwdjrG2QdSBwzYjM8RjhSD0uT+fEYbQtxddBeJef2yF9daUat5eJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751233500; c=relaxed/simple;
	bh=SHlCEPtJ+mGpBteebs/QxPWTja798xKUaQPyeGXszDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nsNyHKUNdnxwFB1xlZvqV7jPJvI+zBWnRKb2ekRTqdaXq2ZIBX61Z6r/zxvb0Gr612nKlK25d1a1oHA7SeNVNobZskld7LYer/6pcuc8AzSxI319Lsd4cJ9W4E2KihCWPXMAjB/uL3MByZpGu58fVhEiVkyRUu2Sg8IZgHRhUKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=vIo9qEYP; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="vIo9qEYP"
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 34DA43F2AF
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751233497;
	bh=LxBoabtf7quwflXNyrjXQFRsM9Lks4N1hnfCJHIwSNw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=vIo9qEYPM0tbG4EU9SyTbuujaQzuFJ16HoQcr6foQ92AeQaUn2H311KyBWutglwHI
	 PH6VU+Hub8NwhSmhlYbLDM7WRSk/DiJCnZUGfxKG+yXwLJgiNq0OcVktEiLAkNrA8f
	 dgG53NHnoMEhOoB389ctYFaxzGUZeGHz7bsp1Dsmvzb2uuVh6F2jtGHIvrMLS17TeD
	 FowIYicT6hyYeihtaPGzVd3KJhwE9PfA7W2wXhRKeTrH4RRH0X0iKH+nWOVdo72Lt6
	 PP+18BXmPUbZ1FoQrBf95RSemJZS7ltOUn4pC0kdqlsBaOIpQ4zgu9HTy3yoCQBDa1
	 /6SxzR6XD3Big==
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6097b0f5aceso1448443a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751233497; x=1751838297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LxBoabtf7quwflXNyrjXQFRsM9Lks4N1hnfCJHIwSNw=;
        b=GVtT0iME9D75p4dTPCjeNAMfWNToGV9L7xXNAN83nK/ULuCcrVORYG/lIq8prg20z5
         UftvLKko85fBBomPsKumE6V9z0Bo82Qmo2PX0SpcqNFJo9Bt0CCu3jMinexltJvG114s
         V3C67bIAl8N3SbQ0H0CfD7u2IPfs4iZYpuCoOYH/KA1Ln26wEpA9YXlGwhldkg/ihfdP
         nZWy81PDr5mcerZaa8zQ6Cp5cV53BLnW1UbObZiyD9EBdU7dcUIGgnpzDOqMbBbwK6tX
         4j4ncUw+zrEH3d7UuTII+9g6lhwkcCUEPWfKWkc7gHEW3+dsljq3AMp+a/p+BNRf3xua
         cesQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxJcz2WxJNfIXlWeoQW3IIC8UXz1DZ91Bwwh9q1Q2q6t/u6G6r63lfaqilnc3nzDhHJDQ8kKqFEDURlT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwSBD3M2F6NXpAi5fHInF7BeM322IJbQozm9AzEqRCaPNfSo00
	3e4aLceuWJv7OVmh42wzGDI7MWe+3Ke4RlSOdPmLDcA2lQp0x5gwbi/4etkdIwCt1RCaDcxjbMc
	FA8JyNRdR8JFdcr5AzQ9tqGm256Bmu/RSQWFM5OjwgE70IjZ6p2p+qZLBylbVqQYwj1irOpgA58
	I+70CNyQ==
X-Gm-Gg: ASbGncsVQumtALcKhjx+GeA+8ivKWsx/5bTDi5l6U3ZeB8Jtj/rKnXakxu8xCRcYPut
	VOWNR8PtB6ZHcAQ9oZEsUJjUP+f7OFCKiijXyW/wjkFAHRjygOvwzwYAZhyfP+kCDfu8/yIiOpj
	70K1upepXAmYg/lIgMWXTdZRk/unM6rgdFVlKjTipNIB3lgz8OodsaXQRPvQZlyzKD+nh41KfAR
	fKKXmbvBzq531N0jPRzd6wz+iMfpg4VMWmH30XxSTNE/KLb6ExAFjJ4aP7+eUyrkHC21USx2eKb
	Hg1T146E6Qz1GdgBPeLn4LnwyJ/XHfk6UvgytjxlcVHuI/MI+Q==
X-Received: by 2002:a05:6402:518c:b0:602:a0:1f3a with SMTP id 4fb4d7f45d1cf-60c88d5100fmr9545273a12.13.1751233496777;
        Sun, 29 Jun 2025 14:44:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3Ta19pv6AlU6JZPOMN54E0R1qHJzn/YSHm8EEl7rjRn41u1/8mTDp0f5nsGYygF2IYKDUaA==
X-Received: by 2002:a05:6402:518c:b0:602:a0:1f3a with SMTP id 4fb4d7f45d1cf-60c88d5100fmr9545262a12.13.1751233496419;
        Sun, 29 Jun 2025 14:44:56 -0700 (PDT)
Received: from amikhalitsyn.lan ([178.24.219.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828e1a96sm4712037a12.19.2025.06.29.14.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 14:44:55 -0700 (PDT)
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
Subject: [RESEND PATCH net-next 0/6] allow reaped pidfds receive in SCM_PIDFD
Date: Sun, 29 Jun 2025 23:44:37 +0200
Message-ID: <20250629214449.14462-1-aleksandr.mikhalitsyn@canonical.com>
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

Git tree:
https://github.com/mihalicyn/linux/commits/scm_pidfd_stale

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

 include/net/scm.h                             |  46 +++-
 net/core/scm.c                                |  13 +-
 net/unix/af_unix.c                            |  76 ++++--
 .../testing/selftests/net/af_unix/scm_pidfd.c | 217 ++++++++++++++----
 4 files changed, 285 insertions(+), 67 deletions(-)

-- 
2.43.0

