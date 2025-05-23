Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9787810A3E;
	Fri, 23 May 2025 06:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747981160; cv=none; b=iEKMFjB95ShPlsfGPEpxScjLcNTbkvEXW6KivNzduNlOcMmW+f3cY80m0HY54bWXV9ntK0FSKSeuVQysTY34m19n6wNimSapfiHk/EP/4IT8BBI4q4u08SApllLsthcnQE67V8WqrwxB2iLP+W2lZqRfS8WXETgr/pCyhIkSxr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747981160; c=relaxed/simple;
	bh=r/rqlj0hH3msm6cMwGWp9RH90rKWhigIXMjT3hM46cQ=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=Ufn0rekRdK/YiIElhCOUe/G7i03b6w0Io3V/6ONUggw9xP3BmvV0wTSdHvS7AlOU6gZ8Ud6yeEfvHW1jRT1g8D28tBYszO67FMutrxeO/a8bVdV3uWKYB0P3bJNYJ117Za5zAPsqdxZ1IeSsFUYcppejHNZCvDr8wf2IBodUOyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4b3Zk96zWBz4x5pP;
	Fri, 23 May 2025 14:19:13 +0800 (CST)
Received: from njy2app04.zte.com.cn ([10.40.12.64])
	by mse-fl2.zte.com.cn with SMTP id 54N6J8Qh078827;
	Fri, 23 May 2025 14:19:09 +0800 (+08)
	(envelope-from long.yunjian@zte.com.cn)
Received: from mapi (njy2app02[null])
	by mapi (Zmail) with MAPI id mid201;
	Fri, 23 May 2025 14:19:10 +0800 (CST)
Date: Fri, 23 May 2025 14:19:10 +0800 (CST)
X-Zmail-TransId: 2afa6830135e198-abe58
X-Mailer: Zmail v1.0
Message-ID: <20250523141910793yUFpjomfu0byK_yFddHQu@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <long.yunjian@zte.com.cn>
To: <vkoul@kernel.org>
Cc: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
        <sanyog.r.kale@intel.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <mou.yi@zte.com.cn>,
        <xu.lifeng1@zte.com.cn>, <fang.yumeng@zte.com.cn>,
        <ouyang.maochun@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBzb3VuZHdpcmU6IGludGVsX2FjZTIueDogVXNlIHN0cl9yZWFkX3dyaXRlKCkgaGVscGVy?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 54N6J8Qh078827
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68301361.000/4b3Zk96zWBz4x5pP

From: Yumeng Fang <fang.yumeng@zte.com.cn>

Remove hard-coded strings by using the str_read_write() helper.

Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
Signed-off-by: Yunjian Long <long.yunjian@zte.com.cn>
---
 drivers/soundwire/intel_ace2x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 5b31e1f69591..7e893e4f48d6 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -11,6 +11,7 @@
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_intel.h>
+#include <linux/string_choices.h>
 #include <sound/hdaudio.h>
 #include <sound/hda-mlink.h>
 #include <sound/hda-sdw-bpt.h>
@@ -183,7 +184,7 @@ static int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw, struct sdw_slave *
 		return 0;

 	dev_err(cdns->dev, "%s: sdw_prepare_%s_dma_buffer failed %d\n",
-		__func__, command ? "read" : "write", ret);
+		__func__, str_read_write(command), ret);

 	ret1 = hda_sdw_bpt_close(cdns->dev->parent, /* PCI device */
 				 sdw->bpt_ctx.bpt_tx_stream, &sdw->bpt_ctx.dmab_tx_bdl,
-- 
2.25.1
