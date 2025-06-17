Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A56342A99
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 19:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750189582; cv=none; b=CJlhFz58y3sAUe+iPlJc4Qeh4xv89m2xHLsK+gUizLN2Y8DJP9wbNWnUTzoCa2fTTR/iq5nd64Jh31h+n9qojd5GqWF+TF4Vbe0SGIPpxPvenL9CTAJp5vA/natoli7D0PkOK6B/yC5LCe16fqCVTUnAP9qjQQ1WZIFPzV7nZK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750189582; c=relaxed/simple;
	bh=6SdbPPe9pmSE8+0ZJM1umJlBQZ1wA58S28tOdEyrjyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pFgxlOOlghvWxIUZ9YmqpEGHVHN71bdCxC/W9yjtHFXt2IHvrot3Is5InemvHYImUJCwvNsL/+LLV6k6SGFKFMpZOzuMzeEocaS+jwORf+Cw7yWvn1D644FPyil89OrCkXa/5EsB15XzrgBFzUsqlFBrXXsiHRe9BeEGHPoCzSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BpUYHN0V; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BpUYHN0V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750189579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=icFJhskVkKQqZu2iPajxPrgD6zNA+fOLsrBnVy7h8EQ=;
	b=BpUYHN0VDcvJs44dUruAbxmNqFYw/KcM/fTq5uN1sy92onDORvNq69P2y1h2ltnY/OkMO6
	LsT1IWmPGHRNGbiFHQYPIp9sNjW53cz1iQjamQHPsWj66mjLifw94o132qRD/5YHXzRuBi
	wBECYWv9fIWWdPitQAmzu/uZYfl+XYI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-dfPM669tP9a1cV0Dmn_AUg-1; Tue, 17 Jun 2025 15:46:17 -0400
X-MC-Unique: dfPM669tP9a1cV0Dmn_AUg-1
X-Mimecast-MFC-AGG-ID: dfPM669tP9a1cV0Dmn_AUg_1750189576
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f7ebfd00so2792942f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750189576; x=1750794376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icFJhskVkKQqZu2iPajxPrgD6zNA+fOLsrBnVy7h8EQ=;
        b=uF74iqkYRFPF3hz/tClfA3DUO0VRHrbP9tEfsvJUodFK5v/hbzzDCS+KczdF0jgc6+
         oAdlSEaIBbZ1V2IRVqErlmg5ak8NbfMC6u3kbE+3zC1ohi9vjqoYOeAFbEbLhsscpdnw
         fv1mnO2P+QnPQcM8FIR4rFiyugOMu6PToxLOTJTLZHGz1wuvVinHZQYf1Elw+K4Q4+9N
         ZetmZUulbvl1qUF8J9yqF79uzLos8vEDNr8T5Y/lC7MxIhRrjWgP3woZq1mEcQa92WV5
         faokvi61ZjEsJ6emEa0g53aHmi/K07c8fgr+jyfb7EKHFmCQRRZvL91CdakSn/TNVz/l
         iYDg==
X-Forwarded-Encrypted: i=1; AJvYcCUAWXSHyhAxM1BCrOJs0M5sF0c1J7e2Fy+G0rQTaXU3r9FG2XPTWAJdKliNvtDla+L9Bw7rUAwg2iKn4/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKuqfzmtzChegioqvbZ1OgtIbOZQWfZ3mWbIZkJJeht9z1IxWL
	Oi1Icx5RypzPxsp8/kaWhHPypQL8gCMjs9G/Dj0ohg1mZ7ic6een8sJljyoVzs0FR2rgqxuBldI
	3uHXO3l5qFtDRWVAkYVnsumU9a21E71AdlOFSZglDkGA9vw61K7NjjXDliWy7Wuum/Q==
X-Gm-Gg: ASbGncsheNmQrTsfd1fOFR+NkEiWWfTCaqTm6y0FVepJ71fORqp6gptyxDpYVIx1L9t
	M/vlLvJhocvg/vNm71UmR1+HmaP6hpYU2wNOHxe7p1k00H6IumzXfmfz99ZK76aFdhoyu1iCGZd
	TFGgWK9OUkuHNi8ib/qro2lI2z4EQbA/ps4wlnOH9624ePNd3jGTg21pxAgZtjh4XVh8kPjlbQM
	5QPNjJmPz8qxhIrBhOkam8WrbDzJCbQcy1+YEyt5BA2sFmfAwS50R88wWnU1UV4/z9Shlb4FWJP
	kVqkBkH4a5sqzDD7
X-Received: by 2002:a05:6000:2007:b0:3a5:25e0:1851 with SMTP id ffacd0b85a97d-3a5723660b5mr12195277f8f.7.1750189576213;
        Tue, 17 Jun 2025 12:46:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFO9JZf66g6UmsF+FsTytz4QymacwGU4iFb1DNv63Dd/5GxeH4PDvqwykdFRQ9tUf5lrXqgjg==
X-Received: by 2002:a05:6000:2007:b0:3a5:25e0:1851 with SMTP id ffacd0b85a97d-3a5723660b5mr12195258f8f.7.1750189575837;
        Tue, 17 Jun 2025 12:46:15 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73ea:4300:f7cc:3f8:48e8:2142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a543d9sm14603319f8f.5.2025.06.17.12.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 12:46:15 -0700 (PDT)
Date: Tue, 17 Jun 2025 15:46:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Alyssa Ross <hi@alyssa.is>, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev, x86@kernel.org,
	Spectrum OS Development <devel@spectrum-os.org>
Subject: Re: Virtio-IOMMU interrupt remapping design
Message-ID: <20250617154524-mutt-send-email-mst@kernel.org>
References: <>
 <a65d955c-192b-4e79-ab11-8e2af78b62af@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a65d955c-192b-4e79-ab11-8e2af78b62af@gmail.com>

On Sun, Jun 15, 2025 at 02:47:15PM -0400, Demi Marie Obenour wrote:
> Virtio-IOMMU interrupt remapping turned out to be much harder than I
> realized.  The main problem is that interrupt remapping is set up
> very early in boot.  In fact, Linux calls the interrupt remapping probe
> function from the APIC initialization code: x86_64_probe_apic ->
> enable_IR_x2apic -> irq_remapping_prepare().  This is almost certainly
> much before PCI has been initialized.  Also, the order in which devices
> will be initialized is not something Linux guarantees at all, which is a
> problem because interrupt remapping must be initialized before drivers
> start setting up interrupts.  Otherwise, the interrupt remapping table
> won't include entries for already-existing interrupts, and things will
> either break badly, not get the benefit of interrupt remapping
> security-wise, or both.
> 
> The reason I expect this doesn't cause problems for address translation
> is that the IOMMU probably starts in bypass mode by default, meaning
> that all DMA is permitted.  If the IOMMU is only used by VFIO or
> IOMMUFD, it will not be needed until userspace starts up, which is after
> the IOMMU has been initialized.  This isn't ideal, though, as it means
> that kernel drivers operate without DMA protection.
> 
> Is a paravirtualized IOMMU with interrupt remapping something that makes
> sense?  Absolutely!  However, the IOMMU should be considered a platform
> device that must be initialized very early in boot.  Using virtio-IOMMU
> with MMIO transport as the interface might be a reasonable option, but
> the IOMMU needs to be enumerated via ACPI, device tree, or kernel
> command line argument.  This allows it to be brought up before anything
> capable of DMA is initialized.
> 
> Is this the right path to go down?  What do others think about this?
> -- 
> Sincerely,
> Demi Marie Obenour (she/her/hers)



The project for this discussion is also virtio-comment,
this ML is for driver work.



