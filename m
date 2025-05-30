Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ECE226863
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748614474; cv=none; b=jVHd1gJ0VvSOACD7EHR8F8ib3MJFV0AERCHQZ4cZ0j7F2dC0NR+8l5MLEJqvrTJlWrHAFH1HggUsvpjMdBDq3NSSHP/0hodYEvdWtwcdSdbPBQlBb186Exwe1DRGZ41Nkx0spXPe5iRPInG90wtV6L7zoqShfDz9Xi24m5DIiNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748614474; c=relaxed/simple;
	bh=w6vyIbiIt60OQA+budbiiEAKBy6+C3l3+8JZbPAM7MI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOKKyWOvs9c4X5ZWx3vFx8oWjZeN3XaQ7r6Dqx0L5UpucNLg3Zl+W+lEncIkUXfOfVSZMxTErhFarcUzQPKDnXdgz2/84DizEPkE9M3Tdh8Kgc2nU0uTq7rFbEFbh7v4hmMy/W70rMHTINHMnXviCHQRfs6y3IqzewlawGhlwTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=CKwkGqyR; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="CKwkGqyR"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-72bc3987a05so1328256a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748614471; x=1749219271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mJhRCQ3+5ch56FEt+lYFH6O5ry6RxHPulLxItBAvDBE=;
        b=CKwkGqyRH6sw5X3I+l1zhm8cs/qVirMkU8sp9iUxDsR5P6Sjhd5+lVXLdDDx40Vfft
         Ip1XwN8wkWrE3v9B27b/pJx6G/XXV9M3pgk7AiUsB6/ARdwSk8teNXiSYqWhJnqUVCtD
         jt6kjkID00k0DU2TCrJIfrjodbHGkQ5Lm/PGnPjH2znK+G4rCthgOU9dTYjU0aE/bLNf
         7OzQhgPjPMOeEFe1BW4ywjt/5pKqRQ4sWlJVxyZx9mZJdtHypJM2Lq6nw/Hi1bPOv//P
         /f23cyX3w8IFkipSqH54tLE3rsazJ6F3I6wJU/DZ+uhaT2N+4p5YNdHs68H0H7fJJ4wd
         jxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748614471; x=1749219271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJhRCQ3+5ch56FEt+lYFH6O5ry6RxHPulLxItBAvDBE=;
        b=KYt21PwlT0TARos4s8Keti46qGOTnosmTHE+mY3xkU1XXFFkHXupDVjo2NReDTCBV8
         HBj4fJSC+44nqsY3rHJ+zwKcJavKiEZ4FfqX8nEW290QUe4t9RzgF6/ee15DDCVRslY6
         R8Ym4od0c38NJY6wHjw+mnsYbgw9a293zeWypfwbJd1PBl1vzpdkRFR3k2qJh4Mb14Sb
         aWSGs04zo5LzKPj/qHsvdu+LMXWWMqmC+YS2ET1BQmw9VV1p32B0aN5AB/MQyZZFgXLI
         IaZyrhGGTh6LtotD58j6fpbYs/dQSEhhFUAGIFs/TKEQIJ6Kgh9UjfuAfihEFWT+PB0G
         ckIw==
X-Forwarded-Encrypted: i=1; AJvYcCX70qfq9nP4TJzBCKLyFmnYWqq0mIV6GuEwInPIpKTXoUypSM7/WKxupG3d+xtYg5cZNOwFujomQMLhKgA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrTgh6QouK8uPgnkelStW3Q8g68uSzXSlpZpAOkff9bilyskec
	lky91AnFb3Hv9q+28FdZLOGJP+anTbsoervLIc2EiaLYS/oJ3fVGd2M1t32zYx2eQJHIQA0DjTl
	v7XI1
X-Gm-Gg: ASbGnctf7Te+eSbxu8M6BuXvxQ6t2pL+cPNMT2HD2mSYBRKNHXHpKm2kpEPUCg8rE63
	FBEKPR0amjni7M1UcRkTYRso2ttWK3Rfsdv3HDg8ajTPkzhoYjExd4/gaWqbtTFYSP2XwYplec8
	t43bv7nYxd06OOANDjIoVXicGmCebrLvwpxJOPu91Ma/I5T4dU9Phd6hcv+S1VV/h9j/imuPC4o
	fKn4uwETkJ+I+5fWvVCp/3UVKQ4kypPMtpdMR7yeKgvKE1/Rj69dISDx4YCISY08qicRIZFBqnG
	wpxsubGZ+gfZh1nN0gC+KQd4+Oz4jnSUg7pIW1hvaSeh8KAnn4fZNwF9mhVNGwqeMufKJtRDVZ2
	G+8zi0rfHOT5dk+QbF0ZrksvafL4=
X-Google-Smtp-Source: AGHT+IFOf7i5ZEFKDYgnQUFLsEV+BJeDM6urOVFUTsIaLbJ8t+i0AJQ0vieWmToACnEapeCdrhFPoA==
X-Received: by 2002:a0c:f098:0:b0:6fa:a52b:d4ba with SMTP id 6a1803df08f44-6fac5d3ab9bmr105797986d6.12.1748614460927;
        Fri, 30 May 2025 07:14:20 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e00dcfsm23235216d6.87.2025.05.30.07.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 07:14:20 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uL0V1-00000001ELN-1sQe;
	Fri, 30 May 2025 11:14:19 -0300
Date: Fri, 30 May 2025 11:14:19 -0300
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
Message-ID: <20250530141419.GA292183@ziepe.ca>
References: <20250528221525.1705117-1-abdiel.janulgue@gmail.com>
 <20250528221525.1705117-2-abdiel.janulgue@gmail.com>
 <20250529004550.GB192517@ziepe.ca>
 <DA9JTYA0EQU8.26M0ZX80FOBWY@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA9JTYA0EQU8.26M0ZX80FOBWY@nvidia.com>

On Fri, May 30, 2025 at 11:02:02PM +0900, Alexandre Courbot wrote:
> You would have a trait for providing the pages and their range:
> 
>     /// Provides a list of pages that can be used to build a `SGTable`.
>     trait SGTablePages {
>         /// Returns an iterator to the pages providing the backing memory of `self`.
>         fn pages_iter<'a>(&'a self) -> impl Iterator<Item = &'a bindings::page>;
>         /// Returns the effective range of the mapping.
>         fn range(&self) -> Range<usize>;
>     }
>
> The `SGTable` becomes something like:
> 
>     struct SGTable<P: SGTablePages, T: MapState>
>     {
>         table: Opaque<bindings::sg_table>,
>         pages: P,
>         _s: PhantomData<T>,
>     }

At this point it isn't exactly a sgtable anymore, it is some rust
specific way to get a dma mapped scatterlist. Most of the actual ways
to use a sgtable's cpu side would become unavailable for safety
reasons.

That seems fine to me, and is what I was suggesting when I said not to
expose set_page at all.

But I would maybe lean into it a bit more, why have the type state at
all anymore if the flow is SGTablePages -> SgTable -> Dma Mapped?
There isn't really a reason to expose the CPU populated but not yet
mapped state to the user at all. They can't do anything with it. Just
directly create the DMA mapped scatterlist and only expose the DMA
list through the rust API in a single step.

So much simpler to understand and doesn't leak the bad decisions of
the scatterlist design.

Certainly the initial uses of scatterlist don't need to ever know
about or touch the CPU side of the scatterlist, and it would be great
if Rust could stay that way..

Jason
