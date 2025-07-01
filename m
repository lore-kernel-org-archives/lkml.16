Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B52E273819
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370766; cv=none; b=Acr/pKNpOxYfczfi2rmkg49eVUpSBJ7VYzuuWsbkZnpYeki8+4dCeYveGKmj0yBrCmnusxnmYxN845Uo8k29MIk4fcku5poiEoOVC/Eg0vafI/TMLKMhMPrWqQ+bpV0Nmv3unQPjizk6X4+CDePcZooBO2PMNOxUR9XfTpyXzl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370766; c=relaxed/simple;
	bh=jrHyPTE0Cbbg51nU/1dDVkkk444gMusx+i7f5CaT3BM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UyBTWtiOEV3wu5pO0nL5SB/m7oL7nL+T9XGDfKNAtQZz5Im6I3J5lLYdjHuWiryXfCiPnGq9K/yvouvJfdB+cnc9whOXTMWSGeIM/sAA5eMch7JI8O/rbcludsUVmeZnim/6GANzKn4hH/SERbYxCMSR+fdEjAeStuywSDoJl+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UZ+VDBVv; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UZ+VDBVv"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so3213386f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751370762; x=1751975562; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veoFO+1wdpPDWz3qRkvkxT3szkUu/z2wjkK1DneZyWM=;
        b=UZ+VDBVvIPiPg+KusvlM1G13dxaBGmTxAHDPOhozNVmQ4QQaMCKXI44cJTUy4z/E4H
         mGYecZsXg0KR7EJ4BM7G5VibZne/WSo1NpG1yM+s3+4p22UL+IXiEgXdWdi9utxWUE8K
         DoIwmqth+I8ukbb57iVMTu+/d3HgdEYtqO11xBTA9JKciT2O4EWiAj62f973pT0ZZmOY
         mUGJSaS5DJnLoCsLUd1KWqo4BN2vs3m/Ur4NZ80lX1NeY5Jq0Ter+QAmfYVDTP2lePgf
         0Ini4agqU+8AuCsFBgVvfW4vEUab9Pi4uZyFC2jOtmH3way9Z/4wMDIU/y9fWL8bK4H+
         OQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370762; x=1751975562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=veoFO+1wdpPDWz3qRkvkxT3szkUu/z2wjkK1DneZyWM=;
        b=OUib5UufDDsl/9fCut/8jzTQKbWkoa7mytil0MfVC/NwevGItx0XzCqsDtOI0ov9Te
         tSlkdZESuZGJmeD12Cgtfu6ToczGhX1wrTXmg0s/bjHK5Px6vLa6jl5g07XjLOKo9vp4
         dWc1i6EUAAoIA+hzMotq9oZ/gz6NPU34H8JsEYcT1mYrKyEqiap3CAISmQeq83lflQLc
         FEbY0cPn3RKv2VTeH8hPMQNp3v0Uz/wduZZ6edJKgIK2dPK4by3oUijspMlRe2cS+uAB
         XnzwCWdJaamkdxQzJ6Jt9GK30usAYvw6N2X6yalrmNarVn9YnssMo2qMG8Q64WMwUXXt
         E1ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTPLP4ryHWhBtS3QiUmWDH595ws8ZriY2FNb5+s09Z0hEJkAESTfd2NUctGmM1F1QklUl03Jr6nR2zndk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQr9ZHFEH0kOH0vpuphh1KzASV9/MKjQUvxNU8XpEfV66cBgR4
	rD5odBzAQIfhig4M/dvL3QFw1cOwjmo5gWFAfXGL+OY/zKYjDoE7GIVNrzoIynKcXrXZSUk0Lp+
	dL2fy8JGcMQJFGxaj8rXLoUaovbhaZfTVC3cF7pmiu9H/CbnODwi7HzcF
X-Gm-Gg: ASbGncvivTAd1tqdrFVlE024iMjOUtnrLkaCiIx4mCz0FLBPqpHtvPqgrkgIpljozl6
	6Z3NexA28+fKc/ly+MEN2nJpTp0MfUoqNX2ZtWRuIBStLjtt6jp3xBcJlZnJX3DhoP/lGNqomOl
	SypumWjd5AFHxOYXJqQrJDZJGxSD9mb2g7MizzaQVZXLa8FMtVCG1er50=
X-Google-Smtp-Source: AGHT+IFUlJySjsgWCyutnog4gDVqPy3/yBi31gYRy/p63NPCINHZ/bW019+CCuJmHTVh0LKrHnBPA0F6FZ0BNIhxi30=
X-Received: by 2002:a05:6000:2188:b0:3a5:2465:c0c8 with SMTP id
 ffacd0b85a97d-3a8fdb2acd9mr11587808f8f.7.1751370762366; Tue, 01 Jul 2025
 04:52:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630221511.3325123-1-vitaly.wool@konsulko.se>
 <20250630221640.3325306-1-vitaly.wool@konsulko.se> <aGO5qadROziFuO35@google.com>
 <3D58CB40-CB1C-47A2-BB71-5C32B3609AE0@konsulko.se>
In-Reply-To: <3D58CB40-CB1C-47A2-BB71-5C32B3609AE0@konsulko.se>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 1 Jul 2025 13:52:29 +0200
X-Gm-Features: Ac12FXzcpTlny4SSlNLGwk5zd2CXwwCXOFc_w3xt_vRf8kazpRdDDaXsreX05Ek
Message-ID: <CAH5fLghKvWgaVT_=TYpwqBJ4z_XYDbT8kbLvkxAT95+Sjg5zYg@mail.gmail.com>
Subject: Re: [PATCH v9 3/4] rust: add support for NUMA ids in allocations
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 1:19=E2=80=AFPM Vitaly Wool <vitaly.wool@konsulko.se=
> wrote:
>
>
>
> > On Jul 1, 2025, at 12:34=E2=80=AFPM, Alice Ryhl <aliceryhl@google.com> =
wrote:
> >
> > On Tue, Jul 01, 2025 at 12:16:40AM +0200, Vitaly Wool wrote:
> >> Add a new type to support specifying NUMA identifiers in Rust
> >> allocators and extend the allocators to have NUMA id as a
> >> parameter. Thus, modify ReallocFunc to use the new extended realloc
> >> primitives from the C side of the kernel (i. e.
> >> k[v]realloc_node_align/vrealloc_node_align) and add the new function
> >> alloc_node to the Allocator trait while keeping the existing one
> >> (alloc) for backward compatibility.
> >>
> >> This will allow to specify node to use for allocation of e. g.
> >> {KV}Box, as well as for future NUMA aware users of the API.
> >>
> >> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
> >
> > My main feedback is that we should consider introducing a new trait
> > instead of modifying Allocator. What we could do is have a NodeAllocato=
r
> > trait that is a super-trait of Allocator and has additional methods wit=
h
> > a node parameter.
> >
> > A sketch:
> >
> > pub unsafe trait NodeAllocator: Allocator {
> >    fn alloc_node(layout: Layout, flags: Flags, nid: NumaNode)
> >                -> Result<NonNull<[u8]>, AllocError>;
> >
> >    unsafe fn realloc_node(
> >        ptr: Option<NonNull<u8>>,
> >        layout: Layout,
> >        old_layout: Layout,
> >        flags: Flags,
> >        nid: NumaNode,
> >    ) -> Result<NonNull<[u8]>, AllocError>;
> > }
> >
> > By doing this, it's possible to have allocators that do not support
> > specifying the numa node which only implement Allocator, and to have
> > other allocators that implement both Allocator and NumaAllocator where
> > you are able to specify the node.
> >
> > If all allocators in the kernel support numa nodes, then you can ignore
> > this.
>
> This is an elegant solution indeed but I think that keeping the existing =
approach goes better with the overall kernel trend of having better NUMA su=
pport. My point is, if we add NodeAllocator as a super-trait and in a fores=
eeable future all the Rust allocators will want/be required to support NUMA=
 (which is likely to happen), we=E2=80=99ll have to =E2=80=9Cflatten=E2=80=
=9D the traits and effectively go back to the approach expressed in this pa=
tch.

If we are not going to have allocators without numa support, then what
you did is reasonable. Though in that case I would consider just
changing the existing methods instead of having methods both with and
without a numa node argument.

Alice
