Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA0524168C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743666077; cv=none; b=f3U0Bm+1l4MxUcuX7qNaLI2AjWiFM1XSVylh6G0dftw2kb2YcUou26MOsOxiLrciZRQLTVQ4X9KXs17S91XAf+ZurLzBPGJj2RLUB198bu7ZH8B7i4yXS0I1po5idNdVdoq08SetOjI13VeVStZc74TT40cOmETQ9w1tX7vY1Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743666077; c=relaxed/simple;
	bh=25T0zLiPjjmRccxznZ6hVtl9tNY8Y/7QpUJr9j/iJDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GeRdV+J3hByuo5y9ypaouwZSrqDe6JWmbJ1BvQmVzRXl26ADIrX53anklZWVrmEItw80lSPecqY6SRmuc2vZB34WcssYblCZgSn9EMh9QTeva6H7XlVhtim8gqhgmemRoAAm4AlOOqFYlPqaK6nX0jUnWFi6wpInZNDMy/FGzGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OmhPEWnG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OmhPEWnG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743666074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YsHQHBiG6tulNIHiAAXN4nykT9AuDVNrTCzO2FAQEVQ=;
	b=OmhPEWnGyI/fFLk6xqLf5kxH/s6JkMYpYqJ6C52tgU1hm1YxSh0k0Qf4I2WREAP+61mXVm
	cfGaPNBpJnywW09tLGmxX4dhdOIBO/523C5Bo1cKK3icFAc+ZktoL7gOKeqF2pVX+uHHKQ
	kbU2bMJOq+Xj7jk6wkSMbrFrcD54vvw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-_YxB-Rk-OLmvLpE0eNc6fA-1; Thu, 03 Apr 2025 03:41:13 -0400
X-MC-Unique: _YxB-Rk-OLmvLpE0eNc6fA-1
X-Mimecast-MFC-AGG-ID: _YxB-Rk-OLmvLpE0eNc6fA_1743666072
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so4117305e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 00:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743666072; x=1744270872;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YsHQHBiG6tulNIHiAAXN4nykT9AuDVNrTCzO2FAQEVQ=;
        b=GMTNyY2MHMW82Ytu50P2o9I5LRZ+ul50JWvqrH/cQh64eQE8ApEyF4/nZvq1z1Mmvi
         45E+lwAp+E2w0mYtI3AOHG+kty3O78mlTSC2hFMJ4xQRpEZlnv8kVcOtB4hlnBKBYsks
         lA3+lSzRwfrjY7w+pE/NnnTBkigD1F21qWKsolQkfVrr8OAxG8zEcyYEnLLCVeHCBl3d
         2O4Z1DFRwrruB39WLq5UswFQTqDjDUMZXgMKpvVc1BcX1XZniQpru7BCIIpYzyeXv/bm
         HXXZNkNWHrbqr3uj/L48YxvYwPxaRNofDk9zFPibT973mdnffHHY6rNIh2G9ctz4vMaf
         v6rA==
X-Forwarded-Encrypted: i=1; AJvYcCVXVpiqB+AkJGknCYbMhSUXtizKrFAE+omcXzTzF5My0qglUlwYVmkr004vyqaI0q02dydZHiYaT1Zrzg4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSKrupTI0zqnUAJv4I+tJszPu5pBJWmGSClJQWOvLlp2E4N3XR
	tG8LUN/j1lyVkMXJKGan5E4/dhuljn+rgQVcBmWMrjgOtCuXFw70+FdDf1/1ZbqfeIGWoHLxTFo
	96dIXCBK65marg0HgjiKX1smx4LKhwRig6ViuOzG1r2xfdW3UoWITNnPXcTEHMg==
X-Gm-Gg: ASbGncvseqKtGIcnHXYncaQGQiSO/5T8W2mCkdlVjp+h94LUTgyURjV2j/5wmcd3RIJ
	CUY9H++zqMr7zCBE5bp3CSGAI6giyYuPCJZPp4BQwVnvpXSVfHawhm7qQowHTbJ8+a8rUe6WUNF
	rkvMWQB4bzA5k1yrxksRbikKRFQmo8+0Hfdd/0vA8bLxXXmHycRzEmqCoJkoKvm3CWGbbAWa5wr
	fYUWJLph54s+l0xKqBGOvbPVzr2HQZGZI2K34meHfBywH8BWmCPQuZXA09JkWOIxX+1Vu5d+iG3
	0zYH6Yq8cA==
X-Received: by 2002:a05:6000:40cf:b0:399:728f:4673 with SMTP id ffacd0b85a97d-39c120e16eemr15115152f8f.33.1743666072063;
        Thu, 03 Apr 2025 00:41:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnvafJAH+8TfArDwP/Nvb4SzZ5wvrw3ycX4BDCMIdLZDuq8uvGMqikpgn6W8ST3vCvAhmEdw==
X-Received: by 2002:a05:6000:40cf:b0:399:728f:4673 with SMTP id ffacd0b85a97d-39c120e16eemr15115127f8f.33.1743666071664;
        Thu, 03 Apr 2025 00:41:11 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d66csm1039872f8f.63.2025.04.03.00.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 00:41:11 -0700 (PDT)
Date: Thu, 3 Apr 2025 03:41:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>, virtio-comment@lists.linux.dev,
	Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
Message-ID: <20250403033819-mutt-send-email-mst@kernel.org>
References: <20250402105137-mutt-send-email-mst@kernel.org>
 <19ba662feeb93157bc8a03fb0b11cb5f2eca5e40.camel@infradead.org>
 <20250402111901-mutt-send-email-mst@kernel.org>
 <6b3b047f1650d91abe5e523dd7f862c6f7ee6611.camel@infradead.org>
 <20250402114757-mutt-send-email-mst@kernel.org>
 <965ccf2f972c5d5f1f4edacb227f03171f20e887.camel@infradead.org>
 <20250402124131-mutt-send-email-mst@kernel.org>
 <eaef09ab218900a53347987a62fee1787283d9ed.camel@infradead.org>
 <Z-44wXdyia4RC6Cr@infradead.org>
 <06465bcf4422d088df2a0ce9cdb09767dac83118.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06465bcf4422d088df2a0ce9cdb09767dac83118.camel@infradead.org>

On Thu, Apr 03, 2025 at 08:37:20AM +0100, David Woodhouse wrote:
> On Thu, 2025-04-03 at 00:29 -0700, Christoph Hellwig wrote:
> > On Wed, Apr 02, 2025 at 06:10:53PM +0100, David Woodhouse wrote:
> > > > I know a bit more about PCI, and for PCI I prefer just not saying
> > > > anything. The platform already defines whether it is behind an iommu
> > > > or not, and duplication is not good.
> > > 
> > > Not a hill for me to die on I suppose, but I would personally prefer to
> > > spell it out in words of one syllable or fewer, to make *sure* that
> > > device and driver authors get it right even though it's "obvious".
> > > 
> > > After all, if we could trust them to do their thinking, we would never
> > > have had the awful situation that led to VIRTIO_F_ACCESS_PLATFORM
> > > existing in the first place; the legacy behaviour we get when that bit
> > > *isn't* set would never have happened.
> > 
> > You'll need to define the semanics for VIRTIO_F_ACCESS_PLATFORM only
> > then.  
> > 
> 
> You mean the semantics for VIRTIO_F_ACCESS_PLATFORM only, without
> VIRTIO_F_SWIOTLB? Are those not defined already?
> 
> > An the only sane answer there is: don't allow non-translated
> > regions at all an in a broader sense stop people to use
> > VIRTIO_F_ACCESS_PLATFORM at all or at least for anything that requires
> > a new feature bit.
> > 
> > > > For mmio it is my understanding that the "restricted" does the same
> > > > already? or is it required in the spec for some reason?
> > > 
> > > No, it's exactly the same. But I still don't trust driver authors to
> > > realise the obvious, or VMM implementations either for that matter.
> > > 
> > > I'm not sure I see the *harm* in spelling out explicitly for the hard-
> > > of-thinking.
> > 
> > Write a whitepaper than and explain how it maps to the existing perfectly
> > working features.  Note that VIRTIO_F_ACCESS_PLATFORM just like
> > everything in virtio would actually benefit from being turned into
> > proper spec language, but anecdotes about random use cases are not
> > helpful.
> 
> Hm. I was just trying to point out what seemed obvious, that when a PCI
> device does 'DMA' to an address region which is actually within one of
> its *own* BARs, it isn't going to reach the PCI bus and get translated
> by an IOMMU. If it's causing this much contention, I'll just drop it.
> It didn't *change* anything anyway, except hopefully avoiding bugs in
> implementations.
> 



If you want, I would just spell this in the transport text then.
"Note that on most existing platforms,
 and since the BAR is part of the device itself,
 access controls generally to do not apply to device accesses there,
 and this is true even when VIRTIO_F_ACCESS_PLATFORM has been negotiated".

