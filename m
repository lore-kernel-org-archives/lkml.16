Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA5E248891
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743686358; cv=none; b=SedQSRab6dusp129RCXup8l7o1NE1fg9lXColEhn8i91QWeGEnbR5p9FgaoTqxp69lnNvO9v5SIh2jYFNdJxEskYxbbi/tLfAtWwUzb/ppqE4T3i7FMK7KJF5Cpz0bRJhMRnBfx80izmw+Q2nFrwboqYRjOtcAWX92uWvKfsUOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743686358; c=relaxed/simple;
	bh=pBM+7JgyDGu4YR8uQCe5TEb+w7KOevzi9OMdtAtdnHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VoOJ+qQ1uZivD39rFOr+pqqfLddLNIaa3DDHc4Tpwlr4CgHzkvI8p3e5RB4ncgBDNZMgJWYu4hCYS5QO8bpcuL3a7mF4GY4OzlnFsrGGlSX+P1Z0FFC519NS9b9xUmgkQYW+XuzU3O6rVTvVmKMUAH0LekZNZ4ajV93/vsgYoWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cEBKRyCL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cEBKRyCL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743686356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BOrAtcAueaZ6B6FDQZAZjfu8K5muW00T7yncBSAZv20=;
	b=cEBKRyCL8z3U7lcptgKMcZ7du/Anwwl7mgJH+HKryXIlXGoPLZ7ES2UuaK88UseFCkwkpr
	u/buu/cWiZfri9bLaZgU+yoHfmYJ5b4v/KZTf9UGUw9160CvP6MHEZI40naykm9CWgEObm
	RpV8qgCzfqEc5U77JEvMM5Tm+NiGWlw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-HFKSpAVxPBWGKrN9BiAQcg-1; Thu, 03 Apr 2025 09:19:14 -0400
X-MC-Unique: HFKSpAVxPBWGKrN9BiAQcg-1
X-Mimecast-MFC-AGG-ID: HFKSpAVxPBWGKrN9BiAQcg_1743686353
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d08915f61so4774815e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 06:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743686353; x=1744291153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOrAtcAueaZ6B6FDQZAZjfu8K5muW00T7yncBSAZv20=;
        b=BIJ8xvY1UA96rj0Hukvw0M5quacSHMEsdU8Wc+LCI2xvbPan+DjvUKgmZBTPhMH4/j
         D/RJSTfaiIhmho32GOCEzDPQVkY484vKPAQ2YffNxNCbajms3SuHd/J17l6ybwS39nuD
         iWwDBcWAfBdsgBMJfFLWu4TVNfOFk0bve374GsGrVJkCibxqIntrext+0JHiN6XlR5uf
         56aJOaSrXT3eZ714J+Py9PGSYlvttAa8AJniP/j6wHo+6f6Aml5EAu02caa8oEepjphT
         xfbtwEsgt3NwVoMnCdPY125i4atcdagbUiwzs5UMpkcfktXhHk4NKAp/rtvW55TSJPEB
         v3PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ3XOTFKp5RVVX3BtsL5JL1go3lPVvM8S+c2B51RY9vOtgxRBaei6me10qsMX35uh9UkgG71l172SK2G0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/jYoqwmP9pBiuKU/mcyGTAvBwn2/AzyGbdu4jUvwqJDsEFz1U
	GBflXjy1puTPrc19HfLcRsN/Wm4KMStPUThFdIgWuMpICQgb1SAUbC3ThV3tEYwCYgl/H8ZaerC
	aZPrV3T4YVeJQ5Koi63k/1b2nZE6UAJGStaNOgejdIGaCb4NnqUh5IMuNpisxrw==
X-Gm-Gg: ASbGncu7RKpzkv8s5MLXvxl6vIAO/axryJMJ186y8p9SoK5Np1cM05V/8g83PTGAJYq
	Ic0tglI5wArN9h3bqRflLMWQea6nRWIaDahQRZsVOFw2P9JncCJnefGkwDnLc5eBq69IPiFN5tl
	DGEl+PdJWucnUtkbohX10BvOcvvW7HsNBemLH4JaVyulmzBNxDA37p5XxC6QZxl47P6+hUaodfC
	RzgFEFzSJ7OTfB5pZ7iU7dMU9yp2htyYvegg3O3nBo0fWu42+N17cQW8N7Ntj1zDI7mh0imsLZz
	yR33inBH4w==
X-Received: by 2002:a05:600c:1e23:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-43db61cebecmr203918765e9.7.1743686353436;
        Thu, 03 Apr 2025 06:19:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOQLbOwbt2ShKubtPKsLg6pCCONvIrC6z6dAjAq2IICAmhZBxQVjYeR7rxMt8jt3FmipcKTQ==
X-Received: by 2002:a05:600c:1e23:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-43db61cebecmr203918435e9.7.1743686353075;
        Thu, 03 Apr 2025 06:19:13 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16f1a73sm21744465e9.24.2025.04.03.06.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 06:19:12 -0700 (PDT)
Date: Thu, 3 Apr 2025 09:19:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Zhu Lingshan <lingshan.zhu@amd.com>, virtio-comment@lists.linux.dev,
	hch@infradead.org, Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
Message-ID: <20250403091001-mutt-send-email-mst@kernel.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
 <1966cbf1-a430-480e-a78d-3d6bbcb4ada4@amd.com>
 <20250403033230-mutt-send-email-mst@kernel.org>
 <59be937432fe73b5781ecb04aad501ae5a11be23.camel@infradead.org>
 <20250403040643-mutt-send-email-mst@kernel.org>
 <0261dfd09a5c548c1a0f56c89c7302e9701b630d.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0261dfd09a5c548c1a0f56c89c7302e9701b630d.camel@infradead.org>

On Thu, Apr 03, 2025 at 09:22:57AM +0100, David Woodhouse wrote:
> On Thu, 2025-04-03 at 04:13 -0400, Michael S. Tsirkin wrote:
> > On Thu, Apr 03, 2025 at 08:54:45AM +0100, David Woodhouse wrote:
> > > On Thu, 2025-04-03 at 03:34 -0400, Michael S. Tsirkin wrote:
> > > > 
> > > > Indeed I personally do not exactly get why implement a virtual system
> > > > without an IOMMU when virtio-iommu is available.
> > > > 
> > > > I have a feeling it's about lack of windows drivers for virtio-iommu
> > > > at this point.
> > > 
> > > And a pKVM (etc.) implementation of virtio-iommu which would allow the
> > > *trusted* part of the hypervisor to know which guest memory should be
> > > shared with the VMM implementing the virtio device models?
> > 
> > Is there a blocker here?
> 
> Only the amount of complexity in what should be a minimal Trusted
> Compute Base. (And ideally subject to formal methods of proving its
> correctness too.)

Shrug. Does not have to be complex. Could be a "simple mode" for
virtio-iommu where it just accepts one buffer. No?

> And frankly, if we were going to accept a virtio-iommu in the TCB why
> not just implement enough virtqueue knowledge to build something where
> the trusted part just snoops on the *actual* e.g. virtio-net device to
> know which buffers the VMM was *invited* to access, and facilitate
> that?

Because it's awful? Buffers are a datapath thing. Stay away from there.

> We looked at doing that. It's awful.

Indeed.

> > > You'd also end up in a situation where you have a virtio-iommu for some
> > > devices, and a real two-stage IOMMU (e.g. SMMU or AMD's vIOMMU) for
> > > other devices. Are guest operating systems going to cope well with
> > > that?
> > 
> > They should. In particular because systems with multiple IOMMUs already
> > exist.
> > 
> > > Do the available discovery mechanisms for all the relevant IOMMUs
> > > even *allow* for that to be expressed?
> > 
> > I think yes. But, it's been a while since I played with this, let me
> > check what works, what does not, and get back to you on this.
> 
> Even if it could work in theory, I'll be astonished if it actually
> works in practice across a wide set of operating systems, and if it
> *ever* works for Windows.

Well it used to work. I won't have time to play with it until sometime
next week, if it's relevant.  If I poke at my windows system, I see 

> Compared with the simple option of presenting a device which
> conceptually doesn't even *do* DMA, which is confined to its own
> modular device driver... 

I'm not (yet) nacking this hack, though I already heartily dislike the
fact that it is mostly a PV-only thing since it can not be offloaded to
a real device efficiently *and* requires copies to move data
between devices. But, let's see if more issues surface.


-- 
MST

