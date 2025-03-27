Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BFF19D07E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093451; cv=none; b=jf/Agy6F4CspZIv2TVFqMr463/o7AVtfWvYdw6dnjxwiSSK5k4kIKXsG7zGDrMsIB/2rXEakDUt4sE2WXvsJSQa7HioZEd5CmT3edfbME11PiAvk0k/dF6rg6lI4kp8SQwKL6USx1xWD82dx+m+8jyyoq78uEBOnpC8NWBd/px4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093451; c=relaxed/simple;
	bh=N50bPlGWPyT6mLT/ZA0G1nQxtC9ZkZ93yQnPSrhFLRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nm2WCW0yA4tpQFjEGe8E8Kqk9cC4YX+Umc+tffnf5ClPLALQSXaYA78WhSOzBOxUZZZtLEJ44khnq9oRySApYJ98WCbkUduQ519qqHS+3B/IwSg8lcuU+XPzfpigmgkDOPO8oYUOacVl+2UeEVslM2oZq6e+pUhUMJ0oQOD9RzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FOF8FFjV; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FOF8FFjV"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-225df540edcso47763625ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743093449; x=1743698249; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uyP/OmnQ4SIJtfl40LetBma5vVbsb01hseBYzmUnfaI=;
        b=FOF8FFjVQTWTm6hxDaE982F8OnS/Z1OdKYTrZjxo4c+Y1L23PuDjWSAYYXLdHAiQ5p
         gIw8w5FEfLd1GLpHSj3eVRD9m33J4DvdoBEAMGqDLZJrN4mODHqHS1H4OQGJg0UPxS2L
         tb4kFp9vF+ds1lQaaJ2zqNoTzfsyRtAVUCFBB5mabUGnAJspDoYK+HFj9irjF46lGfRG
         wfThSN5KLz/omW22PT9feZcdG7CDhooTlFxT4sqUSUaaQ/LoDDEFybTKd3Ba8tfRFrzM
         Saiz/H6GZgGNcLwagAdaekycqSmt+Bkw6c2zf/rZg2P0Ry7Q6Ty95zLPu7EflkZZNQrf
         ROXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093449; x=1743698249;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uyP/OmnQ4SIJtfl40LetBma5vVbsb01hseBYzmUnfaI=;
        b=cUAYbe3G7aSfyKYyG8WzvS4oyX1REKwiAaTcwsmmO9EFQ+CmcO6Z7l+U0VSTu9jKHs
         gtXuF4S5KDC3lsVHVsdiIgt1MT9vC5nH5pyBhKqsjoMnUfAkpA3Y2w18l/iotYLHqFhJ
         cOGdbC3ycj5jACKZl9hrgXM5Z7SMR9tVe4AdmmfbzH5n5NCsD2p7TA2o+j/mgsVgiQfJ
         5XYOEtgKSPMLlB0c0l3O2KTasE19wJlMSWVIRoPdd3UaFjXsQfCFLMhHTahPXsKdqsN2
         riibuhPRuhVvn5quZbrtZbxKbdmg1QrMMzZqXBSobwJ/cIGzMljpwDd2DjDeSXVJHEZw
         DM6g==
X-Forwarded-Encrypted: i=1; AJvYcCUQRVuqlATCRLoHwapsrRofc6j/4lQ40jQIbx7kk9Mv6iDugWlZQaXD6BZP7CV32TS0j3uC6MYGfV7RkLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGum2Lnb+VZ9SuL5ZZvA/crAmd+PGeJkD4UOPQ+QbTp3ZO/wx5
	vQuoRLh2auYP3Geh2RFlfGNNUg9nHqUV2d9b5ZQAdwATj1mQDji7X+Y26qK9lEOR6gSXFNocwnk
	=
X-Gm-Gg: ASbGncvSsiHe91/FupRUiCysuFOPfptVfg37DTZcInQ35d9zE7MmvCVTu+rVlI6sWzz
	WG9tcvBanuJFHt0RNBNun+wqZ5EIt2reRS5Qm4fmUAhVg54LpUAtvjAPAoUprE7FE6hvm5MOjLk
	lucrZT5biV+ZlWAmgRzgIvmK07xROORPp1kCA/mhemd/13TZzBF2S+PPIrfjqNNrcDrt+Sssm+V
	2uC+9Q7WMBNm+3xIVp5OsGIbprYbdRgzFB0qoVPnFVuI8WuCmFzFDDgt3Fd7dW85FnWwnAa+VBg
	Po8Kflhg5lx7Jhl9FzcC7VPkrYGEu0ai8TvoB4BO3oG8bbgl6/QciHI=
X-Google-Smtp-Source: AGHT+IEuoYADUmEf3NBAJ2GwFUfnJZX57K1/gNfAYcTrPpB/DKEuxy9RaTZfrZaLlOpHZwT9zR4Jwg==
X-Received: by 2002:a05:6a00:909a:b0:734:26c6:26d3 with SMTP id d2e1a72fcca58-7396e66351fmr1583530b3a.5.1743093448928;
        Thu, 27 Mar 2025 09:37:28 -0700 (PDT)
Received: from thinkpad ([120.60.71.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73971091cadsm1460b3a.126.2025.03.27.09.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 09:37:28 -0700 (PDT)
Date: Thu, 27 Mar 2025 22:07:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bo Sun <Bo.Sun.CN@windriver.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Vidya Sagar <vidyas@nvidia.com>, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kevin Hao <kexin.hao@windriver.com>
Subject: Re: [PATCH v3 1/2] PCI: Forcefully set the PCI_REASSIGN_ALL_BUS flag
 for Marvell CN96XX/CN10XXX boards
Message-ID: <5cxpg4biddw2lrz5vpebovckgb6qkhayxkmniz4nnxms76qovg@fhc3pzbyznyp>
References: <20250324090108.965229-1-Bo.Sun.CN@windriver.com>
 <20250324090108.965229-2-Bo.Sun.CN@windriver.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250324090108.965229-2-Bo.Sun.CN@windriver.com>

On Mon, Mar 24, 2025 at 05:01:07PM +0800, Bo Sun wrote:
> On our Marvell OCTEON CN96XX board, we observed the following panic on
> the latest kernel:
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000080
> CPU: 22 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.14.0-rc6 #20
> Hardware name: Marvell OcteonTX CN96XX board (DT)
> pc : of_pci_add_properties+0x278/0x4c8
> Call trace:
>  of_pci_add_properties+0x278/0x4c8 (P)
>  of_pci_make_dev_node+0xe0/0x158
>  pci_bus_add_device+0x158/0x228
>  pci_bus_add_devices+0x40/0x98
>  pci_host_probe+0x94/0x118
>  pci_host_common_probe+0x130/0x1b0
>  platform_probe+0x70/0xf0
> 
> The dmesg logs indicated that the PCI bridge was scanning with an invalid bus range:
>  pci-host-generic 878020000000.pci: PCI host bridge to bus 0002:00
>  pci_bus 0002:00: root bus resource [bus 00-ff]
>  pci 0002:00:00.0: scanning [bus f9-f9] behind bridge, pass 0
>  pci 0002:00:01.0: scanning [bus fa-fa] behind bridge, pass 0
>  pci 0002:00:02.0: scanning [bus fb-fb] behind bridge, pass 0
>  pci 0002:00:03.0: scanning [bus fc-fc] behind bridge, pass 0
>  pci 0002:00:04.0: scanning [bus fd-fd] behind bridge, pass 0
>  pci 0002:00:05.0: scanning [bus fe-fe] behind bridge, pass 0
>  pci 0002:00:06.0: scanning [bus ff-ff] behind bridge, pass 0
>  pci 0002:00:07.0: scanning [bus 00-00] behind bridge, pass 0
>  pci 0002:00:07.0: bridge configuration invalid ([bus 00-00]), reconfiguring
>  pci 0002:00:08.0: scanning [bus 01-01] behind bridge, pass 0
>  pci 0002:00:09.0: scanning [bus 02-02] behind bridge, pass 0
>  pci 0002:00:0a.0: scanning [bus 03-03] behind bridge, pass 0
>  pci 0002:00:0b.0: scanning [bus 04-04] behind bridge, pass 0
>  pci 0002:00:0c.0: scanning [bus 05-05] behind bridge, pass 0
>  pci 0002:00:0d.0: scanning [bus 06-06] behind bridge, pass 0
>  pci 0002:00:0e.0: scanning [bus 07-07] behind bridge, pass 0
>  pci 0002:00:0f.0: scanning [bus 08-08] behind bridge, pass 0
> 
> This regression was introduced by commit 7246a4520b4b ("PCI: Use
> preserve_config in place of pci_flags"). On our board, the 0002:00:07.0
> bridge is misconfigured by the bootloader. Both its secondary and
> subordinate bus numbers are initialized to 0, while its fixed secondary
> bus number is set to 8. However, bus number 8 is also assigned to another
> bridge (0002:00:0f.0). Although this is a bootloader issue, before the
> change in commit 7246a4520b4b, the PCI_REASSIGN_ALL_BUS flag was set
> by default when PCI_PROBE_ONLY was not enabled, ensuing that all the
> bus number for these bridges were reassigned, avoiding any conflicts.
> 
> After the change introduced in commit 7246a4520b4b, the bus numbers
> the misconfigured 0002:00:07.0 bridge. The kernel attempt to reconfigure
> 0002:00:07.0 by reusing the fixed secondary bus number 8 assigned by
> bootloader. However, since a pci_bus has already been allocated for
> bus 8 due to the probe of 0002:00:0f.0, no new pci_bus allocated for
> 0002:00:07.0. This results in a pci bridge device without a pci_bus
> attached (pdev->subordinate == NULL). Consequently, accessing
> pdev->subordinate in of_pci_prop_bus_range() leads to a NULL pointer
> dereference.
> 
> To summarize, we need to set the PCI_REASSIGN_ALL_BUS flag when
> PCI_PROBE_ONLY is not enabled in order to work around issue like the
> one described above.
> 
> Cc: stable@vger.kernel.org
> Fixes: 7246a4520b4b ("PCI: Use preserve_config in place of pci_flags")
> Signed-off-by: Bo Sun <Bo.Sun.CN@windriver.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Changes in v3:
>  - Make 'PCI_REASSIGN_ALL_BUS' unconditional, as suggested by Mani.
>  - Update comment as requested by Mani.
> 
>  drivers/pci/quirks.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 82b21e34c545..787a5e75cd80 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -6181,6 +6181,19 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x1536, rom_bar_overlap_defect);
>  DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x1537, rom_bar_overlap_defect);
>  DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x1538, rom_bar_overlap_defect);
>  
> +/*
> + * Quirk for Marvell CN96XX/CN10XXX boards:
> + *
> + * Adds PCI_REASSIGN_ALL_BUS to force bus number reassignment to
> + * avoid conflicts caused by bootloader misconfigured PCI bridges.
> + */
> +static void quirk_marvell_cn96xx_cn10xxx_reassign_all_busnr(struct pci_dev *dev)
> +{
> +	pci_add_flags(PCI_REASSIGN_ALL_BUS);
> +}
> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_CAVIUM, 0xa002,
> +			 quirk_marvell_cn96xx_cn10xxx_reassign_all_busnr);
> +
>  #ifdef CONFIG_PCIEASPM
>  /*
>   * Several Intel DG2 graphics devices advertise that they can only tolerate
> -- 
> 2.49.0
> 

-- 
மணிவண்ணன் சதாசிவம்
