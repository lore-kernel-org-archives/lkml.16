Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994B3189902
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 19:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743967607; cv=none; b=RH2e++gClRnOnnFeeem38dQhP+RwPHBg9z6ZsWdQSIBY/PbJ/R05XvshaDqR8qn9ruL1mf3WdZYaCdUI5pqgDJx9mDIkEzcPyDIr4awfqGPdPWHmB3KeY83lmK8ruCmcTXUI97TKS5pKnERG1WwF0lYQihDwxHx2E4gKFpqeR2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743967607; c=relaxed/simple;
	bh=YbQeCXABe7GUX5Hk7yFrjWyJ+kjHrPL0nT+lJY7Me+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZiYI18AmZZzHkwyGl63Ywpmi9+g1FLcHIkmEeyTqcmLpTRO9chLzq+cWjPcDtiZ6CffUW/quoDGWmyV0iXX4zcAbDqOr0jZJubOVOJ2yQg2ISI5mu8PVSrqJeKu6BvYvHZ0XlbsAwx81DIIHsquilra+sgHbO/4geb/XI1IqNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=mGeKQbWe; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="mGeKQbWe"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2cc44c72959so2251412fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 12:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743967604; x=1744572404; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YK5Vr662rgDOcTY+Gjv54ux4MVSaTIQnU4+FMlkXxiQ=;
        b=mGeKQbWefCehcIVaGG/nxKiHr3BZCG+1otoVepFKrDX2px5UjjMtzSguCZXYUOPnMW
         xhTlJ47C72O6U99Czxl/KIOivvsyLZprg4V6NmpVhWzae02G/nQoKAMTmDXqtD5KrppB
         cQZ6l4jkOp4p4RPlt9u0uxX6M1qkUMafr/AZ1XAB1HcguK5S/ieFWKmIT19mZ+TwOye1
         COM12wxkJWeMLPcSeufsAOjEm3P64nWf7SPVtDH2DmjmQj/j11OH2BpwbiolNelwU3is
         M6VHq5vNi//btwRPLT4GBrRhKVbqINK6Cnic+93ocQjnpSch9cYNaMYxAf+/aFgspqiB
         PfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743967604; x=1744572404;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YK5Vr662rgDOcTY+Gjv54ux4MVSaTIQnU4+FMlkXxiQ=;
        b=Sp/z1j6hM9P4DYG2jVdT4WYc7tLEgdhDPksz5HB4sBgXhx5qwrNnM/rdhTc5FDfaRO
         tNGbYqFwUgkIVH742UilFNMKPTm9uCZkOvRpQafvm9v415skuYh6iZRa1uYUCwK97JPT
         Yp6WkmqqhxPcda8htjy+Q9i4OBkVvHmaAd3EBFKPIPXh/nCosk74U+n80VIcQygO5VXj
         Sw5/Od5JtCi+zypElFnvW/cDPNV3WKHgkEdV7wTSbwdFfK6WXZB1NykUmxV/yO7pesuc
         4Yxcq7VDtmwA/xMiT0pGXqs8RZp8QhOC536nkEaxUH4CKjg7ECV+9e6IoZZoXKQicqDW
         TA6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJ7MZdJyaQr3Ri93ixvk3M5rVSWyo725bjtUCec4arrIJ8vx1p5U3+1+w7N6oQsutHXy/5p/+QFe3bYmY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx77Ian3dv5oC9Gq+EwwtiFVrQk8C7CN44vSuJGwUqv5BRhBu0a
	TM+AsR7zSRCplfGUm9dwOuBzJfOtdcGltu4OW1TBSXQxla+V58zkj+fdpAz2bg==
X-Gm-Gg: ASbGncu0wgYvYthpHUIpmW5G3Mr+CnTA5q/3QWusdiUOp19leoPjlc8M2WptNKrqYuq
	Q/4Cnx0PwC8bSCMjumWD9voHHClpAQuzd8+BJVZdejiXoSy7uSD9s+h1XeGafw2sx6llXyE230U
	VviJ3J84Q9JBdUib5u2p34Xi94+K/N6/IpNe2WXXEaI9gG75VUTnPqVVnU3w9iI9KS151yI8t+l
	KWFSXX8EUYLRsZ4EneEvxfo9VfTK8IUzJ1R7wkJuF+rPD8mz/qbWw12CxvwZ9ekNYpytCkIziFI
	hRxN4HmvjquvmA9CRwDTMC77+tONgSyTbIM1Ay/FkL2OQg+BtOQ2zE84ibUVutfQHUiZE9A=
X-Google-Smtp-Source: AGHT+IFzuK2AqQtGgS7/yPIn+pgUwHjTKw597RE44DJQ5rgusKCj6lFlHEh4sMOLE5HRIaky7l4Brg==
X-Received: by 2002:a05:6808:350b:b0:3fe:f41d:463a with SMTP id 5614622812f47-4004659728cmr5462436b6e.10.1743967604562;
        Sun, 06 Apr 2025 12:26:44 -0700 (PDT)
Received: from rowland.harvard.edu ([12.111.7.147])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4004009977bsm1458494b6e.49.2025.04.06.12.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 12:26:43 -0700 (PDT)
Date: Sun, 6 Apr 2025 15:26:41 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: xhci: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep
 state.
Message-ID: <14197657-0a0f-45a8-ac36-dd37b16a1565@rowland.harvard.edu>
References: <c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de>
 <b356f743-44b5-4f48-a289-fae0afe106ff@linux.intel.com>
 <84b400f8-2943-44e0-8803-f3aac3b670af@molgen.mpg.de>
 <20250406002311.2a76fc64@foxbook>
 <ade0d77a-651a-4b03-bf21-00369fdc22f8@rowland.harvard.edu>
 <20250406095008.0dbfd586@foxbook>
 <20250406175032.12b7d284@foxbook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250406175032.12b7d284@foxbook>

On Sun, Apr 06, 2025 at 05:50:32PM +0200, Michał Pecio wrote:
> On Sun, 6 Apr 2025 09:50:08 +0200, Michał Pecio wrote:
> > What I found suspicious is that there is also endpoint_disable() and
> > I'm not sure where it comes from. Looking at core code, it seems to
> > often be followed by endpoint_reset(), but the log doesn't show that.
> 
> There might be something to it. I went through my collection of card
> readers and found a reproducible case where endpoint_reset() is called
> with NULL host_ep->hcpriv and it bails out without even an xhci_dbg().
> 
> Reloading ums-realtek with the reader already connected and no card:
> 
> [ 6kwi 17:30] usbcore: deregistering interface driver ums-realtek
> [  +0,679251] ums-realtek 14-1:1.0: USB Mass Storage device detected
> [  +0,161730] scsi host9: usb-storage 14-1:1.0
> [  +0,000193] usbcore: registered new interface driver ums-realtek
> [  +1,018198] scsi 9:0:0:0: Direct-Access     Generic- Multi-Card       1.00 PQ: 0 ANSI: 0 CCS
> [  +0,000241] sd 9:0:0:0: Attached scsi generic sg1 type 0
> [  +0,001182] sd 9:0:0:0: [sdb] Media removed, stopped polling
> [  +0,000517] sd 9:0:0:0: [sdb] Attached SCSI removable disk
> [  +0,000952] usb 14-1: XXX ep 4 is now EP_STALLED
> [  +0,000907] xhci_hcd 0000:0a:00.0: xhci_endpoint_reset ep 4 udev 0000000000000000 slot_id -1 vdev ffffffffffffffff
> [  +0,000030] usb 14-1: XXX URB ffff88811af85f00 queued before clearing halt
> [ +30,400178] xhci_hcd 0000:0a:00.0: xhci_endpoint_reset ep 0 udev 0000000000000000 slot_id -1 vdev ffffffffffffffff
> [  +0,112403] usb 14-1: reset high-speed USB device number 3 using xhci_hcd
> [  +0,124145] xhci_hcd 0000:0a:00.0: xhci_endpoint_reset ep 0 udev 0000000000000000 slot_id -1 vdev ffffffffffffffff
> [  +0,027202] usb 14-1: XXX ep 4 still EP_STALLED on init, clearing
> [  +0,000995] xhci_hcd 0000:0a:00.0: xhci_endpoint_reset ep 1 udev 0000000000000000 slot_id -1 vdev ffffffffffffffff
> [  +0,000013] xhci_hcd 0000:0a:00.0: xhci_endpoint_reset ep 4 udev 0000000000000000 slot_id -1 vdev ffffffffffffffff
> 
> Not sure what's happening, but at least it shows that EP_STALLED can
> still be set when the endpoint is re-enabled and my patch clears it.

I'd guess that you're seeing the result of the

		usb_disable_interface(udev, intf, true);

call in usb_reset_and_verify_device().  This call is made following the 
actual reset, as part of the procedure for putting everything back to the 
way it was before the reset.

Alan Stern
