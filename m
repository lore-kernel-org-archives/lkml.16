Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522F526868E
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748347888; cv=none; b=AnBXFPaDqh+FElLdK805YYrKvxSC5oSr0sA8K8jxS+HWNsz82Qc3s7dbHRB2pV6QS4grdqSQW8Q4hvRBsinjbCRjUPts95a0tDFgeMxL+lxOAA5zuXy4Tt4Y/q5yzZ7ZDlioYun6VYQo3y0pG2SRUaadL+O19b2L+9V9nN7Yvv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748347888; c=relaxed/simple;
	bh=nRhKCOHaGlbyoPioyQ83hEvXV7afirLJpLonj5Rf/LA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jfGE0EMlx5UTGJQYwk1GAiaYRPmzBGEtv9QrNnhY5oSTe2g1kE3O8deqWBUjiZULYWY5GdLc59B1OI4cNbEz/BdKDOAklSC25TmGhSzCgIuTddyvWoMXHB8nC/JXRGYp8SWrrjfAaTyMVssPQ92rAAimuCuZJeiHKiU8xHF+ng4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ari3QlGU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ari3QlGU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748347884;
	bh=nRhKCOHaGlbyoPioyQ83hEvXV7afirLJpLonj5Rf/LA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ari3QlGUxHL93fBidRJi87Fcb8fXeeo/efi6iMcGA1NrKTWvCLHlagjaIODMOGPQK
	 g0hxWZLCVaqmYracZd7h9vHbq8P++yiTsEgZKYWx9i59/QLf8BrkkTK9C1X1kp1Rvf
	 3msnjY+JzRUtYliHu71vQCEfx8nsqCYkAPRnA5kvh9pfIyb5vFGi5hdXMtNhITvM6I
	 ej41hWnC6vL8ouDXBUqsR182GbiCmariUAtGA8hD3lnggxT/E96Sz2nXG4zd33Vg+n
	 hGmoIBOtHe2Qko+vg6B97ad4Q7dfCd7Jlw/iUcHy4Zd7luNxxEqhFuMnilxr0Wp1ag
	 PlDp9VWc8u42w==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 4C58F17E153B;
	Tue, 27 May 2025 14:11:24 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 27 May 2025 15:11:11 +0300
Subject: [PATCH v5 03/19] drm/connector: hdmi: Improve debug message for
 supported format
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-hdmi-conn-yuv-v5-3-74c9c4a8ac0c@collabora.com>
References: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
In-Reply-To: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Add the missing 'bpc' string to the debug message indicating the
supported format identified within hdmi_try_format_bpc() helper.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index e026f1ca82848f3be874245c06093d3be8355c5c..b05099c18f64a9cf1acecbfca8c9117b753117e4 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -597,7 +597,7 @@ hdmi_try_format_bpc(const struct drm_connector *connector,
 		return false;
 	}
 
-	drm_dbg_kms(dev, "%s output format supported with %u (TMDS char rate: %llu Hz)\n",
+	drm_dbg_kms(dev, "%s output format supported with %u bpc (TMDS char rate: %llu Hz)\n",
 		    drm_hdmi_connector_get_output_format_name(fmt),
 		    bpc, conn_state->hdmi.tmds_char_rate);
 

-- 
2.49.0

