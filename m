Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0243242D66
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751233241; cv=none; b=pto1CSvgJA5KF5JuEq4nEJCUWLz88voeAMikaE3W8Yo+kZguxmqDK8Cl9vEhBa7gkReGK9VAdBBUqXDPIjAoF2PlOHLZp2vbYrqijc7gpYP07n5qFfSyBx+8A9+V8Xxec8c8bawWVmZhFcjTT6p4lmnJLeo/iXHUsEjCpgzKEBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751233241; c=relaxed/simple;
	bh=HDrnBzNT9sqw61xhXF1ulsb7GjHFsKMwkldBN6Mty4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FSzSZ3R0jg+AU/xcH3J+OuiVzMfQxJ21ZjJgHc+bn/QHKkHjcLDpQR6nOyzu5BHBhl1pVqa4sy0VbMsxF5Nhpx2UmIcZLLBXD0lR8fhoZ7x/+pbfQciJYhA+mmlxGM5Y3trsTnaaTKiih7kh7p/daFOQsastqOCTKrK/AEZ70yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=hMToEG7w; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="hMToEG7w"
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3B0B33F2AF
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751233238;
	bh=tvyEgsiRIsWy5+9Pkt7fEE3jkj7QgFDygIBIFRyaq88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=hMToEG7wZSyDtS2ZFA79GxiIxD5HFHHjH1c6i5dwIuMebZDBC6C3G+NmjO810AuGV
	 ewVpcxJlzATenGexrJCA5r5mpb6jSca0bjhFnRsAlEhMsIq2GeCBMotMc2e3VRlNON
	 soriHV3kZGT1SAc1NrQz52lho5TlVG4jY69SA9MTcDwWzd9CLI6VbY99O5p2wh/Phw
	 KSXHZNbqeInuS3MYYxpaSYhPwaiyPiMsDcnvzCg5xpUMURRCCQpxIR3MLbmlJI3CC1
	 zUWAOClONvBhmVJkz6V1qc8Y8L6jcgInvpPaDH1xcTjKuO70y1RP2p2KOm1vcrfAAY
	 SH+q80tgloCqg==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ae0de1a6a80so116794766b.1
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751233238; x=1751838038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tvyEgsiRIsWy5+9Pkt7fEE3jkj7QgFDygIBIFRyaq88=;
        b=OlmyPyROkr/7umUuowLjMZF1d8mhBrxYy4RobvMoGPLRRz0FPgS5+LVBdoA23fWa1A
         cjJ5KFHHOEcN7buZELSVMemW0E9F2ORQCMETD73tMAT52fFBeTXJsj2IKc9P1Pmbe9xm
         kDu3Zm7VB8tsMQd0tXA4V/3BuDxjg4Svq78sJAy53wp8qIa24EDHi1pb3hThMN1ZTe26
         BH35KVLZBtzzy2VpIBVjUSkGT+6RlfgsHaheF8ypbMvxjUX+SSv700W7IVi6GayOk4Mv
         LUk1uXbkHyusE4csD1jtL8GkZCK0B/BHi0QoBb4CbqMJiTcMkA0ohYIsceWji+YpjIob
         2GZg==
X-Forwarded-Encrypted: i=1; AJvYcCWL18SufOgdoBjkbt4WH8yEc54Vm+a9ysI+yvkV3i2cRVoHX0LKjuAM3XzjctsQoa903vPUvYtbTkXttLY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb+FclO9cEo6T1/k5xmltKN8PXeSHvSxGd2qTiXpw17+W3JGoG
	rlhtbwm785WnpIdDK/tAJUquRZTeU6hLsCVDqji0LKmTwCUoBMeySxHFQRF243Ff87/746Xpnyb
	FONfHxpqxj/FQzVdQGPrvI9Klltdxi/3iXVGiJirke91tuCMmHDCbavLXVps99pmoVfAEhJmar7
	opyiGeJQ==
X-Gm-Gg: ASbGncsy6D25OYh4NbxC2eBiH8OD1xDULUAL/8j50xfkrqjYK+hUeBQenf3Jw6EDUPo
	7rYUplfBtA6LS6MFtJWyLfmG8qEXwuLUSSHhXfPIfa+kZ33I0HFeM/zoBroWSrhFp3TAGaXA2BU
	HBK+q8gBRTgrvZlp9sIS+jmXubA+Eo6vIGajibcMxctacvxx8ArjWy684plXRvF/enGiIeCLqn0
	I3hA6bh3qgOCx+RmC0X5wohImCaA5OU6VYQXChRkugluh54yXSwdMC59GTnRUEV9KelLhZ/fPRU
	qLFFBbb1d080jcjU+S2hXvDFMh3mVCLGUoYOieHpvvkcUyWxXA==
X-Received: by 2002:a17:907:3d8c:b0:adf:f82f:fe0a with SMTP id a640c23a62f3a-ae34fd729f7mr1138531466b.16.1751233237567;
        Sun, 29 Jun 2025 14:40:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKwXxCz9pE3Brid5b7t2MI0/k++PiuT/Gs+VG0QU8yP+Mj+j5hphzeOjffLrTX6bnFkf0tdA==
X-Received: by 2002:a17:907:3d8c:b0:adf:f82f:fe0a with SMTP id a640c23a62f3a-ae34fd729f7mr1138529166b.16.1751233237127;
        Sun, 29 Jun 2025 14:40:37 -0700 (PDT)
Received: from amikhalitsyn.lan ([178.24.219.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a754sm557263366b.62.2025.06.29.14.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 14:40:36 -0700 (PDT)
From: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
To: kuniyu@amazon.com
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
Subject: [PATCH net-next 5/6] af_unix: enable handing out pidfds for reaped tasks in SCM_PIDFD
Date: Sun, 29 Jun 2025 23:39:57 +0200
Message-ID: <20250629214004.13100-6-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250629214004.13100-1-aleksandr.mikhalitsyn@canonical.com>
References: <20250629214004.13100-1-aleksandr.mikhalitsyn@canonical.com>
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
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Lennart Poettering <mzxreary@0pointer.de>
Cc: Luca Boccassi <bluca@debian.org>
Cc: David Rheinsberg <david@readahead.eu>
Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
---
 include/net/scm.h | 1 +
 net/core/scm.c    | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/net/scm.h b/include/net/scm.h
index d1ae0704f230..1960c2b4f0b1 100644
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
index 0e71d5a249a1..022d5035d146 100644
--- a/net/core/scm.c
+++ b/net/core/scm.c
@@ -464,7 +464,7 @@ static void scm_pidfd_recv(struct msghdr *msg, struct scm_cookie *scm)
 	if (!scm->pid)
 		return;
 
-	pidfd = pidfd_prepare(scm->pid, 0, &pidfd_file);
+	pidfd = pidfd_prepare(scm->pid, PIDFD_STALE, &pidfd_file);
 
 	if (put_cmsg(msg, SOL_SOCKET, SCM_PIDFD, sizeof(int), &pidfd)) {
 		if (pidfd_file) {
-- 
2.43.0

