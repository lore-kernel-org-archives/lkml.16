Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40E11E1DF6
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 16:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749139328; cv=none; b=MvSecbMbVul12zYNpkq8jICDwV4sjk6BjLK5P69F7MfMNXJwkSZTol/GLrtvj8kFpQXemxe7bFBh6jbyFHh/8SAA+1kjEeDF69ixu5HtDugxtZS6l1k2IrnmIgE+/ayOzr3Re8R5oCo50FqwbmE2E43l336UJqnkBJt7QHjIRCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749139328; c=relaxed/simple;
	bh=cl4ucnscv6CHIcnutTwdkRM+vCkQnkKeFsyDVSBopSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fmnPihqiKKo39mQKptAYxGioUC7uJdwk3vDtFgWxr0DhkMhRiHbgm6gF0KP9rCtMtaKPrYVZgVProSaTxHr+BRBH/GCYkKy+B6ZsGy06qWlS+Zb9roWeg8jQcssaTEfFC8ClqIByPr0fJ92W+6io2BaN6bVBKyCk00jG5rRT3Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=HOy5WKAE; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="HOy5WKAE"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a58b120bedso13201971cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 09:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1749139326; x=1749744126; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cl4ucnscv6CHIcnutTwdkRM+vCkQnkKeFsyDVSBopSw=;
        b=HOy5WKAEyU6DtNPIFkkDcgSogOW/oRuFOw6PbfCqNPS0a8dPtsC+yf53YuRLeB6Sa4
         6zEEaquvn760MHSvxsnm0hm9yNq81lFaW4wsJDOpobdkI8Mn0Mqxtzlvj8GzN0ib7gGP
         TNruT8UNnJK0TDcCDFisg4zmlh80wuadrOdqaGFac01DsNqUuEDGjwif3dDtJHKlEpK7
         d+QToScqolbee5WFmAsuew2D6Y/7LXwX3De9hbjuS+bB0vaz+OHuZVS8cixfjMzA5/gU
         uJkN3UvuY+eyQZQz4JviPcv4efn6GF20jZBR3lGJ4yxY8eoNqTzTZXRxhUBpJ9vcdwWY
         M/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749139326; x=1749744126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cl4ucnscv6CHIcnutTwdkRM+vCkQnkKeFsyDVSBopSw=;
        b=kKn/m2bGNmRHjHL/BAZrLs4vL/PqqEcNx7kes+0re/Lb+k6XqLpcqRMnEV5Nf0mJ58
         9Aw5Uxs579ymS4T5gJ8FxcDYrndr/QKlqitfg0ctytCjCUcoe6H0VhncLocCeBmBpPOH
         XIzQxtJTmI1TaOR//Ec4cGBYo/41/rIYlQhpGd5XXhD6g6MMymri4fp09HmqF+xOO6GS
         SIMDBeFZLRW3pw7moJgJp0LKQqpvkzobsn2BcfXBwZNOd2j7grbvtfk5z/cvrOTz/pN9
         7YnEu4ByafP5n/pu8oWdkq9P+Nc8CUMBwgycFeUz4cRrm9kcJso+DGiPMumDxkwTOrFY
         RWAA==
X-Forwarded-Encrypted: i=1; AJvYcCWXBsuY5HHruS4Hk5KhoJkF3iWR/AvBPfTkx+IABjoynNg0ZzQdNWyhGs8ViUd15w0N0muw2Lq/hGkf940=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsEutdBieWynbxIFG4Amrnvmaf5+Olw0xCUpZdqBcR1YzgdibY
	HB9BgC0DfBkInfdfVjaAsXCf1EqB/+gkHFHFFf2jGA/ZxWGNXcgY/9PZx3NJ9ZWbzRc=
X-Gm-Gg: ASbGncubzwuTc54TEfwiL5qdUMJSVvHm6bX95eIpQ49sSD1j1urcdT8EpdzdQByji41
	RtTYDrZyY474/vbtjpZ3ih37fTPsnVXwYunqXI9HkJ5tgh3KG7swmK6alsT0D6Q0C4zO2mleN16
	zpb54ZJmCfPD/Oa+eX0CerlXVZSUwuj0M++Kkn1h5CLVoTODuR3zXt+sgoEbhz8PaT5YyhUJvWi
	D+jdiUMhtr2xlpUqEqc4yGcmJ6pQOVRJUUW4Jn6H/QYJQkmP0n5IRuBRaFNCHvxiby1sjot2r7N
	eQaQQGLNo6/2VjbcxDaWYgcNlNyuDgoDjvuQ4Us7/bE1NBjgO+ZtCxeFpPmodedPQrauMPzOshw
	0J500qFdnsrByM4QT3Kw20InSwUw=
X-Google-Smtp-Source: AGHT+IFiawY3TdkU1c2blIEaPT+D15Jb8mRuBjYoikvI4CVvIzUMkgXJuKc07rw9aBvqhR+5BYsXQw==
X-Received: by 2002:a05:622a:5c95:b0:476:8f75:b885 with SMTP id d75a77b69052e-4a5b9ece0f5mr3684891cf.44.1749139325648;
        Thu, 05 Jun 2025 09:02:05 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435a7ff06sm113387851cf.73.2025.06.05.09.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 09:02:04 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uND2a-00000000GSr-0tWm;
	Thu, 05 Jun 2025 13:02:04 -0300
Date: Thu, 5 Jun 2025 13:02:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, dakr@kernel.org,
	lyude@redhat.com, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
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
Message-ID: <20250605160204.GC44681@ziepe.ca>
References: <20250528221525.1705117-1-abdiel.janulgue@gmail.com>
 <20250528221525.1705117-2-abdiel.janulgue@gmail.com>
 <20250529004550.GB192517@ziepe.ca>
 <DA9JTYA0EQU8.26M0ZX80FOBWY@nvidia.com>
 <aEG5X7FduqFvgXxH@Mac.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEG5X7FduqFvgXxH@Mac.home>

On Thu, Jun 05, 2025 at 08:35:59AM -0700, Boqun Feng wrote:
> Late to the party, but seems to me the main problem here is that we
> cannot pass a reference to .set_page(), note that there is some work
> that would change the Rust struct Page from a `*mut page` to a
> `page`[0], and then we can impl Ownable[1] and AlwaysRefCounted for
> `Page`, if that's done, then I believe the correct parameter for
> set_page() would be an ARef<Page>.

There are alot of things that want to go into scatterlists that don't
have struct pages that are refcountable (eg frozen pages used by
kmalloc).

So I don't think you want to go in the direction of forcing
struct page refcounting in scatter table. That is not how the C API
works for good reason.

I also don't think it is a good idea to push more struct page stuff
into Rust as we are trying to eliminate struct page from the
kernel. It is better for rust to stick to KVAs and convert to struct
page in core code only where absolutely necessary for someon reason.

Which is another part of why I suggested set_page should not be part
of the driver facing rust API for scatterlist.

Jason
