Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AFD247290
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745578931; cv=none; b=bA+pUznpOATtQNG1Fj7ODnU961nfrgijUGeK+MP4/F43B2DpvJ94IvZyrxVJBLfhI31/FR9piC4UviBJOlinyVuHIHeiE4A8SnoqOEKbdPSqXh4e3SYPVfucf6B0VHdee92KKW07CLnsgkZTREu6YX0B2NmmorieOebwwiJODqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745578931; c=relaxed/simple;
	bh=umPZaDsg5uyoYpXd0vVmqROXAQICx0jSw2Uz52BcwI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NdBqiqEOvIV6azBrknwUpyzQ10ofphKi8/tjJyK4TH72MZLQl+xFbA8M3xfW+e/R4dileg0jSCVVAEg/38+YWDS2k0KpbhOaihTnIji3IUv9Z612nLwUBE21BywpZ0mv8XLRoNObf97/0jpHP4Qki/qNZomcibaCgIwqSoS6RtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IBN0gKIV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IBN0gKIV"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EADC9122C;
	Fri, 25 Apr 2025 13:01:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745578918;
	bh=umPZaDsg5uyoYpXd0vVmqROXAQICx0jSw2Uz52BcwI4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IBN0gKIVaXKU0YVNHxyNWnYK2NxrrtjP1QK2/VCULi2THqaWRLGfxiF1EU9WkDnKn
	 HWuqLyn4nVNEPJbv7LcqbZX2zp+yUim0/CTXWT/hKeB+yY25igsGYWDds/M8gsdf6I
	 4JyUlvyEps1aD8dOIVN8+dQ1SjrtPl18RD8e5zvY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 25 Apr 2025 14:01:31 +0300
Subject: [PATCH v5 11/11] drm: xlnx: zynqmp: Add support for XVUY2101010
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-xilinx-formats-v5-11-c74263231630@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=848;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=umPZaDsg5uyoYpXd0vVmqROXAQICx0jSw2Uz52BcwI4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoC2udA4dfbG3QN9DCmOMTbyod1RCs6z7QUm/k+
 O+S0UBcMSmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaAtrnQAKCRD6PaqMvJYe
 9UQ/EACp+r42VR3lFkCS5/8ec6tOljoXhYM8kv/4xGJjUR4Lj/bvJBP6qd4HZVs6uUQiF8mOCJr
 ti4x7a7KiuXOhqzkfllcXXflFbg90rekkxIHq32156hcahEdeDq4U51mMaOe+BK/mXycsjP5q4J
 3sdpGkahFqP1rPAKnbsaAJLDf+ri1vpdc9a9JQXUQpbmvb+PH/kkStAWjxu/+j5Cc4W32G946bd
 ODmbDkqyMkO6RMvm/8py+NXjcKnaI4r0dqzBJr0YZqoPplGfXNT8IKxIpYdAPhb006MTM6VIehJ
 T8rwqCEPozFceLWHwoeXeTkdOQj3cNUC8GpqNBlcKdYraGvHL61luAicYeyo2sHjqbU8zvXA70J
 3jD1gIOAnOxJV0Y/qPPixYKk8YD2GJHNliPMoIhFCG4Fl4joqsCJbT87x8cfE/PE6d6FeO6xldz
 Aev4S/5CvgRi69tRj3lz7W0w5ifzjar/6kuM25qQf290hg2CUVtWvNv68DC6/p2jj17cVnIbW7R
 7HkEf4/swM8qE9yDW3uIS7HGMPDaC4J26oVdgsSZpx8AtcMaPpnw4Wi+TQIm9bsEngEXCuas5I4
 j04jTnKC3zP+CR78eVqNgm+tIsyXSl2Yukk62ihrM3jacV2MTeV+zVppmapPn2QkueOZHMR55EG
 260SO33d05vwWhQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add support for XVUY2101010 format.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index b7cc7a7581ad..f548f375750e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -322,6 +322,11 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
 		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV24_10,
 		.swap		= false,
 		.sf		= scaling_factors_101010,
+	}, {
+		.drm_fmt	= DRM_FORMAT_XVUY2101010,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YUV444_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
 	},
 };
 

-- 
2.43.0

