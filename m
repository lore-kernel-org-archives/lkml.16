Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412EF24061F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743665859; cv=none; b=GEF4WJIMUWoZ1NUXJ8mQwBS0nXKHJphtf0ljY2NhCd2gV2n2G+4M2pdnB2e5fOeQVR0GSBZ3WkP4esRu2mXP9zrDncoQJaG98U0b4WeqOJh8E0YitB8igE5j6pcrh5ziPt470yjBxnfKbw7QH60Kfi1QWHI6/Adl0NY6dRrFXpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743665859; c=relaxed/simple;
	bh=hzxDjgjd3msTIYyPm/Cc51W4R7MsHR5ALzTpTfRFiqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucKpgpSj6SwQUyXymmt8k5jV4kqr+eb85Xi6dmyRAb1tU1TUE0fkymZ0iGYhuwk2jjIZrzDman5KQLeILB8IAwirVlsg7wc/aLSXCooHoDrEedv7EEqykrEQRuw2H/Rak243Jvz88gCm997lVvctxSrAgD4OFC3zorjsW/N/5xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bas6vpc6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bas6vpc6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743665856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3VSBlujXZVBs30EG1EC5BPYZEbdG6wVu6VetvoDe2DI=;
	b=bas6vpc6kGiT+aeOt+CjyRLbsBa1OTf7+PHkNgFO4VRA6GbZ0doRrN+TRLvaVWjfygpBbD
	2+EHm7/LMk3KkxY2FwGZ5j3tV97zjO6/dHLB5pFaVPJnsS/UuH8xRFgIXsZiuij8gFbNBA
	VoHbo46E3ck0UfFduQA0pj70fujr16M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-n5Nxzx1hOeqVebrQ0dNPYA-1; Thu, 03 Apr 2025 03:37:34 -0400
X-MC-Unique: n5Nxzx1hOeqVebrQ0dNPYA-1
X-Mimecast-MFC-AGG-ID: n5Nxzx1hOeqVebrQ0dNPYA_1743665854
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39c30f26e31so187628f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 00:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743665853; x=1744270653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VSBlujXZVBs30EG1EC5BPYZEbdG6wVu6VetvoDe2DI=;
        b=aBXMYdzMDzpDpoBQ1mNML/Ab8o3H3ivzp9Gk5Pjt+yAr0sWyyo3oRzljgNIJOxNJ1L
         9wdKOfwlmBNduWZcJrcs4XsO+Vxo0TpimpcoWqjioIKILyQ4P3z6p7YQffT8ZJ0gA9cP
         b7tUbLwt9ODpyqDB9GodfQ+NIPbshtNwY4+PB1Qe1TTRwWFDV9mviTYOnU8YecPwj097
         jti6h3Trv3+JmXd0qI+dbetz6duU4oKj9mxaTjRWlb+OEs6DB8uZ9lt5JKPZcog6N3jb
         S9ponWFA4XFiGQKPQwObR0KqMnM/Bw+FPEFbG//WBLHi0qSpJLadKPVP0ShM118GhJW1
         zVRg==
X-Forwarded-Encrypted: i=1; AJvYcCXjnlwdCujcqj/wSFUT5F/+2Lv/Zanr/PLjfDU5SPDLoF6se7F91g/0dxnUXaa/qPQCqjj5cJ83rlSjA6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpQ6eMx4XjLtNR6nP21u3vWEKD1mlKnbUfQYb2qmO+8r+4i8o3
	mEQ+ZPxUKFBzawWCM5t55TQXWBsz59JpmHHC2/s27Y1aZpJdwrswVAnHlhYJ4sClL/8RpcBj3IX
	DOEbwywlRg0OSc8HpfQ9LEQr2ohy/gF7GAArXSz/t/UGVmFxqrXk55FWUL/Nl0w==
X-Gm-Gg: ASbGnctPwrQ1kZ/88WvZm0pd+7cEiHAEd3V9FaI/gXSXczmWUhnhrdURVlOGfmaut7v
	vZLb8/72o3+Q5CDndsViKZ2xAKx8+NZQBF/YinZK9Hf3AcUNBSuCJWfQxpFQ6eeaN8KB4Ge3/PR
	46bAbzzKB8ZfV6bu1pUN/AEd9JsGyA3n9PG+yCb/jvck6b7JcEsbqmqZDI8hUbrAa2cmUKQoLLz
	Q1mqIUC+7MB7+nWz5COvHgGbgQyMrdV+pGB6+0fSec12nlD37kgTpKieI3F4UETkI5U8XdaMwTp
	ng5hMMbIrw==
X-Received: by 2002:a5d:584c:0:b0:391:158f:3d59 with SMTP id ffacd0b85a97d-39c2f8d402bmr1124415f8f.15.1743665853553;
        Thu, 03 Apr 2025 00:37:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3XLamVB1PRcvkIWr1wheGM6DDk1NOiVDUI7SBk453PG1cUTX0y4mBG1b7UcjVGObKBCY/4A==
X-Received: by 2002:a5d:584c:0:b0:391:158f:3d59 with SMTP id ffacd0b85a97d-39c2f8d402bmr1124390f8f.15.1743665853202;
        Thu, 03 Apr 2025 00:37:33 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226b23sm970335f8f.86.2025.04.03.00.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 00:37:32 -0700 (PDT)
Date: Thu, 3 Apr 2025 03:37:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: David Woodhouse <dwmw2@infradead.org>, virtio-comment@lists.linux.dev,
	hch@infradead.org, Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: Re: [RFC PATCH 3/3] transport-pci: Add SWIOTLB bounce buffer
 capability
Message-ID: <20250403033718-mutt-send-email-mst@kernel.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-4-dwmw2@infradead.org>
 <20250403032152-mutt-send-email-mst@kernel.org>
 <9635c502-3635-4875-ae1f-53b4b7aed855@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9635c502-3635-4875-ae1f-53b4b7aed855@amd.com>

On Thu, Apr 03, 2025 at 03:36:04PM +0800, Zhu Lingshan wrote:
> On 4/3/2025 3:27 PM, Michael S. Tsirkin wrote:
> > On Wed, Apr 02, 2025 at 12:04:47PM +0100, David Woodhouse wrote:
> >> From: David Woodhouse <dwmw@amazon.co.uk>
> >>
> >> Add a VIRTIO_PCI_CAP_SWIOTLB capability which advertises a SWIOTLB bounce
> >> buffer similar to the existing `restricted-dma-pool` device-tree feature.
> >>
> >> The difference is that this is per-device; each device needs to have its
> >> own. Perhaps we should add a UUID to the capability, and have a way for
> >> a device to not *provide* its own buffer, but just to reference the UUID
> >> of a buffer elsewhere?
> >>
> >> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> >> ---
> >>  transport-pci.tex | 33 +++++++++++++++++++++++++++++++++
> >>  1 file changed, 33 insertions(+)
> >>
> >> diff --git a/transport-pci.tex b/transport-pci.tex
> >> index a5c6719..23e0d57 100644
> >> --- a/transport-pci.tex
> >> +++ b/transport-pci.tex
> >> @@ -129,6 +129,7 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
> >>  \item ISR Status
> >>  \item Device-specific configuration (optional)
> >>  \item PCI configuration access
> >> +\item SWIOTLB bounce buffer
> >>  \end{itemize}
> >>  
> >>  Each structure can be mapped by a Base Address register (BAR) belonging to
> >> @@ -188,6 +189,8 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
> >>  #define VIRTIO_PCI_CAP_SHARED_MEMORY_CFG 8
> >>  /* Vendor-specific data */
> >>  #define VIRTIO_PCI_CAP_VENDOR_CFG        9
> >> +/* Software IOTLB bounce buffer */
> >> +#define VIRTIO_PCI_CAP_SWIOTLB           10
> >>  \end{lstlisting}
> >>  
> >>          Any other value is reserved for future use.
> >> @@ -744,6 +747,36 @@ \subsubsection{Vendor data capability}\label{sec:Virtio
> >>  The driver MUST qualify the \field{vendor_id} before
> >>  interpreting or writing into the Vendor data capability.
> >>  
> >> +\subsubsection{Software IOTLB bounce buffer capability}\label{sec:Virtio
> >> +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
> >> +Software IOTLB bounce buffer capability}
> >> +
> >> +The optional Software IOTLB bounce buffer capability allows the
> >> +device to provide a memory region which can be used by the driver
> >> +driver for bounce buffering. This allows a device on the PCI
> >> +transport to operate without DMA access to system memory addresses.
> >> +
> >> +The Software IOTLB region is referenced by the
> >> +VIRTIO_PCI_CAP_SWIOTLB capability. Bus addresses within the referenced
> >> +range are not subject to the requirements of the VIRTIO_F_ORDER_PLATFORM
> >> +capability, if negotiated.
> >> +
> >> +\devicenormative{\paragraph}{Software IOTLB bounce buffer capability}{Virtio
> >> +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
> >> +Software IOTLB bounce buffer capability}
> >> +
> >> +Devices which present the Software IOTLB bounce buffer capability
> >> +SHOULD also offer the VIRTIO_F_SWIOTLB feature.
> >> +
> >> +\drivernormative{\paragraph}{Software IOTLB bounce buffer capability}{Virtio
> >> +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
> >> +Software IOTLB bounce buffer capability}
> >> +
> >> +The driver SHOULD use the offered buffer in preference to passing system
> >> +memory addresses to the device. If the driver accepts the VIRTIO_F_SWIOTLB
> >> +feature, then the driver MUST use the offered buffer and never pass system
> >> +memory addresses to the device.
> >> +
> >>  \subsubsection{PCI configuration access capability}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / PCI configuration access capability}
> >>  
> >>  The VIRTIO_PCI_CAP_PCI_CFG capability
> >> -- 
> >> 2.49.0
> >>
> >
> >
> > So on the PCI option. The normal mapping (ioremap) for BAR is uncached. If done
> > like this, performance will suffer. But if you do normal WB, since device
> and this even possibly can cause TLB thrashing.... which is a worse case.
> 
> Thanks
> Zhu Lingshan


Hmm which TLB? I don't get it.

> > accesses do not go on the bus, they do not get synchronized with driver
> > writes and there's really no way to synchronize them.
> >
> > First, this needs to be addressed.
> >
> > In this age of accelerators for everything, building pci based
> > interfaces that can't be efficiently accelerated seems shortsighted ...
> >

