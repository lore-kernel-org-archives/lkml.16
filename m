Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6320714375D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744032744; cv=none; b=Zw7j+ZlU5L0OW2QBoVLndsFXR4xV64AEhtWdF9xxBEfNPgiBcr6EdFrLsobyQTwXrTCzxvWQByCAc18zD5x9h4OzpPtFdQUdBCdVJ7EFAFABiWCx42kG6L0Z4B902FUXLURvOCkQmOz0Yqwnswc/1Bf5Oa6liNzhmfx1ZsdLQJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744032744; c=relaxed/simple;
	bh=OuqnqTBRovbLLVo3HjN6qkc40vRHSouYVZwbCzzmelk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AR03DhoFTwXG8amexVcHsNzrg2KdznASdzte2UasNOT/hHETy/GMbs0Xwkt36efZfGh/rb1yqIYYJ2AdqnexUuZSZJ3/BWCLEJsGtcAjll+y0c2/bOj1jCiQHI8j7YKoMcRvlNBsP0tylcVWK0rrtIk8DqKATLPL5l4V1jREieQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bu18Xcur; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bu18Xcur"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744032741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h2t9badq02L1YqSPP4iwtiUyd5ByYzFMz5Gq8uEjc+Q=;
	b=Bu18XcurxNver99YdXdYY05n8jhXc5dsOvnitZxQyEcTVLHXO5ZiTlDqQI1OhVyWRtIm9N
	slLNn+MGff03KBwVI6mwsPFnQB6x+9Ed5SPK/Yx+TU9/iRjwHfk5F/uaKRvUVr9IgnEI/p
	8x0wnm84zXReKg4bnf8fuGHCnuzQBBI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-LA-c0AbbM46pQiANXkW3IQ-1; Mon, 07 Apr 2025 09:32:19 -0400
X-MC-Unique: LA-c0AbbM46pQiANXkW3IQ-1
X-Mimecast-MFC-AGG-ID: LA-c0AbbM46pQiANXkW3IQ_1744032738
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3913aea90b4so1776755f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 06:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744032738; x=1744637538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2t9badq02L1YqSPP4iwtiUyd5ByYzFMz5Gq8uEjc+Q=;
        b=AO17W21Fj6NcrvUrrRoWCTOI7kNGZZSIBY8QCd4ngHBICNWHH/qTai1mBGmJ/3jpeO
         yAAh05uk+cNxR4Y4iazrtCG/1G9OqUT8WhqxY8qeFQ1cXVR3zcoJ8AQvV00UEyDXB4ZI
         kX9+NzwKv8HYjQMb7Vcmzop+N7eFI6n407ZiqzDU5/rVpu6m3ahG+N8Gu7njznUwowpG
         LI00LLH+t7a5yG12E+xxMsiLxsTQXkNYbiC8yKib5JjLONLIR9siWS+spCaPn5GiAQ+e
         v38No3tiCeJ3HtEv1Qnan9rAYbwVjxKOY3YeBhhUNqC+hAAZP4gJBhxle2h5L75NlC/5
         Snww==
X-Forwarded-Encrypted: i=1; AJvYcCVd1zhA3gHLhRGx+qeQoVuEJ2uu0qnbm6lH2zuxHifUTn/PZsBwkHxDNIQ1jqulM8tE3b8sw7jRviKReOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnYU4dmiMWVpsssMfZVAYuu4UlkGF7U7P9lG+9z0Hd9/IgL1Kg
	TcO+ei4qg+qaiH+m+dj9Jj/5VlTYMDXOF3ds9OHrB7gj4d3jUHZ5xJfMBeUXXwzonocp/TVnT9W
	s4Yw+qw/9mk5zZ6b64+C0Tet1ccDRL6FmBJp7d8URohtdnMq/43pxe9oYBQiZnQ==
X-Gm-Gg: ASbGncuCw+CW5ajDX8oqd4Lj2yeZz4FglYwR/OZnm3Uls4GaLRIWk57luH9/uDyhOpC
	UwgYakPMCUUZBm26a2MzwpxHYSor5KbKQ7FVCZj0DNWv40XzwPaF14rjZoeCp6hYDbjIRGPx2Cz
	xu34PPfhaGo+p1UlYbYm9QpzVS14hEapwmblAPMG8SrcgPRy1pdBJnEYSFpTjDcS3ypYy6hlNNf
	7Qnhi2JBHC2j2MF6LJn3xAt+9JmogE1t7QCwIgNz3Kf8GyQyOdnYKZLlTM89kCrgJlRiWqJ0Fxn
	fo2+rf6pEg==
X-Received: by 2002:a5d:64cb:0:b0:391:3f64:ed00 with SMTP id ffacd0b85a97d-39d6fc4e930mr7966140f8f.26.1744032738424;
        Mon, 07 Apr 2025 06:32:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvXFTZnDhg+4j5062m2TfC0SmlVES+KRW+YMFO/ahaSOai2rwVuCa6Gs1wgPmSJN+hQ8wtpg==
X-Received: by 2002:a5d:64cb:0:b0:391:3f64:ed00 with SMTP id ffacd0b85a97d-39d6fc4e930mr7966079f8f.26.1744032737999;
        Mon, 07 Apr 2025 06:32:17 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020da49sm11908898f8f.80.2025.04.07.06.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:32:17 -0700 (PDT)
Date: Mon, 7 Apr 2025 09:32:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
	virtualization@lists.linux.dev, kvm@vger.kernel.org,
	Chandra Merla <cmerla@redhat.com>, Stable@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Wei Wang <wei.w.wang@intel.com>
Subject: Re: [PATCH v1] s390/virtio_ccw: don't allocate/assign airqs for
 non-existing queues
Message-ID: <20250407093047-mutt-send-email-mst@kernel.org>
References: <d6f5f854-1294-4afa-b02a-657713435435@redhat.com>
 <20250404160025.3ab56f60.pasic@linux.ibm.com>
 <6f548b8b-8c6e-4221-a5d5-8e7a9013f9c3@redhat.com>
 <20250404173910.6581706a.pasic@linux.ibm.com>
 <20250407034901-mutt-send-email-mst@kernel.org>
 <2b187710-329d-4d36-b2e7-158709ea60d6@redhat.com>
 <20250407042058-mutt-send-email-mst@kernel.org>
 <20250407151249.7fe1e418.pasic@linux.ibm.com>
 <9126bfbf-9461-4959-bd38-1d7bc36d7701@redhat.com>
 <87h6309k42.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6309k42.fsf@redhat.com>

On Mon, Apr 07, 2025 at 03:28:13PM +0200, Cornelia Huck wrote:
> On Mon, Apr 07 2025, David Hildenbrand <david@redhat.com> wrote:
> 
> > On 07.04.25 15:12, Halil Pasic wrote:
> >> On Mon, 7 Apr 2025 04:34:29 -0400
> >> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >> 
> >>> On Mon, Apr 07, 2025 at 10:17:10AM +0200, David Hildenbrand wrote:
> >>>> On 07.04.25 09:52, Michael S. Tsirkin wrote:
> >>>>> On Fri, Apr 04, 2025 at 05:39:10PM +0200, Halil Pasic wrote:
> >>>>>>>
> >>>>>>> Not perfect, but AFAIKS, not horrible.
> >>>>>>
> >>>>>> It is like it is. QEMU does queue exist if the corresponding feature
> >>>>>> is offered by the device, and that is what we have to live with.
> >>>>>
> >>>>> I don't think we can live with this properly though.
> >>>>> It means a guest that does not know about some features
> >>>>> does not know where to find things.
> >>>>
> >>>> Please describe a real scenario, I'm missing the point.
> >>>
> >>>
> >>> OK so.
> >>>
> >>> Device has VIRTIO_BALLOON_F_FREE_PAGE_HINT and VIRTIO_BALLOON_F_REPORTING
> >>> Driver only knows about VIRTIO_BALLOON_F_REPORTING so
> >>> it does not know what does VIRTIO_BALLOON_F_FREE_PAGE_HINT do.
> >>> How does it know which vq to use for reporting?
> >>> It will try to use the free page hint one.
> >> 
> >> First, sorry for not catching up again with the discussion earlier.
> >> 
> >> I think David's point is based on the assumption that by the time feature
> >> with the feature bit N+1 is specified and allocates a queue Q, all
> >> queues with indexes smaller than Q are allocated and possibly associated
> >> with features that were previously specified (and probably have feature
> >> bits smaller than N+1).
> >> 
> >> I.e. that we can mandate, even if you don't want to care about other
> >> optional features, you have to, because we say so, for the matter of
> >> virtqueue existence. And anything in the future, you don't have to care
> >> about because the queue index associated with future features is larger
> >> than Q, so it does not affect our position.
> >> 
> >> I think that argument can fall a part if:
> >> * future features reference optional queues defined in the past
> >> * somebody managed to introduce a limbo where a feature is reserved, and
> >>    they can not decide if they want a queue or not, or make the existence
> >>    of the queue depend on something else than a feature bit.
> >
> > Staring at the cross-vmm, including the adding+removing of features and 
> > queues that are not in the spec, I am wondering if (in a world with 
> > fixed virtqueues)
> >
> > 1) Feature bits must be reserved before used.
> >
> > 2) Queue indices must be reserved before used.
> >
> > It all smells like a problem similar to device IDs ...
> 
> Indeed, we need a rule "reserve a feature bit/queue index before using
> it, even if you do not plan to spec it properly".


Reserving feature bits is something I do my best to advocate for
in all presentations I do.


-- 
MST

