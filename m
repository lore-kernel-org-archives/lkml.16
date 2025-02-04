Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAFB17588;
	Tue,  4 Feb 2025 14:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738680633; cv=none; b=G5Oo3qKtvN/o4k7A0GEzarrVrd9iGRHEPNlqOPQL6jeawCHq8QEInIKJM9jFlU+8IoOF0LWd7+Ltvi0y9AdUO5trXRG+oZKTVUkt4HmxYpxb4PjX7jQ9yw75Vxwbx1VkN9Yh/pJInURYBC5Bm71s6pBSz5kK5QHGOx7ZOyHkXHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738680633; c=relaxed/simple;
	bh=PVDI10kSspSbKiqiR3cWmHfQUFuV+mJrrZh7MaBhxPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HaeGwt4VViNoiCne2pg04rDcRb50yd72ymkLIx6Ft6Dmp/AJtRHGQGAmIBT/lvONNSfLEZKUKridPqc7yOGzz/+xYxWfnJhrViw7RmKFku1+w0dz5XoTzylZV1aTfV5nVPml+occ2aWN2WWbZvOpELXWx/VPKSR8UbZ7sdmCRjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LijbyhrZ; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LijbyhrZ"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7b6f1be1daeso540025385a.0;
        Tue, 04 Feb 2025 06:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738680630; x=1739285430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O93zUfmkQJ5yLGKvDRcJEjXroIe8dkmS2F1TSj1aIr0=;
        b=LijbyhrZIYehiyRV7W8mOw/BEkCTWTMqz24w7kc02Spa6l3GTSTaBggc4NJmMIlfBe
         DbVXBfiltSSqoOmGGlhy5f1pNOCOhuQPgjNGTnmMC/iomcOjUrJQXs+rieOcnSK0znCO
         5l48tQ9OWIlSKo/BfiTsZe51SBf/Bvz9pdybKWd1d9BMXt/QJSNwo6d/mmFurCStKsqz
         4+kn/zRot5LuKoOOXpZ9T0yDUrINQOBxkZhiBXGHxPsW7AE9GBAQYWUYBdrqvd12Xq+t
         dhVN9H5OvmZNKvGAoOnOkzkqbMumkheTkuctB+R3YEA/lXPcyktMr52V7ZhpoaA4P6pO
         Ci0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680630; x=1739285430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O93zUfmkQJ5yLGKvDRcJEjXroIe8dkmS2F1TSj1aIr0=;
        b=CWGrc7+i2Lm9XBg/jKXYQoC1rG5hX5qujHhNGl5q14UP82K7gINPKmjrqM92Yjh7uh
         12vkUOA3GBbS2y+Cv+Lh9D+JSFkaBN0mzATSwms8dyJr7p6P8JJzcZ/yBIxhSYCbDoFe
         aQl6nRBAUFVGQZ5FlyXi91mUxbbUl4/dQeMOOuh7sFUrFzt50qX1x/XE5JeTj7VfH/Su
         qnUlINMZs1jzvu/cbdPQvFJrzxmHOLBPJDFPMHvNw5XSXPbtGzVd4m6sZfmwTc0l5mRV
         KXe05LYdE2vrLtUl1pdtsma42Yj50lF3ptTGsT5ubyq27LM/1YZI+xsbqXMxrNsVymTe
         +mXw==
X-Forwarded-Encrypted: i=1; AJvYcCVTABvZ6IDtg85imLHOrPzu9hx1ferPUYq+0IgEbeMOCp6peiYfxlWJWEy0uhAOVsuMmdVHXnCbNWLF0SU=@vger.kernel.org, AJvYcCWH4xLXPKZZPtF3Cbmh3SbsWmW8CH9qXsbjnGgR08AV7u4N8rNfHBU0KuDdBiz1JEPTOROYXuOTaYtxJyki7fI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+sv6CRHWo3elw3klPerjYljp/Lk6RZE+pzjfOYFxaovGFx7Uc
	70PFtI2NpQYHewvqyAq5bcNsSaI0W1J/UAB45qu5zs+Qffu5TZXZ
X-Gm-Gg: ASbGncvGUCJkCnlqjr5RUIDuPuJ06mSvD7eCrIFlAQ1EJNaHarkHUi+LKkORmzETO/t
	6OX3o8N/vHcrwDWTHlMi73qNbKBMQbLjp3TbMpqm4r/uEJWIOPNjEnLAj+67ZopllCwSuQtl9JS
	2biOImnURADNiAzSS1JAWaphC6+UtbaTqQ4AnTEBLPTNC9KqgACf6e+9alQHyA1GVYutDr+Puqc
	l78fTUNRTaOVVtPnoFRaaMGd3F2qyZwDNMioovMqP/T11nEe/GJnDXmYN22DNJAlLAdzyAghuiB
	iWFZ4gJ6fzrILZpyAJQMiINiFT51jCeMe9Ty12+tuVpy8EzOnAD2OeBdWT9s00LQHLLQSO97+vI
	qjj654g==
X-Google-Smtp-Source: AGHT+IH0tfWWAkUUISaVsW7R9y0WycKwDyOEfJRx4RoIqxcqcAbwE9Cp+b3y3nIulRFvqaZhMXeL8Q==
X-Received: by 2002:a05:6214:2305:b0:6dc:d101:2bb2 with SMTP id 6a1803df08f44-6e243a86cd0mr372471186d6.0.1738680630220;
        Tue, 04 Feb 2025 06:50:30 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2548196ffsm62572346d6.44.2025.02.04.06.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:50:29 -0800 (PST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id EA5CF1200068;
	Tue,  4 Feb 2025 09:50:28 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Tue, 04 Feb 2025 09:50:28 -0500
X-ME-Sender: <xms:NCmiZ7BaXbSavOjU4Nn1_N-AyNHAAdOU4uEomT1DDbEYlbArrMU0dw>
    <xme:NCmiZxjZby0UjbmwsFTVBgfeMvxC0NutCutLbtam7psCcN_YS46aHGpNrskYscJ2n
    oaB5JOBOmcRmNfVpQ>
X-ME-Received: <xmr:NCmiZ2lXK7-eofJMRYN5D7a0pbJpEmcy8Cfdd33D73bJMZ_kA8mqZuRNHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdektdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvfedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhgrsegrshgrhhhilhhinhgrrdhnvg
    htpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghl
    vgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrh
    ihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghi
    lhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvg
    dprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepthhmghhroh
    hsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:NCmiZ9z5qz1n5fm3agtBtZCTy6bzQYcxUw-R3aMLwK8QDODXxt9zdw>
    <xmx:NCmiZwTPyB9mI1Jgy7P5G0FEDVWaYa3QS-fO-i5zVUx0DJmSzsx-Ew>
    <xmx:NCmiZwZZFMOdWFPGGnX1-WUQtro0fi2Xp7J2XtrAAVjK_IKv9_GuVg>
    <xmx:NCmiZxTdyg8CcUym1qvO-hPjzOg9BhIcZS5kzV2xQCPvp52NSbVZEw>
    <xmx:NCmiZ2DmICtOZUqHTnCejbMw4BgPVUSqjDKyo3QR7wFn_9ME9sTSdfrY>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Feb 2025 09:50:28 -0500 (EST)
Date: Tue, 4 Feb 2025 06:50:27 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Jann Horn <jannh@google.com>, Matthew Wilcox <willy@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Valentin Obst <kernel@valentinobst.de>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH 4/6] rust: addr: Add a module to declare core address
 types
Message-ID: <Z6IpM1zuR7-iThua@Mac.home>
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <20250202-rust-page-v1-4-e3170d7fe55e@asahilina.net>
 <Z6Da4XV5hcTfBiNH@tardis.local>
 <8f098064-d2d5-4a02-8306-0a3d31557bab@asahilina.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f098064-d2d5-4a02-8306-0a3d31557bab@asahilina.net>

On Tue, Feb 04, 2025 at 08:50:17PM +0900, Asahi Lina wrote:
> 
> 
> On 2/4/25 12:04 AM, Boqun Feng wrote:
> > On Sun, Feb 02, 2025 at 10:05:46PM +0900, Asahi Lina wrote:
> >> Encapsulates the core physical/DMA address types, so they can be used by
> >> Rust abstractions.
> >>
> >> Signed-off-by: Asahi Lina <lina@asahilina.net>
> >> ---
> >>  rust/kernel/addr.rs | 15 +++++++++++++++
> >>  rust/kernel/lib.rs  |  1 +
> >>  2 files changed, 16 insertions(+)
> >>
> >> diff --git a/rust/kernel/addr.rs b/rust/kernel/addr.rs
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..06aff10a0332355597060c5518d7fd6e114cf630
> >> --- /dev/null
> >> +++ b/rust/kernel/addr.rs
> >> @@ -0,0 +1,15 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +
> >> +//! Kernel core address types.
> >> +
> >> +use bindings;
> >> +use core::ffi;
> > 
> > I think we should use crate::ffi here. See:
> > 
> > 	d072acda4862 "rust: use custom FFI integer types"
> > 
> >> +
> >> +/// A physical memory address (which may be wider than the CPU pointer size)
> >> +pub type PhysicalAddr = bindings::phys_addr_t;
> >> +/// A DMA memory address (which may be narrower than `PhysicalAddr` on some systems)
> >> +pub type DmaAddr = bindings::dma_addr_t;
> >> +/// A physical resource size, typically the same width as `PhysicalAddr`
> >> +pub type ResourceSize = bindings::resource_size_t;
> >> +/// A raw page frame number, not to be confused with the C `pfn_t` which also encodes flags.
> >> +pub type Pfn = ffi::c_ulong;
> >> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> >> index e1065a7551a39e68d6379031d80d4be336e652a3..eb1a80ba8ff83ab2d1b3b1d11fed4fb704c7a4f5 100644
> >> --- a/rust/kernel/lib.rs
> >> +++ b/rust/kernel/lib.rs
> >> @@ -29,6 +29,7 @@
> >>  
> >>  pub use ffi;
> >>  
> >> +pub mod addr;
> > 
> > I want to share my worry on this `pub mod` list in kernel/lib.rs may get
> > too long ;-)
> > 
> > I was about to suggest putting `addr` and `page` into `mm` after Alice's
> > patchset merged, however, seems that `mm` mod only cover userspace
> > memory management (which is not my impression of what "mm" in kernel
> > development), thoughts? Alice, do you think we should extend `mm` mod to
> > contain all memory management mods?
> 
> I think in kernel-speak "mm" is usually userspace memory management and
> kernel page allocation and memory management, but doesn't include device
> stuff (I/O ranges, DMA, etc.) or the low-level concepts of memory in an
> architecture. The types I declare here are more relevant to device/arch
> code, so I don't think they really belong under "mm", it's more general
> (mm deals with them and so do other parts of the kernel code).
> 

Make sense.

> On the other hand, I think page.rs itself would fit under mm, since it
> deals with the kernel mm's idea of pages and their allocation.
> 

Agreed. Probably some follow-up work after Alice's mm work merged.

Regards,
Boqun

> > 
> > Regards,
> > Boqun
> > 
> >>  pub mod alloc;
> >>  #[cfg(CONFIG_BLOCK)]
> >>  pub mod block;
> >>
> >> -- 
> >> 2.47.1
> >>
> > 
> 
> ~~ Lina
> 
