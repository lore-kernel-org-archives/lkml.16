Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAB222A7E5
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 08:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746174940; cv=none; b=hfO4T5xf0FpAU5NdLJP1vTmvjDtO0ZNHTS9aaIyFpDXH2w40Ss6x5Wpcf4GkyX2GWmguVRRN0cyW3e/O6JmxaalL0PLrL+4RkZuhsL4fKSyKSWMd2qqg0M9xjKvTOe0wFslTzvSjTv8HW290tsATpvULF8DTyjy8ka4rm+3UwvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746174940; c=relaxed/simple;
	bh=LUBY75erqJBugAhNu+5GPQ9ZxN0mQ9SsLVRTeLJn3zs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qIl7h0NBCDEme+CeGH+NDaLdzLWpTPbGe0he2G6gP8Vds7hjBEdxtbHxzYjLaoR5IRBdlWnG+h7FXjfE62VqQtBGMYK5bsW/RqBOJUtBFxEWOrnlRQz02+EZ8y/oVWkMu10dC7j1mzWV+lRLQMIycMeFMBLofkDA1t8OonT61cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lHBPwyTa; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lHBPwyTa"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d734da1a3so6914595e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 01:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746174937; x=1746779737; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f7r6WR049enygy037lONQ9m9pD13OBTo4e15DUJyoKE=;
        b=lHBPwyTa1A7MHnIeD2Ba9CUh5JzMIrcQ/qkuTgNmt7BO3hWaSSqfq72FH/WugH21or
         6pPy6tPulSkQnkogT9oUOKGR5HTQQzyz2bAVrLb/he0sN25DbJK7CNW0ez4bnrvPVAHu
         tA67e72bjpqltxxwKjuK8yoLR+fIPcGAIge+V7V4Bo8IDEv8R+BlY92KZzMqFDr6vaDL
         MqCBwbiHrToi202x/zP/2PGogcREm6BsPI+9eYFcPVB7pxe51j0u/mM8GD9uevcHMofq
         2ELgc0Qv1lm+TPsBsK4r9sY7gEy59pnL80/0Zpcc3Fp0c5Ct8FjlQ+dJnMJupLcVOTLD
         V82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746174937; x=1746779737;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f7r6WR049enygy037lONQ9m9pD13OBTo4e15DUJyoKE=;
        b=ZvxF7CxiwOnIdbIjFuIfyehoPQgjghHLjSIYZYUVIrJS/0045c2/H3XJkOtSJuDVTy
         eftbw2eRfNWs6YpdwGsRX09JmQYLr2hbejs9JImDVHzkyISw6t7nSj62Evh2vQ7QqF6I
         2ugD5y1nIVKouadDHUUMKM03EWmxjTZqcARQkIzzDS24w7EZWzFrLezukTzJFHBMJ7Kw
         D/isOz3a97/m/EGdF2btXgEZ4jB+Af15le0FwTQW/lJ1t0q8Nx02FeDK/qpNVsWtVq3T
         DkjzIJQgwKCh7c69U6xPPDOOvIJcrxXsgPDnih1NPnCVbMmB0jXV1IgZC2ydqwwogGf1
         MGPA==
X-Forwarded-Encrypted: i=1; AJvYcCUOCEA77orb7IkyRmO1BAhQCWnb7gRi9R4XhrRHmBdbswZRZg8xc4EaV5NXrKAHBQigtmcZrS24Pwc2ODA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9y8PsRANRx03jHSqUFYTc7dSA63IUpkYd+ZhLfsTzaDvhonty
	tpwEtaYeGVHKGZ7wns3xCZeu76gSVI1UxJ+2xTaSBT2tYQSPnlHDciilM80ixH5H4Zl98tV26Gp
	UooDSx3OE1P0AQQ==
X-Google-Smtp-Source: AGHT+IGJkCdyZwfRFOBv6xVkehjXZ02i6s82Mg6JkS5KgBztkzCNpCn2kt3Ktou857DyL5RBsEPF7VOnppmsNZo=
X-Received: from wmbjg12.prod.google.com ([2002:a05:600c:a00c:b0:43c:eaf6:525e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:820d:b0:43c:f8fc:f69a with SMTP id 5b1f17b1804b1-441bbe98fbbmr16071135e9.4.1746174937358;
 Fri, 02 May 2025 01:35:37 -0700 (PDT)
Date: Fri, 2 May 2025 08:35:35 +0000
In-Reply-To: <d5e8e635-08c4-4d3d-99a8-27f3b3a2153b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com>
 <20250430-rust_unsafe_pinned-v2-1-fc8617a74024@gmail.com> <D9JVKYI3LL5L.2SFOJMSK91HLA@kernel.org>
 <d433986a-fdad-4859-b8bf-080a18158189@gmail.com> <D9L1TI5NVKJU.361JFPWMLDWN4@kernel.org>
 <7bc9f839-a69a-4819-ba6d-36eadd8776b3@gmail.com> <D9L6XO6T7JEU.CK47C5BOQ0NG@kernel.org>
 <d5e8e635-08c4-4d3d-99a8-27f3b3a2153b@gmail.com>
Message-ID: <aBSD108aP1pATvrn@google.com>
Subject: Re: [PATCH v2 1/3] rust: add UnsafePinned type
From: Alice Ryhl <aliceryhl@google.com>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, Sky <sky@sky9.dev>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, 
	"Gerald =?utf-8?Q?Wisb=C3=B6ck?=" <gerald.wisboeck@feather.ink>, Ralf Jung <post@ralfj.de>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, May 02, 2025 at 02:08:13AM +0200, Christian Schrefl wrote:
> [cc Ralf]
> 
> On 02.05.25 12:51 AM, Benno Lossin wrote:
> > On Thu May 1, 2025 at 9:11 PM CEST, Christian Schrefl wrote:
> >> On 01.05.25 8:51 PM, Benno Lossin wrote:
> >>> On Wed Apr 30, 2025 at 7:30 PM CEST, Christian Schrefl wrote:
> >>>> On 30.04.25 11:45 AM, Benno Lossin wrote:
> >>>>> On Wed Apr 30, 2025 at 10:36 AM CEST, Christian Schrefl wrote:
> >>>>>> +/// This implementation works because of the "`!Unpin` hack" in rustc, which allows (some kinds of)
> >>>>>> +/// mutual aliasing of `!Unpin` types. This hack might be removed at some point, after which only
> >>>>>> +/// the `core::pin::UnsafePinned` type will allow this behavior. In order to simplify the migration
> >>>>>> +/// to future rust versions only this polyfill of this type should be used when this behavior is
> >>>>>> +/// required.
> >>>>>> +///
> >>>>>> +/// In order to disable niche optimizations this implementation uses [`UnsafeCell`] internally,
> >>>>>> +/// the upstream version however will not. So the fact that [`UnsafePinned`] contains an
> >>>>>> +/// [`UnsafeCell`] must not be relied on (Other than the niche blocking).
> >>>>>
> >>>>> I would make this last paragraph a normal comment, I don't think we
> >>>>> should expose it in the docs.
> >>>>
> >>>> I added this as docs since I wanted it to be a bit more visible,
> >>>> but I can replace the comment text (about `UnsafeCell`) with this paragraph
> >>>> and drop it from the docs if you want.
> >>>
> >>> I think we shouldn't talk about these implementation details in the
> >>> docs.
> >>
> >> Alright, what do you think of:
> >>
> >> // As opposed to the upstream Rust type this contains a `PhantomPinned`` and `UnsafeCell<T>`
> > 
> > There are two '`' after PhantomPinned.
> > 
> >> // - `PhantomPinned` to avoid needing a `impl<T> !Unpin for UnsafePinned<T>`
> > 
> > s/ a / an /
> > 
> > I find the phrasing 'avoid needing <negative impl>' a bit weird, I'd
> > just say "`PhantomPinned` to ensure the struct always is `!Unpin` and
> > thus enables the `!Unpin` hack".
> 
> Thanks I'll use that.
> 
> > 
> > If you have a link to somewhere that explains that hack, then I'd also
> > put it there. I forgot if it's written down somewhere.
> 
> I haven't found anything that describes the hack in detail.
> From what I understand its a combination of disabling `noalias`
> [0] (this PR enables it for `Unpin` types) and disabling 
> `dereferencable` [1] on `&mut !Unpin` types.
> Related rust issue about this [2].
> 
> Maybe Alice, Ralf or someone else form the rust side can provide
> a better reference?
> 
> [0]: https://github.com/rust-lang/rust/pull/82834
> [1]: https://github.com/rust-lang/rust/pull/106180
> [2]: https://github.com/rust-lang/rust/issues/63818

I wrote this a long time ago:
https://gist.github.com/Darksonn/1567538f56af1a8038ecc3c664a42462

But it doesn't really take the angle of explaining the !Unpin hack. It's
more of an early doc arguing for having an UnsafePinned type.

Alice
