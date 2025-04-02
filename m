Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F3921B9D8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743605892; cv=none; b=dDc6Wo8f97QQnYRnGubVM60EbAU/qutIau4qbVXhy2eAVktPSrxzhaqD/J2r/3BrLsHnJ+BZTE5QLyvNtBtj1isuahhSmhNm9MRn/XHMwnvdJSjq0h45H0TpPUMu5OJKUta0/09++GUu5p+hn20BV71MOmDvGY1NOTp1t8VqHA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743605892; c=relaxed/simple;
	bh=7qjDoKy6T4RUbyZPwTCSPFSHXYhJvifIH6d2qlp7tLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ud9RD3j0SNTCp6uUaf4hdnzSdQUdnsZc8m9AXkTKD+8v4toVlS5OuXnzvE7Cd/RFMORsxaFQfNgwHKYeJm9+nXn2uVdDsD3oe1LQhNUKWOA//IExPefYtoumsY91ddek70bV1sYrjl5oKWVbMOKCOn6ChpXGcfUOifJ/COkSvSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B1RMrW9L; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B1RMrW9L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743605889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L8Rz3VpKn+8r1+AXWNItama+JHeQ2kHW+quVQG2dGm0=;
	b=B1RMrW9Led9/DPF2mA3QJwlvgJT3mBGHwPW73yVX6X+ankT4/SdyuXbEerz05347mbAgP8
	d5Ytiu4dQqtlL8LTb/bMlo0SHvGjVg1SApmnrGyq8B2Ix6VMXfGf6LSFN34HYzue2GSOfY
	ukjtHCM/XmdKwJuHERF9xV7FT5ClBN8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-DstrXnHLPiCsdvxIeA7fvQ-1; Wed, 02 Apr 2025 10:58:08 -0400
X-MC-Unique: DstrXnHLPiCsdvxIeA7fvQ-1
X-Mimecast-MFC-AGG-ID: DstrXnHLPiCsdvxIeA7fvQ_1743605887
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so55757325e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 07:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743605887; x=1744210687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8Rz3VpKn+8r1+AXWNItama+JHeQ2kHW+quVQG2dGm0=;
        b=EGVAAwUIJ7sapOsa6krbxckB9MBoNSsR9Y8GI3nkUpXpOfleLtoUA8/IOabRaaTBVe
         qT48esY2Sot7rJHmFWwFBSEnHChpIffmWAIl7n3CwMaKdhLTemaGljCsrJcQ/Vp3y8lH
         Lanhi5Txuuawd5yzeT/dK8uiKp2oKhIjF4x+95d4q3T6K67gCh+G0/b0B+2jasZq5qPu
         39HaF04WCZqL2eY3rw0BThz1yAR509x72OiZjUADcLs2sWE/5iLvrANWnlOSqti6Tcaj
         91QL6u/DRuzm2+YXCeaC6QBkMNCZeszYoPF5P7NEqyflumAgBkcadGt0Ad1I3iVGziJP
         paWg==
X-Forwarded-Encrypted: i=1; AJvYcCWzsrLd5zzrbvNEYiQZXlWH2ooNrf3Ubz/mKY91vpbgsT+3RdIvZ6IRNrqaCVXtS0V5B9K1QyrBVj+VUGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjIEFqpBen2CexhjEcK1XsoHo4U49M2dW8oXFT1V5XhnzLGrUd
	Qm0oh0Fyqtx1pu3TKTO1BchZrVrOTcT93MQ8OM3ysBGhfhHmGmPUfA7FV+4Ag79aNSr2rBajoUH
	siCU/szhire5K1K/5CH+SjAJRaDfRcS/cEibdhDTl5E/o2YNkNOABAwQ521h+Xg==
X-Gm-Gg: ASbGncsZcChJaHhzW4v8R/BC+Rafrurx+ZVEG+gFn8Uapl/DoFUcClBXTsVtkTWyo6C
	8IlQIKpew+2fkuISBfYWE4k/kaXbPy/rVVagDeoXr7RRqn81rxZoRe66e4+VUT1CT5aHhu/Pw8t
	ZR1zMZnHj+0a67KLSfjnwDCej4mGc2E0KsVT8cPdYN/BZ+A8Zj9225xOj1GwWgS3aIAY5xO/ZQi
	2qjjoU48wJQVAReqqXWcqPuVFSFfjWDXbKwOeKVunNhEhK33LpZJIhuULlKTmxr3JX5XQ8t9ohO
	FhenJ40qlg==
X-Received: by 2002:a05:600c:4f85:b0:43c:e7a7:aea0 with SMTP id 5b1f17b1804b1-43eb5c95ab8mr26516285e9.26.1743605887052;
        Wed, 02 Apr 2025 07:58:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnt5KDjZ7Xbo5Pys2aWUT0a97kfUfsVi0s1wsDCX5Rl3ZcuRhKVDRKDpLSMyp1j0flnDsOkw==
X-Received: by 2002:a05:600c:4f85:b0:43c:e7a7:aea0 with SMTP id 5b1f17b1804b1-43eb5c95ab8mr26515985e9.26.1743605886682;
        Wed, 02 Apr 2025 07:58:06 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0dcc66a4sm16163450f8f.42.2025.04.02.07.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 07:58:06 -0700 (PDT)
Date: Wed, 2 Apr 2025 10:58:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: virtio-comment@lists.linux.dev, hch@infradead.org,
	Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: Re: [RFC PATCH 3/3] transport-pci: Add SWIOTLB bounce buffer
 capability
Message-ID: <20250402105436-mutt-send-email-mst@kernel.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-4-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402112410.2086892-4-dwmw2@infradead.org>

On Wed, Apr 02, 2025 at 12:04:47PM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Add a VIRTIO_PCI_CAP_SWIOTLB capability which advertises a SWIOTLB bounce
> buffer similar to the existing `restricted-dma-pool` device-tree feature.
> 
> The difference is that this is per-device; each device needs to have its
> own. Perhaps we should add a UUID to the capability, and have a way for
> a device to not *provide* its own buffer, but just to reference the UUID
> of a buffer elsewhere?

Such uuid appoach will be really messy with physical devices.
Also messy with confidential since config space is not encrypted.
Really, if you want something complex like this, just use virtio-iommu.
It does not require parsing page tables or anything complex like that.
The attraction of the same BAR proposal is that it is, at least, simple.


> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  transport-pci.tex | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/transport-pci.tex b/transport-pci.tex
> index a5c6719..23e0d57 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -129,6 +129,7 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
>  \item ISR Status
>  \item Device-specific configuration (optional)
>  \item PCI configuration access
> +\item SWIOTLB bounce buffer
>  \end{itemize}
>  
>  Each structure can be mapped by a Base Address register (BAR) belonging to
> @@ -188,6 +189,8 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
>  #define VIRTIO_PCI_CAP_SHARED_MEMORY_CFG 8
>  /* Vendor-specific data */
>  #define VIRTIO_PCI_CAP_VENDOR_CFG        9
> +/* Software IOTLB bounce buffer */
> +#define VIRTIO_PCI_CAP_SWIOTLB           10
>  \end{lstlisting}
>  
>          Any other value is reserved for future use.
> @@ -744,6 +747,36 @@ \subsubsection{Vendor data capability}\label{sec:Virtio
>  The driver MUST qualify the \field{vendor_id} before
>  interpreting or writing into the Vendor data capability.
>  
> +\subsubsection{Software IOTLB bounce buffer capability}\label{sec:Virtio
> +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
> +Software IOTLB bounce buffer capability}
> +
> +The optional Software IOTLB bounce buffer capability allows the
> +device to provide a memory region which can be used by the driver
> +driver for bounce buffering. This allows a device on the PCI
> +transport to operate without DMA access to system memory addresses.
> +
> +The Software IOTLB region is referenced by the
> +VIRTIO_PCI_CAP_SWIOTLB capability. Bus addresses within the referenced
> +range are not subject to the requirements of the VIRTIO_F_ORDER_PLATFORM
> +capability, if negotiated.
> +
> +\devicenormative{\paragraph}{Software IOTLB bounce buffer capability}{Virtio
> +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
> +Software IOTLB bounce buffer capability}
> +
> +Devices which present the Software IOTLB bounce buffer capability
> +SHOULD also offer the VIRTIO_F_SWIOTLB feature.
> +
> +\drivernormative{\paragraph}{Software IOTLB bounce buffer capability}{Virtio
> +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
> +Software IOTLB bounce buffer capability}
> +
> +The driver SHOULD use the offered buffer in preference to passing system
> +memory addresses to the device. If the driver accepts the VIRTIO_F_SWIOTLB
> +feature, then the driver MUST use the offered buffer and never pass system
> +memory addresses to the device.
> +
>  \subsubsection{PCI configuration access capability}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / PCI configuration access capability}
>  
>  The VIRTIO_PCI_CAP_PCI_CFG capability
> -- 
> 2.49.0
> 

