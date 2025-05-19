Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC7C14E2F2
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 15:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670179; cv=none; b=kT7DobyM6/nDqmDAglB0/7FjIIGIPHmtIDJU7rVd0DPDO+9AmthCBbhJwMMHeUlySi6cWIKJLEIjt1bPubt1S20z/M+xvTxPZQTtgsg0B1ekvFHgX2vR1BOX1H62DLqvCLGb9zSinBu6WwQV0zbUWqdUGrzNhcNB/eCQRPY8EEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670179; c=relaxed/simple;
	bh=rjHmolyQPnAoVvHyr3t1ZB0Q9pGT3PkHYFvpDomPeg4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oRkiSRFw580W7dIn/+cBKMRZuh5XLNSV8VmRh/nz4DciyF2Y+cyroNFR0nsZiZF0GE4vI8TknBeW1DTy5ZZKWtRtqMIDRVmB1Y5fSbwl1u1aely9ZWXHrJgKWJChFdWmk8yPL8oM3kKacL6tYAtbuldzJrCzAj0LoYtytkZC86w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 19 May
 2025 18:56:10 +0300
Received: from localhost (10.0.253.101) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 19 May
 2025 18:56:10 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: <syzbot+721071c10f3c7e4e5dcb@syzkaller.appspotmail.com>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	<syzkaller-bugs@googlegroups.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [syzbot] [usb?] WARNING in gl861_ctrl_msg/usb_submit_urb
Date: Mon, 19 May 2025 18:56:02 +0300
Message-ID: <20250519155603.2364004-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <680aaf92.050a0220.317436.0050.GAE@google.com>
References:
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

#syz test

---
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
index f1c79f351ec8..5c76116fd565 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
@@ -19,6 +19,10 @@ module_param_named(force_pid_filter_usage, dvb_usb_force_pid_filter_usage,
 MODULE_PARM_DESC(force_pid_filter_usage,
 		"force all DVB USB devices to use a PID filter, if any (default: 0)");
 
+static const struct i2c_adapter_quirks i2c_usb_quirks = {
+	.flags = I2C_AQ_NO_ZERO_LEN_READ,
+};
+
 static int dvb_usbv2_download_firmware(struct dvb_usb_device *d,
 		const char *name)
 {
@@ -63,6 +67,7 @@ static int dvb_usbv2_i2c_init(struct dvb_usb_device *d)
 
 	strscpy(d->i2c_adap.name, d->name, sizeof(d->i2c_adap.name));
 	d->i2c_adap.algo = d->props->i2c_algo;
+	d->i2c_adap.quirks = &i2c_usb_quirks;
 	d->i2c_adap.dev.parent = &d->udev->dev;
 	i2c_set_adapdata(&d->i2c_adap, d);
 
