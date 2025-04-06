Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D89A204F94;
	Sun,  6 Apr 2025 15:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743954641; cv=none; b=A4UQ0g67Hsfc/P7p49T79pAOgh6EKcLXkIRvnIHmPZQkCNieNTmOONp6U7jPfc/HRTT0+hq9eXplj+uu5zGJSONaBCa5Yx97n5EqSHLhtYozjbLmA/H5UYSteEbWp1x6cp2OSV8eqGyKaoM684ahoBJ3JaI/xOhnDGYi8Vx7+II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743954641; c=relaxed/simple;
	bh=lzt/4sq1dXICenCGLO058+2TS/DAy3Abeenbaebq4m4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=De3E2m2+PLWayvowGTxScEwB0P/FbxM4gDS+nQu/kxO5x96xIH7ytbLfEGHKrHhT2dTb58Qe3EULBANJs2ofiiyTQG9RbDMCFWzkYRmgFBLpw6XiMB9GHasShfzQ8HjIfvv+lachJQ1ObdjQIEpzhu5Qm2+5HkxUhklcv0eTZ/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+wr0kxS; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+wr0kxS"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5497590ffbbso3764281e87.1;
        Sun, 06 Apr 2025 08:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743954637; x=1744559437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fs7kgq9+UaUoLPx0T+ZzGgXSbXniqbBBrS678SO+hCs=;
        b=c+wr0kxSytSoPy3HXsHr7SW7AIpKOZwZzNGbY8ciHJszlebTYkVl0Bn8+HKat2tWy3
         XF2VfYr7nJ9JjjR0q51V02WA6ieu+9ffGnMrDXUK0hVCGNPS54Qlv02BnqAB+9WD15Tl
         HptDyjueFkTPLYa820kNmdjCSJLKXqyefvK/+2Av+KTr1bBWPzDsIugJJiLJhkGDE0Jk
         N6nHyhH3ptwzOPn79euHEpKAq8WiNHVlRZ0SAnOXFNxxcDcCgrFslRzo92/+0dbDYlyX
         r/VgDuK6FOmO2+M6Rv2Cbs4qZU99ftUkXVrHyoMqbbkSeddhGhe8ioiMHPUpcRYDI/vp
         kJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743954637; x=1744559437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fs7kgq9+UaUoLPx0T+ZzGgXSbXniqbBBrS678SO+hCs=;
        b=rGabkx9o7gPrcMSk1RV13W7SHOPlXpN8QnB5GcKviyl/EvGcfTR4ckD0Q4GXfFAHSo
         pVBm1e18VfY1cXvy8C+TbEsXSu2rjLrLM3kT7vQL3RzIQOJN6av/vQ2rMmKMsPDb/Fjl
         m9Mo1Hwb98K1buH4h3YvVSaEFqr7z0oD48lHHhsw9II7F2Cam9rAkbbi43sS3Mwju3qG
         TCqbLbVtrnvTX8q6yNbgt6D4ByrrrTpmua3vtkCH8nPuQJk7sqxgIBPqc1P0ddGrZZCU
         j3CKw2Ev1HmWeBve4OJg1G0GMFE2kKJnG/HOc3docGN3gf6iuGqNpC8BGqCkVTmPGfPh
         GEZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrDQBZYIS6tMKYLvxXnk4FaP+9QtdwWXIdMXtD0UcfzncHc6UXn12cy9Xifw/EcGoLdIpE6taS7KRv@vger.kernel.org, AJvYcCX2N9bmdC8190J/8YKvdwtmA/zyfKPbOz0xlkrHaYI6anup7NxcsVa4z3SjOlW2rlV4JgWwMqL+yEow8c4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2aNBAkI2FyhAKfAGtcLMGUNHkPknTqfhJ9e9mIQ6n5N15iUKN
	XKYPtXZBsAV7CBfCzTCp6VEOFTZJde5brlrMunlIUzY2N2UenJCS
X-Gm-Gg: ASbGncsVF8wAyg06qrFfSHIX+w0AoH9aE9mCr1iD68BvvKEL4fOEUQcnapwsJwU8i7t
	fHf/1pRKRwgGOUqCjuKiszHfKSW8IaXj6QGRSLQLzVVWFOYzwzja0yn9f+DSj8vqnMxP+8QOUlo
	L2wcW8MWc/38n7Gf5VSTFEgYpYr1X+AuIjiX+/ysa+VTGQTapt+M0Q+aa/ls1o+3tpX/f0+ubJk
	HEJogjQt24JZbGAiWvRsBNUSBDHnhlJqnZaY9IbdKKrLsKEN3HByb8zqAlVLAOb0JcGmWgBi3Jz
	EPWunkIv5ox27fZjiuzng4SPhCUfWFM+yeiDenwS6423icste2w+43ii/3uhDbDC2Dvdfr5e
X-Google-Smtp-Source: AGHT+IFq5q3z17eiMRjkVhifm4l6CD7ZbK4dAK7y5jngRM0r6eJh1YW5LDdaV09kQekSNpOrEwGiDQ==
X-Received: by 2002:a05:6512:3b06:b0:54a:d68f:6ecc with SMTP id 2adb3069b0e04-54c232c4976mr1719190e87.2.1743954636704;
        Sun, 06 Apr 2025 08:50:36 -0700 (PDT)
Received: from foxbook (adtu135.neoplus.adsl.tpnet.pl. [79.185.232.135])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5c07a2sm1010486e87.57.2025.04.06.08.50.35
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 06 Apr 2025 08:50:36 -0700 (PDT)
Date: Sun, 6 Apr 2025 17:50:32 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>, Paul Menzel
 <pmenzel@molgen.mpg.de>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: xhci: WARN Set TR Deq Ptr cmd failed due to incorrect slot or
 ep state.
Message-ID: <20250406175032.12b7d284@foxbook>
In-Reply-To: <20250406095008.0dbfd586@foxbook>
References: <c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de>
	<b356f743-44b5-4f48-a289-fae0afe106ff@linux.intel.com>
	<84b400f8-2943-44e0-8803-f3aac3b670af@molgen.mpg.de>
	<20250406002311.2a76fc64@foxbook>
	<ade0d77a-651a-4b03-bf21-00369fdc22f8@rowland.harvard.edu>
	<20250406095008.0dbfd586@foxbook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 6 Apr 2025 09:50:08 +0200, Micha=C5=82 Pecio wrote:
> What I found suspicious is that there is also endpoint_disable() and
> I'm not sure where it comes from. Looking at core code, it seems to
> often be followed by endpoint_reset(), but the log doesn't show that.

There might be something to it. I went through my collection of card
readers and found a reproducible case where endpoint_reset() is called
with NULL host_ep->hcpriv and it bails out without even an xhci_dbg().

Reloading ums-realtek with the reader already connected and no card:

[ 6kwi 17:30] usbcore: deregistering interface driver ums-realtek
[  +0,679251] ums-realtek 14-1:1.0: USB Mass Storage device detected
[  +0,161730] scsi host9: usb-storage 14-1:1.0
[  +0,000193] usbcore: registered new interface driver ums-realtek
[  +1,018198] scsi 9:0:0:0: Direct-Access     Generic- Multi-Card       1.0=
0 PQ: 0 ANSI: 0 CCS
[  +0,000241] sd 9:0:0:0: Attached scsi generic sg1 type 0
[  +0,001182] sd 9:0:0:0: [sdb] Media removed, stopped polling
[  +0,000517] sd 9:0:0:0: [sdb] Attached SCSI removable disk
[  +0,000952] usb 14-1: XXX ep 4 is now EP_STALLED
[  +0,000907] xhci_hcd 0000:0a:00.0: xhci_endpoint_reset ep 4 udev 00000000=
00000000 slot_id -1 vdev ffffffffffffffff
[  +0,000030] usb 14-1: XXX URB ffff88811af85f00 queued before clearing halt
[ +30,400178] xhci_hcd 0000:0a:00.0: xhci_endpoint_reset ep 0 udev 00000000=
00000000 slot_id -1 vdev ffffffffffffffff
[  +0,112403] usb 14-1: reset high-speed USB device number 3 using xhci_hcd
[  +0,124145] xhci_hcd 0000:0a:00.0: xhci_endpoint_reset ep 0 udev 00000000=
00000000 slot_id -1 vdev ffffffffffffffff
[  +0,027202] usb 14-1: XXX ep 4 still EP_STALLED on init, clearing
[  +0,000995] xhci_hcd 0000:0a:00.0: xhci_endpoint_reset ep 1 udev 00000000=
00000000 slot_id -1 vdev ffffffffffffffff
[  +0,000013] xhci_hcd 0000:0a:00.0: xhci_endpoint_reset ep 4 udev 00000000=
00000000 slot_id -1 vdev ffffffffffffffff

Not sure what's happening, but at least it shows that EP_STALLED can
still be set when the endpoint is re-enabled and my patch clears it.

This bug only came out now because besides clearing this new EP_STALLED
flag, xhci_endpoint_reset() is practically a no-op in most cases.

v2 debug patch below for anyone interested.

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 3f918fea7aea..0ebf7980780f 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1463,6 +1463,10 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
 	if (!virt_dev->eps[ep_index].new_ring)
 		return -ENOMEM;
=20
+	if (virt_dev->eps[ep_index].ep_state & EP_STALLED)
+		dev_err(&udev->dev, "XXX ep %d still EP_STALLED on init, clearing\n", ep=
_index);
+	virt_dev->eps[ep_index].ep_state &=3D ~EP_STALLED;
+
 	virt_dev->eps[ep_index].skip =3D false;
 	ep_ring =3D virt_dev->eps[ep_index].new_ring;
=20
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 0c5c0769db74..308b30763dc6 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2544,6 +2544,7 @@ static void process_bulk_intr_td(struct xhci_hcd *xhc=
i, struct xhci_virt_ep *ep,
 	struct xhci_slot_ctx *slot_ctx;
 	u32 trb_comp_code;
 	u32 remaining, requested, ep_trb_len;
+	u32 ep_index =3D TRB_TO_EP_ID(le32_to_cpu(event->flags)) - 1;
=20
 	slot_ctx =3D xhci_get_slot_ctx(xhci, ep->vdev->out_ctx);
 	trb_comp_code =3D GET_COMP_CODE(le32_to_cpu(event->transfer_len));
@@ -2584,6 +2585,7 @@ static void process_bulk_intr_td(struct xhci_hcd *xhc=
i, struct xhci_virt_ep *ep,
 		xhci_handle_halted_endpoint(xhci, ep, td, EP_SOFT_RESET);
 		return;
 	case COMP_STALL_ERROR:
+		dev_err(&td->urb->dev->dev, "XXX ep %d is now EP_STALLED\n", ep_index);
 		ep->ep_state |=3D EP_STALLED;
 		break;
 	default:
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 83a4adf57bae..adb6efce5d31 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1606,9 +1606,11 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, str=
uct urb *urb, gfp_t mem_flag
 	}
=20
 	/* Class driver might not be aware ep halted due to async URB giveback */
-	if (*ep_state & EP_STALLED)
-		dev_dbg(&urb->dev->dev, "URB %p queued before clearing halt\n",
+	if (*ep_state & EP_STALLED) {
+		dev_err(&urb->dev->dev, "XXX URB %p queued before clearing halt\n",
 			urb);
+		//dump_stack();
+	}
=20
 	switch (usb_endpoint_type(&urb->ep->desc)) {
=20
@@ -1772,6 +1774,11 @@ static int xhci_urb_dequeue(struct usb_hcd *hcd, str=
uct urb *urb, int status)
=20
 	/* In these cases no commands are pending but the endpoint is stopped */
 	if (ep->ep_state & (EP_CLEARING_TT | EP_STALLED)) {
+		struct xhci_ep_ctx *ep_ctx =3D xhci_get_ep_ctx(xhci, vdev->out_ctx, ep_i=
ndex);
+		int ctx_state =3D GET_EP_CTX_STATE(ep_ctx);
+		if (ctx_state !=3D EP_STATE_STOPPED)
+			dev_err(&urb->dev->dev, "XXX WTF ep_state %d ctx_state %d\n", ep->ep_st=
ate, ctx_state);
+
 		/* and cancelled TDs can be given back right away */
 		xhci_dbg(xhci, "Invalidating TDs instantly on slot %d ep %d in state 0x%=
x\n",
 				urb->dev->slot_id, ep_index, ep->ep_state);
@@ -3177,6 +3184,11 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
=20
 	xhci =3D hcd_to_xhci(hcd);
 	ep_index =3D xhci_get_endpoint_index(&host_ep->desc);
+	udev =3D (struct usb_device *) host_ep->hcpriv;
+
+	xhci_info(xhci, "%s ep %d udev %px slot_id %d vdev %px\n", __func__, ep_i=
ndex, udev,
+			udev ? udev->slot_id : -1,
+			udev ? xhci->devs[udev->slot_id] : (void*)~0L);
=20
 	/*
 	 * Usb core assumes a max packet value for ep0 on FS devices until the
@@ -3201,7 +3213,6 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
=20
 	if (!host_ep->hcpriv)
 		return;
-	udev =3D (struct usb_device *) host_ep->hcpriv;
 	vdev =3D xhci->devs[udev->slot_id];
=20
 	if (!udev->slot_id || !vdev)
@@ -3211,6 +3222,8 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
=20
 	spin_lock_irqsave(&xhci->lock, flags);
=20
+	if (ep->ep_state & EP_STALLED)
+		dev_err(&udev->dev, "XXX ep %d no longer EP_STALLED\n", ep_index);
 	ep->ep_state &=3D ~EP_STALLED;
=20
 	/* Bail out if toggle is already being cleared by a endpoint reset */
