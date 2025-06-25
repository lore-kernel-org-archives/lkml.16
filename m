Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837DC1F4CBE
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750834130; cv=none; b=SyYyeuXBVuZfSUMX2UsAqrNUnkiQGRxtPyi99f7rhWSznMjlV/qm3f6MebVanVN/9PMC3T+M7S35Vx5UWxnJFg1mA6haGve6ejwfRm3iF1Ve4SWyI6oSW3qxcO4bQNjluePxDJ4lq4/g4CF/WLQwxg8m09Kl93c3qWWfeCH/vtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750834130; c=relaxed/simple;
	bh=3k4h3hHEk7NoxoOrxbmYWfStsX8RNDzQCxVAQ8vhmp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y+D/li21Ip4Kf4eI/ahRi+Y1CsQ6AE4gSqJznRnflqVZOrMvhVfc/ys08lSEDKS3wc4oAx9+MEWOQn5G71YHIFkhBSE2rOO3+zj1URJDBapukvXhH4X8IeJ3b/Hg4Ku4iJwlyZjQFZ59RdtDE6LPVnJBQ/esEP64qTrR6BfK4kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WV3jVN+e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WV3jVN+e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4063C4CEF1;
	Wed, 25 Jun 2025 06:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750834130;
	bh=3k4h3hHEk7NoxoOrxbmYWfStsX8RNDzQCxVAQ8vhmp4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WV3jVN+efUjJ+84d4CMKIfuYU8B7WrweRTX286U1nlajQK/tBOCBzAS2eta3heGBw
	 NeOCs+ynbc/JlSvMFWp+Q4RdfWF2cRDR1KGp67pGTF5AesdgYRQMdH3bE8jZy5RyTH
	 m3N/RJI1y9EN1jVRBjkVXeQd0Qk2PoxplxIC4+GaLSUlg2qRP2JFCimmZ585AcB9LR
	 wIDKKNWyfjMwm57dui3Ub1U0fxWyiHtbIlBNyb/pWkCzud/EDrpVir+6FGUuophyFx
	 oAjFb3F1lSJdeVsCJjZ9uUqAdqJKW8nfbmCOd4nYQRY0oyAymI6rSp28AdHjysDtQw
	 t/+0aoE///kVw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 25 Jun 2025 08:48:38 +0200
Subject: [PATCH 1/5] drm/mipi-dsi: Add dev_is_mipi_dsi function
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-panel-simple-fixes-v1-1-c428494a86b8@kernel.org>
References: <20250625-drm-panel-simple-fixes-v1-0-c428494a86b8@kernel.org>
In-Reply-To: <20250625-drm-panel-simple-fixes-v1-0-c428494a86b8@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2020; i=mripard@kernel.org;
 h=from:subject:message-id; bh=3k4h3hHEk7NoxoOrxbmYWfStsX8RNDzQCxVAQ8vhmp4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnRs08VH/m8aL61wUQO34Z1E1fX+Eg6r+/aeT52wf0jK
 04Eh3OVdUxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJ/PjFWO+9MkX9ut4X5b0R
 Rc27DsiWK8h/aZtx+6n03C3n177fZySy4U3pGZeGoOoZi87b3p+Z58tYn28+R1iaU6i+I944+/T
 aVhXfva9M2e5+E9u8bzHLhb3BR9jExKxVbzfOtjoxQeb/dp9MAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

This will be especially useful for generic panels (like panel-simple)
which can take different code path depending on if they are MIPI-DSI
devices or platform devices.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 3 ++-
 include/drm/drm_mipi_dsi.h     | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index e5184a0c24651756ee0b1eb27d94083d63eb35a7..21fd647f8ce1a6a862e2f8fb5320e701f26f614f 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -89,16 +89,17 @@ static const struct dev_pm_ops mipi_dsi_device_pm_ops = {
 	.thaw = pm_generic_thaw,
 	.poweroff = pm_generic_poweroff,
 	.restore = pm_generic_restore,
 };
 
-static const struct bus_type mipi_dsi_bus_type = {
+const struct bus_type mipi_dsi_bus_type = {
 	.name = "mipi-dsi",
 	.match = mipi_dsi_device_match,
 	.uevent = mipi_dsi_uevent,
 	.pm = &mipi_dsi_device_pm_ops,
 };
+EXPORT_SYMBOL_GPL(mipi_dsi_bus_type);
 
 /**
  * of_find_mipi_dsi_device_by_node() - find the MIPI DSI device matching a
  *    device tree node
  * @np: device tree node
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index b37860f4a895c25ef8ba1c5b3f44827ef53aa100..6d2c08e8110151a97620389197f1ef79c058329d 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -221,10 +221,13 @@ struct mipi_dsi_multi_context {
 
 #define MIPI_DSI_MODULE_PREFIX "mipi-dsi:"
 
 #define to_mipi_dsi_device(__dev)	container_of_const(__dev, struct mipi_dsi_device, dev)
 
+extern const struct bus_type mipi_dsi_bus_type;
+#define dev_is_mipi_dsi(dev)	((dev)->bus == &mipi_dsi_bus_type)
+
 /**
  * mipi_dsi_pixel_format_to_bpp - obtain the number of bits per pixel for any
  *                                given pixel format defined by the MIPI DSI
  *                                specification
  * @fmt: MIPI DSI pixel format

-- 
2.49.0

