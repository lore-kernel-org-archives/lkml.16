Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C878E610C;
	Sun, 22 Jun 2025 07:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750578129; cv=none; b=Mrnrd1itNd7nAI6jlupnreFJGJMESUwBPd2GZi0mAOqmcXQoD6gIH7SAShOuPR07dB2QH7pgQmIVwz8PuPOKoqhHU78TFDZXwQagXdl36Epys/zr3sDkWjx9a7cF+57qPty5gQpeJpL7LNlJ6fOoDpZmqABbmkAd2q15xPG+uSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750578129; c=relaxed/simple;
	bh=cQQQgjyjkSMIetWzKBGvZVTq5Nm37KOVVGvrc7g7Emo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FOt8XE7egyRpfL6/aXE96Y/2SQ2+k/Y897/HUEfH1esyPzY4GzxysnKts7j4h/xL4Gie8SwJaYDeie8s59jcYyNFbI8o4iSskRz5Pj9GnMKNuAKFDXDZePmNzhQgl3n4IYd/PuPzmpcrJkq4R7Iy2TOGsYS9LVt0CXNuVIAYbhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3RaYBqL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3RaYBqL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16AF2C4CEE3;
	Sun, 22 Jun 2025 07:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750578129;
	bh=cQQQgjyjkSMIetWzKBGvZVTq5Nm37KOVVGvrc7g7Emo=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=f3RaYBqLMV0273WAPiCQGUH7CeZu6IU/rWxDNjNjKPUT/6OCubhEgYvGYgjV/ShdA
	 BtxvzJGGgLp6pCOk4Tg9psJ2u7e2WbFxD+rgoiw6GtN2pAdlSu7xkD/MwLzQlXrKkd
	 WBhb/Bp9UoxZzYhtVm6zAD3hFNWVhJeJw/gXwU7s8iNv8Rkgpqa+zI1JBpXLUwYTRX
	 M3bvrpj5yo3WOFvZX55lngCqZWOxxlFF/1sKlAsJpXz/szv8JbyJWVZqfBDVlK70q7
	 s7ekSn19PIeSDmkM6ZVGEjvqeOOcYNfRfr13ns39V4iYutofu32JsTtbzdwRIY3a8H
	 xwi/HmhKa5UPA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Jun 2025 09:42:03 +0200
Message-Id: <DASW5JYFRE2K.1E5T6FI6KNRQJ@kernel.org>
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Dave
 Airlie" <airlied@redhat.com>, "Simona Vetter" <simona.vetter@ffwll.ch>,
 "Viresh Kumar" <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/4] rust: devres: replace Devres::new_foreign_owned()
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250612145145.12143-1-dakr@kernel.org>
 <20250612145145.12143-3-dakr@kernel.org>
 <DASIPSH2IFKL.O55ZBVZFPVWB@kernel.org> <aFcn51EPcWlDG_YW@pollux>
In-Reply-To: <aFcn51EPcWlDG_YW@pollux>

On Sat Jun 21, 2025 at 11:45 PM CEST, Danilo Krummrich wrote:
> On Sat, Jun 21, 2025 at 11:10:14PM +0200, Benno Lossin wrote:
>> On Thu Jun 12, 2025 at 4:51 PM CEST, Danilo Krummrich wrote:
>> > diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
>> > index b0a9c6182aec..f20636079f7a 100644
>> > --- a/rust/kernel/cpufreq.rs
>> > +++ b/rust/kernel/cpufreq.rs
>> > @@ -12,7 +12,7 @@
>> >      clk::Hertz,
>> >      cpumask,
>> >      device::{Bound, Device},
>> > -    devres::Devres,
>> > +    devres,
>> >      error::{code::*, from_err_ptr, from_result, to_result, Result, VT=
ABLE_DEFAULT_ERROR},
>> >      ffi::{c_char, c_ulong},
>> >      prelude::*,
>> > @@ -910,7 +910,7 @@ unsafe impl<T: Driver> Sync for Registration<T> {}
>> >  /// thread.
>> >  unsafe impl<T: Driver> Send for Registration<T> {}
>> > =20
>> > -impl<T: Driver> Registration<T> {
>> > +impl<T: Driver + 'static> Registration<T> {
>>=20
>> This change should probably be its own patch? If not, then it should be
>> mentioned in the commit message.
>
> It's a consequence of register_foreign_boxed() requiring T: 'static.

Then let's put the bound on that function, since putting it on the impl
block also affects `Registration::new()`.

>> >      const VTABLE: bindings::cpufreq_driver =3D bindings::cpufreq_driv=
er {
>> >          name: Self::copy_name(T::NAME),
>> >          boost_enabled: T::BOOST_ENABLED,
>> > @@ -1044,10 +1044,10 @@ pub fn new() -> Result<Self> {
>> > =20
>> >      /// Same as [`Registration::new`], but does not return a [`Regist=
ration`] instance.
>> >      ///
>> > -    /// Instead the [`Registration`] is owned by [`Devres`] and will =
be revoked / dropped, once the
>> > +    /// Instead the [`Registration`] is owned by [`kernel::devres`] a=
nd will be dropped, once the
>> >      /// device is detached.
>> >      pub fn new_foreign_owned(dev: &Device<Bound>) -> Result {
>>=20
>> I think we can improve the names here. How about `new_attached`? See
>> more below.
>
> I feel like the name pretty much nails it: it's a new instance that is no=
t
> owned, by the Rust side, but by the C devres implementation (i.e. foreign
> owned), which automatically drops it when the device is unbound.

Yeah, but `foreign` is so unspecific... With `ForeignOwnable`, it makes
sense, since it could be anything.

> Maybe Registration::new_devres_owned() instead?

I like that one better, let's go with that.

>> > -        Devres::new_foreign_owned(dev, Self::new()?, GFP_KERNEL)
>> > +        devres::register_foreign_boxed(dev, Self::new()?, GFP_KERNEL)
>> >      }
>> >  }
>>=20
>> > +/// Encapsulate `data` in a [`KBox`] and [`Drop::drop`] `data` once `=
dev` is unbound.
>> > +///
>> > +/// # Examples
>> > +///
>> > +/// ```no_run
>> > +/// use kernel::{device::{Bound, Device}, devres};
>> > +///
>> > +/// struct Registration;
>> > +///
>> > +/// impl Registration {
>> > +///     fn new() -> Self {
>> > +///         // register (e.g. class device, IRQ, etc.)
>> > +///
>> > +///         Self
>> > +///     }
>> > +/// }
>> > +///
>> > +/// impl Drop for Registration {
>> > +///     fn drop(&mut self) {
>> > +///        // unregister
>> > +///     }
>> > +/// }
>> > +///
>> > +/// fn from_bound_context(dev: &Device<Bound>) -> Result {
>> > +///     devres::register_foreign_boxed(dev, Registration::new(), GFP_=
KERNEL)
>> > +/// }
>> > +/// ```
>> > +pub fn register_foreign_boxed<T, E>(
>>=20
>> I don't really get the name of this function. The data isn't really
>> foreign and that the user also shouldn't really care about the fact that
>> you use `KBox` under the hood.
>>=20
>> How about we call this something like `attach_data`?
>
> Hm, I think attach_data() doesn't quite hit the point. Maybe just
> devres::register_owned() instead. I agree that 'boxed' is an unnecessary
> implementation detail.

I like `register_owned` better, but I'm not 100% convinced by the
`owned` part... The regular devres creation is called `Devres::new`,
right? How about we just call this `register`?

---
Cheers,
Benno
