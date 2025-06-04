Received: from outbound.qs.icloud.com (p-east3-cluster6-host7-snip4-10.eps.apple.com [57.103.85.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB802171A1
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 09:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.85.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749027678; cv=none; b=u1hnS9kbpKq6aU8zjeirOfxn7Tnt9+Hynr1LDdVht23ueFzByxENOU0GPrrHRIf8Igu/x4BQxDT4eK/wkCkGKyAnsSID9I3PZZtbQuuEDnT531a427f3QxTrMJipK39BVza01DZ8rRFZi45ec5zj5/8Bwy216pcDHh1PqGLZJCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749027678; c=relaxed/simple;
	bh=iuL1JT5nTcgFDeToCkLLShncc97SpGrqDVx4yf4GM7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D4hTfYeJAVhrh/lM5Q+kz/z7E5JwZ58j6OXhTge+QNIdztzaDVMdUal9Epqvp/y20td3q1a3BtWV4msGsqoOPEmU8WB9hlCEf2kMZSv8w6VpZQh5ijlxCWRm1J8Pvl8wYPmKYUIs74qOfx2bqYGPjMIGrqGn9lmB7KWVweOSVHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=huS+KKUM; arc=none smtp.client-ip=57.103.85.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="huS+KKUM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1;
	bh=1+Yrgh6Z4uyJ/+tbV7dwmp0mh5zinPbKsKU8zEJOQ44=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
	b=huS+KKUMXZFNne46uxDYoH2TR2b4rsBMdH4bZYwhzuRPOAK5oEn7fAMzN2Bjgsr4K
	 Ii37TpCfis0bay6sNYvrbTdBswO6TnDxsOBfdUmnmnEqFQfq0bUkMd2gkWGkyfRtNj
	 XSj4UvTR86eDIABeFDbSpJ4izmgB3N1X9eKBkDyXaeX5cPwx8g7dPhaB3cQDfwL4+A
	 ifj05fcA7c+0MZsSMxvRZwFwbWrETI2ebICVZElPbMzP7BQx+PldPPdIg6o22xWddX
	 pQJV6diBqHF03+BkUdw1GaPGJeCqRF7K5MXJZFigun/406jgsnJbpSjLL7ZrJgRMl/
	 k4eTYmrJNETow==
Received: from outbound.qs.icloud.com (localhost [127.0.0.1])
	by outbound.qs.icloud.com (Postfix) with ESMTPS id C17A018002A8;
	Wed,  4 Jun 2025 09:01:10 +0000 (UTC)
Received: from localhost (qs-asmtp-me-k8s.p00.prod.me.com [17.57.155.37])
	by outbound.qs.icloud.com (Postfix) with ESMTPSA id EC35618002AF;
	Wed,  4 Jun 2025 09:01:07 +0000 (UTC)
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
	Dan Callaghan <djc@djc.id.au>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V5 RESEND] drm/rockchip: Reject AFBC for res >2560 on rk3399
Date: Wed,  4 Jun 2025 09:00:53 +0000
Message-ID: <20250604090054.7070-1-mail@etehtsea.me>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZL3YM8dNqYDIvFCJ8br2ljtNZ7Y0DHdP
X-Proofpoint-ORIG-GUID: ZL3YM8dNqYDIvFCJ8br2ljtNZ7Y0DHdP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0 clxscore=1030 spamscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.22.0-2503310001 definitions=main-2506040067

As it isn't supported by rk3399. From the datasheet[1]
("1.2.10 Video IN/OUT", "Display Interface", p. 17):

  Support AFBC function co-operation with GPU
    * support 2560x1600 UI

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
Reported-by: Dan Callaghan <djc@djc.id.au>
Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/7968

[1]: https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf
---
 V4 -> V5: Extract AFBC support check into drv
 V3 -> V4: Correct redundant header inclusion
 V2 -> V3: Run check only on rk3399
 V1 -> V2: Move the check to the fb_create callback

 AFBC check is implemented in a similar manner as in the malidp driver.
 Resend of the https://lore.kernel.org/all/20250521160556.14346-2-mail@etehtsea.me/.
 
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 16 ++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h |  2 ++
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c  |  3 +++
 3 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 180fad5d49ad..9fb04022b2f3 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -42,6 +42,8 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
+#define RK3399_AFBC_MAX_WIDTH		2560
+
 static const struct drm_driver rockchip_drm_driver;
 
 /*
@@ -350,6 +352,20 @@ int rockchip_drm_endpoint_is_subdriver(struct device_node *ep)
 	return false;
 }
 
+bool rockchip_verify_afbc_framebuffer_size(struct drm_device *dev,
+					   const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	if (of_machine_is_compatible("rockchip,rk3399") &&
+	    mode_cmd->width > RK3399_AFBC_MAX_WIDTH) {
+		DRM_DEBUG_KMS("AFBC is not supported for the width %d (max %d)\n",
+			      mode_cmd->width,
+			      RK3399_AFBC_MAX_WIDTH);
+		return false;
+	}
+
+	return true;
+}
+
 static void rockchip_drm_match_remove(struct device *dev)
 {
 	struct device_link *link;
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
index c183e82a42a5..5dabceaa4fd6 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
@@ -86,6 +86,8 @@ int rockchip_drm_wait_vact_end(struct drm_crtc *crtc, unsigned int mstimeout);
 int rockchip_drm_encoder_set_crtc_endpoint_id(struct rockchip_encoder *rencoder,
 					      struct device_node *np, int port, int reg);
 int rockchip_drm_endpoint_is_subdriver(struct device_node *ep);
+bool rockchip_verify_afbc_framebuffer_size(struct drm_device *dev,
+					   const struct drm_mode_fb_cmd2 *mode_cmd);
 extern struct platform_driver cdn_dp_driver;
 extern struct platform_driver dw_hdmi_rockchip_pltfm_driver;
 extern struct platform_driver dw_hdmi_qp_rockchip_pltfm_driver;
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
index 5829ee061c61..f0527f12f568 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
@@ -52,6 +52,9 @@ rockchip_fb_create(struct drm_device *dev, struct drm_file *file,
 	}
 
 	if (drm_is_afbc(mode_cmd->modifier[0])) {
+		if (!rockchip_verify_afbc_framebuffer_size(dev, mode_cmd))
+			return ERR_PTR(-EINVAL);
+
 		ret = drm_gem_fb_afbc_init(dev, mode_cmd, afbc_fb);
 		if (ret) {
 			drm_framebuffer_put(&afbc_fb->base);

base-commit: 685c407f168cb49a12cc703230d1e2d62767bfd2
-- 
2.49.0

