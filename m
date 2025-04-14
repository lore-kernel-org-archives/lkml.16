Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D511A0739
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626203; cv=none; b=GFlYYiVMsG9zr2zC2RX+qg2DYueVd39KX38Pdf6ZsrBaFJiQjAYZKDpbtotjpojIkiYT3bpAJjVraxkZMTV8XY1mOrE5EyIp/G31GRVUs0l2CFnAadulJL7eC56zZI1Tfv6vy24X2q65yjPAE6IdSOSnx1Vhk9pcmtXMDxzST38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626203; c=relaxed/simple;
	bh=eY9e/+8sIGasw77ahezlLOQ1XbqcfQsGaisj07DhiKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Et3JuZedONv+kjkuVJsMM/w1tqt0BcgjIv3pRoEAOoJ6gTYnZvqo67KsZbnGRKo16Cb2MsO16w7h2VgkLpZF97F7tDVuc8xNwJGSsHweQoBjRCzYmQcV0Ok5ep+yyNSSOpqzqRT5y0u05GV8bKjvGkLi+TGgRVv2fRnl40+PJoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MZhUF+aB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MZhUF+aB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 462F5C4CEE2;
	Mon, 14 Apr 2025 10:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744626203;
	bh=eY9e/+8sIGasw77ahezlLOQ1XbqcfQsGaisj07DhiKk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MZhUF+aBvOuySgobC43kQY3bMJbRcz+9TO/cv87tp+4qsd3v9KQSD0YoaSJ+t6jKG
	 mVhdMyATSbsEs9YJspIsZpYeh1tJxh64jAALZboG1kHA0wLoP2aE9iKN9EHvfpo+9h
	 GcyQB7ewahuGY/cX0BbDZiA3JtPcAk7/gKhlMC2urVaOhpfq7B+0C4DJOaHRCAAv0u
	 /RK1dev/ew8dVZE32HUwAaH47QWd5nxFQL5/5swnQdSlWZNHDsC5mFXIOBTmXjWgft
	 AZfUMS7DyTOiuH5YrBH841d403AoSEIq8RiPCN/KDCHyZLQk1h3cqYx3tRz2T6Q/wb
	 jZyc+tyhvkf5w==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 06/17] treewide, timers: Rename mod_timer_pending() => timer_mod_pending()
Date: Mon, 14 Apr 2025 12:22:40 +0200
Message-ID: <20250414102301.332225-7-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250414102301.332225-1-mingo@kernel.org>
References: <20250414102301.332225-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move this API to the canonical timer_*() namespace.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 drivers/dma/ioat/dma.c                 | 6 +++---
 drivers/net/xen-netback/xenbus.c       | 2 +-
 include/linux/timer.h                  | 2 +-
 kernel/time/timer.c                    | 8 ++++----
 net/ipv4/inet_timewait_sock.c          | 2 +-
 net/ipv4/tcp_minisocks.c               | 2 +-
 net/netfilter/ipvs/ip_vs_conn.c        | 4 ++--
 net/netfilter/nf_conntrack_h323_main.c | 2 +-
 net/netfilter/nf_conntrack_sip.c       | 2 +-
 9 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/dma/ioat/dma.c b/drivers/dma/ioat/dma.c
index d29f1b55ba8b..f5f5f221db42 100644
--- a/drivers/dma/ioat/dma.c
+++ b/drivers/dma/ioat/dma.c
@@ -656,7 +656,7 @@ static void __ioat_cleanup(struct ioatdma_chan *ioat_chan, dma_addr_t phys_compl
 	if (active - i == 0) {
 		dev_dbg(to_dev(ioat_chan), "%s: cancel completion timeout\n",
 			__func__);
-		mod_timer_pending(&ioat_chan->timer, jiffies + IDLE_TIMEOUT);
+		timer_mod_pending(&ioat_chan->timer, jiffies + IDLE_TIMEOUT);
 	}
 
 	/* microsecond delay by sysfs variable  per pending descriptor */
@@ -682,7 +682,7 @@ static void ioat_cleanup(struct ioatdma_chan *ioat_chan)
 
 		if (chanerr &
 		    (IOAT_CHANERR_HANDLE_MASK | IOAT_CHANERR_RECOVER_MASK)) {
-			mod_timer_pending(&ioat_chan->timer, jiffies + IDLE_TIMEOUT);
+			timer_mod_pending(&ioat_chan->timer, jiffies + IDLE_TIMEOUT);
 			ioat_eh(ioat_chan);
 		}
 	}
@@ -879,7 +879,7 @@ static void check_active(struct ioatdma_chan *ioat_chan)
 	}
 
 	if (test_and_clear_bit(IOAT_CHAN_ACTIVE, &ioat_chan->state))
-		mod_timer_pending(&ioat_chan->timer, jiffies + IDLE_TIMEOUT);
+		timer_mod_pending(&ioat_chan->timer, jiffies + IDLE_TIMEOUT);
 }
 
 static void ioat_reboot_chan(struct ioatdma_chan *ioat_chan)
diff --git a/drivers/net/xen-netback/xenbus.c b/drivers/net/xen-netback/xenbus.c
index a78a25b87240..28ec3c607c7c 100644
--- a/drivers/net/xen-netback/xenbus.c
+++ b/drivers/net/xen-netback/xenbus.c
@@ -535,7 +535,7 @@ static void xen_net_rate_changed(struct xenbus_watch *watch,
 
 		queue->credit_bytes = credit_bytes;
 		queue->credit_usec = credit_usec;
-		if (!mod_timer_pending(&queue->credit_timeout, jiffies) &&
+		if (!timer_mod_pending(&queue->credit_timeout, jiffies) &&
 			queue->remaining_credit > queue->credit_bytes) {
 			queue->remaining_credit = queue->credit_bytes;
 		}
diff --git a/include/linux/timer.h b/include/linux/timer.h
index c39a0df72407..c35cf0c16095 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -149,7 +149,7 @@ static inline int timer_pending(const struct timer_list * timer)
 
 extern void add_timer_on(struct timer_list *timer, int cpu);
 extern int mod_timer(struct timer_list *timer, unsigned long expires);
-extern int mod_timer_pending(struct timer_list *timer, unsigned long expires);
+extern int timer_mod_pending(struct timer_list *timer, unsigned long expires);
 extern int timer_reduce(struct timer_list *timer, unsigned long expires);
 
 /*
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 3fd0b13c0b74..778c4b6e07c4 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -1184,11 +1184,11 @@ __mod_timer(struct timer_list *timer, unsigned long expires, unsigned int option
 }
 
 /**
- * mod_timer_pending - Modify a pending timer's timeout
+ * timer_mod_pending - Modify a pending timer's timeout
  * @timer:	The pending timer to be modified
  * @expires:	New absolute timeout in jiffies
  *
- * mod_timer_pending() is the same for pending timers as mod_timer(), but
+ * timer_mod_pending() is the same for pending timers as mod_timer(), but
  * will not activate inactive timers.
  *
  * If @timer->function == NULL then the start operation is silently
@@ -1199,11 +1199,11 @@ __mod_timer(struct timer_list *timer, unsigned long expires, unsigned int option
  *	  shutdown state and the operation was discarded
  * * %1 - The timer was active and requeued to expire at @expires
  */
-int mod_timer_pending(struct timer_list *timer, unsigned long expires)
+int timer_mod_pending(struct timer_list *timer, unsigned long expires)
 {
 	return __mod_timer(timer, expires, MOD_TIMER_PENDING_ONLY);
 }
-EXPORT_SYMBOL(mod_timer_pending);
+EXPORT_SYMBOL(timer_mod_pending);
 
 /**
  * mod_timer - Modify a timer's timeout
diff --git a/net/ipv4/inet_timewait_sock.c b/net/ipv4/inet_timewait_sock.c
index 2f75c2e73aac..663a4a915a54 100644
--- a/net/ipv4/inet_timewait_sock.c
+++ b/net/ipv4/inet_timewait_sock.c
@@ -303,7 +303,7 @@ void __inet_twsk_schedule(struct inet_timewait_sock *tw, int timeo, bool rearm)
 		BUG_ON(mod_timer(&tw->tw_timer, jiffies + timeo));
 		refcount_inc(&tw->tw_dr->tw_refcount);
 	} else {
-		mod_timer_pending(&tw->tw_timer, jiffies + timeo);
+		timer_mod_pending(&tw->tw_timer, jiffies + timeo);
 	}
 }
 EXPORT_SYMBOL_GPL(__inet_twsk_schedule);
diff --git a/net/ipv4/tcp_minisocks.c b/net/ipv4/tcp_minisocks.c
index fb9349be36b8..e7c46dea7a88 100644
--- a/net/ipv4/tcp_minisocks.c
+++ b/net/ipv4/tcp_minisocks.c
@@ -728,7 +728,7 @@ struct sock *tcp_check_req(struct sock *sk, struct sk_buff *skb,
 
 			expires += reqsk_timeout(req, TCP_RTO_MAX);
 			if (!fastopen)
-				mod_timer_pending(&req->rsk_timer, expires);
+				timer_mod_pending(&req->rsk_timer, expires);
 			else
 				req->rsk_timer.expires = expires;
 		}
diff --git a/net/netfilter/ipvs/ip_vs_conn.c b/net/netfilter/ipvs/ip_vs_conn.c
index 44b2ad695c15..6e13e8dba00b 100644
--- a/net/netfilter/ipvs/ip_vs_conn.c
+++ b/net/netfilter/ipvs/ip_vs_conn.c
@@ -925,12 +925,12 @@ static void ip_vs_conn_expire(struct timer_list *t)
  */
 void ip_vs_conn_expire_now(struct ip_vs_conn *cp)
 {
-	/* Using mod_timer_pending will ensure the timer is not
+	/* Using timer_mod_pending will ensure the timer is not
 	 * modified after the final del_timer in ip_vs_conn_expire.
 	 */
 	if (timer_pending(&cp->timer) &&
 	    time_after(cp->timer.expires, jiffies))
-		mod_timer_pending(&cp->timer, jiffies);
+		timer_mod_pending(&cp->timer, jiffies);
 }
 
 
diff --git a/net/netfilter/nf_conntrack_h323_main.c b/net/netfilter/nf_conntrack_h323_main.c
index 14f73872f647..ad887033cba8 100644
--- a/net/netfilter/nf_conntrack_h323_main.c
+++ b/net/netfilter/nf_conntrack_h323_main.c
@@ -1396,7 +1396,7 @@ static int process_rcf(struct sk_buff *skb, struct nf_conn *ct,
 				 "timeout to %u seconds for",
 				 info->timeout);
 			nf_ct_dump_tuple(&exp->tuple);
-			mod_timer_pending(&exp->timeout,
+			timer_mod_pending(&exp->timeout,
 					  jiffies + info->timeout * HZ);
 		}
 		spin_unlock_bh(&nf_conntrack_expect_lock);
diff --git a/net/netfilter/nf_conntrack_sip.c b/net/netfilter/nf_conntrack_sip.c
index ca748f8dbff1..b11d1815bc4d 100644
--- a/net/netfilter/nf_conntrack_sip.c
+++ b/net/netfilter/nf_conntrack_sip.c
@@ -815,7 +815,7 @@ static int refresh_signalling_expectation(struct nf_conn *ct,
 		    exp->tuple.dst.protonum != proto ||
 		    exp->tuple.dst.u.udp.port != port)
 			continue;
-		if (mod_timer_pending(&exp->timeout, jiffies + expires * HZ)) {
+		if (timer_mod_pending(&exp->timeout, jiffies + expires * HZ)) {
 			exp->flags &= ~NF_CT_EXPECT_INACTIVE;
 			found = 1;
 			break;
-- 
2.45.2

