Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391B5263F28;
	Wed, 25 Jun 2025 16:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750867946; cv=none; b=NsBTeTjiSGPRN5tLQuD1sWl+t+KxLyHSY8fIHF7ZTd2PemX3CIK8kHLnJuZk6Ya8D/X7tgyncoQWlZjUnhTzy41WG5KawdWJdfNpGzIpSWmGZVVRa1cpnLHM4Sgrk9G5ujbtZnkgwD0GcW9vp7k9yT3/gnm2Fr4ostiGt6ieEkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750867946; c=relaxed/simple;
	bh=oYmiS7+mo331sqwYKp4eM9UZBdufabQjgvaB2KbiEww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSMv6UXscwK91O17vNRtIv/xboVe60elcyRKuF7PEzGxZ+FwGZcpHWy5f2jPWAeqyMwoWxCkBt6RDLGToKVn//ZEdODv+tYJvqJKPcjtoHiOmOwm0reiDiIa5a3tsBHLitz+xAUuXTPPdyUr4t2J1625YHXxRApM1SdwsvnLIOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LwPsqmjh; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LwPsqmjh"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6face367320so964006d6.3;
        Wed, 25 Jun 2025 09:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750867944; x=1751472744; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93IIFMtpjHWXbtApOQk2PZA6oepCE6RBk5slFq5Hdik=;
        b=LwPsqmjhrTjo4dZPGvynSAgsakEwsCabam7yF90yBcgUj6cSE3GCmNLdUzlk9caZJ8
         8y3DDJO9LSbXO89lm6i05Qhb9c/Q7DPVmpfHriCN6AAUWO33dvIZr2/a2pxvdJunMvsF
         0w6ZY7iKcu7QbciBCKTZMUkDWdVaUZ5+WFDYzP5gxC/A6hucmDOGGMOxMI6iiZgXSGF/
         EnxxHv4tgxFcyqAUMtUtOIMnCNriZJ23H3uBxZXMLdL5p9sYRk511POgVfnZ151OQPCc
         b9oJEtv0qiRee6VEBd98VJIw/WfjKXomF/vxUzb9Ky/U6wI5eFDxbZO0ZO5vfKmDLAoL
         9dzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750867944; x=1751472744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93IIFMtpjHWXbtApOQk2PZA6oepCE6RBk5slFq5Hdik=;
        b=wScg2PP3b6d+zfVKC39nqEaR2CQbQxxPWT4UQRiP7y6k43HmJiEbE3DKy1KDmBU5xN
         o6vXTW/Pa69K7SIYbWCcjALB2gz80IGxrsSCXJaBpDcDPQk0lMtcwB0DokXKGT1p8DIx
         XpETaXsO0iJQJmPbcGqFfeH5tj5jIUNkq/hlWRrD+KeYwAZXV+SCwYyaL5opOCe9mVjz
         iNNjLxIud+IKqALcWR4nIyF58JyDnBIXC1hg8XedtMEqnzNq9EqkP/UI1vo/KF8gZVL+
         aDYxo6NBdPPpr73racN/oEU57CF/Vmkbq7e/sURMHIUxbdqUPnneYj1bzxpgLFmDBynZ
         Rcyw==
X-Forwarded-Encrypted: i=1; AJvYcCVeRgtiFcN4GiD+qlDuycnAbmY1dEsdQxmkikPjpn7/GcP5/q36nFzTW3+qqVr5cTXBzTjSBFcS8F+8Hrg=@vger.kernel.org, AJvYcCVzy/CFY2eH8a2i4YQOUGDw32RII1Wok73eur40YnU7YzuXBm0RaN+QIsb78umv4F5WcP3SUYKIstS2xeKW2nM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6kAb/CFCb9oYVpQ0SQWue6ve7XILqCjMG54hL/MLXG6N1d0Oh
	fERP0c38Rb7m3FNHVGQb0ndX5U7WM/xWf5V1U5JD28w/XdchRrSQqylq
X-Gm-Gg: ASbGncsUShh1wWGTC1DWVpNbZK2sLjwhyMeTH9W4CtjeWKZyu51UNGT1g2mtmhe77MH
	W4WEJBFknCdpcleiumh+cLuB0jRLm7mLkZ9bvS3xi313p2w1xvkjgq7eYnhR1vP9yinCdQ0QcKG
	WN+X7N9tjf+WsiulrGWs04zBcOQfc0j3vEvrvMKXV6b1f63SiW+0BfCZ7UBF9RtcNIe7tYAbDe4
	RO+0ocGw4Ue+GKB84KtCYCcxo9Se4kxV6WIdDD5aoqq4L5uT0lp79GpYPyh25ZlHcDM7+typAZM
	RTwJEAOcLxDLKujdz5giCEg7vSuZK3gGDu7Crhtcb4GqAsXZW+oCVBYW/YcEHTh/maZ5rRnIyEG
	W8ATgUf+tDNLqLXVdBCSxCYrfiLBI3yMGUmKqT+woWjwbIb9SaEIX
X-Google-Smtp-Source: AGHT+IEJ8Gfjo3D5S6gXArHq4VFOC0cXx8BsqNEVWuvhpzm8Kfr/wZ7A/4o9xYdgwaC8RIm9zf0ryQ==
X-Received: by 2002:ad4:5d41:0:b0:6fa:ccb6:603d with SMTP id 6a1803df08f44-6fd5ef75c17mr57858596d6.16.1750867943754;
        Wed, 25 Jun 2025 09:12:23 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd095956b0sm69563206d6.99.2025.06.25.09.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:12:23 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 883A0F40068;
	Wed, 25 Jun 2025 12:12:22 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 25 Jun 2025 12:12:22 -0400
X-ME-Sender: <xms:5h9caONIbKx3t1Rtcex7eY_fEgCJM0D2dxRLjm1mK9deBHy6moBwug>
    <xme:5h9caM8W0QayhS1u0Xy7q5r_nvZcdw0jhjbEVF3I1uygtQZBZqZnuZ3rEuyiFHc8g
    PcYhkdR6CVkBvNHgg>
X-ME-Received: <xmr:5h9caFQIuUGXPZd8A8ecplnQrAPnpxoJwA5TuMhnNK9ebkwOUd3INbVs7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvfedvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehurhgviihkihesghhmrghilhdrtghomhdprhgtphhtthhopehvihhtrghlhidrfi
    hoohhlsehkohhnshhulhhkohdrshgvpdhrtghpthhtoheplhhinhhugidqmhhmsehkvhgr
    tghkrdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprhhushhtqdhf
    ohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghoqh
    hunhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:5h9caOtvlwOOv_JDQjoIH7uP1aIzJtE4h20CRoLGvtYWtncQH8Dx7Q>
    <xmx:5h9caGeN78iV6Vu0q7w7HWRG1ZnH-2uqVl_VIsul32QfzTq6OJrr1g>
    <xmx:5h9caC1b5PRwmtouzV3nC0Lz8uwFMS7cvCuaz2rEJxGpK32iGnkFEQ>
    <xmx:5h9caK_RPvXiQq9MhF-DAwZjzalNVwu4RsLz7ApZ0kqjSd7nirSc1A>
    <xmx:5h9caF9OJ_SPXpI14yfRs7TJrDe1rTCKioLQgAp5M78BDS4xUGiUfgBo>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jun 2025 12:12:22 -0400 (EDT)
Date: Wed, 25 Jun 2025 09:12:21 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 2/2] rust: support align and NUMA id in allocations
Message-ID: <aFwf5bWd4JtotCc0@Mac.home>
References: <20250625062917.3379804-1-vitaly.wool@konsulko.se>
 <20250625063026.3379921-1-vitaly.wool@konsulko.se>
 <aFv11ORZDmM7g6S-@Mac.home>
 <aFweqnzDyxWyt7UF@pc636>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFweqnzDyxWyt7UF@pc636>

On Wed, Jun 25, 2025 at 06:07:06PM +0200, Uladzislau Rezki wrote:
> On Wed, Jun 25, 2025 at 06:12:52AM -0700, Boqun Feng wrote:
> > On Wed, Jun 25, 2025 at 08:30:26AM +0200, Vitaly Wool wrote:
> > [...]
> > > @@ -151,16 +159,11 @@ unsafe fn realloc(
> > >          layout: Layout,
> > >          old_layout: Layout,
> > >          flags: Flags,
> > > +        nid: Option<i32>,
> > >      ) -> Result<NonNull<[u8]>, AllocError> {
> > > -        // TODO: Support alignments larger than PAGE_SIZE.
> > 
> > Thanks a lot for doing this! While you're at it, maybe we can add a few
> > tests for various alignments of allocation? I'm thinking:
> > 
> > #[repr(align(65536)]
> > pub struct Test64k {
> >     a: i32
> > }
> > 
> > #[kunit_tests(rust_vbox)]
> > mod tests {
> >     #[test]
> >     fn large_allocation() -> Result {
> >         // Better use `new_uninit()` to avoid allocation on the stack.
> >         let x = VBox::<Test64k>::new_uninit(...)?;
> > 
> > 	assert!(x.as_ptr().addr() & (kernel::sizes::SZ_64K - 1) == 0);
> >     }
> > }
> > 
> > Thoughts?
> > 
> > Regards,
> > Boqun
> > 
> > > -        if layout.align() > bindings::PAGE_SIZE {
> > > -            pr_warn!("Vmalloc does not support alignments larger than PAGE_SIZE yet.\n");
> > > -            return Err(AllocError);
> > > -        }
> > > -
> > >          // SAFETY: If not `None`, `ptr` is guaranteed to point to valid memory, which was previously
> > >          // allocated with this `Allocator`.
> > > -        unsafe { ReallocFunc::VREALLOC.call(ptr, layout, old_layout, flags) }
> > > +        unsafe { ReallocFunc::VREALLOC.call(ptr, layout, old_layout, flags, nid) }
> > >      }
> > >  }
> > >  
> > [...]
> >
> At least we are lacking of vrealloc() exercising in the vmalloc-test suite.
> I am not sure it makes a lot of sense to add a kunit test on top of rust-wrapper
> around vrealloc().
> 
> From my side, i will add the test case to the test_vmalloc.c test-suite.
> 

Thanks! But we will need these tests from Rust side anyway, to test
1) whether the Rust wrapper does the right thing, and 2) whether any C
change cause the behavior changes on the API that Rust wrapper rely on.

Regards,
Boqun

> --
> Uladzislau Rezki
