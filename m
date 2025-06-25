Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90622C15A6
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848593; cv=none; b=cvwQ89LKKKqA7mthb1moWfSKPPcLv4Hd945CLkqUBcFIenE6LwFcHkvEPaxBVPm+TwVlLzCXD8UtJCWIO8L/O+AJgTAemgrnMCMMcItSp+TC/POJCStPdUyNydPFTIdbcFTiKjJaozYRe7AYq1xfhoQjvF5/B4H8k0spvaj9ZIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848593; c=relaxed/simple;
	bh=iceyb1HUPzXvDJuTj6ew0V6clZQsIJ4mnQcTtgzG+hY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SSb+O3nAjrIojDHmJIaM7v81RzrSUGqGWLZ/FTqhi669teRdVPDmC9Udgtf39+K7Y8fX+smqnnNA9FZIqSBk+n4UQ2ntwUvcvHSVZTxaNO41pG/VDIHtgx2qR+37O9Q8f3FGAnB5ORW2zlqCK8J818aeG0U6DRrrFG/h2vaYCls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ajL0pfwK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ajL0pfwK"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45310223677so47929095e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750848588; x=1751453388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5uQr+x794EeDskQSdmERdUdxCW5N9q95uKjJZjw5iCo=;
        b=ajL0pfwKCFtF+46aw0Hztzh6qC4OAqUJwefkadK1mBa+LvU1XR9Habr4MZwZvEo46P
         Ni0u5A3AImMhEEKyeGgUIjo+xQub0/tgntk9nwJ9kxmK0bRN++Is2uY9lx4GoBDdDjEx
         Uzy3V6Q31+uLC4Wup8VvsdnuPveOIX+MGKNKINrrxpfPsEBM50Ys4yRha3AgeY78O46g
         l0+hHwZeYM4Dq4mAJP7/En9Urbn/ExuR9/hK9UmQ9noOt/MoKsTZORj2IVbkYo/q+m88
         r3kKPmXvdP7gHnVhnFLiLr+Hksj60IZMLbtfzELzD75MUCu5YISiFUQXYM0cvTtHLdpl
         TyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848588; x=1751453388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5uQr+x794EeDskQSdmERdUdxCW5N9q95uKjJZjw5iCo=;
        b=uK7velGglw54ctqNaK87olAQxOHOLYpCc30Zi7U9AyYZ6Rr/FAOxFY7T+lPFnSWdxk
         8pqmldVPdlmHFBq4E+4ZSdwsYnfUWb2Tro8v+XzVy3AZXDETbnc43iPIs409IH4dzCOU
         yTtkP0/RzeK5rLjCyod88/dEI0k+FkjoPRORPKlQ7idaBtsKhYK76BUDC6qdMRfCWCvT
         u1dq1FizguEFSXQvOBuLKoNePEmXDD+J4pQXQ2zIeQGBaFJAmm5bLl7CymSh9rOz5ulv
         JfjcoSGjUqJSiN0pxJmIGqcL7emZC6ZFEW+OI4zPl2qEcPrMUz8CPtoUCJmGvZRP05fw
         AFPA==
X-Gm-Message-State: AOJu0YziZspFNrhOnjPHYZiaXH0dAxjl50e69NyaFPiYqXhpowX4SVGP
	C3284ZqkI4Rm6REYczFA5H5xTOldgspHV5FmsIOM8Lyh9j1Ma4WZr+YVhM3QidlNA2n0ARi8fVu
	XJqJ0uqU=
X-Gm-Gg: ASbGnctiTa3eWMW6Fm85Nr1k16fDFfeNCNT5Z8lPzWNdNRmVT2qh5UKSM5MU+O5Rza0
	BeFSYB3+Z/Qnw6wdNzmgSMPVL8Q/1YVFXUqkFXCeOIX4OsvUuBuUu9q/SVTbx59VS7EbcMJgfCM
	8wl5/zh04vO9SC3eYzbRWHcZiLL5Pc16bfVqzwnkgSiBXoyUNrRfx4y4VPnAxFuwwE+hIk/RoXH
	UgkamOzUqJC3xRUu4ROw+tj9JUtxuPm9Uvb663a/daGgFvgRWRMRlNsvG2wjM5qUj0wtLVkZN6P
	w+vNpFWD9HekGIGw8G8R7Fq9DkS8PTBlGaHapDsiisRTCll7EBXt/xscvC4cAXEf+vmWdca8zvs
	6wYFihy6gZg==
X-Google-Smtp-Source: AGHT+IG3k/hmki5z1PI2ECdbgP/6NQWz9x3yicPMXr93j0FR79RLJXPAwbgf4rq7AOuC7a0yT++Row==
X-Received: by 2002:a05:6000:230c:b0:3a5:2cb5:63fd with SMTP id ffacd0b85a97d-3a6ed5d64b7mr1860834f8f.10.1750848588453;
        Wed, 25 Jun 2025 03:49:48 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c49fsm16195055e9.7.2025.06.25.03.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:49:48 -0700 (PDT)
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
Subject: [PATCH v1 06/10] Workqueue: net: WQ_PERCPU added to alloc_workqueue users
Date: Wed, 25 Jun 2025 12:49:30 +0200
Message-ID: <20250625104934.184753-7-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625104934.184753-1-marco.crivellari@suse.com>
References: <20250625104934.184753-1-marco.crivellari@suse.com>
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
CC: "David S. Miller" <davem@davemloft.net>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
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

