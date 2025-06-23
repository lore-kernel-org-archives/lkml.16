Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A13524E019;
	Mon, 23 Jun 2025 13:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750685180; cv=none; b=e7WdHBWQrNRzOHNrzgXKln8s+PW47MafS9jHn2QKSRyj1203w+2gJzD+eqTJkHHFwPdXrA6jvcE7cVfL6CRvnZn3cp26NTLh8nPqAOO2bLHXyZv5hHHKhyTRNKF9sxFZ3vPdppohLtFpZgox9rGu9ZW6wjNcCbfajY3ANY1nesw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750685180; c=relaxed/simple;
	bh=01ZS0geC59JuQg97iYsCYJJHGdkRPCrZsfjU9r0fFs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7v4o7HH15RbN7eFdq8O7CBnF1NiIOXpVPHjeLbGm/6Uc7yZ90HHSJt6EmiI3mnxtugyjfIZh8vH49rR1asyIFdPRzIBP5aNH1U7hesfV9lSyITid8dBoztXoM2UKmqlMM1T/kwrVzhKk4jG0OTN/Jwas/qkZZe6EO9ErXDdMIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwDUdUGd; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwDUdUGd"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a58c2430edso45701121cf.1;
        Mon, 23 Jun 2025 06:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750685176; x=1751289976; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3eOpyFVJG9l5oUXrAK/DF72wqTy5+U/0d5OHsjl5CoM=;
        b=QwDUdUGd7QsT8KjLHp/b5GZB504AbONqVZa9RL98F7FaRg/j8HN6y2NpyBmUTu4HLe
         ztskqTyggPK6oVX1FSaHL6HnsSczA1TaW03/pNvv9d0pouc0IfdiSSRH2u1QiYRQZiL8
         pyM6ZcdlGeuxyDAJNsE68wyJ9pHdrGWQ7aWL1Eca7bd6QMY8mVNKpGgdRGVbd5xBRapJ
         dBqZP0IQcMOjCRWUYq2GsydQM57S/Wq10t5NWUUUksQr35uLFAfIso6s6TDN3A0ytoka
         SDfM1YTL4tsp8FjGQas1/6zk5akKk8xfGPwdGsc3PUaxpsObs+SHoaqMfmr9+n7eN1aI
         +CRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750685176; x=1751289976;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3eOpyFVJG9l5oUXrAK/DF72wqTy5+U/0d5OHsjl5CoM=;
        b=JNKznFdywjB+FHZdqKd6Y9X4mpPSHaBKJWU03bXUgBDuh1tVOw7be23SFVPNUW1DRb
         vngCG4ePi3ZeNYOnacOUpvfZ0wZMQWj7yjXV4spFeS2a2raCgQtcJSxZyfb/ecNaJcl1
         OWkiG1mlApuGjxzJLOxf18JYf4WKPH93Yfzs/9HNryPLEljI+YCP4LtfVc5iQKmY7/Ce
         0Cn0SibYQKUcmiNlaFJNoTU0YRaF+WsUEyaGfILYzPlA4NRiXT+zjnB1avtAlpWaik+H
         3dsImL5SQUS9PP001bgqt1hLtX2tyjzOgYQtXTGSeJz/PBfvgIOA1Z6qUIR7ZjeVhrwI
         D0Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWhf+cVD4Y2bFEneFG6RyP/w8kA1W0aNeYOjoRyV8x3cfEJ/6yBZbNzhFHUtw+W+FZs8hKsjge2tDKEdysp4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxU0iIkdCTI0L3LSlMBZ1Py8A6ezMXnW2SBNYRk0anNxJznBzrt
	kP4fXpjmfdVVX97SHTSKmVt4MmulesOk0eOYe0xZCktTKz7xFKBNpIAznZfN9Q==
X-Gm-Gg: ASbGncsl5jRQ4jKNA/D710ULR40MkxEhPzNRS0eOVTI79AK2VBTOiRZmSqbY9ksAFOl
	vMuELlV9imOn4ItJWi4igr/HAaxqnoaLtRq3BmQgGEXg1XOMwHYEaFNLYd6xeRwVBllaVnmAbRa
	w49N1OUs9VtVP90ftNAd/mfUnIVjo8PCoGrgf9TwNnvNOJMMUDcpoQ4tUMTBBGhOVi04HeJ/IOA
	0FFV7bZUevN4KRGEls27bFvCKxYKNVvWrkcxhjHauDk3Y0Fs6wnB03M8GO2zDrsxK3Hg8qi12ei
	XPHm7UYHZj2OwQqVp2T8L8FrSjEUz80DTe0kVHlDsteGmMaCtK2P5PW+X0XZ28JSU5aKHUn1/xG
	DT+9JJjwM8uJe06Vi8+nRE+V8eboH6f/RxwSEqRHcp+ym9KFP2zk1
X-Google-Smtp-Source: AGHT+IFXyn4krfA3+xu92n9peLo2YgUxIlQqv3LhvAerXtwNIL5NbgiUEziK5dqmkj2SfOf22+zayg==
X-Received: by 2002:a05:622a:489a:b0:4a6:f00f:6618 with SMTP id d75a77b69052e-4a77c2ddf4fmr177575571cf.10.1750685176331;
        Mon, 23 Jun 2025 06:26:16 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779e5d304sm38147001cf.39.2025.06.23.06.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:26:15 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7280F1200043;
	Mon, 23 Jun 2025 09:26:15 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 23 Jun 2025 09:26:15 -0400
X-ME-Sender: <xms:91VZaPIHX6Z14vTVHPxFKfcjg_2WIRBwgsTXTSi2Yuw_Jk_9y_5BsA>
    <xme:91VZaDLqp67oq6PhBQJd7SpWmK1QC4ipxe5WoEiGRFV0np1EI1K6zBw3VASNylBxs
    jb0XY_C4lQx7Agl9w>
X-ME-Received: <xmr:91VZaHv7X3No4HoWWgOwDR5GL2lHN_vfuy26oJNdKMlF3L4ek1YVYVxRsA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujedugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertd
    dttddunecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhm
    rghilhdrtghomheqnecuggftrfgrthhtvghrnhepkeefjefgueeitdeuhfduheffledvhe
    evffethedtudfhffejieffveeuieduheffnecuffhomhgrihhnpehkvghrnhgvlhdrohhr
    ghdpmhhuthgvgidruggrthgrpdhmuhhtvgigrdgrshenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhp
    vghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrd
    hfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthht
    ohepudelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeifohhrkhesohhnuhhroh
    iikhgrnhdruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoheplhhoshhsihhnsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:91VZaIYBFiC1dOYWmkQ4R_AIavL-zXAvbWkUUbNbNFDabaUU-BREow>
    <xmx:91VZaGbOiEbYKGVTQqte_26AM6EUaAP7UW4SSt7YHw0Er38XYziutA>
    <xmx:91VZaMAhnizNuTI8WAyDIOqTzWSzb5p59Nl5VwcPfAVUWKmVeubo0A>
    <xmx:91VZaEZwRCE5cg2K8rZGsgUpvZG78pa5tqgI-OtMIdDtDSO7UhtWZQ>
    <xmx:91VZaKp-O-SkXk1HP7tOhOe1_EW85IZWOFSZ1AirPmI7KH_gbgJsywen>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 09:26:14 -0400 (EDT)
Date: Mon, 23 Jun 2025 06:26:14 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dakr@kernel.org, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, longman@redhat.com,
	felipe_life@live.com, daniel@sedlak.dev, bjorn3_gh@protonmail.com
Subject: Re: [PATCH v5 2/3] implement ww_mutex abstraction for the Rust tree
Message-ID: <aFlV9ky2RKrYnrJX@Mac.home>
References: <20250621184454.8354-1-work@onurozkan.dev>
 <20250621184454.8354-3-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250621184454.8354-3-work@onurozkan.dev>

On Sat, Jun 21, 2025 at 09:44:53PM +0300, Onur Özkan wrote:
[...]
> +#[pin_data(PinnedDrop)]
> +pub struct WwAcquireCtx<'a> {
> +    #[pin]
> +    inner: Opaque<bindings::ww_acquire_ctx>,
> +    _p: PhantomData<&'a WwClass>,
> +}
> +
> +// SAFETY: Used in controlled ways during lock acquisition. No race risk.
> +unsafe impl Sync for WwAcquireCtx<'_> {}
> +// SAFETY: Doesn't rely on thread-local state. Safe to move between threads.
> +unsafe impl Send for WwAcquireCtx<'_> {}
> +

I don't think `WwAcquireCtx` is `Send`, if you look at C code when
LOCKDEP is enabled, `ww_acquire_init()` calls a few `mutex_acquire()`
and expects `ww_acquire_fini()` to call the corresponding
`mutex_release()`, and these two have to be on the same task. Also I
don't think there is a need for sending `WwAcquireCtx` to another
thread.

Besides, the `Sync` of `WwAcquireCtx` also doesn't make sense, I would
drop it if there is no real usage for now.

> +impl<'ctx> WwAcquireCtx<'ctx> {
> +    /// Initializes `Self` with calling C side `ww_acquire_init` inside.
> +    pub fn new<'class: 'ctx>(ww_class: &'class WwClass) -> impl PinInit<Self> {
> +        let raw_ptr = ww_class.inner.get();
> +        pin_init!(WwAcquireCtx {
> +            inner <- Opaque::ffi_init(|slot: *mut bindings::ww_acquire_ctx| {
> +                // SAFETY: The caller guarantees that `ww_class` remains valid.
> +                unsafe { bindings::ww_acquire_init(slot, raw_ptr) }
> +            }),
> +            _p: PhantomData
> +        })
> +    }
> +
> +    /// Marks the end of the acquire phase with C side `ww_acquire_done`.
> +    ///
> +    /// After calling this function, no more mutexes can be acquired with this context.
> +    pub fn done(self: Pin<&mut Self>) {
> +        // SAFETY: The context is pinned and valid.
> +        unsafe { bindings::ww_acquire_done(self.inner.get()) };
> +    }
> +
> +    /// Returns a raw pointer to the inner `ww_acquire_ctx`.
> +    fn as_ptr(&self) -> *mut bindings::ww_acquire_ctx {
> +        self.inner.get()
> +    }
> +}
> +
> +#[pinned_drop]
> +impl PinnedDrop for WwAcquireCtx<'_> {
> +    fn drop(self: Pin<&mut Self>) {
> +        // SAFETY: The context is being dropped and is pinned.
> +        unsafe { bindings::ww_acquire_fini(self.inner.get()) };
> +    }
> +}
> +
[...]
> +#[pin_data]
> +pub struct WwMutex<'a, T: ?Sized> {
> +    _p: PhantomData<&'a WwClass>,
> +    #[pin]
> +    mutex: Opaque<bindings::ww_mutex>,
> +    data: UnsafeCell<T>,
> +}
> +
> +// SAFETY: [`WwMutex`] can be shared between threads.
> +unsafe impl<T: ?Sized + Send> Send for WwMutex<'_, T> {}
> +// SAFETY: [`WwMutex`] can be safely accessed from multiple threads concurrently.
> +unsafe impl<T: ?Sized + Sync> Sync for WwMutex<'_, T> {}

I believe this requires `T` being `Send` as well, because if `&WwMutex`
is shared between threads, that means any thread can access `&mut T`
when the lock acquired.

> +
> +impl<'ww_class, T> WwMutex<'ww_class, T> {
> +    /// Creates `Self` with calling `ww_mutex_init` inside.
> +    pub fn new(t: T, ww_class: &'ww_class WwClass) -> impl PinInit<Self> {
> +        let raw_ptr = ww_class.inner.get();
> +        pin_init!(WwMutex {
> +            mutex <- Opaque::ffi_init(|slot: *mut bindings::ww_mutex| {
> +                // SAFETY: The caller guarantees that `ww_class` remains valid.
> +                unsafe { bindings::ww_mutex_init(slot, raw_ptr) }
> +            }),
> +            data: UnsafeCell::new(t),
> +            _p: PhantomData,
> +        })
> +    }
> +}
> +
[...]
> +    /// Checks if the mutex is currently locked.
> +    pub fn is_locked(&self) -> bool {

Did I miss a reply from you regarding:

	https://lore.kernel.org/rust-for-linux/aFReIdlPPg4MmaYX@tardis.local/

no public is_lock() please. Do an assert_is_locked() instead. We need to
avoid users from abusing this.

> +        // SAFETY: The mutex is pinned and valid.
> +        unsafe { bindings::ww_mutex_is_locked(self.mutex.get()) }
> +    }
> +
> +    /// Returns a raw pointer to the inner mutex.
> +    fn as_ptr(&self) -> *mut bindings::ww_mutex {
> +        self.mutex.get()
> +    }
> +}
> +
> +/// A guard that provides exclusive access to the data protected
> +/// by a [`WwMutex`].
> +///
> +/// # Invariants
> +///
> +/// The guard holds an exclusive lock on the associated [`WwMutex`]. The lock is held
> +/// for the entire lifetime of this guard and is automatically released when the
> +/// guard is dropped.
> +#[must_use = "the lock unlocks immediately when the guard is unused"]
> +pub struct WwMutexGuard<'a, T: ?Sized> {
> +    mutex: &'a WwMutex<'a, T>,
> +    _not_send: NotThreadSafe,
> +}
> +
> +// SAFETY: [`WwMutexGuard`] can be transferred across thread boundaries if the data can.
> +unsafe impl<T: ?Sized + Send> Send for WwMutexGuard<'_, T> {}

Nope, ww_mutex is still a mutex, you cannot acquire the lock in one task
and release the lock on another task.

> +
> +// SAFETY: [`WwMutexGuard`] can be shared between threads if the data can.
> +unsafe impl<T: ?Sized + Send + Sync> Sync for WwMutexGuard<'_, T> {}

You don't need the `Send` here? A `&WwMutexGuard` doesn't provide the
access to `&mut T`, so being `Sync` suffices.

Regards,
Boqun

> +
> +impl<'a, T: ?Sized> WwMutexGuard<'a, T> {
> +    /// Creates a new guard for a locked mutex.
> +    fn new(mutex: &'a WwMutex<'a, T>) -> Self {
> +        Self {
> +            mutex,
> +            _not_send: NotThreadSafe,
> +        }
> +    }
> +}
> +
> +impl<T: ?Sized> core::ops::Deref for WwMutexGuard<'_, T> {
> +    type Target = T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: We hold the lock, so we have exclusive access.
> +        unsafe { &*self.mutex.data.get() }
> +    }
> +}
> +
> +impl<T: ?Sized> core::ops::DerefMut for WwMutexGuard<'_, T> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        // SAFETY: We hold the lock, so we have exclusive access.
> +        unsafe { &mut *self.mutex.data.get() }
> +    }
> +}
> +
> +impl<T: ?Sized> Drop for WwMutexGuard<'_, T> {
> +    fn drop(&mut self) {
> +        // SAFETY: We hold the lock and are about to release it.
> +        unsafe { bindings::ww_mutex_unlock(self.mutex.as_ptr()) };
> +    }
> +}
> -- 
> 2.49.0
> 
