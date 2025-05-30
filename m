Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE08224225
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748597738; cv=none; b=mRrFxvfjCNaSchnkVkWxr3k7Z+fDKDSTu4kmSBd8HWz+O1qUvKd/v7LRRwX5BLoIZzzlzxjmGrRMvZyj/d75q3MiBNcUQ4m216jvZEqLuU1YOdUp1jhnfPU1tCyB1tDDzGDSG/ohp21FHQkw1p/ljPkHYsh9F5HBX8QM4j29qhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748597738; c=relaxed/simple;
	bh=Rt/SGj48eEmheWhl/pKyHYlndzSJCIR513AnD89nuEY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d2uFUAUI7TqbFHh6WPj/MoW5hQAzx1xwxJGTxuy9Yc5E0b7R/4aFoHHh8+W2YvSdSjepAJ1ztCbnajqCZlA1zEV6kbFkcGtPY8vjUS3EJYDblKAnPwNXMwH+eaNTmO80uskJnqBeSXR5wWwihWpO4/0XIk9uKgn0IobhfJlA3w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=KC7PSjPx; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="KC7PSjPx"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b26ee6be1ecso1251860a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1748597736; x=1749202536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQYeXWECBZU61mIlblKiCexij9wbxTcb3SJTjEcJrDE=;
        b=KC7PSjPx3y+5TbRZPN2v6pQ3ditZFyB/WcVnzDp3Ee3O22P/pUykeel1KcUWkUJiKT
         nhTuK9kvMmGUQDggJbaQe6VKWFwuqrN3UEsKUZxUueNbSXse/TdWkeX3Z0Vt2Nxqzhe0
         HqtvGc1AMocFIRLSXajgQ1k8PdrpFRhHZkI4cm/LWKhNr2oI2rLtAKjVQe89L756Kmmg
         cncPxK4OWdHhqGNLXqNzRIaaT8BEdoAPSpp8PnVplsrGlsehAxG7kiGY5jb0O2MULmG9
         RJoQS2VAgukjfRnHr82khH8CYVmj8yAHvb7AlO4XeARN+iAzEoZr+tcNN9pbJ1WuWv2S
         4x2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748597736; x=1749202536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQYeXWECBZU61mIlblKiCexij9wbxTcb3SJTjEcJrDE=;
        b=uf6s0YsNWTyrWFxKLN2FvzefccLA3K5l7UFVIEblG/H3OiuPGTlf4L2SysSxRmwPKC
         Z+JHeMVfSqEJg9Y+tVdx7YZCWDdOsoe405JG9ZZdvEIU30vmavCxMkTfXwjfaQO4eJJi
         k1RPaXkx0+9jQ1ehm+KFYCi/hUoFAR84MIO0Tw4nnKzdzfc+xcmVqWfjKNeSUdaednYD
         Rp6Fi53QqUq5ViAe0HVcqyU3RrndcjoX1cANauwsLd3IGqnVelO1AXIpSg3ABmpGmN6v
         PHfFyTsiJ2F+8Cmb7Gu/kfDzSe3EKvjEAsS2RyJZ0tJJ5WTsSfMcT+P3xMcFGRMVi8A7
         p8Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXUMC6C14LipX5ap6sFpTmeeNW86UUE0ia0tnUf59w3EELZL1fRXItydDuWDUGIGSgLHTatyfrg0r5sP3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YymoL8ieGkjrPfVTNBh9ZFQ0ASwpIOUxhw+GvmeMkeG4ydtIald
	JtW4t71I5buzDm8rMUnzGXkrvltEOAFg3JpMjIWNWhus7R2aSHmV/E+8fJViVZvhs/Q=
X-Gm-Gg: ASbGncsnrMKeB5TljicoRioFu0shRZrf9S+2FgPEzXsYPz4vVtFtOWesKH83RMS8mXs
	5z4tJyWbAKFMIJsC+PD3NVxXc3kwpePh28XUq22VMXUcQ02vu1dlp9HmRh6rXvzkW3v93h9U+uD
	xBCfJ01hx6oVl+erxfBMvuHQFr3mqLo0bdCYVmc0GtthPTReD+mF7pPaHk94AbowiTynLJzkOUK
	PgJbhd/3NJtRgaBoQuDxOlUXIebJxE60tGaOD/4aOQdupk8LwcB0CQVa8iG1usCYzB1zme/d4FH
	75ctTRzqMoA1lbYUf9gTGkp5saizwt5SPku6Wc9g8GG3qLwakz/1f5BV14Tpi8CbsAkkdmPjoYF
	LD+tJdaBARQ==
X-Google-Smtp-Source: AGHT+IG6nnxH2FVgtgvPODfS+5ObcESlWEhm+JqnaRiZqSXrOdJI4HZuM5tUxbidkIm+8B4kCWHa5w==
X-Received: by 2002:a17:90b:3c49:b0:312:ec:4123 with SMTP id 98e67ed59e1d1-3125036bb61mr2199095a91.13.1748597736482;
        Fri, 30 May 2025 02:35:36 -0700 (PDT)
Received: from FQ627FTG20.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e29f7b8sm838724a91.2.2025.05.30.02.35.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 May 2025 02:35:36 -0700 (PDT)
From: Bo Li <libo.gcs85@bytedance.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	luto@kernel.org,
	kees@kernel.org,
	akpm@linux-foundation.org,
	david@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	peterz@infradead.org
Cc: dietmar.eggemann@arm.com,
	hpa@zytor.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	jannh@google.com,
	pfalcato@suse.de,
	riel@surriel.com,
	harry.yoo@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	duanxiongchun@bytedance.com,
	yinhongbo@bytedance.com,
	dengliang.1214@bytedance.com,
	xieyongji@bytedance.com,
	chaiwen.cc@bytedance.com,
	songmuchun@bytedance.com,
	yuanzhu@bytedance.com,
	chengguozhu@bytedance.com,
	sunjiadong.lff@bytedance.com,
	Bo Li <libo.gcs85@bytedance.com>
Subject: [RFC v2 28/35] RPAL: add rpal_uds_fdmap() support
Date: Fri, 30 May 2025 17:27:56 +0800
Message-Id: <7d9d805dcfe80358c06f0a02fadd31a7288500b4.1748594841.git.libo.gcs85@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1748594840.git.libo.gcs85@bytedance.com>
References: <cover.1748594840.git.libo.gcs85@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For a UDS connection between a sender and a receiver, neither side knows
which file descriptor (fd) the other uses to manage the connection. The
sender cannot determine which user space fd's buffer in the receiver to
write data to, necessitating a complex process for both sides to inform
each other of fd mappings. This process incurs significant overhead when
managing a large number of connections, which requires optimization.

This patch introduces the RPAL_IOCTL_UDS_FDMAP interface, which simplifies
the establishment of fd mappings between sender and receiver processes for
files monitored by epoll. This avoids the need for a complex setup process
each time a new connection is created.

Signed-off-by: Bo Li <libo.gcs85@bytedance.com>
---
 arch/x86/rpal/internal.h |   3 +
 arch/x86/rpal/proc.c     | 117 +++++++++++++++++++++++++++++++++++++++
 fs/eventpoll.c           |  19 +++++++
 include/linux/rpal.h     |  11 ++++
 4 files changed, 150 insertions(+)

diff --git a/arch/x86/rpal/internal.h b/arch/x86/rpal/internal.h
index e49febce8645..e03f8a90619d 100644
--- a/arch/x86/rpal/internal.h
+++ b/arch/x86/rpal/internal.h
@@ -11,6 +11,7 @@
 
 #include <linux/mm.h>
 #include <linux/file.h>
+#include <net/af_unix.h>
 
 extern bool rpal_inited;
 
@@ -60,3 +61,5 @@ int rpal_alloc_pkey(struct rpal_service *rs, int pkey);
 int rpal_pkey_setup(struct rpal_service *rs, int pkey);
 void rpal_set_current_pkru(u32 val, int mode);
 void rpal_service_pku_init(void);
+
+extern struct sock *unix_peer_get(struct sock *sk);
diff --git a/arch/x86/rpal/proc.c b/arch/x86/rpal/proc.c
index 2f9cceec4992..b60c099c4a92 100644
--- a/arch/x86/rpal/proc.c
+++ b/arch/x86/rpal/proc.c
@@ -9,6 +9,8 @@
 #include <linux/rpal.h>
 #include <linux/proc_fs.h>
 #include <linux/poll.h>
+#include <net/sock.h>
+#include <net/af_unix.h>
 
 #include "internal.h"
 
@@ -34,6 +36,118 @@ static int rpal_get_api_version_and_cap(void __user *p)
 	return 0;
 }
 
+static void *rpal_uds_peer_data(struct sock *psk, int *pfd)
+{
+	void *ep = NULL;
+	unsigned long flags;
+	struct socket_wq *wq;
+	wait_queue_entry_t *entry;
+	wait_queue_head_t *whead;
+
+	rcu_read_lock();
+	wq = rcu_dereference(psk->sk_wq);
+	if (!skwq_has_sleeper(wq))
+		goto unlock_rcu;
+
+	whead = &wq->wait;
+
+	spin_lock_irqsave(&whead->lock, flags);
+	if (list_empty(&whead->head)) {
+		pr_debug("rpal debug: [%d] cannot find epitem entry\n",
+			 current->pid);
+		goto unlock_spin;
+	}
+	entry = list_first_entry(&whead->head, wait_queue_entry_t, entry);
+	*pfd = rpal_get_epitemfd(entry);
+	if (*pfd < 0) {
+		pr_debug("rpal debug: [%d] cannot find epitem fd\n",
+			 current->pid);
+		goto unlock_spin;
+	}
+	ep = rpal_get_epitemep(entry);
+
+unlock_spin:
+	spin_unlock_irqrestore(&whead->lock, flags);
+unlock_rcu:
+	rcu_read_unlock();
+	return ep;
+}
+
+static int rpal_find_receiver_rid(int id, void *ep)
+{
+	struct task_struct *tsk;
+	struct rpal_service *cur, *tgt;
+	int rid = -1;
+
+	cur = rpal_current_service();
+
+	tgt = rpal_get_mapped_service_by_id(cur, id);
+	if (tgt == NULL)
+		goto out;
+
+	for_each_thread(tgt->group_leader, tsk) {
+		if (!rpal_test_task_thread_flag(tsk, RPAL_RECEIVER_BIT))
+			continue;
+		if (tsk->rpal_rd->ep == ep) {
+			rid = tsk->rpal_rd->rcc->receiver_id;
+			break;
+		}
+	}
+
+	rpal_put_service(tgt);
+out:
+	return rid;
+}
+
+static long rpal_uds_fdmap(unsigned long uarg)
+{
+	struct rpal_uds_fdmap_arg arg;
+	struct socket *sock;
+	struct sock *peer_sk;
+	void *ep;
+	int sfd, rid;
+	struct fd f;
+	long res;
+	int ret;
+
+	ret = copy_from_user(&arg, (void __user *)uarg, sizeof(arg));
+	if (ret)
+		return ret;
+
+	f = fdget(arg.cfd);
+	if (!fd_file(f))
+		goto fd_put;
+
+	sock = sock_from_file(fd_file(f));
+	if (!sock)
+		goto fd_put;
+
+	peer_sk = unix_peer_get(sock->sk);
+	if (peer_sk == NULL)
+		goto fd_put;
+	ep = rpal_uds_peer_data(peer_sk, &sfd);
+	if (ep == NULL) {
+		pr_debug("rpal debug: [%d] cannot find epitem ep\n",
+			 current->pid);
+		goto peer_sock_put;
+	}
+	rid = rpal_find_receiver_rid(arg.service_id, ep);
+	if (rid < 0) {
+		pr_debug("rpal debug: [%d] rpal: cannot find epitem rid\n",
+			 current->pid);
+		goto peer_sock_put;
+	}
+	res = (long)rid << 32 | (long)sfd;
+	ret = put_user(res, arg.res);
+
+peer_sock_put:
+	sock_put(peer_sk);
+fd_put:
+	if (fd_file(f))
+		fdput(f);
+	return ret;
+}
+
 static long rpal_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
 	struct rpal_service *cur = rpal_current_service();
@@ -81,6 +195,9 @@ static long rpal_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		ret = put_user(cur->pkey, (int __user *)arg);
 		break;
 #endif
+	case RPAL_IOCTL_UDS_FDMAP:
+		ret = rpal_uds_fdmap(arg);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index 437cd5764c03..791321639561 100644
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@ -2143,6 +2143,25 @@ static int ep_poll(struct eventpoll *ep, struct epoll_event __user *events,
 }
 
 #ifdef CONFIG_RPAL
+void *rpal_get_epitemep(wait_queue_entry_t *wait)
+{
+	struct epitem *epi = ep_item_from_wait(wait);
+
+	if (!epi)
+		return NULL;
+
+	return epi->ep;
+}
+
+int rpal_get_epitemfd(wait_queue_entry_t *wait)
+{
+	struct epitem *epi = ep_item_from_wait(wait);
+
+	if (!epi)
+		return -1;
+
+	return epi->ffd.fd;
+}
 
 void rpal_resume_ep(struct task_struct *tsk)
 {
diff --git a/include/linux/rpal.h b/include/linux/rpal.h
index 5912ffec6e28..7657e6c6393b 100644
--- a/include/linux/rpal.h
+++ b/include/linux/rpal.h
@@ -350,6 +350,12 @@ struct rpal_sender_data {
 	struct task_struct *receiver;
 };
 
+struct rpal_uds_fdmap_arg {
+	int service_id;
+	int cfd;
+	unsigned long *res;
+};
+
 enum rpal_command_type {
 	RPAL_CMD_GET_API_VERSION_AND_CAP,
 	RPAL_CMD_GET_SERVICE_KEY,
@@ -363,6 +369,7 @@ enum rpal_command_type {
 	RPAL_CMD_REQUEST_SERVICE,
 	RPAL_CMD_RELEASE_SERVICE,
 	RPAL_CMD_GET_SERVICE_PKEY,
+	RPAL_CMD_UDS_FDMAP,
 	RPAL_NR_CMD,
 };
 
@@ -393,6 +400,8 @@ enum rpal_command_type {
 	_IOWR(RPAL_IOCTL_MAGIC, RPAL_CMD_RELEASE_SERVICE, unsigned long)
 #define RPAL_IOCTL_GET_SERVICE_PKEY \
 	_IOWR(RPAL_IOCTL_MAGIC, RPAL_CMD_GET_SERVICE_PKEY, int *)
+#define RPAL_IOCTL_UDS_FDMAP \
+	_IOWR(RPAL_IOCTL_MAGIC, RPAL_CMD_UDS_FDMAP, unsigned long)
 
 #define rpal_for_each_requested_service(rs, idx)                             \
 	for (idx = find_first_bit(rs->requested_service_bitmap, RPAL_NR_ID); \
@@ -594,5 +603,7 @@ int rpal_ep_autoremove_wake_function(wait_queue_entry_t *curr,
 	unsigned int mode, int wake_flags,
 	void *key);
 void rpal_resume_ep(struct task_struct *tsk);
+void *rpal_get_epitemep(wait_queue_entry_t *wait);
+int rpal_get_epitemfd(wait_queue_entry_t *wait);
 int rpal_try_send_events(void *ep, struct rpal_receiver_call_context *rcc);
 #endif
-- 
2.20.1

