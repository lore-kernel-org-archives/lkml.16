Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D0320C48C;
	Mon, 16 Jun 2025 17:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750096722; cv=none; b=NOgFoO0nYLVl+gcT2ybsp2foyD74K/87W6K8Z+8n9ZuHtwaS+qFYPHLjBHULH+lJ+dkYQ0Jxn3xX3ee5N4CCy7RnqcmlSJNd2BYhQDQj1AstnN2WUKDn8bUxl/ubLFEJSTfIW9z6mrpkQM0XommHEgTSVd+T0o4/RU60/vkpC9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750096722; c=relaxed/simple;
	bh=WUnBXy4UGJ7CwPKoJusYFc+9qxb9HkzRV/5y40X2gsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQ6hWy1PmjHuvfm98O/PCTzlNuxy89reN9oayLoIu/JWZMC/FcGIIVB2SnlgzX4vf8srlmITYc9kBLSPCcEakK/IEPviGoGNEn5iYt9rO/6BSVrjeoEUq4AJXBLmsj+oOwtIvdwK30Mm1tdc3aifkKORicRSEjcYTSn8BcI1u2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOGr2INU; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOGr2INU"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d3dd14a7edso63765285a.2;
        Mon, 16 Jun 2025 10:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750096719; x=1750701519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5pazrYyWEz4eIxfaDRY6bcXW1uRUfVgIN+9zpzgkI8=;
        b=XOGr2INUoPLH998Olg0pkz4PID4HWwmq6pUF6EWMBzJnLqMou32ARAsHGQtGYiNMvi
         GcEQbOIgccvaLTjZk9BmtG6M4LZHck6JC2AgI6oSfRVOO5xgLtm682th8PZ/3RngGp39
         jJxmysfGi70tbfRn+47jyLxNJ+bdfHPM4QeAqEIatBQD0rJfoYIEmE830Q+FPEGtYRto
         Be2yFGaAR8qiLdcT40oWkgI12clqu7TjvPZDaD2Vh/hCd6yTA9EqaSL6XJY4tkTa7XKh
         HEBAI6AXDY3Cloc+sbHQ68qxwwIbJe8SdEg58uMQE+mfTB1A0KGr6LRNR8M7AGpFGCHz
         w6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750096719; x=1750701519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y5pazrYyWEz4eIxfaDRY6bcXW1uRUfVgIN+9zpzgkI8=;
        b=p0qu59zvA/eYpGgoXgb9TVNZbWMN5+lTDTGBKeTkPzj03CEdJuqFTTpVfuwSkswb4j
         SrtvFw8WqWt7a+W8d8bcFZF2YcB6enp3EuFX/fJNqgqlAQpoCkq85UKiOR6aqs2l1Zdy
         Xr6gn2XNejxq1JG1y9dK6CT/cVKij/fZyXHrko/i0F6vCc1eI1obhxWVoHMgRUo9TbNB
         tkJPI6Uj/dz7pmfi4l0H+/+Kr7zFHQbtaKRWhCAbcFlMRRUKw2YNEydr9Nna84uSbWLx
         rQhfIzmMUmh/3LQLfVOTMugZrpIHedp1b1AY2ezb8xJdnXjxHFNG45cDV0MhgOwTF1Lr
         7Mow==
X-Forwarded-Encrypted: i=1; AJvYcCX9MfIXbpw3GTXxsrL9MSTeSSyhmokh7rJp38NH7eQy2rz2HvM5PP0kbs57f2rCWTtfOT4kJtNRxkFBkEKUbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQHEp97jlYZjz1zmSa7a0cg5Km89lmfPmLYiHwg8c67Dqe0y+G
	Sq27hQQI/hnR27RZ0yde0aANGe92bOAdsL80MMWOpCsIwQHSPXXLn5/h
X-Gm-Gg: ASbGncufCwZ9XAQ0fh8r1ps37UsjOoL/v1xpQHSI9fRR4UVDscOQIT1dgtr8Z0Tavlp
	+vpztIcIujp3gdE1jQRP1G9jdT+XcRo9nZyFqyFXmZtLse1EbSeKnhwkunweNbiUiKEkeNPuKTQ
	uRrTor9u3hV0aUay5rrAz9Bkw29zUJ3lcTQDoRjXA+XCFGGGIggCCjNJFqjiPwS22MvakPdMPxh
	g0ZT+Z5qqbUHPhGYNVvqjNMWyITvpcI6Bqu4waz44DNex9Nc7OwUstK+EH6lKVywcYzPKQJ7pe9
	D2YMUWIXqqHT55ZMORFW5IT3xWjYAkjtMvy0r+P7x3WAo0jbITGsuPAMWZLhhvjwJxTn3OsFKTK
	1okjP0cF3j8QrFE0we+CbsqNa+K56CF/UhHLLjHh0Gig/X3CXSK28js4SQ6VrKsM=
X-Google-Smtp-Source: AGHT+IGUnExjV+TU1sVdKTKpNzo6ZBjTDtNUv+IqWfF8lBXQ6aqVqPYcM3WlbfXjYmVVFlcF8AS50Q==
X-Received: by 2002:a05:620a:bd5:b0:7d3:9012:75c4 with SMTP id af79cd13be357-7d3c6ceedfamr1540536385a.44.1750096719425;
        Mon, 16 Jun 2025 10:58:39 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8eb80c7sm554991485a.61.2025.06.16.10.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 10:58:38 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 583231200043;
	Mon, 16 Jun 2025 13:58:38 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 16 Jun 2025 13:58:38 -0400
X-ME-Sender: <xms:TltQaFSnk3C7iPaiIKAD2RL68L_p-9IFJfs-juIaHJX1Ih4fPpq9bg>
    <xme:TltQaOzSmfhNKTzM3KaPd33iGcNo44lWg-LncrzstqZrz5rPvfYjDFPTURYiBj1Mb
    HVRbCizBvDJta50Bg>
X-ME-Received: <xmr:TltQaK0u7x2MoHvpZtXJF3YrYtYYFDYJLs2N5Xb1paBJu77IaYr7QW4KiA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvjedvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdortddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepiedtfeevhfetkeelgfethfegleekfeffledv
    vefhheeukedtvefhtedtvdetvedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeduledpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepfihorhhksehonhhurhhoiihkrghnrdguvg
    hvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepthhhrghtshhlhihuuggvsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgih
    nhhorhesghhmrghilhdrtghomhdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrg
    hilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphht
    thhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhope
    hlohhsshhinheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:TltQaNC5JfWmqiiGf3KD4NyYZWgrub08VyarnU0IpnH8kZB6S_OR-g>
    <xmx:TltQaOjBBC53ZmXd0UDEQkYUFZ1ji0sqfDeAKk0QIpm5r-pEbQlTSA>
    <xmx:TltQaBqcA1EZab0yZaMfGt-FAx8natUMhMJ24RPjuCCjnTwZyJP7iQ>
    <xmx:TltQaJhkXqMr-ypQ0JfZ2RN_3d9h59khoKovlCUKDPytZtWyaVoU7Q>
    <xmx:TltQaJQxYvJ_ze-XIUlYh13MNLb5H2AK6sXBM2MM-w2II-xn75cY1uk2>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jun 2025 13:58:37 -0400 (EDT)
Date: Mon, 16 Jun 2025 10:58:36 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: onur-ozkan <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, thatslyude@gmail.com,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH] Add `ww_mutex` support & abstraction for Rust tree
Message-ID: <aFBbTMMTHrgHwVFJ@Mac.home>
References: <20250616162448.31641-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616162448.31641-1-work@onurozkan.dev>

Hi,

Thanks for the patch.

[Add Rust and Locking]

Could you please cc more people and lists for the next version? You
can find that information via `scripts/get_maintainer.pl` or the
"LOCKING PRIMITIVES" and "RUST" sections in MAINTAINERS file in the
kernel source.

Some comments from a quick look:

On Mon, Jun 16, 2025 at 07:24:48PM +0300, onur-ozkan wrote:
[...]
> +/// Implementation of C side `ww_class`.
> +///
> +/// Represents a group of mutexes that can participate in deadlock avoidance together.
> +/// All mutexes that might be acquired together should use the same class.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::sync::lock::ww_mutex::WwClass;
> +/// use kernel::c_str;
> +///
> +/// let _wait_die_class = unsafe { WwClass::new(c_str!("graphics_buffers"), true) };
> +/// let _wound_wait_class = unsafe { WwClass::new(c_str!("memory_pools"), false) };
> +///
> +/// # Ok::<(), Error>(())
> +/// ```
> +#[repr(transparent)]
> +pub struct WwClass(Opaque<bindings::ww_class>);
> +
> +// SAFETY: `WwClass` can be shared between threads.
> +unsafe impl Sync for WwClass {}
> +
> +impl WwClass {
> +    /// Creates `WwClass` that wraps C side `ww_class`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that the returned `WwClass` is not moved or freed

You can make WwClass #[pin_data] & !Unpin as well.

> +    /// while any `WwMutex` instances using this class exist.
> +    pub unsafe fn new(name: &'static CStr, is_wait_die: bool) -> Self {
> +        Self(Opaque::new(bindings::ww_class {
> +            stamp: bindings::atomic_long_t { counter: 0 },
> +            acquire_name: name.as_char_ptr(),
> +            mutex_name: name.as_char_ptr(),
> +            is_wait_die: is_wait_die as u32,
> +
> +            // `lock_class_key` doesn't have any value
> +            acquire_key: bindings::lock_class_key {},
> +            mutex_key: bindings::lock_class_key {},
> +        }))
> +    }
> +}
> +
> +/// Implementation of C side `ww_acquire_ctx`.
> +///
> +/// An acquire context is used to group multiple mutex acquisitions together
> +/// for deadlock avoidance. It must be used when acquiring multiple mutexes
> +/// of the same class.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::sync::lock::ww_mutex::{WwClass, WwAcquireCtx, WwMutex};
> +/// use kernel::alloc::KBox;
> +/// use kernel::c_str;
> +///
> +/// let class = unsafe { WwClass::new(c_str!("my_class"), false) };
> +///
> +/// // Create mutexes
> +/// let mutex1 = unsafe { KBox::pin_init(WwMutex::new(1u32, &class), GFP_KERNEL).unwrap() };
> +/// let mutex2 = unsafe { KBox::pin_init(WwMutex::new(2u32, &class), GFP_KERNEL).unwrap() };
> +///
> +/// // Create acquire context for deadlock avoidance
> +/// let mut ctx = KBox::pin_init(
> +///     unsafe { WwAcquireCtx::new(&class) },
> +///     GFP_KERNEL
> +/// ).unwrap();
> +///
> +/// // Acquire multiple locks safely
> +/// let guard1 = mutex1.as_ref().lock(Some(&ctx)).unwrap();
> +/// let guard2 = mutex2.as_ref().lock(Some(&ctx)).unwrap();
> +///
> +/// // Mark acquisition phase as complete
> +/// ctx.as_mut().done();
> +///
> +/// # Ok::<(), Error>(())
> +/// ```
> +#[pin_data(PinnedDrop)]
> +pub struct WwAcquireCtx {
> +    #[pin]
> +    inner: Opaque<bindings::ww_acquire_ctx>,
> +    #[pin]
> +    _pin: PhantomPinned,
> +}
> +
> +// SAFETY: `WwAcquireCtx` is safe to send between threads when not in use.
> +unsafe impl Send for WwAcquireCtx {}
> +
> +impl WwAcquireCtx {
> +    /// Initializes `Self` with calling C side `ww_acquire_init` inside.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that the `ww_class` remains valid for the lifetime
> +    /// of this context.

You can make the type system check this for you by:

    pub struct WwAcquireCtx<'a> {
        #[pin]
        inner: Opaque<bindings::ww_acquire_ctx>,
        #[pin]
        _pin: PhantomPinned,
        _p: PhantomData<&'a WwClass>
    }

and

    impl<'ctx> WwAcquireCtx<'ctx> {
        pub fn new<'class: 'ctx>(ww_class: &'class WwClass) -> impl PinInit<Self> {
	    ...
	}
    }

the lifetime of the reference on WwClass should outlive the lifetime of
WwAcquireCtx.

Similar for WwMutex. BUT all the existing ww_classes are static,
alternatively, you can make Ww{AcquireCtx,Mutex}::new() take a `&'static
WwClass`.

Regards,
Boqun

> +    pub unsafe fn new(ww_class: &WwClass) -> impl PinInit<Self> {
> +        let raw_ptr = ww_class.0.get();
> +
> +        pin_init!(WwAcquireCtx {
> +            inner <- Opaque::ffi_init(|slot: *mut bindings::ww_acquire_ctx| {
> +                // SAFETY: The caller guarantees that `ww_class` remains valid.
> +                unsafe {
> +                    bindings::ww_acquire_init(slot, raw_ptr)
> +                }
> +            }),
> +            _pin: PhantomPinned,
> +        })
> +    }
> +
[...]
