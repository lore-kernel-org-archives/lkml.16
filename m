Received: from mailrelay-egress12.pub.mailoutpod2-cph3.one.com (mailrelay-egress12.pub.mailoutpod2-cph3.one.com [46.30.211.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C01F233714
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751017051; cv=none; b=WrlkAzw6Tgtm37+qfUUF1RwJUTBEvtH9fR2Z3ROeCsF1XYGXRnpd/igAq8ge5EnVvhOgt8enyJ3vm4Ihst+yOkWHXafb9+OxAS4mm1cCSXCmEIF9plrNDFx/joZqjW1DY3TXJAzER27DN1oqwvySMpgwgt9I1NdANsJ+tp1XSaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751017051; c=relaxed/simple;
	bh=Jthb+UJKcxktJpwPe2XaOxtycF1+lXV4NRkk2tIVbFo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qAFtPd/ZP0eW+Jso7ikBlIxohCbXBz+zYl9OEk+T7tsgOl0qihMBJHlDvZfmkd+BJLliL6bcm1+2DeoxhsPasf6ZYRP0+JxE5ghDsNVeWA7Vmg876wC+CSFQ7FzE6JmvKEbVgzYfcXoU5KnS5kVqukEwZBj5Uzoxm8kF+Q15h4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=bbR2Cvfn; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=ktnaALU5; arc=none smtp.client-ip=46.30.211.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="bbR2Cvfn";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="ktnaALU5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751017047; x=1751621847;
	d=konsulko.se; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=YLTkg36uBQpkwu4dPNoedH3NjjOM2iYA3dGmUc2+V8Q=;
	b=bbR2CvfnZX03pt6TS7geVeZkmv/XX6V47lyoec1WcvKB2towl94Ker9JsK0ebed4EwiP4FvZRmoJk
	 18/JEb01hHTAJpLuAv1Wiw8p0t8QeRalkpxPFwyFhVMhtHK7OYBUt6lbxAL0TDM2bRWHLGvl9gjhJy
	 /zvK8RaJxnGLU6s0RRDktipIENlgMr2XUFYtB+bR4oKkDl50YST5xwCpN0Nw3N+YdFdaqc2V8Q7ioW
	 nCSgUj+iM5QSM59tCk2Y+18XMZHOrtJevj+vg/+NwURRo1K6nXeGCRzedyepoRHnXPt2Wuuz746R21
	 Ey3E3pOSlXxz89hnXsXuTvpV8nXdJtw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751017047; x=1751621847;
	d=konsulko.se; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=YLTkg36uBQpkwu4dPNoedH3NjjOM2iYA3dGmUc2+V8Q=;
	b=ktnaALU5vYXLMP1jB54PdNcxAZ53drm9XGkg73yZFAnmijCkKfVt1IQn8qxQQL5XT5D3xpHFyz+az
	 FbFjmKyCQ==
X-HalOne-ID: 54a061ad-533a-11f0-95e0-494313b7f784
Received: from slottsdator.home (host-90-238-19-233.mobileonline.telia.com [90.238.19.233])
	by mailrelay6.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 54a061ad-533a-11f0-95e0-494313b7f784;
	Fri, 27 Jun 2025 09:37:25 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH 2/4] mm/slub: allow to set node and align in k[v]realloc
Date: Fri, 27 Jun 2025 11:37:14 +0200
Message-Id: <20250627093714.402989-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250627092901.356909-1-vitaly.wool@konsulko.se>
References: <20250627092901.356909-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reimplement k[v]realloc_node() to be able to set node and
alignment should a user need to do so. In order to do that while
retaining the maximal backward compatibility, the following rules
are honored:
* kmalloc/kzalloc/krealloc remain unchanged
* kvmalloc/kvrealloc/kvcalloc remain unchanged
* kvrealloc remains unchanged
* kvrealloc_node is implemented as a new function taking align and
  NUMA id as extra parameters compared to kvrealloc.
* krealloc_node is implemented as a new function taking NUMA id
  as an extra parameter compared to krealloc
* kvmalloc_node/kvzalloc_node/kvcalloc_node get an extra parameter
  (alignment)

The users of functions that changed their interfaces are updated
accordingly.

With that change we also provide the ability for the Rust part of
the kernel to set node and aligmnent in its K[v]xxx
[re]allocations.

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
---
 drivers/infiniband/hw/hfi1/ipoib_tx.c         |  2 +-
 drivers/infiniband/hw/hfi1/sdma.c             |  2 +-
 drivers/md/dm-stats.c                         |  2 +-
 drivers/md/dm.c                               |  2 +-
 .../net/ethernet/fungible/funcore/fun_queue.c |  2 +-
 .../net/ethernet/fungible/funeth/funeth_rx.c  |  2 +-
 drivers/net/ethernet/intel/libeth/rx.c        |  2 +-
 drivers/net/ethernet/mellanox/mlx4/en_rx.c    |  2 +-
 drivers/net/ethernet/mellanox/mlx4/en_tx.c    |  2 +-
 .../net/ethernet/mellanox/mlx5/core/en/ptp.c  | 10 ++--
 .../net/ethernet/mellanox/mlx5/core/en/trap.c |  2 +-
 .../net/ethernet/mellanox/mlx5/core/en_dim.c  |  2 +-
 .../net/ethernet/mellanox/mlx5/core/en_main.c | 30 +++++-----
 drivers/net/ethernet/mellanox/mlx5/core/eq.c  |  4 +-
 .../net/ethernet/mellanox/mlx5/core/pci_irq.c |  2 +-
 drivers/net/ethernet/wangxun/libwx/wx_lib.c   |  4 +-
 include/linux/slab.h                          | 42 +++++++------
 lib/rhashtable.c                              |  2 +-
 lib/sbitmap.c                                 |  2 +-
 lib/tests/fortify_kunit.c                     |  4 +-
 lib/tests/overflow_kunit.c                    | 55 +++++++++--------
 mm/shrinker.c                                 |  4 +-
 mm/slub.c                                     | 60 +++++++++++++------
 net/netfilter/x_tables.c                      |  2 +-
 net/rds/ib_cm.c                               |  4 +-
 net/sched/sch_fq.c                            |  3 +-
 26 files changed, 142 insertions(+), 108 deletions(-)

diff --git a/drivers/infiniband/hw/hfi1/ipoib_tx.c b/drivers/infiniband/hw/hfi1/ipoib_tx.c
index 8b9cc55db59d..3d80571200ff 100644
--- a/drivers/infiniband/hw/hfi1/ipoib_tx.c
+++ b/drivers/infiniband/hw/hfi1/ipoib_tx.c
@@ -729,7 +729,7 @@ int hfi1_ipoib_txreq_init(struct hfi1_ipoib_dev_priv *priv)
 					     priv->dd->node);
 
 		txq->tx_ring.items =
-			kvzalloc_node(array_size(tx_ring_size, tx_item_size),
+			kvzalloc_node(array_size(tx_ring_size, tx_item_size), 1,
 				      GFP_KERNEL, priv->dd->node);
 		if (!txq->tx_ring.items)
 			goto free_txqs;
diff --git a/drivers/infiniband/hw/hfi1/sdma.c b/drivers/infiniband/hw/hfi1/sdma.c
index 719b7c34e238..51c9740bea23 100644
--- a/drivers/infiniband/hw/hfi1/sdma.c
+++ b/drivers/infiniband/hw/hfi1/sdma.c
@@ -1436,7 +1436,7 @@ int sdma_init(struct hfi1_devdata *dd, u8 port)
 		sde->tx_ring =
 			kvzalloc_node(array_size(descq_cnt,
 						 sizeof(struct sdma_txreq *)),
-				      GFP_KERNEL, dd->node);
+				      1, GFP_KERNEL, dd->node);
 		if (!sde->tx_ring)
 			goto bail;
 	}
diff --git a/drivers/md/dm-stats.c b/drivers/md/dm-stats.c
index 1e5d988f44da..88e29a30fd17 100644
--- a/drivers/md/dm-stats.c
+++ b/drivers/md/dm-stats.c
@@ -150,7 +150,7 @@ static void *dm_kvzalloc(size_t alloc_size, int node)
 	if (!claim_shared_memory(alloc_size))
 		return NULL;
 
-	p = kvzalloc_node(alloc_size, GFP_KERNEL | __GFP_NOMEMALLOC, node);
+	p = kvzalloc_node(alloc_size, 1, GFP_KERNEL | __GFP_NOMEMALLOC, node);
 	if (p)
 		return p;
 
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 4b9415f718e3..d2fcbf63c137 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -2249,7 +2249,7 @@ static struct mapped_device *alloc_dev(int minor)
 	struct mapped_device *md;
 	void *old_md;
 
-	md = kvzalloc_node(sizeof(*md), GFP_KERNEL, numa_node_id);
+	md = kvzalloc_node(sizeof(*md), 1, GFP_KERNEL, numa_node_id);
 	if (!md) {
 		DMERR("unable to allocate device, out of memory.");
 		return NULL;
diff --git a/drivers/net/ethernet/fungible/funcore/fun_queue.c b/drivers/net/ethernet/fungible/funcore/fun_queue.c
index d07ee3e4f52a..c65dfcc31117 100644
--- a/drivers/net/ethernet/fungible/funcore/fun_queue.c
+++ b/drivers/net/ethernet/fungible/funcore/fun_queue.c
@@ -40,7 +40,7 @@ void *fun_alloc_ring_mem(struct device *dma_dev, size_t depth,
 		return NULL;
 
 	if (sw_desc_sz) {
-		*sw_va = kvzalloc_node(sw_desc_sz * depth, GFP_KERNEL,
+		*sw_va = kvzalloc_node(sw_desc_sz * depth, 1, GFP_KERNEL,
 				       numa_node);
 		if (!*sw_va) {
 			dma_free_coherent(dma_dev, dma_sz, va, *dma_addr);
diff --git a/drivers/net/ethernet/fungible/funeth/funeth_rx.c b/drivers/net/ethernet/fungible/funeth/funeth_rx.c
index 7e2584895de3..c27788e59934 100644
--- a/drivers/net/ethernet/fungible/funeth/funeth_rx.c
+++ b/drivers/net/ethernet/fungible/funeth/funeth_rx.c
@@ -567,7 +567,7 @@ static int fun_rxq_init_cache(struct funeth_rx_cache *c, unsigned int depth,
 			      int node)
 {
 	c->mask = depth - 1;
-	c->bufs = kvzalloc_node(depth * sizeof(*c->bufs), GFP_KERNEL, node);
+	c->bufs = kvzalloc_node(depth * sizeof(*c->bufs), 1, GFP_KERNEL, node);
 	return c->bufs ? 0 : -ENOMEM;
 }
 
diff --git a/drivers/net/ethernet/intel/libeth/rx.c b/drivers/net/ethernet/intel/libeth/rx.c
index 66d1d23b8ad2..272acdf540d8 100644
--- a/drivers/net/ethernet/intel/libeth/rx.c
+++ b/drivers/net/ethernet/intel/libeth/rx.c
@@ -172,7 +172,7 @@ int libeth_rx_fq_create(struct libeth_fq *fq, struct napi_struct *napi)
 	if (IS_ERR(pool))
 		return PTR_ERR(pool);
 
-	fqes = kvcalloc_node(fq->count, sizeof(*fqes), GFP_KERNEL, fq->nid);
+	fqes = kvcalloc_node(fq->count, sizeof(*fqes), 1, GFP_KERNEL, fq->nid);
 	if (!fqes)
 		goto err_buf;
 
diff --git a/drivers/net/ethernet/mellanox/mlx4/en_rx.c b/drivers/net/ethernet/mellanox/mlx4/en_rx.c
index b33285d755b9..b011ff2f6e33 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_rx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_rx.c
@@ -280,7 +280,7 @@ int mlx4_en_create_rx_ring(struct mlx4_en_priv *priv,
 
 	tmp = size * roundup_pow_of_two(MLX4_EN_MAX_RX_FRAGS *
 					sizeof(struct mlx4_en_rx_alloc));
-	ring->rx_info = kvzalloc_node(tmp, GFP_KERNEL, node);
+	ring->rx_info = kvzalloc_node(tmp, 1, GFP_KERNEL, node);
 	if (!ring->rx_info) {
 		err = -ENOMEM;
 		goto err_xdp_info;
diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
index 87f35bcbeff8..c7a63613914b 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
@@ -69,7 +69,7 @@ int mlx4_en_create_tx_ring(struct mlx4_en_priv *priv,
 	ring->full_size = ring->size - HEADROOM - MLX4_MAX_DESC_TXBBS;
 
 	tmp = size * sizeof(struct mlx4_en_tx_info);
-	ring->tx_info = kvmalloc_node(tmp, GFP_KERNEL, node);
+	ring->tx_info = kvmalloc_node(tmp, 1, GFP_KERNEL, node);
 	if (!ring->tx_info) {
 		err = -ENOMEM;
 		goto err_ring;
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/ptp.c b/drivers/net/ethernet/mellanox/mlx5/core/en/ptp.c
index 5d0014129a7e..45df50efbc17 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/ptp.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/ptp.c
@@ -378,7 +378,7 @@ static int mlx5e_ptp_alloc_traffic_db(struct mlx5e_ptpsq *ptpsq, int numa)
 	int db_sz;
 	int md;
 
-	cqe_list = kvzalloc_node(sizeof(*ptpsq->ts_cqe_pending_list), GFP_KERNEL, numa);
+	cqe_list = kvzalloc_node(sizeof(*ptpsq->ts_cqe_pending_list), 1, GFP_KERNEL, numa);
 	if (!cqe_list)
 		return -ENOMEM;
 	ptpsq->ts_cqe_pending_list = cqe_list;
@@ -388,7 +388,7 @@ static int mlx5e_ptp_alloc_traffic_db(struct mlx5e_ptpsq *ptpsq, int numa)
 					  ts_cqe_metadata_size2wqe_counter));
 	ptpsq->ts_cqe_ctr_mask = db_sz - 1;
 
-	cqe_list->nodes = kvzalloc_node(array_size(db_sz, sizeof(*cqe_list->nodes)),
+	cqe_list->nodes = kvzalloc_node(array_size(db_sz, sizeof(*cqe_list->nodes)), 1,
 					GFP_KERNEL, numa);
 	if (!cqe_list->nodes)
 		goto free_cqe_list;
@@ -396,7 +396,7 @@ static int mlx5e_ptp_alloc_traffic_db(struct mlx5e_ptpsq *ptpsq, int numa)
 	spin_lock_init(&cqe_list->tracker_list_lock);
 
 	metadata_freelist->data =
-		kvzalloc_node(array_size(db_sz, sizeof(*metadata_freelist->data)),
+		kvzalloc_node(array_size(db_sz, sizeof(*metadata_freelist->data)), 1,
 			      GFP_KERNEL, numa);
 	if (!metadata_freelist->data)
 		goto free_cqe_list_nodes;
@@ -409,7 +409,7 @@ static int mlx5e_ptp_alloc_traffic_db(struct mlx5e_ptpsq *ptpsq, int numa)
 	metadata_freelist->pc = db_sz;
 
 	metadata_map->data =
-		kvzalloc_node(array_size(db_sz, sizeof(*metadata_map->data)),
+		kvzalloc_node(array_size(db_sz, sizeof(*metadata_map->data)), 1,
 			      GFP_KERNEL, numa);
 	if (!metadata_map->data)
 		goto free_metadata_freelist;
@@ -886,7 +886,7 @@ int mlx5e_ptp_open(struct mlx5e_priv *priv, struct mlx5e_params *params,
 	int err;
 
 
-	c = kvzalloc_node(sizeof(*c), GFP_KERNEL, dev_to_node(mlx5_core_dma_dev(mdev)));
+	c = kvzalloc_node(sizeof(*c), 1, GFP_KERNEL, dev_to_node(mlx5_core_dma_dev(mdev)));
 	cparams = kvzalloc(sizeof(*cparams), GFP_KERNEL);
 	if (!c || !cparams) {
 		err = -ENOMEM;
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/trap.c b/drivers/net/ethernet/mellanox/mlx5/core/en/trap.c
index b5c19396e096..eca14b387b48 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/trap.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/trap.c
@@ -135,7 +135,7 @@ static struct mlx5e_trap *mlx5e_open_trap(struct mlx5e_priv *priv)
 	struct mlx5e_trap *t;
 	int err;
 
-	t = kvzalloc_node(sizeof(*t), GFP_KERNEL, cpu_to_node(cpu));
+	t = kvzalloc_node(sizeof(*t), 1, GFP_KERNEL, cpu_to_node(cpu));
 	if (!t)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_dim.c b/drivers/net/ethernet/mellanox/mlx5/core/en_dim.c
index 298bb74ec5e9..635b2e7e163f 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_dim.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_dim.c
@@ -70,7 +70,7 @@ static struct dim *mlx5e_dim_enable(struct mlx5_core_dev *mdev,
 	struct dim *dim;
 	int err;
 
-	dim = kvzalloc_node(sizeof(*dim), GFP_KERNEL, cpu_to_node(cpu));
+	dim = kvzalloc_node(sizeof(*dim), 1, GFP_KERNEL, cpu_to_node(cpu));
 	if (!dim)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
index ea822c69d137..a5a1bed18604 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
@@ -333,7 +333,7 @@ static inline void mlx5e_build_umr_wqe(struct mlx5e_rq *rq,
 
 static int mlx5e_rq_shampo_hd_alloc(struct mlx5e_rq *rq, int node)
 {
-	rq->mpwqe.shampo = kvzalloc_node(sizeof(*rq->mpwqe.shampo),
+	rq->mpwqe.shampo = kvzalloc_node(sizeof(*rq->mpwqe.shampo), 1,
 					 GFP_KERNEL, node);
 	if (!rq->mpwqe.shampo)
 		return -ENOMEM;
@@ -353,7 +353,7 @@ static int mlx5e_rq_shampo_hd_info_alloc(struct mlx5e_rq *rq, int node)
 					    node);
 	shampo->pages = kvzalloc_node(array_size(shampo->hd_per_wq,
 						 sizeof(*shampo->pages)),
-				     GFP_KERNEL, node);
+				     1, GFP_KERNEL, node);
 	if (!shampo->bitmap || !shampo->pages)
 		goto err_nomem;
 
@@ -381,7 +381,7 @@ static int mlx5e_rq_alloc_mpwqe_info(struct mlx5e_rq *rq, int node)
 						   alloc_units.frag_pages,
 						   rq->mpwqe.pages_per_wqe));
 
-	rq->mpwqe.info = kvzalloc_node(alloc_size, GFP_KERNEL, node);
+	rq->mpwqe.info = kvzalloc_node(alloc_size, 1, GFP_KERNEL, node);
 	if (!rq->mpwqe.info)
 		return -ENOMEM;
 
@@ -673,11 +673,11 @@ static int mlx5e_init_wqe_alloc_info(struct mlx5e_rq *rq, int node)
 	else
 		aus_sz = sizeof(*aus->frag_pages);
 
-	aus = kvzalloc_node(array_size(len, aus_sz), GFP_KERNEL, node);
+	aus = kvzalloc_node(array_size(len, aus_sz), 1, GFP_KERNEL, node);
 	if (!aus)
 		return -ENOMEM;
 
-	frags = kvzalloc_node(array_size(len, sizeof(*frags)), GFP_KERNEL, node);
+	frags = kvzalloc_node(array_size(len, sizeof(*frags)), 1, GFP_KERNEL, node);
 	if (!frags) {
 		kvfree(aus);
 		return -ENOMEM;
@@ -780,7 +780,7 @@ static int mlx5_rq_shampo_alloc(struct mlx5_core_dev *mdev,
 	err = mlx5e_rq_shampo_hd_info_alloc(rq, node);
 	if (err)
 		goto err_shampo_info;
-	rq->hw_gro_data = kvzalloc_node(sizeof(*rq->hw_gro_data), GFP_KERNEL, node);
+	rq->hw_gro_data = kvzalloc_node(sizeof(*rq->hw_gro_data), 1, GFP_KERNEL, node);
 	if (!rq->hw_gro_data) {
 		err = -ENOMEM;
 		goto err_hw_gro_data;
@@ -1409,7 +1409,7 @@ static int mlx5e_alloc_xdpsq_fifo(struct mlx5e_xdpsq *sq, int numa)
 				     MLX5E_XDP_FIFO_ENTRIES2DS_MAX_RATIO);
 
 	size = array_size(sizeof(*xdpi_fifo->xi), entries);
-	xdpi_fifo->xi = kvzalloc_node(size, GFP_KERNEL, numa);
+	xdpi_fifo->xi = kvzalloc_node(size, 1, GFP_KERNEL, numa);
 	if (!xdpi_fifo->xi)
 		return -ENOMEM;
 
@@ -1427,7 +1427,7 @@ static int mlx5e_alloc_xdpsq_db(struct mlx5e_xdpsq *sq, int numa)
 	int err;
 
 	size = array_size(sizeof(*sq->db.wqe_info), wq_sz);
-	sq->db.wqe_info = kvzalloc_node(size, GFP_KERNEL, numa);
+	sq->db.wqe_info = kvzalloc_node(size, 1, GFP_KERNEL, numa);
 	if (!sq->db.wqe_info)
 		return -ENOMEM;
 
@@ -1504,7 +1504,7 @@ static int mlx5e_alloc_icosq_db(struct mlx5e_icosq *sq, int numa)
 	size_t size;
 
 	size = array_size(wq_sz, sizeof(*sq->db.wqe_info));
-	sq->db.wqe_info = kvzalloc_node(size, GFP_KERNEL, numa);
+	sq->db.wqe_info = kvzalloc_node(size, 1, GFP_KERNEL, numa);
 	if (!sq->db.wqe_info)
 		return -ENOMEM;
 
@@ -1583,13 +1583,13 @@ int mlx5e_alloc_txqsq_db(struct mlx5e_txqsq *sq, int numa)
 
 	sq->db.dma_fifo = kvzalloc_node(array_size(df_sz,
 						   sizeof(*sq->db.dma_fifo)),
-					GFP_KERNEL, numa);
+					1, GFP_KERNEL, numa);
 	sq->db.skb_fifo.fifo = kvzalloc_node(array_size(df_sz,
 							sizeof(*sq->db.skb_fifo.fifo)),
-					GFP_KERNEL, numa);
+					1, GFP_KERNEL, numa);
 	sq->db.wqe_info = kvzalloc_node(array_size(wq_sz,
 						   sizeof(*sq->db.wqe_info)),
-					GFP_KERNEL, numa);
+					1, GFP_KERNEL, numa);
 	if (!sq->db.dma_fifo || !sq->db.skb_fifo.fifo || !sq->db.wqe_info) {
 		mlx5e_free_txqsq_db(sq);
 		return -ENOMEM;
@@ -2074,7 +2074,7 @@ static struct mlx5e_xdpsq *mlx5e_open_xdpredirect_sq(struct mlx5e_channel *c,
 	struct mlx5e_xdpsq *xdpsq;
 	int err;
 
-	xdpsq = kvzalloc_node(sizeof(*xdpsq), GFP_KERNEL, cpu_to_node(c->cpu));
+	xdpsq = kvzalloc_node(sizeof(*xdpsq), 1, GFP_KERNEL, cpu_to_node(c->cpu));
 	if (!xdpsq)
 		return ERR_PTR(-ENOMEM);
 
@@ -2643,7 +2643,7 @@ static int mlx5e_channel_stats_alloc(struct mlx5e_priv *priv, int ix, int cpu)
 	 */
 	netdev_dbg(priv->netdev, "Creating channel stats %d\n", ix);
 	priv->channel_stats[ix] = kvzalloc_node(sizeof(**priv->channel_stats),
-						GFP_KERNEL, cpu_to_node(cpu));
+						1, GFP_KERNEL, cpu_to_node(cpu));
 	if (!priv->channel_stats[ix])
 		return -ENOMEM;
 	priv->stats_nch++;
@@ -2692,7 +2692,7 @@ static int mlx5e_open_channel(struct mlx5e_priv *priv, int ix,
 	if (err)
 		return err;
 
-	c = kvzalloc_node(sizeof(*c), GFP_KERNEL, cpu_to_node(cpu));
+	c = kvzalloc_node(sizeof(*c), 1, GFP_KERNEL, cpu_to_node(cpu));
 	cparam = kvzalloc(sizeof(*cparam), GFP_KERNEL);
 	if (!c || !cparam) {
 		err = -ENOMEM;
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/eq.c b/drivers/net/ethernet/mellanox/mlx5/core/eq.c
index dfb079e59d85..4e47ed58dee9 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/eq.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/eq.c
@@ -432,7 +432,7 @@ int mlx5_eq_table_init(struct mlx5_core_dev *dev)
 	struct mlx5_eq_table *eq_table;
 	int i;
 
-	eq_table = kvzalloc_node(sizeof(*eq_table), GFP_KERNEL,
+	eq_table = kvzalloc_node(sizeof(*eq_table), 1, GFP_KERNEL,
 				 dev->priv.numa_node);
 	if (!eq_table)
 		return -ENOMEM;
@@ -746,7 +746,7 @@ struct mlx5_eq *
 mlx5_eq_create_generic(struct mlx5_core_dev *dev,
 		       struct mlx5_eq_param *param)
 {
-	struct mlx5_eq *eq = kvzalloc_node(sizeof(*eq), GFP_KERNEL,
+	struct mlx5_eq *eq = kvzalloc_node(sizeof(*eq), 1, GFP_KERNEL,
 					   dev->priv.numa_node);
 	int err;
 
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/pci_irq.c b/drivers/net/ethernet/mellanox/mlx5/core/pci_irq.c
index 40024cfa3099..1cfc664fd78a 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/pci_irq.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/pci_irq.c
@@ -706,7 +706,7 @@ int mlx5_irq_table_init(struct mlx5_core_dev *dev)
 	if (mlx5_core_is_sf(dev))
 		return 0;
 
-	irq_table = kvzalloc_node(sizeof(*irq_table), GFP_KERNEL,
+	irq_table = kvzalloc_node(sizeof(*irq_table), GFP_KERNEL, 1,
 				  dev->priv.numa_node);
 	if (!irq_table)
 		return -ENOMEM;
diff --git a/drivers/net/ethernet/wangxun/libwx/wx_lib.c b/drivers/net/ethernet/wangxun/libwx/wx_lib.c
index 7f2e6cddfeb1..c35a608c3ac1 100644
--- a/drivers/net/ethernet/wangxun/libwx/wx_lib.c
+++ b/drivers/net/ethernet/wangxun/libwx/wx_lib.c
@@ -2658,7 +2658,7 @@ static int wx_setup_rx_resources(struct wx_ring *rx_ring)
 	if (rx_ring->q_vector)
 		numa_node = rx_ring->q_vector->numa_node;
 
-	rx_ring->rx_buffer_info = kvmalloc_node(size, GFP_KERNEL, numa_node);
+	rx_ring->rx_buffer_info = kvmalloc_node(size, 1, GFP_KERNEL, numa_node);
 	if (!rx_ring->rx_buffer_info)
 		rx_ring->rx_buffer_info = kvmalloc(size, GFP_KERNEL);
 	if (!rx_ring->rx_buffer_info)
@@ -2749,7 +2749,7 @@ static int wx_setup_tx_resources(struct wx_ring *tx_ring)
 	if (tx_ring->q_vector)
 		numa_node = tx_ring->q_vector->numa_node;
 
-	tx_ring->tx_buffer_info = kvmalloc_node(size, GFP_KERNEL, numa_node);
+	tx_ring->tx_buffer_info = kvmalloc_node(size, 1, GFP_KERNEL, numa_node);
 	if (!tx_ring->tx_buffer_info)
 		tx_ring->tx_buffer_info = kvmalloc(size, GFP_KERNEL);
 	if (!tx_ring->tx_buffer_info)
diff --git a/include/linux/slab.h b/include/linux/slab.h
index d5a8ab98035c..1eaf6c7b2754 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -465,9 +465,12 @@ int kmem_cache_shrink(struct kmem_cache *s);
 /*
  * Common kmalloc functions provided by all allocators
  */
-void * __must_check krealloc_noprof(const void *objp, size_t new_size,
-				    gfp_t flags) __realloc_size(2);
-#define krealloc(...)				alloc_hooks(krealloc_noprof(__VA_ARGS__))
+void * __must_check krealloc_node_noprof(const void *objp, size_t new_size,
+					 unsigned long align,
+					 gfp_t flags, int nid) __realloc_size(2);
+#define krealloc_node(...)		alloc_hooks(krealloc_node_noprof(__VA_ARGS__))
+#define krealloc_noprof(_p, _s, _f)	krealloc_node_noprof(_p, _s, 1, _f, NUMA_NO_NODE)
+#define krealloc(...)			alloc_hooks(krealloc_noprof(__VA_ARGS__))
 
 void kfree(const void *objp);
 void kfree_sensitive(const void *objp);
@@ -1041,40 +1044,45 @@ static inline __alloc_size(1) void *kzalloc_noprof(size_t size, gfp_t flags)
 #define kzalloc(...)				alloc_hooks(kzalloc_noprof(__VA_ARGS__))
 #define kzalloc_node(_size, _flags, _node)	kmalloc_node(_size, (_flags)|__GFP_ZERO, _node)
 
-void *__kvmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node) __alloc_size(1);
-#define kvmalloc_node_noprof(size, flags, node)	\
-	__kvmalloc_node_noprof(PASS_BUCKET_PARAMS(size, NULL), flags, node)
+void *__kvmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), unsigned long align,
+			     gfp_t flags, int node) __alloc_size(1);
+#define kvmalloc_node_noprof(size, align, flags, node)	\
+	__kvmalloc_node_noprof(PASS_BUCKET_PARAMS(size, NULL), align, flags, node)
 #define kvmalloc_node(...)			alloc_hooks(kvmalloc_node_noprof(__VA_ARGS__))
 
-#define kvmalloc(_size, _flags)			kvmalloc_node(_size, _flags, NUMA_NO_NODE)
-#define kvmalloc_noprof(_size, _flags)		kvmalloc_node_noprof(_size, _flags, NUMA_NO_NODE)
+#define kvmalloc(_size, _flags)			kvmalloc_node(_size, 1, _flags, NUMA_NO_NODE)
+#define kvmalloc_noprof(_size, _flags)		kvmalloc_node_noprof(_size, 1, _flags, NUMA_NO_NODE)
 #define kvzalloc(_size, _flags)			kvmalloc(_size, (_flags)|__GFP_ZERO)
 
-#define kvzalloc_node(_size, _flags, _node)	kvmalloc_node(_size, (_flags)|__GFP_ZERO, _node)
+#define kvzalloc_node(_s, _a, _f, _n)		kvmalloc_node(_s, _a, (_f)|__GFP_ZERO, _n)
 #define kmem_buckets_valloc(_b, _size, _flags)	\
-	alloc_hooks(__kvmalloc_node_noprof(PASS_BUCKET_PARAMS(_size, _b), _flags, NUMA_NO_NODE))
+	alloc_hooks(__kvmalloc_node_noprof(PASS_BUCKET_PARAMS(_size, _b), 1, _flags, NUMA_NO_NODE))
 
 static inline __alloc_size(1, 2) void *
-kvmalloc_array_node_noprof(size_t n, size_t size, gfp_t flags, int node)
+kvmalloc_array_node_noprof(size_t n, size_t size, unsigned long align, gfp_t flags, int node)
 {
 	size_t bytes;
 
 	if (unlikely(check_mul_overflow(n, size, &bytes)))
 		return NULL;
 
-	return kvmalloc_node_noprof(bytes, flags, node);
+	return kvmalloc_node_noprof(bytes, align, flags, node);
 }
 
-#define kvmalloc_array_noprof(...)		kvmalloc_array_node_noprof(__VA_ARGS__, NUMA_NO_NODE)
-#define kvcalloc_node_noprof(_n,_s,_f,_node)	kvmalloc_array_node_noprof(_n,_s,(_f)|__GFP_ZERO,_node)
-#define kvcalloc_noprof(...)			kvcalloc_node_noprof(__VA_ARGS__, NUMA_NO_NODE)
+#define kvmalloc_array_noprof(_n, _s, _f)	\
+	kvmalloc_array_node_noprof(_n, _s, 1, _f, NUMA_NO_NODE)
+#define kvcalloc_node_noprof(_n, _s, _a, _f, _node) \
+	kvmalloc_array_node_noprof(_n, _s, _a, (_f) | __GFP_ZERO, _node)
+#define kvcalloc_noprof(_n, _s, _f)		kvcalloc_node_noprof(_n, _s, 1, _f, NUMA_NO_NODE)
 
 #define kvmalloc_array(...)			alloc_hooks(kvmalloc_array_noprof(__VA_ARGS__))
 #define kvcalloc_node(...)			alloc_hooks(kvcalloc_node_noprof(__VA_ARGS__))
 #define kvcalloc(...)				alloc_hooks(kvcalloc_noprof(__VA_ARGS__))
 
-void *kvrealloc_noprof(const void *p, size_t size, gfp_t flags)
-		__realloc_size(2);
+void *kvrealloc_node_noprof(const void *p, size_t size, unsigned long align,
+			    gfp_t flags, int nid) __realloc_size(2);
+#define kvrealloc_node(...)			alloc_hooks(kvrealloc_node_noprof(__VA_ARGS__))
+#define kvrealloc_noprof(_p, _s, _f)		kvrealloc_node_noprof(_p, _s, 1, _f, NUMA_NO_NODE)
 #define kvrealloc(...)				alloc_hooks(kvrealloc_noprof(__VA_ARGS__))
 
 extern void kvfree(const void *addr);
diff --git a/lib/rhashtable.c b/lib/rhashtable.c
index 3e555d012ed6..89a9fee5231d 100644
--- a/lib/rhashtable.c
+++ b/lib/rhashtable.c
@@ -184,7 +184,7 @@ static struct bucket_table *bucket_table_alloc(struct rhashtable *ht,
 	static struct lock_class_key __key;
 
 	tbl = alloc_hooks_tag(ht->alloc_tag,
-			kvmalloc_node_noprof(struct_size(tbl, buckets, nbuckets),
+			kvmalloc_node_noprof(struct_size(tbl, buckets, nbuckets), 1,
 					     gfp|__GFP_ZERO, NUMA_NO_NODE));
 
 	size = nbuckets;
diff --git a/lib/sbitmap.c b/lib/sbitmap.c
index d3412984170c..52a7a2f938f2 100644
--- a/lib/sbitmap.c
+++ b/lib/sbitmap.c
@@ -129,7 +129,7 @@ int sbitmap_init_node(struct sbitmap *sb, unsigned int depth, int shift,
 		sb->alloc_hint = NULL;
 	}
 
-	sb->map = kvzalloc_node(sb->map_nr * sizeof(*sb->map), flags, node);
+	sb->map = kvzalloc_node(sb->map_nr * sizeof(*sb->map), 1, flags, node);
 	if (!sb->map) {
 		free_percpu(sb->alloc_hint);
 		return -ENOMEM;
diff --git a/lib/tests/fortify_kunit.c b/lib/tests/fortify_kunit.c
index 29ffc62a71e3..9a583c51cc16 100644
--- a/lib/tests/fortify_kunit.c
+++ b/lib/tests/fortify_kunit.c
@@ -298,13 +298,13 @@ DEFINE_ALLOC_SIZE_TEST_PAIR(vmalloc)
 		kvmalloc((alloc_pages) * PAGE_SIZE, gfp),		\
 		kvfree(p));						\
 	checker((expected_pages) * PAGE_SIZE,				\
-		kvmalloc_node((alloc_pages) * PAGE_SIZE, gfp, NUMA_NO_NODE), \
+		kvmalloc_node((alloc_pages) * PAGE_SIZE, 1, gfp, NUMA_NO_NODE), \
 		kvfree(p));						\
 	checker((expected_pages) * PAGE_SIZE,				\
 		kvzalloc((alloc_pages) * PAGE_SIZE, gfp),		\
 		kvfree(p));						\
 	checker((expected_pages) * PAGE_SIZE,				\
-		kvzalloc_node((alloc_pages) * PAGE_SIZE, gfp, NUMA_NO_NODE), \
+		kvzalloc_node((alloc_pages) * PAGE_SIZE, 1, gfp, NUMA_NO_NODE), \
 		kvfree(p));						\
 	checker((expected_pages) * PAGE_SIZE,				\
 		kvcalloc(1, (alloc_pages) * PAGE_SIZE, gfp),		\
diff --git a/lib/tests/overflow_kunit.c b/lib/tests/overflow_kunit.c
index 19cb03b25dc5..3eede04baa08 100644
--- a/lib/tests/overflow_kunit.c
+++ b/lib/tests/overflow_kunit.c
@@ -608,18 +608,19 @@ static void shift_nonsense_test(struct kunit *test)
  * the DEFINE_TEST_ALLOC() instances for mapping of the "bits".
  */
 #define alloc_GFP		 (GFP_KERNEL | __GFP_NOWARN)
-#define alloc010(alloc, arg, sz) alloc(sz, alloc_GFP)
-#define alloc011(alloc, arg, sz) alloc(sz, alloc_GFP, NUMA_NO_NODE)
-#define alloc000(alloc, arg, sz) alloc(sz)
-#define alloc001(alloc, arg, sz) alloc(sz, NUMA_NO_NODE)
-#define alloc110(alloc, arg, sz) alloc(arg, sz, alloc_GFP)
+#define alloc0010(alloc, arg, sz) alloc(sz, alloc_GFP)
+#define alloc0011(alloc, arg, sz) alloc(sz, alloc_GFP, NUMA_NO_NODE)
+#define alloc0000(alloc, arg, sz) alloc(sz)
+#define alloc0111(alloc, arg, sz) alloc(sz, 1, alloc_GFP, NUMA_NO_NODE)
+#define alloc0001(alloc, arg, sz) alloc(sz, NUMA_NO_NODE)
+#define alloc1010(alloc, arg, sz) alloc(arg, sz, alloc_GFP)
 #define free0(free, arg, ptr)	 free(ptr)
 #define free1(free, arg, ptr)	 free(arg, ptr)
 
 /* Wrap around to 16K */
 #define TEST_SIZE		(5 * 4096)
 
-#define DEFINE_TEST_ALLOC(func, free_func, want_arg, want_gfp, want_node)\
+#define DEFINE_TEST_ALLOC(func, free_func, want_arg, want_align, want_gfp, want_node)\
 static void test_ ## func (struct kunit *test, void *arg)		\
 {									\
 	volatile size_t a = TEST_SIZE;					\
@@ -627,21 +628,22 @@ static void test_ ## func (struct kunit *test, void *arg)		\
 	void *ptr;							\
 									\
 	/* Tiny allocation test. */					\
-	ptr = alloc ## want_arg ## want_gfp ## want_node (func, arg, 1);\
+	ptr = alloc ## want_arg ## want_align ## want_gfp ##		\
+		want_node(func, arg, 1);				\
 	KUNIT_ASSERT_NOT_ERR_OR_NULL_MSG(test, ptr,			\
 			    #func " failed regular allocation?!\n");	\
 	free ## want_arg (free_func, arg, ptr);				\
 									\
 	/* Wrapped allocation test. */					\
-	ptr = alloc ## want_arg ## want_gfp ## want_node (func, arg,	\
-							  a * b);	\
+	ptr = alloc ## want_arg ## want_align ## want_gfp ##		\
+		want_node(func, arg, a * b);				\
 	KUNIT_ASSERT_NOT_ERR_OR_NULL_MSG(test, ptr,			\
 			    #func " unexpectedly failed bad wrapping?!\n"); \
 	free ## want_arg (free_func, arg, ptr);				\
 									\
 	/* Saturated allocation test. */				\
-	ptr = alloc ## want_arg ## want_gfp ## want_node (func, arg,	\
-						   array_size(a, b));	\
+	ptr = alloc ## want_arg ## want_align ## want_gfp ##		\
+		want_node(func, arg, array_size(a, b));			\
 	if (ptr) {							\
 		KUNIT_FAIL(test, #func " missed saturation!\n");	\
 		free ## want_arg (free_func, arg, ptr);			\
@@ -649,22 +651,23 @@ static void test_ ## func (struct kunit *test, void *arg)		\
 }
 
 /*
- * Allocator uses a trailing node argument --------+  (e.g. kmalloc_node())
- * Allocator uses the gfp_t argument -----------+  |  (e.g. kmalloc())
- * Allocator uses a special leading argument +  |  |  (e.g. devm_kmalloc())
- *                                           |  |  |
+ * Allocator uses a trailing node argument -----------+  (e.g. kmalloc_node())
+ * Allocator uses the gfp_t argument --------------+  |  (e.g. kmalloc())
+ * Allocator uses align argument ---------------+  |  |  (e.g. kvmalloc_node())
+ * Allocator uses a special leading argument +  |  |  |  (e.g. devm_kmalloc())
+ *                                           |  |  |  |
  */
-DEFINE_TEST_ALLOC(kmalloc,	 kfree,	     0, 1, 0);
-DEFINE_TEST_ALLOC(kmalloc_node,	 kfree,	     0, 1, 1);
-DEFINE_TEST_ALLOC(kzalloc,	 kfree,	     0, 1, 0);
-DEFINE_TEST_ALLOC(kzalloc_node,  kfree,	     0, 1, 1);
-DEFINE_TEST_ALLOC(__vmalloc,	 vfree,	     0, 1, 0);
-DEFINE_TEST_ALLOC(kvmalloc,	 kvfree,     0, 1, 0);
-DEFINE_TEST_ALLOC(kvmalloc_node, kvfree,     0, 1, 1);
-DEFINE_TEST_ALLOC(kvzalloc,	 kvfree,     0, 1, 0);
-DEFINE_TEST_ALLOC(kvzalloc_node, kvfree,     0, 1, 1);
-DEFINE_TEST_ALLOC(devm_kmalloc,  devm_kfree, 1, 1, 0);
-DEFINE_TEST_ALLOC(devm_kzalloc,  devm_kfree, 1, 1, 0);
+DEFINE_TEST_ALLOC(kmalloc,	 kfree,	     0, 0, 1, 0);
+DEFINE_TEST_ALLOC(kmalloc_node,	 kfree,	     0, 0, 1, 1);
+DEFINE_TEST_ALLOC(kzalloc,	 kfree,	     0, 0, 1, 0);
+DEFINE_TEST_ALLOC(kzalloc_node,  kfree,	     0, 0, 1, 1);
+DEFINE_TEST_ALLOC(__vmalloc,	 vfree,	     0, 0, 1, 0);
+DEFINE_TEST_ALLOC(kvmalloc,	 kvfree,     0, 0, 1, 0);
+DEFINE_TEST_ALLOC(kvmalloc_node, kvfree,     0, 1, 1, 1);
+DEFINE_TEST_ALLOC(kvzalloc,	 kvfree,     0, 0, 1, 0);
+DEFINE_TEST_ALLOC(kvzalloc_node, kvfree,     0, 1, 1, 1);
+DEFINE_TEST_ALLOC(devm_kmalloc,  devm_kfree, 1, 0, 1, 0);
+DEFINE_TEST_ALLOC(devm_kzalloc,  devm_kfree, 1, 0, 1, 0);
 
 static void overflow_allocation_test(struct kunit *test)
 {
diff --git a/mm/shrinker.c b/mm/shrinker.c
index 4a93fd433689..10b5913f0583 100644
--- a/mm/shrinker.c
+++ b/mm/shrinker.c
@@ -82,7 +82,7 @@ int alloc_shrinker_info(struct mem_cgroup *memcg)
 	mutex_lock(&shrinker_mutex);
 	array_size = shrinker_unit_size(shrinker_nr_max);
 	for_each_node(nid) {
-		struct shrinker_info *info = kvzalloc_node(sizeof(*info) + array_size,
+		struct shrinker_info *info = kvzalloc_node(sizeof(*info) + array_size, 1,
 							   GFP_KERNEL, nid);
 		if (!info)
 			goto err;
@@ -128,7 +128,7 @@ static int expand_one_shrinker_info(struct mem_cgroup *memcg, int new_size,
 		if (new_nr_max <= old->map_nr_max)
 			continue;
 
-		new = kvzalloc_node(sizeof(*new) + new_size, GFP_KERNEL, nid);
+		new = kvzalloc_node(sizeof(*new) + new_size, 1, GFP_KERNEL, nid);
 		if (!new)
 			return -ENOMEM;
 
diff --git a/mm/slub.c b/mm/slub.c
index c4b64821e680..733395642f06 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -4845,7 +4845,7 @@ void kfree(const void *object)
 EXPORT_SYMBOL(kfree);
 
 static __always_inline __realloc_size(2) void *
-__do_krealloc(const void *p, size_t new_size, gfp_t flags)
+__do_krealloc(const void *p, size_t new_size, unsigned long align, gfp_t flags, int nid)
 {
 	void *ret;
 	size_t ks = 0;
@@ -4859,6 +4859,19 @@ __do_krealloc(const void *p, size_t new_size, gfp_t flags)
 	if (!kasan_check_byte(p))
 		return NULL;
 
+	/* refuse to proceed if alignment is bigger than what kmalloc() provides */
+	if (((uintptr_t)p & (align - 1)) || new_size < align)
+		return NULL;
+
+	/*
+	 * it is possible to support reallocation with a different nid, but
+	 * it doesn't go well with the concept of krealloc(). Such
+	 * reallocation should be done explicitly instead.
+	 */
+	if (WARN(nid != NUMA_NO_NODE && nid != page_to_nid(virt_to_page(p)),
+				"krealloc() has mismatched nids\n"))
+		return NULL;
+
 	if (is_kfence_address(p)) {
 		ks = orig_size = kfence_ksize(p);
 	} else {
@@ -4903,7 +4916,7 @@ __do_krealloc(const void *p, size_t new_size, gfp_t flags)
 	return (void *)p;
 
 alloc_new:
-	ret = kmalloc_node_track_caller_noprof(new_size, flags, NUMA_NO_NODE, _RET_IP_);
+	ret = kmalloc_node_track_caller_noprof(new_size, flags, nid, _RET_IP_);
 	if (ret && p) {
 		/* Disable KASAN checks as the object's redzone is accessed. */
 		kasan_disable_current();
@@ -4918,7 +4931,9 @@ __do_krealloc(const void *p, size_t new_size, gfp_t flags)
  * krealloc - reallocate memory. The contents will remain unchanged.
  * @p: object to reallocate memory for.
  * @new_size: how many bytes of memory are required.
+ * @align: desired alignment.
  * @flags: the type of memory to allocate.
+ * @nid: NUMA node or NUMA_NO_NODE
  *
  * If @p is %NULL, krealloc() behaves exactly like kmalloc().  If @new_size
  * is 0 and @p is not a %NULL pointer, the object pointed to is freed.
@@ -4947,7 +4962,8 @@ __do_krealloc(const void *p, size_t new_size, gfp_t flags)
  *
  * Return: pointer to the allocated memory or %NULL in case of error
  */
-void *krealloc_noprof(const void *p, size_t new_size, gfp_t flags)
+void *krealloc_node_noprof(const void *p, size_t new_size, unsigned long align,
+			   gfp_t flags, int nid)
 {
 	void *ret;
 
@@ -4956,13 +4972,13 @@ void *krealloc_noprof(const void *p, size_t new_size, gfp_t flags)
 		return ZERO_SIZE_PTR;
 	}
 
-	ret = __do_krealloc(p, new_size, flags);
+	ret = __do_krealloc(p, new_size, align, flags, nid);
 	if (ret && kasan_reset_tag(p) != kasan_reset_tag(ret))
 		kfree(p);
 
 	return ret;
 }
-EXPORT_SYMBOL(krealloc_noprof);
+EXPORT_SYMBOL(krealloc_node_noprof);
 
 static gfp_t kmalloc_gfp_adjust(gfp_t flags, size_t size)
 {
@@ -4993,6 +5009,7 @@ static gfp_t kmalloc_gfp_adjust(gfp_t flags, size_t size)
  * failure, fall back to non-contiguous (vmalloc) allocation.
  * @size: size of the request.
  * @b: which set of kmalloc buckets to allocate from.
+ * @align: desired alignment.
  * @flags: gfp mask for the allocation - must be compatible (superset) with GFP_KERNEL.
  * @node: numa node to allocate from
  *
@@ -5005,19 +5022,22 @@ static gfp_t kmalloc_gfp_adjust(gfp_t flags, size_t size)
  *
  * Return: pointer to the allocated memory of %NULL in case of failure
  */
-void *__kvmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node)
+void *__kvmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), unsigned long align,
+			     gfp_t flags, int node)
 {
 	void *ret;
 
 	/*
 	 * It doesn't really make sense to fallback to vmalloc for sub page
-	 * requests
+	 * requests and small alignments
 	 */
-	ret = __do_kmalloc_node(size, PASS_BUCKET_PARAM(b),
-				kmalloc_gfp_adjust(flags, size),
-				node, _RET_IP_);
-	if (ret || size <= PAGE_SIZE)
-		return ret;
+	if (size >= align) {
+		ret = __do_kmalloc_node(size, PASS_BUCKET_PARAM(b),
+					kmalloc_gfp_adjust(flags, size),
+					node, _RET_IP_);
+		if (ret || size <= PAGE_SIZE)
+			return ret;
+	}
 
 	/* non-sleeping allocations are not supported by vmalloc */
 	if (!gfpflags_allow_blocking(flags))
@@ -5035,7 +5055,7 @@ void *__kvmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node)
 	 * about the resulting pointer, and cannot play
 	 * protection games.
 	 */
-	return __vmalloc_node_range_noprof(size, 1, VMALLOC_START, VMALLOC_END,
+	return __vmalloc_node_range_noprof(size, align, VMALLOC_START, VMALLOC_END,
 			flags, PAGE_KERNEL, VM_ALLOW_HUGE_VMAP,
 			node, __builtin_return_address(0));
 }
@@ -5079,10 +5099,12 @@ void kvfree_sensitive(const void *addr, size_t len)
 EXPORT_SYMBOL(kvfree_sensitive);
 
 /**
- * kvrealloc - reallocate memory; contents remain unchanged
+ * kvrealloc_node - reallocate memory; contents remain unchanged
  * @p: object to reallocate memory for
  * @size: the size to reallocate
+ * @align: desired alignment
  * @flags: the flags for the page level allocator
+ * @nid: NUMA node id
  *
  * If @p is %NULL, kvrealloc() behaves exactly like kvmalloc(). If @size is 0
  * and @p is not a %NULL pointer, the object pointed to is freed.
@@ -5100,17 +5122,17 @@ EXPORT_SYMBOL(kvfree_sensitive);
  *
  * Return: pointer to the allocated memory or %NULL in case of error
  */
-void *kvrealloc_noprof(const void *p, size_t size, gfp_t flags)
+void *kvrealloc_node_noprof(const void *p, size_t size, unsigned long align, gfp_t flags, int nid)
 {
 	void *n;
 
 	if (is_vmalloc_addr(p))
-		return vrealloc_noprof(p, size, flags);
+		return vrealloc_node_noprof(p, size, align, flags, nid);
 
-	n = krealloc_noprof(p, size, kmalloc_gfp_adjust(flags, size));
+	n = krealloc_node_noprof(p, size, align, kmalloc_gfp_adjust(flags, size), nid);
 	if (!n) {
 		/* We failed to krealloc(), fall back to kvmalloc(). */
-		n = kvmalloc_noprof(size, flags);
+		n = kvmalloc_node_noprof(size, align, flags, nid);
 		if (!n)
 			return NULL;
 
@@ -5126,7 +5148,7 @@ void *kvrealloc_noprof(const void *p, size_t size, gfp_t flags)
 
 	return n;
 }
-EXPORT_SYMBOL(kvrealloc_noprof);
+EXPORT_SYMBOL(kvrealloc_node_noprof);
 
 struct detached_freelist {
 	struct slab *slab;
diff --git a/net/netfilter/x_tables.c b/net/netfilter/x_tables.c
index 709840612f0d..69d06fc5637a 100644
--- a/net/netfilter/x_tables.c
+++ b/net/netfilter/x_tables.c
@@ -1352,7 +1352,7 @@ static int xt_jumpstack_alloc(struct xt_table_info *i)
 	 */
 	size = sizeof(void *) * i->stacksize * 2u;
 	for_each_possible_cpu(cpu) {
-		i->jumpstack[cpu] = kvmalloc_node(size, GFP_KERNEL,
+		i->jumpstack[cpu] = kvmalloc_node(size, 1, GFP_KERNEL,
 			cpu_to_node(cpu));
 		if (i->jumpstack[cpu] == NULL)
 			/*
diff --git a/net/rds/ib_cm.c b/net/rds/ib_cm.c
index 26b069e1999d..e46759b5ba4e 100644
--- a/net/rds/ib_cm.c
+++ b/net/rds/ib_cm.c
@@ -471,12 +471,12 @@ static struct rds_header **rds_dma_hdrs_alloc(struct rds_ib_device *dev,
 	dma_addr_t *hdr_daddrs;
 	u32 i;
 
-	hdrs = kvmalloc_node(sizeof(*hdrs) * num_hdrs, GFP_KERNEL,
+	hdrs = kvmalloc_node(sizeof(*hdrs) * num_hdrs, 1, GFP_KERNEL,
 			     ibdev_to_node(dev->dev));
 	if (!hdrs)
 		return NULL;
 
-	hdr_daddrs = kvmalloc_node(sizeof(*hdr_daddrs) * num_hdrs, GFP_KERNEL,
+	hdr_daddrs = kvmalloc_node(sizeof(*hdr_daddrs) * num_hdrs, 1, GFP_KERNEL,
 				   ibdev_to_node(dev->dev));
 	if (!hdr_daddrs) {
 		kvfree(hdrs);
diff --git a/net/sched/sch_fq.c b/net/sched/sch_fq.c
index 902ff5470607..0e5f38a899b3 100644
--- a/net/sched/sch_fq.c
+++ b/net/sched/sch_fq.c
@@ -894,7 +894,8 @@ static int fq_resize(struct Qdisc *sch, u32 log)
 		return 0;
 
 	/* If XPS was setup, we can allocate memory on right NUMA node */
-	array = kvmalloc_node(sizeof(struct rb_root) << log, GFP_KERNEL | __GFP_RETRY_MAYFAIL,
+	array = kvmalloc_node(sizeof(struct rb_root) << log, 1,
+			      GFP_KERNEL | __GFP_RETRY_MAYFAIL,
 			      netdev_queue_numa_node_read(sch->dev_queue));
 	if (!array)
 		return -ENOMEM;
-- 
2.39.2

