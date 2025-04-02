Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C5526AD9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743609640; cv=none; b=ZN/fbQ/cA8TZM8TNkWYL/4vARWZ9VRzb2KKGU9zmI+TM+ijcgFfM0E43z+6Wcz8sK0N/6NlFpZcL8Fwz8YBW1Hk1bObth9KXPxhMArjc3k17lEoAbE5uYpMXPOIql9EgtF0yLcjFct0STvzRcKkdZF4084fbmKUWcgLUjwGWNC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743609640; c=relaxed/simple;
	bh=qPruB88JkgBwyYGDFyof/2LgRNG5vg0TGV874clVrA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JP/ZZf9H1tFSDvVOR5biWuhKi5UADFWMLzShDawHswFyYA1IHKthxwIOkx7y2dusZtVQJqPdlBDHfsZGT/06zjyujMNVLG/Qmtk01cL08jTrpcbjKR78c67HhG5DT/eoyGuVkpe14YdKTuyrdRY4J8qGZUQjW5ls91AvpNr1/TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iGV9cO1f; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iGV9cO1f"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-72bd5f25ea6so4710a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 09:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743609638; x=1744214438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRDOiAn7OWba8LvnkLWDRjg8G9T7P0yMZ35Irl3iVzI=;
        b=iGV9cO1fyBKVUeFUvFGuetRnQF6g0n30JAkcv98GeliaQfkZ990KfSNyi30JucHPzS
         MaT5fzeSrWnU9CVcNev0G47gpEv731bsLFNNgHQeEgb2cqOHq8OL0bnjSdFJG6850mjs
         ZDYDzgowA0kDPiqBTuTq5m+HKq0IMclmEWIJQb3YCMuPA3sATZX8RfZG0Mi2Qmm9CFn8
         GWiBuzoGA4rejL/QHtj+FiGC6L/tY66+qX4ZpJLZKRjfbGRah7Qtr+r/dltloofNimpM
         M1khPqtIQYnMd/nem29mxY1tktQcz/tr9dZj0CGjmFNsThosTTzLU09snFnxzgI55FIR
         svUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743609638; x=1744214438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRDOiAn7OWba8LvnkLWDRjg8G9T7P0yMZ35Irl3iVzI=;
        b=PT6fa97Gb7W6C3mK4e2j4fOX5jBsv5ePKqt4rXA1SlWwUKuKuWIMmF4nZr3uZBHmxH
         bpvNARI5sx6Y6WkqqO+8RTLS9ufN8rYozGV37o5mqxe6XalU7PJ88x/LdkBJu/lmOsoB
         K/tyVE7mp9tlMXIgdrzF5Xjvq941YO3POHUdvJaf1jbp5qupzQcTOAf+uOZDBpX4FAcj
         MZhUlMH41wwYh7YsiZtXLqbTvFiyE916zZiv9mhDY6EuCDCJfYb//MkBcvEq2JstWH3Z
         JtTukA2cf9fPKIu9tR6jRXyj1iPMPmxwAU/D3TlcTIrcjQnpqLzYw97Lzv8xWgjwN348
         W3wA==
X-Forwarded-Encrypted: i=1; AJvYcCXUvrvXjSrxJW0yEwnZ5njuQDDWgmgH0bdoaN+oZGDE/qIVjLm7im/yKOOPmtGs5Zy2KVudHD4ElTmkU1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUe+YRJzCbdiqaDY+ITU0XQD4Z+RbtHfZ7Ebl+4rwp9ypzkXWu
	2upXacPA5mx36tZRg1x53vgDDr1RjlgHINKeoKjRyT/T+e/F9jqbbVbzSf32ezbcjXlIEfNXEPG
	z7VuZ/dyIZXjf4WIv4xhauW2aDXrBeQ/reiWW/R9r2kIij8jVsQ==
X-Gm-Gg: ASbGnctQWSOPj2u1wf37jzNlC/KkuTW0R1ScLYBYbG+IFf3k1jxnAcyzclz6h01XBLF
	kSzbDzgYEBnOKiDIm8mABRWxe8lQIfE78b8dUN9BJx0RYRQ2fcqLespwvpxfvy9hkqo0zRoJAQG
	N8vyZWxKZCPOhH3Zv14qm6pC4ZucS8K7Qnsu3pbsQ/CVBgWioepJLO40MA
X-Google-Smtp-Source: AGHT+IHZ305k9OUX06ubo13guSPIcxAmRDM5qO8wiVOXVTqB5NF9drufZaXM02tHVPHDCC6o1zgd1mz6lISUXn5f6Hg=
X-Received: by 2002:a05:6808:1451:b0:3fa:d6c:cdbe with SMTP id
 5614622812f47-3ff0f6351d7mr10936183b6e.32.1743609637662; Wed, 02 Apr 2025
 09:00:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1743572195.git.viresh.kumar@linaro.org> <35f4223be4a51139348fed82420481b370d7b1db.1743572195.git.viresh.kumar@linaro.org>
 <Z-1b_FkYUJEIj-YW@thinkpad>
In-Reply-To: <Z-1b_FkYUJEIj-YW@thinkpad>
From: Burak Emir <bqe@google.com>
Date: Wed, 2 Apr 2025 18:00:26 +0200
X-Gm-Features: AQ5f1JqBpfnQ28rLuPWm0oFko_ozy1h-sFtem4HTb0TGPbpma4McG2-SwMYmsEo
Message-ID: <CACQBu=WMu_CmzERJAHmjiuQ-NZe6DK2kAkvP0cnFN-Y+QhRwvg@mail.gmail.com>
Subject: Re: [PATCH V4 1/2] rust: Add initial cpumask abstractions
To: Yury Norov <yury.norov@gmail.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	Danilo Krummrich <dakr@redhat.com>, rust-for-linux@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 5:47=E2=80=AFPM Yury Norov <yury.norov@gmail.com> wr=
ote:
>
> On Wed, Apr 02, 2025 at 11:08:42AM +0530, Viresh Kumar wrote:
> > Wed,  2 Apr 2025 11:08:42 +0530
> > Message-Id: <35f4223be4a51139348fed82420481b370d7b1db.1743572195.git.vi=
resh.kumar@linaro.org>
> > X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
> > In-Reply-To: <cover.1743572195.git.viresh.kumar@linaro.org>
> > References: <cover.1743572195.git.viresh.kumar@linaro.org>
> > MIME-Version: 1.0
> > Content-Transfer-Encoding: 8bit
> > Status: O
> > Content-Length: 11430
> > Lines: 334
> >
> > Add initial Rust abstractions for struct cpumask, covering a subset of
> > its APIs. Additional APIs can be added as needed.
> >
> > These abstractions will be used in upcoming Rust support for cpufreq an=
d
> > OPP frameworks.
> >
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >  rust/kernel/cpumask.rs | 301 +++++++++++++++++++++++++++++++++++++++++
> >  rust/kernel/lib.rs     |   1 +
> >  2 files changed, 302 insertions(+)
> >  create mode 100644 rust/kernel/cpumask.rs
> >
> > diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
> > new file mode 100644
> > index 000000000000..792210a77770
> > --- /dev/null
> > +++ b/rust/kernel/cpumask.rs
> > @@ -0,0 +1,301 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! CPU Mask abstractions.
> > +//!
> > +//! C header: [`include/linux/cpumask.h`](srctree/include/linux/cpumas=
k.h)
> > +
> > +use crate::{
> > +    alloc::{AllocError, Flags},
> > +    bindings,
> > +    prelude::*,
> > +    types::Opaque,
> > +};
> > +
> > +#[cfg(CONFIG_CPUMASK_OFFSTACK)]
> > +use core::ptr::{self, NonNull};
> > +
> > +#[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
> > +use core::mem::MaybeUninit;
> > +
> > +use core::ops::{Deref, DerefMut};
> > +
> > +/// A CPU Mask.
> > +///
> > +/// This represents the Rust abstraction for the C `struct cpumask`.
> > +///
> > +/// # Invariants
> > +///
> > +/// A [`Cpumask`] instance always corresponds to a valid C `struct cpu=
mask`.
> > +///
> > +/// The callers must ensure that the `struct cpumask` is valid for acc=
ess and remains valid for the
> > +/// lifetime of the returned reference.
> > +///
> > +/// ## Examples
> > +///
> > +/// The following example demonstrates how to update a [`Cpumask`].
> > +///
> > +/// ```
> > +/// use kernel::bindings;
> > +/// use kernel::cpumask::Cpumask;
> > +///
> > +/// fn set_clear_cpu(ptr: *mut bindings::cpumask, set_cpu: u32, clear_=
cpu: i32) {
> > +///     // SAFETY: The `ptr` is valid for writing and remains valid fo=
r the lifetime of the
> > +///     // returned reference.
> > +///     let mask =3D unsafe { Cpumask::from_raw_mut(ptr) };
> > +///     mask.set(set_cpu);
> > +///     mask.clear(clear_cpu);
> > +/// }
> > +/// ```
> > +#[repr(transparent)]
> > +pub struct Cpumask(Opaque<bindings::cpumask>);
> > +
> > +impl Cpumask {
> > +    /// Creates a mutable reference to an existing `struct cpumask` po=
inter.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The caller must ensure that `ptr` is valid for writing and rem=
ains valid for the lifetime
> > +    /// of the returned reference.
> > +    pub unsafe fn from_raw_mut<'a>(ptr: *mut bindings::cpumask) -> &'a=
 mut Self {
> > +        // SAFETY: Guaranteed by the safety requirements of the functi=
on.
> > +        //
> > +        // INVARIANT: The caller ensures that `ptr` is valid for writi=
ng and remains valid for the
> > +        // lifetime of the returned reference.
> > +        unsafe { &mut *ptr.cast() }
> > +    }
> > +
> > +    /// Creates a reference to an existing `struct cpumask` pointer.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The caller must ensure that `ptr` is valid for reading and rem=
ains valid for the lifetime
> > +    /// of the returned reference.
> > +    pub unsafe fn from_raw<'a>(ptr: *const bindings::cpumask) -> &'a S=
elf {
> > +        // SAFETY: Guaranteed by the safety requirements of the functi=
on.
> > +        //
> > +        // INVARIANT: The caller ensures that `ptr` is valid for readi=
ng and remains valid for the
> > +        // lifetime of the returned reference.
> > +        unsafe { &*ptr.cast() }
> > +    }
> > +
> > +    /// Obtain the raw `struct cpumask` pointer.
> > +    pub fn as_raw(&self) -> *mut bindings::cpumask {
> > +        self as *const Cpumask as *mut bindings::cpumask
> > +    }
> > +
> > +    /// Set `cpu` in the cpumask.
> > +    ///
> > +    /// Equivalent to the kernel's `cpumask_set_cpu` API.
> > +    #[inline]
> > +    pub fn set(&mut self, cpu: u32) {
> > +        // SAFETY: By the type invariant, `self.as_raw` is a valid arg=
ument to `cpumask_set_cpus`.
> > +        unsafe { bindings::cpumask_set_cpu(cpu, self.as_raw()) };
> > +    }
>
> Alright, this is an atomic operation. For bitmaps in rust, Burak and
> Alice decided to switch naming, so 'set()' in C becomes 'set_atomic()'
> in rust, and correspondingly, '__set()' becomes 'set()'.
>
> I think it's maybe OK to switch naming for a different language. But
> guys, can you please be consistent once you made a decision?
>
> Burak, Alice, please comment.

I really like the explicit naming convention that includes "atomic" if
an operation is atomic.
It seems also consistent with std library.

> Regardless, without looking at the end code I can't judge if you need
> atomic or non-atomic ops. Can you link the project that actually uses
> this API? Better if you just prepend that series with this 2 patches
> and move them together.

The type &mut self gives it away: the Rust type system enforces
exclusive access here due to aliasing rules.
So a non-atomic operation is sufficient here.

> > +    /// Clear `cpu` in the cpumask.
> > +    ///
> > +    /// Equivalent to the kernel's `cpumask_clear_cpu` API.
> > +    #[inline]
> > +    pub fn clear(&mut self, cpu: i32) {
> > +        // SAFETY: By the type invariant, `self.as_raw` is a valid arg=
ument to `cpumask_clear_cpu`.
> > +        unsafe { bindings::cpumask_clear_cpu(cpu, self.as_raw()) };
> > +    }
> > +
> > +    /// Set all CPUs in the cpumask.
> > +    ///
> > +    /// Equivalent to the kernel's `cpumask_setall` API.
> > +    #[inline]
> > +    pub fn set_all(&mut self) {
> > +        // SAFETY: By the type invariant, `self.as_raw` is a valid arg=
ument to `cpumask_setall`.
> > +        unsafe { bindings::cpumask_setall(self.as_raw()) };
> > +    }
>
> Can you keep the name as 'setall'? This would help those grepping
> methods roots in C sources.
>
> > +    /// Get weight of the cpumask.
> > +    ///
> > +    /// Equivalent to the kernel's `cpumask_weight` API.
> > +    #[inline]
> > +    pub fn weight(&self) -> u32 {
> > +        // SAFETY: By the type invariant, `self.as_raw` is a valid arg=
ument to `cpumask_weight`.
> > +        unsafe { bindings::cpumask_weight(self.as_raw()) }
> > +    }
> > +
> > +    /// Copy cpumask.
> > +    ///
> > +    /// Equivalent to the kernel's `cpumask_copy` API.
> > +    #[inline]
> > +    pub fn copy(&self, dstp: &mut Self) {
> > +        // SAFETY: By the type invariant, `Self::as_raw` is a valid ar=
gument to `cpumask_copy`.
> > +        unsafe { bindings::cpumask_copy(dstp.as_raw(), self.as_raw()) =
};
> > +    }
> > +}
> > +
> > +/// A CPU Mask pointer.
> > +///
> > +/// This represents the Rust abstraction for the C `struct cpumask_var=
_t`.
> > +///
> > +/// # Invariants
> > +///
> > +/// A [`CpumaskBox`] instance always corresponds to a valid C `struct =
cpumask_var_t`.
>
> Can you keep the C name? Maybe CpumaskVar? Or this 'Box' has special
> meaning in rust?
>
> > +///
> > +/// The callers must ensure that the `struct cpumask_var_t` is valid f=
or access and remains valid
> > +/// for the lifetime of [`CpumaskBox`].
> > +///
> > +/// ## Examples
> > +///
> > +/// The following example demonstrates how to create and update a [`Cp=
umaskBox`].
> > +///
> > +/// ```
> > +/// use kernel::cpumask::CpumaskBox;
> > +/// use kernel::error::Result;
> > +///
> > +/// fn cpumask_foo() -> Result {
>
> cpumask_foo() what? This is not a good name for test, neither
> for an example.
>
> > +///     let mut mask =3D CpumaskBox::new(GFP_KERNEL)?;
> > +///
> > +///     assert_eq!(mask.weight(), 0);
> > +///     mask.set(2);
> > +///     assert_eq!(mask.weight(), 1);
> > +///     mask.set(3);
> > +///     assert_eq!(mask.weight(), 2);
>
> Yeah, you don't import cpumask_test_cpu() for some reason, and has
> to use .weight() here to illustrate how it works. For an example, I
> think it's a rather bad example.
>
> Also, because you have atomic setters (except setall) and non-atomic
> getter, I think you most likely abuse the atomic API in your code.
> Please share your driver for the next round.
>
> I think it would be better to move this implementation together with
> the client code. Now that we merged cpumask helpers and stabilized the
> API, there's no need to merge dead lib code without clients.
>
> Thanks,
> Yury
