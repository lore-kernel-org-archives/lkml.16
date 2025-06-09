Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A8E280031;
	Mon,  9 Jun 2025 05:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749447114; cv=none; b=JHk4q24GWkXasc1/Q8PoDgP53wxoObxcg0Rj3fRd55M48IE/V9XE4npZ/8UksOmKQ9GJn2qO2KBOjgA9Toq9GEIOimmHIrEyQjrMIsmGFx49KB8dmLDuPO7B1KD147G8q4n7DiV1FeiD9c50s4PrwZ+xFtWTPElqCaF6FdTu2fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749447114; c=relaxed/simple;
	bh=xwHgyoHajGhFY1G2n44w1WEmYaier/b42ADmqkITLwU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YSgn1KJwVo0Rn4WlcGrc/2Q4iDRxFodSUm+XYYQzo694t+qhO/kTWlaZx6+fQaYKTb4Jq4mP5ZBSOPwjU4O1vir/P2f1A3uNZ7FjIJbR0sxmP7pvUjzocbFJjw2Qr9mlpk7nOPQIDOAYKeivV02hfVnfv94FwuFE7wBuyiHIX14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=OP+3WZHn; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="OP+3WZHn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=AvQOg1tPoDT2meHewRVvm4BILZo75QenErRGTw3BX5U=;
	b=OP+3WZHnqjLcnJefGNCXPvOIJyNhaV/AI6aKi6ETAnFOWcnwXt4JmA+G6Vvx4o
	mJBMvduyWSxhAiH5OqvrzgFfTZgrDT08wtWzEptDF9Plbr4UHoVL7b463733ZhOl
	CSu0fUEjEu1UulZudSBk1Q8LczQx9oWkDafIoIm331Nwg=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD33+yacUZoxUA_AA--.25782S3;
	Mon, 09 Jun 2025 13:31:08 +0800 (CST)
Date: Mon, 9 Jun 2025 13:31:06 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Xu Yang <xu.yang_2@nxp.com>, Peter Chen <peter.chen@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: i.MX kernel hangup caused by chipidea USB gadget driver
Message-ID: <aEZxmlHmjeWcXiF3@dragon>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID:Ms8vCgD33+yacUZoxUA_AA--.25782S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr47JF43WrW5AF13WFy7GFg_yoW8Zw47pa
	13Aw17CrnxJFyxKF4Iy34jkFZ8Aa95JryqgF13X3y8Z3W5Cr9xCr4UKFyfXasFvF95Ca1q
	yr4UW34xGFy8WF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jTT5QUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIBwvlGhGcZz+bAAA3W

Hi Xu, Peter,

I'm seeing a kernel hangup on imx8mm-evk board.  It happens when:

 - USB gadget is enabled as Ethernet
 - There is data transfer over USB Ethernet
 - Device is going in/out suspend

A simple way to reproduce the issue could be:

 1. Copy a big file (like 500MB) from host PC to device with scp

 2. While the file copy is ongoing, suspend & resume the device like:

    $ echo +3 > /sys/class/rtc/rtc0/wakealarm; echo mem > /sys/power/state

 3. The device will hang up there

I reproduced on the following kernels:

 - Mainline kernel
 - NXP kernel lf-6.6.y
 - NXP kernel lf-6.12.y

But NXP kernel lf-6.1.y doesn't have this problem.  I tracked it down to
Peter's commit [1] on lf-6.1.y, and found that the gadget disconnect &
connect calls got lost from suspend & resume hooks, when the commit were
split and pushed upstream.  I confirm that adding the calls back fixes
the hangup.

---8<--------------------

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 8a9b31fd5c89..72329a7eac4d 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -2374,6 +2374,9 @@ static void udc_suspend(struct ci_hdrc *ci)
         */
        if (hw_read(ci, OP_ENDPTLISTADDR, ~0) == 0)
                hw_write(ci, OP_ENDPTLISTADDR, ~0, ~0);
+
+       if (ci->driver && ci->vbus_active && (ci->gadget.state != USB_STATE_SUSPENDED))
+               usb_gadget_disconnect(&ci->gadget);
 }
 
 static void udc_resume(struct ci_hdrc *ci, bool power_lost)
@@ -2384,6 +2387,9 @@ static void udc_resume(struct ci_hdrc *ci, bool power_lost)
                                        OTGSC_BSVIS | OTGSC_BSVIE);
                if (ci->vbus_active)
                        usb_gadget_vbus_disconnect(&ci->gadget);
+       } else {
+               if (ci->driver && ci->vbus_active)
+                       usb_gadget_connect(&ci->gadget);
        }
 
        /* Restore value 0 if it was set for power lost check */

---->8------------------

But it's unclear to me why the hangup happens and how the change above
fix the problem.  Do you guys have any insight here?

Shawn

[1] https://github.com/reMarkable/linux-imx/commit/0791d25578cb0e46fd93ae7a3c36ff7a424f3547

