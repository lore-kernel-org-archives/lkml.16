Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692BE54758
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 06:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747290896; cv=none; b=IGN/bBtYmYNCoMtsnQxfYxZBjm5NaXZ6JvqfPPuGZ72ZQ13KLuouR1uwDdCicbp4WesZcPrjsqtzv6LXChzIcSBgGUrG3HNBrurThwOyTz59o95S7j5VoqhVBinaGGJulishSELb7JgwjeWJPY+ANkUNQ+kGAhUFYGoDrirHmz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747290896; c=relaxed/simple;
	bh=pvr1XJMQdT9ucTXd4s5tAynddkwj6XkzQG+wue0B/sk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FtgV68r94licI+aHSOM92n8CZSjGQFjWsS5V8SsW08lAbFN+74KR+mBfwuzH/wolk0gqmTUIr0ebZM2PxCjEzYX31iWQrkjsYBCWrUqdp+xgSSfNQDd7A9q6lrC2ETK0yyZvoXBrFiHZrdD1AZgD11h8CNEPTf6/fuE/Rku0CJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; arc=none smtp.client-ip=212.27.42.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from localhost (unknown [82.64.135.138])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 820362003EF;
	Thu, 15 May 2025 08:34:36 +0200 (CEST)
Received: by localhost (Postfix, from userid 1502)
	id D3240C4D1; Thu, 15 May 2025 06:34:35 +0000 (GMT)
Date: Thu, 15 May 2025 06:34:35 +0000
From: Etienne Buira <etienne.buira@free.fr>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Etienne Buira <etienne.buira@free.fr>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] firmware/raspberrypi: raise timeout to 3s
Message-ID: <aCWK-09YW1i2lPgj@Z926fQmE5jqhFMgp6>
Mail-Followup-To: Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Etienne Buira <etienne.buira@free.fr>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <048fd6c5-9f09-4c06-9a23-e5821dc291d5@gmx.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <048fd6c5-9f09-4c06-9a23-e5821dc291d5@gmx.net>

Raspberry firmware driver expected said firmware to answer by 1 second.
That seems to work fine for most cases, but with
RPI_FIRMWARE_NOTIFY_DISPLAY_DONE, that IIUC may need to reconfigure a
monitor, i end up reliably having timeouts:
[    2.861407] ------------[ cut here ]------------
[    2.865512] Firmware transaction 0x00030066 timeout
[    2.865549] WARNING: CPU: 3 PID: 42 at drivers/firmware/raspberrypi.c:128 rpi_firmware_property_list+0x21c/0x29c
[    2.880751] CPU: 3 UID: 0 PID: 42 Comm: kworker/u16:1 Not tainted 6.15.0-rc6 #1 PREEMPT
[    2.888944] Hardware name: Raspberry Pi 4 Model B Rev 1.5 (DT)
[    2.894848] Workqueue: events_unbound deferred_probe_work_func
[    2.900752] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    2.907801] pc : rpi_firmware_property_list+0x21c/0x29c
[    2.913089] lr : rpi_firmware_property_list+0x21c/0x29c
[    2.918376] sp : ffffffc0803139c0
[    2.921725] x29: ffffffc0803139e0 x28: ffffff8040bbef50 x27: ffffff80410c0f40
[    2.928953] x26: ffffffd7055d9e28 x25: ffffffc0801e0008 x24: 0000000000001000
[    2.936179] x23: ffffff80410c1080 x22: 000000000000000a x21: ffffff80410c0f00
[    2.943405] x20: 000000000000000c x19: ffffffc0801e0000 x18: ffffffc08030d0a0
[    2.950632] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[    2.957858] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
[    2.965085] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
[    2.972311] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
[    2.979537] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
[    2.986764] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
[    2.993992] Call trace:
[    2.996458]  rpi_firmware_property_list+0x21c/0x29c (P)
[    3.001747]  rpi_firmware_property+0x70/0xd8
[    3.006064]  vc4_drm_bind+0x12c/0x378
[    3.009765]  try_to_bring_up_aggregate_device+0x22c/0x308
[    3.015230]  __component_add+0xec/0x224
[    3.019106]  component_add+0x14/0x30
[    3.022720]  vc4_hdmi_dev_probe+0x1c/0x40
[    3.026773]  platform_probe+0x68/0xf0
[    3.030474]  really_probe+0xc0/0x3ac
[    3.034088]  __driver_probe_device+0x7c/0x174
[    3.038495]  driver_probe_device+0x40/0x100
[    3.042725]  __device_attach_driver+0x10c/0x1e0
[    3.047308]  bus_for_each_drv+0x88/0x100
[    3.051273]  __device_attach+0xa0/0x1c8
[    3.055151]  device_initial_probe+0x14/0x30
[    3.059381]  bus_probe_device+0xc8/0xcc
[    3.063259]  deferred_probe_work_func+0xb8/0x12c
[    3.067930]  process_one_work+0x160/0x2d4
[    3.071983]  worker_thread+0x2d8/0x400
[    3.075773]  kthread+0x12c/0x208
[    3.079034]  ret_from_fork+0x10/0x20
[    3.082647] ---[ end trace 0000000000000000 ]---

Raising the timeout to 3 seconds (ought to be enough®) doesn't trigger
timeouts anymore for me and proceeds to the next failure.

Signed-off-by: Etienne Buira <etienne.buira@free.fr>
---
 drivers/firmware/raspberrypi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 7ecde6921a0a..8c45a152e3ba 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -58,7 +58,7 @@ rpi_firmware_transaction(struct rpi_firmware *fw, u32 chan, u32 data)
 	reinit_completion(&fw->c);
 	ret = mbox_send_message(fw->chan, &message);
 	if (ret >= 0) {
-		if (wait_for_completion_timeout(&fw->c, HZ)) {
+		if (wait_for_completion_timeout(&fw->c, 3 * HZ)) {
 			ret = 0;
 		} else {
 			ret = -ETIMEDOUT;
-- 
2.48.1

