Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320772BEC42
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751581417; cv=none; b=n6L8C17G54+spcMRI+USapYiYTJJ9HpKMzrzPk+XhxyZiSE4MKXqySpzKZhpLEcCR67xIQIvE5gcFlZbXUKuXvVlxrA66eUu2Gc45MrLCHCyHvq/M6kaM9fqLm9uyxaSuEj++DWaX30P5yghtsPOIE/Gv9nAPb4JFeG/SZ4+c4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751581417; c=relaxed/simple;
	bh=Lbn8rzjh7RE6O7oYUHPkiHveEVz+1OAXcJd7WAjkpP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oiSGtVDr4NpU6CPDwdpIQIwUNupriQG4h0O/1fMWfp8bEuCeNInX0I/sFuoDO8hAX7nnRJXp++0YK5HRIM7UTEdAhrPi7JS5uqE8WVwvRlyrGNwvBXJXaAzMJ3JjWoobJ3VJDcap8K6wy9PANBCub0e3jGf4an6dfooZjcSnsFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=htirf0KN; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="htirf0KN"
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C797D3F69A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751581413;
	bh=d+q77i3nRFEpD8HnFtkd3zMitsksPFCi2UIIvgg4IUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=htirf0KN0MCNmKPE9PPRWYrxYXWUdzA3b1NAnKVuJeWUpnHRajtqnx5MxMGXQQcCN
	 IH6Um7CqU7dyevNw7X304HUN+fDC0GdzQYYcOeYG3aIwrRahc/vY9+WJKvZOFR4vY3
	 t1b1/V6XEpYPl3SCeGLJ/H53YYnCsZAhtFjuMYh6O2FxQ3xtMHP+dvKPXKEX4guXyF
	 hOovgIUiycSG33CIGysMnHNMqWuhZZShHYIajHd0EPfar99GAeruRCectjpZePiPQr
	 T4gtQoMcRcoc9BLCSNHe/kchA7sPj3Ca1XeVVKTNBcYLqmlsf+31I+XalR0ioVUmF2
	 BarI5sliH24CA==
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-60c4d1b0aa4so231857a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 15:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751581412; x=1752186212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+q77i3nRFEpD8HnFtkd3zMitsksPFCi2UIIvgg4IUI=;
        b=hVeFwCcZw2Yg1myv4kTt6T9Bo5uUgsy8dXIrv0yCP3d01bOpBrjo7jTeMqIJh+2QyW
         EnpEG06VPOMQtga082G7XgBRPuAEb/j7Y9QOPJkspOYe+gR4covAnCbogB6kgsDumX0p
         JHEJvWtCLbcaimVC6ODD/r1NWZuiHnn+MvMCboNRrY0itlimBTpO+vE21BvoMERpm8bQ
         lblbkF4vf+4tfAT26mcXP3Cgn51Vc4CVKXxZAv7UoidCNVMc0xBETXHHKIXTOc8o3xA8
         l55FJdpJexzXHCebZo0YGC9lDgYpjRkSrTCj14DPAt8GHOHf9bK4QXlxIKyQlUIwivox
         0a0g==
X-Forwarded-Encrypted: i=1; AJvYcCVHhZaaicZm8dcUdtNqHTQCYOVoVQwqL+6HoVb3Ds7KwRXWFz4uZe2CkIwAySfNaakrKhOBO2drAiYOeRk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeiKnOEmk+OB4Ep3bIJ0a3FaIB4qxlpe0WwQky7eq73Upw3bHH
	49yTvKne1uSDecEy9DpOVgL4r2AhkDPngwFEhp3RtFnZqRnxIaubKNVYs9DtL81pF3y7U5Ow4CX
	ws55FxFE7rqZI8ZkcgwKJ2X4j8+wCcnqNx832uK4aMVj0sG2QWRxDX9vuxbHmnY0u9hDlE2nPVV
	nlQEjRmQ==
X-Gm-Gg: ASbGnctzjfxZ2Jw1lPoO32AuP0/s03yVC/lG3TNq1GleZIKoSdqcWgigmhUdaOmwA/n
	apgkmQlCiNY57f0c6GshDa+RKeclI5JA5mMmknhWkGKqxn2f5b49Kg6Z6ZVBwIxHsUzCPj3spBF
	S+hAAMKbkSWVLT8DW4SoGzm7CwO6oZdHGiQ4jQms0WwnSybRsyxB/XCE6VqalYldKYkbyT9m7xa
	SBc66ymCl0Im8i0iYOpzBR6HS5V2SjyfIaQM18nswWKiM9l47cJKMLlrswO4TMvZvM/JSAKMkh7
	9tAspWwE2JxpfSoai7TdxyJqf5oSC+Xq07tzN9dWhE7qohdP6g==
X-Received: by 2002:aa7:d30a:0:b0:5fb:c126:12c9 with SMTP id 4fb4d7f45d1cf-60fd349286emr215849a12.25.1751581412239;
        Thu, 03 Jul 2025 15:23:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2biFnz5cfZv+nKonKT6km6Pn1oWt1Ka0vI4ItopUUTWrSplmT7pd4QPU+o3096hXMOVXGkw==
X-Received: by 2002:aa7:d30a:0:b0:5fb:c126:12c9 with SMTP id 4fb4d7f45d1cf-60fd349286emr215827a12.25.1751581411805;
        Thu, 03 Jul 2025 15:23:31 -0700 (PDT)
Received: from amikhalitsyn.lan ([178.24.219.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb1fb083sm355164a12.62.2025.07.03.15.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 15:23:31 -0700 (PDT)
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
Subject: [PATCH net-next v3 1/7] af_unix: rework unix_maybe_add_creds() to allow sleep
Date: Fri,  4 Jul 2025 00:23:05 +0200
Message-ID: <20250703222314.309967-2-aleksandr.mikhalitsyn@canonical.com>
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

