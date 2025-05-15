Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BFA1FAC54;
	Thu, 15 May 2025 12:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747312748; cv=none; b=HFYLyym2nqqEs4bdhc1Y5bzx/42vftokc2MHF3dacMDwYmmQylUGhONqWpRQo4oMPh1hoG5upyhe793AVoTPfuyZhqqr51yaQ2T6XBOIZ754fT7F6nLF7UxZ24KFOyNn2unau7CzX/TemQecbgdJBCoTTbzeikGyxx1kxDhI7m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747312748; c=relaxed/simple;
	bh=i/OuoCo9ZLE71h8UzRmnY7oMH9WVI3VPq2h1PMLRgF8=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=qJFWXWjiY0RqYdlTw5sceu/tdVSrhdAATklRdRnw49+reQykWP9trOOLjkYJWc9esos1yf4YGZMA3TAw1M/Ix8oZTGD5LGvdFNbHHeBKtJN3YOFmOgzU39St7rQoNjhqlpCMSuDGvkfDK30JOhtVZFCxJx15wmitedyQaXszc6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZyqX72j6Yz5B1Gr;
	Thu, 15 May 2025 20:39:03 +0800 (CST)
Received: from njb2app05.zte.com.cn ([10.55.22.121])
	by mse-fl1.zte.com.cn with SMTP id 54FCcpcj026959;
	Thu, 15 May 2025 20:38:51 +0800 (+08)
	(envelope-from long.yunjian@zte.com.cn)
Received: from mapi (njy2app01[null])
	by mapi (Zmail) with MAPI id mid201;
	Thu, 15 May 2025 20:38:55 +0800 (CST)
Date: Thu, 15 May 2025 20:38:55 +0800 (CST)
X-Zmail-TransId: 2af96825e05f469-cbfdd
X-Mailer: Zmail v1.0
Message-ID: <20250515203855146Sn9x-Uw9Teur35mOjn41C@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <long.yunjian@zte.com.cn>
To: <sudeep.holla@arm.com>
Cc: <cristian.marussi@arm.com>, <peng.fan@nxp.com>, <justin.chen@broadcom.com>,
        <florian.fainelli@broadcom.com>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <fang.yumeng@zte.com.cn>, <mou.yi@zte.com.cn>,
        <ouyang.maochun@zte.com.cn>, <xu.lifeng1@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBmaXJtd2FyZTogYXJtX3NjbWk6IFVzZSBkZXZfZXJyX3Byb2JlKCkgc2ltcGxpZnkgdGhlIGNvZGU=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 54FCcpcj026959
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6825E067.002/4ZyqX72j6Yz5B1Gr

From: Yumeng Fang <fang.yumeng@zte.com.cn>

In the probe path, dev_err() can be replaced with dev_err_probe()
which will check if error code is -EPROBE_DEFER and prints the
error name. It also sets the defer probe reason which can be
checked later through debugfs.

Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
---
 drivers/firmware/arm_scmi/transports/mailbox.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index bd041c99b92b..816e79537935 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -13,6 +13,7 @@
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/dev_printk.h>

 #include "../common.h"

@@ -215,10 +216,8 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 	smbox->chan = mbox_request_channel(cl, tx ? 0 : p2a_chan);
 	if (IS_ERR(smbox->chan)) {
 		ret = PTR_ERR(smbox->chan);
-		if (ret != -EPROBE_DEFER)
-			dev_err(cdev,
-				"failed to request SCMI %s mailbox\n", desc);
-		return ret;
+		return dev_err_probe(cdev, ret,
+				     "failed to request SCMI %s mailbox\n", desc);
 	}

 	/* Additional unidirectional channel for TX if needed */
@@ -226,9 +225,8 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		smbox->chan_receiver = mbox_request_channel(cl, a2p_rx_chan);
 		if (IS_ERR(smbox->chan_receiver)) {
 			ret = PTR_ERR(smbox->chan_receiver);
-			if (ret != -EPROBE_DEFER)
-				dev_err(cdev, "failed to request SCMI Tx Receiver mailbox\n");
-			return ret;
+			return dev_err_probe(cdev, ret,
+					     "failed to request SCMI Tx Receiver mailbox\n");
 		}
 	}

@@ -236,9 +234,8 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		smbox->chan_platform_receiver = mbox_request_channel(cl, p2a_rx_chan);
 		if (IS_ERR(smbox->chan_platform_receiver)) {
 			ret = PTR_ERR(smbox->chan_platform_receiver);
-			if (ret != -EPROBE_DEFER)
-				dev_err(cdev, "failed to request SCMI P2A Receiver mailbox\n");
-			return ret;
+			return dev_err_probe(cdev, ret,
+					     "failed to request SCMI P2A Receiver mailbox\n");
 		}
 	}

-- 
2.25.1
