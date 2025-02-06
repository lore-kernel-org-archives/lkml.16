Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3EFC22578D;
	Thu,  6 Feb 2025 06:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738824354; cv=none; b=tV/bjnfllXTmLPNLbDqcWSqNXYc/kuneQ4CHLQKhANkxqPCHSHyXDKWxMqGLVwgq5tjye+U+5ZsDwiDZE2rPpQOXDwdLR9Zk/sYfBnT6L/NfbsDaQDIlE0M6YaBdyk+tlc1W7uxIlr8eHfJqeSgR/pKVnj5NkqCjtjpaBxc3aIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738824354; c=relaxed/simple;
	bh=EIEr+puCLYTFk3Qe+Nq+9vJVxDiHJtXiBQZsdmIEDWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QYyODQQ58LlqEx6BM6Nv1zXn467UZ8QnuotMSzHhVlUhHLAfNI7dciPGsrLkp/LevBfUmUG0Ku3olw2Vfm+fEjJ0Fp1SVWWA4AQggC1bE7MvFyd4eDBjYSMJPT0qveSy/fK0OCMujnr+vMkxCR90u4m5QO5rJ7VviG1KnSR1ZsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=bU+YVAYq; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="bU+YVAYq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=mNO50
	0sNfrFBXq6NhgMe/UQ/zvJtR1wiByIe/1AQOgo=; b=bU+YVAYq5Rvja1cZToram
	i+cYZwAJ95rUXF0tGJwONBvL5Y7fK+n0GqGuAtuBMyXmBEtdjzzh3Xoh/8JrPigK
	0LLQYb8mpjQptJRDVRnlOziQphoXBsPb0CQ8OKEFz8iRFeY0Y/VakUzEw8J8/Ocj
	24a8KRBAQ65XwzXsFU34ao=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3fyNsWqRnb3bDKQ--.52146S3;
	Thu, 06 Feb 2025 14:45:05 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	daniel@fooishbar.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v13 01/13] drm/rockchip: vop2: use devm_regmap_field_alloc for cluster-regs
Date: Thu,  6 Feb 2025 14:44:29 +0800
Message-ID: <20250206064457.11396-2-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206064457.11396-1-andyshrk@163.com>
References: <20250206064457.11396-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3fyNsWqRnb3bDKQ--.52146S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFW7GFWUWrykJr4fGF17Wrg_yoWrZr4xpF
	4rCwnxuF45Grn29rykAr1DAF1Fk397ta1rCFn7uwnI9rnFgrZ7C3WDCw1jyrs0kryv9F9r
	tFsxt39xua4Ygr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jb9N3UUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0h3rXmekTP7+PQAAsI

From: Heiko Stuebner <heiko@sntech.de>

Right now vop2_cluster_init() copies the base vop2_cluster_regs
and adapts the reg value with the current window's offset before
adding the fields to the regmap.

This conflicts with the notion of reg_fields being const, see
https://lore.kernel.org/all/20240706-regmap-const-structs-v1-1-d08c776da787@weissschuh.net/
for reference, which now causes checkpatch to actually warn about that.

So instead of creating one big copy and changing it afterwards,
add the reg_fields individually using devm_regmap_field_alloc().

Functional it is the same, just that the reg_field we're handling
can stay const.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

(no changes since v1)

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 66 +++++++++-----------
 1 file changed, 31 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 17a98845fd31..03248ac4ba4a 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -3372,7 +3372,7 @@ static int vop2_find_rgb_encoder(struct vop2 *vop2)
 	return -ENOENT;
 }
 
-static struct reg_field vop2_cluster_regs[VOP2_WIN_MAX_REG] = {
+static const struct reg_field vop2_cluster_regs[VOP2_WIN_MAX_REG] = {
 	[VOP2_WIN_ENABLE] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 0, 0),
 	[VOP2_WIN_FORMAT] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 1, 5),
 	[VOP2_WIN_RB_SWAP] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 14, 14),
@@ -3443,28 +3443,26 @@ static struct reg_field vop2_cluster_regs[VOP2_WIN_MAX_REG] = {
 static int vop2_cluster_init(struct vop2_win *win)
 {
 	struct vop2 *vop2 = win->vop2;
-	struct reg_field *cluster_regs;
-	int ret, i;
-
-	cluster_regs = kmemdup(vop2_cluster_regs, sizeof(vop2_cluster_regs),
-			       GFP_KERNEL);
-	if (!cluster_regs)
-		return -ENOMEM;
-
-	for (i = 0; i < ARRAY_SIZE(vop2_cluster_regs); i++)
-		if (cluster_regs[i].reg != 0xffffffff)
-			cluster_regs[i].reg += win->offset;
+	int i;
 
-	ret = devm_regmap_field_bulk_alloc(vop2->dev, vop2->map, win->reg,
-					   cluster_regs,
-					   ARRAY_SIZE(vop2_cluster_regs));
+	for (i = 0; i < ARRAY_SIZE(vop2_cluster_regs); i++) {
+		const struct reg_field field = {
+			.reg = (vop2_cluster_regs[i].reg != 0xffffffff) ?
+					vop2_cluster_regs[i].reg + win->offset :
+					vop2_cluster_regs[i].reg,
+			.lsb = vop2_cluster_regs[i].lsb,
+			.msb = vop2_cluster_regs[i].msb
+		};
 
-	kfree(cluster_regs);
+		win->reg[i] = devm_regmap_field_alloc(vop2->dev, vop2->map, field);
+		if (IS_ERR(win->reg[i]))
+			return PTR_ERR(win->reg[i]);
+	}
 
-	return ret;
+	return 0;
 };
 
-static struct reg_field vop2_esmart_regs[VOP2_WIN_MAX_REG] = {
+static const struct reg_field vop2_esmart_regs[VOP2_WIN_MAX_REG] = {
 	[VOP2_WIN_ENABLE] = REG_FIELD(RK3568_SMART_REGION0_CTRL, 0, 0),
 	[VOP2_WIN_FORMAT] = REG_FIELD(RK3568_SMART_REGION0_CTRL, 1, 5),
 	[VOP2_WIN_DITHER_UP] = REG_FIELD(RK3568_SMART_REGION0_CTRL, 12, 12),
@@ -3531,26 +3529,24 @@ static struct reg_field vop2_esmart_regs[VOP2_WIN_MAX_REG] = {
 static int vop2_esmart_init(struct vop2_win *win)
 {
 	struct vop2 *vop2 = win->vop2;
-	struct reg_field *esmart_regs;
-	int ret, i;
-
-	esmart_regs = kmemdup(vop2_esmart_regs, sizeof(vop2_esmart_regs),
-			      GFP_KERNEL);
-	if (!esmart_regs)
-		return -ENOMEM;
-
-	for (i = 0; i < ARRAY_SIZE(vop2_esmart_regs); i++)
-		if (esmart_regs[i].reg != 0xffffffff)
-			esmart_regs[i].reg += win->offset;
+	int i;
 
-	ret = devm_regmap_field_bulk_alloc(vop2->dev, vop2->map, win->reg,
-					   esmart_regs,
-					   ARRAY_SIZE(vop2_esmart_regs));
+	for (i = 0; i < ARRAY_SIZE(vop2_esmart_regs); i++) {
+		const struct reg_field field = {
+			.reg = (vop2_esmart_regs[i].reg != 0xffffffff) ?
+				vop2_esmart_regs[i].reg + win->offset :
+				vop2_esmart_regs[i].reg,
+			.lsb = vop2_esmart_regs[i].lsb,
+			.msb = vop2_esmart_regs[i].msb
+		};
 
-	kfree(esmart_regs);
+		win->reg[i] = devm_regmap_field_alloc(vop2->dev, vop2->map, field);
+		if (IS_ERR(win->reg[i]))
+			return PTR_ERR(win->reg[i]);
+	}
 
-	return ret;
-};
+	return 0;
+}
 
 static int vop2_win_init(struct vop2 *vop2)
 {
-- 
2.34.1

