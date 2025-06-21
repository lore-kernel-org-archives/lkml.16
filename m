Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9704413B58B;
	Sat, 21 Jun 2025 21:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750540221; cv=none; b=l682lepoz73+DM19+D0F4p5lJr1ZZdQ1TJl7djdQdxFZnNe1TkomgYyYjg1g9KRotg7U+CVGy4Pxsy+UNHNiEcgL/rAJySD6BU6rsWm1GJmbnj7z3a6vSk77/bDH9oszxVG+hB6Fuzg3X/1niC7AI20p41UXouHQwpy5l/T/c78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750540221; c=relaxed/simple;
	bh=sFlTkKvAVokHMMnvdoZbpBZ+WoHYSE1masCHw4i81Bo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Q3OVgX/1OD7Yn/5ZaqSe3ePkXao6UFIrHL/gj/AVdYNYl2PTRX8NlxxBVQryaHH6GK/A58LyhnLBByS2vl1+IydGWKoEuxDQwQcbDnEE+4d6T7meNNtG9L7PZoia42pw8kk+bLwVxXeD6dNoffMRfdaP1BrrHVUaLJwAVpEw4pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=McnVHHCy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="McnVHHCy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F3BC4CEE7;
	Sat, 21 Jun 2025 21:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750540219;
	bh=sFlTkKvAVokHMMnvdoZbpBZ+WoHYSE1masCHw4i81Bo=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=McnVHHCyCnHeuD2vCUSFK38I62yvM0Cz34mquw/DlMUhvdl1VwmfmFFhUKdUyZU3n
	 PsblTamaHYFQnuclm9BnfMGztp0et5wtAKloj0f8lrfZD/ZLQ5M/Cevt41dc4PEVWW
	 JKvu8AIE7QAClw6AIuGzVQDMbqv4e03GmyReBM99l2VH1E1LA1UWiRa8h/ShRlC1Uk
	 fY7yW4c32KchKdkIKAKprW5kWxOxkYH891m10OD7A9PVmmSFokqQa4SWPcgfR55wcq
	 YidVuIE8QorSjzs06GqD2pkQCWFfEvvqDd0CGALETXjic4+YCfh+DM/+BrcxNMLhXc
	 j61mF/emSTK5A==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Jun 2025 23:10:14 +0200
Message-Id: <DASIPSH2IFKL.O55ZBVZFPVWB@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Dave
 Airlie" <airlied@redhat.com>, "Simona Vetter" <simona.vetter@ffwll.ch>,
 "Viresh Kumar" <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/4] rust: devres: replace Devres::new_foreign_owned()
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <benno.lossin@proton.me>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>
X-Mailer: aerc 0.20.1
References: <20250612145145.12143-1-dakr@kernel.org>
 <20250612145145.12143-3-dakr@kernel.org>
In-Reply-To: <20250612145145.12143-3-dakr@kernel.org>

On Thu Jun 12, 2025 at 4:51 PM CEST, Danilo Krummrich wrote:
> diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
> index b0a9c6182aec..f20636079f7a 100644
> --- a/rust/kernel/cpufreq.rs
> +++ b/rust/kernel/cpufreq.rs
> @@ -12,7 +12,7 @@
>      clk::Hertz,
>      cpumask,
>      device::{Bound, Device},
> -    devres::Devres,
> +    devres,
>      error::{code::*, from_err_ptr, from_result, to_result, Result, VTABL=
E_DEFAULT_ERROR},
>      ffi::{c_char, c_ulong},
>      prelude::*,
> @@ -910,7 +910,7 @@ unsafe impl<T: Driver> Sync for Registration<T> {}
>  /// thread.
>  unsafe impl<T: Driver> Send for Registration<T> {}
> =20
> -impl<T: Driver> Registration<T> {
> +impl<T: Driver + 'static> Registration<T> {

This change should probably be its own patch? If not, then it should be
mentioned in the commit message.

>      const VTABLE: bindings::cpufreq_driver =3D bindings::cpufreq_driver =
{
>          name: Self::copy_name(T::NAME),
>          boost_enabled: T::BOOST_ENABLED,
> @@ -1044,10 +1044,10 @@ pub fn new() -> Result<Self> {
> =20
>      /// Same as [`Registration::new`], but does not return a [`Registrat=
ion`] instance.
>      ///
> -    /// Instead the [`Registration`] is owned by [`Devres`] and will be =
revoked / dropped, once the
> +    /// Instead the [`Registration`] is owned by [`kernel::devres`] and =
will be dropped, once the
>      /// device is detached.
>      pub fn new_foreign_owned(dev: &Device<Bound>) -> Result {

I think we can improve the names here. How about `new_attached`? See
more below.

> -        Devres::new_foreign_owned(dev, Self::new()?, GFP_KERNEL)
> +        devres::register_foreign_boxed(dev, Self::new()?, GFP_KERNEL)
>      }
>  }

> +/// Encapsulate `data` in a [`KBox`] and [`Drop::drop`] `data` once `dev=
` is unbound.
> +///
> +/// # Examples
> +///
> +/// ```no_run
> +/// use kernel::{device::{Bound, Device}, devres};
> +///
> +/// struct Registration;
> +///
> +/// impl Registration {
> +///     fn new() -> Self {
> +///         // register (e.g. class device, IRQ, etc.)
> +///
> +///         Self
> +///     }
> +/// }
> +///
> +/// impl Drop for Registration {
> +///     fn drop(&mut self) {
> +///        // unregister
> +///     }
> +/// }
> +///
> +/// fn from_bound_context(dev: &Device<Bound>) -> Result {
> +///     devres::register_foreign_boxed(dev, Registration::new(), GFP_KER=
NEL)
> +/// }
> +/// ```
> +pub fn register_foreign_boxed<T, E>(

I don't really get the name of this function. The data isn't really
foreign and that the user also shouldn't really care about the fact that
you use `KBox` under the hood.

How about we call this something like `attach_data`?=20

---
Cheers,
Benno

> +    dev: &Device<Bound>,
> +    data: impl PinInit<T, E>,
> +    flags: Flags,
> +) -> Result
> +where
> +    T: 'static,
> +    Error: From<E>,
> +{
> +    let data =3D KBox::pin_init(data, flags)?;
> +
> +    register_foreign(dev, data)
> +}
