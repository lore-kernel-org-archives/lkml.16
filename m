Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D8E1CF284
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 15:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738336719; cv=none; b=NC0zZXbY0v00UEBgTklSAqrI8hqNpvVdcKdHjuXcJEPgIb3bPCqfxdxrQqtxVHlDWZuVppi8U1pqZdhoSzY0F2Fi4C12cuyGbH9yuBtUREnc1eDP/OxxV2IwUdkaZdcYPqV5ycNpNRfTVlBNbNfR99iNerCE3Bzwv7vMbxImYIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738336719; c=relaxed/simple;
	bh=Yh5e9pbZP2iUSKUl6lXSpqBSTfy6QZ+CAV1PK4bL86w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZzugICn46ufXoDn1uZJePhvWcsLEZFZPDNmeQqwA4UNYMC7qqAx3Ow5UDR1agOWocssH7wlgUGUZdkZLBM0Enac2dkxwyi7oLadUjHSjkb8Rt+UbC9inilMecgDDnxxh72d0gNf1I+LSUqTHew7i4KflsnF45+F05S70xMQKso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ZGXNxBYD; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ZGXNxBYD"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d92e457230so18607036d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1738336716; x=1738941516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HmcAvYq6Plh35o86lvrX1/5xKi/MyFR+UUUELwg5ZtQ=;
        b=ZGXNxBYD5FVqegfYExCp5yMZ1Ytdg8CWzNicdlQMO7rlkl5ikF3XHpbRNFSDtf/UQ2
         iF3z4IiFCHYed9NsjDdOHFMRknhdJX56+AH4lmQHVoKedwgaQcKDD37ixRVtYLLa9k9o
         A3I3PTiisvK6dxIdGj8tEChDr3FAEjNagLajq11MmPRQqSNg75eZlNhoEK2sfR/Zodtw
         Xd8itCQRw1l4TdwPvqnSUtuap3foo6P70Asv6cv788spHg6Ca1ykuo8OTDwEKxQ+wlRx
         lmJNYo4QXfML0h/JDF82r8+rPuggQsN3AOjAq5IlAFHQdqifya9vaLO8bHNtrbuiOjYi
         YHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738336716; x=1738941516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmcAvYq6Plh35o86lvrX1/5xKi/MyFR+UUUELwg5ZtQ=;
        b=IgjPrcZTGMKjPYxqx5c6f7ZM9Enl/ZtK3Hd0AKSLDC2UrAw4/YueYtQuQssXcm84FH
         iJVR93jgnhcMmidf2BlQ0h5NFKF2RiyTYyDo4xxJdoqpRIjgGEZxu+vcuI9TI7CZotV8
         7wQc1RrqaRivOu/dlOebLl0zhUaKtRGBWL/V7XVRbXvsOQehUpwuHxo4/YRRFtmf1o+c
         Z7wXJgUO/9shNZqLUjuFwj9dXzVDhaT84uWIB/+0rYdzW4hS0l9K6SfsT98x6Ad+3eut
         2kWiAnY+OSYVSiCOfb5uFeXSKVTLIBlNsLGhdX0AAGw2lIDFI4dtZx+XFQSP949U+RGq
         SvPg==
X-Forwarded-Encrypted: i=1; AJvYcCWxYiULlm3qaaYH5IgyPUw9TdVHpm0ou0mi2/sxPSeqelgmxdoWynIAkYgaATQ6nPWWhOToDyKRPKEfXos=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbUUafsG8KLLFeU7T32FR0WX+d0oio+VRuDFWnOillnD7ONd4L
	ZOOx3+EzNSgASNdLdSkIAE/4qIMPsuabETJsGcacOrZetuXyCvhDYOluqw0tWg==
X-Gm-Gg: ASbGncsTKW6q/8mNaMWY5lPnIsw9jv4lpifhkW+Z8NT4bV6jPl467N8wBGCO6/En+44
	fGYOir6CmCW84SLaodrr6sXYR+GpYizB+bQNFenyLI/mGhO7WsoDaL+NhnYeJVC+2BNA7V2VbUF
	2YdUO3qpu6RnKw0OFI2wbU3e8DVSGLGNCUzV3w8F08a1fjqrFSFpZefiZ581g/XudAykF+YnxjG
	61YmpxWgeWOWTOsFlacmq8fflZ4IEMcgvFR9qX2AjG33fq7EWyY6P3eR/reSsoSW0PJd2aUca2t
	E37DCXT8ECJX5pJUX/Mlao5cLZEvexIFP28xr9bkoS5bijaLQ5XMTcCfz7/ZYlQziTbSYlM4sWC
	OspC7ada/
X-Google-Smtp-Source: AGHT+IG8wug4eUsfhl7wm5KfInzfu9XEQSA/gmnsobwKMmAHW07VMT0SCDK4Yklh8p3e2g3kXNnO6A==
X-Received: by 2002:a05:6214:3112:b0:6da:dc79:a3cd with SMTP id 6a1803df08f44-6e243a7f135mr158297156d6.0.1738336716566;
        Fri, 31 Jan 2025 07:18:36 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-51.harvard-secure.wrls.harvard.edu. [65.112.8.51])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2547f3e17sm19028426d6.22.2025.01.31.07.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 07:18:36 -0800 (PST)
Date: Fri, 31 Jan 2025 10:18:34 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Baoqi Zhang <zhangbaoqi@loongson.cn>
Subject: Re: [PATCH] USB: pci-quirks: Fix HCCPARAMS register error for LS7A
 EHCI
Message-ID: <b6a18bab-b412-443a-b39a-2194596ec79d@rowland.harvard.edu>
References: <20250131100651.343015-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131100651.343015-1-chenhuacai@loongson.cn>

On Fri, Jan 31, 2025 at 06:06:51PM +0800, Huacai Chen wrote:
> LS7A EHCI controller doesn't have extended capabilities, so the EECP
> (EHCI Extended Capabilities Pointer) field of HCCPARAMS register should
> be 0x0, but it reads as 0xa0 now. This is a hardware flaw and will be
> fixed in future, now just clear the EECP field to avoid error messages
> on boot:
> 
> ......
> [    0.581675] pci 0000:00:04.1: EHCI: unrecognized capability ff
> [    0.581699] pci 0000:00:04.1: EHCI: unrecognized capability ff
> [    0.581716] pci 0000:00:04.1: EHCI: unrecognized capability ff
> [    0.581851] pci 0000:00:04.1: EHCI: unrecognized capability ff
> ......
> [    0.581916] pci 0000:00:05.1: EHCI: unrecognized capability ff
> [    0.581951] pci 0000:00:05.1: EHCI: unrecognized capability ff
> [    0.582704] pci 0000:00:05.1: EHCI: unrecognized capability ff
> [    0.582799] pci 0000:00:05.1: EHCI: unrecognized capability ff
> ......
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Baoqi Zhang <zhangbaoqi@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  drivers/usb/host/pci-quirks.c | 4 ++++
>  include/linux/pci_ids.h       | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
> index 1f9c1b1435d8..7e3151400a5e 100644
> --- a/drivers/usb/host/pci-quirks.c
> +++ b/drivers/usb/host/pci-quirks.c
> @@ -958,6 +958,10 @@ static void quirk_usb_disable_ehci(struct pci_dev *pdev)
>  	 * booting from USB disk or using a usb keyboard
>  	 */
>  	hcc_params = readl(base + EHCI_HCC_PARAMS);
> +	if (pdev->vendor == PCI_VENDOR_ID_LOONGSON &&
> +	    pdev->device == PCI_DEVICE_ID_LOONGSON_EHCI)
> +		hcc_params &= ~(0xffL << 8);

Can you please add a comment before this "if" statement explaining why 
it is necessary?

Alan Stern

> +
>  	offset = (hcc_params >> 8) & 0xff;
>  	while (offset && --count) {
>  		pci_read_config_dword(pdev, offset, &cap);
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index de5deb1a0118..74a84834d9eb 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -162,6 +162,7 @@
>  
>  #define PCI_VENDOR_ID_LOONGSON		0x0014
>  
> +#define PCI_DEVICE_ID_LOONGSON_EHCI     0x7a14
>  #define PCI_DEVICE_ID_LOONGSON_HDA      0x7a07
>  #define PCI_DEVICE_ID_LOONGSON_HDMI     0x7a37
>  
> -- 
> 2.47.1
> 
