Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C56F26FA51;
	Thu, 10 Apr 2025 10:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279574; cv=none; b=r98zWfM90XDHZMWDgCnrwEkj8ZfXoYUCP0LQ3Np2fnLLDZ5rlg2d1gXyYOafk/g/WrNnZS3I/XoNlZP3g6JhHeU13Fv+u36sfLacuxEhYXppzjp3caqjguit4iPykDoUwl0VhTQLgqTY49QU2RsZQI6K1JQAJCxTAw9rONE9Ldc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279574; c=relaxed/simple;
	bh=iHgY/F3BBacAbbHE6g/IvteKugBlGaSu6obSPRGvkoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=RCE5sMcOQH8iquc9ciIncKDg/QaWUl5vwFh+VenhOAnRBlvmLZ2wUitivuUvFNn8MZ0UIwLxaMSoORv108BXdA77lUAkTXX3I4SE3DhU2LbjJiXCI6n/b14CC41QaESTCYpPlA0BlenZlBeanlHHlcnHIsDAMdZeobG8Z0Vvbvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=hZqHE90S; arc=none smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="hZqHE90S"
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A62MMF009620;
	Thu, 10 Apr 2025 10:55:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=l
	r+fQX7r75FDYTzmRygsQVzz5u8nZ9AUWUuZzUFjS/s=; b=hZqHE90Sjeyy8ECus
	POnxfftcmC/yS+AlFJbfggPD0QUku/+oi7B0dJzlqABDomS/G4zGcQJcCxjJN+jS
	nShp9hChdYJRjHt1PtkgwKSc703UaDR2RlER/y3gnnm3/VJT9lsEGdShBIKyhn4y
	2D8w1kdg9nWxqGpt8CIBdmERVz8r5ynKafEJ1QidbIR4U/jsvQNFqsYV0bdjz9V6
	GUaqlismJN786iD/CFLg+BBbP8Ci6Jp758mv0LGBX7JXXqfpU5Xw1ZT4peamqThk
	r2FAH6Di59HyL09sUzkZqYRuZvJHJ0Zjp+1ZyWwck46pK2sbPJMNT6dzz1jeOz1P
	Oz+XA==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 45ttssbgdy-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 10 Apr 2025 10:55:20 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.134) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 10 Apr 2025 10:55:18 +0100
From: Matt Coster <matt.coster@imgtec.com>
Date: Thu, 10 Apr 2025 10:55:03 +0100
Subject: [PATCH v6 04/18] drm/imagination: Use new generic compatible
 string
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250410-sets-bxs-4-64-patch-v1-v6-4-eda620c5865f@imgtec.com>
References: <20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com>
In-Reply-To: <20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>,
        Matt Coster
	<matt.coster@imgtec.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>,
        "Michal
 Wilczynski" <m.wilczynski@samsung.com>,
        Alessio Belle
	<alessio.belle@imgtec.com>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2097;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=iHgY/F3BBacAbbHE6g/IvteKugBlGaSu6obSPRGvkoE=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaR/n9p4rnH3lUqTj01soq7bHtff/Lx63nHlU5d+GUy4c
 uLYtm/bd3SUsjCIcTDIiimy7FhhuULtj5qWxI1fxTBzWJlAhjBwcQrARDKrGP7p/IqOOsvEev9n
 xIz5k3UCjjbkSz38NuFJyIpPUaEl/0tXMDK8ejR364+gpf22relqVyW+Kk3XvBQX+vrIxpz2/WL
 9N5cxAgA=
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: CtRyj8pxqoSjKIolRDfLOtt4mAy-hqJI
X-Authority-Analysis: v=2.4 cv=I7hlRMgg c=1 sm=1 tr=0 ts=67f79588 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=UtEzwyU9vMAA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=FJx4x6bKK2OINkBaql4A:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: CtRyj8pxqoSjKIolRDfLOtt4mAy-hqJI

Follow-on from the companion dt-bindings change ("dt-bindings: gpu: img:
More explicit compatible strings"), deprecating "img,img-axe" in favour of
the more explicit combination of "img,img-rogue" and "img,img-axe-1-16m".

Since all relevant details are interrogated from the device at runtime,
we can match on the generic "img,img-rogue" and avoid adding more entries
with NULL data members (barring hardware quirks).

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Reviewed-by: Frank Binns <frank.binns@imgtec.com>
---
Changes in v6:
- Add Frank's Rb
- Link to v5: https://lore.kernel.org/r/20250326-sets-bxs-4-64-patch-v1-v5-4-e4c46e8280a9@imgtec.com
Changes in v5:
- None
- Link to v4: https://lore.kernel.org/r/20250320-sets-bxs-4-64-patch-v1-v4-4-d987cf4ca439@imgtec.com
Changes in v4:
- None
- Link to v3: https://lore.kernel.org/r/20250310-sets-bxs-4-64-patch-v1-v3-4-143b3dbef02f@imgtec.com
Changes in v3:
- Don't use more specific compatible strings when not required
- Link to v2: https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-5-3fd45d9fb0cf@imgtec.com
Changes in v2:
- None
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-5-4ed30e865892@imgtec.com
---
 drivers/gpu/drm/imagination/pvr_drv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 0639502137b4431dc23a349476572cc898d1f8d0..3130193f8fffc185e630a293be53374bdc4b7ce0 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1473,6 +1473,13 @@ static void pvr_remove(struct platform_device *plat_dev)
 }
 
 static const struct of_device_id dt_match[] = {
+	{ .compatible = "img,img-rogue", .data = NULL },
+
+	/*
+	 * This legacy compatible string was introduced early on before the more generic
+	 * "img,img-rogue" was added. Keep it around here for compatibility, but never use
+	 * "img,img-axe" in new devicetrees.
+	 */
 	{ .compatible = "img,img-axe", .data = NULL },
 	{}
 };

-- 
2.49.0

