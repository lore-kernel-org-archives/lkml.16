Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11D32459F3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745578928; cv=none; b=Tms7PnOtHNYFBoGsKKyqB26wQDhPZEK8DyEnWo3fW55u2VpMJekEkrsvu94ZRmDAQPc/Vg2vPQmKdwr3VOeVqFTbB92Dj32ZLkdg4oAfxRmTVZ6uH9Uy/sfXfaPkzCnaWmwudvvuN2CmGS9oO+sFI0wyq28S/qYxbvqDSALcPeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745578928; c=relaxed/simple;
	bh=dH/dlMLBYVvjaYgnpbn3Yiq6mH0D3zJAK+bYStHp0Qg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XRq6kqQisM/dEvryZqWAj35UAAtBb36s/VA29LofrhjVvWu4eaWyoMVvDOl6xBDXy59VF9Cnavl0TVPuhkusbyk2SCWGYZDvh6GvemGLsTYbKW/GhqX9DxeNd5E/ZvVPuWaLY7xM+ck9pjB8QAh6uyrTmJ/5g7GgeVhb9bxxumM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rdzHMyNk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rdzHMyNk"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A4E919C7;
	Fri, 25 Apr 2025 13:01:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745578915;
	bh=dH/dlMLBYVvjaYgnpbn3Yiq6mH0D3zJAK+bYStHp0Qg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rdzHMyNkvRnhOjObcdN5P86oFgBBSbWxc/4aZXdda4BhJM1C/aV6ZLRA4JCgBC1F4
	 yawicCiGmJjHDD8ZTqRZdLZ8bwBsg6DA+dkGjdE17nQPtJ7R/TvMjsAwdMK1RDUyOh
	 YNfEkKypTvoXT51FbWSlbgY3aIJBjMq8ZXNhJPq8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 25 Apr 2025 14:01:28 +0300
Subject: [PATCH v5 08/11] drm: xlnx: zynqmp: Add support for XV15 & XV20
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-xilinx-formats-v5-8-c74263231630@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1003;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=dH/dlMLBYVvjaYgnpbn3Yiq6mH0D3zJAK+bYStHp0Qg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoC2ucasYpFKolqxwj1G/ntFRZT2bUW8HAf9bIf
 i57uZDofk2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaAtrnAAKCRD6PaqMvJYe
 9d73EACFLakNfJ8dpjR7ODhm+TmPkXNDk02LV1F05j4aZp/GhHlCDlQRS03BhSOkoBTTBT0lEQy
 xGNQZ1x7IhSnr6JHoM7qAcTbK3t4mkFwcWCgm81T5eNwrrBC5587Si4vnxMW8jx1k6bO9xegoC9
 ZGzYxGxXE2qJ7Nwteb4SNMvcD1+YjU9dtDN9YXFVWbHBLupns6KuVinQmKAnbT8qopVRSt9EC8J
 +EY91SBUuBywk4FURAHUo1gp/k7l7yrTFuP+chmllSW5+SygCc86iROUlFUqjKpk92PfywMH5Ms
 r5epi973lTaMOKICFjKTFMOcoRlIrGuWvQP6XNQbXDbucnk9o4SzvJIL/als8fyXJeOvdJRvCAp
 G4HpzdvF8wYuwibVVjiPhikMtjPyc6IBGK8dpUoCGaQpKdbF1fm2S6ZrybvBtFxP4swS0M7M1mH
 rSwl2IfKQNOllt3QRriKaD0WgidDfV+7Nbh/z7E9oWnk4uRrhvIM6ltWzbuo+HZSoCIymn/t7HV
 nurDIxn7df/FLJvW6PwhE95pLIk2EUwfyLKC2jfuPmmeRkdswFYyl/5PIvUp1vHBXaYExfDLm7W
 o1W4IVqIrpBBJZig2hp7xOjL7y3oQfpI6LLkmr7LIMLmxsoPpM40xaC/tKZYKIDjhlOMlPG+arB
 UfvXVopuV3KaPmg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add support for XV15 & XV20 formats.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index b9883ea2d03e..1dc77f2e4262 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -297,6 +297,16 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
 		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_420,
 		.swap		= true,
 		.sf		= scaling_factors_888,
+	}, {
+		.drm_fmt	= DRM_FORMAT_XV15,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_420_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
+	}, {
+		.drm_fmt	= DRM_FORMAT_XV20,
+		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_10,
+		.swap		= false,
+		.sf		= scaling_factors_101010,
 	},
 };
 

-- 
2.43.0

