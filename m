Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23375244EAB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 12:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744028089; cv=none; b=I+erEAUqnv/ffh91C3KkqVDMQMcWiHoYrMcAoOomH1B6TmDHgfi6g9TK5ln4kJrO1Rd62iJrEu5C8POOx9nYF+smaiU5b9zxVqcfOwmwFSIvzP4NWln4vuUxc/4BW6xgH6KBsUWTGri2Q9Mtzt5m8CEa1+Qc4GYvITK3RWJPwyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744028089; c=relaxed/simple;
	bh=SJloMABJ9TFapxZzUuoSPn8M6mfm+kJt9tZS7KDLG1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uoAxwSXbDD+PAr9W6ZkLkIFITyFxOa2scOWuy16MVQsYTlGRMOqbE+Vgo/kc9BDArm53JtkLD++MbTJKf1ln39xYqcPmoieJ3l5KAfjCeq8BUY1fYSFEQc2y60QKcVcBTRlCbS9hP4gUIn3MHtZl7vTGetDQopu84ncvQEwNSiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c6D5FcEJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c6D5FcEJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744028086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hQ0sePM8qDTqbXQLkavIPlwoEXkE0hK7tfvWemHOezo=;
	b=c6D5FcEJNMC3NAEZ6R5jMZ2MZGZVBZTCVePnAr2Bi+uDdJLA2Q8SRDpbcqJ2PEg7403e3I
	WPspHaZkGYfQQEm5dI1NzOeelKftfkd0qtJpv9jG/OLgYR32pfdBq6GfEtBsmGmIrmBo4C
	Bb0G5dt+37qN4r+sIb3aMaaNqnXjdAg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-gDrDM_cfPeuzYKG82RkSbw-1; Mon, 07 Apr 2025 08:14:45 -0400
X-MC-Unique: gDrDM_cfPeuzYKG82RkSbw-1
X-Mimecast-MFC-AGG-ID: gDrDM_cfPeuzYKG82RkSbw_1744028084
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39979ad285bso2547709f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 05:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744028084; x=1744632884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQ0sePM8qDTqbXQLkavIPlwoEXkE0hK7tfvWemHOezo=;
        b=vYbih0P5E558QJ+mA91QNC1B5AV40zIti9Y1riXKvqCZXNa5hoNQZt/w/JkjpgwjDP
         zlJ7/DbBSUT5ETAkctbU0TV4HOx60JLg7DkX8nOFigxIcw1JoNQDQBNh+W68HBBNbIdg
         HjHUeCACgeCKp3YPSvJyBumrGKSsOpQPTTU9eAC51V6N3xdv/FfXIwvvAZnZszbCyStX
         8ve16DbwjP+yNIazhQR6p5huXz+eyRCitPhXQ+4TS86BREd8WtknvO8V+VXvn0Zysros
         zon3urUF/8UDou9g50DVk6HGmLl6Prcty2Hnfe7uNvrzbmAcXgkWnaS8T6OMnPuEUSp9
         3ZqA==
X-Forwarded-Encrypted: i=1; AJvYcCV0xcXRBNpO84wY60HtWwldiLvBBftSx2fFLiPepXSJnZlYqcniK5kqB7sKvPOfLdBxr4IFmFwMHOziK3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwL5kVCixCkdfyhLxiDc+zsln6Rekx/CzFeiQJ8iZ3MjJHLdPr
	HqdQysa0JI+ZSXQkjsVnlZmMSCkqpzCLeqxrxTVjNgewiUSJ+oCWnUtZ6XV27kaB1SV2QNUayve
	cX+yEjsbOI88tuGg+g9O3CANBVYLP7EV8uwIsrz0TTWk/iCRqJeQcjTuefCPcdQ==
X-Gm-Gg: ASbGncu0pzThu+d3mJZFP5NGcgAC3JDzkMx5uuZltvKDtxGkucxGf0bO1E/MzpTY1xw
	NJJVhwmU5LUByhrKNcsW7q45PywjFywKX+jw4xiPIaB/y27PVSNM8OvxYzxBnskYzdcgBouW3lV
	I4Ba90I4JhoUZ7iJ9q6x6PSd0XLeOx6atxv/Um7Jyurn5fgtUDOYH3U39nViaGpZoevyX6vfLT9
	F3fSTo0FvaOHi29jtavFtlLe1NFoVbNZo9WjNsi/E08YuNEj07HYgg6SJSHTad1sIU/OFdFmO0u
	gm2sQFtzUg==
X-Received: by 2002:a05:6000:2407:b0:39c:1efb:ee8a with SMTP id ffacd0b85a97d-39d0de67a97mr9877460f8f.38.1744028084297;
        Mon, 07 Apr 2025 05:14:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSEq8KBA9rhmZRWPej572rfLMWFkXKUPOcxbVa6ScLXY4TTA4hiqQZurNAgf4uQ4V5gUn8iQ==
X-Received: by 2002:a05:6000:2407:b0:39c:1efb:ee8a with SMTP id ffacd0b85a97d-39d0de67a97mr9877441f8f.38.1744028083951;
        Mon, 07 Apr 2025 05:14:43 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226a07sm11678907f8f.84.2025.04.07.05.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 05:14:43 -0700 (PDT)
Date: Mon, 7 Apr 2025 08:14:40 -0400
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
Message-ID: <20250407081110-mutt-send-email-mst@kernel.org>
References: <05abb68286dd4bc17b243130d7982a334503095b.camel@infradead.org>
 <Z-99snVF5ESyJDDs@infradead.org>
 <fb7ea3ee5bf970fa36b012e16750f533b72903a0.camel@infradead.org>
 <20250404040838-mutt-send-email-mst@kernel.org>
 <67bd998bfe385088ef863342b9f8714754585476.camel@infradead.org>
 <20250404043016-mutt-send-email-mst@kernel.org>
 <F30D33D5-38CC-4397-8DC8-9EE1B0FEF40D@infradead.org>
 <5cc2f558b0f4d387349c3a2936ff00430804536d.camel@infradead.org>
 <20250404062409-mutt-send-email-mst@kernel.org>
 <7fd789b61a586417add2115f6752ebec5e7b81bf.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fd789b61a586417add2115f6752ebec5e7b81bf.camel@infradead.org>

On Fri, Apr 04, 2025 at 12:15:52PM +0100, David Woodhouse wrote:
> > What I don't get, is what does the *device* want, exactly?
> 
> The device wants to know that a driver won't try to use it without
> understanding the restriction. Because otherwise the driver will just
> give it system addresses for DMA and be sad, without any coherent
> error/failure report about why.
> 
> (You could ask the same question about what the *device* wants with
> VIRTIO_F_ACCESS_PLATFORM, and the answer is much the same).
> 
> Or maybe not the *device* per se, but the *system integrator* wants to
> know that only operating systems which understand the restriction
> described above, will attempt to drive the device in question.
> 
> We could achieve that by presenting the device with a completely new
> PCI device/vendor ID so that old drivers don't match, or in the DT
> model you could make a new "compatible" string for it. I chose to use a
> VIRTIO_F_ bit for it instead, which seemed natural and allows the
> device model (under the influence of the system integrator) to *choose*
> whether a failure to negotiate such bit is fatal or not.

Let's focus on the mmio part, for simplicity.
So IIUC there's a devicetree attribute restricted dma, that
guests currently simply ignore.
You want to fix it in the guest, but you also want to find a clean way
to detect that it's fixed. Right?

And if so, my question is, why this specific bug especially?
There likely are a ton of bugs, some more catastrophic than just
crashing the guest, like data corruption.
Is it because we were supposed to add it to the virtio spec but
did not?

-- 
MST

