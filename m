Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7212BFC80
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751581424; cv=none; b=GGcXyVpRWQCiPTjv/bXWZP2D7X0FrRHrLCIrMbs0nua1KhehmNLw5p4qXk08dhS6vV7GOtEsHH9GKv3mMsmbrCgI/Gx1tncuOtBmm+B+qrdS2RXtp1fKUq+wB5TtJk7tHCrinI6SHj5qm6xRWB7hFZ153wW0A/OORiJGYS3f3u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751581424; c=relaxed/simple;
	bh=q9/jOSjyT1JUfp0m+BaSbGkJjs337jxDbjZaMjfYv1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZKxDZTSxa1B+ZnSo4XOEiGyiBbF2lbmJxXVwF9GUxUDN2uO3NIqZlstlz1HSgp1VIQ68kKyeBbXauplV/uu+MzQ+US3viXJmZ4jjVi4FdJ+c0eUhov6+3LIx8inbY5gfcQxWnxGqrr2TPq1jhvfokWlqpR5iclvFycJVemSIUy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=XMXjfvPj; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="XMXjfvPj"
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7C2763F691
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751581420;
	bh=UkV0lOybHc8xNe3mREp2vR+oZ1mEEwdktMK0oaj57as=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=XMXjfvPjObmS9WqpMs/gKoccr1Xa8wQ2OiNkDLjBcot4JgKlpmocFuyNveaSfdZIX
	 wSyiIIaxI28ELKiJ1JT2oFw49cSY5YvPm+deK/DbcC7pj97jGUQk8p762f1UMQ1+z3
	 cQ8z3svjdHivMdkP7OnbmVfRxWYW4hJ6z8vn6Ihj2lLJmEIE5S7w+FsEMDd2Z/xIJ7
	 6xyrQm69q2SAHMMTme9hWDl3WPnh473GZIzbf7un+JLyDgee5l94sltYnL59rYOJcR
	 +C1MzMqVYiVTcmKQ4HEXKJY0c544zJiwhfpkfPmAvu2cpWliqvMnn6ycCqk278a3em
	 Nt6IFgVgWWfAQ==
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-60c5ed14785so222637a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 15:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751581420; x=1752186220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UkV0lOybHc8xNe3mREp2vR+oZ1mEEwdktMK0oaj57as=;
        b=fRGkxFCMEpFI8cHZw+JjxGpUU7ZZ1ZEbDoh8qusdzZb2pnR+xrSbkRwJZQFbsMbR/B
         9d3c8ueyBJtZB9hLtW6791StwX52SnD49W8U/x3f+Ep7mhnnb1mRdNZy9hsBOCqHBU9H
         sorgIw6V2OhfhruYxxx3PLAbklZE8SM9V1rukvhHOZCYB3IuzlU0abpITpCHhadCfetA
         3TRg7e7MQ6YzVcHGIsJBXKgES9vr5AtyF88wZ4Qsklo4hs5+GVNdtXYzfDLGjY+oRsQg
         6X8c373iUYRgchOV0xxbBrRBnpHOSHqB6TxAc9P7r5fvvKvI++tYEGafsZGLxqj0K4Hc
         qArg==
X-Forwarded-Encrypted: i=1; AJvYcCVdfJpe1ZVavO/aQwhojXKJJorZYHEF1GglfKXx/ABW61P+aAZDSvsDocN1rN1YDHCvpO7dZee1V3HbSP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGEWeUwq7RGdivLtK/hNBtKnsK4pL2S8NjlezsxtKBvCNyrU+T
	Mvy9VgRV+3eC6d9RjcSBmZNejgg8WDP+2zLqj8/S4t3g2yC5bANCZlCT+H4kjg0hDFGbyCrP8fp
	LYG8zql4mt2jAALLeWyHf2CfAXbdz4HqMDJGHmwCjLybQYU9LjPPV0MPikhBS5rJjrUdeQW8USI
	l3CYCZTg==
X-Gm-Gg: ASbGncvmy5kaCzzuI5O85da0YtbVnztlfTH5NSWaVOwz10vvci+bmUtW4LbBaVw/H4P
	pKKNLBqDJHPM310PjtI4FzEBQpKDhOeAlPI8rvJAyv1nzmm/4m6HZu9INpqDziNguKn2P3gNCXI
	61CAWQV4/rdTrJ3X2NoE2xdEnYqh/ZoLvsgNqwcPB3FdBUWLIVWUSr0OK0T26kZP6Le3fz25k55
	Ip4aFX56USO88Cgj7QijYU0JnGS8KWrzT+nMIOVTHW0naYRhbGk+oT3KtaNHhgrs7+I4aRDvAJf
	MSqa7weHIDwOYBruEsidKtnoQ2JwG74CU6ZEmG/QLzTyhqdVKg==
X-Received: by 2002:a05:6402:270a:b0:60c:3a86:e117 with SMTP id 4fb4d7f45d1cf-60fd34c4066mr240798a12.34.1751581419860;
        Thu, 03 Jul 2025 15:23:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsVWIT2hLZf7Rsbl4BgW3Ot5vlMbIfx1ED7FUqAWluoYqZrsysedET7VaeNcuYTKnjvoKrHg==
X-Received: by 2002:a05:6402:270a:b0:60c:3a86:e117 with SMTP id 4fb4d7f45d1cf-60fd34c4066mr240774a12.34.1751581419477;
        Thu, 03 Jul 2025 15:23:39 -0700 (PDT)
Received: from amikhalitsyn.lan ([178.24.219.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb1fb083sm355164a12.62.2025.07.03.15.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 15:23:39 -0700 (PDT)
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
Subject: [PATCH net-next v3 3/7] af_unix: introduce and use scm_replace_pid() helper
Date: Fri,  4 Jul 2025 00:23:07 +0200
Message-ID: <20250703222314.309967-4-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703222314.309967-1-aleksandr.mikhalitsyn@canonical.com>
References: <20250703222314.309967-1-aleksandr.mikhalitsyn@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Existing logic in __scm_send() related to filling an struct scm_cookie
with a proper struct pid reference is already pretty tricky. Let's
simplify it a bit by introducing a new helper. This helper will be
extended in one of the next patches.

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
v2:
	- don't do get_pid() in __scm_replace_pid() [ as Kuniyuki suggested ]
	- move __scm_replace_pid() from scm.h to scm.c [ as Kuniyuki suggested ]
v3:
	- rename __scm_replace_pid() to scm_replace_pid() [ as Kuniyuki suggested ]
---
 net/core/scm.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/net/core/scm.c b/net/core/scm.c
index 0225bd94170f..045ab5bdac7d 100644
--- a/net/core/scm.c
+++ b/net/core/scm.c
@@ -145,6 +145,16 @@ void __scm_destroy(struct scm_cookie *scm)
 }
 EXPORT_SYMBOL(__scm_destroy);
 
+static inline int scm_replace_pid(struct scm_cookie *scm, struct pid *pid)
+{
+	/* drop all previous references */
+	scm_destroy_cred(scm);
+
+	scm->pid = pid;
+	scm->creds.pid = pid_vnr(pid);
+	return 0;
+}
+
 int __scm_send(struct socket *sock, struct msghdr *msg, struct scm_cookie *p)
 {
 	const struct proto_ops *ops = READ_ONCE(sock->ops);
@@ -189,15 +199,21 @@ int __scm_send(struct socket *sock, struct msghdr *msg, struct scm_cookie *p)
 			if (err)
 				goto error;
 
-			p->creds.pid = creds.pid;
 			if (!p->pid || pid_vnr(p->pid) != creds.pid) {
 				struct pid *pid;
 				err = -ESRCH;
 				pid = find_get_pid(creds.pid);
 				if (!pid)
 					goto error;
-				put_pid(p->pid);
-				p->pid = pid;
+
+				/* pass a struct pid reference from
+				 * find_get_pid() to scm_replace_pid().
+				 */
+				err = scm_replace_pid(p, pid);
+				if (err) {
+					put_pid(pid);
+					goto error;
+				}
 			}
 
 			err = -EINVAL;
-- 
2.43.0

