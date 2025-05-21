Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCE62367D8;
	Wed, 21 May 2025 08:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747815304; cv=none; b=AdU7iObUdY2nTg7hQYw0fkwRnuNew8Q5cd6fRmNOnsHstkHuJP7v/9lYRskz8xYfMi52cf22vbozY4NPcTmFJHky/Pso8dUVDbFe3ACbp+slVoSAHEKLIESA1NAM5S4JbuEoIHlGynx2AUzKzPhUIM+fnSDeMIM7A3Us9tjEMu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747815304; c=relaxed/simple;
	bh=hHHDB6awP/r5qt6vmcLclDRBl4ZmahKZOmtC2vgaDQs=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=eQzNmwUYYzpOcCu6sT7nHIX7ZKKZuW/9wz8twU1iqJj1ojzh9HUotExpv+2BrBaEoFDd53wSw7uQ+cL3IoBbftP39nKhzFpFpnJ1LynlCKMKUvvdi925DG/Q2Zf11A5VD4U+orFz2BPm2CC2RVsNEp/aMoUM/R/Od+u09ItJ2cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4b2PNc4bTTz4x6Ct;
	Wed, 21 May 2025 16:14:56 +0800 (CST)
Received: from njy2app04.zte.com.cn ([10.40.12.64])
	by mse-fl1.zte.com.cn with SMTP id 54L8ElAk051014;
	Wed, 21 May 2025 16:14:47 +0800 (+08)
	(envelope-from long.yunjian@zte.com.cn)
Received: from mapi (njb2app05[null])
	by mapi (Zmail) with MAPI id mid201;
	Wed, 21 May 2025 16:14:49 +0800 (CST)
Date: Wed, 21 May 2025 16:14:49 +0800 (CST)
X-Zmail-TransId: 2afd682d8b79ffffffffaab-bd44e
X-Mailer: Zmail v1.0
Message-ID: <20250521161449954uFxEsoI6Zg_7wDu6IAfWk@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <long.yunjian@zte.com.cn>
To: <sudeep.holla@arm.com>
Cc: <cristian.marussi@arm.com>, <peng.fan@nxp.com>,
        <florian.fainelli@broadcom.com>, <fang.yumeng@zte.com.cn>,
        <arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <dan.carpenter@linaro.org>,
        <christophe.jaillet@wanadoo.fr>, <mou.yi@zte.com.cn>,
        <ouyang.maochun@zte.com.cn>, <xu.lifeng1@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYyXSBmaXJtd2FyZTogYXJtX3NjbWk6IFVzZSBkZXZfZXJyX3Byb2JlKCkgc2ltcGxpZnkgdGhlIGNvZGU=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 54L8ElAk051014
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 682D8B80.000/4b2PNc4bTTz4x6Ct

From: Yumeng Fang <fang.yumeng@zte.com.cn>

In the probe path, dev_err() can be replaced with dev_err_probe()
which will check if error code is -EPROBE_DEFER and prints the
error name. It also sets the defer probe reason which can be
checked later through debugfs.

Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
---
v1 -> v2
(1) Order the includes alphabetically.
(2) Delete "ret = PTR_ERR(*)", and then replace ret in dev_err_probe with "PTR_ERR(*)".

 .../firmware/arm_scmi/transports/mailbox.c    | 20 +++++++------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index bd041c99b92b..764cbeac2492 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -8,6 +8,7 @@

 #include <linux/err.h>
 #include <linux/device.h>
+#include <linux/dev_printk.h>
 #include <linux/mailbox_client.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -214,31 +215,24 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,

 	smbox->chan = mbox_request_channel(cl, tx ? 0 : p2a_chan);
 	if (IS_ERR(smbox->chan)) {
-		ret = PTR_ERR(smbox->chan);
-		if (ret != -EPROBE_DEFER)
-			dev_err(cdev,
-				"failed to request SCMI %s mailbox\n", desc);
-		return ret;
+		return dev_err_probe(cdev, PTR_ERR(smbox->chan),
+				     "failed to request SCMI %s mailbox\n", desc);
 	}

 	/* Additional unidirectional channel for TX if needed */
 	if (tx && a2p_rx_chan) {
 		smbox->chan_receiver = mbox_request_channel(cl, a2p_rx_chan);
 		if (IS_ERR(smbox->chan_receiver)) {
-			ret = PTR_ERR(smbox->chan_receiver);
-			if (ret != -EPROBE_DEFER)
-				dev_err(cdev, "failed to request SCMI Tx Receiver mailbox\n");
-			return ret;
+			return dev_err_probe(cdev, PTR_ERR(smbox->chan_receiver),
+					     "failed to request SCMI Tx Receiver mailbox\n");
 		}
 	}

 	if (!tx && p2a_rx_chan) {
 		smbox->chan_platform_receiver = mbox_request_channel(cl, p2a_rx_chan);
 		if (IS_ERR(smbox->chan_platform_receiver)) {
-			ret = PTR_ERR(smbox->chan_platform_receiver);
-			if (ret != -EPROBE_DEFER)
-				dev_err(cdev, "failed to request SCMI P2A Receiver mailbox\n");
-			return ret;
+			return dev_err_probe(cdev, PTR_ERR(smbox->chan_platform_receiver),
+					     "failed to request SCMI P2A Receiver mailbox\n");
 		}
 	}

-- 
2.25.1
