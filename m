Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD6A241132
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751233238; cv=none; b=RU0ISxOfxlVSSZjwkDDz35qnTisfhyKQT+4qmtpTnvBCxA+r5NCsETQGIAn/sACRoP1PQz4ECkBZQJYGq8ZwSS9KeWqshFMU2XI5t3AG5O5OUdiyqL5DJ767mcUbRIZFcRgEsJ/Ag3B0nx6LK9k1Heg+KWi8eVhkhX0OpWh+uxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751233238; c=relaxed/simple;
	bh=IyxrDFbacMBAx6Onjmukxc0YN1nXFQ5UE0pW+oMO/pQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sjhZsIAgkZ+XcTxM/l59BM06MecqTMZggXMbksBWv3cjIfy8WDWCUirJk5gQhxX7hynFYXPDqid8e37hLeL55aVSERz45Bw2lOP4wn28kAVe94buJhy0qTO5TcfaE/Q131au2JNOzdQbTy7uhTTjHX6ImpseY8DlbgXTOdcTgPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=O7pB1Y/8; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="O7pB1Y/8"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 159003F657
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751233232;
	bh=48BdSf3QfnCKs3/i9D2aI5kg4hr1YnePWMmrRnRqmkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=O7pB1Y/8gNI8jM/C7mjSSGPGwD2gs4r6AvQVRlkcbU1DfntahdAJKMbN7c8eiS5/+
	 4CcU2w7EX/cc0WcLbkYHoPOh+jwRjzvkxzQeTpxUWfmIP5Vl9THFtU/Na3XWRDKkVN
	 NGjBB9HUA/CB+NfY0GmlzzZpm3mZjHTRqGduQgv0b2jaZ4kb0n/te9gHsj0RR6AWlV
	 rE+mnm5g0PcoyGQ6ZyVVK0MPUjP/VqlxxFj40oRYPDGnKE+KxAM2TMuCOzQRB8I8qI
	 j2xcwAPrjqde32j/S5gQ3ql80IOpWP+LQzevcAObbvvXj7b56ZJmK2VNbSbp8+Pc39
	 XH8KHnvNbTScg==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-adb33457610so147445766b.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751233231; x=1751838031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48BdSf3QfnCKs3/i9D2aI5kg4hr1YnePWMmrRnRqmkI=;
        b=saBncwZDQZIGwwMRSrmdjwcZgJ7elAM6HdBUDbd0rBKStIoJmmbsX4tcUr+KnMksHR
         s4T+eng0GswRuXH4AvC4Du19AfZREKXS5dDGwifBdMcb8EHNlAImfyNpr7zGuMrsulY5
         gSNzspZvIHfG0ykfElselNkVtifgAsHzCBJkQ2BsRwh07ZKH2miZKNLIQ3/fU6JPwInc
         9Xo1cS4GtAD4C6WduV7d46rPZjqhyplCDHCb3sZv/q7YFR0K8GmpBssNEgkJH/sTfaZT
         zJrYqCxCMThihNgXeIipPcccj6IU7IuJnJxxKnJzMZuijlkEEi7yi5eFnUTbI2mE7GPI
         1B0g==
X-Forwarded-Encrypted: i=1; AJvYcCX5loDLdGSmCoWehermEJs5X1vAmAdo+v83mOYdlF2nU5hQuFyxlc0ilmVHFy0xHP1htsoj2zUFueSXmtA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOLp/7JFtYuCBSDPqPrqZPBDOtQ+U5FjEWZW2CBo+rkjonYsmY
	sxGG5WhynYCxyhtjezGEQzNCaIMJyGYgTYtUedsY/um2eAh0gDT84oYN97o9X8Jx6A97n+vQyuQ
	NCE4gVA9w3ALi063gWIPwWcLzcW1mq/DOKgzRMJzm+zKB3uUFjpKCvrxUMC1EIW/uyrxVp2UpXw
	czrzPFxg==
X-Gm-Gg: ASbGncuqoF2fxy5S4ZuvXCzT5ZFoRGRA1TlbTXPLm2Guw02Cexgrc9ELcMpaSFlYY07
	tr5nrO/sGUJAazkl9YeCYqIUA9jBEin6F/kWPfprcPZZMJ6mkUSRAW6nbzxuPgkofZTuqxCjDP0
	uOhXhAm7FBRpNBZ1P03DNCIow8XEAwymIF1qV8jMSuhyVCCB6wBsgA5EkNNpQR92YSLGcim3Zcj
	0GuG56ZI4d9LMqsr0sB88kF+S7qN58COOm6ms8Uez1t2qiPYlHyrWeMpGtIScUgNbyDxozAY34F
	YScAl5QYYf7JJt3B6gucNFux5zCA3EZ1ZvTSBcYI92rNgb2/Sw==
X-Received: by 2002:a17:907:9490:b0:ae3:7084:7358 with SMTP id a640c23a62f3a-ae37084758amr558687666b.58.1751233231648;
        Sun, 29 Jun 2025 14:40:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSIm7upfMuuJVnjznmjrVxm+tXaPhq4fTHwTaW1KebVCezBY91akX8QVAoBLuxIE1VBzR56A==
X-Received: by 2002:a17:907:9490:b0:ae3:7084:7358 with SMTP id a640c23a62f3a-ae37084758amr558685966b.58.1751233231308;
        Sun, 29 Jun 2025 14:40:31 -0700 (PDT)
Received: from amikhalitsyn.lan ([178.24.219.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a754sm557263366b.62.2025.06.29.14.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 14:40:30 -0700 (PDT)
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
Subject: [PATCH net-next 3/6] af_unix: introduce and use __scm_replace_pid() helper
Date: Sun, 29 Jun 2025 23:39:55 +0200
Message-ID: <20250629214004.13100-4-aleksandr.mikhalitsyn@canonical.com>
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
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Lennart Poettering <mzxreary@0pointer.de>
Cc: Luca Boccassi <bluca@debian.org>
Cc: David Rheinsberg <david@readahead.eu>
Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
---
 include/net/scm.h | 10 ++++++++++
 net/core/scm.c    | 11 ++++++++---
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/include/net/scm.h b/include/net/scm.h
index 84c4707e78a5..856eb3a380f6 100644
--- a/include/net/scm.h
+++ b/include/net/scm.h
@@ -88,6 +88,16 @@ static __inline__ void scm_destroy(struct scm_cookie *scm)
 		__scm_destroy(scm);
 }
 
+static __inline__ int __scm_replace_pid(struct scm_cookie *scm, struct pid *pid)
+{
+	/* drop all previous references */
+	scm_destroy_cred(scm);
+
+	scm->pid = get_pid(pid);
+	scm->creds.pid = pid_vnr(pid);
+	return 0;
+}
+
 static __inline__ int scm_send(struct socket *sock, struct msghdr *msg,
 			       struct scm_cookie *scm, bool forcecreds)
 {
diff --git a/net/core/scm.c b/net/core/scm.c
index 0225bd94170f..0e71d5a249a1 100644
--- a/net/core/scm.c
+++ b/net/core/scm.c
@@ -189,15 +189,20 @@ int __scm_send(struct socket *sock, struct msghdr *msg, struct scm_cookie *p)
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
+				err = __scm_replace_pid(p, pid);
+				/* Release what we get from find_get_pid() as
+				 * __scm_replace_pid() takes all necessary refcounts.
+				 */
+				put_pid(pid);
+				if (err)
+					goto error;
 			}
 
 			err = -EINVAL;
-- 
2.43.0

