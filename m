Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8799221F2D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743665232; cv=none; b=fRfKnX0V6u1/t8qtQEoJd8Is2uPB7mDk9w08L196BOqQDpsxo0r5rb4n+kYwH1wB+zk1pz+sVfzHmQjpJnoP9Qza0oGbxgNKTAJvbvgo0D87ZkEkP17RVVN1eBL6D99XtVBZ+o2W1v4jBx+N8VZBMfz1YSLJxQs+YHic3YLSBi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743665232; c=relaxed/simple;
	bh=YiQE/rbxd6T+0Sl12/HPKQOH2Wjbican48ns51RS/Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxgsdWyGrYKjVpXAmWDo4OgEeWp9SbiLb8FZrTN5aBCxJ/qYdAnKLK70EFCVtVd/MXVCFZqNfaeyrxtRXi8aZTJ3ytfh1sJNFmwD92pBP04JCspqRVUHORvfbBv35kqFOnD5VGyNMB1IzwkSr9R6+ZPy4Pueg0uul9zQGAiZSC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lp3njvUm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lp3njvUm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743665229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nC2q6NcPEOSq5O/QwSWUVvMEBJ0OfjzBc7t2dBxH+Kg=;
	b=Lp3njvUmbrbxL0+7DL/0/z86UK+/TT1w/MCT0oVKk//ENSyTpprpySURxIlR79PtsieW0U
	qE+8MYIVHSqe0pNzJXVcS9xG7lByaAcmRTQvoAT0B6PjfZvSkZ2GtpSzIkNmaREWcw8G6k
	ht+UHBX8PaSDT1HM5OYcTm0XJb1nSjI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-cyrSZuyjMo-G_PQ_WmtyrA-1; Thu, 03 Apr 2025 03:27:08 -0400
X-MC-Unique: cyrSZuyjMo-G_PQ_WmtyrA-1
X-Mimecast-MFC-AGG-ID: cyrSZuyjMo-G_PQ_WmtyrA_1743665227
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so3263825e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 00:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743665227; x=1744270027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nC2q6NcPEOSq5O/QwSWUVvMEBJ0OfjzBc7t2dBxH+Kg=;
        b=NA1M451Kj1jpasuuf5DWO+k6KBOzQIApK8x/ldHbMNvM3S+tV8AzkcTLSZZ2m6zHxp
         1zLqQuIjjkdq5jMY9kv9SGvyRGwFOcvRZWEwm1TVOyu5pvrrpOkrSL3vvueZP+XjLnuC
         B0QckLgGq9KRjxrklvJu9DG6UDo4EXUyaGmNudj7KON/5ZZcPEFapKdXjxnMmtn8zr6Y
         5X/ZNz8RVK4ipMo8Lvs5JyY8DKfvstC39TUCXSnldytTUiLM60MOZs+xT78bqYMMAWzt
         gB3jlAxyl4eBOGh7XgTZHbsej3bTtomadlmaxGBX8xhn+CqvNEi+VkgwC+YtV3dIzX6K
         zy4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDV8Hb6dm09Uv4z78Ry4rH9DvrDTwtFNBnqRoH7PI1mhZoQlDQsflVMgv2ONFGrzJNuzNbU8vbbQmyALM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOS6uu6z8W3aRJK9FnpilPqDGg0uJv5TU99zhPNC+uneUMwkiC
	hkPQNb4I6NVgRv/vUwLJ1n8QJ4YeTirNpzJPhHv5hot6UQcN1/usoqLpCEx1WhTOjN5/YTMJfsv
	LSl/ieqMQqEfo1Swi/3wY4Cp9FxiiExrmt7DqR4DpJ+rNrfm2lqdxS/0hQDAhxg==
X-Gm-Gg: ASbGnctmBTu/zzR50nz90RALAoQnFsJTnhrNxEm3iM3UNcnue1PUpek/9zwT5Jmf6Vg
	inQcEDyrLjD/g8XP+gpNp9iA/B4uOzIqJXUd7sUMOcnyxmWcbpbk7/CJXwACAJJMPpxww03Cllv
	a3H3ArozQZ3OoAXRAPkSDm4YU7qPriTY476m88H9N+uKtJH1svTLY0MmezwOTVS3AS3A3qcBNuW
	rdUgK+sQbP5bn14vv1H9y0m6GOLSdeCKxxm7ig5NufRaKfgyMPI8Gs3YJVtdCaZSYRGqhcFLzAM
	Duf3OtOEaQ==
X-Received: by 2002:a05:600c:3ca4:b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-43ec15363efmr13351695e9.31.1743665227182;
        Thu, 03 Apr 2025 00:27:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+6CSWPKPgeTjCe2MsfTh7Yn/OPPZT5EMebursV8pLb7slkNAelNKYRkjtjUZ6I5WEFJ9Hgw==
X-Received: by 2002:a05:600c:3ca4:b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-43ec15363efmr13351455e9.31.1743665226782;
        Thu, 03 Apr 2025 00:27:06 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1663060sm13393335e9.14.2025.04.03.00.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 00:27:06 -0700 (PDT)
Date: Thu, 3 Apr 2025 03:27:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: virtio-comment@lists.linux.dev, hch@infradead.org,
	Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de, Zhu Lingshan <lingshan.zhu@amd.com>
Subject: Re: [RFC PATCH 3/3] transport-pci: Add SWIOTLB bounce buffer
 capability
Message-ID: <20250403032152-mutt-send-email-mst@kernel.org>
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
> 
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



So on the PCI option. The normal mapping (ioremap) for BAR is uncached. If done
like this, performance will suffer. But if you do normal WB, since device
accesses do not go on the bus, they do not get synchronized with driver
writes and there's really no way to synchronize them.

First, this needs to be addressed.

In this age of accelerators for everything, building pci based
interfaces that can't be efficiently accelerated seems shortsighted ...

-- 
MST

