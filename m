Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6038242D94
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751233518; cv=none; b=lo86wfccdyTBdhotAbP9T+cotLJ2OGkA+EtOaJSUHBAe+nw86+0RTrPTTFBjkHbmU5H4Zri9n4kbpOayfpfMBaG8cwRssS81f5Cmkrw64yUH0PBWc/Khjzkonh4lscAxl9U6mJuMrlPfGY39/rSof0LlWT0gAJenOZl55zwQMPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751233518; c=relaxed/simple;
	bh=UsMulxUXfXc+mVSRj66gJP12dihbtpyStx6D4VTt0YY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ON+LKs/EAS+IShHEU5NvFEf7kBwlxtYL+8SdyPnu7sHglMhDJl9VlIp0qxpNScDRRYOb0Odcu7ULlaBSr95fGC8rep0BRt74gSsmIcgX6n1cP1p7ZB5aGlsmppvs5JozDs9bq63zGSyDYAz4kAlfRdbdp9tgrbTKOziZgyDSatQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=N190CB0n; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="N190CB0n"
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BC6853F657
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751233513;
	bh=gE/SBo0jtAJ3S3J1SQz/ldeuJLsn+kPIOiU+zq4e5hI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=N190CB0nfRPzbgv+WIRaiPeHevDnTbSyb9r14pvd1ynx9GiUuA2/ZTo9/ikhwj+s3
	 DakpzUZKlOfdlAtyMubkFMnNLDbrvDr03v8MNt+z62jxuPlEv1IE6XT9nGhZ4efU4I
	 TpoBokM0E5DMLISfWEMS4Ok2xr38yd3k2zgsChAYCO7U95MZ9PlKeqmytVYeqb5U2t
	 Er+PNhEsC2wIVs+SVdWAM7C+G6iFeTrYOPfIQP37rQd0dfXLbbdT2YI+ZGXeE3W4WD
	 iRxfqsC4g+uWqkgA5MB8lDFgD/3ojD+slvtyjVK1DPGsjX111csAGlEu9Mjx4y/WUm
	 ic9H4YSiktchQ==
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-60724177a1fso3557340a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751233513; x=1751838313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gE/SBo0jtAJ3S3J1SQz/ldeuJLsn+kPIOiU+zq4e5hI=;
        b=v1fCcwQQgTIxU298ZS/6Ub2JkzdPPxqQZ6X8YlYLHnTR0yrKQwhELeMm6ip81biOOT
         qRYhlB/pAfTtewvNMyKlOMcnog1mf1tg7MO2RwJrtehXRckrCK4nIYNBW4CxITp1rsG1
         vQHDkNRER4Fh3of5O+kdvlDH12CApJg2P2KCqt3B/ZUOOJfvvA50ajuh4smKyZr7v+v7
         qSzoShc/RyHNfcGumeHkOX58kwdsaAfVPhUU+cZCcIe22AswiJCEVf7BtAE/Ox/vSyN2
         jU9rEou39mCqPn4Ud19/mncgnpqIynALbdvfnwrziVH9/X/7BWqzJb9Ad6FZevQoW2xm
         3j+w==
X-Forwarded-Encrypted: i=1; AJvYcCXTJ5wjgTs3YMQwWoTQjclLPejDwKtn1nb3DX4phegAjYwa+NAE/aNV47TRY5kQAFVIhOHRYsrouAaSm8U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yycmuwhru4QwL1/SHZio3rEETXNFBS8GoSkolTinLsdjjPXlXUY
	kOF644C6Fmu8npL9oDzEICT4LMwWegt3srVZPWztakuoCGfuSfdkpB89LMuIPt+mpI8Z2ZayuQT
	PNBwXR8Pqs5NLgeVBNTA6INS7fIwQfbX/07WPQ4FVYCOR/vYid1DBaBebMRzUjkpzxJJOtrC/MI
	5aNg6FIA==
X-Gm-Gg: ASbGncvRadEUsarA89JnVEaHl3buy3OG7FPujSEY40lrtRAxtuheHsnvSJJRO34wYsZ
	JTIG73vnLfHJqSbTuLmhAhjFJzMMnyenMMe8hNVcJsNP+fir6IJcG71FNVgKvd3E47oLKMtVAiu
	znKiD5Kpy5VO524iaqNzJXSIQugphXMC+2Xc/5sM18GYCIwr6BYz/ZaLZ/eftOwWnXwD/fHNHD7
	AEKCVi8AsCB/fsF5Q07Sn0xzcbzfR1RvJ46rGN/UjfPCt53qAZu+U2hmGA452VBGCsm+2cnNjLK
	acAapTTqM66NTaU5DdyOn6VAo/ceHobg9QMV8oB3518EUcwgng==
X-Received: by 2002:a05:6402:90a:b0:5fd:c426:9d17 with SMTP id 4fb4d7f45d1cf-60c88e750a8mr9082140a12.34.1751233512828;
        Sun, 29 Jun 2025 14:45:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmhOkFUd0s3cRSSvV50wOIhAEwTNb1KausZupuU/kQ9vYIV4alre59EPicBcrvLzCaJw2cyw==
X-Received: by 2002:a05:6402:90a:b0:5fd:c426:9d17 with SMTP id 4fb4d7f45d1cf-60c88e750a8mr9082128a12.34.1751233512402;
        Sun, 29 Jun 2025 14:45:12 -0700 (PDT)
Received: from amikhalitsyn.lan ([178.24.219.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828e1a96sm4712037a12.19.2025.06.29.14.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 14:45:11 -0700 (PDT)
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
	David Rheinsberg <david@readahead.eu>,
	Kuniyuki Iwashima <kuniyu@amazon.com>
Subject: [RESEND PATCH net-next 5/6] af_unix: enable handing out pidfds for reaped tasks in SCM_PIDFD
Date: Sun, 29 Jun 2025 23:44:42 +0200
Message-ID: <20250629214449.14462-6-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250629214449.14462-1-aleksandr.mikhalitsyn@canonical.com>
References: <20250629214449.14462-1-aleksandr.mikhalitsyn@canonical.com>
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

