Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6DD2D7BF;
	Wed,  2 Apr 2025 15:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743608834; cv=none; b=sifxnR1Y9z1cpNiti958Y4rPJ5of1vui+P9TQvZmcw1OVq+VWjbAS/e9kR3X+4YaGnu9pkLbCO/V1zY7qxvhqrM2tWAoxoFBmK8iQSS7MjxKj3ucXx+fbvBmAldM2f1NldjywvxRzBQl9lTTO7QEfHuhOKBtXKXac40WqYoR0Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743608834; c=relaxed/simple;
	bh=1Cj2krhC2Dtsw1m1xorjC3ucVUKufE7MmCF0CDjRN+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QO5oFKJ4eeQinO8qjNm+ltsyZknBtDZYzmTYfmN1WA8CTzczqJoBfoqMKLsz6dNgcmmVqwWVmUcFWSQ/mhVrDpSWbNg/l34NpQh6g1ZH5C9tG7oJjA3M8Wa38HauvXUvxS65AS8knAOy+L/7zFmEDmawPx0NIwEZmxUIwM+61Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyaNMX6K; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyaNMX6K"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-225df540edcso17430515ad.0;
        Wed, 02 Apr 2025 08:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743608831; x=1744213631; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CIQmNCdKP6me2O/Omw1ppiMa5tbAIYpKZkNSYEsazIs=;
        b=XyaNMX6Kr2YP+waQ6zyMjvYB+Zs395A4bYhYOGiryLLYju665UTAKhjA3ctTupSooB
         Ci/laGyQYBvZKoJZHsSLVxjffuazL6oAh7GbDj3y4gIW1EcquwonZo3luHPjL0WxY9YP
         P5w6AUGrlpzCIgJogDMqji8yeNeWUkd4znpZSyjdQMIvC1JbwmR7ZfXPcpiLijD8DuDo
         U4KiAEx5vx+42HuGNQr5mjrxCgNrpE4AqTxqF9NRdjat63kr72rVsXoeKKPmTP3IWuGe
         FCNboF20UHfvmpsfElmta/KMKspQHpkdDERBxf07e1ig3RRsEf6Y4uPCZBZ/GB+O8iQY
         BJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743608831; x=1744213631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIQmNCdKP6me2O/Omw1ppiMa5tbAIYpKZkNSYEsazIs=;
        b=anuRBzTvHJUNHmiBwQmC8CsgYL0s5sE/GCQObmeR0m69djcGaIyBMk+WPYahx/s73c
         Cr3YKHi6wfnBNhctHeeXojXqWduig8oTYe6xTHqonW/qS10srkHVixqNrkG8K6rAsNDW
         5dk4IT75M4NNdfpRoKqYZ4Ey/tdb3nN0EXgfmu6OHOG7XAhbOGC+Vn52eABbFK8fPSMc
         vC2iU0XvYFoPqIUI3fpt46fEvcqqKlYhAKvSpqHLjay8ipETk9J6MxPOovSOxpiX8JHt
         4slg+IX/W61HvjQwzpt79yvBUluiTv3r8OHxq9YU+8ASuHt5TpALxfQTcayDqqBZAZmI
         uvVw==
X-Forwarded-Encrypted: i=1; AJvYcCViaiguESmRqpEc6tj8MMh/uUW+NRazIHniKCwn5+kZoFMjT3qnkoy3ilB1FLB/M2wr6UwYjkbq8Hoao8Y=@vger.kernel.org, AJvYcCXyhnEoMuEU7Nue4Az1raxkF/WJY2C7ozMxLlcsUnfzEDGAevoIHNwB1HIUJZ+gcjuUqdiD9x8dHP1/s94m4rA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7XUbAXbXHJkfe7PJCsCqvSVWdTkqSpWwe+4uIJMMbyShZqUjZ
	j3ghi7x8i5qlinW+EHog21EM9tv7Bj774kSt+uQuWVruCb+bnY/0
X-Gm-Gg: ASbGncujkcd7KkV0dsTpu5+WYAy1yO8uYf6CBBoFXNdIp/ABo2RGr/l2wXz9/WwafTX
	l8/LtZwT1KBN1EbXPgCXIL+sAYX6uDkFwVBZUIoXi/UbRycKQxjX8I6ComhIC0m8tqPas13Y6vy
	gy+4QLHzOHr53rR8E7inPFqAj+ONTM78J7wJ5Yug3jkqYIdVyA/oELocWfwd2+6L1AsCpWK65K9
	ycMyhtA+zUKjeytsju/qNPLjQjVGDMZ3lxjU0Cn5iNwNwPgJBcxX3sWBXPG/fgEzymQnBo1x22X
	Y5kROM5i6oJ6aY5AtCSYOx/fOb6YNhcDlFLPRM+g1jMn68nc4E2Tx6g=
X-Google-Smtp-Source: AGHT+IGpFfJcr7gdxCITP1UWjkqX9ItNLy78MqKyN3K+iXIUnro+nPhpe1lhj5L9aZXv921yTavKiA==
X-Received: by 2002:a17:902:820d:b0:21f:40de:ae4e with SMTP id d9443c01a7336-229765ce2bdmr181665ad.9.1743608831411;
        Wed, 02 Apr 2025 08:47:11 -0700 (PDT)
Received: from localhost ([216.228.125.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec53easm110037475ad.24.2025.04.02.08.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:47:10 -0700 (PDT)
Date: Wed, 2 Apr 2025 11:47:08 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>,
	rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Burak Emir <bqe@google.com>
Subject: Re: [PATCH V4 1/2] rust: Add initial cpumask abstractions
Message-ID: <Z-1b_FkYUJEIj-YW@thinkpad>
References: <cover.1743572195.git.viresh.kumar@linaro.org>
 <35f4223be4a51139348fed82420481b370d7b1db.1743572195.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35f4223be4a51139348fed82420481b370d7b1db.1743572195.git.viresh.kumar@linaro.org>

On Wed, Apr 02, 2025 at 11:08:42AM +0530, Viresh Kumar wrote:
> Wed,  2 Apr 2025 11:08:42 +0530
> Message-Id: <35f4223be4a51139348fed82420481b370d7b1db.1743572195.git.viresh.kumar@linaro.org>
> X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
> In-Reply-To: <cover.1743572195.git.viresh.kumar@linaro.org>
> References: <cover.1743572195.git.viresh.kumar@linaro.org>
> MIME-Version: 1.0
> Content-Transfer-Encoding: 8bit
> Status: O
> Content-Length: 11430
> Lines: 334
> 
> Add initial Rust abstractions for struct cpumask, covering a subset of
> its APIs. Additional APIs can be added as needed.
> 
> These abstractions will be used in upcoming Rust support for cpufreq and
> OPP frameworks.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  rust/kernel/cpumask.rs | 301 +++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs     |   1 +
>  2 files changed, 302 insertions(+)
>  create mode 100644 rust/kernel/cpumask.rs
> 
> diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
> new file mode 100644
> index 000000000000..792210a77770
> --- /dev/null
> +++ b/rust/kernel/cpumask.rs
> @@ -0,0 +1,301 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! CPU Mask abstractions.
> +//!
> +//! C header: [`include/linux/cpumask.h`](srctree/include/linux/cpumask.h)
> +
> +use crate::{
> +    alloc::{AllocError, Flags},
> +    bindings,
> +    prelude::*,
> +    types::Opaque,
> +};
> +
> +#[cfg(CONFIG_CPUMASK_OFFSTACK)]
> +use core::ptr::{self, NonNull};
> +
> +#[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
> +use core::mem::MaybeUninit;
> +
> +use core::ops::{Deref, DerefMut};
> +
> +/// A CPU Mask.
> +///
> +/// This represents the Rust abstraction for the C `struct cpumask`.
> +///
> +/// # Invariants
> +///
> +/// A [`Cpumask`] instance always corresponds to a valid C `struct cpumask`.
> +///
> +/// The callers must ensure that the `struct cpumask` is valid for access and remains valid for the
> +/// lifetime of the returned reference.
> +///
> +/// ## Examples
> +///
> +/// The following example demonstrates how to update a [`Cpumask`].
> +///
> +/// ```
> +/// use kernel::bindings;
> +/// use kernel::cpumask::Cpumask;
> +///
> +/// fn set_clear_cpu(ptr: *mut bindings::cpumask, set_cpu: u32, clear_cpu: i32) {
> +///     // SAFETY: The `ptr` is valid for writing and remains valid for the lifetime of the
> +///     // returned reference.
> +///     let mask = unsafe { Cpumask::from_raw_mut(ptr) };
> +///     mask.set(set_cpu);
> +///     mask.clear(clear_cpu);
> +/// }
> +/// ```
> +#[repr(transparent)]
> +pub struct Cpumask(Opaque<bindings::cpumask>);
> +
> +impl Cpumask {
> +    /// Creates a mutable reference to an existing `struct cpumask` pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that `ptr` is valid for writing and remains valid for the lifetime
> +    /// of the returned reference.
> +    pub unsafe fn from_raw_mut<'a>(ptr: *mut bindings::cpumask) -> &'a mut Self {
> +        // SAFETY: Guaranteed by the safety requirements of the function.
> +        //
> +        // INVARIANT: The caller ensures that `ptr` is valid for writing and remains valid for the
> +        // lifetime of the returned reference.
> +        unsafe { &mut *ptr.cast() }
> +    }
> +
> +    /// Creates a reference to an existing `struct cpumask` pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that `ptr` is valid for reading and remains valid for the lifetime
> +    /// of the returned reference.
> +    pub unsafe fn from_raw<'a>(ptr: *const bindings::cpumask) -> &'a Self {
> +        // SAFETY: Guaranteed by the safety requirements of the function.
> +        //
> +        // INVARIANT: The caller ensures that `ptr` is valid for reading and remains valid for the
> +        // lifetime of the returned reference.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Obtain the raw `struct cpumask` pointer.
> +    pub fn as_raw(&self) -> *mut bindings::cpumask {
> +        self as *const Cpumask as *mut bindings::cpumask
> +    }
> +
> +    /// Set `cpu` in the cpumask.
> +    ///
> +    /// Equivalent to the kernel's `cpumask_set_cpu` API.
> +    #[inline]
> +    pub fn set(&mut self, cpu: u32) {
> +        // SAFETY: By the type invariant, `self.as_raw` is a valid argument to `cpumask_set_cpus`.
> +        unsafe { bindings::cpumask_set_cpu(cpu, self.as_raw()) };
> +    }

Alright, this is an atomic operation. For bitmaps in rust, Burak and
Alice decided to switch naming, so 'set()' in C becomes 'set_atomic()'
in rust, and correspondingly, '__set()' becomes 'set()'.

I think it's maybe OK to switch naming for a different language. But
guys, can you please be consistent once you made a decision?

Burak, Alice, please comment.

Regardless, without looking at the end code I can't judge if you need
atomic or non-atomic ops. Can you link the project that actually uses
this API? Better if you just prepend that series with this 2 patches
and move them together.

> +    /// Clear `cpu` in the cpumask.
> +    ///
> +    /// Equivalent to the kernel's `cpumask_clear_cpu` API.
> +    #[inline]
> +    pub fn clear(&mut self, cpu: i32) {
> +        // SAFETY: By the type invariant, `self.as_raw` is a valid argument to `cpumask_clear_cpu`.
> +        unsafe { bindings::cpumask_clear_cpu(cpu, self.as_raw()) };
> +    }
> +
> +    /// Set all CPUs in the cpumask.
> +    ///
> +    /// Equivalent to the kernel's `cpumask_setall` API.
> +    #[inline]
> +    pub fn set_all(&mut self) {
> +        // SAFETY: By the type invariant, `self.as_raw` is a valid argument to `cpumask_setall`.
> +        unsafe { bindings::cpumask_setall(self.as_raw()) };
> +    }

Can you keep the name as 'setall'? This would help those grepping
methods roots in C sources.

> +    /// Get weight of the cpumask.
> +    ///
> +    /// Equivalent to the kernel's `cpumask_weight` API.
> +    #[inline]
> +    pub fn weight(&self) -> u32 {
> +        // SAFETY: By the type invariant, `self.as_raw` is a valid argument to `cpumask_weight`.
> +        unsafe { bindings::cpumask_weight(self.as_raw()) }
> +    }
> +
> +    /// Copy cpumask.
> +    ///
> +    /// Equivalent to the kernel's `cpumask_copy` API.
> +    #[inline]
> +    pub fn copy(&self, dstp: &mut Self) {
> +        // SAFETY: By the type invariant, `Self::as_raw` is a valid argument to `cpumask_copy`.
> +        unsafe { bindings::cpumask_copy(dstp.as_raw(), self.as_raw()) };
> +    }
> +}
> +
> +/// A CPU Mask pointer.
> +///
> +/// This represents the Rust abstraction for the C `struct cpumask_var_t`.
> +///
> +/// # Invariants
> +///
> +/// A [`CpumaskBox`] instance always corresponds to a valid C `struct cpumask_var_t`.

Can you keep the C name? Maybe CpumaskVar? Or this 'Box' has special
meaning in rust?

> +///
> +/// The callers must ensure that the `struct cpumask_var_t` is valid for access and remains valid
> +/// for the lifetime of [`CpumaskBox`].
> +///
> +/// ## Examples
> +///
> +/// The following example demonstrates how to create and update a [`CpumaskBox`].
> +///
> +/// ```
> +/// use kernel::cpumask::CpumaskBox;
> +/// use kernel::error::Result;
> +///
> +/// fn cpumask_foo() -> Result {

cpumask_foo() what? This is not a good name for test, neither
for an example.

> +///     let mut mask = CpumaskBox::new(GFP_KERNEL)?;
> +///
> +///     assert_eq!(mask.weight(), 0);
> +///     mask.set(2);
> +///     assert_eq!(mask.weight(), 1);
> +///     mask.set(3);
> +///     assert_eq!(mask.weight(), 2);

Yeah, you don't import cpumask_test_cpu() for some reason, and has
to use .weight() here to illustrate how it works. For an example, I
think it's a rather bad example.

Also, because you have atomic setters (except setall) and non-atomic 
getter, I think you most likely abuse the atomic API in your code.
Please share your driver for the next round. 

I think it would be better to move this implementation together with
the client code. Now that we merged cpumask helpers and stabilized the
API, there's no need to merge dead lib code without clients.

Thanks,
Yury
