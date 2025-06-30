Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD162749DF
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292997; cv=none; b=PYwu98ZwH1yHKajJ57pwm5y2P/EF3ebuQR9/IGXI7P6wpd++QwAaTXMZR1w27Kl0rICcM19JIqdAqoE4yrqxJfye9vj8HRCVsBegkpWswRAmVDTecaIlTIXyzwS6B43wb7GdAAts3i1xigFJAsuFaw1uNijQdyem/6WjMFwySXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292997; c=relaxed/simple;
	bh=uU4NWYJg1V5Vn9H6OG3dYNvVtaH+6cljDRAzH8j8WGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQfz3WBbgompcK4bhx0FsvOjf0P/m/I1/aK7tk+y2KmgMMGXdxapbuUIyPioSe89AhY81U44qVxPSzqkU4Nt/bXRhnj5uENwKx80rHTB1pOvQhpeGpE8mfdQdL1LN+K1jxZHtSUSdkRxIY57ica/t0UmtzKIDIU6sAzI1rdePfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=rhfBPB9v; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="rhfBPB9v"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6fac7147cb8so76859656d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751292993; x=1751897793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2s8kDcioPxvpOzyItFHoM4iqYzDE+tvgyvsTlB7SpgQ=;
        b=rhfBPB9vhQ0qfVtYh3kbeQQ2Nc3S6zC1q6fJbCmRneEz997tmu/S0tIauTuKEvaZG4
         Niab4xQ7P1YjMa+mvtFDlJmFOzv7t6n4bG2bKhLPB9A39RStkLYCGGckv19pCHQrFm8r
         LD42esuaxUAE7pavYND12NTwXHdGvxdnrqsPu7cs6HTby/gz/ABddT6BWGhl0ArWQMX2
         lkV+sSvMJTDFqnmNBVHy6FwcK3ynRx+SIS6GN/EI/k8dtcH/GBQR+3bRrledT8Te4Ens
         jAqIxyXG7E65e5o62o5EqKfl3eTCTefOalWOHar5V7km6qUeIsnGFrPJDZZYGoi68G1J
         wetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292993; x=1751897793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2s8kDcioPxvpOzyItFHoM4iqYzDE+tvgyvsTlB7SpgQ=;
        b=Xv1AZ2k9ffFcnag2c2mAwM29UOCF28lITVPyTrY/RLIbI1lHnS+ZpVXeZZ+YLLYQQ0
         yyYbttHK+200pDIAhNmpuy9DsOQAGdbUDm/2njpBHA7gT4gE52zc6yXL/cCBZvSM0LaR
         j/6d3yuff8FU2WX5Aed2bEJnIuQlB/XBCnF8i2aa2A5vEhbQF8GLUO8qVbxHN3nAGW3X
         xQOn6m4aXfNxY84sl9P7vVsoLL1pyZSUdIiDOSuco1QqHla6GCj88xEm4/1OQS1S9tvi
         Ya6KMnOghbcWCmWQfi3qWD7tGhIJWtK0E67gU7BVuhxYeLLuRjFrIfLGSEEblcTC1w03
         S+Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVXORagvR6WamQcNv3Lk9f8+4s5npsvwYujQ8jwamHEbwipwgj2QRaUPAA8Ue68LtiIJd7Xn7v4DfLh9EM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxthpKwnXUhtSyANnQnPHESoupj5c1iZ6Ezy0pwXPp5Icb2+zEZ
	329uHsPbP5zKMaNidFdNT84TkQmYVDzhymaXMRmBkZ5gbhZGoLro2yZlxvUO2f2Z1A==
X-Gm-Gg: ASbGncu9K0pHyKvh3AFjXpIVV7BwL+Btodvf8Cf7lwyHVKZgXlaZt2C8OHgf3+bWzmA
	H3l6jVCCAs578b6U4HTwinTe7jeJHp4sdm0/Bi4za+fibjp1k7j3FDj4cfhKyapeg6CY3hQYFMU
	8tA0RcHw//dH9YG9lHSqsvE1yMLl4BIz0sAE8tvYSPnkMP6uTap2+uF228i/7OGcZsk//Y79zst
	dUBHJD0laEgwTYq0/pOsoV8oiXrsu8vFKs7XMR3l6Tp2EMXmHdIupqgBBYmk/lQceHWa375b8xZ
	AVBxD72RnqSNUOR25O+/s+6H8N6X32GUaO2u9kd48lfRoehIP5qDSWOp7IubZsAVihB+3x7N1GR
	Hd2A8
X-Google-Smtp-Source: AGHT+IGaIIkTev/B5UEJVGSeX7xX1oX3gVRWMPdbwKe6ttPOQvsQWLp4rii4GvhcrE/sVorKmumxgw==
X-Received: by 2002:a05:6214:4b10:b0:701:894:2b91 with SMTP id 6a1803df08f44-70108942c74mr23152286d6.14.1751292993290;
        Mon, 30 Jun 2025 07:16:33 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772fc8f3sm67860476d6.84.2025.06.30.07.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:16:32 -0700 (PDT)
Date: Mon, 30 Jun 2025 10:16:30 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>, Christoph Hellwig <hch@lst.de>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <e908261b-2acd-46ac-b3ef-92691eb50f88@rowland.harvard.edu>
References: <20250627101939.3649295-1-xu.yang_2@nxp.com>
 <20250627101939.3649295-2-xu.yang_2@nxp.com>
 <1c4f505f-d684-4643-bf77-89d97e01a9f2@rowland.harvard.edu>
 <wddmyx4lccthln7mbngkd4zbh6y7mwetdba5e7ob6u4xevecmj@zopp65eqbeuu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wddmyx4lccthln7mbngkd4zbh6y7mwetdba5e7ob6u4xevecmj@zopp65eqbeuu>

On Mon, Jun 30, 2025 at 04:18:51PM +0800, Xu Yang wrote:
> > Also, the material that this routine replaces in the uvc and stk1160 
> > drivers do not call flush_kernel_vmap_range().  Why did you add that 
> > here?  Was this omission a bug in those drivers?
> 
> According to dma-api.rst:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/tree/Documentation/core-api/dma-api.rst?h=linux-6.15.y#n664
> 
> "Once a non-contiguous allocation is mapped using this function, the
> flush_kernel_vmap_range() and invalidate_kernel_vmap_range() APIs must
> be used to manage the coherency between the kernel mapping, the device
> and user space mappings (if any)."
> 
> Possibly the uvc and stk1160 missed calling it, but since they won't be
> the only user of the USB core, so we'd better call these APIs.

Documentation/core-api/cachetbl.rst says:

  ``void flush_kernel_vmap_range(void *vaddr, int size)``

       flushes the kernel cache for a given virtual address range in
       the vmap area.  This is to make sure that any data the kernel
       modified in the vmap range is made visible to the physical
       page.  The design is to make this area safe to perform I/O on.
       Note that this API does *not* also flush the offset map alias
       of the area.

  ``void invalidate_kernel_vmap_range(void *vaddr, int size) invalidates``

       the cache for a given virtual address range in the vmap area
       which prevents the processor from making the cache stale by
       speculatively reading data while the I/O was occurring to the
       physical pages.  This is only necessary for data reads into the
       vmap area.

So invalidate_kernel_vmap_range() is not needed for data writes, that 
is, for OUT transfers.  And ironically, flush_kernel_vmap_range() _is_ 
needed (but only for OUT transfers).

On the other hand, Christoph may think these call should be included 
regardless.  Let's see what he recommends.  Christoph?

(Actually, I would expect dma_sync_sgtable_for_cpu() and 
dma_sync_sgtable_for_device() to handle all of this for us 
automatically, but never mind...)

Alan Stern
