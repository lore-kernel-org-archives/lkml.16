Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BF027F750;
	Tue, 15 Apr 2025 09:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744708213; cv=none; b=d9TyFCcSUi5PeJeYPa6WoAhrfGc46FaFD29uhY1ufeyY5qT8iFckgdLVK/7tCUDRngAACRV0FzEjTOx0whwO6m54gU0jkTULTa6LbMRVZDyP9ruiaBJi/8i9nJx04glbAWpyNqykiRW8AceVIWLJ+UQ9sLsaalGLrqGP777/6UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744708213; c=relaxed/simple;
	bh=khgj5i5EcfhZPpRQahIsUsU7sYQlGJ+uMgPiisqwNko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hlaUwWjYIJo+tKo6GqbqCJ7ubp5u/ZlV3DY6nO+oaDj0xkgst2+LgTp6xVEoLX9iyIvJ8HzELuIeSqUJFjkdOzRBronjr4WmNmiTmfFZ44kaHtseu/iIZVp54UPMwRCwpKguzSG4+NxiB2to3JqBE21F0NStP/qf0v6Jnwst4YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H00daDs/; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H00daDs/"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so5552485e87.1;
        Tue, 15 Apr 2025 02:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744708208; x=1745313008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UPsV5iinGiENslETqIUd2l9BsNLKvHs4wRNGXo8GaNM=;
        b=H00daDs/BUi+9pYQZ1gZZOk9X2B4CBT+0X8sW/M4z1n1PHynyWIwM33jQ4ENOrv2JZ
         tp3wyuP0v6hbr0qb8qvMbyHwhG99ppEcbAYXrrgybNqLd8DBcrvOGqF+lOCfmXrPcLbi
         apNWzMappG6JCnKE/ljuSle77BCa3GqstCScmxnHA1JOh8XiXOLdwaEMgMiwSdHusR81
         LJUbOo7sUIMQqjdFaeWY45iKxqFmQiaTnUblJJAyenzGuGPUPO6n81AdbyEn23j3wqFL
         FcmTZIkc3FXxnRHUdDtUsTO4L1YRvl1BUI24osVfYa5ZKzAJKblpXW8rtTD9ij5/HDrx
         PN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744708208; x=1745313008;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPsV5iinGiENslETqIUd2l9BsNLKvHs4wRNGXo8GaNM=;
        b=u/V9m6Bfg70ShN/g8wG/lkSb2PUe4u2ysXMFJX6kKv1lbmuldcoXqIiNZ9gW4QO4LG
         DG1BCyw2BHn4K14IWz/1fpO40hrzwVDx0YEYM87FZqOh2Qp44JMb7XHZQbF+XcHmqTy2
         NPwCSewKaFxKz9Ib/2PwXjSQFSr59iuDMaMQrTzplyeMdmPPz//NRe487md9DXG6xSNx
         jQQhN6SA83ZrRrENfNdklxN/0JKSAytM60LgQr6Hjre0rU7tljGsHyfHvT3TSAO5hp/r
         CfqfoqEOaaWZTOZdHl1XtsHb0h/UiFU3zQGtScThf2cKeaNq9OuxXlP5St39QPE2bwbN
         XgUw==
X-Forwarded-Encrypted: i=1; AJvYcCVICQ5ZfUXuqDAdXLih7xWYX9YgJUeYuz0x3w/OJV97IvXT1DWM/r9xrRyP5za1Jch90O+0cxRrFHVILp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoweXRvPUZR1a+YNx4j2+A9tqo+oxEZ6eX6f0YPTaONh9b2SuZ
	yUSyrpTOeqpH3VUhvUcU+OYZxz7VuB66aHhf9Ox94nAuZDy5xUMsarvu7w==
X-Gm-Gg: ASbGnctJ4E0ULa1468I6er5KXhfkM686XDnJf4sFF6ubMpT44UPS7/nJbicRy8V997M
	xqK6b7DqD5zFc6KTmkC5JsRyKyQR4MrOPeBZbPn2UjkeqtrW0bJrWFhAxSgA9j0zVQEVq7uAMRc
	qUzUiPQT26hQPbNgee1ICM38aa+raiIGlLhCPpg2DSddpP/CkNlGMOCNT3Lpuu85Z07qmhZDpdZ
	vamlOCx6LmKYzqWLkntiNBwf5jYcE2GvCeycNvA43W5QraX0J2o6tlLog/vsFbGgCAQHDDjRN59
	ZjLy4we2QHroY7XjkA01dMm/pOS6u2Ldpv0P06aDnnO0KlwbzrhY38um+A==
X-Google-Smtp-Source: AGHT+IFs8TCoOr2T+cgD0P6BNaEygCftccZNyGN7iCP4JPdPyGb/jCtCN211Iv1XLe/QJ4iyHmietg==
X-Received: by 2002:a05:6512:158f:b0:545:22ec:8b6c with SMTP id 2adb3069b0e04-54d452cc1d3mr4412312e87.35.1744708208111;
        Tue, 15 Apr 2025 02:10:08 -0700 (PDT)
Received: from foxbook (adtk197.neoplus.adsl.tpnet.pl. [79.185.222.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d502549sm1391530e87.148.2025.04.15.02.10.06
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 15 Apr 2025 02:10:07 -0700 (PDT)
Date: Tue, 15 Apr 2025 11:10:03 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman
 <mathias.nyman@intel.com>, Minas Harutyunyan <hminas@synopsys.com>, Linus
 Walleij <linus.walleij@linaro.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: hcd: Add a usb_device argument to
 hc_driver.endpoint_reset()
Message-ID: <20250415111003.064e0ab8@foxbook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

xHCI needs usb_device here, so it stored it in host_endpoint.hcpriv,
which proved problematic due to some unexpected call sequences from
USB core, and generally made the code more complex than it has to be.

Make USB core supply it directly and simplify xhci_endpoint_reset().
Use the xhci_check_args() helper for preventing resets of emulated
root hub endpoints and for argument validation.

Update other drivers which also define such callback to accept the
new argument and ignore it, as it seems to be of no use for them.

This fixes a 6.15-rc1 regression reported by Paul, which I was able
to reproduce, where xhci_hcd doesn't handle endpoint_reset() after
endpoint_disable() not followed by add_endpoint(). If a configured
device is reset, stalling endpoints start to get stuck permanently.

Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
Closes: https://lore.kernel.org/linux-usb/c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de/
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

New in v2:
Updated more HCDs after a kernel test robot build failure report.
This time I searched the whole tree and no more HCDs should be left.

 drivers/usb/core/hcd.c            |  2 +-
 drivers/usb/dwc2/hcd.c            |  1 +
 drivers/usb/fotg210/fotg210-hcd.c |  2 +-
 drivers/usb/host/ehci-hcd.c       |  3 ++-
 drivers/usb/host/xhci.c           | 27 ++++++++-------------------
 include/linux/usb/hcd.h           |  2 +-
 6 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index a63c793bac21..d2433807a397 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1986,7 +1986,7 @@ void usb_hcd_reset_endpoint(struct usb_device *udev,
 	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
 
 	if (hcd->driver->endpoint_reset)
-		hcd->driver->endpoint_reset(hcd, ep);
+		hcd->driver->endpoint_reset(hcd, udev, ep);
 	else {
 		int epnum = usb_endpoint_num(&ep->desc);
 		int is_out = usb_endpoint_dir_out(&ep->desc);
diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 60ef8092259a..914a35c34db3 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -4861,6 +4861,7 @@ static void _dwc2_hcd_endpoint_disable(struct usb_hcd *hcd,
  * routine.
  */
 static void _dwc2_hcd_endpoint_reset(struct usb_hcd *hcd,
+				     struct usb_device *udev,
 				     struct usb_host_endpoint *ep)
 {
 	struct dwc2_hsotg *hsotg = dwc2_hcd_to_hsotg(hcd);
diff --git a/drivers/usb/fotg210/fotg210-hcd.c b/drivers/usb/fotg210/fotg210-hcd.c
index 64c4965a160f..7163fce145fe 100644
--- a/drivers/usb/fotg210/fotg210-hcd.c
+++ b/drivers/usb/fotg210/fotg210-hcd.c
@@ -5426,7 +5426,7 @@ static void fotg210_endpoint_disable(struct usb_hcd *hcd,
 	spin_unlock_irqrestore(&fotg210->lock, flags);
 }
 
-static void fotg210_endpoint_reset(struct usb_hcd *hcd,
+static void fotg210_endpoint_reset(struct usb_hcd *hcd, struct usb_device *dev,
 		struct usb_host_endpoint *ep)
 {
 	struct fotg210_hcd *fotg210 = hcd_to_fotg210(hcd);
diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index 6d1d190c914d..813cdedb14ab 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -1044,7 +1044,8 @@ ehci_endpoint_disable (struct usb_hcd *hcd, struct usb_host_endpoint *ep)
 }
 
 static void
-ehci_endpoint_reset(struct usb_hcd *hcd, struct usb_host_endpoint *ep)
+ehci_endpoint_reset(struct usb_hcd *hcd, struct usb_device *udev,
+		    struct usb_host_endpoint *ep)
 {
 	struct ehci_hcd		*ehci = hcd_to_ehci(hcd);
 	struct ehci_qh		*qh;
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 52d1693f4c2e..f67cd7c6422b 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -3161,11 +3161,10 @@ static void xhci_endpoint_disable(struct usb_hcd *hcd,
  * resume. A new vdev will be allocated later by xhci_discover_or_reset_device()
  */
 
-static void xhci_endpoint_reset(struct usb_hcd *hcd,
+static void xhci_endpoint_reset(struct usb_hcd *hcd, struct usb_device *udev,
 		struct usb_host_endpoint *host_ep)
 {
 	struct xhci_hcd *xhci;
-	struct usb_device *udev;
 	struct xhci_virt_device *vdev;
 	struct xhci_virt_ep *ep;
 	struct xhci_input_control_ctx *ctrl_ctx;
@@ -3175,7 +3174,12 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
 	u32 ep_flag;
 	int err;
 
+	err = xhci_check_args(hcd, udev, host_ep, 1, true, __func__);
+	if (err <= 0)
+		return;
+
 	xhci = hcd_to_xhci(hcd);
+	vdev = xhci->devs[udev->slot_id];
 	ep_index = xhci_get_endpoint_index(&host_ep->desc);
 
 	/*
@@ -3185,28 +3189,13 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
 	 */
 	if (usb_endpoint_xfer_control(&host_ep->desc) && ep_index == 0) {
 
-		udev = container_of(host_ep, struct usb_device, ep0);
-		if (udev->speed != USB_SPEED_FULL || !udev->slot_id)
-			return;
-
-		vdev = xhci->devs[udev->slot_id];
-		if (!vdev || vdev->udev != udev)
-			return;
-
-		xhci_check_ep0_maxpacket(xhci, vdev);
+		if (udev->speed == USB_SPEED_FULL)
+			xhci_check_ep0_maxpacket(xhci, vdev);
 
 		/* Nothing else should be done here for ep0 during ep reset */
 		return;
 	}
 
-	if (!host_ep->hcpriv)
-		return;
-	udev = (struct usb_device *) host_ep->hcpriv;
-	vdev = xhci->devs[udev->slot_id];
-
-	if (!udev->slot_id || !vdev)
-		return;
-
 	ep = &vdev->eps[ep_index];
 
 	spin_lock_irqsave(&xhci->lock, flags);
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index ac95e7c89df5..179c85337eff 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -304,7 +304,7 @@ struct hc_driver {
 
 	/* (optional) reset any endpoint state such as sequence number
 	   and current window */
-	void	(*endpoint_reset)(struct usb_hcd *hcd,
+	void	(*endpoint_reset)(struct usb_hcd *hcd, struct usb_device *udev,
 			struct usb_host_endpoint *ep);
 
 	/* root hub support */
-- 
2.48.1
