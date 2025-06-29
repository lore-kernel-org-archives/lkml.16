Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F8F2417FB
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751233505; cv=none; b=IVMOuDFV/07o/LGpWQeP6roz0R9j3TY3IDq1QuqVUmKcw6iTuMPns98L/YkcSFNEH2QxCB1stXX/ytkU40WeixGRyH0EFgVozl2NrYWgycPScUaA8YxuPWMWj6LzV5mOGEBoVRtxcDl333bXnH7mR2GXWoFY21IkkPFyiZQoO5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751233505; c=relaxed/simple;
	bh=EifaHAoAApf7q/Mkx9Mw3DETHvUJ2q8UmDQ+dVcocek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sa4tm/OYVdYLipW5vcnvIute56O+3Ao4W+Pd8VK2T7sctPfcocf3/Mng4hpe69/IrDG2gSXQkBHB8Pa38SM+zGoqWAqFaILk7NP9g2znOQeyQ9p/cNoxH2Rj033FzYNT5sgsJ+MttIGOxx+eus2rkbKY4HG093MU92fv9aExtFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=r8M1vDd1; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="r8M1vDd1"
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AF0AD3F1F0
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751233500;
	bh=G60zTzgwmIGQw3RA46ispul5I6p3fmOYvxZfvnCsXEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=r8M1vDd1cwJ0yuDvn+mYozcvUXOhKixhfo2U7q6/fkVNXvULmP9FmEDyPEfjn+MI6
	 Zzg1bW6Oif2IObcV49xUEbgqCzaN24HAqM1L01o3xgj2YUoNQd/adgagUqa4Z6RFBs
	 jzK7lRs7fixLE/HYoaEbm0rFfFvA05ahPYPOkxwW0cskxNIeWQ+vUtHw8o8JtoNST8
	 JMhRKGtQcgfVnqinmEZls4ht1ofq7WgIJ0lM+U53I2IlonvD+wHiQ4urZJSDebrW9k
	 D4I6XkisBMzLvc0Uetwuk51JUTa+pMGgRNHdFsn8k2tAlUPCn2u9tWoY3uOW11n1L+
	 MOukzNPqf1ZaA==
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6077833ae13so2800752a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751233500; x=1751838300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G60zTzgwmIGQw3RA46ispul5I6p3fmOYvxZfvnCsXEE=;
        b=MNtTZMasydIA1SXq6Kxt/UqBe+qUyquukm8fSCSvotPMHExtCyXEaugt2NHTsK59Em
         VTaAszyzBv9zOAcwfuc30vEr55LTr7O2/8tVuVN0e1E/dtmBy3c4TpVBjsJQFVMTmj8t
         Ah1xt7qZQpNDDDTklbK5UPgDn94a08KMS2W+k1dJppZBWzaXjAjMGXrtfdDLicr06/Uq
         8xhTDrugpbWC3ngq6uGSrm3M8lLlf6UCHMueVRh4GzA8ZyQHOacnk4cMwXK9iD/MQmb1
         e26e2gSDUg2RsrZ33cHwCVDpIa/CXHRik7JmWZvF6QfKpmHlglGPSkbTzT2YgTBYC0+r
         Bk0g==
X-Forwarded-Encrypted: i=1; AJvYcCVYZRu3+xTvH/7ln8NRZc14rtWLGEriKFXvLuG5jM1IdmhqfeAkxYojmWs163pBgjSN8QxVXMfOubg4vW8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw009mMJNABEUCAt0HE198mNcx1Zxv3OHFrd2+Jz9zaiKW97cvF
	7xawQgBn+gJqIm2tv8y6xAg0n1H1hq0zvGVWYa9o1nbifT4E/RK7jFmt8ekRF/SQKVq35God2GN
	N3kBdTvof423pNNNsX7s++PrPMnv87U0TDK82kwGbT6qVLjnxMgqSth2OZukCHMZnSCphEhYx50
	MafFB3Gw==
X-Gm-Gg: ASbGncuSK748uGMzT+wCbUc8beaG56TwiSLfAZRUapb+sUkrOYaRLZ0BbpsAY4IEnLM
	FAVUMSTmc+lhd6XsBCJFaWPiXuJ49j9TVxjnz1luDM7De6hGGBi8g0HHJ2VaiqgZ/FeR+veyK7a
	OCenQVO5rRfo0ce0jkFEKU2HCtQUBZ9QFePcUxj4NMyE26uRpskY6+gjvwxyDx0IX2Mum7AkDAf
	F7wCWYK2Z5uVepUXHlyegx1knYPNJHdDrzuPr/ZOa1SDDBaVf7c9OdpY2MLiLd6Tx0+HLBHr/3N
	lzN0HtaGVoyeXEzkLPqOinJPXNk9MIVAQRxmx9u4Z7nNOhQOIw==
X-Received: by 2002:a05:6402:2101:b0:60c:4bc0:453e with SMTP id 4fb4d7f45d1cf-60c88b38471mr8622085a12.2.1751233500224;
        Sun, 29 Jun 2025 14:45:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2xPyY82dEZPtNOjLLgnJHoQ4Iup9xB3PZexu/WprfMu8neYWm8eCcLIXuCERFbcQhVsIVLg==
X-Received: by 2002:a05:6402:2101:b0:60c:4bc0:453e with SMTP id 4fb4d7f45d1cf-60c88b38471mr8622063a12.2.1751233499849;
        Sun, 29 Jun 2025 14:44:59 -0700 (PDT)
Received: from amikhalitsyn.lan ([178.24.219.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828e1a96sm4712037a12.19.2025.06.29.14.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 14:44:58 -0700 (PDT)
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
	Kuniyuki Iwashima <kuniyu@amazon.com>
Subject: [RESEND PATCH net-next 1/6] af_unix: rework unix_maybe_add_creds() to allow sleep
Date: Sun, 29 Jun 2025 23:44:38 +0200
Message-ID: <20250629214449.14462-2-aleksandr.mikhalitsyn@canonical.com>
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

As a preparation for the next patches we need to allow sleeping
in unix_maybe_add_creds() and also return err. Currently, we can't do
that as unix_maybe_add_creds() is being called under unix_state_lock().
There is no need for this, really. So let's move call sites of
this helper a bit and do necessary function signature changes.

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
 net/unix/af_unix.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index 129388c309b0..6072d89ce2e7 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -1955,21 +1955,26 @@ static int unix_scm_to_skb(struct scm_cookie *scm, struct sk_buff *skb, bool sen
 	return err;
 }
 
-/*
+/* unix_maybe_add_creds() adds current task uid/gid and struct pid to skb if needed.
+ *
  * Some apps rely on write() giving SCM_CREDENTIALS
  * We include credentials if source or destination socket
  * asserted SOCK_PASSCRED.
+ *
+ * Context: May sleep.
  */
-static void unix_maybe_add_creds(struct sk_buff *skb, const struct sock *sk,
-				 const struct sock *other)
+static int unix_maybe_add_creds(struct sk_buff *skb, const struct sock *sk,
+				const struct sock *other)
 {
 	if (UNIXCB(skb).pid)
-		return;
+		return 0;
 
 	if (unix_may_passcred(sk) || unix_may_passcred(other)) {
 		UNIXCB(skb).pid = get_pid(task_tgid(current));
 		current_uid_gid(&UNIXCB(skb).uid, &UNIXCB(skb).gid);
 	}
+
+	return 0;
 }
 
 static bool unix_skb_scm_eq(struct sk_buff *skb,
@@ -2104,6 +2109,10 @@ static int unix_dgram_sendmsg(struct socket *sock, struct msghdr *msg,
 		goto out_sock_put;
 	}
 
+	err = unix_maybe_add_creds(skb, sk, other);
+	if (err)
+		goto out_sock_put;
+
 restart:
 	sk_locked = 0;
 	unix_state_lock(other);
@@ -2212,7 +2221,6 @@ static int unix_dgram_sendmsg(struct socket *sock, struct msghdr *msg,
 	if (sock_flag(other, SOCK_RCVTSTAMP))
 		__net_timestamp(skb);
 
-	unix_maybe_add_creds(skb, sk, other);
 	scm_stat_add(other, skb);
 	skb_queue_tail(&other->sk_receive_queue, skb);
 	unix_state_unlock(other);
@@ -2256,6 +2264,10 @@ static int queue_oob(struct sock *sk, struct msghdr *msg, struct sock *other,
 	if (err < 0)
 		goto out;
 
+	err = unix_maybe_add_creds(skb, sk, other);
+	if (err)
+		goto out;
+
 	skb_put(skb, 1);
 	err = skb_copy_datagram_from_iter(skb, 0, &msg->msg_iter, 1);
 
@@ -2275,7 +2287,6 @@ static int queue_oob(struct sock *sk, struct msghdr *msg, struct sock *other,
 		goto out_unlock;
 	}
 
-	unix_maybe_add_creds(skb, sk, other);
 	scm_stat_add(other, skb);
 
 	spin_lock(&other->sk_receive_queue.lock);
@@ -2369,6 +2380,10 @@ static int unix_stream_sendmsg(struct socket *sock, struct msghdr *msg,
 
 		fds_sent = true;
 
+		err = unix_maybe_add_creds(skb, sk, other);
+		if (err)
+			goto out_free;
+
 		if (unlikely(msg->msg_flags & MSG_SPLICE_PAGES)) {
 			skb->ip_summed = CHECKSUM_UNNECESSARY;
 			err = skb_splice_from_iter(skb, &msg->msg_iter, size,
@@ -2399,7 +2414,6 @@ static int unix_stream_sendmsg(struct socket *sock, struct msghdr *msg,
 			goto out_free;
 		}
 
-		unix_maybe_add_creds(skb, sk, other);
 		scm_stat_add(other, skb);
 		skb_queue_tail(&other->sk_receive_queue, skb);
 		unix_state_unlock(other);
-- 
2.43.0

