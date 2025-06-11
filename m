Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DCC286425
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749647704; cv=none; b=eUmfTK1Q6JfQo9xEPloOzRz2ikztqcuiwloAcIGkqEKwjWqDuLTfYrXm8q+asTYxQqQdJ7e7iMMXqEz2HlKLnVgPWspB6dobKyNKSMQU7fo573LHh3n9I4LUkd1HTdGL6s7sHjEEw1ZBi4PsOqcKKaa/r7blE1qhZ7S8iPzpi6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749647704; c=relaxed/simple;
	bh=/RZoCIGoSi4gETpSr/PcdDcmoxWz7d8E/znaBnCli6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t7vHE/Duj6PttLnWU40UBxk8gv7qwbC8Ibifaslbmd6Ntl7NTABSIuzxyJxfITlqD6YE7AqKXA5uGgrxJiOF1qXY+NWYo8hOEn2uYgcTOme4LziSRs670BMelIEXAJyS1Wv4cw75OAKlLoshjwJXxuJJhHOpn5mHGRNrrRM+6nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KwXksWc7; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KwXksWc7"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a361b8a664so5395702f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749647700; x=1750252500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGKIiLViVVs14fsC9KA3UWmxFnbtpPuLlaOh+xd7a6U=;
        b=KwXksWc78/x4ACfTrgP+j9uaTg9wuhyw56sJz8ZqDmgrjhNztJDEkj2NvguwOZQYWF
         ZDc80E84MQ7idB9KS/WLPZhwvKXHLhu9kgJT7nSgCA3yuxT/AZ6Vfdi9S2fpFHCo/PmV
         QNDY35ITfDSELGjSuCxKNQ0oUDdX+poXzRrwblPNQkcXynjUIqA+Big8Yd/pecjMUb86
         iCKRUEqgPepUeVPiL+asT7kQMmeyaT2GX0nocWYiFYOcJ92u9tK911+XlB+5Gtkw1Shw
         auDb0ILjG3NtFsMDmHZ19lAh2kTju5Qbr70absVIoY2I9jB9IcIFpfxWfQB0CG1ls6Xh
         nwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749647700; x=1750252500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGKIiLViVVs14fsC9KA3UWmxFnbtpPuLlaOh+xd7a6U=;
        b=rKEpzaTuy7ZBEUEnGtXPqwk5FscrGyGJjvRXZUKda99VneFLNbPdGE7i7K90ch7rVR
         SVmQDGIXDN0VnP69pw4ZCEqYeo7P/Oyz5GbDXnY2yVLdBbSX7ZRFr3VECZ3vZi1VBYmp
         lEUGg1b8jZEEnPizWhvMsVw58z+HqzgJApN3kFBHfMuZOvVXIU4EyQlJIYkpD5zWlVro
         Z95rUfwRr9iCnxsAieqjgLOwGW0aX9XiCs9lqqEKIllsXpt38BKtGHVLbFaODJsZYgyB
         S8c/D58ISdWlJjJM6r1o5IYNaFSiWA63gBT8jYHWNJ1rUBBRoKp8k2U6d35ecE5epu6a
         sXBA==
X-Gm-Message-State: AOJu0Yy3HDlp1yUdn4+roGfrJAF3LvK61vsskSNPbEdxgFWv3VLE/66x
	h62m/RcMgqTjRjpbZhfq8tXTx/eqEkw/Vgysy8UVeBd/6jSsLqh0mKRtqjHGdEisYTxLdHN+cnj
	x7VH0KF0=
X-Gm-Gg: ASbGncthpTv4uzPL7bANoJp5fqe/NbA/qJbBvPSf+vB+Af49xwUPQE/GIoNirEqqtOc
	lXie0iEMGcmNVzUABfgLMmZ8P+BFMjHEL6eSZIZ79PKgNWV6YcO5Ba0ObECiBgcOjbTOwy9ORpb
	GDzPF0DslF3wPPmwEr6q1ie+qfumsy4AAjzpZC1NpDAbPVbOazTvyBFm599opsGT+WpfRjaIBid
	5Jv/MGftUJbG/rbbdWCJJDuxwnTrKNcAA0siiu6xCXNfjGYWIHyDHgcsHXSG4IkVKfXViv58bdi
	Sow4CPNHWm/JeuBGoAGvVGA7mH1FAyiK8s3PUry3PhmKgr6obzDleGfpTvB3fKLp5cG/+IGPzII
	z
X-Google-Smtp-Source: AGHT+IFuynIFklonVCKhZFBuIZ0a4QzbF/BF3STzvIyyyCsCxMGuV8mb6dtljeM4gv0mWmV/al4mPg==
X-Received: by 2002:a5d:584e:0:b0:3a5:52cc:5e29 with SMTP id ffacd0b85a97d-3a5586dcd10mr2805144f8f.7.1749647700464;
        Wed, 11 Jun 2025 06:15:00 -0700 (PDT)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323b67ccsm15300103f8f.40.2025.06.11.06.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:14:59 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v3 5/9] Workqueue: net: WQ_PERCPU added to alloc_workqueue users
Date: Wed, 11 Jun 2025 15:14:34 +0200
Message-ID: <20250611131438.651493-6-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611131438.651493-1-marco.crivellari@suse.com>
References: <20250611131438.651493-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.
This lack of consistentcy cannot be addressed without refactoring the API.

alloc_workqueue() treats all queues as per-CPU by default, while unbound
workqueues must opt-in via WQ_UNBOUND.

This default is suboptimal: most workloads benefit from unbound queues,
allowing the scheduler to place worker threads where they’re needed and
reducing noise when CPUs are isolated.

This patch adds a new WQ_PERCPU flag at the network subsystem, to explicitly
request the use of the per-CPU behavior. Both flags coexist for one release
cycle to allow callers to transition their calls.

Once migration is complete, WQ_UNBOUND can be removed and unbound will
become the implicit default.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU.

All existing users have been updated accordingly.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 net/ceph/messenger.c             | 3 ++-
 net/core/sock_diag.c             | 2 +-
 net/rds/ib_rdma.c                | 3 ++-
 net/rxrpc/rxperf.c               | 2 +-
 net/smc/af_smc.c                 | 6 +++---
 net/smc/smc_core.c               | 2 +-
 net/tls/tls_device.c             | 2 +-
 net/vmw_vsock/virtio_transport.c | 2 +-
 net/vmw_vsock/vsock_loopback.c   | 2 +-
 9 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/net/ceph/messenger.c b/net/ceph/messenger.c
index d1b5705dc0c6..183c1e0b405a 100644
--- a/net/ceph/messenger.c
+++ b/net/ceph/messenger.c
@@ -252,7 +252,8 @@ int __init ceph_msgr_init(void)
 	 * The number of active work items is limited by the number of
 	 * connections, so leave @max_active at default.
 	 */
-	ceph_msgr_wq = alloc_workqueue("ceph-msgr", WQ_MEM_RECLAIM, 0);
+	ceph_msgr_wq = alloc_workqueue("ceph-msgr",
+				       WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (ceph_msgr_wq)
 		return 0;
 
diff --git a/net/core/sock_diag.c b/net/core/sock_diag.c
index a08eed9b9142..dcd7e8c02169 100644
--- a/net/core/sock_diag.c
+++ b/net/core/sock_diag.c
@@ -350,7 +350,7 @@ static struct pernet_operations diag_net_ops = {
 
 static int __init sock_diag_init(void)
 {
-	broadcast_wq = alloc_workqueue("sock_diag_events", 0, 0);
+	broadcast_wq = alloc_workqueue("sock_diag_events", WQ_PERCPU, 0);
 	BUG_ON(!broadcast_wq);
 	return register_pernet_subsys(&diag_net_ops);
 }
diff --git a/net/rds/ib_rdma.c b/net/rds/ib_rdma.c
index d1cfceeff133..6585164c7059 100644
--- a/net/rds/ib_rdma.c
+++ b/net/rds/ib_rdma.c
@@ -672,7 +672,8 @@ struct rds_ib_mr_pool *rds_ib_create_mr_pool(struct rds_ib_device *rds_ibdev,
 
 int rds_ib_mr_init(void)
 {
-	rds_ib_mr_wq = alloc_workqueue("rds_mr_flushd", WQ_MEM_RECLAIM, 0);
+	rds_ib_mr_wq = alloc_workqueue("rds_mr_flushd",
+				       WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!rds_ib_mr_wq)
 		return -ENOMEM;
 	return 0;
diff --git a/net/rxrpc/rxperf.c b/net/rxrpc/rxperf.c
index e848a4777b8c..a92a2b05c19a 100644
--- a/net/rxrpc/rxperf.c
+++ b/net/rxrpc/rxperf.c
@@ -584,7 +584,7 @@ static int __init rxperf_init(void)
 
 	pr_info("Server registering\n");
 
-	rxperf_workqueue = alloc_workqueue("rxperf", 0, 0);
+	rxperf_workqueue = alloc_workqueue("rxperf", WQ_PERCPU, 0);
 	if (!rxperf_workqueue)
 		goto error_workqueue;
 
diff --git a/net/smc/af_smc.c b/net/smc/af_smc.c
index 3e6cb35baf25..f69d5657438b 100644
--- a/net/smc/af_smc.c
+++ b/net/smc/af_smc.c
@@ -3518,15 +3518,15 @@ static int __init smc_init(void)
 
 	rc = -ENOMEM;
 
-	smc_tcp_ls_wq = alloc_workqueue("smc_tcp_ls_wq", 0, 0);
+	smc_tcp_ls_wq = alloc_workqueue("smc_tcp_ls_wq", WQ_PERCPU, 0);
 	if (!smc_tcp_ls_wq)
 		goto out_pnet;
 
-	smc_hs_wq = alloc_workqueue("smc_hs_wq", 0, 0);
+	smc_hs_wq = alloc_workqueue("smc_hs_wq", WQ_PERCPU, 0);
 	if (!smc_hs_wq)
 		goto out_alloc_tcp_ls_wq;
 
-	smc_close_wq = alloc_workqueue("smc_close_wq", 0, 0);
+	smc_close_wq = alloc_workqueue("smc_close_wq", WQ_PERCPU, 0);
 	if (!smc_close_wq)
 		goto out_alloc_hs_wq;
 
diff --git a/net/smc/smc_core.c b/net/smc/smc_core.c
index ab870109f916..9d9a703e884e 100644
--- a/net/smc/smc_core.c
+++ b/net/smc/smc_core.c
@@ -896,7 +896,7 @@ static int smc_lgr_create(struct smc_sock *smc, struct smc_init_info *ini)
 		rc = SMC_CLC_DECL_MEM;
 		goto ism_put_vlan;
 	}
-	lgr->tx_wq = alloc_workqueue("smc_tx_wq-%*phN", 0, 0,
+	lgr->tx_wq = alloc_workqueue("smc_tx_wq-%*phN", WQ_PERCPU, 0,
 				     SMC_LGR_ID_SIZE, &lgr->id);
 	if (!lgr->tx_wq) {
 		rc = -ENOMEM;
diff --git a/net/tls/tls_device.c b/net/tls/tls_device.c
index f672a62a9a52..939466316761 100644
--- a/net/tls/tls_device.c
+++ b/net/tls/tls_device.c
@@ -1410,7 +1410,7 @@ int __init tls_device_init(void)
 	if (!dummy_page)
 		return -ENOMEM;
 
-	destruct_wq = alloc_workqueue("ktls_device_destruct", 0, 0);
+	destruct_wq = alloc_workqueue("ktls_device_destruct", WQ_PERCPU, 0);
 	if (!destruct_wq) {
 		err = -ENOMEM;
 		goto err_free_dummy;
diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
index f0e48e6911fc..b3e960108e6b 100644
--- a/net/vmw_vsock/virtio_transport.c
+++ b/net/vmw_vsock/virtio_transport.c
@@ -916,7 +916,7 @@ static int __init virtio_vsock_init(void)
 {
 	int ret;
 
-	virtio_vsock_workqueue = alloc_workqueue("virtio_vsock", 0, 0);
+	virtio_vsock_workqueue = alloc_workqueue("virtio_vsock", WQ_PERCPU, 0);
 	if (!virtio_vsock_workqueue)
 		return -ENOMEM;
 
diff --git a/net/vmw_vsock/vsock_loopback.c b/net/vmw_vsock/vsock_loopback.c
index 6e78927a598e..bc2ff918b315 100644
--- a/net/vmw_vsock/vsock_loopback.c
+++ b/net/vmw_vsock/vsock_loopback.c
@@ -139,7 +139,7 @@ static int __init vsock_loopback_init(void)
 	struct vsock_loopback *vsock = &the_vsock_loopback;
 	int ret;
 
-	vsock->workqueue = alloc_workqueue("vsock-loopback", 0, 0);
+	vsock->workqueue = alloc_workqueue("vsock-loopback", WQ_PERCPU, 0);
 	if (!vsock->workqueue)
 		return -ENOMEM;
 
-- 
2.49.0

