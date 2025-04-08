Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DE020459F;
	Tue,  8 Apr 2025 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107506; cv=none; b=hTJGPskkdr2j4YHuO47zNqewAICMylomr+1z+qIhOAaz/j+GNjefGRevIFde6VEhkZ/h9GsQzzZa7m5I3gf4LaZ/p2QOuz3X9PV2mnInzaXkSebgigDGLQnrdf5o/xzHg63DU94T/JYKILSYJysIhh4wBup7nrC/R8l99uxpx+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107506; c=relaxed/simple;
	bh=d8JQ+MyNMKTBF2IizxU/b6I/RWItXomgcUIW0s0VUKU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=btmOqF4aUHIF6vsefuliI06Afi5VwG7yKZF+75ZC4Ufjcjaf3t9m7BAdj8JbC0qDCvHU+w4swS2QkWLdJ/ALPnHzzcmVPYWYP7AmzY2kWRD9Img/0Nc+djzcXgs0BJb0zUVxLDYAIGqJBTfbOUBrf1eYMgvcVLFiQPoY/py6Pps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hvj3SFXQ; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hvj3SFXQ"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54b0d638e86so6502483e87.1;
        Tue, 08 Apr 2025 03:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744107503; x=1744712303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBkkvpBAwxMLDl3JDRufEPMKoNS7FiCw8zDnhwNt4xY=;
        b=Hvj3SFXQdplfaZiCsb292KpDlDU5un5GcQINhj1K0FX1cpsnQOtV/3EwKed3vTYEYv
         9GWQ5w62wIYB3DkYeadmSjycwphTEsafBsp45JqY9+cI4K7ReNZ/peN2KlSLpPAa2iAv
         gHu/gb+y09yjNjMAFuM66sV0SXx6ppQrXbT/x8IIdi8PGv4/e294PnurkwKn4GO5CkYu
         22Z2W1Ci0XW8anCXnZ2QxSydEZCt3CdRZOIj5eMpn3UMI41a6/uogcgnmJQFAhM32IlH
         Vxy1brjULCm1X5WElbT4mf2UriOhO6dvJ9MPy41p489adBbXgTKyq3pHcRCuRt4tgdQv
         9h5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744107503; x=1744712303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBkkvpBAwxMLDl3JDRufEPMKoNS7FiCw8zDnhwNt4xY=;
        b=a1ytr2E4ylHlK3QrELkUZK4GQ24WqXetu+aTT/3OE+/nXQztE0HVJcd8Fu425RNEuW
         ZicsuEzsuCn3SSpy9JDC+b47u5YDjwF3iXxH0zBmP4Kk7We5BHSyr9UrNVur7xn3mRIN
         L6o/Mbux/ZYmfx79v4zWUr0mzTmlsh1AA0G8gUZuo9Yxg2OGuTf4bMAAz6VESrS7edK7
         xO0CEY6whLM95SzE4W8sh5bWwMlvwWrS5ER2DKhTBlhca0ReHircoJWYTZRmuYdBz7PN
         MgDe9M61eMCuePmCZvnoFG26OLdlKxpRT2dKcX4IRaJ54zLmvZBSPL9HzmlbHhMOpZZV
         hPtw==
X-Forwarded-Encrypted: i=1; AJvYcCU85qHV+eNmeRTqIniiSnu05p2RVfFmygnhDtKxqrci2nJpdwjZnVE4VCbMp4aVOWEKPtc9GaxqHDxy@vger.kernel.org, AJvYcCUXBqYMjaVm24wte2lZjOMWvXsjUfjNv5Of1z3tBYQo6tg+e+sK0spaXl/r1qg8O0dXW4flMz5c7D7Q8/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlOnbN5zTriD5FOhzWaPIhjLlu0+mlNtv5P67KpZU3CFtM7Bus
	pKssxLYXey1shTInIque+Z3NmsQd8kMdV9Go83BuOrrO6Q96nAxa
X-Gm-Gg: ASbGnct2P3ljdwd+1e0E/GoQhwDn1Ky1cSWYGjWqFaJRSqqhihP4g2R7aNHt7a/08Va
	L+VIH2SE2qaM/kd81f6+XXqBfqqR25mPTNBQdIpAhBv1AqRW81wCDNvqk92tayNzOQz5DrnfvPr
	RXvSxqCeK7rBNHPjO86IvH4EFiziIUe3WDw3qI5tshKEW7Y38d/cbwMpUYu7zyvmMEx5sSb2tUh
	qEZHDyDyA0ypPwatLuWJNkSxwDAPLRMZyQ5PCUusl3HkDL7dwwA4bT1GMxXFqVfuzke9KxNhg6p
	ZUKmJEFDBKdPi3VAztH0IbjXIH2aL70bXU2TvO0AgkLXnKtc0uamClrYxThU6AGonsS9K37r
X-Google-Smtp-Source: AGHT+IE33f1qbai7AfYia4ni2e8TuOOEK5WgNlxelgpVl5tugeQ44eLgh1uzbezRxcSqsbh50XLuIQ==
X-Received: by 2002:a05:6512:1281:b0:549:39ca:13fc with SMTP id 2adb3069b0e04-54c227ff6ddmr4769141e87.49.1744107502358;
        Tue, 08 Apr 2025 03:18:22 -0700 (PDT)
Received: from foxbook (adtq195.neoplus.adsl.tpnet.pl. [79.185.228.195])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e67244fsm1463149e87.247.2025.04.08.03.18.21
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 08 Apr 2025 03:18:21 -0700 (PDT)
Date: Tue, 8 Apr 2025 12:18:17 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Mathias Nyman
 <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>
Subject: [PATCH RFC RFT] usb: hcd: Add a usb_device argument to
 hc_driver.endpoint_reset()
Message-ID: <20250408121817.6ae8defd@foxbook>
In-Reply-To: <3efb52b8-0974-4125-a344-00f459fbe4e4@rowland.harvard.edu>
References: <c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de>
	<b356f743-44b5-4f48-a289-fae0afe106ff@linux.intel.com>
	<84b400f8-2943-44e0-8803-f3aac3b670af@molgen.mpg.de>
	<20250406002311.2a76fc64@foxbook>
	<ade0d77a-651a-4b03-bf21-00369fdc22f8@rowland.harvard.edu>
	<20250406095008.0dbfd586@foxbook>
	<20250406175032.12b7d284@foxbook>
	<14197657-0a0f-45a8-ac36-dd37b16a1565@rowland.harvard.edu>
	<20250407074905.2d236fb9@foxbook>
	<3efb52b8-0974-4125-a344-00f459fbe4e4@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

xHCI needs usb_device in this callback so it employed some hacks that
proved unreliable in the long term and made the code a little tricky.

Make USB core supply it directly and simplify xhci_endpoint_reset().
Use xhci_check_args() to prevent resetting emulated endpoints of root
hubs and to deduplicate argument validation and improve debuggability.

Update ehci_endpoint_reset(), which is the only other such callback,
to accept (and ignore) the new argument.

This fixes the root cause of a 6.15-rc1 regression reported by Paul,
which I was able to reproduce locally. It also solves the general
problem of xhci_endpoint_reset() becoming a no-op after device reset
or changing configuration or altsetting. Although nobody complained
because halted endpoints are reset automatically by xhci_hcd, it was
a bug - sometimes class drivers want to reset not halted endpoints.

Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
Closes: https://lore.kernel.org/linux-usb/c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de/
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

Is such change acceptable to interested parties?

It solves the problem completely for me, because as Alan said,
core calls endpoint_reset() after installing a new config or alt
to notify HCDs that ignore reset_device(), and also those which
implement it incompletely, I guess ;)

Unlike clearing EP_STALLED on reset_device() or drop_endpoint(),
this also fixes cases when another STALL happens after device
reset and the device is not reset again. For example, I see that
when I insert a card after the original problem happens.

At this point I can insert or remove the card, plug or unplug
the reader and reload ums-realtek in any order, it all works.

Paul, could you check if this patch works on your hardware too?

 drivers/usb/core/hcd.c      |  2 +-
 drivers/usb/host/ehci-hcd.c |  3 ++-
 drivers/usb/host/xhci.c     | 27 ++++++++-------------------
 include/linux/usb/hcd.h     |  2 +-
 4 files changed, 12 insertions(+), 22 deletions(-)

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
index 0452b8d65832..5bf89ba7e2b8 100644
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
