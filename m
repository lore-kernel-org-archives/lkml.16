Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09003243956
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745578922; cv=none; b=JFsO+E5gPZ7ChzreYNdAnY29eBujtswu6T5A8xxGCiTi+wNuUPAFNxXXN8rIGYwxEWjfuOf2GoWYeAwl/svu9bvSF+fJAlpC1X3iTiMIdlV9Z7VNIurnmUxOb2ZZyvc12PyhO4TAjUxehGdhoY9LESvKIBv8ayvjImcm1/oOFNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745578922; c=relaxed/simple;
	bh=tdd9lkiGoaVd6ucp66g4WEGJfe6pqa+nOOZgE8LvFtc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cmjs05vpVBsD5rC/+Wq/XQlkO6VOB9rCsjZwXtQ/82kQBWdU7eUM8MN727obE+FlHA+cr+CKwuUh5X2WxMkaXPZJOEF+aVXY75pRrhWTzPdIJ6F1JbKB4/xdQRX5NL6EMtE1o2Xq3ubndrWlrfcIhj8UG/XtgAZ9jdZbIxlI/MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OMFSGv9O; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OMFSGv9O"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 639DA1461;
	Fri, 25 Apr 2025 13:01:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745578913;
	bh=tdd9lkiGoaVd6ucp66g4WEGJfe6pqa+nOOZgE8LvFtc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OMFSGv9O6cS1Hq8I8umwHQj8luFlpEFgBePOp20bpUq98WMoSzFVfT9dC8tY0YpDE
	 VOvKJjmtz58or2tjDYl4Z7SZeIfVvs26+Br7ZZ/oMdF7rCPOncmzEtl99XLueCsmKz
	 +3MTEsBi/Or5IGvcEdJZQ2hnkZjl9U2H6qf/Yqjk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 25 Apr 2025 14:01:25 +0300
Subject: [PATCH v5 05/11] drm/fourcc: Add DRM_FORMAT_X403
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-xilinx-formats-v5-5-c74263231630@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=tdd9lkiGoaVd6ucp66g4WEGJfe6pqa+nOOZgE8LvFtc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoC2ubStUlMvUTWN2lQdY+G3N5uk8u9/eNnoz7G
 ijc00q48V2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaAtrmwAKCRD6PaqMvJYe
 9YLUD/441Dd9YRCps+eJUZX/oONod0ns6gX6L8kLr1q/BvQ0dUPSyVqhytIyeeu8Elyth/cNGAM
 DJp2ZmLJPQ2lZsnFb1ezvbZGodz0aD6WdR7iMWheKIsp3q5qqkbvzgs1tisVtSmJqgi5tLUtPqr
 gkcnDW/spN9KZhoxVTwDu1kqacgNBhut3z3WmSrneg5lcokEys7bOFUg6juw04xdxBrRNnu7voO
 7ciVCR/30+N38TmI26LDPjRdtyJcfVGbPb/m4G8Y0Fq9Lf45cXsHln13SKz44kPkLwcThsHPTZA
 eZOzWFtmNQzcayfMvlUMTHkEV3I/56OMvhFALHcxZPXABb35+SyXFlYNitqpeT/CHKZ7WUyNeHS
 nhPB/m0fyifErsUXoAoGUfWkrdmuRzSpvyan1Rch1hh56FQPaD7TvtDOJ9fZIWxtqVFDEs5Vauh
 UVmGTI+IMmjdXT2t8ejkOHrHhMQGhRmsfwpUxYg6W2MFhf9y4769CWwWS3ruFmJStZApSH6Dnkg
 wBx8iOLRAIEM1hiVfYjRTg9ghUB7Pmo3hlXjB7l2SqSv/csjdFU6c3qpbMSEn6qUSRKLPaea+1C
 wyH18Sxydq8y65uvRPis3dC2+LCHlwz1ODakH6WMVro2IbfBTReop/rlpfm9dGAnP6edVlA5Thp
 XJReaH/blEK0+oA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add X403, a 3 plane 10 bits per component non-subsampled YCbCr format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 3 +++
 include/uapi/drm/drm_fourcc.h | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index e5f04f7ec164..60684f99f4a7 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -356,6 +356,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_Y10_P32,		.depth = 0,  .num_planes = 1,
 		  .char_per_block = { 4, 0, 0 }, .block_w = { 3, 0, 0 }, .block_h = { 1, 0, 0 },
 		  .hsub = 1, .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_X403,		.depth = 0,  .num_planes = 3,
+		  .char_per_block = { 4, 4, 4 }, .block_w = { 3, 3, 3 }, .block_h = { 1, 1, 1 },
+		  .hsub = 1, .vsub = 1, .is_yuv = true },
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index fceb7a2dfeb4..df3dbc36c26b 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -385,6 +385,15 @@ extern "C" {
  */
 #define DRM_FORMAT_Q401		fourcc_code('Q', '4', '0', '1')
 
+/*
+ * 3 plane non-subsampled (444) YCbCr
+ * 10 bpc, 30 bits per sample image data in a single contiguous buffer.
+ * index 0: Y plane,  [31:0] x:Y2:Y1:Y0    [2:10:10:10] little endian
+ * index 1: Cb plane, [31:0] x:Cb2:Cb1:Cb0 [2:10:10:10] little endian
+ * index 2: Cr plane, [31:0] x:Cr2:Cr1:Cr0 [2:10:10:10] little endian
+ */
+#define DRM_FORMAT_X403		fourcc_code('X', '4', '0', '3')
+
 /*
  * 3 plane YCbCr
  * index 0: Y plane, [7:0] Y

-- 
2.43.0

