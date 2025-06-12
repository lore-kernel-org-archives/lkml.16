Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EFE79D2
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 16:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749745964; cv=none; b=SgvH1bkpya3dawrKy+vOlfSJ0Z1aV/IHoxFunCt49adi7aZ2g3B5XmvC4RX5KGRMyFBBMwNGPVHVeXcj8GisUCdloSpgNIoKx5/jdfE9M3ARvi6Y8/kehahPrXLoo64WeJ5TyCckDj7rz9v5F0A9sB5XLJp9cGvjwfTJaKy+0EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749745964; c=relaxed/simple;
	bh=E/zwntV3g9QqimWxjTkDAUIvQGfrD8fXKrijn0w2HHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=niyzHmVzcjxJ7ujKwnvCi1xT59xFGQqCVvFOQxyfWg9hC9eA7oqWGIlTRXWGBuYAwXjYZoKXlOeqPWuJUuIpNUN/dAELMaq8lpTWkZ6+EqsbBktNiT/9S+s4xE9lAEBmA2FEufvq4RT9JCIhFe4CmIpDyieDn3svchKxfVTcTNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=BUsZ8v3q; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="BUsZ8v3q"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f0ad744811so10142906d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1749745962; x=1750350762; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fkeJvvdmsVwijabIeMHoTRZQ2efXfNOq8ZkrZ12WLLw=;
        b=BUsZ8v3qGUY31x9n/PYcqC2eD3J0wbTXaX6aHebcoAn4kkUyJgUwSKc65jV/ttbMWE
         w/cHt8h34+5i7w86sfIzENvsxqwtK74ihdjW6OQycNr6rsR9nSemREb2J7rf2mxMieL8
         it+W5OeDEIyCVQu+i6m0Dbqq96taNyoFQWNbbHkfcsDAUynBWK5n32Y8vO28whTqv8Eh
         FptH1r67wQ+iGDVzR1sY9VO3Z1NljBvbNkH1IvNFJ9brBPj3CGYJfHrbWn7Hbbjfz7xx
         8TB1NFXOTKOHgVTuSZtua9m5Gb4HpS/LkMXQKo6RASW2zTWN4bSBSzjImiBXPl0BKyXU
         gj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749745962; x=1750350762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkeJvvdmsVwijabIeMHoTRZQ2efXfNOq8ZkrZ12WLLw=;
        b=Oz+hkuiCk4nCIwMGZDpIIMUFsiE+SgWcKx34DlMxdRrlBb0cJ5njnVbjGz+Ow5fvJV
         WsZ6Usz7fEWXuXqYgjEz5VxYNemobwrHbM5Aq3CSNs3VCSgBKxb+3wbR5TGKDOFIhI3q
         BFxYczY8X7eDHzgU/pNDxIESluM9nVhNV0LGlF/oqg2qcVUAcxY/x0UZ/ikuCHEfnE5Z
         WXGD0tkKSEift0gj7ZBDcqC24MpE+8Y4mWyvA3u2bNbKF8s2PKfCNVZDoAx0st/XS8Wa
         3HWmsEEVm5eEhQv7yK/62cCpJrbnjjM57kwswcYmDfg/D8S/bMVJJj2qI70C2xhVfNzF
         ZEkA==
X-Forwarded-Encrypted: i=1; AJvYcCVVPeBcrF82v4oBLS53R9UHR3T3Bt7fFx7wO9I31R/E4At978MO8hq7b1Ue4ICOrJgyBc7/ysXgfcapAew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy5iQev5HqSHCDlw47wY8K8hlqQzwBPSj8tWroda46z8bAWSbX
	KfLVvW3QNQOXufWjM4s1hFStGp5ghwKhwrOtTylT/WKtnPnMnAgkLszZ8mPZmJif/w==
X-Gm-Gg: ASbGncsuiXKHPFz0CqanaVRkXWuwtltGdD/Mk0q44XZw73VJY9x8JfCSJS8qciPd/Xp
	e0aCn5zmFhcvgMMWI+JsY3HIERgCY+knr33AAbeAyPVo9oc/Co0fKiqBwGGVnYlqIWpPHA6CX7r
	TSVQg0lK4AZ4Vhu0yKzaB+i+lIsLB+xOJMf4DKTAeHyQ/pf9KaBXs7xTX35s+kRBtEuqqNtDkO5
	GZBmbwD24cHAWD3J7yYJvKdbYn8ZSWQcNPIKxrz2bQRl3kM9mzZv0Bvw4xfwadlJeV393g3seun
	xsZUEkF8hRxiSNbbuNyETPzWKs8SysG5p1i0qz9EB3j/gbeG94D6HFPco34Uu8cEy/aJEEP1KZq
	i4W9h1pz0HZePcSIbP6A7ApNgIDpndHwQtePmuEQ025ClmmG+j4gb8M+o9Wf5BGGgMg==
X-Google-Smtp-Source: AGHT+IFC9KA/n/atHkM073sYRCJBPxFjJEGbEOsc2M3UC84+uSQh0I6MJSO3LgA8GA/2X4nXpy0OXg==
X-Received: by 2002:a05:6214:d61:b0:6fa:fbb4:6404 with SMTP id 6a1803df08f44-6fb3d22ea01mr5217326d6.5.1749745961307;
        Thu, 12 Jun 2025 09:32:41 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-28.harvard-secure.wrls.harvard.edu. [65.112.8.28])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c31604sm11819416d6.75.2025.06.12.09.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 09:32:40 -0700 (PDT)
Date: Thu, 12 Jun 2025 12:32:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mihai.Sain@microchip.com
Cc: gregkh@linuxfoundation.org, Nicolas.Ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ohci-at91: Use dynamic device name for OHCI HCD
 creation
Message-ID: <6a3cf972-3c2d-429b-9504-5fd449334348@rowland.harvard.edu>
References: <20250611075414.4239-2-mihai.sain@microchip.com>
 <afaf4c79-ccec-46ad-889c-e8347454c065@rowland.harvard.edu>
 <PH3PPF37F43E35DF7E5350AEBBB079073748274A@PH3PPF37F43E35D.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH3PPF37F43E35DF7E5350AEBBB079073748274A@PH3PPF37F43E35D.namprd11.prod.outlook.com>

On Thu, Jun 12, 2025 at 10:33:09AM +0000, Mihai.Sain@microchip.com wrote:
> Hi Alan,
> 
> I'm sorry, I'm replying using Outlook web.
> 
> On Wed, Jun 11, 2025 at 10:54:15AM +0300, Mihai Sain wrote:
> > Use the dynamic device name instead of the hardcoded string "at91"
> > when creating the OHCI host controller driver.
> > This ensures that the device name is more flexible
> > and correctly reflects the actual device in the system.
> > This will be in sync with ehci at91 driver.
> >
> > [root@sam9x75eb ~]$ dmesg | grep usb
> > [    1.464487] usb usb1: Manufacturer: Linux 6.16.0-rc1 ehci_hcd
> > [    1.470210] usb usb1: SerialNumber: 700000.usb-ehci
> > [    1.595683] usb usb2: Manufacturer: Linux 6.16.0-rc1 ohci_hcd
> > [    1.601406] usb usb2: SerialNumber: 600000.usb-ohci
> >
> > [root@sam9x75eb ~]$ cat /proc/iomem | grep usb
> > 00600000-006fffff : 600000.usb-ohci usb-ohci@600000
> > 00700000-007fffff : 700000.usb-ehci usb-ehci@700000
> 
> Are these two outputs supposed to make some sort of point?  It would be
> better to have a before-and-after comparison, so we can see what the
> effect of the patch is.
> 
> Before this patch the SerialNumber print from ohci driver, was looking like this:
> 
> [    1.601406] usb usb2: SerialNumber: at91
> 
> I thought it was a good ideea to align this print with the one from ehci drive
Okay, good.  Yes, that is worth doing.

Please include this information in the patch description and resubmit.

Alan Stern
