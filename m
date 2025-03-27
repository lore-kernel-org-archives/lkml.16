Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4057B217673
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743084795; cv=none; b=Ddbjorw9ZE4vkyNnUTGGiY0n+0A7UaoQx9IEvn/24PhP6wVtwo4zueaAULZk2o+C6mEK4kly1jidADKKjwOld2rphU3NmteIYAkMKXQ+ULGIA4YKxWc6K+PxGteP5kYhlxL/SAdfMGMLc6kYnBKrnqgjFBWuqnKwVHwT6+dADYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743084795; c=relaxed/simple;
	bh=pV5/syCA5fBvtlnUDTP4Viuzn5QJd9O/C8y0VGyIafo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dg2t3Q9vwhRIHTZWxHzocF2kLJfa3tzzWgDF/YdZVwVBJH/UU53NPrYN5M2ThxozKc/6kMRnqoN1PAPlollWvVdqehh1dvYly7aShV5hp1n9yPOF40Fod201HeG4n7RN5htySeC2fZA3iScytB31oq2ZEDbsX0UseWvlrgjGjpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=AWMhMaax; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="AWMhMaax"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c0e135e953so119273185a.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 07:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743084791; x=1743689591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0znUA5ytfnQNvKB7ZGRjnFezjykFr7P6h5TA5X7hXVk=;
        b=AWMhMaaxufJ1bciMie0MwTIsc2006DOJQ6OmD/6XcWhgyHItILd4LP8aSxhuI/B/MV
         qnZa/ICfbqDTdm6S6bUzpyyP8CWVy09bRC3x8MwDFU3v8ENa34o33Rv3vJIFcPXc/gx0
         pPNwQ+G6SJMonRsC70FqeiFqeHPgwdY4oI/SsewhSMblc6Tep73ez18KBs9S8UNY1SQ7
         bUDTmlAPyNhe8xKkyfgSHIz19q72owUOIoBZpu1mmVfepfaOHCpG7hblNBHsJU2Tryys
         JOJCkmIB4PwstK88E67oCtuOfbY+3ygk4+F/HsAkZUdYawGgYfTGs8n3Sk/VF933nV3j
         1viQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743084791; x=1743689591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0znUA5ytfnQNvKB7ZGRjnFezjykFr7P6h5TA5X7hXVk=;
        b=jUTyo+GW3a0LVaP1+9egpqEBxcUR1jUN9/Qe58mHhHVvraYShebJPf6/PaOoJONc/+
         gRGZSp+2haOYgDW8jC5IDG5U8JA3AjyDLqa6LbmS6e6VSctkE6+yzkqucMk5spS2YPqn
         geRRAkIywVTGAYjfC+yrL4YGCfifYCBuVbV5dZOyA0FUPeY4l1f10B6+imAuRHY2cVDj
         m0Frd54JOL8qT+jUgIYotBl4PFvBuniqFRWksXZzFWCsayaCERxBU0J8UZ1SloMw3H5f
         m5d+zjgBhuLjbsEOMwd8gR0t2Wwl2Fiqw5KgZZ+Pvn1fWDKnrEU5TWP9yyaxvYa4s+0/
         pmhw==
X-Forwarded-Encrypted: i=1; AJvYcCU+CkfR0fMJFH4+AtJAW2C9dX8kJDNXnUv5JOjM1pEnMBEwDOs3EPOSgzx3Dhp+bMyr7ZejwgrRRqu+egg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKGMweL5Hs9yVV6AtUsv5vYxh/1uL1bn0Ml2BwwiyImk16OeGJ
	qGt4PAEBSDHVkdh3kBuR51ZJbFCCeiWCaiGgvxcqA/b1pfqJECvY5oR9WRHgrw==
X-Gm-Gg: ASbGncvKmd1SDbbPjp93XtIUizgMxE8QDVJ46Hupdv0IKYqlA8nc7aWNziUqn9wkM8z
	0DOBBlRtWIZKn7EsQ3JoBDyEXsY6jJZVz9FiVk27LT+3ZUSRsCbkYaXjdm4MW7DLjezsyrrAcu5
	zubA/CRVu5+4X9Rx4qtKidzeb9fbdg/5mgS5w55nlNwJbthOw0+n7XpLa0TdVb+vhBN4tihnxP1
	Mt7OUHNy3In9EBuGVWojm96UTHiW44z9OP5MYfTRrW776ij8QHUDgqyGfl0nwaf9wlVDN7EKtVY
	VrmSZrO69zuoY85kiJ8YJbXy0DkuZonJ8mrnYjEMk8Y52qpUZvz8/Iv8S5p50SQU49c9JPAKxw=
	=
X-Google-Smtp-Source: AGHT+IE2SBIHjHAYNsZGyQDUcKNFrgHSGj/BZ68tmr1ayCQI4h3zXjcJLQD3CNZrmBSAW0mD66CY/A==
X-Received: by 2002:a05:620a:40c6:b0:7c5:5768:40ac with SMTP id af79cd13be357-7c5eda0e738mr563024585a.30.1743084790825;
        Thu, 27 Mar 2025 07:13:10 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5b92ea919sm902764385a.51.2025.03.27.07.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:13:10 -0700 (PDT)
Date: Thu, 27 Mar 2025 10:13:07 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	Mingcong Bai <baimingcong@loongson.cn>
Subject: Re: [PATCH V2] USB: OHCI: Add quirk for LS7A OHCI controller (rev
 0x02)
Message-ID: <208f5310-5932-402b-9980-0225e67f2d66@rowland.harvard.edu>
References: <20250327044840.3179796-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327044840.3179796-1-chenhuacai@loongson.cn>

On Thu, Mar 27, 2025 at 12:48:40PM +0800, Huacai Chen wrote:
> The OHCI controller (rev 0x02) under LS7A PCI host has a hardware flaw.
> MMIO register with offset 0x60/0x64 is treated as legacy PS2-compatible
> keyboard/mouse interface, which confuse the OHCI controller. Since OHCI
> only use a 4KB BAR resource indeed, the LS7A OHCI controller's 32KB BAR
> is wrapped around (the second 4KB BAR space is the same as the first 4KB
> internally). So we can add an 4KB offset (0x1000) to the OHCI registers
> (from the PCI BAR resource) as a quirk.
> 
> Cc: stable@vger.kernel.org
> Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
> Tested-by: Mingcong Bai <baimingcong@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
> V2: add a comment explaining why the quirk is needed and how it fixes.
> 
>  drivers/usb/host/ohci-pci.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/usb/host/ohci-pci.c b/drivers/usb/host/ohci-pci.c
> index 900ea0d368e0..bd90b2fed51b 100644
> --- a/drivers/usb/host/ohci-pci.c
> +++ b/drivers/usb/host/ohci-pci.c
> @@ -165,6 +165,24 @@ static int ohci_quirk_amd700(struct usb_hcd *hcd)
>  	return 0;
>  }
>  
> +static int ohci_quirk_loongson(struct usb_hcd *hcd)
> +{
> +	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
> +
> +	/*
> +	 * Loongson's LS7A OHCI controller (rev 0x02) has a
> +	 * flaw. MMIO register with offset 0x60/64 is treated
> +	 * as legacy PS2-compatible keyboard/mouse interface.
> +	 * Since OHCI only use 4KB BAR resource, LS7A OHCI's
> +	 * 32KB BAR is wrapped around (the 2nd 4KB BAR space
> +	 * is the same as the 1st 4KB internally). So add 4KB
> +	 * offset (0x1000) to the OHCI registers as a quirk.
> +	 */
> +	hcd->regs += (pdev->revision == 0x2) ? 0x1000 : 0x0;

I'm sorry, I should have mentioned this previously but I only noticed it 
now.  This would be a lot easier for people to read if you wrote it as a 
simple "if" statement:

	if (pdev->revision == 0x02)
		hcd->regs += 0x1000;

Otherwise the patch looks fine.  If you make this change, you can 
resubmit it with:

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

> +
> +	return 0;
> +}
> +
>  static int ohci_quirk_qemu(struct usb_hcd *hcd)
>  {
>  	struct ohci_hcd *ohci = hcd_to_ohci(hcd);
> @@ -224,6 +242,10 @@ static const struct pci_device_id ohci_pci_quirks[] = {
>  		PCI_DEVICE(PCI_VENDOR_ID_ATI, 0x4399),
>  		.driver_data = (unsigned long)ohci_quirk_amd700,
>  	},
> +	{
> +		PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, 0x7a24),
> +		.driver_data = (unsigned long)ohci_quirk_loongson,
> +	},
>  	{
>  		.vendor		= PCI_VENDOR_ID_APPLE,
>  		.device		= 0x003f,
