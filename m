Received: from qs51p00im-qukt01071901.me.com (qs51p00im-qukt01071901.me.com [17.57.155.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27B9136E37
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 06:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.57.155.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743662935; cv=none; b=XhEUs5DED2O633OnSwQl9e/DOofI8pMjcrP88O9MwgOSD0BX3qklgUKU09Lxqjdu1o2FJSOCEjFlqDNkp23r5kDmK0LcWCmDt13/s3GMSxQijm81D9PpQUGbWISaNnBg0MOuWLBly6ond4ZZePL7Y+g1GY+Wn2yu9CJ1Ah5qYC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743662935; c=relaxed/simple;
	bh=T6FT3LsKTfwsij3YFljc92NUt4JS1kmzCAfKT0pcqNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MTbNyjNXcxBd8QFYtdRihSWm0yDhV0/Mo6iSSfjQxWXe7imF+8r/Nf900UG2hcB1MYEFS5yo1vIfI/7mtfbXRu31297Xuxs5TCBPifzfruKpIdlwCfrYWae1FzlCZ1RyWTbsfGqW6dBnuDj2oPWE5uQqZfMxF7jVbDnZvBhj8JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=WNBc/xzq; arc=none smtp.client-ip=17.57.155.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="WNBc/xzq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1;
	bh=vX1nStTTyA2W3EtaX3VYwa1Dfg3sYgIY5n0SdMP1A9E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
	b=WNBc/xzqW6hc1w1xvZmvNkALMThcoORtpqWzc7S6k7HpLwRWJ7z0ZwCosnW2DI84q
	 WNlBe//viYmPWvRelVykEW34qz7BL8uEXH8iwMXxGT8xWjXc3biR0LqjTI0S7Tr46+
	 qmsAYrIEQkBImg0HFe2zGG18uVPPPwAMstTBZGP30uABvJC+33/NoP6jAjcAcBeHCZ
	 cZccEECTodC9jTwSognP9wksu5sSbQFh1KaeEJgof1JDJkSWNGPbJjaoFti9h55x61
	 GIGpDRkit07NAIRTsNEOZQnjiSoWE+e0ovF+v+6mg4GtnHehGwRyPzDHPs8H19eFk+
	 JVrHi/7I9YRwg==
Received: from localhost (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
	by qs51p00im-qukt01071901.me.com (Postfix) with ESMTPSA id DC75962801F9;
	Thu,  3 Apr 2025 06:48:50 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Konstantin Shabanov <mail@etehtsea.me>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] (drm/rockchip): Consistently use rk3399 registers consts
Date: Thu,  3 Apr 2025 06:47:39 +0000
Message-ID: <20250403064740.4016-1-mail@etehtsea.me>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: F5HyCAe8Rgl6mAQE-0KnVlkmIu4GVdCO
X-Proofpoint-ORIG-GUID: F5HyCAe8Rgl6mAQE-0KnVlkmIu4GVdCO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_02,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=386
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 spamscore=0 clxscore=1030 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2503100000 definitions=main-2504030033

As rk3399 has its own registers definitions, update related structs to
use them.
There are no changes in behaviour as updated constants values are the
 for rk3288/rk3368/rk3399 chips.

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
---
Apologies for resend. The first email hadn't reached the mailing list for some reason.

 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 94 ++++++++++-----------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index 4e2099d86517..d1f788763318 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -906,21 +906,21 @@ static const struct vop_data rk3366_vop = {

 static const struct vop_output rk3399_output = {
 	.dp_dclk_pol = VOP_REG(RK3399_DSP_CTRL1, 0x1, 19),
-	.rgb_dclk_pol = VOP_REG(RK3368_DSP_CTRL1, 0x1, 19),
-	.hdmi_dclk_pol = VOP_REG(RK3368_DSP_CTRL1, 0x1, 23),
-	.edp_dclk_pol = VOP_REG(RK3368_DSP_CTRL1, 0x1, 27),
-	.mipi_dclk_pol = VOP_REG(RK3368_DSP_CTRL1, 0x1, 31),
+	.rgb_dclk_pol = VOP_REG(RK3399_DSP_CTRL1, 0x1, 19),
+	.hdmi_dclk_pol = VOP_REG(RK3399_DSP_CTRL1, 0x1, 23),
+	.edp_dclk_pol = VOP_REG(RK3399_DSP_CTRL1, 0x1, 27),
+	.mipi_dclk_pol = VOP_REG(RK3399_DSP_CTRL1, 0x1, 31),
 	.dp_pin_pol = VOP_REG(RK3399_DSP_CTRL1, 0x7, 16),
-	.rgb_pin_pol = VOP_REG(RK3368_DSP_CTRL1, 0x7, 16),
-	.hdmi_pin_pol = VOP_REG(RK3368_DSP_CTRL1, 0x7, 20),
-	.edp_pin_pol = VOP_REG(RK3368_DSP_CTRL1, 0x7, 24),
-	.mipi_pin_pol = VOP_REG(RK3368_DSP_CTRL1, 0x7, 28),
+	.rgb_pin_pol = VOP_REG(RK3399_DSP_CTRL1, 0x7, 16),
+	.hdmi_pin_pol = VOP_REG(RK3399_DSP_CTRL1, 0x7, 20),
+	.edp_pin_pol = VOP_REG(RK3399_DSP_CTRL1, 0x7, 24),
+	.mipi_pin_pol = VOP_REG(RK3399_DSP_CTRL1, 0x7, 28),
 	.dp_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 11),
-	.rgb_en = VOP_REG(RK3288_SYS_CTRL, 0x1, 12),
-	.hdmi_en = VOP_REG(RK3288_SYS_CTRL, 0x1, 13),
-	.edp_en = VOP_REG(RK3288_SYS_CTRL, 0x1, 14),
-	.mipi_en = VOP_REG(RK3288_SYS_CTRL, 0x1, 15),
-	.mipi_dual_channel_en = VOP_REG(RK3288_SYS_CTRL, 0x1, 3),
+	.rgb_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 12),
+	.hdmi_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 13),
+	.edp_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 14),
+	.mipi_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 15),
+	.mipi_dual_channel_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 3),
 };

 static const struct vop_common rk3399_common = {
@@ -975,23 +975,23 @@ static const struct vop_win_phy rk3399_win0_data = {
 	.data_formats = formats_win_full_10,
 	.nformats = ARRAY_SIZE(formats_win_full_10),
 	.format_modifiers = format_modifiers_win_full_afbc,
-	.enable = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 0),
-	.format = VOP_REG(RK3288_WIN0_CTRL0, 0x7, 1),
-	.fmt_10 = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 4),
-	.rb_swap = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 12),
-	.uv_swap = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 15),
-	.x_mir_en = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 21),
-	.y_mir_en = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 22),
-	.act_info = VOP_REG(RK3288_WIN0_ACT_INFO, 0x1fff1fff, 0),
-	.dsp_info = VOP_REG(RK3288_WIN0_DSP_INFO, 0x0fff0fff, 0),
-	.dsp_st = VOP_REG(RK3288_WIN0_DSP_ST, 0x1fff1fff, 0),
-	.yrgb_mst = VOP_REG(RK3288_WIN0_YRGB_MST, 0xffffffff, 0),
-	.uv_mst = VOP_REG(RK3288_WIN0_CBR_MST, 0xffffffff, 0),
-	.yrgb_vir = VOP_REG(RK3288_WIN0_VIR, 0x3fff, 0),
-	.uv_vir = VOP_REG(RK3288_WIN0_VIR, 0x3fff, 16),
-	.src_alpha_ctl = VOP_REG(RK3288_WIN0_SRC_ALPHA_CTRL, 0xff, 0),
-	.dst_alpha_ctl = VOP_REG(RK3288_WIN0_DST_ALPHA_CTRL, 0xff, 0),
-	.channel = VOP_REG(RK3288_WIN0_CTRL2, 0xff, 0),
+	.enable = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 0),
+	.format = VOP_REG(RK3399_WIN0_CTRL0, 0x7, 1),
+	.fmt_10 = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 4),
+	.rb_swap = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 12),
+	.uv_swap = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 15),
+	.x_mir_en = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 21),
+	.y_mir_en = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 22),
+	.act_info = VOP_REG(RK3399_WIN0_ACT_INFO, 0x1fff1fff, 0),
+	.dsp_info = VOP_REG(RK3399_WIN0_DSP_INFO, 0x0fff0fff, 0),
+	.dsp_st = VOP_REG(RK3399_WIN0_DSP_ST, 0x1fff1fff, 0),
+	.yrgb_mst = VOP_REG(RK3399_WIN0_YRGB_MST, 0xffffffff, 0),
+	.uv_mst = VOP_REG(RK3399_WIN0_CBR_MST, 0xffffffff, 0),
+	.yrgb_vir = VOP_REG(RK3399_WIN0_VIR, 0x3fff, 0),
+	.uv_vir = VOP_REG(RK3399_WIN0_VIR, 0x3fff, 16),
+	.src_alpha_ctl = VOP_REG(RK3399_WIN0_SRC_ALPHA_CTRL, 0xff, 0),
+	.dst_alpha_ctl = VOP_REG(RK3399_WIN0_DST_ALPHA_CTRL, 0xff, 0),
+	.channel = VOP_REG(RK3399_WIN0_CTRL2, 0xff, 0),
 };

 static const struct vop_win_phy rk3399_win1_data = {
@@ -999,23 +999,23 @@ static const struct vop_win_phy rk3399_win1_data = {
 	.data_formats = formats_win_full_10,
 	.nformats = ARRAY_SIZE(formats_win_full_10),
 	.format_modifiers = format_modifiers_win_full,
-	.enable = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 0),
-	.format = VOP_REG(RK3288_WIN0_CTRL0, 0x7, 1),
-	.fmt_10 = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 4),
-	.rb_swap = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 12),
-	.uv_swap = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 15),
-	.x_mir_en = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 21),
-	.y_mir_en = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 22),
-	.act_info = VOP_REG(RK3288_WIN0_ACT_INFO, 0x1fff1fff, 0),
-	.dsp_info = VOP_REG(RK3288_WIN0_DSP_INFO, 0x0fff0fff, 0),
-	.dsp_st = VOP_REG(RK3288_WIN0_DSP_ST, 0x1fff1fff, 0),
-	.yrgb_mst = VOP_REG(RK3288_WIN0_YRGB_MST, 0xffffffff, 0),
-	.uv_mst = VOP_REG(RK3288_WIN0_CBR_MST, 0xffffffff, 0),
-	.yrgb_vir = VOP_REG(RK3288_WIN0_VIR, 0x3fff, 0),
-	.uv_vir = VOP_REG(RK3288_WIN0_VIR, 0x3fff, 16),
-	.src_alpha_ctl = VOP_REG(RK3288_WIN0_SRC_ALPHA_CTRL, 0xff, 0),
-	.dst_alpha_ctl = VOP_REG(RK3288_WIN0_DST_ALPHA_CTRL, 0xff, 0),
-	.channel = VOP_REG(RK3288_WIN0_CTRL2, 0xff, 0),
+	.enable = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 0),
+	.format = VOP_REG(RK3399_WIN0_CTRL0, 0x7, 1),
+	.fmt_10 = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 4),
+	.rb_swap = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 12),
+	.uv_swap = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 15),
+	.x_mir_en = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 21),
+	.y_mir_en = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 22),
+	.act_info = VOP_REG(RK3399_WIN0_ACT_INFO, 0x1fff1fff, 0),
+	.dsp_info = VOP_REG(RK3399_WIN0_DSP_INFO, 0x0fff0fff, 0),
+	.dsp_st = VOP_REG(RK3399_WIN0_DSP_ST, 0x1fff1fff, 0),
+	.yrgb_mst = VOP_REG(RK3399_WIN0_YRGB_MST, 0xffffffff, 0),
+	.uv_mst = VOP_REG(RK3399_WIN0_CBR_MST, 0xffffffff, 0),
+	.yrgb_vir = VOP_REG(RK3399_WIN0_VIR, 0x3fff, 0),
+	.uv_vir = VOP_REG(RK3399_WIN0_VIR, 0x3fff, 16),
+	.src_alpha_ctl = VOP_REG(RK3399_WIN0_SRC_ALPHA_CTRL, 0xff, 0),
+	.dst_alpha_ctl = VOP_REG(RK3399_WIN0_DST_ALPHA_CTRL, 0xff, 0),
+	.channel = VOP_REG(RK3399_WIN0_CTRL2, 0xff, 0),
 };

 /*

base-commit: 6b60c282330c46954be9ae1d33cd5c7e5acb315c
--
2.48.1
