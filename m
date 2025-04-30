Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EB92641E2;
	Wed, 30 Apr 2025 16:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746031451; cv=none; b=mf9G3FNwsnYmSc7CEPasiyq+ESTEH8XyHE/0a8y752+jXlLhcx3ZWkzTQR3awaFzMDwmMnDEfz/jr9JNXp+Nnr3E/PfR+zNqag4k8WyGFa98ByVXHYf4g17B59Bk9f8LFz603oIqfd6ZRslhRl3D3Tqdfmvfl0vTJjcV/8E2uko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746031451; c=relaxed/simple;
	bh=S3qjZUTXyva0KmEUxrdqUlTkUktNeKaOQGn0h0IFgoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=snM4mrHKU+aJ3adNutpOGTGDtpZosoqKwDhP1izanUeqtNc89fKXOpGAWrXJV5kdjwRb732pl0dvytl8LvzvjMk6LmBlvqXfGMwF/YqSj25dfRBcCjkyxaO89bqw05JGhN4VgQPDZQrlMeO0+W5dHuP8dz34BIhYmB7nXrsURJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i986bSwp; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i986bSwp"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e8fd49b85eso1751806d6.0;
        Wed, 30 Apr 2025 09:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746031448; x=1746636248; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=38HytJ3ptnvrdkyB15yGBsGT1lU1pkC9z7I696Nt/eo=;
        b=i986bSwpAOWy4A5OyeQhbVLTmuKFhdYeITdTgSeYUbzQefDN6K9Wwmn3OtTAQzh1KV
         vnwTEaZtzwQM+21pyrTNxggeurLOxuRRccAwbf/h6Yoo00xJYGA2BJysSPuzbsFspyd1
         uCgX3o5oQyetF0NJTdmX26X4FtgOredmLNerCpqL30de5MTnNdoZbCK+uWaHM/vSQQjX
         Gx+x+of0xmo//GxENI8aKKdZnt2aijuif+mDJ3RxmDVCttgOG9AjkcROHBCztZLlEOzR
         P8ttnBHObehhCIjGKn1EK6MGaoxsUqt3eJb+tb6bt9W6AV2cqbN0jV7X7Sb3qRmkbIZI
         IfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746031448; x=1746636248;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38HytJ3ptnvrdkyB15yGBsGT1lU1pkC9z7I696Nt/eo=;
        b=Inm/CjTjd8YY2NN8Dk1sgupcgH12VwjOF5sv7nEjCURaC1RtFcnDHr/dB74dielijx
         Qbsz8F9vt8UNnMJ9r4CY07RLah1CpuYKKnjgW5bY6JXts2EA4+6fFfRQp2eiPOlZ52nl
         GZsXW+wtt4gNoonGVBf2E9UGpOE3OUT+3ugTZ6G19kPzVNRsL77JAM2DRmO1GZH3YoI4
         y0UPK+LVDrkJHfOoQ9QJ6Zy+ZIxuvSa5kduWsHzZDixvVNrqgPMX2bL/7jPUaXwG6U+O
         NWtJYKHJ9Oj0fbBWPH90IFRXtlbbNPyZOTpXp6ikVG6DTnjCohcGToU+ZC0KAcErZuvJ
         m2EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhWU4lDJ5sCaj+wh5TjLb43i8B4SCSKBcEteK1zEOGLHiRnG6HuWqrmBUva7AGO2zv5yy3SMQQqThusnQ=@vger.kernel.org, AJvYcCXFp4fhuuOz0C4fWK0koc4UmLbbM/J8Fp1Hqwp76371QguoO0qKrsC1Rjtexr5Kdl3Rp9CsEHKkQQH4rJDlIdU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7I/pM8zQ74VlCcHomV1gwuWjqK7fN9JxCAGmyYjkLIxkMMql4
	ogYLNcsLHwo37yST7VEjwuYDROPP0gv45Rbfvr0yhWmrgdddU9Be
X-Gm-Gg: ASbGncvq13BQrWx0p3jlCObDBD4Kflfyj9G9oOuAquhUWQzGR5/bz/J06TSxRVUEEg+
	i60XgPCs2JVECB32kz/lvJLXnP3nbqWQ2QdpYPu6MIbsUVO+Ej74js2eDnSN2eUGSMmK9Hvn5RH
	1choMgmpWHI5ue/97lo150+2eYNgqBkp1Kl9wgHibxegswvxm/KdJgiX7Px8vNFthiI1WeR99zm
	BeYYBSpLGeFFaoJOZ7A31Lgw01jycVt08cEDMIu1ecOLHFCegOwhnlfZ0B85spDhiGEVFoDAWQZ
	z/yuaMZUKSxM6NI9fjxx7Q40HQbs00FtPGyN6eV703uPGss0AHXGJBnIUFOb9U0Q6Es4hWJaMnq
	mvjEN4au5vhHaqSRC6ch+QCZd6aS5CEA=
X-Google-Smtp-Source: AGHT+IELc3QOsbfJHY5DjiUe35nZBF1IsikBmL2i03eBmvpdCOFlfBPfvtgumFyhHoyl4DJvOxu7GQ==
X-Received: by 2002:ad4:5ba6:0:b0:6f2:c9e1:8511 with SMTP id 6a1803df08f44-6f4fe1318acmr51772396d6.39.1746031448232;
        Wed, 30 Apr 2025 09:44:08 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4fe87e355sm10106626d6.124.2025.04.30.09.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 09:44:07 -0700 (PDT)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2EDF91200066;
	Wed, 30 Apr 2025 12:44:07 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Wed, 30 Apr 2025 12:44:07 -0400
X-ME-Sender: <xms:V1MSaEfHouxbcjBbh0qGSLLRoK4atfd6IqPpASRVYiRyKJZLkE8OfA>
    <xme:V1MSaGO_wo-gF3IOZnVvKABGJpTT6LZm1Y0G1OWBIswi74JHLq7nYNcDefz8lksCp
    _9HXPuHoCSRrnxiWA>
X-ME-Received: <xmr:V1MSaFjHgm4BamVGxJWBgtQIU38VVMrb7GJsSnZoxB3rfF_GKfOiXAo9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejvdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
    tddunecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrg
    hilhdrtghomheqnecuggftrfgrthhtvghrnheptdegheelveffudejffegvdelgffhhfel
    keeiieefgeevteejvdegveeuffeihefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpe
    epghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeduiedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhrhhishhirdhstghhrhgvfhhlse
    hgmhgrihhlrdgtohhmpdhrtghpthhtohepshhkhiesshhkhielrdguvghvpdhrtghpthht
    ohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnh
    horhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgv
    thdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprh
    gtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdprhgtphhtthho
    pegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvg
    hrhihhlhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:V1MSaJ9cy-aO-laN1Mz6YmIKt1MsrXCyyY2BWWkEhNvo9wujqR7e-A>
    <xmx:V1MSaAsOpXoFKQchFFwx1i1ftnxBTnPH3GvlR5X6wFYBgAlJ-R_Dtg>
    <xmx:V1MSaAF5739Gnydi-LfMq3krcK2hey1sNuaVHrft9PeXgaiCbGf7IA>
    <xmx:V1MSaPP8Nn3NZ84WlI2DSq_xZ_3zcw2Eg0sIx30H0e93DjU8SBLItQ>
    <xmx:V1MSaFPSYKqNRhIdgZM6j8zcMLPLJOh-STX0lMJickTwU4bGm4VabyEx>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Apr 2025 12:44:06 -0400 (EDT)
Date: Wed, 30 Apr 2025 09:44:05 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Sky <sky@sky9.dev>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Gerald =?iso-8859-1?Q?Wisb=F6ck?= <gerald.wisboeck@feather.ink>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Ralf Jung <post@ralfj.de>
Subject: Re: [PATCH v2 3/3] rust: use `UnsafePinned` in the implementation of
 `Opaque`
Message-ID: <aBJTVWsrqzuasx7W@Mac.home>
References: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com>
 <20250430-rust_unsafe_pinned-v2-3-fc8617a74024@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250430-rust_unsafe_pinned-v2-3-fc8617a74024@gmail.com>

[Cc Ralf]

On Wed, Apr 30, 2025 at 10:36:13AM +0200, Christian Schrefl wrote:
> This change makes the semantics of the `Opaque` implementation
> clearer and prepares for the switch to the upstream rust UnsafePinned`
> type in the future.
> 
> `Opaque` still uses `UnsafeCell` even though the kernel implementation
> of `UnsafePinned` already includes it, since the current upstream
> version does not.
> 
> Reviewed-by: Gerald Wisböck <gerald.wisboeck@feather.ink>
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> ---
>  rust/kernel/types.rs | 29 ++++++++++++-----------------
>  1 file changed, 12 insertions(+), 17 deletions(-)
> 
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index f06e8720e012102e5c41e79fd97b0607e927d71c..44d96423a8a6c358bb7ebf12c24fad98e5c2cb61 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -4,12 +4,12 @@
>  
>  use core::{
>      cell::UnsafeCell,
> -    marker::{PhantomData, PhantomPinned},
> +    marker::PhantomData,
>      mem::{ManuallyDrop, MaybeUninit},
>      ops::{Deref, DerefMut},
>      ptr::NonNull,
>  };
> -use pin_init::{PinInit, Wrapper, Zeroable};
> +use pin_init::{cast_pin_init, PinInit, Wrapper, Zeroable};
>  
>  /// Used to transfer ownership to and from foreign (non-Rust) languages.
>  ///
> @@ -308,8 +308,7 @@ fn drop(&mut self) {
>  /// ```
>  #[repr(transparent)]
>  pub struct Opaque<T> {
> -    value: UnsafeCell<MaybeUninit<T>>,
> -    _pin: PhantomPinned,
> +    value: UnsafePinned<UnsafeCell<MaybeUninit<T>>>,

What's the Rust upstream opinion on `&UnsafePinned` vs `&UnsafeCell`?
Does `&UnsafePinned` provide the same noalias behavior as `&UnsafeCell`?

I'm wondering whether we should just do:

    pub struct Opaque<T> {
        value: UnsafePinned<MaybeUninit<T>>,
        _not_sync: PhantomData<UnsafeCell<()>>,
    }

, instead.

Regards,
Boqun

>  }
>  
>  // SAFETY: `Opaque<T>` allows the inner value to be any bit pattern, including all zeros.
> @@ -319,16 +318,14 @@ impl<T> Opaque<T> {
>      /// Creates a new opaque value.
>      pub const fn new(value: T) -> Self {
>          Self {
> -            value: UnsafeCell::new(MaybeUninit::new(value)),
> -            _pin: PhantomPinned,
> +            value: UnsafePinned::new(UnsafeCell::new(MaybeUninit::new(value))),
>          }
>      }
>  
>      /// Creates an uninitialised value.
>      pub const fn uninit() -> Self {
>          Self {
> -            value: UnsafeCell::new(MaybeUninit::uninit()),
> -            _pin: PhantomPinned,
> +            value: UnsafePinned::new(UnsafeCell::new(MaybeUninit::uninit())),
>          }
>      }
>  
> @@ -371,7 +368,7 @@ pub fn try_ffi_init<E>(
>  
>      /// Returns a raw pointer to the opaque data.
>      pub const fn get(&self) -> *mut T {
> -        UnsafeCell::get(&self.value).cast::<T>()
> +        UnsafeCell::raw_get(self.value.get()).cast::<T>()
>      }
>  
>      /// Gets the value behind `this`.
> @@ -384,14 +381,12 @@ pub const fn raw_get(this: *const Self) -> *mut T {
>  }
>  impl<T> Wrapper<T> for Opaque<T> {
>      /// Create an opaque pin-initializer from the given pin-initializer.
> -    fn pin_init<E>(slot: impl PinInit<T, E>) -> impl PinInit<Self, E> {
> -        Self::try_ffi_init(|ptr: *mut T| {
> -            // SAFETY:
> -            //   - `ptr` is a valid pointer to uninitialized memory,
> -            //   - `slot` is not accessed on error; the call is infallible,
> -            //   - `slot` is pinned in memory.
> -            unsafe { PinInit::<T, E>::__pinned_init(slot, ptr) }
> -        })
> +    fn pin_init<E>(value_init: impl PinInit<T, E>) -> impl PinInit<Self, E> {
> +        let value_init =
> +            UnsafePinned::pin_init(UnsafeCell::pin_init(MaybeUninit::pin_init(value_init)));
> +        // SAFETY: `Opaque<T>` is a `repr(transparent)` wrapper around
> +        // `UnsafePinned<UnsafeCell<MabeUninit<T>>>` so the memory representation is compatible.
> +        unsafe { cast_pin_init(value_init) }
>      }
>  }
>  
> 
> -- 
> 2.49.0
> 
> 
