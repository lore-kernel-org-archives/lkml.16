Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7A72417EF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745578918; cv=none; b=PHGNKyNX9quSugwzliVb0GD9amQQRDBfg3X0xG3dodcN9XMDe9rEnhSJhBaHhcU5+OOyJXzeCSRHnmLmmJjp35PEPweNWLRdQE89oEDHHnvptzRqbr+yYYSq5W0bQKGOJgomeFsOm+eL053t1XcdzgvFWz8kmnMLiiZNnREZpyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745578918; c=relaxed/simple;
	bh=oWB+k3YdN2oGtIP+eNrRjj58cvMvE9xAoBG8JrtVz78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nneXatK4gancay+C8o+B2p1P3vGfTPEiYDc3D3ugFWP/MCnH2LPWhI2oRq7Zfb9JJteC9DGbpSqHnzWZwxBSQfL5/1misYpF0Bq1zI/2Sc6I0DZeeU4RGdV9EaY4qlx70uTCAKiw4RCionZaInjvypugiL//0g0QPJRZyqQG1YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hu1v1AAF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hu1v1AAF"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 88CD3EE4;
	Fri, 25 Apr 2025 13:01:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745578910;
	bh=oWB+k3YdN2oGtIP+eNrRjj58cvMvE9xAoBG8JrtVz78=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hu1v1AAFBQMoIzLemdfDc3aRjzIZbO9lK/UIuuflMtpMnhHIUzrqaleFxg3oA0Y8W
	 +3fTzADH5mVjLVsHuTLZW/ZSR8q8esUjt99YCTBiQdSLUXC98qRO65g/8Ao0zmOOXp
	 A874qRwEX47rRlDa+ipm6oIN4sIfvSjYeUysS1LQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 25 Apr 2025 14:01:22 +0300
Subject: [PATCH v5 02/11] drm/fourcc: Add DRM_FORMAT_XV15/XV20
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-xilinx-formats-v5-2-c74263231630@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2201;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=oWB+k3YdN2oGtIP+eNrRjj58cvMvE9xAoBG8JrtVz78=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoC2uanCWWVL7wd5T9RWP070XzWhAE4usJENsQW
 yGHlDEqRdqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaAtrmgAKCRD6PaqMvJYe
 9bxhEACeXgFP/xyYSgrm+03Z3utF9MuJsIZkv5seiN0mA7+VeYSDx1Cs+6hFFjnKTYpvr1M4eIA
 LNLCMijWiBsKuN+/KGGcu0Kxt70dSnoqmDEVar+PmkfAOagwfmRMjj/fFbH4Fb/1zhptCFXm0r1
 Bo+HA/adtkJhJmO1KuxZM3WQ3/YYWtHq6rM4V6iHt06O9KfSHG3lyHkgHsAFHUZoTyJiO60UKpF
 9H3ClbNZlEGVQvMvkWzWgZPSHdV+dIPRuJlu++uls2MKUXX7W5KW7tekqrKjL5H49/xaQtnCeYM
 P2zZyeF5iIYr3H2bB4qI5VLdb1JZR0h9cL0vdGDckJlOmiB3AvN8NwJ4YxXFyNtmMWFILmEHI+R
 USMocSWmA7E2zbqIj+JDFkVWmlwu/nFBEvv3djXMdJ9y8dT/WVCrEqXdKSPJdyqLlt6gx9R7/IO
 GIZg4mwKWORW76xi5UNHpShgE1/eIVLrjC5mUWEv4XzQeT6a3tejdmT4ELEHhDFu68rHnhkAIQt
 sO9z5JA20HSLBsjRG6tstSCbFzlGCm3aiaHq9ITpajH2+nPqe3VHcnIEkGvoLvjk6uOrAm4AREp
 kQTkjoc+9LGayDdmpcpnflOQgDWXDIJHKfzqlGUyjpmkQO5OkmGXJIZMwBJLE+cz9JfFd998OLN
 SDm2FMORZnn6tug==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add two new pixel formats:

DRM_FORMAT_XV15 ("XV15")
DRM_FORMAT_XV20 ("XV20")

The formats are 2 plane 10 bit per component YCbCr, with the XV15 2x2
subsampled whereas XV20 is 2x1 subsampled.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 6 ++++++
 include/uapi/drm/drm_fourcc.h | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 2f5781f5dcda..e101d1b99aeb 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -346,6 +346,12 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_P030,            .depth = 0,  .num_planes = 2,
 		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
 		  .hsub = 2, .vsub = 2, .is_yuv = true},
+		{ .format = DRM_FORMAT_XV15,		.depth = 0,  .num_planes = 2,
+		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
+		  .hsub = 2, .vsub = 2, .is_yuv = true },
+		{ .format = DRM_FORMAT_XV20,		.depth = 0,  .num_planes = 2,
+		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
+		  .hsub = 2, .vsub = 1, .is_yuv = true },
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 81202a50dc9e..1247b814bd66 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -304,6 +304,14 @@ extern "C" {
 #define DRM_FORMAT_RGB565_A8	fourcc_code('R', '5', 'A', '8')
 #define DRM_FORMAT_BGR565_A8	fourcc_code('B', '5', 'A', '8')
 
+/*
+ * 2 plane 10 bit per component YCrCb
+ * index 0 = Y plane, [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian
+ * index 1 = Cb:Cr plane, [63:0] x:Cr2:Cb2:Cr1:x:Cb1:Cr0:Cb0 2:10:10:10:2:10:10:10 little endian
+ */
+#define DRM_FORMAT_XV15		fourcc_code('X', 'V', '1', '5') /* 2x2 subsampled Cr:Cb plane 2:10:10:10 */
+#define DRM_FORMAT_XV20		fourcc_code('X', 'V', '2', '0') /* 2x1 subsampled Cr:Cb plane 2:10:10:10 */
+
 /*
  * 2 plane YCbCr
  * index 0 = Y plane, [7:0] Y

-- 
2.43.0

