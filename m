Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6C926A1CD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359283; cv=none; b=q5373mGI6DKF1oO0Z34SPAwP8WGo0vp857d+CWaUHrSfVBWgjdXUPnisrhjc8aW7P4CG7XHRyIskw/O/TMwQ2ZAGzcts4yhkS9PpSMue0EE9EQvjuM1UNO7EG03mFUeK9jGQatdut0WNDXp36ne/LRxVGgv8dStPCsjx7Uu1PdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359283; c=relaxed/simple;
	bh=0akAzRxqSABVbwmPSbSZyQpcu7BC6CCroLhbO1qikaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R8BTUa+najpvry/mfIt9pkzHwLOIzWM4HKtu6wcxDO6MyQTOUMXW2TqMcxD+sJ7C159Y9Mh6SZCBLfvPUZuMxeRqEtsifK0fnQ1iWg7jkVCLBk7Ls6AoalvgU9sT3vEKe4Mage6Sh+QAlCi/GFiXKCfDTPSPcmdNyUXPoh5YNzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=jOwu7N7P; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="jOwu7N7P"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8BA473FE1F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751359279;
	bh=6bRqWysSzHy3p2i0Lb/Op5tY8kYpY7PeuWK0tpwD9t4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=jOwu7N7PKYhRnSqNoRoIiq0nTzm134ezHpMyYsXT5jkOyDZJ0TlSJcQlj+L9h+Dg2
	 eYVmsWMWYO3Azqxo+DqBnK0fpDWZdvtRrifjZmxsr3T9YqgqSESYDgk3ACoAZYVG+K
	 NxnCo6h7/3EXbzRBJ4vv7mQgfipWz9g9aJHLYLNeNHtPiXKGF1uJ9Ezf1fcN1JQLmr
	 FtbP9gtt67cTSiIHp1IMPX1fpEismFKhMGc4Lo8JC+zMDzF6JZM+Z81i8is/KWx7Ka
	 iOhpSaNX5KNqp2FPFZoBjh3o7wHrBw5P8WlqrInTWk6IYCwfyZywwlFr2+1+yp2qSj
	 ZzXy6zTrj3tJA==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ade5b98537dso275686766b.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 01:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751359279; x=1751964079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6bRqWysSzHy3p2i0Lb/Op5tY8kYpY7PeuWK0tpwD9t4=;
        b=ANWX8aeQX92p3X/CHY43KhrZuF3VVSsJ9EaV4UEYE347zPu9Sowz8vVRwnFi7Kx/1b
         oywTc0hYEkQ0Towj7fT+kuu0E1rBLDXREnXl4GvPVp1RRG77fYsBkxvFDHaKJi5WO7wm
         NbR/yOXv/PHT4QkVJC/wP53MV49zL0+WikpJ8qJAJSaVhJiu0RSZRqhwI0H2pXnaNRe9
         Tlf8xqIsmIYP4HuyThvKQF14N6Fw3ZM4ce1eRmXDIaL4HA7i8X6PnBvoc7XDswUDrMdm
         AfPKdbeNG8tvpDsewEtZPSP//WPYiOojO0jlAxECwSmnQ26qDnOcnwmgBpLEYGpo2TIv
         5VkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiUMNhS6K5o6ntNsSqUWsVFjJPrqfhhIxgxmB0aPQBCOAFVED5jSLypFQxYEKO9m8q45R70teiLkcZnlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YybJ4G3McRzBF0BsuUFdXTrf2afocMmraOPl/VzTpDr3p4Esmf+
	LcuvjGMbHC3ReL7NoAKPuBhbwdAHjTlw3I/zoVDLoODTZYpDeGp2Z+uZ9gE11NRj9OgSd/7vdMt
	TIxF3TNpEA2Wsxs13kV+0kyY/RCJIP9tGgaAmJ/eCP/Waepvz29pZ+Eq3MvItyUi1LYfh5PGp4Z
	6WQoLGmQ==
X-Gm-Gg: ASbGncv2Auq4irsc8htyMArVRfJLA9MC0SvqepGwMD/cuemrr6NpZcrgiOgY8Bk8ACL
	o07NBLnpFgIyWonhnOoeLDlCyA44j4bi0gmgxEbBZrzMZYvk464KP062t3chItpFyi/WxdHXU/i
	yd5slpyvL+10u1GKjAJ0ApuxUFvSnXbOiZytu6CKjb3QLmzZaIxKAXROpP4g1mL0jcy++4RGrN7
	dP/hk4W6+JIfGYyiwTeJixsstwR9ImqFVlT+xtbmNEla2SgFuWGZ3/Mvc0J+EWkbq7TncGsnQfM
	LEJsVfLrpKSTMcbjdvwg9qyPDN5RjOsfmONqNKga56+JXAFStQ==
X-Received: by 2002:a17:906:d7d8:b0:ae0:ce59:5952 with SMTP id a640c23a62f3a-ae35022a01fmr1393446566b.60.1751359278855;
        Tue, 01 Jul 2025 01:41:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVSKnOX/bJZRqAewogJx3Ti3Do04ydXpz2fF9gVxLvqDFndxPHqMizto+aqZ+cPRud7HQo1w==
X-Received: by 2002:a17:906:d7d8:b0:ae0:ce59:5952 with SMTP id a640c23a62f3a-ae35022a01fmr1393443866b.60.1751359278381;
        Tue, 01 Jul 2025 01:41:18 -0700 (PDT)
Received: from amikhalitsyn.lan ([178.24.219.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm812427166b.28.2025.07.01.01.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 01:41:17 -0700 (PDT)
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
Subject: [PATCH net-next v2 4/6] af_unix: stash pidfs dentry when needed
Date: Tue,  1 Jul 2025 10:39:17 +0200
Message-ID: <20250701083922.97928-9-aleksandr.mikhalitsyn@canonical.com>
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
- [scm_send()] force_creds is true. Netlink case.

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
---
 include/net/scm.h  | 32 ++++++++++++++++++++++++--------
 net/core/scm.c     |  6 ++++++
 net/unix/af_unix.c | 33 +++++++++++++++++++++++++++++----
 3 files changed, 59 insertions(+), 12 deletions(-)

diff --git a/include/net/scm.h b/include/net/scm.h
index 84c4707e78a5..597a40779269 100644
--- a/include/net/scm.h
+++ b/include/net/scm.h
@@ -8,6 +8,7 @@
 #include <linux/file.h>
 #include <linux/security.h>
 #include <linux/pid.h>
+#include <linux/pidfs.h>
 #include <linux/nsproxy.h>
 #include <linux/sched/signal.h>
 #include <net/compat.h>
@@ -66,19 +67,28 @@ static __inline__ void unix_get_peersec_dgram(struct socket *sock, struct scm_co
 { }
 #endif /* CONFIG_SECURITY_NETWORK */
 
-static __inline__ void scm_set_cred(struct scm_cookie *scm,
-				    struct pid *pid, kuid_t uid, kgid_t gid)
+static inline int scm_set_cred(struct scm_cookie *scm,
+			       struct pid *pid, bool pidfs_register,
+			       kuid_t uid, kgid_t gid)
 {
-	scm->pid  = get_pid(pid);
+	if (pidfs_register) {
+		int err = pidfs_register_pid(pid);
+		if (err)
+			return err;
+	}
+
+	scm->pid = get_pid(pid);
+
 	scm->creds.pid = pid_vnr(pid);
 	scm->creds.uid = uid;
 	scm->creds.gid = gid;
+	return 0;
 }
 
 static __inline__ void scm_destroy_cred(struct scm_cookie *scm)
 {
 	put_pid(scm->pid);
-	scm->pid  = NULL;
+	scm->pid = NULL;
 }
 
 static __inline__ void scm_destroy(struct scm_cookie *scm)
@@ -88,14 +98,20 @@ static __inline__ void scm_destroy(struct scm_cookie *scm)
 		__scm_destroy(scm);
 }
 
-static __inline__ int scm_send(struct socket *sock, struct msghdr *msg,
-			       struct scm_cookie *scm, bool forcecreds)
+static inline int scm_send(struct socket *sock, struct msghdr *msg,
+			   struct scm_cookie *scm, bool forcecreds)
 {
 	memset(scm, 0, sizeof(*scm));
 	scm->creds.uid = INVALID_UID;
 	scm->creds.gid = INVALID_GID;
-	if (forcecreds)
-		scm_set_cred(scm, task_tgid(current), current_uid(), current_gid());
+
+	if (forcecreds) {
+		int err = scm_set_cred(scm, task_tgid(current), true,
+				       current_uid(), current_gid());
+		if (err)
+			return err;
+	}
+
 	unix_get_peersec_dgram(sock, scm);
 	if (msg->msg_controllen <= 0)
 		return 0;
diff --git a/net/core/scm.c b/net/core/scm.c
index 68441c024dd8..50dfec6f8a2b 100644
--- a/net/core/scm.c
+++ b/net/core/scm.c
@@ -147,9 +147,15 @@ EXPORT_SYMBOL(__scm_destroy);
 
 static inline int __scm_replace_pid(struct scm_cookie *scm, struct pid *pid)
 {
+	int err;
+
 	/* drop all previous references */
 	scm_destroy_cred(scm);
 
+	err = pidfs_register_pid(pid);
+	if (err)
+		return err;
+
 	scm->pid = pid;
 	scm->creds.pid = pid_vnr(pid);
 	return 0;
diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index df2174d9904d..18c677683ddc 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -1924,12 +1924,27 @@ static void unix_peek_fds(struct scm_cookie *scm, struct sk_buff *skb)
 	scm->fp = scm_fp_dup(UNIXCB(skb).fp);
 }
 
+static int unix_set_pid_to_skb(struct sk_buff *skb, struct pid *pid, bool pidfs_register)
+{
+	if (pidfs_register) {
+		int err;
+
+		err = pidfs_register_pid(pid);
+		if (err)
+			return err;
+	}
+
+	UNIXCB(skb).pid = get_pid(pid);
+	return 0;
+}
+
 static void unix_destruct_scm(struct sk_buff *skb)
 {
 	struct scm_cookie scm;
 
 	memset(&scm, 0, sizeof(scm));
-	scm.pid  = UNIXCB(skb).pid;
+	scm.pid = UNIXCB(skb).pid;
+
 	if (UNIXCB(skb).fp)
 		unix_detach_fds(&scm, skb);
 
@@ -1943,7 +1958,10 @@ static int unix_scm_to_skb(struct scm_cookie *scm, struct sk_buff *skb, bool sen
 {
 	int err = 0;
 
-	UNIXCB(skb).pid = get_pid(scm->pid);
+	err = unix_set_pid_to_skb(skb, scm->pid, false);
+	if (unlikely(err))
+		return err;
+
 	UNIXCB(skb).uid = scm->creds.uid;
 	UNIXCB(skb).gid = scm->creds.gid;
 	UNIXCB(skb).fp = NULL;
@@ -1957,7 +1975,8 @@ static int unix_scm_to_skb(struct scm_cookie *scm, struct sk_buff *skb, bool sen
 
 static void unix_skb_to_scm(struct sk_buff *skb, struct scm_cookie *scm)
 {
-	scm_set_cred(scm, UNIXCB(skb).pid, UNIXCB(skb).uid, UNIXCB(skb).gid);
+	/* scm_set_cred() can't fail when pidfs_register == false */
+	scm_set_cred(scm, UNIXCB(skb).pid, false, UNIXCB(skb).uid, UNIXCB(skb).gid);
 	unix_set_secdata(scm, skb);
 }
 
@@ -1971,6 +1990,7 @@ static void unix_skb_to_scm(struct sk_buff *skb, struct scm_cookie *scm)
  * We include credentials if source or destination socket
  * asserted SOCK_PASSCRED.
  *
+ * Context: May sleep.
  * Return: On success zero, on error a negative error code is returned.
  */
 static int unix_maybe_add_creds(struct sk_buff *skb, const struct sock *sk,
@@ -1980,7 +2000,12 @@ static int unix_maybe_add_creds(struct sk_buff *skb, const struct sock *sk,
 		return 0;
 
 	if (unix_may_passcred(sk) || unix_may_passcred(other)) {
-		UNIXCB(skb).pid = get_pid(task_tgid(current));
+		int err;
+
+		err = unix_set_pid_to_skb(skb, task_tgid(current), true);
+		if (unlikely(err))
+			return err;
+
 		current_uid_gid(&UNIXCB(skb).uid, &UNIXCB(skb).gid);
 	}
 
-- 
2.43.0

