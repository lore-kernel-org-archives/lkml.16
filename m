Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825582475E8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744801616; cv=none; b=sXwDETt0A6uGsWltb+rlqUl+FjdsLZPYNA52+kboDbmVRAHH/NeoNb7U6z/bFqKUjZVVBepQtcqhSMVvLicF6+qsfl48S6u8aRemWD8eJICN3NlIC19Vc9rYpEfMMLd4zh6z+HsUb9NKCWcwt2zssZ1xsmEWkjHq9q4kbtNbglI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744801616; c=relaxed/simple;
	bh=/OWIGfyJTQBTgLeVXtdfwJ2rwPTdd/hysEabXi94LJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nCmaTfzcC7ipLiUhkCACbIan4uT2HmHVuPMo4Ae6JCiAfm+p5Eip70RC/E52cTm0M324qcXLgGmuajBBcBiZ/158vr2el4Y+HLgFJLeA5jTx0FLTGVJIMgF0QGE2EE0XPgQJoKj6S6lAxtFp09PS041sjJ0iwC9h8tbXIql7JKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tDgM2p3g; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tDgM2p3g"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39DF5109A;
	Wed, 16 Apr 2025 13:04:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744801486;
	bh=/OWIGfyJTQBTgLeVXtdfwJ2rwPTdd/hysEabXi94LJs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tDgM2p3gkqnQMxG2mIXBR+UZ9OWtHjeIbqc5coRzZnu/6juQ7W0TvY4uJ5UZqkAt0
	 87xcP1Wap7x3XBCw4mgHjLjtgKG4gXhAbevgVm7JapYgzQQDNAnn4u5vZ2DMYXmRXX
	 Y2FbLrSW6jwZZO5FWUKbmOVLBi566nXYvHQm/uas=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 16 Apr 2025 14:06:30 +0300
Subject: [PATCH 2/2] drm/tidss: Remove early fb
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-tidss-splash-v1-2-4ff396eb5008@ideasonboard.com>
References: <20250416-tidss-splash-v1-0-4ff396eb5008@ideasonboard.com>
In-Reply-To: <20250416-tidss-splash-v1-0-4ff396eb5008@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-kernel@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1169;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=/OWIGfyJTQBTgLeVXtdfwJ2rwPTdd/hysEabXi94LJs=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn/49GOuWX7n2wAgBWu2yS6sYONOig82mNFc802
 WOGygG6a3iJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ/+PRgAKCRD6PaqMvJYe
 9U3OEACyb8R8X5unumx6SD93sxDv+29D9dAYHNgiMuhGKw5xCfFyUb1xFtiobBbKh47pxiwSt1b
 JdHzHvxfWq8cIQ8YYjV4GXQyZLX1qzAu/h/7l4jlo1WDUDUMaSZmphztsM5k5wmRgFeugHgiNCq
 yomP1d6Fs8vjE0PVeELQh5acbIFv6W34YL1NDAyqAbAiFlgEwty7PCV50DFl3YVTxQYh5I94IbY
 WX5QW4McFQ0jiR4thEO/bF6ICr4Kat9KBK6IUT1Mwoq4emtQWrahda8ecA/+PDBl0TfWk+tfr7k
 /S0DcoI6FUzORS2YpnaNh71Ur3PUryApSh5kHlVxQnAsMQA3h/4OLu+z5AezTk3lLjaVY7U6sRb
 sAD0RmrAML+e4u56ys5e/yFXI/HNE9Ore6bCX0ZkNy64htTmpF/KpPyrpEtwQQ6x+mtb5iUwr9g
 5uMaPNMee7wR7ujjFuoEv9I/T3PUyb5tdoQjasD5v3KxZDSscPt2QMV6eMKmp5skGKnEHPYdTIJ
 Aa5gK+scY2CoN+4TLigPITKJf1qAwEKvkU5ZQpATiC62Zwh6euMS2WMyr7qRwb7QCXeYtfbbret
 DE2dpXdMm/xPv8eiOl4IrZiKtj4dGmw6bNHHsUmcdM3HtvMyCV/ZbF5eLDlYGXhkWvWTFGFBsZT
 qnBtrwyya4/rPGQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add a call to drm_aperture_remove_framebuffers() to drop the possible
early fb (simplefb).

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 21f2358790b4..17df0583710c 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -8,6 +8,7 @@
 #include <linux/of.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/aperture.h>
 
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic.h>
@@ -207,12 +208,20 @@ static int tidss_probe(struct platform_device *pdev)
 		goto err_irq_uninstall;
 	}
 
+	/* Remove possible early fb before setting up the fbdev */
+	ret = aperture_remove_all_conflicting_devices(tidss_driver.name);
+	if (ret)
+		goto err_drm_dev_unreg;
+
 	drm_client_setup(ddev, NULL);
 
 	dev_dbg(dev, "%s done\n", __func__);
 
 	return 0;
 
+err_drm_dev_unreg:
+	drm_dev_unregister(ddev);
+
 err_irq_uninstall:
 	tidss_irq_uninstall(ddev);
 

-- 
2.43.0

