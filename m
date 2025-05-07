Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A4B4B1E5D
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 08:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746607298; cv=none; b=uYjR/Csh7x0CMVwPmmT9zMkjCqy1zwnGEj7OZgeztR2YB99imw8xIrTYTZeJeBF5D4PY4pqnZBH+6dyTk3UCIy3a7cpZl6Y54OwQJJk8z6dNRRQvTSQ6HC3rzl/b6xC/w69OM7QFHfAnUtjilj+qRSkk5ka2ghqGP2REGdZN4BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746607298; c=relaxed/simple;
	bh=cjJuTrZu+3Vc8bh9TFTKyaM/Xj3qcqCITNeeBaivs0A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XWkMtd5yMNeE6MAGLHWFera6qzUBJquMafP/BIizVTgXxjskWRJOYhgymLFOKvizKNfksT50FUqfYV1Mx7LV6oTEqZ74Fl+th8c5NcYI2c8zgV7bQJIT3CoMo3NoVdAcYF2zQoLKvBF68WzIDHd/mphiFTmPEvefyKUKiKhPcT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R0YCcm8m; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R0YCcm8m"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf172ff63so32854825e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 01:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746607295; x=1747212095; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OHVU9LpqU+6SrvxGXGLpeAb6/atL3y2Ymj53f2bTkWM=;
        b=R0YCcm8m5Ckc8pHguNhtU3JCbRuOAGLRmYR47Nge0kb1N/grxtxQwEsmEE64pu7qY4
         Dmt2QAIB7ijlRSLALMIzZgC9Ql+bSBGMO+0L7jwMtPP1QCbt5Oysg+Iva1f4rxc2mCrw
         Hc7+8uGpMnlfz741/7VyVfNF/9P+mfyNFB73XZy+cBZjILbanmPm222KvxM/gPldDQnn
         1QeWunmXeV4U/E6P4oXbamdtrOT0cRe2NqB7ecx7OQRJK7QOSVO5ypTqjg1qIpTJOpFM
         nQog1NvcWK1nvOpvZYg+jXYoyaJMV5xAWDlJGmV2JaMKmuUYxXZsd+eahEa5+h4vJy7F
         U+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746607295; x=1747212095;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OHVU9LpqU+6SrvxGXGLpeAb6/atL3y2Ymj53f2bTkWM=;
        b=Tzdt1Ryf0xN8Ojcjdj2MmU9rH/NaaBgwj2xSdUIzGNcYO+F3N7kJayq62UZn81F0fx
         tWdTCI9b6fINlvlQ0a6y8Ccfhq6GkToaNXvVDWA6AJo+CYUISdvUNiWqkRK4iuw8AG5y
         Mh2rYctMODjZdfX//yLdgyd5shCwGihj/CaEVx8w0RNOiZpi8HF5MAxcJxHhz4IOqxX3
         l1Fj8SkYA+rekAUjTnc/R2qQxetz4LTHSZR3I4HlAbvJIuExi5eo0Lt1TeqgpP1VjN+h
         Cwe5lQCvv9Y1YD4WUS3W15FkyObJB8XFHl4+wad95eTHVzAzpb3Z4HVYkixAc1Oa+hNs
         EKdg==
X-Forwarded-Encrypted: i=1; AJvYcCWsEI3DXJqZ5nJ81jO0GErMRrZUmwJdujEBmdtrVntRw2uoB9VBWiyz5I0LQ39coSlLyDCCQIo7CEtiWW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXoRNPYWTPnFjURTjnY6k+RLV4nW79q4doCBvguLLRX3qGKKnt
	A4cO7iS/4JiAaU62m1xJIrBGB/4EIikMbVBERhglc2hYKgNwxzBDH+kXLrQz/XM1zTgvuGUYL7X
	Izlbq85G3plwc/w==
X-Google-Smtp-Source: AGHT+IENg9KN7gnKRmoV3shqKQEW6l/POb1KRWOlYwRFpAwdf65TgaQaCf/Ky7+O4/CkDaWL2nQsLkySfyald70=
X-Received: from wmbdr11.prod.google.com ([2002:a05:600c:608b:b0:43d:5828:13ee])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3d17:b0:43c:f4b3:b094 with SMTP id 5b1f17b1804b1-441d44bc6ddmr16122895e9.6.1746607294944;
 Wed, 07 May 2025 01:41:34 -0700 (PDT)
Date: Wed, 7 May 2025 08:41:32 +0000
In-Reply-To: <D9PSH8MJ48JO.3OOA3Z3NSBGC9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250506-aref-from-raw-v2-1-5a35e47f4ec2@kernel.org> <D9PSH8MJ48JO.3OOA3Z3NSBGC9@kernel.org>
Message-ID: <aBscvBwCD1o0OC_v@google.com>
Subject: Re: [PATCH v2] rust: elaborate safety requirements for `AlwaysReferenceCounted`
From: Alice Ryhl <aliceryhl@google.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Oliver Mangold <oliver.mangold@pm.me>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, May 07, 2025 at 10:35:16AM +0200, Benno Lossin wrote:
> On Tue May 6, 2025 at 10:29 AM CEST, Andreas Hindborg wrote:
> > diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> > index 9d0471afc964..52683d686c8a 100644
> > --- a/rust/kernel/types.rs
> > +++ b/rust/kernel/types.rs
> > @@ -409,6 +409,10 @@ pub const fn raw_get(this: *const Self) -> *mut T {
> >  /// Implementers must also ensure that all instances are reference-counted. (Otherwise they
> >  /// won't be able to honour the requirement that [`AlwaysRefCounted::inc_ref`] keep the object
> >  /// alive.)
> > +///
> > +/// Implementers of this trait must ensure that values of types implementing this trait can never be
> > +/// owned by value. Instead, values must be owned and used through a pointer type. That is, a type
> > +/// that implements [`Deref`].
> 
> I don't think this covers every case, if I modify your example above
> with Alice's suggestion and using `Box` instead of the stack, I get the
> same problem:
> 
>     struct Empty {}
>  
>     unsafe impl AlwaysRefCounted for Empty {
>         fn inc_ref(&self) {}
>         unsafe fn dec_ref(_obj: NonNull<Self>) {}
>     }
>  
>     fn unsound() -> ARef<Empty> {
>         use kernel::types::{ARef, RefCounted};
>  
>         let data = Box::new(Empty {});
>         let aref = ARef::from(&data);
>  
>         aref
>     }
> 
> The same should be true if one uses `Arc` instead of `Box`. So, even
> though we store it in a "pointer type that implements `Deref`", it is
> unsound.
> 
> I think that types that implement `AlwaysRefCounted` must only be store
> inside of `ARef<T>`. So something like "Values of this trait must only
> be exposed as `ARef<Self>` or `&Self`." I'm not satisfied with the
> wording 'exposed', maybe you have a better word or can expand the
> sentence.

I mean, in some sense the problem is that Empty violates the existing
requirement:

Implementers must also ensure that all instances are reference-counted.
(Otherwise they won't be able to honour the requirement that
[`AlwaysRefCounted::inc_ref`] keep the object alive.)

Alice
