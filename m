Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC3028A1CD;
	Fri, 27 Jun 2025 22:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751063534; cv=none; b=OHdK7DeHbqdPQXhDu+9r4QrjmaVLjsg+OM8hdu7zZnoAHwhkZXWlUnAMw2R4uIA0IchUIta5+GY5c8qKHge2NoxNGI1t69TrarR9xI2J8erv4+G8GsIPvL5EOrkq9lAbUhfzHv1MHCzctzzz5zdfw2r01tcvNdK9+oE0i7tDR9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751063534; c=relaxed/simple;
	bh=HDcr9bq11z84tDJ/EvYJ21v0nac6XzAMeYTnoKpBVls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aw3xWIlXhkTzGsKu/1+dcwLKwbchPJuqFt3ymSda9Ry6Sk78Ql9nNIjYqVtWLrm5qzwR+/rcB8izIPPlwCru9xLHwgT+Ilf2AFHLn1xmDlJHgdZ3dvm/e4VnJCF1ddm17sVe+InZbcdhsMIsgSu1DLHghkUgqtfPBWhUdGIpItA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=htxQYL78; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="htxQYL78"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a76ea97cefso3566111cf.2;
        Fri, 27 Jun 2025 15:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751063529; x=1751668329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=br5WSiRr6YbBvyoEMMiPobuOWBhVPC69Q743GJByIzg=;
        b=htxQYL78mqJkKlVyawvhUu1ysvag/G4yp+lVpAyJhOWvJZBnV8WtKLGEWdRciRAKUq
         OQEAU/grs2L1xhZizFsPsFEErYvi7OtE9fBtZ6OSlDakOfMpQTi0ev1OHIi/R/Iytrb2
         NNABQRFv3NZX/JKWdMaAkop4UmIz07nvT0ZU9b9KvGoQQ71Mw7f5UO5jWHRXjqwyO1du
         9oz+pyL9bzGJsjq7aq3giD44hmifD3jjBrzWZOQGA/9VPD4lWTDv2B1XF9LTzdsPQHJS
         C+PWDbIQoHQ9t48fB3qqpEaHYvnNoSwdV3cqQFUAeUko/41NbSKT61lP6yetu02BYKw4
         inMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751063529; x=1751668329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=br5WSiRr6YbBvyoEMMiPobuOWBhVPC69Q743GJByIzg=;
        b=Q5FjmI59PCGzEDjzfR2YCjVJVtBGe0GgUPPNEQk1Q+ArA/PRY5k5PIo1/VGXugIdYC
         gJdYdTJtt0MA6ow/5qk8LgFLGUsNt3ieGxjWetBwjqqoxjtxRPUO/nowMmHc+j7kiv5h
         qffxlrSXtMj2uEdwhZWTij493K8U4BMlco6chEz0PApt/NyMMH0PpS8Ll76F91TTlQF5
         FXVKGrlpcJ5YWUT+gzYwlHiFPQUYzVsWMolc6GPMCd9eyKC7bfkoZA2DadRATm/wky9X
         lpxWJLVB5/+xeAsvwGTAIxLOymNaUHdimjgGU5/OX1e8rV8E+Eq8eV3oKtrHosl/avaQ
         Quvw==
X-Forwarded-Encrypted: i=1; AJvYcCVBO4wXM7sE84HE2VQBVxBgrBUFKZipQPoBC6VHasU0JMpCx4GgOoicErmxUO70un0fUgPpcmqV+t74kj0qheI=@vger.kernel.org, AJvYcCX5ZuFmGMInidJfAKSJeD3wUARFIzRHJZpFGZLaUffbBvObVPey47l0+AAhYyf1KVw0zgINdQtabKVAKyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVt0Rddeygr4yaap3Vk+yHMcUlpmrRVt/rrt8BR/QbP3/CrFkM
	jiPQUel4IFnLY78qiTn/pulFLHqP8mLx6QT02NypAZIYeLW+KrX0SnM6
X-Gm-Gg: ASbGncuxUydBuexibEQ7ZRphAa3TT9qQFnqnwVYL2HwfDUk/y2sC8zj7Zfi1yVvKhzW
	Bswz8ESxACLsoXBVa9QSfHjldLy0e0e62JOvgJMSVdkhHafLPCVRW8e19E4V4d7RQzAFZwm1mil
	4nergixNAM+ZVdS+LBAq2bwmhOS3P1nAaRnlPS//XnH634H1PVcH+fFniq6hYXIdr7ZYC9sJNMh
	3dT2M1Zm28sA+kw8ih2JLecVmhM0rUWCLF6clGl6unfZGX/ACuodUanGgXUfnei4KLsrHf3opjy
	54E8ZMzAmuxuXXVDaiiA22F8vx/tyR3qXxTLQ3olJGqw/ZfNRl4BI4u4VAA6Q7eecbGWM4SqLWQ
	VlnUwQFrfY1Zhi/ID4/3HE0vZ+nenXMswqpAh6RmvG1d1r32QfmFs
X-Google-Smtp-Source: AGHT+IGrGoNO23RnYbA0hwXK2OwZ60t3Mr3Ath3PpQcdK2eZ53KfEnsVhXmf8Ug6jq21JyDENypSUg==
X-Received: by 2002:ac8:5f82:0:b0:4a7:f57a:2fa7 with SMTP id d75a77b69052e-4a805066516mr41045941cf.52.1751063528691;
        Fri, 27 Jun 2025 15:32:08 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc5ad641sm19712881cf.77.2025.06.27.15.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 15:32:08 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id C232AF40066;
	Fri, 27 Jun 2025 18:32:07 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 27 Jun 2025 18:32:07 -0400
X-ME-Sender: <xms:5xtfaHzRd46OIcXNx10i8zj59Bj4_aHliKW6JO94OwUeuDSuu99rNw>
    <xme:5xtfaPS1fz2nNuzxDijdxsoTyTu6XqgxXOjHn1-fAditnhk4ziolqpKMiyuDE06Tz
    FU6PEVhw1p3aNYg_A>
X-ME-Received: <xmr:5xtfaBUJKjkLfKHtDeDYq0n_EFbCgK7zFvYUiOoU85Cl0GkEHiKGrdfAbvEfoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpefhtedvgfdtueekvdekieetieetjeeihedvteehuddujedvkedtkeefgedvvdehtden
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhs
    ohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnh
    hgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeel
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehvihhtrghlhidrfihoohhlsehkoh
    hnshhulhhkohdrshgvpdhrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrdhorhhg
    pdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehurhgviihkihesghhmrghilhdrtghomhdprhgtphhtthhopegurghkrh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgv
    rdgtohhmpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepsghoqhhunhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:5xtfaBgoTvUCqHn7GW_dTyCiCcwkJL3kclJoze-jd2XM_uHGcpd39A>
    <xmx:5xtfaJBmsKxqNlGwY2yjEbrvhDe5lKR-0dXpeEwyrED21DgFh-Ji6Q>
    <xmx:5xtfaKKn5_AWId-vdQVDtgIXdZCuoU1obxIIFmtv15KUeEb_pocFXA>
    <xmx:5xtfaIB9MyuE6x_RVERLXYgM6bqS9loii9MGaVI_5uFv_DmRFV3StQ>
    <xmx:5xtfaFw8XmL4pfy7QdB4mXaN-VkeZTu6rk8ZsOgCBHPj8lB5yB3OzhmV>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Jun 2025 18:32:07 -0400 (EDT)
Date: Fri, 27 Jun 2025 15:32:06 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v7 3/4] rust: add support for NUMA ids in allocations
Message-ID: <aF8b5q0qJvUQ-Q8s@tardis.local>
References: <20250627212451.2181627-1-vitaly.wool@konsulko.se>
 <20250627212556.2181749-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627212556.2181749-1-vitaly.wool@konsulko.se>

On Fri, Jun 27, 2025 at 11:25:56PM +0200, Vitaly Wool wrote:
[...]
> +/// Indicates an attempt to specify wrong NUMA node
> +#[derive(Copy, Clone, PartialEq, Eq, Debug)]
> +pub struct NumaError;

Do we need a separate error? I think we can just use EINVAL...

>  use core::{alloc::Layout, ptr::NonNull};
>  
>  /// Flags to be used when allocating memory.
> @@ -115,6 +119,28 @@ pub mod flags {
>      pub const __GFP_NOWARN: Flags = Flags(bindings::__GFP_NOWARN);
>  }
>  
> +/// Non Uniform Memory Access (NUMA) node identifier
> +#[derive(Clone, Copy, PartialEq)]
> +pub struct NumaNode(i32);
> +
> +impl NumaNode {
> +    /// create a new NUMA node identifer (non-negative integer)
> +    /// returns NumaError if a negative id is specified
> +    pub fn new(node: i32) -> Result<Self,NumaError> {

.. then this will be just -> Result<Self>


> +        if node >= 0 { Ok(Self(node)) }
> +        else { Err(NumaError) }

Have you run `make rustfmt`? This code style looks weird to me.

> +    }
> +}
> +
> +/// Specify necessary constant to pass the information to Allocator that the caller doesn't care
> +/// about the NUMA node to allocate memory from
> +pub mod numa_node {

Nit: I think we can name this mod as just 'numa'.

> +    use super::NumaNode;
> +
> +    /// No preference for NUMA node
> +    pub const NUMA_NO_NODE: NumaNode = NumaNode(bindings::NUMA_NO_NODE);
> +}
> +
>  /// The kernel's [`Allocator`] trait.
>  ///
>  /// An implementation of [`Allocator`] can allocate, re-allocate and free memory buffers described
> @@ -156,10 +182,41 @@ pub unsafe trait Allocator {
>      fn alloc(layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError> {
>          // SAFETY: Passing `None` to `realloc` is valid by its safety requirements and asks for a
>          // new memory allocation.
> -        unsafe { Self::realloc(None, layout, Layout::new::<()>(), flags) }
> +        unsafe {
> +            Self::realloc_node(None, layout, Layout::new::<()>(), flags, numa_node::NUMA_NO_NODE)
> +        }

I don't think this change is necessary, because you implement
`Self::relloc()` below based on `Self::realloc_node()`?

>      }
>  
> -    /// Re-allocate an existing memory allocation to satisfy the requested `layout`.
> +    /// Allocate memory based on `layout`, `flags` and `nid`.
> +    ///
> +    /// On success, returns a buffer represented as `NonNull<[u8]>` that satisfies the layout
> +    /// constraints (i.e. minimum size and alignment as specified by `layout`).
> +    ///
> +    /// This function is equivalent to `realloc` when called with `None`.

s/realloc/realloc_node

> +    ///
> +    /// # Guarantees
> +    ///
> +    /// When the return value is `Ok(ptr)`, then `ptr` is
> +    /// - valid for reads and writes for `layout.size()` bytes, until it is passed to
> +    ///   [`Allocator::free`] or [`Allocator::realloc`],

/// [`Allocator::free`], [`Allocator::realloc`] or [`Allocator::realloc_node`]

?

> +    /// - aligned to `layout.align()`,
> +    ///
> +    /// Additionally, `Flags` are honored as documented in
> +    /// <https://docs.kernel.org/core-api/mm-api.html#mm-api-gfp-flags>.
> +    fn alloc_node(layout: Layout, flags: Flags, nid: NumaNode)
> +                -> Result<NonNull<[u8]>, AllocError> {
> +        // SAFETY: Passing `None` to `realloc` is valid by its safety requirements and asks for a

s/realloc/realloc_node

Regards,
Boqun

> +        // new memory allocation.
> +        unsafe { Self::realloc_node(None, layout, Layout::new::<()>(), flags, nid) }
> +    }
> +
> +    /// Re-allocate an existing memory allocation to satisfy the requested `layout` and
> +    /// optionally a specific NUMA node request to allocate the memory for.
> +    /// Systems employing a Non Uniform Memory Access (NUMA) architecture contain
> +    /// collections of hardware resources including processors, memory, and I/O buses,
> +    /// that comprise what is commonly known as a NUMA node.
> +    /// `nid` stands for NUMA id, i. e. NUMA node identifier, which is a non-negative
> +    /// integer if a node needs to be specified, or NUMA_NO_NODE if the caller doesn't care.
>      ///
>      /// If the requested size is zero, `realloc` behaves equivalent to `free`.
>      ///
[...]
