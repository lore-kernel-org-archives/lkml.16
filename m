Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22A71A0BF3
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864344; cv=none; b=HfJ7XwCQTANf3IvTrSJGt2m221fCxEPV3ZFww8A/bPqsUDgBGTOzH26J9AF5XrhJBFeFJ+N5ZicOaqX8MAI9J9ZVBGUKDhYXf+ae1Ksnr/MmaqB8StF7RRj26loF/opW8299Wu2utt48RaoDKTkyQaxpwjASrLVXBsm5/1CwoAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864344; c=relaxed/simple;
	bh=sOnlAqGSZHkUIuSI9IRtediAEqFBvxfmXw4auStj8Fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h14WphxAeF8A4vuBuLHAxzPU3TYDK3iiJliaPZ8LWyLXtvTnbdrqL+pLThUksedWBGzduvJrMl37biFxzL9iQnXMWZn+BVrHrxEc5tune9XheQD3nPFOOXMmdY4sH9yY1VEV0W4RKfN4dV52PdPZLUImjx36LQvEmQKuPrSvAcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=l4xzTRSR; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="l4xzTRSR"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl6t2xKPzlgTtf;
	Thu,  6 Feb 2025 17:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864325; x=1741456326; bh=u+SBy
	7IZPqVOssXTOdGlWFcLGGX1eiuHEhhWf0QUoEE=; b=l4xzTRSR+R12tH7eRUMcZ
	xS4tx4jHtIr8v0gRV5FKYP81dTix4vkkoOIcwXA8lN8cx3PLAi/hP+bpMv2CWw4I
	U9klyoVxQQzxkwPqBgoxGPZsvBExnVO2NXFw0u9akLz3+ZB99UbRDR2bZAIH9tdV
	pJNIUnVYMrbh6ifuSy6V0lc7PaC11dwsllRWiIKwdKIQF8U4vxZZiaJXQLRV7XAf
	qQXSGBjLULZxOMq3WGSnfZSCAfyBLLOLBmR5kmprDz4tzEJvwd9TjFEcladw2kaN
	IrJYKBhIgufIHOi8AkzTLJgCAKbDF3bqcWQXnI52VnHUQDrlmXkXDkuShHWQNZTb
	Q==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 45mTB--LRwIZ; Thu,  6 Feb 2025 17:52:05 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl6V3QtdzlgTwF;
	Thu,  6 Feb 2025 17:52:02 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Cosmin Ratiu <cratiu@nvidia.com>,
	Lior Nahmanson <liorna@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH RFC 16/33] net/mlx5e: Make the code easier to analyze
Date: Thu,  6 Feb 2025 09:50:57 -0800
Message-ID: <20250206175114.1974171-17-bvanassche@acm.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
In-Reply-To: <20250206175114.1974171-1-bvanassche@acm.org>
References: <20250206175114.1974171-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Make it possible for clang to perform its compile-time thread-safety
analysis by making the arguments of mutex_lock() and mutex_unlock() deriv=
ed
from function arguments instead of local variables. Additionally, move
initializers of variables that are not changed into the declaration block=
.

Cc: Dragos Tatulea <dtatulea@nvidia.com>
Cc: Cosmin Ratiu <cratiu@nvidia.com>
Cc: Lior Nahmanson <liorna@nvidia.com>
Cc: Tariq Toukan <tariqt@nvidia.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 .../mellanox/mlx5/core/en_accel/macsec.c      | 62 +++++++------------
 1 file changed, 24 insertions(+), 38 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec.c b/=
drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec.c
index 6ab02f3fc291..97d8fcde3648 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec.c
@@ -510,12 +510,11 @@ static int mlx5e_macsec_add_txsa(struct macsec_cont=
ext *ctx)
 	struct mlx5_core_dev *mdev =3D priv->mdev;
 	u8 assoc_num =3D ctx->sa.assoc_num;
 	struct mlx5e_macsec_sa *tx_sa;
-	struct mlx5e_macsec *macsec;
+	struct mlx5e_macsec *macsec =3D priv->macsec;
 	int err =3D 0;
=20
-	mutex_lock(&priv->macsec->lock);
+	mutex_lock(&macsec->lock);
=20
-	macsec =3D priv->macsec;
 	macsec_device =3D mlx5e_macsec_get_macsec_device_context(macsec, ctx);
 	if (!macsec_device) {
 		netdev_err(ctx->netdev, "MACsec offload: Failed to find device context=
\n");
@@ -581,13 +580,12 @@ static int mlx5e_macsec_upd_txsa(struct macsec_cont=
ext *ctx)
 	struct mlx5e_macsec_device *macsec_device;
 	u8 assoc_num =3D ctx->sa.assoc_num;
 	struct mlx5e_macsec_sa *tx_sa;
-	struct mlx5e_macsec *macsec;
+	struct mlx5e_macsec *macsec =3D priv->macsec;
 	struct net_device *netdev;
 	int err =3D 0;
=20
-	mutex_lock(&priv->macsec->lock);
+	mutex_lock(&macsec->lock);
=20
-	macsec =3D priv->macsec;
 	netdev =3D ctx->netdev;
 	macsec_device =3D mlx5e_macsec_get_macsec_device_context(macsec, ctx);
 	if (!macsec_device) {
@@ -641,11 +639,10 @@ static int mlx5e_macsec_del_txsa(struct macsec_cont=
ext *ctx)
 	struct mlx5e_macsec_device *macsec_device;
 	u8 assoc_num =3D ctx->sa.assoc_num;
 	struct mlx5e_macsec_sa *tx_sa;
-	struct mlx5e_macsec *macsec;
+	struct mlx5e_macsec *macsec =3D priv->macsec;
 	int err =3D 0;
=20
-	mutex_lock(&priv->macsec->lock);
-	macsec =3D priv->macsec;
+	mutex_lock(&macsec->lock);
 	macsec_device =3D mlx5e_macsec_get_macsec_device_context(macsec, ctx);
 	if (!macsec_device) {
 		netdev_err(ctx->netdev, "MACsec offload: Failed to find device context=
\n");
@@ -679,11 +676,10 @@ static int mlx5e_macsec_add_rxsc(struct macsec_cont=
ext *ctx)
 	struct mlx5e_macsec_device *macsec_device;
 	struct mlx5e_macsec_rx_sc *rx_sc;
 	struct list_head *rx_sc_list;
-	struct mlx5e_macsec *macsec;
+	struct mlx5e_macsec *macsec =3D priv->macsec;
 	int err =3D 0;
=20
-	mutex_lock(&priv->macsec->lock);
-	macsec =3D priv->macsec;
+	mutex_lock(&macsec->lock);
 	macsec_device =3D mlx5e_macsec_get_macsec_device_context(macsec, ctx);
 	if (!macsec_device) {
 		netdev_err(ctx->netdev, "MACsec offload: Failed to find device context=
\n");
@@ -759,14 +755,12 @@ static int mlx5e_macsec_upd_rxsc(struct macsec_cont=
ext *ctx)
 	struct mlx5e_macsec_device *macsec_device;
 	struct mlx5e_macsec_rx_sc *rx_sc;
 	struct mlx5e_macsec_sa *rx_sa;
-	struct mlx5e_macsec *macsec;
+	struct mlx5e_macsec *macsec =3D priv->macsec;
 	struct list_head *list;
 	int i;
 	int err =3D 0;
=20
-	mutex_lock(&priv->macsec->lock);
-
-	macsec =3D priv->macsec;
+	mutex_lock(&macsec->lock);
 	macsec_device =3D mlx5e_macsec_get_macsec_device_context(macsec, ctx);
 	if (!macsec_device) {
 		netdev_err(ctx->netdev, "MACsec offload: Failed to find device context=
\n");
@@ -838,13 +832,11 @@ static int mlx5e_macsec_del_rxsc(struct macsec_cont=
ext *ctx)
 	struct mlx5e_priv *priv =3D macsec_netdev_priv(ctx->netdev);
 	struct mlx5e_macsec_device *macsec_device;
 	struct mlx5e_macsec_rx_sc *rx_sc;
-	struct mlx5e_macsec *macsec;
+	struct mlx5e_macsec *macsec =3D priv->macsec;
 	struct list_head *list;
 	int err =3D 0;
=20
-	mutex_lock(&priv->macsec->lock);
-
-	macsec =3D priv->macsec;
+	mutex_lock(&macsec->lock);
 	macsec_device =3D mlx5e_macsec_get_macsec_device_context(macsec, ctx);
 	if (!macsec_device) {
 		netdev_err(ctx->netdev, "MACsec offload: Failed to find device context=
\n");
@@ -879,13 +871,11 @@ static int mlx5e_macsec_add_rxsa(struct macsec_cont=
ext *ctx)
 	struct mlx5e_macsec_rx_sc *rx_sc;
 	sci_t sci =3D ctx_rx_sa->sc->sci;
 	struct mlx5e_macsec_sa *rx_sa;
-	struct mlx5e_macsec *macsec;
+	struct mlx5e_macsec *macsec =3D priv->macsec;
 	struct list_head *list;
 	int err =3D 0;
=20
-	mutex_lock(&priv->macsec->lock);
-
-	macsec =3D priv->macsec;
+	mutex_lock(&macsec->lock);
 	macsec_device =3D mlx5e_macsec_get_macsec_device_context(macsec, ctx);
 	if (!macsec_device) {
 		netdev_err(ctx->netdev, "MACsec offload: Failed to find device context=
\n");
@@ -963,13 +953,11 @@ static int mlx5e_macsec_upd_rxsa(struct macsec_cont=
ext *ctx)
 	struct mlx5e_macsec_rx_sc *rx_sc;
 	sci_t sci =3D ctx_rx_sa->sc->sci;
 	struct mlx5e_macsec_sa *rx_sa;
-	struct mlx5e_macsec *macsec;
+	struct mlx5e_macsec *macsec =3D priv->macsec;
 	struct list_head *list;
 	int err =3D 0;
=20
-	mutex_lock(&priv->macsec->lock);
-
-	macsec =3D priv->macsec;
+	mutex_lock(&macsec->lock);
 	macsec_device =3D mlx5e_macsec_get_macsec_device_context(macsec, ctx);
 	if (!macsec_device) {
 		netdev_err(ctx->netdev, "MACsec offload: Failed to find device context=
\n");
@@ -1020,13 +1008,11 @@ static int mlx5e_macsec_del_rxsa(struct macsec_co=
ntext *ctx)
 	struct mlx5e_macsec_rx_sc *rx_sc;
 	u8 assoc_num =3D ctx->sa.assoc_num;
 	struct mlx5e_macsec_sa *rx_sa;
-	struct mlx5e_macsec *macsec;
+	struct mlx5e_macsec *macsec =3D priv->macsec;
 	struct list_head *list;
 	int err =3D 0;
=20
-	mutex_lock(&priv->macsec->lock);
-
-	macsec =3D priv->macsec;
+	mutex_lock(&macsec->lock);
 	macsec_device =3D mlx5e_macsec_get_macsec_device_context(macsec, ctx);
 	if (!macsec_device) {
 		netdev_err(ctx->netdev, "MACsec offload: Failed to find device context=
\n");
@@ -1078,8 +1064,9 @@ static int mlx5e_macsec_add_secy(struct macsec_cont=
ext *ctx)
 	if (!mlx5e_macsec_secy_features_validate(ctx))
 		return -EINVAL;
=20
-	mutex_lock(&priv->macsec->lock);
 	macsec =3D priv->macsec;
+
+	mutex_lock(&macsec->lock);
 	if (mlx5e_macsec_get_macsec_device_context(macsec, ctx)) {
 		netdev_err(netdev, "MACsec offload: MACsec net_device already exist\n"=
);
 		goto out;
@@ -1180,9 +1167,9 @@ static int mlx5e_macsec_upd_secy(struct macsec_cont=
ext *ctx)
 	if (!mlx5e_macsec_secy_features_validate(ctx))
 		return -EINVAL;
=20
-	mutex_lock(&priv->macsec->lock);
-
 	macsec =3D priv->macsec;
+
+	mutex_lock(&macsec->lock);
 	macsec_device =3D mlx5e_macsec_get_macsec_device_context(macsec, ctx);
 	if (!macsec_device) {
 		netdev_err(ctx->netdev, "MACsec offload: Failed to find device context=
\n");
@@ -1229,13 +1216,12 @@ static int mlx5e_macsec_del_secy(struct macsec_co=
ntext *ctx)
 	struct mlx5e_macsec_device *macsec_device;
 	struct mlx5e_macsec_rx_sc *rx_sc, *tmp;
 	struct mlx5e_macsec_sa *tx_sa;
-	struct mlx5e_macsec *macsec;
+	struct mlx5e_macsec *macsec =3D priv->macsec;
 	struct list_head *list;
 	int err =3D 0;
 	int i;
=20
-	mutex_lock(&priv->macsec->lock);
-	macsec =3D priv->macsec;
+	mutex_lock(&macsec->lock);
 	macsec_device =3D mlx5e_macsec_get_macsec_device_context(macsec, ctx);
 	if (!macsec_device) {
 		netdev_err(ctx->netdev, "MACsec offload: Failed to find device context=
\n");
