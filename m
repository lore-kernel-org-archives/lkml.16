Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF3924061B;
	Thu,  3 Apr 2025 07:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743666120; cv=none; b=k6Fb8GVUJrEA/7PEUyGItNnMPnKG0g3vlGJzGDex6m9GtdGINZgwBSoTGV6UokYl7Aufw9Kkg6JfBRvPVG+6ux9RBC6OVncOJ2g/R9wT+/aLn7w1Ilm4WdwBZ9e10JHWJjxJFLVzbCobs1S0Hbp/22F1uV+qK7ciFsGiru8I+RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743666120; c=relaxed/simple;
	bh=Hup9x9im7FuBuCmdj3jOBedV8BlLfwaX1ES1aMw1J2Q=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=QayhXWZfu8Md+G4x8kbHqHkLwSZzYoQ6H+ynPyon613fB9LYx2hiKG8I1SKtRZJkBxkvTGhZSBpqPWvdpzk11dJKe/LtZ3o4Bc3LixALPd241R0S4d9M04V+m0Ddw8/Bi0A0N/aW6YZyYx1c6XqzQJZPHEHaAjpFzuS1li1JxGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZStwd126qz5B1J4;
	Thu,  3 Apr 2025 15:41:53 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 5337fetw066040;
	Thu, 3 Apr 2025 15:41:40 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Thu, 3 Apr 2025 15:41:42 +0800 (CST)
Date: Thu, 3 Apr 2025 15:41:42 +0800 (CST)
X-Zmail-TransId: 2af967ee3bb677c-3db59
X-Mailer: Zmail v1.0
Message-ID: <20250403154142936Po-soX8Bifyvw_eWSbddT@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <olivier.moysan@foss.st.com>
Cc: <arnaud.pouliquen@foss.st.com>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <linux-sound@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <yang.yang29@zte.com.cn>, <xu.xin16@zte.com.cn>,
        <ye.xingchen@zte.com.cn>, <zhang.enpei@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBzb3VuZDogc29jOiBzdG06IHN0bTMyX3NhaTogVXNlIGRldl9lcnJfcHJvYmUoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 5337fetw066040
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67EE3BC1.001/4ZStwd126qz5B1J4

From: Zhang Enpei <zhang.enpei@zte.com.cn>

Replace the open-code with dev_err_probe() to simplify the code.

Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 sound/soc/stm/stm32_sai.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/soc/stm/stm32_sai.c b/sound/soc/stm/stm32_sai.c
index 504a14584765..fa821e3fb427 100644
--- a/sound/soc/stm/stm32_sai.c
+++ b/sound/soc/stm/stm32_sai.c
@@ -169,20 +169,14 @@ static int stm32_sai_get_parent_clk(struct stm32_sai_data *sai)
 	struct device *dev = &sai->pdev->dev;

 	sai->clk_x8k = devm_clk_get(dev, "x8k");
-	if (IS_ERR(sai->clk_x8k)) {
-		if (PTR_ERR(sai->clk_x8k) != -EPROBE_DEFER)
-			dev_err(dev, "missing x8k parent clock: %ld\n",
-				PTR_ERR(sai->clk_x8k));
-		return PTR_ERR(sai->clk_x8k);
-	}
+	if (IS_ERR(sai->clk_x8k))
+		return dev_err_probe(dev, PTR_ERR(sai->clk_x8k),
+				     "missing x8k parent clock\n");

 	sai->clk_x11k = devm_clk_get(dev, "x11k");
-	if (IS_ERR(sai->clk_x11k)) {
-		if (PTR_ERR(sai->clk_x11k) != -EPROBE_DEFER)
-			dev_err(dev, "missing x11k parent clock: %ld\n",
-				PTR_ERR(sai->clk_x11k));
-		return PTR_ERR(sai->clk_x11k);
-	}
+	if (IS_ERR(sai->clk_x11k))
+		return dev_err_probe(dev, PTR_ERR(sai->clk_x11k),
+				     "missing x11k parent clock\n");

 	return 0;
 }
-- 
2.25.1
