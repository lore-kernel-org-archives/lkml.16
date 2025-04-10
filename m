Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207442900B2;
	Thu, 10 Apr 2025 14:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296033; cv=none; b=pmk+c+rsMMdqph/V+/8kjIfaMtkpy7ySjL43iRqyII/T+xML6CVPGQd73wRFB+m4nw07dZHecQezIKGE44n7FqAq89XI2Dj8+AAkdwnCMqnfYU3PoyHRqjBWqlUd+afcf7mG7ST1mkDJcXGaA5NfK+CF+Mhh7HS0R/6GSi71Qwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296033; c=relaxed/simple;
	bh=wjB41mY8Agm1B+wcC7r0Il4fMM8tvGoJYe6ytb01tmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bfZMX2/6ougo1EiHiTV+J2fLv0DBLxJJDA4/zFS8quTaLzSlhymkYiW5+D4ZvbSdGrT+Q8wEgjPscyMfG30SlCRHXvpzAE7D6CdevII165CjXvs3jJOBNi8xsOJwmtbfLQJBccyeHwEdFJilV2znqV1cudrb0UqsoukODxigpGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VLTWx86Q; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VLTWx86Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296029;
	bh=wjB41mY8Agm1B+wcC7r0Il4fMM8tvGoJYe6ytb01tmw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VLTWx86QgKdoUzErZBD3QDCORWSWgAjJSRhVs96MHlsSIuGebgDNrnIuVxy0CcSna
	 0mK816okYVbgnhI02cEockT4dUjuSe13021NaAgp2mU89esN2S57iA4/m8A5xtwWeX
	 s7c4wVpdilA4yNEgk6ElYFeUjyc1jG2MsnvyLdj9blOE4dMYobK3OPbYMqj3VEvbmo
	 e80CbrFpbIcOxRx0sDNQtm3A4VxzEInA/0t/mYelMAw7mMirzZeMFJu/PFyf+MVEel
	 BovQcr8Z9fT+dFyQcTiNyrPdbi2UxCwLtqsI92fytl+LpqdfTePpUw13V9ij3zqRJ7
	 /ZteNHx27kR1g==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 27F0C17E0CA7;
	Thu, 10 Apr 2025 16:40:28 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	henryc.chen@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 4/5] soc: mediatek: mtk-dvfsrc: Rename and move bw constraints data
Date: Thu, 10 Apr 2025 16:40:18 +0200
Message-ID: <20250410144019.475930-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
References: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the MT8183 and MT8195 bandwidth constraints data structure
to, respectively, dvfsrc_bw_constr_v1 and dvfsrc_bw_constr_v2, as
the actual constraints are depending on the DVFSRC version rather
than on the SoC.

While at it, to prepare for adding a new SoC, also move the two
structures at the start of the platform data code section.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-dvfsrc.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/mtk-dvfsrc.c
index 83bf46fdcf2d..65c7d7bf743e 100644
--- a/drivers/soc/mediatek/mtk-dvfsrc.c
+++ b/drivers/soc/mediatek/mtk-dvfsrc.c
@@ -446,6 +446,13 @@ static int mtk_dvfsrc_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct dvfsrc_bw_constraints dvfsrc_bw_constr_v1 = { 0, 0, 0 };
+static const struct dvfsrc_bw_constraints dvfsrc_bw_constr_v2 = {
+	.max_dram_nom_bw = 255,
+	.max_dram_peak_bw = 255,
+	.max_dram_hrt_bw = 1023,
+};
+
 static const struct dvfsrc_opp dvfsrc_opp_mt8183_lp4[] = {
 	{ 0, 0 }, { 0, 1 }, { 0, 2 }, { 1, 2 },
 };
@@ -469,8 +476,6 @@ static const struct dvfsrc_opp_desc dvfsrc_opp_mt8183_desc[] = {
 	}
 };
 
-static const struct dvfsrc_bw_constraints dvfsrc_bw_constr_mt8183 = { 0, 0, 0 };
-
 static const struct dvfsrc_soc_data mt8183_data = {
 	.opps_desc = dvfsrc_opp_mt8183_desc,
 	.regs = dvfsrc_mt8183_regs,
@@ -482,7 +487,7 @@ static const struct dvfsrc_soc_data mt8183_data = {
 	.set_vcore_level = dvfsrc_set_vcore_level_v1,
 	.wait_for_opp_level = dvfsrc_wait_for_opp_level_v1,
 	.wait_for_vcore_level = dvfsrc_wait_for_vcore_level_v1,
-	.bw_constraints = &dvfsrc_bw_constr_mt8183,
+	.bw_constraints = &dvfsrc_bw_constr_v1,
 };
 
 static const struct dvfsrc_opp dvfsrc_opp_mt8195_lp4[] = {
@@ -521,7 +526,7 @@ static const struct dvfsrc_soc_data mt8195_data = {
 	.set_vscp_level = dvfsrc_set_vscp_level_v2,
 	.wait_for_opp_level = dvfsrc_wait_for_opp_level_v2,
 	.wait_for_vcore_level = dvfsrc_wait_for_vcore_level_v1,
-	.bw_constraints = &dvfsrc_bw_constr_mt8195,
+	.bw_constraints = &dvfsrc_bw_constr_v2,
 };
 
 static const struct of_device_id mtk_dvfsrc_of_match[] = {
-- 
2.49.0

