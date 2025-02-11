Received: from unicom145.biz-email.net (unicom145.biz-email.net [210.51.26.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37E21D54C0
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.26.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739244532; cv=none; b=ka2riJvB+jnjN23CBplQ3HeITU9ewF13/gyrpEscON3YoN8SDbYT1n5IFoEbqFcLLEoav8JXle/lDlgbZ2pplk9EjS5Do8B0+Wl642VRh78RwD6GpSVOS3Wrzwt3Zgm7Fqjc4wn+44sLyv7wgpda7eUUKpszuuyEr9hWRSbbapE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739244532; c=relaxed/simple;
	bh=POTslH0GWW00M4CyZnuTzm3KAmrnQTOVcPPTT1sNUsM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GOehKDCNE3uCtN5k8qMAT5QU9wZJv3iFSn0FUM2rrc4Fc8TWY8AmCz/6lQOxalXsoHA9VztNPupmXP+ZYyFwI5AIpMGEW/D/HO/B7PLuPKwPVLfEm/zJqIsc1w33gZqOSl6keeQUB+vpKQWeBFGAdXn75suqf70Dp/jx6UFl/EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.26.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from unicom145.biz-email.net
        by unicom145.biz-email.net ((D)) with ASMTP (SSL) id IVN00135;
        Tue, 11 Feb 2025 11:28:35 +0800
Received: from jtjnmail201607.home.langchao.com (10.100.2.7) by
 jtjnmail201606.home.langchao.com (10.100.2.6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Feb 2025 11:28:34 +0800
Received: from locahost.localdomain (10.94.14.107) by
 jtjnmail201607.home.langchao.com (10.100.2.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Feb 2025 11:28:33 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <laurent.pinchart@ideasonboard.com>, <Markus.Elfring@web.de>,
	<tomi.valkeinen@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <michal.simek@amd.com>, <vishal.sagar@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Charles Han <hanchunchao@inspur.com>
Subject: [v2] drm: xlnx: zynqmp_dpsub: Add NULL check in zynqmp_audio_init
Date: Tue, 11 Feb 2025 11:28:29 +0800
Message-ID: <20250211032830.2400-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Jtjnmail201614.home.langchao.com (10.100.2.14) To
 jtjnmail201607.home.langchao.com (10.100.2.7)
tUid: 20252111128356074588d4dd940152aa283627d077bd3
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

devm_kasprintf() calls can return null pointers on failure.
But some return values were not checked in zynqmp_audio_init().
Add NULL check in zynqmp_audio_init(), to handle kernel NULL
pointer dereference error.

Fixes: 3ec5c1579305 ("drm: xlnx: zynqmp_dpsub: Add DP audio support")
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

