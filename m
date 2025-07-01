Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC9126B744
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359299; cv=none; b=P/IPr/Hm19rVJxii7WX7ucwzt12j6fRVIPSpAuLcTR7dbTHr+wR5pLKUlL37CY6PRAZZRKVwvi1wdE5XXlf6prAUNTX/I1IpzoCYyzY2P/1gXu5+SbF+izHd3z5H3f5t0JHEvN+Dfh9FhA7oj7EJQoomB105XvScV+iUzN+A0IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359299; c=relaxed/simple;
	bh=1nHyGmrpv5FF3xysV/SpLweCV2NUJ2mNgDUauaWEkfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZJSIauHD188cSNmW0gZQeDt7QOd2yNu6sCXTUZZ5coNt6BQnEGHsKAwGMe0vdOWPykBW5jhGllfSsSXkmNdSExC4NzRnmg3JGb4upKLw4x5RuQYpIgDDtThGY/CITig25/dYzXVpm/pWORRIGJS6cJYGr8IA1L+cHOMmJyys5w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=pzZ8SLb2; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="pzZ8SLb2"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B01753F18C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751359293;
	bh=Z9pX1VfTmwVxaOGXavGK5NoBC/cEjdayNk20LrQfJuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=pzZ8SLb24Q9tdEBgAJ8EbeKQeakKTVhwhJnbkSc3azIdI9YuAaOgrgjnjj3sKBhRH
	 0XQXg57tpQ3PCohEV0KOAu7ajPJKxadMC4H6dHt/lujqoygbAa9YxWnvZ+3nfy9ht4
	 ke9+RUPS3EfCP5gCt6lxVqwl+vMS+ezh6KpnxGgPG1dq4EuZpv5tudA1T2NH/Ae+0S
	 guZEo7xS9+3FfPIn3SwkOXX/7UQaiBffEi8IiQR8knKqFsMFggj7CswjgSZnRDbrvs
	 Qk8mQrPJPAOrS3C13M+pZNjz3s0uVuF9/2JS+x7wvDxRHQusxgJgL27kMAh+ZtlZ22
	 KHyr1Wu+yxDKg==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ad56a52edc5so466398766b.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 01:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751359293; x=1751964093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9pX1VfTmwVxaOGXavGK5NoBC/cEjdayNk20LrQfJuk=;
        b=OqjitDM98Z2HFwe0lU2B0OTXg4BnuBqqnLGSkJb9+gM9MkVQrZmoY9FJZDazPIdWwF
         Wn+cEfEGbQs/fUPvEWeQgcX426MGF+BhZI8oguwRltLCHPhbcUdjqk531EWduoL5B26q
         T/4qbTS5yzvd75g+wcfQKtW8xQVQX4+7+HDsQOQkt/XvbEHiz03Gs1SaodLo+liKltr0
         gzySu+qb2V8qS4GIL5WPx8lM2wLSXFnfC/swvAaD+jbsgYT/Bbyh4UJaK1PFaiNKxt1k
         fg/vRcYdcufnztvwfNTy2m/b5AAEccUfDY+LNeK79UtjO/XPY/AQhkU3/RUsgHc+pXub
         HStg==
X-Forwarded-Encrypted: i=1; AJvYcCVHQdFpsyKjQD8us2eQ7itcqzcnTNLzWXJX11sieKMnGV24xeXMaqejRTqf65xIYPb1FZVmUIEN7584ucw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6+r0zDn9KdgBosjJp5/qqBbJxuPGCWwyU4RKBarreB4LuM5sB
	s8FobbzgAx2+/Llfe5OKZ+zrZpuQJptnocj8+FkAFc889y1yQpb9BJhO7dxwoYWwTbsy22I4r9A
	patRfpDVJ+ziZHGW3RwWjHPpqp1GnwTe++dzCIW3Qo+EoTd3PyKCNCFHd6e6tj/sJXnv5yM2/cK
	TkIDnNxQ==
X-Gm-Gg: ASbGncvpaLngqJ8lZ/SU1cF4IsxSY6ApAAqOxQX4raXSEH0TL7JJEeN61DX2MbSSeVE
	ljgAOAS+8Zntl+kv80JZMHYZme4dYg+/nRio3sazXyFOYGmENkEAw6hq3LGYLLZIgUzm9rkZPm1
	d/MNXPQETEae4df5ZQqToU6uhVeI1VPPukl14n7xL2Yj5jr90y/rhbQD/Z+njuEDrHl0pFqiwql
	GmNHZsKvB6rN5ArumPMkImfHNS9GysKUIZLXRkvmya5sxw3bEVrFoJ4M4vE79+ie97lQx9iMCnY
	ioZ27VSqsYXMUr7KC1vYxfs27ez0OhPB7MdsCoOl25tiWlwsPg==
X-Received: by 2002:a17:906:6a13:b0:ae0:de4a:3153 with SMTP id a640c23a62f3a-ae3501097c6mr1607050766b.38.1751359293118;
        Tue, 01 Jul 2025 01:41:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHYz6ade5ZUSuNmyvh/iYMmaOMtSfZC8fihJvxErHxG7jEJstf0bxN2jhvBPbeKySrJFBTJA==
X-Received: by 2002:a17:906:6a13:b0:ae0:de4a:3153 with SMTP id a640c23a62f3a-ae3501097c6mr1607047266b.38.1751359292577;
        Tue, 01 Jul 2025 01:41:32 -0700 (PDT)
Received: from amikhalitsyn.lan ([178.24.219.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm812427166b.28.2025.07.01.01.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 01:41:32 -0700 (PDT)
From: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
To: kuniyu@google.com
Cc: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Leon Romanovsky <leon@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Lennart Poettering <mzxreary@0pointer.de>,
	Luca Boccassi <bluca@debian.org>,
	David Rheinsberg <david@readahead.eu>
Subject: [PATCH net-next v2 5/6] af_unix: enable handing out pidfds for reaped tasks in SCM_PIDFD
Date: Tue,  1 Jul 2025 10:39:19 +0200
Message-ID: <20250701083922.97928-11-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701083922.97928-1-aleksandr.mikhalitsyn@canonical.com>
References: <20250701083922.97928-1-aleksandr.mikhalitsyn@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now everything is ready to pass PIDFD_STALE to pidfd_prepare().
This will allow opening pidfd for reaped tasks.

Cc: linux-kernel@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>
Cc: Willem de Bruijn <willemb@google.com>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Lennart Poettering <mzxreary@0pointer.de>
Cc: Luca Boccassi <bluca@debian.org>
Cc: David Rheinsberg <david@readahead.eu>
Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Reviewed-by: Christian Brauner <brauner@kernel.org>
---
 include/net/scm.h | 1 +
 net/core/scm.c    | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/net/scm.h b/include/net/scm.h
index 597a40779269..288b4861cc68 100644
--- a/include/net/scm.h
+++ b/include/net/scm.h
@@ -8,6 +8,7 @@
 #include <linux/file.h>
 #include <linux/security.h>
 #include <linux/pid.h>
+#include <uapi/linux/pidfd.h>
 #include <linux/pidfs.h>
 #include <linux/nsproxy.h>
 #include <linux/sched/signal.h>
diff --git a/net/core/scm.c b/net/core/scm.c
index 50dfec6f8a2b..69e7e0f6390e 100644
--- a/net/core/scm.c
+++ b/net/core/scm.c
@@ -481,7 +481,7 @@ static void scm_pidfd_recv(struct msghdr *msg, struct scm_cookie *scm)
 	if (!scm->pid)
 		return;
 
-	pidfd = pidfd_prepare(scm->pid, 0, &pidfd_file);
+	pidfd = pidfd_prepare(scm->pid, PIDFD_STALE, &pidfd_file);
 
 	if (put_cmsg(msg, SOL_SOCKET, SCM_PIDFD, sizeof(int), &pidfd)) {
 		if (pidfd_file) {
-- 
2.43.0

