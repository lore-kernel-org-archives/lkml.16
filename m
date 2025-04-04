Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3DA18BBB0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 08:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743755567; cv=none; b=GTUhNc9Ocvp8oaDjqPIJ46x5kp7PtSeXtHKb9x7RqhIKBNcqykkR9o4XF8lOUZleMbRNxKiwugmL04NICsH4A3yAM7sDoVOlEY6Nc2CXtw1kQdEaec8k/LINMc639A+eWegdzvmVYeg7399pX94jc8KkoSo5H1g6Gk2NIi8cRhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743755567; c=relaxed/simple;
	bh=8mgiLfeOJH6U7WSgzeIIiX8jgYIFd8sgDdNUQ1WgpFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sVRJYAT1NhLKcvdvUL1ke3okeVJG/PkvIi8f8NDxV7Zvc2XXk0ZJ85GII8tOL3UHaI4cicoqZ+qlL1aT61Q5H2ShRimPvpEz8P948+Yd3tlADqwg7JcHCYx2NGQm018czupBU3P/6M++q0KIGTw67aeU5uMYM281M7Ret8rT7Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EoJdBzYi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EoJdBzYi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743755565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1g2+hk0RrD47BYHCyQjMK8prZh3qSBoec7bPqHaAsFs=;
	b=EoJdBzYiYp9MYGehCfR9QjNcbro0K5MXskljZu4rMTZwlfLfyZ8MGu2RH1ysE/iVRE4fnN
	54b0G2d4jVoPhcBvOkRtt+lXIEsC4CcniLSQhZZHFbncGvUf61kTSRPQ+k0tiVbz/FtbwS
	rgfUnWOSc9ecFQJVBDoZKxRWY3HQZBE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-0JOhY8hYOj2vJvBMkIAMbA-1; Fri, 04 Apr 2025 04:32:43 -0400
X-MC-Unique: 0JOhY8hYOj2vJvBMkIAMbA-1
X-Mimecast-MFC-AGG-ID: 0JOhY8hYOj2vJvBMkIAMbA_1743755563
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso11132365e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 01:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743755562; x=1744360362;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1g2+hk0RrD47BYHCyQjMK8prZh3qSBoec7bPqHaAsFs=;
        b=ZmrnNvp8wntrL+uKS1LAzTSrNlDT2ndxWRJs6faSCtDFKwBGzCe8oDuqzFyj4fopdj
         +1sFzx2fdsQTvBbJPl/2M/eXrLvlCedK305dHIfY5o4iMlNVL+9hWG69i4L9R+zkaVff
         xHH6AG4v1Kbj+Qkfd4igzgIgIwGuRpIMOXldKFRBBNwsMC9FNN5Ss2H8pFNPrb6QC0od
         N1BSX+KzAvgYE3osySamAkzv27XnHFJyXqwgRgIX2iNYRUoSXwrrufg0A/rvQKMyN6hr
         i5F8ukVOSM551Vi14+TE9UvIACWs29tbJcEoNjds9Qd1zHicdQUVFW2x1EANKo+bNFj/
         wmgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSo6YocrYi3j1erPv08kLGSVdhnojON2oWYcCle0OR/RgcPsUKTjpxBp6XLcpl/tVWSrTvk50J+YssfQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKWd9Dg4RLmW4wIUvDsU38O48n13IOHTEv5wc92Ag6367Q6Poe
	dtIzwyxJMsDiFv+bGmUAcHMS4X6d1Ygsvm+gwQAq1utqy7yRXA2ndRzjDXMsIWobFAvPiPsTgB9
	zO5I6B8Hhw96Pk6JWkb6vT/k2qMs1rQI6M3HDLOqEaRI4H0jcks1LDznDaj5FQw==
X-Gm-Gg: ASbGncvtq+AuNDov0co+1yTlHtwuTQ0azBO041Dk2dy4wIQFlh0fhAOu3Z8uZXFq9ww
	UzOTrkqSijmWEwn1fNfipS0P0Uh5j7Y2xu1ww7XKfL+sE933et/H45F7MS66UfFdhB6jDa0HmgM
	USfBwz2KUeFBwSGeEUquPaCJFE2jEHQwis1xhfWZ7jdLD2vBBNyJY3w0ZDepo3EeyjwbGJjjDav
	H5TnH1II6NI7sfoYXNMmOx/t8JyCKByevqluPXsO5YmkEd+UwH+qB4hrvLVBAr4sgOJEHB+4/5f
	t4A+PaxabQ==
X-Received: by 2002:a05:600c:4713:b0:43c:e2dd:98ea with SMTP id 5b1f17b1804b1-43ecf9c7731mr16261025e9.22.1743755562663;
        Fri, 04 Apr 2025 01:32:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ0IdRaSckdVORex2b1FgzPZdidXCh6submJTDHordJMQojyupjfXYrJLLNpoFtr3Ssc7f6Q==
X-Received: by 2002:a05:600c:4713:b0:43c:e2dd:98ea with SMTP id 5b1f17b1804b1-43ecf9c7731mr16260785e9.22.1743755562294;
        Fri, 04 Apr 2025 01:32:42 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364d071sm39036635e9.32.2025.04.04.01.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:32:41 -0700 (PDT)
Date: Fri, 4 Apr 2025 04:32:39 -0400
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
Message-ID: <20250404043016-mutt-send-email-mst@kernel.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
 <Z-43svGzwoUQaYvg@infradead.org>
 <148a3c8ee53af585b42ec025c2c7821ad852c66c.camel@infradead.org>
 <Z-46TDmspmX0BJ2H@infradead.org>
 <05abb68286dd4bc17b243130d7982a334503095b.camel@infradead.org>
 <Z-99snVF5ESyJDDs@infradead.org>
 <fb7ea3ee5bf970fa36b012e16750f533b72903a0.camel@infradead.org>
 <20250404040838-mutt-send-email-mst@kernel.org>
 <67bd998bfe385088ef863342b9f8714754585476.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67bd998bfe385088ef863342b9f8714754585476.camel@infradead.org>

On Fri, Apr 04, 2025 at 09:16:44AM +0100, David Woodhouse wrote:
> On Fri, 2025-04-04 at 04:09 -0400, Michael S. Tsirkin wrote:
> > On Fri, Apr 04, 2025 at 08:50:47AM +0100, David Woodhouse wrote:
> > > What's annoying is that this should work out of the box *already* with
> > > virtio-mmio and a `restricted-dma-pool` — for systems which aren't
> > > afflicted by UEFI/ACPI/PCI as their discovery mechanisms.
> > 
> > 
> > That specifically would be just a driver bugfix then?
> 
> I actually think it works out of the box and there isn't even a bug to
> fix. Haven't tested yet.
> 
> The sad part is that the system does it all automatically *if* it has
> CONFIG_DMA_RESTRICTED_POOL (e.g. Linux) and the driver never even
> notices that the dma_ops it's using are the swiotlb ops using the
> provided buffer.
> 
> Which is *kind* of nice... except that when on a guest OS which *isn't*
> Linux with CONFIG_DMA_RESTRICTED_POOL, the guest will just ignore the
> `restricted-dma-pool` node and try DMA to system memory anyway, which
> will fail.

I mean, it's easy to misconfigure Linux, this is why we love it ;) Why
is this such a concern?

> That's why my proposal adds the negotiated VIRTIO_F_SWIOTLB feature, so
> that the device side can refuse, if the guest *isn't* agreeing to use
> the bounce buffer in the situations where it must do so.


OTOH then setting this feature and if you make the device force it,
you are breaking guests restricted-dma-pool which worked previously, no?

-- 
MST

