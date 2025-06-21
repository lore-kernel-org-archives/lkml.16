Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC5718BC3D;
	Sat, 21 Jun 2025 21:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750542318; cv=none; b=kCF5/ED+wgGEJ3J08doG6VIMNilsExaRr3lxss63h3gU9uUNmNLhZNBR5VnUvxUPiuhNlu4lzZsER80Uxty8GiJxUiVEIu1QwKlO75wOZFEym9S7yzsTRZsABJg5/0nPDOsu19brujFAlb7dbXnfEr7nZLqjyuX4AFvZhcG8CqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750542318; c=relaxed/simple;
	bh=7veOKh/FJaHaLDLrOhG4xIXbFdznK9yUlTna5lApd9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUCLM8Ql+i1LXWrZ/o5HilOLkt8Olb64v1U57w5YhL9nA9RLOwuVoAzQxnDQ6i8OOwLLTjTnCs7vQr+a+fBkKSaQAqc2V8OP3QQ9HOjcQDbpZLaBIPEpMGBzis1ZjUsJ4Ii3MWtgDBQTMveMEdZCCPwxmVH80k4sKV2TgJJNIKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nq+diANe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nq+diANe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21475C4CEE7;
	Sat, 21 Jun 2025 21:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750542317;
	bh=7veOKh/FJaHaLDLrOhG4xIXbFdznK9yUlTna5lApd9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nq+diANeXLGqxWRkUQu9wnrM+MCjuah4QgemluKtSM+gcDWsxiilxwKAJDHp9xkbo
	 xY5d1MJ2JjJahd0oPcJuDWaKmJh/24SumIQdf/avHz9r0UJsLJVMdBpdzbZPF+GuIk
	 XXuE15QKZa0pchDemXF/nb4cRb+xkEEJAfj7Lxy1g1YSsprhtbenxXp3JEz+V8TRUA
	 gAR//JIavMZsG7IvEJfHhcfpZ4Ceuc8VqP22Fz/7tAD81zQYcaAWii3ZzyKSwKbwRv
	 BkLgTZrpep2XqFcxEvxnt3Et5CNDiVv7Yx+xsyE2qTc8uSmv3515zTXVrf0UoGrSFR
	 wyxiXPm0AriSw==
Date: Sat, 21 Jun 2025 23:45:11 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dave Airlie <airlied@redhat.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/4] rust: devres: replace Devres::new_foreign_owned()
Message-ID: <aFcn51EPcWlDG_YW@pollux>
References: <20250612145145.12143-1-dakr@kernel.org>
 <20250612145145.12143-3-dakr@kernel.org>
 <DASIPSH2IFKL.O55ZBVZFPVWB@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DASIPSH2IFKL.O55ZBVZFPVWB@kernel.org>

On Sat, Jun 21, 2025 at 11:10:14PM +0200, Benno Lossin wrote:
> On Thu Jun 12, 2025 at 4:51 PM CEST, Danilo Krummrich wrote:
> > diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
> > index b0a9c6182aec..f20636079f7a 100644
> > --- a/rust/kernel/cpufreq.rs
> > +++ b/rust/kernel/cpufreq.rs
> > @@ -12,7 +12,7 @@
> >      clk::Hertz,
> >      cpumask,
> >      device::{Bound, Device},
> > -    devres::Devres,
> > +    devres,
> >      error::{code::*, from_err_ptr, from_result, to_result, Result, VTABLE_DEFAULT_ERROR},
> >      ffi::{c_char, c_ulong},
> >      prelude::*,
> > @@ -910,7 +910,7 @@ unsafe impl<T: Driver> Sync for Registration<T> {}
> >  /// thread.
> >  unsafe impl<T: Driver> Send for Registration<T> {}
> >  
> > -impl<T: Driver> Registration<T> {
> > +impl<T: Driver + 'static> Registration<T> {
> 
> This change should probably be its own patch? If not, then it should be
> mentioned in the commit message.

It's a consequence of register_foreign_boxed() requiring T: 'static.

> >      const VTABLE: bindings::cpufreq_driver = bindings::cpufreq_driver {
> >          name: Self::copy_name(T::NAME),
> >          boost_enabled: T::BOOST_ENABLED,
> > @@ -1044,10 +1044,10 @@ pub fn new() -> Result<Self> {
> >  
> >      /// Same as [`Registration::new`], but does not return a [`Registration`] instance.
> >      ///
> > -    /// Instead the [`Registration`] is owned by [`Devres`] and will be revoked / dropped, once the
> > +    /// Instead the [`Registration`] is owned by [`kernel::devres`] and will be dropped, once the
> >      /// device is detached.
> >      pub fn new_foreign_owned(dev: &Device<Bound>) -> Result {
> 
> I think we can improve the names here. How about `new_attached`? See
> more below.

I feel like the name pretty much nails it: it's a new instance that is not
owned, by the Rust side, but by the C devres implementation (i.e. foreign
owned), which automatically drops it when the device is unbound.

Maybe Registration::new_devres_owned() instead?

> > -        Devres::new_foreign_owned(dev, Self::new()?, GFP_KERNEL)
> > +        devres::register_foreign_boxed(dev, Self::new()?, GFP_KERNEL)
> >      }
> >  }
> 
> > +/// Encapsulate `data` in a [`KBox`] and [`Drop::drop`] `data` once `dev` is unbound.
> > +///
> > +/// # Examples
> > +///
> > +/// ```no_run
> > +/// use kernel::{device::{Bound, Device}, devres};
> > +///
> > +/// struct Registration;
> > +///
> > +/// impl Registration {
> > +///     fn new() -> Self {
> > +///         // register (e.g. class device, IRQ, etc.)
> > +///
> > +///         Self
> > +///     }
> > +/// }
> > +///
> > +/// impl Drop for Registration {
> > +///     fn drop(&mut self) {
> > +///        // unregister
> > +///     }
> > +/// }
> > +///
> > +/// fn from_bound_context(dev: &Device<Bound>) -> Result {
> > +///     devres::register_foreign_boxed(dev, Registration::new(), GFP_KERNEL)
> > +/// }
> > +/// ```
> > +pub fn register_foreign_boxed<T, E>(
> 
> I don't really get the name of this function. The data isn't really
> foreign and that the user also shouldn't really care about the fact that
> you use `KBox` under the hood.
> 
> How about we call this something like `attach_data`?

Hm, I think attach_data() doesn't quite hit the point. Maybe just
devres::register_owned() instead. I agree that 'boxed' is an unnecessary
implementation detail.

> ---
> Cheers,
> Benno
> 
> > +    dev: &Device<Bound>,
> > +    data: impl PinInit<T, E>,
> > +    flags: Flags,
> > +) -> Result
> > +where
> > +    T: 'static,
> > +    Error: From<E>,
> > +{
> > +    let data = KBox::pin_init(data, flags)?;
> > +
> > +    register_foreign(dev, data)
> > +}
