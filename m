Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8942550D1;
	Fri,  2 May 2025 12:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746188254; cv=none; b=q+l2diEhQu86l7f2paoYP0zkYz0Y1zYn2TqmWnn+7YmC3GCVtqbyqXD5Ig5xGAL1ywX/226bJ3iBFBn/WKuRWjp+DSw5Dm0zC4jNz+wCjucecOG9NvWBkiSSmLDoRF5g/9ZZLIqS9GS/Q3/EbD2iDgHJiIcx5yEBLW58nFCGGCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746188254; c=relaxed/simple;
	bh=Q446XHlZ8iNz9WHxPKvx/WyR1/KrNJ61dHl/M96rkLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NZFVdj17EoKjBSTxL82rJmPy07tekGoCUwZD1KaL0iMeGZLEetRyerF05BX0wDZ/FQm5yHiai6YK150RxuTJkXkVZNad34ai4TQykRB2N2t30QdlXK189QBF0gibCosGF+TIUy3NOc/HhcTCyTOJdPhaBGYqBCLc9qCdeHxGA6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aVTg+J3S; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aVTg+J3S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746188249;
	bh=Q446XHlZ8iNz9WHxPKvx/WyR1/KrNJ61dHl/M96rkLQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aVTg+J3SUJ3HuplLdkpfZj8ODvKjZlXl9YGshtrFTu7MSoUIMNUmAkd3GqZ8slOUs
	 qgqWqPpcnvEAqkPy++nRN0uDgiA2YFn/IRSK7AT/hnQa9h1Y1X8sG5Fo677RJiTnHZ
	 ADNSHaV9Ym230Ns2JdvRuYBKt9AMUg7RYMfww0nElELU1SL5eHFz7bqofBAFBmkWFK
	 MLGywx4+tk4joq9ANp0Y44/Os97iRBNhxSCaz9KTDySM307yVQQjPEbnJcQtD8Z2hb
	 3LMCeX8oX34bcSvrS+6mn3zfFxSoqmFy9nffVlQxqlCU8IBz7iY5/Z9z/GbhpdOafx
	 3s5junWIEFSiA==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 62BCC17E1290;
	Fri,  2 May 2025 14:17:28 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 02 May 2025 14:17:17 +0200
Subject: [PATCH v5 2/3] drm/panfrost: Add support for Mali on the MT8370
 SoC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-mt8370-enable-gpu-v5-2-98e247b30151@collabora.com>
References: <20250502-mt8370-enable-gpu-v5-0-98e247b30151@collabora.com>
In-Reply-To: <20250502-mt8370-enable-gpu-v5-0-98e247b30151@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746188245; l=2572;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=Q446XHlZ8iNz9WHxPKvx/WyR1/KrNJ61dHl/M96rkLQ=;
 b=YijppE0iNglF7yZGZpVAeouOBU3qk9Nl90MnNyHitBApZ9golmGaXYHsoZiKco2qspQLR5zAp
 Pes4j6eCPPMDPbil+SJLMn8vNNzWuiteC5FqIkWAB9BOaJp8eD9W+Vs
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

Add a compatible for the MediaTek MT8370 SoC, with an integrated ARM
Mali G57 MC2 GPU (Valhall-JM, dual core), with new platform data for
its support in the panfrost driver.
It uses the same data as MT8186 for the power management features to
describe power supplies, pm_domains and enablement (one regulator, two
power domains) but also sets the FORCE_AARCH64_PGTABLE flag in the GPU
configuration quirks bitfield to enable AARCH64 4K page table format
mode.
As MT8186 and MT8370 SoC have different GPU architecture (Mali G52 2EE
MC2 for MT8186), making them not compatible, and this mode is only
enabled for Mediatek SoC that are Mali G57 based (compatible with
mediatek,mali-mt8188 or mediatek,mali-8192), having specific platform
data allows to set this flag for MT8370 without modifying MT8186
configuration and behaviour.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index f1ec3b02f15a0029d20c7d81046ded59854e885c..8e0a1ae6940c73b7b60233950ae3abdfa843cc8e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -846,6 +846,16 @@ static const struct panfrost_compatible mediatek_mt8192_data = {
 	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
 };
 
+/* MT8370 uses the same power domains and power supplies as MT8186 */
+static const struct panfrost_compatible mediatek_mt8370_data = {
+	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
+	.supply_names = mediatek_mt8183_b_supplies,
+	.num_pm_domains = ARRAY_SIZE(mediatek_mt8186_pm_domains),
+	.pm_domain_names = mediatek_mt8186_pm_domains,
+	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
+	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
+};
+
 static const struct of_device_id dt_match[] = {
 	/* Set first to probe before the generic compatibles */
 	{ .compatible = "amlogic,meson-gxm-mali",
@@ -868,6 +878,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
 	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
 	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
+	{ .compatible = "mediatek,mt8370-mali", .data = &mediatek_mt8370_data },
 	{ .compatible = "allwinner,sun50i-h616-mali", .data = &allwinner_h616_data },
 	{}
 };

-- 
2.49.0

