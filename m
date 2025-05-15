Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689EF298CB5
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747312561; cv=none; b=qGAtwnX5xUOxXCgYY96ehiu0LvBFJKPZrZjXlnY++QXhP3rpsE/T1gmZQYtgzadoqars2wlJvIPvvIl14F/IlwozPb/L2iVWTlhZPNzBZueY8RNfP+dJRkbFj/dhCExooQfAWRtpWGbpMfKyET6OvGOHTMvvZ1ROIYs22cr0qnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747312561; c=relaxed/simple;
	bh=tMetwyoL7MO+iOcOlC9mb58Fnfsph+qqYQSZDiowRrA=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=d9MEnharT5bruDvxYn5Z0MuTGtqCWCZZK3KL7pDiSDLYaUVupmTLMj1chcix5KgWya7rqPgspvK+ZVLC7vb/9zdFJEwwtuRNkShMFtJYasn9+YPXZbcoVkbsga0alEJdRPB4WLCHaNlGmhOlB249Yb026nSCgrpAgPP/567jx0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZyqSY3sJvz5B1Gq;
	Thu, 15 May 2025 20:35:57 +0800 (CST)
Received: from njy2app04.zte.com.cn ([10.40.12.64])
	by mse-fl1.zte.com.cn with SMTP id 54FCZoE7025362;
	Thu, 15 May 2025 20:35:50 +0800 (+08)
	(envelope-from long.yunjian@zte.com.cn)
Received: from mapi (njy2app01[null])
	by mapi (Zmail) with MAPI id mid201;
	Thu, 15 May 2025 20:35:54 +0800 (CST)
Date: Thu, 15 May 2025 20:35:54 +0800 (CST)
X-Zmail-TransId: 2af96825dfaaffffffffa32-c85aa
X-Mailer: Zmail v1.0
Message-ID: <20250515203554564-j1jBXUXR6bdiN6zARicC@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <long.yunjian@zte.com.cn>
To: <hjc@rock-chips.com>
Cc: <heiko@sntech.de>, <andy.yan@rock-chips.com>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <fang.yumeng@zte.com.cn>, <mou.yi@zte.com.cn>, <xu.lifeng1@zte.com.cn>,
        <ouyang.maochun@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vcm9ja2NoaXA6IFVzZSBkZXZfZXJyX3Byb2JlKCkgdG8gc2ltcGxpZnkgY29kZQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 54FCZoE7025362
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6825DFAD.000/4ZyqSY3sJvz5B1Gq

From: Yumeng Fang <fang.yumeng@zte.com.cn>

In the probe path, dev_err() can be replaced with dev_err_probe()
which will check if error code is -EPROBE_DEFER and prints the
error name. It also sets the defer probe reason which can be
checked later through debugfs.

Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index f737e7d46e66..acb59b25d928 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -213,17 +213,13 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)

 	if (IS_ERR(hdmi->ref_clk)) {
 		ret = PTR_ERR(hdmi->ref_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(hdmi->dev, "failed to get reference clock\n");
-		return ret;
+		return dev_err_probe(hdmi->dev, ret, "failed to get reference clock\n");
 	}

 	hdmi->grf_clk = devm_clk_get_optional(hdmi->dev, "grf");
 	if (IS_ERR(hdmi->grf_clk)) {
 		ret = PTR_ERR(hdmi->grf_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(hdmi->dev, "failed to get grf clock\n");
-		return ret;
+		return dev_err_probe(hdmi->dev, ret, "failed to get grf clock\n");
 	}

 	ret = devm_regulator_get_enable(hdmi->dev, "avdd-0v9");
@@ -573,17 +569,13 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,

 	ret = rockchip_hdmi_parse_dt(hdmi);
 	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(hdmi->dev, "Unable to parse OF data\n");
-		return ret;
+		return dev_err_probe(hdmi->dev, ret, "Unable to parse OF data\n");
 	}

 	hdmi->phy = devm_phy_optional_get(dev, "hdmi");
 	if (IS_ERR(hdmi->phy)) {
 		ret = PTR_ERR(hdmi->phy);
-		if (ret != -EPROBE_DEFER)
-			dev_err(hdmi->dev, "failed to get phy\n");
-		return ret;
+		return dev_err_probe(hdmi->dev, ret, "failed to get phy\n");
 	}

 	if (hdmi->phy) {
-- 
2.25.1
