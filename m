Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8354823DE
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 09:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743152456; cv=none; b=h2uXCndN2m8mxP4syfT8PcXSzR3bX8wd07MTj2cskFJIiHi6XT44t3HY+qN8YluZUE2azf2q3+NJy4Rv2EyJG2aKNRl5Ez5OTs6Fw6WFnIFMtvCHR1pz9/oiYrIiEQiOPLgw9VuVc9/A0H78HQzcyMmoHQ2h1b/UewN3gO0mRgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743152456; c=relaxed/simple;
	bh=zjBdgLOzPfWVyc3hsQ2yS2yL10tTO+NL6GgIw3zJGLc=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=Cn0apWlFRsWJzfMIxHFtCsAmEibjBBcNOLjGqeq6pw1sYvTT3ukVujQQk854yz9CMlUg/1CVAGwBYZ7zvwSvB1ItW8g5xkmQ5ISgCuIPmzd+2w3ypazmNHwyLoiGKz3ey0Rvh+4uhRu/RQU6+0cBfSWLplBHcOMrDzqDLLJr/oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZPDyP6Hmsz5B1J5;
	Fri, 28 Mar 2025 17:00:45 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 52S90OpQ000912;
	Fri, 28 Mar 2025 17:00:24 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 28 Mar 2025 17:00:26 +0800 (CST)
Date: Fri, 28 Mar 2025 17:00:26 +0800 (CST)
X-Zmail-TransId: 2afc67e6652affffffffc56-b98be
X-Mailer: Zmail v1.0
Message-ID: <202503281700265542u_5j7eZjBf05CqIqnYKa@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <laurent.pinchart@ideasonboard.com>
Cc: <tomi.valkeinen@ideasonboard.com>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>,
        <zhang.enpei@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0veGxueDogenlucW1wX2RwOiBVc2UgZGV2X2Vycl9wcm9iZSgp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 52S90OpQ000912
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67E6653D.003/4ZPDyP6Hmsz5B1J5

From: Zhang Enpei <zhang.enpei@zte.com.cn>

Replace the open-code with dev_err_probe() to simplify the code.

Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index a6a4a871f197..28efa4c7ec8e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -2466,10 +2466,8 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)

 	dp->reset = devm_reset_control_get(dp->dev, NULL);
 	if (IS_ERR(dp->reset)) {
-		if (PTR_ERR(dp->reset) != -EPROBE_DEFER)
-			dev_err(dp->dev, "failed to get reset: %ld\n",
-				PTR_ERR(dp->reset));
-		ret = PTR_ERR(dp->reset);
+		ret = dev_err_probe(dp->dev, PTR_ERR(dp->reset),
+				    "failed to get reset\n");
 		goto err_free;
 	}

-- 
2.25.1
