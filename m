Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E38245038
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745578925; cv=none; b=SngS12Qtq9z9k/xLzpQxSboCG50pwS31VaZ1cF+qS7oR5aiKEUpRTXXJ0ZLvMCwbLPcTQkE83SkG57JhQnD4lkjOQ+3K/hMYD1DOKi9hb3sKTtKMwu6RcNgXEretBm7MXdom3I4RbS+Y+8ZibnwHpdWx89AKTgrv8Xt4w59XGOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745578925; c=relaxed/simple;
	bh=jcF9TO4w0dmiNuHteMC+0VDVhFz7gX4DbHPqYH+9J6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tAdncqprti2oqaECiWUt2CQ8Qi8V6dAqCZ2NvHEqVWEUP7cTNJrIx6LFLUXDZ+VP/V+vAkEgciQDFyWhXKUfrqe+O/DmE5nYsL2aU26GIjVNswhvfTGXWkXVSU3R8GY3tFPmLJSw5U0IJvANTHuYRiKdVTke2OeIdxDr7DFKjvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NWTZpEzM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NWTZpEzM"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D5A91A5F;
	Fri, 25 Apr 2025 13:01:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745578915;
	bh=jcF9TO4w0dmiNuHteMC+0VDVhFz7gX4DbHPqYH+9J6g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NWTZpEzMlnkVxZl3LoP70m8wzem/r8JdXxqrOxaWZEttVQH16XEAVM0/nJV/K4n6y
	 Ea6KOYP0PUZ/FoSQ+2ybwCS23W/sOSjuA9rXyRntjZVWjri3zcGHZpkoMz2RTsXun2
	 7aKMLSYVQqgVV8JPE9gVe2WaCKSCxBAAHXiJIKSI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 25 Apr 2025 14:01:27 +0300
Subject: [PATCH v5 07/11] drm: xlnx: zynqmp: Use drm helpers when
 calculating buffer sizes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-xilinx-formats-v5-7-c74263231630@ideasonboard.com>
References: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
In-Reply-To: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pekka Paalanen <ppaalanen@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=jcF9TO4w0dmiNuHteMC+0VDVhFz7gX4DbHPqYH+9J6g=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoC2ucBKCGRXs3IItYKinZokjiHSFI1MqifZhIn
 FhfiDEumzmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaAtrnAAKCRD6PaqMvJYe
 9cOOD/9yMvecnMzRXcID+kHiup5caDsmRyy+fl2n6/LS4dgSAfbmOPSdMEN2d7N7Zgspx7OKHZj
 fILokdq/5oDdtu9IYjGQDMEa2mYExbdZ6Xpov44hrDSLWn5UY/MzalP8tcd81JmSkvD91yvznvv
 ZusKjW58zHc8EdOgxsWNdgq8CUplloG+n5WFbV5EasHCmUvTfrnCI2Jmejre42sChVGp6TVO2q4
 ioKlivNj2hgYI1Zjljpr2uioCOCZOIKTybXFitFmf2bFRbT+3/2czVrDK0Z0N1IrD087nVGmcSM
 JmgClZDV5K9IWgFq5gil0pwog0lequ2aZBxzlCTAY8b5Zw9A4+ZgCeOXnJTXZbhYE9Ia+jFlCUL
 +YIZwlwIMD4S5pm8IjI13SDO73bVx5Y8Q9FR5k7ZXLOHHYDPCVABuF2/+1YMDjFZ+6PDK0/+bNm
 +dJjyaWxHLJffB5i9LTcewkLkuczrd3j26gEOPzHWf3Q2tXsRb5UZ0buSOU7aRAK57kHEGBJqSZ
 antKptt4HH6o78gtnO8hxRdIamYZpLKcXR+YgzjIC+HVGz9JNimQXKWR8MyRzXOCcEMOkoMkIFF
 lDcMy1bTiBTHtRM1Yw78wmSv132S/wpo9UXo/EFPRuRuxrgU9TRbzcntwHiD1TeQd+FeiGpk6KI
 fN9EORfMnfzgmgQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Use drm helpers, drm_format_info_plane_width(),
drm_format_info_plane_height() and drm_format_info_min_pitch() to
calculate sizes for the DMA.

This cleans up the code, but also makes it possible to support more
complex formats (like XV15, XV20).

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 80d1e499a18d..b9883ea2d03e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1116,16 +1116,19 @@ int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
 		return 0;
 
 	for (i = 0; i < info->num_planes; i++) {
-		unsigned int width = state->crtc_w / (i ? info->hsub : 1);
-		unsigned int height = state->crtc_h / (i ? info->vsub : 1);
 		struct zynqmp_disp_layer_dma *dma = &layer->dmas[i];
 		struct dma_async_tx_descriptor *desc;
 		dma_addr_t dma_addr;
+		unsigned int width;
+		unsigned int height;
+
+		width = drm_format_info_plane_width(info, state->crtc_w, i);
+		height = drm_format_info_plane_height(info, state->crtc_h, i);
 
 		dma_addr = drm_fb_dma_get_gem_addr(state->fb, state, i);
 
 		dma->xt.numf = height;
-		dma->sgl.size = width * info->cpp[i];
+		dma->sgl.size = drm_format_info_min_pitch(info, i, width);
 		dma->sgl.icg = state->fb->pitches[i] - dma->sgl.size;
 		dma->xt.src_start = dma_addr;
 		dma->xt.frame_size = 1;

-- 
2.43.0

