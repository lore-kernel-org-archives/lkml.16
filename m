Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F4125EFBD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359234; cv=none; b=HckFPSkNkhdtsHJO7lIQbOS4AxqPD5JefpRVakGMAIvzBl2xK+/EFysUtsBfDJVR1WkbvuwNYAUZr/BzOTnwp73kXM/ZNJka0bWzgsKcwQ7TBrYWbj0AJjZvezy0fux4tO5RvS9slQDfTNnBi3fAYNOnQWHntNS7lxpS/oXGtms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359234; c=relaxed/simple;
	bh=Lbn8rzjh7RE6O7oYUHPkiHveEVz+1OAXcJd7WAjkpP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IgU2qzuxGjDwsFspDwap8ldbBK0CqVVZm0yQXXoOEnzKbtfAZT0zbaKg+qiGe8X5ifhcK0Uq9ANnXGiqeEKVI8vJb/TgK5WIr/YLFFzCm6s/2fDrA8jtUKcn5KAXayPxSbaz9Mn4nxDxOG8zKBZC6Faych38/8I1gIpiJQIFB7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=hKeXv3NI; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="hKeXv3NI"
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 71AD63F18C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751359230;
	bh=d+q77i3nRFEpD8HnFtkd3zMitsksPFCi2UIIvgg4IUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=hKeXv3NIbN1wUt+k8Kchm0hNeI7/Sk1ukS/Jg0yxd9k61C/Sb5UcgAt1Fj3Ku4TxD
	 umfU8phfDNpHdNxzBUKzmwWbmMssaXRUET4PnA/ikSoWmf9+IbeIcG5OWNd86An54z
	 91DsuT7zb5ZL+F7OQNwArNP8karyJqWAu2cRpL0u+B34LNbkwAVFz1LXSC7APpYENx
	 BQKra41hsSqVXdEp3tCmuBrSIizu3b2/uHgazd1c6rt5f3I6pule42tJGqZsZ5pYJ+
	 xEIJxEvnURLSWit7mnic7+tBPtQxvEz0scFBnTtXxGcOt5Ub/gp1dQj+lbd7U9T4y6
	 KmRPZ4LgmQPLQ==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ae3b2630529so23487266b.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 01:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751359230; x=1751964030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+q77i3nRFEpD8HnFtkd3zMitsksPFCi2UIIvgg4IUI=;
        b=BBBrT0P6YHO1AiMYQYgutvndXOnZw910Bb34oL+trHQAW2mC28JBQmpuMfIC5YoViT
         8CcN1lzXJJY/oSbnrl2LDvRZ3yi5ZZJTocuNZrENuoHTh2uLgQRSTCC2YqF98glpeYuS
         LHbEQ8Gnlpb9A8Slg1+yglnjUpDngBtbVbJxdI6+3yx/WN16SonHGTjb6HlegtYkYD2K
         2U3J3Zsg6Q54uFJCnsb5TXy3Jq3GYfMTBDV4zDBhmU613jSbrPoQSOFbsTlMpdfnDq3b
         Q5KxiiMFgIZNlPtHDP+hdnwqNqs4sVnvcC/iaQX0yxLV0BlpNeddiMnSi6CXkZnW5iA9
         E+lA==
X-Forwarded-Encrypted: i=1; AJvYcCVv77HqDfBWht8NlPtG3n7w7DNtkcfQD+rlGeyHRf+FRyb14cZ2bqzcaL6x0WTqYpQmXTubZmDjRQNLZlY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy32wiv7n29l5YkY8Nml1+PGyCh1yDR+xv+QbmpknN5iaXI3az
	0gmYcYino3EcSmaFkLSVEKV+/RapPGSgen9WSKqyF+wF2Qw4DIjU6DhyDSBKx2nD/QkcMmlq0sA
	kxQsi/4t5sPebo0fQjnSogoXwORxm2S97qUDNxJuh0gYMH0icgbR9VJiLwRPxlOppMIY8tGQelN
	FNXFJs4Q==
X-Gm-Gg: ASbGnctWY/cr+OkiqrPhNALHV6lu3zXaQy7vEuD7vbpIzFNtPL81P7Y9NT5mYJsZR6T
	I4rs1zTL/hsTMkSpJz4Uix5NhI1IpoM1j564oiLJtgquFtT8M2oCwFe2oi9mem2miv2YXSrrwyf
	3YG73vGWgOrlbTBST4eqautBnIlLofYq3rAUXZ5aUYDMtSeYnzQ+sQD0B207uNjBW4zPnLVhdoW
	59iFXnCH5fiS/VOqRsNUiY7EiiyDk6uJdFtSjtvEpJWNvm4Hflp2FaYSBw6RJjvbs4cc1APtpsx
	1MduMOhMCme7uO7zxDbzIYnHffu8v0qq7t5lABt+qScM+5HdEw==
X-Received: by 2002:a17:907:97cb:b0:ade:9b52:4da0 with SMTP id a640c23a62f3a-ae3501a1608mr1429781866b.60.1751359229822;
        Tue, 01 Jul 2025 01:40:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHm38a4fIG5d97STV7PS1v47gd+0RVwmdaJeweffwuD+F/nL2Rv8S9KkYbLtZuIL5p9B+XmPg==
X-Received: by 2002:a17:907:97cb:b0:ade:9b52:4da0 with SMTP id a640c23a62f3a-ae3501a1608mr1429778366b.60.1751359229276;
        Tue, 01 Jul 2025 01:40:29 -0700 (PDT)
Received: from amikhalitsyn.lan ([178.24.219.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm812427166b.28.2025.07.01.01.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 01:40:28 -0700 (PDT)
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
	David Rheinsberg <david@readahead.eu>
Subject: [PATCH net-next v2 1/6] af_unix: rework unix_maybe_add_creds() to allow sleep
Date: Tue,  1 Jul 2025 10:39:11 +0200
Message-ID: <20250701083922.97928-3-aleksandr.mikhalitsyn@canonical.com>
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
Reviewed-by: Christian Brauner <brauner@kernel.org>
---
v2:
	- fixed kdoc for unix_maybe_add_creds() [ thanks to Kuniyuki's review ]
---
 net/unix/af_unix.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index 129388c309b0..fba50ceab42b 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -1955,21 +1955,30 @@ static int unix_scm_to_skb(struct scm_cookie *scm, struct sk_buff *skb, bool sen
 	return err;
 }
 
-/*
+/**
+ * unix_maybe_add_creds() - Adds current task uid/gid and struct pid to skb if needed.
+ * @skb: skb to attach creds to.
+ * @sk: Sender sock.
+ * @other: Receiver sock.
+ *
  * Some apps rely on write() giving SCM_CREDENTIALS
  * We include credentials if source or destination socket
  * asserted SOCK_PASSCRED.
+ *
+ * Return: On success zero, on error a negative error code is returned.
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
@@ -2104,6 +2113,10 @@ static int unix_dgram_sendmsg(struct socket *sock, struct msghdr *msg,
 		goto out_sock_put;
 	}
 
+	err = unix_maybe_add_creds(skb, sk, other);
+	if (err)
+		goto out_sock_put;
+
 restart:
 	sk_locked = 0;
 	unix_state_lock(other);
@@ -2212,7 +2225,6 @@ static int unix_dgram_sendmsg(struct socket *sock, struct msghdr *msg,
 	if (sock_flag(other, SOCK_RCVTSTAMP))
 		__net_timestamp(skb);
 
-	unix_maybe_add_creds(skb, sk, other);
 	scm_stat_add(other, skb);
 	skb_queue_tail(&other->sk_receive_queue, skb);
 	unix_state_unlock(other);
@@ -2256,6 +2268,10 @@ static int queue_oob(struct sock *sk, struct msghdr *msg, struct sock *other,
 	if (err < 0)
 		goto out;
 
+	err = unix_maybe_add_creds(skb, sk, other);
+	if (err)
+		goto out;
+
 	skb_put(skb, 1);
 	err = skb_copy_datagram_from_iter(skb, 0, &msg->msg_iter, 1);
 
@@ -2275,7 +2291,6 @@ static int queue_oob(struct sock *sk, struct msghdr *msg, struct sock *other,
 		goto out_unlock;
 	}
 
-	unix_maybe_add_creds(skb, sk, other);
 	scm_stat_add(other, skb);
 
 	spin_lock(&other->sk_receive_queue.lock);
@@ -2369,6 +2384,10 @@ static int unix_stream_sendmsg(struct socket *sock, struct msghdr *msg,
 
 		fds_sent = true;
 
+		err = unix_maybe_add_creds(skb, sk, other);
+		if (err)
+			goto out_free;
+
 		if (unlikely(msg->msg_flags & MSG_SPLICE_PAGES)) {
 			skb->ip_summed = CHECKSUM_UNNECESSARY;
 			err = skb_splice_from_iter(skb, &msg->msg_iter, size,
@@ -2399,7 +2418,6 @@ static int unix_stream_sendmsg(struct socket *sock, struct msghdr *msg,
 			goto out_free;
 		}
 
-		unix_maybe_add_creds(skb, sk, other);
 		scm_stat_add(other, skb);
 		skb_queue_tail(&other->sk_receive_queue, skb);
 		unix_state_unlock(other);
-- 
2.43.0

