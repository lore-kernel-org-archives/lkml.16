Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39CC24502E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745578925; cv=none; b=LSXbOnvJ81XrV6eqno756kBQlpF+dL3MyGrAQiIB6i8Uv/o9YMUqqy0LL4U8MWjkMRgRNYSB3s7dA54nIozquNSHghgcQluhbllEJFCgTFHtHVTWQY/NtYHfAVggLe/2f5H8CImFOZP+YbNJZ0JW6bsh3jiTWw39BAd5YAyyZik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745578925; c=relaxed/simple;
	bh=GQ3sXKglWX9F6umPChoxH/gNqwUTQzQSiPBWtBNA8Y0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mLhEEbrMQVKGY6tbzYBoXcpxf19qB5kbfnVCBxRUo5fQoLj4mG5izb7xFnmEocV1Dhx6OK+Vf9o+9i7sU9coatLaqxdrZSOgsSYsIRmC38XrVUjp6xsu/cSNVvH+qvej1O4CKRh0x71gX1CZC/nK4k+BqS5OhhVK2kcX6j5s5XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NT+bQGKD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NT+bQGKD"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5082C1A42;
	Fri, 25 Apr 2025 13:01:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745578914;
	bh=GQ3sXKglWX9F6umPChoxH/gNqwUTQzQSiPBWtBNA8Y0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NT+bQGKDU6RAtQxhRjYlp3FfoYDyKDNdmtnGe3nxmX+emR9Agu71qvgei3qhmqxIc
	 x9YAzFdyuJKUspPkHC0GGVR6kKbCYLoRyvZtBzXXmlO0Onjo0mdFLnrsCpF6cNOQlR
	 y+gS6m2yFRn0E7AITdcjs98o9vFxNL+2yG45mk7M=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 25 Apr 2025 14:01:26 +0300
Subject: [PATCH v5 06/11] drm/fourcc: Add DRM_FORMAT_XVUY2101010
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-xilinx-formats-v5-6-c74263231630@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2297;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=GQ3sXKglWX9F6umPChoxH/gNqwUTQzQSiPBWtBNA8Y0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoC2ubYPAv0/wALTYJOUTvmdc/h2f2yyyU1tuVs
 20Jq9/YvKWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaAtrmwAKCRD6PaqMvJYe
 9dTRD/sGff7BpYl4QgmxCPi0uSBg/JHcncEX1c3kDgevpYTtT9lHJBC6BR0rqPpgkWQiaJVswMl
 Rq3J7bDGTxBzDwNkYsPkuOHn9NaD1Lhgf3HTGAELX1eDhVHora56fjZf9aaZkgePz/WmGKgvV/3
 2HfxxBri3RCotjTIoIA4ew5jBP8dE23RGNKHXm7aXNROTSGjDjLv6/ECoGCNrbjshJubMJploA9
 LikDPqm8tZjQyMv9X5/67KFc2OuDiJz5B7c3Ot4GK/HcqrSZZz1DMgMUJXThDB57jpSRriKqo2R
 B4YyaosPz7ep9yUsf5BdcCACLX75Bc+rU8AxrDQ/M+8RDJ/dMPpoWbrtJJ9V0jvRx+FrhubkFB1
 5GPubGFf4HDdk5B0NUFbrKG33yo1ooFjg+sHNIKRTk6+TkmeC7y+QLxYjE1CFgh00oG36F0UYWj
 11RagnNtyeMW1Den/qp+q80hgY12u74iXkEO4kT5ke5rhFyASXzvNHHkW8FUTxk1vbZF++lVtG3
 Jop28bE1Mm2v3tVKCtZiZ2gn5y02dqNuBE1V1q1qmiMYjIghrTJ1n3Bvfix49lLznilZbaaGgkg
 UQ9VjP4mWELwYdIBQP+2TtIT9cgq7TZaetfOPKGjAdMyap7Udw9lSTC7vXTSIuJpLiS+ZRG1wWE
 mKvJRzcTCSbm3UA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add XVUY2101010, a 10 bits per component YCbCr format in a 32 bit
container.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 1 +
 include/uapi/drm/drm_fourcc.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 60684f99f4a7..81e5fcdcc234 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -280,6 +280,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_VYUY,		.depth = 0,  .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_XYUV8888,	.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_VUY888,          .depth = 0,  .num_planes = 1, .cpp = { 3, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_XVUY2101010,     .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_AYUV,		.depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true, .is_yuv = true },
 		{ .format = DRM_FORMAT_Y210,            .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
 		{ .format = DRM_FORMAT_Y212,            .depth = 0,  .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index df3dbc36c26b..562fb7ebed29 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -246,6 +246,7 @@ extern "C" {
 #define DRM_FORMAT_XVUY8888	fourcc_code('X', 'V', 'U', 'Y') /* [31:0] X:Cr:Cb:Y 8:8:8:8 little endian */
 #define DRM_FORMAT_VUY888	fourcc_code('V', 'U', '2', '4') /* [23:0] Cr:Cb:Y 8:8:8 little endian */
 #define DRM_FORMAT_VUY101010	fourcc_code('V', 'U', '3', '0') /* Y followed by U then V, 10:10:10. Non-linear modifier only */
+#define DRM_FORMAT_XVUY2101010	fourcc_code('X', 'Y', '3', '0') /* [31:0] x:Cr:Cb:Y 2:10:10:10 little endian */
 
 /*
  * packed Y2xx indicate for each component, xx valid data occupy msb

-- 
2.43.0

