Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3FA150997
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 07:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738826292; cv=none; b=QmRDS7GUCSE0GC1Qsb/fqp8pub7I1T/lX8OIGYumHW22CW+c7ELIgN6/5j1RuOtKkP04UewSgthiYI9uhrneFXJxm9d+42LvIoCFP6IxaaAKwSDZNPq0wndwlkWkSs1+kWQA8zfbeZWMudfyRhb5WYdN5X/XjqshcahwFFSS/NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738826292; c=relaxed/simple;
	bh=JanUGQLiO7IMIu+ToPA3bv0fQOmjLaWIsBA5UyHeoEI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=arEEdyvWbqI2cMve+CQhtR2VlmoC436ywIllQbiJtbX8od/jsXFyMc1czOjUj0evmNic+g9fDL4nQrQl3S6edJDThfHlju8ffNkOSyA6CNUTIBx/1qzIcxvl+1XR6Ah/ndFZSYlq53R7vJki01UQgPhBLmGhQfuVS1Q0BVf0bQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jXhcVf+6; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jXhcVf+6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=vDguK
	/IJI6mrALpE8EKxOhc/FmVlWPjp/9oQPbQDIII=; b=jXhcVf+6ot9tM4Z5HgJnA
	FkRUvg330OXBK/DFippMIUNesz6au5VkP8FwA5bDQga9zwD9YHUoLWSXCbgGU/Ra
	dEHbjEaj8UP5tKOegFYwKM6bPu745nWlELnMHRIhia2h36r7XE7zxtVK9G/Fxv1q
	kOSDEc46sQbNhFDcsqwZBk=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wC3SPn7YaRnoYTtJw--.1037S2;
	Thu, 06 Feb 2025 15:17:17 +0800 (CST)
From: oushixiong1025@163.com
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: Dharma Balasubiramani <dharma.b@microchip.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] drm/bridge: convert to use devm_platform_ioremap_resource()
Date: Thu,  6 Feb 2025 15:17:13 +0800
Message-Id: <20250206071713.180471-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC3SPn7YaRnoYTtJw--.1037S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWfWrWkuFyxXw4Duw1UGFg_yoWfGrX_CF
	4rZrn3JFsYyryvvr43Ca13A3sFy3WqgFWxGr45Kasav347Aw17X3y7ury7XF1DJw10yFyq
	ka1DWr13Awn3CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU88nY7UUUUU==
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXBfjD2eaBHV9DgAFsd

From: Shixiong Ou <oushixiong@kylinos.cn>

convert to use devm_platform_ioremap_resource().

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/bridge/microchip-lvds.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
index b8313dad6072..53dd140a1b8d 100644
--- a/drivers/gpu/drm/bridge/microchip-lvds.c
+++ b/drivers/gpu/drm/bridge/microchip-lvds.c
@@ -162,8 +162,7 @@ static int mchp_lvds_probe(struct platform_device *pdev)
 
 	lvds->dev = dev;
 
-	lvds->regs = devm_ioremap_resource(lvds->dev,
-			platform_get_resource(pdev, IORESOURCE_MEM, 0));
+	lvds->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(lvds->regs))
 		return PTR_ERR(lvds->regs);
 
-- 
2.25.1

