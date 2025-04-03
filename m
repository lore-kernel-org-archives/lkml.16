Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C4D241667
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 08:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743668048; cv=none; b=mVV0NZlB72yLy8fdwrC7kKhSQaGRhuSJU0S45RmaNTOUjDFaGg8TGkrv8qtQBMok8mTwzC5T+T81mpwCxeQyL/p+BZd3/5YYlV9rLyObeQmWmYmTMwRy97eobsAPWa3jk6kOUOJWzoJeArdyzPRuDLMCKrNMeaCsInOqbLm2oT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743668048; c=relaxed/simple;
	bh=8ljqiGcCt0GZtC0zTI0Y+omskizGFKR2m3xQkFkwDCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1HsCxZc6WH9u2NKQM0HTzeylhoukvzbw1gF9HiyqL2g/yxJBaWlf7ox+yzkrNDZOVxLqLhehRIt8KqOvXEDwk/9Dv+MHSeyx136thfHiydc86VnjvZF3op0LByQcV1l8BiU9VKg3bb946ArdIE+BJM1eGkOry8EWGwz6U3lD9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VGapH6aL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VGapH6aL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743668045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rzWYYjEiaRBeSb8Vj5o/F0qgZqnmjAeBb2PcLQ2qM0A=;
	b=VGapH6aL/O6sL7T2MYuSQGsL87RJ6SGo++b8d06OsRxXHbJ+z7jiaWmx3moT/R0/JpGtA0
	Lg2easatLTDmkLZbPpiL+X4U+nrRjjeV0b1082QGFFxfn1OFzyhBEzEZNEyt9QGMcSXqeX
	fkeQP4RRnYmWAcTO8bRic3gjx27sFqU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-HmYRnE6DNpWhbsr0LrjxKQ-1; Thu, 03 Apr 2025 04:14:04 -0400
X-MC-Unique: HmYRnE6DNpWhbsr0LrjxKQ-1
X-Mimecast-MFC-AGG-ID: HmYRnE6DNpWhbsr0LrjxKQ_1743668043
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43e9a3d2977so3904615e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 01:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743668043; x=1744272843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzWYYjEiaRBeSb8Vj5o/F0qgZqnmjAeBb2PcLQ2qM0A=;
        b=qssXBjCo5TaPV384Nm0dwTbvE4sNKBmSm8cLp/zKpfvAh8GRDAlIesNdQDb3fByYjM
         jjPLS3flXHhn8HXHihikw/M8OnxsbBMiSzie2OAj3Qzqi51AKVqNBnfpQC+GmLXhLJNi
         vzYqWpD78PpLmSXwD4/Mpao7weF+s6yVJv+vmS3kM5UGiLqNcZTby0REdGS75V66KXd5
         dbKlPi93yGwVeivt5n7JDdIWQNoUBwxc2wUXRDt6rcROcT/uIHhKwaYJjc4IQ0otHb8l
         RFqITSafsVaGi6aSLaDJ9Wt3F04WEWQRgrXJcc4LPEU55x8JMt32KomBzBqy+NvN69jk
         A0JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv90HCvKb2wFxnjfnoDEpgK09v1ANy4mGMAgHEz3YV+sZv1xI+53EtM5SLtyZ87v3hgZ94lYC6TrzfUbY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfY5TDDWQ3e/iM/fSv9NrTjN7a0/pvPrZtFAzJUkQl2IdMzYrz
	we0RQoxq+VN8Z3Cpebyzdyth5hsJxIc6P/quyvbmOC+vN4lEwZosMqq2WcZ1Nu93kwy9CGyALtV
	Jbi2eEAkHpZ8dz3lRbwvVy7/73ydNNKTGIPRwJRZFRpuyp3u83vHjSJeSHC4Z/Q==
X-Gm-Gg: ASbGncvj5yu0WV0MHn9qnV4pGktM5a2Hzw1C42MOw1B2QMgu5jKVlwYM8tzfuMLOq3v
	cwQsaHcA7btX4v2NEjlTEMvmR8bqih6PLzplyw68AuzVUQRXY15ni0QZCc7M6Ayj+T9NIYQWVdx
	xgzrkU0b38ChpsddbT0iYLLMO+B3LyjNV9ac8OZDjDfwG9l4SKisGTGRYke+0mYPM3IB2jzEE8k
	jolgd/9sN+RL6h3GwkvZsEaAt2AFvUs3nTHSQLVHIPP5YECXoPZp8k4pWwVsMDy6bgpRoxiHeKt
	fq36toUoWA==
X-Received: by 2002:a05:6000:1788:b0:399:7f43:b3a4 with SMTP id ffacd0b85a97d-39c120e088cmr16478332f8f.24.1743668043527;
        Thu, 03 Apr 2025 01:14:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCqc+UbMw4reOC94Om0ACCo9roOZqNjIluH63XAEl0e6Z4bIUmGEN7/qCnuIYAa0IiNtTjgg==
X-Received: by 2002:a05:6000:1788:b0:399:7f43:b3a4 with SMTP id ffacd0b85a97d-39c120e088cmr16478308f8f.24.1743668043180;
        Thu, 03 Apr 2025 01:14:03 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b9d55sm1070866f8f.42.2025.04.03.01.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:14:02 -0700 (PDT)
Date: Thu, 3 Apr 2025 04:13:59 -0400
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
Message-ID: <20250403040643-mutt-send-email-mst@kernel.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
 <1966cbf1-a430-480e-a78d-3d6bbcb4ada4@amd.com>
 <20250403033230-mutt-send-email-mst@kernel.org>
 <59be937432fe73b5781ecb04aad501ae5a11be23.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59be937432fe73b5781ecb04aad501ae5a11be23.camel@infradead.org>

On Thu, Apr 03, 2025 at 08:54:45AM +0100, David Woodhouse wrote:
> On Thu, 2025-04-03 at 03:34 -0400, Michael S. Tsirkin wrote:
> > 
> > Indeed I personally do not exactly get why implement a virtual system
> > without an IOMMU when virtio-iommu is available.
> > 
> > I have a feeling it's about lack of windows drivers for virtio-iommu
> > at this point.
> 
> And a pKVM (etc.) implementation of virtio-iommu which would allow the
> *trusted* part of the hypervisor to know which guest memory should be
> shared with the VMM implementing the virtio device models?

Is there a blocker here?

> You'd also end up in a situation where you have a virtio-iommu for some
> devices, and a real two-stage IOMMU (e.g. SMMU or AMD's vIOMMU) for
> other devices. Are guest operating systems going to cope well with
> that?

They should. In particular because systems with multiple IOMMUs already
exist.

> Do the available discovery mechanisms for all the relevant IOMMUs
> even *allow* for that to be expressed?

I think yes. But, it's been a while since I played with this, let me
check what works, what does not, and get back to you on this.

-- 
MST


