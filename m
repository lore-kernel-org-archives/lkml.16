Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00BB24BD00;
	Mon, 23 Jun 2025 12:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680114; cv=none; b=D0b1Su3IDKWqeLT/70Fq9GkDg3CIDH+CRZRyhzDKrzLrbQ7FgHL1v9JdENEHMEzJbjOQltIkdlSdZgZ8duVOQyKJk7l8c23Xua1ymIOFB3ClIGUSMyOkV+T6IFUkJkRNkjvNcHt2gvRBP8uGh3aU/DqU9SDRMOWRwzJWeXehJ+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680114; c=relaxed/simple;
	bh=7+3qDAZFGfiGojBDB98yfVLQi/48x5P4sLWsKLj+ByI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q+ZriV2UYILxHD6Li6W2VvzH7oTQbWydBaH0C4k8shLdt+Ql/5PGyrr1mvQS7uVlVPZTIaZSuU0MH7JXx2nbcZ2ADzsz8CgjVNoPIKtB+y3cPmy7KGLHvDdxZvLMP8IOzhjbD38oRWupxOyhe83ReFOYvE0g+1r+1vRAdzT/bOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jqFozwkZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jqFozwkZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680111;
	bh=7+3qDAZFGfiGojBDB98yfVLQi/48x5P4sLWsKLj+ByI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jqFozwkZYPw1RhWp5Z+k9+JXMOPotEdU4Yp+aLukS5qw8I+kAptS8afdE6tjGpBTD
	 CmmRq7yNZkivSExcdlsCeiS35SrmqNFIUOxWiKP8llMXO4cY3QnHR04TkDFFFwDJIY
	 y0BWlruCrqSsC7Fm0s13cb1TanOjb85HoXgoBDIM2yY6sNtCiHyOoYzVrW+r+Sh3fR
	 XUgC+tyvy9UYy6cQF6R3O4+U0ekc8XJSjnuRgdX245eOqWWpZ6dBuXNau9ZtDbKdVM
	 2TrFR39VJjzsb3x0/K9xwGmgpQYBnUou6v9hrIcjNOzIx5ta/guywMn2HCHOMpvA4j
	 S5QeDk9D4p3uw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7149817E10D5;
	Mon, 23 Jun 2025 14:01:50 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 2/4] regulator: mtk-dvfsrc: Add support for Dimensity 1200 MT6893
Date: Mon, 23 Jun 2025 14:01:42 +0200
Message-ID: <20250623120144.109359-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120144.109359-1-angelogioacchino.delregno@collabora.com>
References: <20250623120144.109359-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MediaTek Dimensity 1200 (MT6893) features the same DVFSRC
regulators as the other currently supported SoCs, but with a
different select value: add an array describing the possible
voltages for the VCORE and VSCP regulators, and assign it to
a new compatible for this SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/regulator/mtk-dvfsrc-regulator.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/regulator/mtk-dvfsrc-regulator.c b/drivers/regulator/mtk-dvfsrc-regulator.c
index f5662c569464..5bc4d85517f0 100644
--- a/drivers/regulator/mtk-dvfsrc-regulator.c
+++ b/drivers/regulator/mtk-dvfsrc-regulator.c
@@ -117,6 +117,24 @@ static const struct dvfsrc_regulator_pdata mt6873_data = {
 	.size = ARRAY_SIZE(mt6873_regulators),
 };
 
+static const unsigned int mt6893_voltages[] = {
+	575000,
+	600000,
+	650000,
+	725000,
+	750000,
+};
+
+static const struct regulator_desc mt6893_regulators[] = {
+	MTK_DVFSRC_VREG("dvfsrc-vcore", VCORE, mt6893_voltages),
+	MTK_DVFSRC_VREG("dvfsrc-vscp", VSCP, mt6893_voltages),
+};
+
+static const struct dvfsrc_regulator_pdata mt6893_data = {
+	.descs = mt6893_regulators,
+	.size = ARRAY_SIZE(mt6893_regulators),
+};
+
 static const unsigned int mt8183_voltages[] = {
 	725000,
 	800000,
@@ -173,6 +191,7 @@ static int dvfsrc_vcore_regulator_probe(struct platform_device *pdev)
 
 static const struct of_device_id mtk_dvfsrc_regulator_match[] = {
 	{ .compatible = "mediatek,mt6873-dvfsrc-regulator", .data = &mt6873_data },
+	{ .compatible = "mediatek,mt6893-dvfsrc-regulator", .data = &mt6893_data },
 	{ .compatible = "mediatek,mt8183-dvfsrc-regulator", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8192-dvfsrc-regulator", .data = &mt6873_data },
 	{ .compatible = "mediatek,mt8195-dvfsrc-regulator", .data = &mt8195_data },
-- 
2.49.0

