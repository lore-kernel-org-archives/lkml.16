Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4265324166A
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751233238; cv=none; b=tVffJNwEWU+i7u/ShM9KH4cF8llZsME655rMf11Pt96WuWH4tkv0tYQSMBs8jLUXYc5tzFv+/KTd9W99Kd2FVd+kcNN4aDlb5yTOP6+BDDmtR1c31EpDbCK3GNH6L6AhaU75W10OSRsWFBxPzvh2iVW+W2AxODpvJrZYakkQQxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751233238; c=relaxed/simple;
	bh=VACbYylNY0GZZiXUiqWxZtbjE7wFpLfHHpgC7WkkLEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=erE8qPUYUVOCyaAmB4iEqmoSxWoI8Q6rAm0qDbuAUxYRP7SvbnhV0MNT51ZdLJULB+pylMp1HQ3fR85fXuNiCcpPUPv25UxhljIi07MfgzXRaWOb1wMp/iXCXv+qpFHAvyFoErCGSjRL7A7SwX5tmElABJP7mDFIGceeWNS317A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=ZBIbAzlQ; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="ZBIbAzlQ"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BFDC93F278
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751233225;
	bh=zaLf0PqnVSE0a0NYI1zahHI7S708kB309VTgxWqu+sY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=ZBIbAzlQB3dFlk14jPJiniEf1RHF2eOvng+PBx++5ukiN25yEjHexTSpkK+LtCS9B
	 ecDCCrD6Iph9/j9uz7H+aSKVsk7R0nxjT3Brv0GDG0u0tt5ZL8zvhBJYEZCLp9tN+U
	 3i3rr/EQ8AFVjs+NB5HIDavysxIRa+ktbOJpicjkkD+ngDt6Pp27LpcHk/dYbwSExr
	 lW8PErRz/xs9MLJRX6IEnmD6y28koZfKAtL7V5h8nwJx24/IWEw+QF+dQLwKHVHBe+
	 Z17bXmvj79ofNUskl1TZSHgAWXfQCLKG8y04fOlKo6N/anSMJiEKIwzOe+/qdiJje0
	 panzc9y4+Ps7g==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ae37a8f000bso43316566b.0
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751233225; x=1751838025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zaLf0PqnVSE0a0NYI1zahHI7S708kB309VTgxWqu+sY=;
        b=TYq0iddZovmbUoFlpFbefqJU9qo+i9DUaEzq6cKmcoTkf0M5ydqg37YNQ/5+ud55JF
         +9tyZr8wVJmprMJjeQzETC9ZIerTTAiWlWuzorV4yEmFMj5bDVHBUnH3LoNlCo5/N1L0
         FtKFM1G87agXouBnkxnnR+gvNTNmobsvz4Lu7UeWmMruYkL7cVSre5TKyoGhj9tO4+uQ
         SsZnvELp5F/n1+8/iXhg1gN/zdGy1yFIJDWniE4FujmR61WgnQf8KjLSxgXVebq9L4rs
         P+KbQ3kLRSffdW557d070bm4AOQ1moc87Q1sgssu1cYIB5dtf8kTW4JqprcelX5bOFcj
         gbcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHzQVEn4vySYmlZz4AnBScO+V76N7ihicmxfin/VhGRLl0CRI1epsSL1M3Sds+LIhT60FSCGRyfHFyIV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbeY31m8k6a0BpGqqgxvxAim17Msw4dnRUsCTBXyeara4Q6C93
	4pesXJtU9Tr+iprIUx9lmLu403rpu5nJ4vlUMVG1RcJa0aqAPq7HeSETghdQJwL7qlgo6uctt3O
	6nAw8S7apn1FlyeEjc0A62ZkLeS9F6bZLNDhKFEWJk0eh/NODnXbX0LS3+1y3ihZgrnDdIvY0fc
	bdjL/Igg==
X-Gm-Gg: ASbGncvXc2Dj0SfDJIAJybalIcC4d/wknds8TcCGJVxeaW1txaSGY3LstyIcxEa3kpO
	gK2IszKa8FtlT7a3X0AovcIQ5LsylrHE/ePBqIshlKxtXVfjqdGoe5063Q6F1PM8helffNH+9ks
	BXKZuFw6fZYRHgk+LCd8caiwkyg1viSkm8KLzht6o4NLtYqstDU8s5biULM0AZaFtuO2iBmO2Ky
	IQsMkHymc3hdJUF0WGpHOLYfBdlK7urLhKr8gxdvF9i3iL8p7IIF0hZDVV/ILhDSkxWOylt43lh
	aew61MfGxvlbyKPmNZtgvDXGYvW10Vfwqnz3jklESPf2OHRweg==
X-Received: by 2002:a17:907:7207:b0:ae3:6b52:f7dd with SMTP id a640c23a62f3a-ae36b52f88amr630214766b.46.1751233225081;
        Sun, 29 Jun 2025 14:40:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEly/HrFr9g6loLhVqffEY2Q9bHE9od0Y4WF5ZWRU6x7hLLHSYilN01ysSpRgmVoetvhvw9iA==
X-Received: by 2002:a17:907:7207:b0:ae3:6b52:f7dd with SMTP id a640c23a62f3a-ae36b52f88amr630212866b.46.1751233224676;
        Sun, 29 Jun 2025 14:40:24 -0700 (PDT)
Received: from amikhalitsyn.lan ([178.24.219.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a754sm557263366b.62.2025.06.29.14.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 14:40:24 -0700 (PDT)
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
	Leon Romanovsky <leon@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Lennart Poettering <mzxreary@0pointer.de>,
	Luca Boccassi <bluca@debian.org>,
	David Rheinsberg <david@readahead.eu>
Subject: [PATCH net-next 1/6] af_unix: rework unix_maybe_add_creds() to allow sleep
Date: Sun, 29 Jun 2025 23:39:53 +0200
Message-ID: <20250629214004.13100-2-aleksandr.mikhalitsyn@canonical.com>
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
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>
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

