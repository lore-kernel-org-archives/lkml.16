Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CEC137C2A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743612236; cv=none; b=SM8ZUQ6Zm8i7rQ7dCWfp+ecims1t29gRr5E+yCTKtCSAQB87ptbc6kmN0pYN/B9/s/93sGHEU/8v+iGUESu1SGPyRRFLSYhT1IU9jaYzFg5pjadsMz0Z8ioxjohQGzDN7OYM1+gj+W3E1K+TJcYMppxOvHKBzcab+Og1STt4kx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743612236; c=relaxed/simple;
	bh=iQY+6g0BmpbaD8MfkzQbFz6UlXW6t2eBdTbgfZwYfJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCOlz93eC8j/YzQPoH4k9ET13qpfMA8KFCx9qN9ZAhuIGWqOchkKPeZM1+bEKIar25NJDBbW1dErN3YEDVySkSrS6cdNmJO9XeWmE1D9Um84q9ZNtcO5f9KvZERMU4SU/9i02JzYfsAn/Q4ag+b3v/Eym+TmhVpurKSYed3ceKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ettY4B7U; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ettY4B7U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743612233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YeSTKdZVyyzbJFFy/rsJd54pLFQsVU38OTGQV8/31gI=;
	b=ettY4B7UcarxsmEaF7n4i3b/rtvBcvpUSJ0kQnbIU79qMPnUwDVirV3GgLpt9EyU4QuKot
	4t6B0f3KPNIeASujQYZwK8w4Cnvgudrt9EWmGktP2jTBhmO7etb5f4mrJ9+tuErBDIIRU4
	oD+E24/b8eGProjKn4wrvBK9Rgitegk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-NVNXev06MD-4KOMPw4jJgA-1; Wed, 02 Apr 2025 12:43:52 -0400
X-MC-Unique: NVNXev06MD-4KOMPw4jJgA-1
X-Mimecast-MFC-AGG-ID: NVNXev06MD-4KOMPw4jJgA_1743612231
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5e6a340f8c7so10245a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 09:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743612231; x=1744217031;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YeSTKdZVyyzbJFFy/rsJd54pLFQsVU38OTGQV8/31gI=;
        b=Rcwk3Kmoh7tPUvSfcAYHvw5EAHtzwNzpJCvqX8wx9IbbUYUHAKNUy/WMflt/hOW/I4
         9DDY9TSPdBD6iHW1VkzGorW6467PkeFpBlQaKklXUIWqO4vEeZ5LL2o95AtKy04aMjPZ
         xV0Mk/XF4w9rcqYVYjWWX6JpO8Bwt5BacBBuYafXNJdVRyyjOGJBBMVEGTsUpRselmcF
         0k70Qoe+upitJMcnlieLO0VPmsSUkO+7iwL1m9F/VPVL2ZybDdGFRcL/WS0Q9rHpZ9Gp
         PNQerY2mxKhkcWU4BYTxGIyxWjNLDfOOzGWzQ8+ju0Mox/OfHcEpjmh8CW8TNfTmBoZZ
         p+/w==
X-Forwarded-Encrypted: i=1; AJvYcCX3eBIDtikP0fgHRqeOAscSV+0RU3m/L9/D/vuR1UsfNVt0AYiglCZbE7X8sFdowrGXXYvPtRUyhss6eYk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzchnjfw3BgDL0+XWRVhySTGZl8lo4fliEsWYe1eaNli6z31Ymg
	R/IIU3EFfvwUIP02R/uTQRfdBZzo97fj08DJKWsLjwwd0zWz5s8p44KpUZc6jN8ER5nIJEsCiIq
	63+kW1ahVktNVWV92vA3fvytM0DH8sXqWFEk2+/bt6H73PwFMDaC1fu+vbRqCHg==
X-Gm-Gg: ASbGncuhqIFETa0kXhLWFRCNdmTeJOpbRnyAbXE4E2cFFau6Uxj1AxcAdKu++C8xUfx
	zC4XCSSkksiPVs04zr3cJNKGF75RvS0N1JwsofJXfS3gv1sOeVoD/xfYBumqO/+slYOlvZWzZDP
	RXYZKkWEVel39oiQjBM7kq6CNYHHIQv9JvR2/DH+KcWmTGIcm4fE0feDkJoR857ZUd/N0dr/qRh
	zFLwkkIIrQMAG6bo4/EFkIrGRe/7QOr8si6Bwd5CA5QaMRbtPaOnw1iCITGdVmBXm/jr3dSlhM0
	d+FzhWKHgw==
X-Received: by 2002:a05:6402:3604:b0:5ed:1400:f879 with SMTP id 4fb4d7f45d1cf-5edfdf1c140mr14341537a12.32.1743612231283;
        Wed, 02 Apr 2025 09:43:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGesprQ+9pczctecRSfjK0ZQ9vGuaIFPNBThEHmQLbDLgGhL8lnXWSb9uDROnuC2kC47MqVsg==
X-Received: by 2002:a05:6402:3604:b0:5ed:1400:f879 with SMTP id 4fb4d7f45d1cf-5edfdf1c140mr14341525a12.32.1743612230961;
        Wed, 02 Apr 2025 09:43:50 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16f213dsm8798770a12.44.2025.04.02.09.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 09:43:50 -0700 (PDT)
Date: Wed, 2 Apr 2025 12:43:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: virtio-comment@lists.linux.dev, hch@infradead.org,
	Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
Message-ID: <20250402124131-mutt-send-email-mst@kernel.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
 <20250402105137-mutt-send-email-mst@kernel.org>
 <19ba662feeb93157bc8a03fb0b11cb5f2eca5e40.camel@infradead.org>
 <20250402111901-mutt-send-email-mst@kernel.org>
 <6b3b047f1650d91abe5e523dd7f862c6f7ee6611.camel@infradead.org>
 <20250402114757-mutt-send-email-mst@kernel.org>
 <965ccf2f972c5d5f1f4edacb227f03171f20e887.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <965ccf2f972c5d5f1f4edacb227f03171f20e887.camel@infradead.org>

On Wed, Apr 02, 2025 at 05:16:28PM +0100, David Woodhouse wrote:
> On Wed, 2025-04-02 at 11:51 -0400, Michael S. Tsirkin wrote:
> > On Wed, Apr 02, 2025 at 04:47:18PM +0100, David Woodhouse wrote:
> > > On Wed, 2025-04-02 at 11:20 -0400, Michael S. Tsirkin wrote:
> > > > On Wed, Apr 02, 2025 at 04:12:39PM +0100, David Woodhouse wrote:
> > > > > On Wed, 2025-04-02 at 10:54 -0400, Michael S. Tsirkin wrote:
> > > > > > > +  If a the device transport provides a software IOTLB bounce buffer,
> > > > > > > +  addresses within its range are not subject to the requirements of
> > > > > > > +  VIRTIO_F_ACCESS_PLATFORM as they are considered to be ``on-device''
> 
> ...
> 
> > The text you wrote makes it seem that even if the platform says use
> > an IOMMU, it should be bypassed.
> 
> It was trying just to state the obvious, that addresses within the
> range of the *on-device* memory buffer are not handled by the IOMMU.
> 
> > I would drop this text, and maybe add some clarification in the mmio transport,
> > as needed.
> 
> It would be PCI too. I guess we could move the "obvious" comment that
> 'addresses within the range of the SWIOTLB bounce buffer region are
> considered to be "on-device" and are thus not affected by the
> requirements of VIRTIO_F_ACCESS_PLATFORM' into *both* the MMIO and PCI
> transport docs? But then it's basically just saying the same thing in
> two different locations?
> 
> I don't think we're debating what the actual implementations should
> *do* ...  are we? To me it's obvious that what I'm trying to say here
> *should* always be true.
> 
> We're just debating the wording and where to put it, yes?

yes.

I know a bit more about PCI, and for PCI I prefer just not saying
anything. The platform already defines whether it is behind an iommu
or not, and duplication is not good.

For mmio it is my understanding that the "restricted" does the same
already? or is it required in the spec for some reason?



