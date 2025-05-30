Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44950235052
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748616630; cv=none; b=P5gYAAYYHTuQ9/6NcwYZfAQDQxy1YOZeNKiMmsxgKrwD0LOFMNGB/GLl5dU6YBjK4+QCBiHvsPFzhXc5ud0BK15dXykGM3Gg3IytEJtUqkAjEqvQ7kEjCGt2cfUVj/fQmiRNVdygyHmuauhNzQdbr9WIfENAwgA157H8UP+YNIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748616630; c=relaxed/simple;
	bh=HGRPVLu6Tlbf8okATr/kZX+v/mGty5hiwEauJPQTAPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X78SgZe3ufhlpd5FHP5FRiXJXHiqq9ymMAU1pg4T5k2r0irmpMAv7gAqzX1YfwSZZFkuP7YhttzAr8tCftx+IhSaJOUkXGx8jVJiqXfWzxpfusenwfRdhpFU8ZLwHli3aCSj4Wk7ClAHlAp6wEAzEWdsWztelFooP4QYlQ4yZC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=cdQa92cF; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="cdQa92cF"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4769aef457bso26169741cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748616628; x=1749221428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HGRPVLu6Tlbf8okATr/kZX+v/mGty5hiwEauJPQTAPw=;
        b=cdQa92cFW/+gA+NDpewrLR97AQmQIDcgezLiVt+ujh1pHkAihFNYU8/sW6sgmasQ6J
         5xiR/yd1qZik03THBuDcdXGIGUtuMX/Gqi1ee8zT0uuyOoCPubFzeXc6yyxkfaFmK3D3
         qps4nrlDM3KBLkthn2DXlKHr/cCVnHnEd3wfpnFnZm3OYjrMapmw6SNYsgD0KW00r3uI
         XPmGrpvMY7Z9tihWwIOV2jnoM3E7LT+mQb8gDoPav3mPwNS8HbdABG+pa+mXHa4xIj5R
         SL2YdWZvet+uGiRcLjgd3suvbWZkdpJDhEeBACh4ybfJUGxeqvz41uL7QRyq744kPwrF
         U7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748616628; x=1749221428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGRPVLu6Tlbf8okATr/kZX+v/mGty5hiwEauJPQTAPw=;
        b=OlZ2wd3csFc+ZuTcrM6kNoEm48H1jjolH02hPHP5UfSiI/nFF1thbWwH9jDDkNxdSa
         neOmFBvf7AbZRZQLvjJf/IWxwfxXrALRwzLNF7qIn6FzUc0c3IPJIJktJAYWCBCPCS0k
         9LFcruo6IIgze2DJgTb6XiqKjEidV9O+VylAd1ravJaHBj2Vmil2+upSRjpJ/oYmBkAg
         nd9q60fSVhm0lBOUwoMckiCO++Wj0eaPrcfM7/bdbvOBQrEDrLUo0mjKbaVFUa/zi7ig
         YehtLNIQH97ZpncljYRcAMFNyqk+4IpIrNKJi1vaZw/Tkw8QHYGkqtd3s0mQjQUIyNFJ
         FXBA==
X-Forwarded-Encrypted: i=1; AJvYcCWJcSRE9IvMke5iKy1z6baqg0WxdWAMCvRMtI00CXck3ZsA83ArOKGZQ6q/unSCYEuebUHldZYyGMRvbRo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvQ0C1IoKScasHUmGIdJolJr86K9u1WHuCE5ojaNz9ftlwhsVE
	FxGr78vu9JeyBFIEHdwfsPoWVl3WesPhjYHklgvWDTJr9zdDXyt0GfrjiF6OB/3Z/Rc=
X-Gm-Gg: ASbGncvT3t/bgnGHvZLzKHJLJgMRvK+2IPWZc1rCanDkKpbCswKcrm5TNssw4NxIWa/
	YpJi/BKVPAVmVbhAey9X0juRPO8aR6UBkmMHgulvc3XU9h9jHip3w//sMAGp2ShaowM0HmREqa0
	ZS/f0GoV5FCidhRFN8rkb0sxO8z5tzj2XNRWzU/FKwvJPbEJp+vpfpws5ERwmK+FU3Z6yzRXIee
	lK+qqCbvP1kpD7Q86YbuhMcoP+UuvYrFv3tPaIKXn3eHiCe1IktpTsvRNgH+enHQkkIaoNIBp/R
	6tmBd/QOfzNI7/mtmhN8v0gL9Vy5yptJonrn5cp0zO3AY4fqJxd565eFPABqGL0fZtZwdE8QpTX
	GK2micaNq+eJn61XjYdz85CtLKyt1tPGZoC5i8Q==
X-Google-Smtp-Source: AGHT+IGBTeaFU7Lun0cxRzLoVYefmxYGwMLzyx7A2cdWFaW7Vade0KEgRRURnWiOg3n4NiLrm3GLmQ==
X-Received: by 2002:a05:622a:229f:b0:476:8f9e:44af with SMTP id d75a77b69052e-4a440074887mr56369431cf.29.1748616627920;
        Fri, 30 May 2025 07:50:27 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a4358ada69sm21450411cf.29.2025.05.30.07.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 07:50:27 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uL13y-00000001F0K-31WA;
	Fri, 30 May 2025 11:50:26 -0300
Date: Fri, 30 May 2025 11:50:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, dakr@kernel.org,
	lyude@redhat.com, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	open list <linux-kernel@vger.kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>, airlied@redhat.com,
	rust-for-linux@vger.kernel.org,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
	Petr Tesarik <petr@tesarici.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sui Jingfeng <sui.jingfeng@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH 1/2] rust: add initial scatterlist bindings
Message-ID: <20250530145026.GB293473@ziepe.ca>
References: <20250528221525.1705117-1-abdiel.janulgue@gmail.com>
 <20250528221525.1705117-2-abdiel.janulgue@gmail.com>
 <20250529004550.GB192517@ziepe.ca>
 <DA9JTYA0EQU8.26M0ZX80FOBWY@nvidia.com>
 <20250530141419.GA292183@ziepe.ca>
 <DA9KQF9CY77R.77PBMU8Y1FPY@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA9KQF9CY77R.77PBMU8Y1FPY@nvidia.com>

On Fri, May 30, 2025 at 11:44:26PM +0900, Alexandre Courbot wrote:

> I would be fully on board with a simpler design, definitely. The reason
> why I've tried to keep some doors open is that as you mentioned
> scatterlist is used in many different ways, and I am not familiar enough
> with all these uses to draw a line and say "we will never ever need to
> do that".

I think it would be better to grow as needed. It is hard to speculate.

We also have the new two step DMA API, so it may very well be the only
use for this stuff is very simple mappings of VVec like things for
DMA, and maybe this all gets rewritten to use the new DMA API and not
scatterlist.

Having a rust user facing API that allows for that would be a great
thing.

IOW I would maybe reframe the task here, it is not to create simple
naive wrappers around scatterlist but to provide a nice rust API to go
from VVec/etc to DMA mapping of that VVec/etc.

> Like unmapping a buffer and remapping it later sounds like a plausible
> use (say, if the device's own DMA space is limited), so preserving at
> least 2 states sounds sensible.

I don't think so, there is no such thing as a "device's own DMA space
is limited" in modern HW, and if it was a problem you wouldn't solve
it by swapping the same scatterlist in and out..

Jason
