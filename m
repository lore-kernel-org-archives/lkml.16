Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DC725569;
	Sun,  6 Apr 2025 07:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743925820; cv=none; b=SZv2odkQoTqymArikYXE8fbmI/IwV8kDFq9D7FNrgz33vB7kaIn7B8uN3Dr2HeLF6DNS3sf9KTCHNzWALNQjTkxVFWZb8rxqc06Stpg8boEmYiGXsrAd4prFpHl/DQTGWGBcWoMaEI8cFMLU0qXQ9V9M1DPv73tw+hBScWoFg6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743925820; c=relaxed/simple;
	bh=YuWb+JJseXfeVOlQj6/RHtFCIiOnpfmZvrraTlFxYTE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cGblHLG8VYfS/GiCdQA0pL+idGTwN8L5vSIr01a4c83C4qNJ90iNqzxe8e1jpbBaP3UgrbuypFtKzDyVAx5ZaBIzV/mUn+veF2G0ZdrYvbHZTPeCVgOClb6G+gn8EvycKxucOaSsanmVGatRWMQbs3veB7Iw31CfUR9OwjZIcug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1sNO+UE; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1sNO+UE"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54acc04516fso3146867e87.0;
        Sun, 06 Apr 2025 00:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743925816; x=1744530616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2yb41SeKxEij52fRXyoCS91CRWEBqWXRokIpLY5et+4=;
        b=J1sNO+UEGMMT9TqdhQKNt4cwjab/T8zSqq6dnFq4jXVyKgRoPvzQ2c8Yp/X1sZeIrV
         wMZRnlB8kIzOIMjFtl/vlVf3tlaj0+I/QlY5XpzfefPpVSDm9pi6vJLsLfQAj8oUflDO
         1qXI3iOjlixqwPQYJSkbLr0SJZ2KTL/2lr4fBkL3fezzEmus1XGecBlfd6bspZORz4k7
         8jj5UU1evdaGZvYqg0FTdejNGbpufQPbGOcn3mp+i37RvTKxr61DPdNWZODW1IWvjhWh
         tFnkoP0r21h7gvlBAq4zXo3o4FWHZM8Wz6l+4Pf2fRSDKHX59va9vTMNG3tDn3+JWGec
         KSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743925816; x=1744530616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2yb41SeKxEij52fRXyoCS91CRWEBqWXRokIpLY5et+4=;
        b=KQv6u7RQNQI+K5r6usYAAEmHX+RZQSc1Rcc6y16BA8Hh1rUCRfxJleL+ONIZHhyl7u
         g+VB5f+U02Mo9sRvcz3kMFWccvEqwwu/T5B35nuagoLPNxeSdfX0mM/kOam178qUILh/
         mRRNf3Jdq4BbVexEeegDmN5ECCnH1xMEd56FzR1zVcozI4iqkm7NxUb6Cy3Perr5QYmr
         5odbuTgOFiwvpnIJFSl9IGu+wMyO22fReCNY3bWhYFiFHT5ITBcI/ZPupLtf6YMqmzlG
         nJX0RUnXRgaa4iwS+agJLnjSphuI1Rn732uv79Kffw0m4+JY8UBi4H00dcGCyCurcVxq
         Hecg==
X-Forwarded-Encrypted: i=1; AJvYcCU+OSTKwfJjmkfK4lK3GWZcO/Kgdplsta4TLxqsXQjST+SWeid2fz5uzcKYSWinzAAh9A4zYhiVI00cMaE=@vger.kernel.org, AJvYcCVnDOWoJr3G5X0d/GPmyTOoKjDYQpqlL9xJt8Z8AJSrE08SRJcWDkUlhtGffoogyH8Y84SUF2W0rjFq@vger.kernel.org
X-Gm-Message-State: AOJu0YyUB0h2LjRzWiC2+hNqNt5o1U+df0vq8s73fSvP6o8/UrwZxgwV
	LbTw5IXypWzmZ+s/sUN1w4Rx6jB3c8XQT4+0/TXMmwMO1Yxs+PHA
X-Gm-Gg: ASbGncs0llzDFrCWpRZJGbJrYvFOoXZiD6h5aBt+OlfJqXCJBT96gFOb+MRAS+XIAmc
	ZaqEPoKSuP/WKWx/RVUjtXvSDrnF9MlzsVBnI9fod8T9jFp7myHYUqzTHT4vDvSkJQjHN6udqNR
	6HEy0Z56ffWnG3O3AEYNgXaVwNNpFIOu/jk09EZaAyX+a2fia1luD9G6n1yKWgfJ2oRjOVssqTU
	jELok2G3GZXb3y/445NEnrvCJRpTWdblRRbrFLh9Vo/+R1LG8UCN2czMIhmT5AvnfFEqJ12+M7O
	Yw5Xa2nIuwOZoGDTRalVf7xXCkDtiTQcNsiF6kHYvjx7rx+oQRQwLtrYt9eGPQ==
X-Google-Smtp-Source: AGHT+IFwD1Iq+fZ8fPiiuIGTM+2v9admkMO3uSR4E6CBjyQchJnqFjaAwbRiQjdgGLamHWr0FETz5Q==
X-Received: by 2002:a05:6512:138f:b0:549:8b94:9b93 with SMTP id 2adb3069b0e04-54c2335c534mr2592488e87.49.1743925815524;
        Sun, 06 Apr 2025 00:50:15 -0700 (PDT)
Received: from foxbook (adtt225.neoplus.adsl.tpnet.pl. [79.185.231.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5c1a88sm898645e87.69.2025.04.06.00.50.12
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 06 Apr 2025 00:50:13 -0700 (PDT)
Date: Sun, 6 Apr 2025 09:50:08 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Mathias Nyman
 <mathias.nyman@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: xhci: WARN Set TR Deq Ptr cmd failed due to incorrect slot or
 ep state.
Message-ID: <20250406095008.0dbfd586@foxbook>
In-Reply-To: <ade0d77a-651a-4b03-bf21-00369fdc22f8@rowland.harvard.edu>
References: <c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de>
	<b356f743-44b5-4f48-a289-fae0afe106ff@linux.intel.com>
	<84b400f8-2943-44e0-8803-f3aac3b670af@molgen.mpg.de>
	<20250406002311.2a76fc64@foxbook>
	<ade0d77a-651a-4b03-bf21-00369fdc22f8@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Thanks, Alan.

On Sat, 5 Apr 2025 22:40:51 -0400, Alan Stern wrote:
> The core believes that resetting a device should erase the endpoint 
> information in the HCD.  There is a callback in hub_port_reset() to
> that effect:
> 
> 		if (hcd->driver->reset_device)
> 			hcd->driver->reset_device(hcd, udev);

Makes sense, reset_device() does indeed nuke everything besides EP0.
When the endpoints are re-added later, their will get blank state.

> So after this the EP should not be in the Running-Idle state; in fact
> it should not exist at all (unless it is ep0, but in this case I
> think it isn't).

The log shows that reset_device() is followed by a few drop_endpoint()
and add_endpoint(), so the endpoint gets enabled again before new URBs
are submitted, no problem here.

What I found suspicious is that there is also endpoint_disable() and
I'm not sure where it comes from. Looking at core code, it seems to
often be followed by endpoint_reset(), but the log doesn't show that.

> Is the implementation of the reset_device callback in xhci-hcd
> missing something?

I guess we could clear EP_STALLED when an endpoint is being re-enabled.
This would cover reset_device() and also drop_endpoint().


Paul, could you apply this patch and report back if it fixes the
warnings and reset loops and which XXX messages are printed?
BTW, if those "is now EP_STALLED" and "no longer EP_STALLED" cause
too much noise, you can remove them, they are not very important.

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 3f918fea7aea..0ebf7980780f 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1463,6 +1463,10 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 	if (!virt_dev->eps[ep_index].new_ring)
 		return -ENOMEM;
 
+	if (virt_dev->eps[ep_index].ep_state & EP_STALLED)
+		dev_err(&udev->dev, "XXX ep %d still EP_STALLED on init, clearing\n", ep_index);
+	virt_dev->eps[ep_index].ep_state &= ~EP_STALLED;
+
 	virt_dev->eps[ep_index].skip = false;
 	ep_ring = virt_dev->eps[ep_index].new_ring;
 
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index e0816d2f6b75..b674f6b4be3c 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2541,6 +2541,7 @@ static void process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	struct xhci_slot_ctx *slot_ctx;
 	u32 trb_comp_code;
 	u32 remaining, requested, ep_trb_len;
+	u32 ep_index = TRB_TO_EP_ID(le32_to_cpu(event->flags)) - 1;
 
 	slot_ctx = xhci_get_slot_ctx(xhci, ep->vdev->out_ctx);
 	trb_comp_code = GET_COMP_CODE(le32_to_cpu(event->transfer_len));
@@ -2581,6 +2582,7 @@ static void process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		xhci_handle_halted_endpoint(xhci, ep, td, EP_SOFT_RESET);
 		return;
 	case COMP_STALL_ERROR:
+		dev_err(&td->urb->dev->dev, "XXX ep %d is now EP_STALLED\n", ep_index);
 		ep->ep_state |= EP_STALLED;
 		break;
 	default:
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 83a4adf57bae..9066e1b26ceb 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1607,7 +1607,7 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 
 	/* Class driver might not be aware ep halted due to async URB giveback */
 	if (*ep_state & EP_STALLED)
-		dev_dbg(&urb->dev->dev, "URB %p queued before clearing halt\n",
+		dev_err(&urb->dev->dev, "XXX URB %p queued before clearing halt\n",
 			urb);
 
 	switch (usb_endpoint_type(&urb->ep->desc)) {
@@ -1772,6 +1772,11 @@ static int xhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 
 	/* In these cases no commands are pending but the endpoint is stopped */
 	if (ep->ep_state & (EP_CLEARING_TT | EP_STALLED)) {
+		struct xhci_ep_ctx *ep_ctx = xhci_get_ep_ctx(xhci, vdev->out_ctx, ep_index);
+		int ctx_state = GET_EP_CTX_STATE(ep_ctx);
+		if (ctx_state != EP_STATE_STOPPED)
+			dev_err(&urb->dev->dev, "XXX WTF ep_state %d ctx_state %d\n", ep->ep_state, ctx_state);
+
 		/* and cancelled TDs can be given back right away */
 		xhci_dbg(xhci, "Invalidating TDs instantly on slot %d ep %d in state 0x%x\n",
 				urb->dev->slot_id, ep_index, ep->ep_state);
@@ -3211,6 +3216,8 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
 
 	spin_lock_irqsave(&xhci->lock, flags);
 
+	if (ep->ep_state & EP_STALLED)
+		dev_err(&udev->dev, "XXX ep %d no longer EP_STALLED\n", ep_index);
 	ep->ep_state &= ~EP_STALLED;
 
 	/* Bail out if toggle is already being cleared by a endpoint reset */
