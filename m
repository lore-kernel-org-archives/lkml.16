Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13D629344F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751581433; cv=none; b=gICRGm8mWVdyvGlZbMY+7TKpTuFWGzhcIMPrDUL9Z6QQMzwrEIHY6MUHT/NZN+xYPXXvblsrz76Tb+zVn9C8Lfo6xZ1AnhQ6KYXwYPLiYpVOXOhIJ//aEqbYW1v89kYDM4x+F2fS73iDyuCO2MO2QZRP0Raf5kf4pK2BDvYu7D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751581433; c=relaxed/simple;
	bh=Gn7W5P0APLN41EFikXwUV5T0T3M9B52pVgzplH3HA2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P/i2u/7dJQWIkArPQgDp5W9JRPW4fmv2j5oo2jnl5M7ZaoxQUMYqQQ6va4mZiqlTPl2FlRbVADdhfl4vz0W9jgYsfS8XcHSKg/nI+CWnBSczbHzX2+2nseN9OY/2qlvsBbT5erKzTKgYZ75mLHG3cPoY3zWn0W3Vv97jMmpHYho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=VRD4BYpQ; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="VRD4BYpQ"
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9FCA23F944
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751581429;
	bh=RPCya3yNT0z68V2C/y3Kyp31HeP4GdNlj4LTMqhXVPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=VRD4BYpQhOEO7E7rbB3JvqTekYmY1KAvyYMpYwOqH/TCU3Nw3PEjBZrwOUjGl21q4
	 iDieDaSLAMploLK6sVz+ono/ApL4rWq+kzwGDcQe5WFSJUVUGmm7O+55WVZPGpyBWR
	 Ar5wBkBL4zHtmXFHrOTRrptaEIg7EsSnk9nmVyJMwFCq2bgwRf9aSBPPR+CR+njm/W
	 TbZwAHAs0aID688XnkHqK5fZY4f9zR9PE16GTMrgDnC6hc1crAvz7uooF9Drb+GieT
	 35OEEGkbZiXjfWBvscYMHqP1CIQHqHdhNLX+eyGrgqhpPRWv3jjTx2ga7FmQ1cszt7
	 gg8G9HCl0nhuQ==
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6085b0265c5so265553a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 15:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751581427; x=1752186227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPCya3yNT0z68V2C/y3Kyp31HeP4GdNlj4LTMqhXVPM=;
        b=LQEdgpVArWIkkVqOArSdxKkAYk84pwLyumdjRWHLc4BMG1wqCpJhhrqkzylzucPhnA
         ECzhpfUR6BAtOUeDd8A3zDRWo4fhRiAdtA9jg4DJ1eY6WlYq675tCb6geyPBazw5f9sn
         1hC9AQ42Lvm9w3JhI8qhNWtXydhsTNf9BxVGr9Mv9lAUAyyaZ+FYnm3Vk4quz+GFEtyR
         cMtGu2FEFnmcyxo3Gq+LR7EWQuzG4coovZfRt1PgOTPzvFf+PABRzjLTjEir7kYL0xfY
         CzEDY1TcZJ+Juoncp9PFDKk8980u/Y1D019svmbs8zc54zFl7q79Rcqaknx/myUi/C2h
         A60w==
X-Forwarded-Encrypted: i=1; AJvYcCXK03IJVgejz7TvyUx9HeIG0f2mJbMHzAyhX3yB7I2+3ObaXSO3gEee+AANX8L5sukp2Bqpn6S0SOs88o0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8XHZx6FcjqkQuT4iUvqT872SHeaBan3BiIe/PoCpH6BpisIvw
	9IIQR4QzDPHrjNtaxVb7/TGNwEyNNGJoLTTv9alfQZoxL2LSjwU0QTcrLwkhE7+x57urJcLzwtH
	OHkooBQchM9CLjh71cJ1MQiHY37nr/Iy3IJFmZtpV1U5A9XqAb1fFPdcBp79q8xVcKvDOpDrmHU
	39DtTSzw==
X-Gm-Gg: ASbGnctBjxdkCfcQ5MQ+PRo9Grp+EVf8lYmXblUqy5cND6tFvEsG/9DRP0JOk6BLvHM
	2ToPQy+hEs9HWMQqCKqaIEourvFs7ijqAd7Cs5nTL+Tjk1Hp68aAxMTMa5f4fEW2TvxnEmYbl6e
	QsaY3/VU/xMzjO6FaAHJpDszMW/1DLRj5HrjXHKaG2ycGfc6l7V5lHvi5Z1C3Hk3VvkF50hNm1O
	qd/2voLdqm7RRYj62f6fzdzUN2rFB9WlignYvlXzDGDjSH++yqHqco7iDEtQOqs1Pd2YIxQPpy9
	FWnWtRFTQL9QJnu5r7vsMG6tF+pVbCHKPqOImkYW+jTJ5iZlOw==
X-Received: by 2002:a05:6402:4606:b0:60c:461e:7199 with SMTP id 4fb4d7f45d1cf-60fd2fb475bmr206995a12.9.1751581426541;
        Thu, 03 Jul 2025 15:23:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhYrS4/6WMb2G+ZUHQLTdnePYa7hC/QbuhLVyf8RVZHrcRhQsytyx8CWJVQ2cOge1XHrBWFg==
X-Received: by 2002:a05:6402:4606:b0:60c:461e:7199 with SMTP id 4fb4d7f45d1cf-60fd2fb475bmr206975a12.9.1751581426110;
        Thu, 03 Jul 2025 15:23:46 -0700 (PDT)
Received: from amikhalitsyn.lan ([178.24.219.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb1fb083sm355164a12.62.2025.07.03.15.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 15:23:45 -0700 (PDT)
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
	Leon Romanovsky <leon@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Lennart Poettering <mzxreary@0pointer.de>,
	Luca Boccassi <bluca@debian.org>,
	David Rheinsberg <david@readahead.eu>,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next v3 5/7] af_unix: stash pidfs dentry when needed
Date: Fri,  4 Jul 2025 00:23:09 +0200
Message-ID: <20250703222314.309967-6-aleksandr.mikhalitsyn@canonical.com>
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

We need to ensure that pidfs dentry is allocated when we meet any
struct pid for the first time. This will allows us to open pidfd
even after the task it corresponds to is reaped.

Basically, we need to identify all places where we fill skb/scm_cookie
with struct pid reference for the first time and call pidfs_register_pid().

Tricky thing here is that we have a few places where this happends
depending on what userspace is doing:
- [__scm_replace_pid()] explicitly sending an SCM_CREDENTIALS message
                        and specified pid in a numeric format
- [unix_maybe_add_creds()] enabled SO_PASSCRED/SO_PASSPIDFD but
                           didn't send SCM_CREDENTIALS explicitly
- [scm_send()] force_creds is true. Netlink case, we don't need to touch it.

Cc: linux-kernel@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>
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
	- renamed __skb_set_pid() -> unix_set_pid_to_skb() [ as Kuniyuki suggested ]
	- get rid of extra helper (__scm_set_cred()) I've introduced before [ as Kuniyuki suggested ]
	- s/__inline__/inline/ for functions I touched [ as Kuniyuki suggested ]
	- get rid of chunk in unix_destruct_scm() with NULLifying UNIXCB(skb).pid [ as Kuniyuki suggested ]
	- added proper error handling in scm_send() for scm_set_cred() return value [ found by me during rework ]
v3:
	- don't stash pidfs dentry for netlink case
	- splited whitespace changes
	- removed unix_set_pid_to_skb() to simplify changes
---
 net/core/scm.c     |  7 +++++++
 net/unix/af_unix.c | 11 ++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/net/core/scm.c b/net/core/scm.c
index 045ab5bdac7d..358a4e04d46c 100644
--- a/net/core/scm.c
+++ b/net/core/scm.c
@@ -23,6 +23,7 @@
 #include <linux/security.h>
 #include <linux/pid_namespace.h>
 #include <linux/pid.h>
+#include <linux/pidfs.h>
 #include <linux/nsproxy.h>
 #include <linux/slab.h>
 #include <linux/errqueue.h>
@@ -147,9 +148,15 @@ EXPORT_SYMBOL(__scm_destroy);
 
 static inline int scm_replace_pid(struct scm_cookie *scm, struct pid *pid)
 {
+	int err;
+
 	/* drop all previous references */
 	scm_destroy_cred(scm);
 
+	err = pidfs_register_pid(pid);
+	if (unlikely(err))
+		return err;
+
 	scm->pid = pid;
 	scm->creds.pid = pid_vnr(pid);
 	return 0;
diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index 323e4fc85d4b..d52811321fce 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -1971,6 +1971,7 @@ static void unix_skb_to_scm(struct sk_buff *skb, struct scm_cookie *scm)
  * We include credentials if source or destination socket
  * asserted SOCK_PASSCRED.
  *
+ * Context: May sleep.
  * Return: On success zero, on error a negative error code is returned.
  */
 static int unix_maybe_add_creds(struct sk_buff *skb, const struct sock *sk,
@@ -1980,7 +1981,15 @@ static int unix_maybe_add_creds(struct sk_buff *skb, const struct sock *sk,
 		return 0;
 
 	if (unix_may_passcred(sk) || unix_may_passcred(other)) {
-		UNIXCB(skb).pid = get_pid(task_tgid(current));
+		struct pid *pid;
+		int err;
+
+		pid = task_tgid(current);
+		err = pidfs_register_pid(pid);
+		if (unlikely(err))
+			return err;
+
+		UNIXCB(skb).pid = get_pid(pid);
 		current_uid_gid(&UNIXCB(skb).uid, &UNIXCB(skb).gid);
 	}
 
-- 
2.43.0

