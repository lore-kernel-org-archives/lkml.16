Received: from unicom145.biz-email.net (unicom145.biz-email.net [210.51.26.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02061F236B
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.26.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739269266; cv=none; b=uGZX7IZQQSnmgetouKcWJIH8t+CdMKs4JQR9eFNAy8uPcTjxhME8uxYaZ6rjaJB953Yk97XO/HjVpLUZbxPo5hErXaWQBIpF7FVBUTCqtF2vs3qIzQxl0XLNAoEqVVQIzuE838jGT5CqiLc4V42FdRFUUOo+Bx9bbgKNSEKsRPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739269266; c=relaxed/simple;
	bh=yFXCWSX98zgTjp1qYAJTz0Wcpe7ySE4lWwS7pAo3Rcw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uS/vpQ8XRdFSZiVTAokhpZm1rrGUOl7MtDfuB1Wne6+zcToiFPf5XICf9dA75MN7gcpZz3dAsd8dTHWV98ZTgXVBF0KwXQ3ZnX2i2B1yjNx4fqLLvwWaTKxgenXJHoBddUP+abmkXEqyrkRzzqmH3B2VjySE/2DReYr0lvN3z8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.26.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from unicom145.biz-email.net
        by unicom145.biz-email.net ((D)) with ASMTP (SSL) id JEG00053;
        Tue, 11 Feb 2025 18:20:53 +0800
Received: from locahost.localdomain (10.94.13.218) by
 jtjnmail201601.home.langchao.com (10.100.2.1) with Microsoft SMTP Server id
 15.1.2507.39; Tue, 11 Feb 2025 18:20:52 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <laurent.pinchart@ideasonboard.com>, <Markus.Elfring@web.de>,
	<tomi.valkeinen@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <michal.simek@amd.com>, <vishal.sagar@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Charles Han <hanchunchao@inspur.com>
Subject: [PATCH V3] drm: xlnx: zynqmp_dpsub: Add NULL check in zynqmp_audio_init
Date: Tue, 11 Feb 2025 18:20:49 +0800
Message-ID: <20250211102049.6468-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
tUid: 20252111820535fc6f945271858da8867862091790480
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

devm_kasprintf() calls can return null pointers on failure.
But some return values were not checked in zynqmp_audio_init().

Add NULL check in zynqmp_audio_init(), avoid referencing null
pointers in the subsequent code.

Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp_audio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c b/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
index fa5f0ace6084..f07ff4eb3a6d 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
@@ -323,12 +323,16 @@ int zynqmp_audio_init(struct zynqmp_dpsub *dpsub)
 
 	audio->dai_name = devm_kasprintf(dev, GFP_KERNEL,
 					 "%s-dai", dev_name(dev));
+	if (!audio->dai_name)
+		return -ENOMEM;
 
 	for (unsigned int i = 0; i < ZYNQMP_NUM_PCMS; ++i) {
 		audio->link_names[i] = devm_kasprintf(dev, GFP_KERNEL,
 						      "%s-dp-%u", dev_name(dev), i);
 		audio->pcm_names[i] = devm_kasprintf(dev, GFP_KERNEL,
 						     "%s-pcm-%u", dev_name(dev), i);
+		if (!audio->link_names[i] || !audio->pcm_names[i])
+			return -ENOMEM;
 	}
 
 	audio->base = devm_platform_ioremap_resource_byname(pdev, "aud");
-- 
2.43.0

