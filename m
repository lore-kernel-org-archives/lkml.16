Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DC629B771
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848590; cv=none; b=M3rTvRyMfy/BfPBRIUEUvJg+xoo/BG/VDbWNhs6tIx9q5fDc6aPLKSZOFfy8H+16Jgcu7HrL1kt6wSaw40/6HwbIO9idLKIG7+C6aI/twPSAtgfnT3iO9CkHVi/VjP8FpzJiuGmK/pc939U0wIfFhmpQB5orVztvPHOSWDUP65E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848590; c=relaxed/simple;
	bh=qp64HkQv5HFMCRIYtAzKaeG7Q1QgL1OG9joIRKxiMHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRg/5pD1ZEsBVaSweIYQaeJ29A3wmnSp1dEO9a9e0TtQH7pyC4QLOLiv9Ey33KM+d2rO4QFacvjw1zU6NUZ48NwXbtD5IcSR1coyQr7E2HHo1miLRss1LfhHQJDYnQceuY3ogZ3rZ/ofgBRq4AvVF9ub6Hl5lpn3uToJDq5BjLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Lb8AruGp; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Lb8AruGp"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso49622075e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750848583; x=1751453383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=938RBvOKkMLz01ouG4IA3nAqLNMwwYq7XL6uG8UD0tQ=;
        b=Lb8AruGpFlZe9YjqCN9SI0yvTkXlrB+CebGWAbSA1cOkz6XSrv3HXjYkFBuo4VCwc5
         PS+FHu4LGKnqibH7oyHiWCVn9XdA2s3DBoX/AH/JIM58a6nwPxX8sOhZXLGbeDVQ7Q/F
         JapC9LYjnDDdbN8PmJdTEfjbpeMYtEea3w5J7fOp9ouOr7vGLKyuYCEx/eZKDy4hcL4R
         KcRjF4GKud0FGqqUoM7m8nRo6xMAXfSY4Rz8pv8nAZ+clJZ+OeX6lZl/LRckkKF0zJxS
         mGyNUgAaVAM5hq3/NWmZKpcbmypGrsOGffcS6sVASKm6f3vPpB1jd5hIHMTDo1ZSSZDE
         Nduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848583; x=1751453383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=938RBvOKkMLz01ouG4IA3nAqLNMwwYq7XL6uG8UD0tQ=;
        b=MV8kOjWEr0iGgWX2ENACkh2EASQaHWXrC4/UMa297nddAtSs98UlZH78mWWdZMr5QM
         NCL5vVKOuT22IPwQ85r9kkLn6zWw23kty/qI1gYVXHMV0ngwbsbl//v6unYmN35ZxJr/
         0GPod6pClzylss6rhHeKM3/jHTGIDhTV0G5a1kgWf8Mmg42RFwTvbP4aJMmmqRYllt7Z
         kfEa4aC/xWSi63bEZLAvCMXOmoTHinzSl3ImAscs27C0hrAkz+zwwMUdWdTngaZnt2le
         i0xJknT2OT+B7/KUpFhydpFhXMpevdDJNAUVBRj/vE2E/JQbgS61eZg1cYwp1lhRSIcE
         I1zQ==
X-Gm-Message-State: AOJu0YzHLfAYQcjpKh8WBadzirxjdY863PhlulX2OPVZ/wqx8u/AdCto
	nwb4PKou+8y8GcVUzutrxN4HBa/Fxuy8NNUjlUmef81/AME9VZO+NwaxsGyzsJFk6k4xixNX3ES
	EsIO/uWI=
X-Gm-Gg: ASbGncsUEDxYCN9pdp7x3PNct8wSe/Kb84dI+YM2YZd1vJ9YYUDVWY1WZiQotMMI39i
	sEDPSnsqn2+riPVhXPFM1bzJ1hbakecLIltZCCu5cbD4VPHQLlvclckvelAOF3uOGOB3sRBWXgj
	Pq/loQFJyxF+h8NjfwSBKvWqUv9fTOhywMhnQqs41rhtoQO36h6ROwn3sVrp7DcnymEjcX4zxAR
	dP0mio5VxZC1/+2ESy3WMg3DoAlc4Jetxpto6lVio7bj7MvGxKpROkMjOwgmprx+BU8jdMMedtC
	IXLWxfCXonPn8Ez3ckKBnYX0MC8GbY4jH8FOdZqZ8r/dwpKwvWYmDqbo7F4JuabNvpPCG39UB43
	XdnLbv4PWsQ==
X-Google-Smtp-Source: AGHT+IHzaJ3NE4ipEitYFQJtazZeWjeoHzFh9Ry9Q5KqcWyHxy2xkWpVs/jsvbQ0zfmnm/bylTX8kQ==
X-Received: by 2002:a05:600c:5490:b0:453:81a:2f3f with SMTP id 5b1f17b1804b1-45381afa899mr26449085e9.30.1750848583362;
        Wed, 25 Jun 2025 03:49:43 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c49fsm16195055e9.7.2025.06.25.03.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:49:42 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v1 01/10] Workqueue: net: replace use of system_wq with system_percpu_wq
Date: Wed, 25 Jun 2025 12:49:25 +0200
Message-ID: <20250625104934.184753-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625104934.184753-1-marco.crivellari@suse.com>
References: <20250625104934.184753-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistentcy cannot be addressed without refactoring the API.

system_wq is a per-CPU worqueue, yet nothing in its name tells about that
CPU affinity constraint, which is very often not required by users.
Make it clear by adding a system_percpu_wq to all the network subsystem.

The old wq will be kept for a few release cylces.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
CC: "David S. Miller" <davem@davemloft.net>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
---
 net/bridge/br_cfm.c                 | 6 +++---
 net/bridge/br_mrp.c                 | 8 ++++----
 net/ceph/mon_client.c               | 2 +-
 net/core/skmsg.c                    | 2 +-
 net/devlink/core.c                  | 2 +-
 net/ipv4/inet_fragment.c            | 2 +-
 net/netfilter/nf_conntrack_ecache.c | 2 +-
 net/openvswitch/dp_notify.c         | 2 +-
 net/rfkill/input.c                  | 2 +-
 net/smc/smc_core.c                  | 2 +-
 net/vmw_vsock/af_vsock.c            | 2 +-
 11 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/net/bridge/br_cfm.c b/net/bridge/br_cfm.c
index a3c755d0a09d..c2c1c7d44c61 100644
--- a/net/bridge/br_cfm.c
+++ b/net/bridge/br_cfm.c
@@ -134,7 +134,7 @@ static void ccm_rx_timer_start(struct br_cfm_peer_mep *peer_mep)
 	 * of the configured CC 'expected_interval'
 	 * in order to detect CCM defect after 3.25 interval.
 	 */
-	queue_delayed_work(system_wq, &peer_mep->ccm_rx_dwork,
+	queue_delayed_work(system_percpu_wq, &peer_mep->ccm_rx_dwork,
 			   usecs_to_jiffies(interval_us / 4));
 }
 
@@ -285,7 +285,7 @@ static void ccm_tx_work_expired(struct work_struct *work)
 		ccm_frame_tx(skb);
 
 	interval_us = interval_to_us(mep->cc_config.exp_interval);
-	queue_delayed_work(system_wq, &mep->ccm_tx_dwork,
+	queue_delayed_work(system_percpu_wq, &mep->ccm_tx_dwork,
 			   usecs_to_jiffies(interval_us));
 }
 
@@ -809,7 +809,7 @@ int br_cfm_cc_ccm_tx(struct net_bridge *br, const u32 instance,
 	 * to send first frame immediately
 	 */
 	mep->ccm_tx_end = jiffies + usecs_to_jiffies(tx_info->period * 1000000);
-	queue_delayed_work(system_wq, &mep->ccm_tx_dwork, 0);
+	queue_delayed_work(system_percpu_wq, &mep->ccm_tx_dwork, 0);
 
 save:
 	mep->cc_ccm_tx_info = *tx_info;
diff --git a/net/bridge/br_mrp.c b/net/bridge/br_mrp.c
index fd2de35ffb3c..3c36fa24bc05 100644
--- a/net/bridge/br_mrp.c
+++ b/net/bridge/br_mrp.c
@@ -341,7 +341,7 @@ static void br_mrp_test_work_expired(struct work_struct *work)
 out:
 	rcu_read_unlock();
 
-	queue_delayed_work(system_wq, &mrp->test_work,
+	queue_delayed_work(system_percpu_wq, &mrp->test_work,
 			   usecs_to_jiffies(mrp->test_interval));
 }
 
@@ -418,7 +418,7 @@ static void br_mrp_in_test_work_expired(struct work_struct *work)
 out:
 	rcu_read_unlock();
 
-	queue_delayed_work(system_wq, &mrp->in_test_work,
+	queue_delayed_work(system_percpu_wq, &mrp->in_test_work,
 			   usecs_to_jiffies(mrp->in_test_interval));
 }
 
@@ -725,7 +725,7 @@ int br_mrp_start_test(struct net_bridge *br,
 	mrp->test_max_miss = test->max_miss;
 	mrp->test_monitor = test->monitor;
 	mrp->test_count_miss = 0;
-	queue_delayed_work(system_wq, &mrp->test_work,
+	queue_delayed_work(system_percpu_wq, &mrp->test_work,
 			   usecs_to_jiffies(test->interval));
 
 	return 0;
@@ -865,7 +865,7 @@ int br_mrp_start_in_test(struct net_bridge *br,
 	mrp->in_test_end = jiffies + usecs_to_jiffies(in_test->period);
 	mrp->in_test_max_miss = in_test->max_miss;
 	mrp->in_test_count_miss = 0;
-	queue_delayed_work(system_wq, &mrp->in_test_work,
+	queue_delayed_work(system_percpu_wq, &mrp->in_test_work,
 			   usecs_to_jiffies(in_test->interval));
 
 	return 0;
diff --git a/net/ceph/mon_client.c b/net/ceph/mon_client.c
index ab66b599ac47..c227ececa925 100644
--- a/net/ceph/mon_client.c
+++ b/net/ceph/mon_client.c
@@ -314,7 +314,7 @@ static void __schedule_delayed(struct ceph_mon_client *monc)
 		delay = CEPH_MONC_PING_INTERVAL;
 
 	dout("__schedule_delayed after %lu\n", delay);
-	mod_delayed_work(system_wq, &monc->delayed_work,
+	mod_delayed_work(system_percpu_wq, &monc->delayed_work,
 			 round_jiffies_relative(delay));
 }
 
diff --git a/net/core/skmsg.c b/net/core/skmsg.c
index 0ddc4c718833..83fc433f5461 100644
--- a/net/core/skmsg.c
+++ b/net/core/skmsg.c
@@ -855,7 +855,7 @@ void sk_psock_drop(struct sock *sk, struct sk_psock *psock)
 	sk_psock_stop(psock);
 
 	INIT_RCU_WORK(&psock->rwork, sk_psock_destroy);
-	queue_rcu_work(system_wq, &psock->rwork);
+	queue_rcu_work(system_percpu_wq, &psock->rwork);
 }
 EXPORT_SYMBOL_GPL(sk_psock_drop);
 
diff --git a/net/devlink/core.c b/net/devlink/core.c
index 7203c39532fc..58093f49c090 100644
--- a/net/devlink/core.c
+++ b/net/devlink/core.c
@@ -320,7 +320,7 @@ static void devlink_release(struct work_struct *work)
 void devlink_put(struct devlink *devlink)
 {
 	if (refcount_dec_and_test(&devlink->refcount))
-		queue_rcu_work(system_wq, &devlink->rwork);
+		queue_rcu_work(system_percpu_wq, &devlink->rwork);
 }
 
 struct devlink *devlinks_xa_find_get(struct net *net, unsigned long *indexp)
diff --git a/net/ipv4/inet_fragment.c b/net/ipv4/inet_fragment.c
index 470ab17ceb51..025895eb6ec5 100644
--- a/net/ipv4/inet_fragment.c
+++ b/net/ipv4/inet_fragment.c
@@ -183,7 +183,7 @@ static void fqdir_work_fn(struct work_struct *work)
 	rhashtable_free_and_destroy(&fqdir->rhashtable, inet_frags_free_cb, NULL);
 
 	if (llist_add(&fqdir->free_list, &fqdir_free_list))
-		queue_delayed_work(system_wq, &fqdir_free_work, HZ);
+		queue_delayed_work(system_percpu_wq, &fqdir_free_work, HZ);
 }
 
 int fqdir_init(struct fqdir **fqdirp, struct inet_frags *f, struct net *net)
diff --git a/net/netfilter/nf_conntrack_ecache.c b/net/netfilter/nf_conntrack_ecache.c
index af68c64acaab..81baf2082604 100644
--- a/net/netfilter/nf_conntrack_ecache.c
+++ b/net/netfilter/nf_conntrack_ecache.c
@@ -301,7 +301,7 @@ void nf_conntrack_ecache_work(struct net *net, enum nf_ct_ecache_state state)
 		net->ct.ecache_dwork_pending = true;
 	} else if (state == NFCT_ECACHE_DESTROY_SENT) {
 		if (!hlist_nulls_empty(&cnet->ecache.dying_list))
-			mod_delayed_work(system_wq, &cnet->ecache.dwork, 0);
+			mod_delayed_work(system_percpu_wq, &cnet->ecache.dwork, 0);
 		else
 			net->ct.ecache_dwork_pending = false;
 	}
diff --git a/net/openvswitch/dp_notify.c b/net/openvswitch/dp_notify.c
index 7af0cde8b293..a2af90ee99af 100644
--- a/net/openvswitch/dp_notify.c
+++ b/net/openvswitch/dp_notify.c
@@ -75,7 +75,7 @@ static int dp_device_event(struct notifier_block *unused, unsigned long event,
 
 		/* schedule vport destroy, dev_put and genl notification */
 		ovs_net = net_generic(dev_net(dev), ovs_net_id);
-		queue_work(system_wq, &ovs_net->dp_notify_work);
+		queue_work(system_percpu_wq, &ovs_net->dp_notify_work);
 	}
 
 	return NOTIFY_DONE;
diff --git a/net/rfkill/input.c b/net/rfkill/input.c
index 598d0a61bda7..53d286b10843 100644
--- a/net/rfkill/input.c
+++ b/net/rfkill/input.c
@@ -159,7 +159,7 @@ static void rfkill_schedule_global_op(enum rfkill_sched_op op)
 	rfkill_op_pending = true;
 	if (op == RFKILL_GLOBAL_OP_EPO && !rfkill_is_epo_lock_active()) {
 		/* bypass the limiter for EPO */
-		mod_delayed_work(system_wq, &rfkill_op_work, 0);
+		mod_delayed_work(system_percpu_wq, &rfkill_op_work, 0);
 		rfkill_last_scheduled = jiffies;
 	} else
 		rfkill_schedule_ratelimited();
diff --git a/net/smc/smc_core.c b/net/smc/smc_core.c
index ac07b963aede..ab870109f916 100644
--- a/net/smc/smc_core.c
+++ b/net/smc/smc_core.c
@@ -85,7 +85,7 @@ static void smc_lgr_schedule_free_work(struct smc_link_group *lgr)
 	 * otherwise there is a risk of out-of-sync link groups.
 	 */
 	if (!lgr->freeing) {
-		mod_delayed_work(system_wq, &lgr->free_work,
+		mod_delayed_work(system_percpu_wq, &lgr->free_work,
 				 (!lgr->is_smcd && lgr->role == SMC_CLNT) ?
 						SMC_LGR_FREE_DELAY_CLNT :
 						SMC_LGR_FREE_DELAY_SERV);
diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index fc6afbc8d680..f8798d7b5de7 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -1569,7 +1569,7 @@ static int vsock_connect(struct socket *sock, struct sockaddr *addr,
 			 * reschedule it, then ungrab the socket refcount to
 			 * keep it balanced.
 			 */
-			if (mod_delayed_work(system_wq, &vsk->connect_work,
+			if (mod_delayed_work(system_percpu_wq, &vsk->connect_work,
 					     timeout))
 				sock_put(sk);
 
-- 
2.49.0

