Received: from forward502d.mail.yandex.net (forward502d.mail.yandex.net [178.154.239.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6256430E842;
	Sat, 21 Jun 2025 10:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750502413; cv=none; b=EEkujAYIVHCYB29DThJDmcx19devNRR4n8LhvsUxIlLnHljlJTxQbCOhAUDmwRwE7WovIX8q+hgE3OurGyyRtaP3IU/AuIgShnTx5MOS+hP3Rek18nLhsIdEpAR3N2KHU7D1WxU+QJg/uD8lKjCMXZcbIkg5sbaZMmnXedsnn6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750502413; c=relaxed/simple;
	bh=MbJ56eGUoKOruETAA7fRRk8d/cPg4/Kbu9VBh/8LUzc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u9HIQsNKEEba9Ry5GtwDBcvWwqeVAHLGsaNII5oJccIaztpcD3WtOn6pBGKi8E/ZnIn6R5kA1IPE7cvTZQV1ZpNv5/XDd83MwFXcx8Wae1K9U+Ol+jF5VvBJEw3bLzPtOIi7hJ5Hed1hQzIrdKL3swf51NOmoTwnpzkNLPZ7fLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=oZQ1sD7s; arc=none smtp.client-ip=178.154.239.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="oZQ1sD7s"
Received: from mail-nwsmtp-smtp-production-main-81.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-81.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:832b:0:640:fda5:0])
	by forward502d.mail.yandex.net (Yandex) with ESMTPS id 5DA3261298;
	Sat, 21 Jun 2025 13:32:44 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-81.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id dWNfMBYLimI0-wwrEJ3Lf;
	Sat, 21 Jun 2025 13:32:43 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1750501963;
	bh=Z3ZRLrkQIS7QBG05Pth/MJ3flxSjMxjBWX3IXE/GqtY=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=oZQ1sD7sM8hB9lPXZLY6SQkgbICLHbbBpoyIfDPvRlrudqVZMEoXVFKpZHt82ujRb
	 ULh/GP7QTdt/haEc31GlxIdr5GMMDj+NRue8bNTHeYHVBD/hdkBhacCcRkRuEbM0iU
	 MudL24e+OF5UqBOa7ffHJjX+WVSAIILoN+FcvTNA=
Authentication-Results: mail-nwsmtp-smtp-production-main-81.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Sat, 21 Jun 2025 13:32:37 +0300
From: Onur <work@onurozkan.dev>
To: "Benno Lossin" <lossin@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <peterz@infradead.org>, <mingo@redhat.com>, <will@kernel.org>,
 <boqun.feng@gmail.com>, <longman@redhat.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <dakr@kernel.org>, <thatslyude@gmail.com>
Subject: Re: [PATCH V3] implement `ww_mutex` abstraction for the Rust tree
Message-ID: <20250621133237.5ccdfa3a@nimda.home>
In-Reply-To: <DAQL7NBDD68Q.1ZS3PUR0AGN0R@kernel.org>
References: <20250619140656.498-1-work@onurozkan.dev>
	<DAQL7NBDD68Q.1ZS3PUR0AGN0R@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Jun 2025 16:42:15 +0200
"Benno Lossin" <lossin@kernel.org> wrote:

> On Thu Jun 19, 2025 at 4:06 PM CEST, Onur =C3=96zkan wrote:
> > From: onur-ozkan <work@onurozkan.dev>
>=20
> Can you double-check your name in your git config? This doesn't match
> the Signed-off-by below.

That's strange. It should be "Onur =C3=96zkan", gitconfig is the correct
one. I will re-check that on V4 patch.

> > <work@onurozkan.dev> ---
> >  rust/helpers/helpers.c            |   1 +
> >  rust/helpers/ww_mutex.c           |  39 +++
> >  rust/kernel/error.rs              |   1 +
> >  rust/kernel/sync/lock.rs          |   1 +
> >  rust/kernel/sync/lock/ww_mutex.rs | 556
> > ++++++++++++++++++++++++++++++ 5 files changed, 598 insertions(+)
> >  create mode 100644 rust/helpers/ww_mutex.c
> >  create mode 100644 rust/kernel/sync/lock/ww_mutex.rs
>=20
> Can you split this patch into multiple smaller ones? For example all
> the tests can be done separately as well as the abstractions for
> `ww_class`, `ww_acquire_ctx` and `ww_mutex`.
>=20
> Thanks.

I will try to separate them. It's my first big (relatively) patch-based
work. I am still tryin to get used to it :)


> > +/// ```
> > +/// use kernel::c_str;
> > +/// use kernel::define_ww_class;
> > +///
> > +/// define_ww_class!(WOUND_WAIT_GLOBAL_CLASS, wound_wait,
> > c_str!("wound_wait_global_class")); +///
> > define_ww_class!(WAIT_DIE_GLOBAL_CLASS, wait_die,
> > c_str!("wait_die_global_class")); +/// ``` +#[macro_export]
> > +macro_rules! define_ww_class {
>=20
> What's the reason for this being a macro?

It's for creating global classes which was suggested in previous
reviews. A similar approach is used on the C side as well with
`DEFINE_WD_CLASS`.

> > +    ($name:ident, wait_die, $class_name:expr) =3D> {
> > +        static $name: $crate::sync::lock::ww_mutex::WwClass =3D {
> > +            $crate::sync::lock::ww_mutex::WwClass {
> > +                inner:
> > $crate::types::Opaque::new($crate::bindings::ww_class {
> > +                    stamp: $crate::bindings::atomic_long_t {
> > counter: 0 },
> > +                    acquire_name: $class_name.as_char_ptr(),
> > +                    mutex_name: $class_name.as_char_ptr(),
> > +                    is_wait_die: 1,
> > +                    // TODO: Replace with
> > `bindings::lock_class_key::default()` once stabilized for `const`.
> > +                    //
> > +                    // SAFETY: This is always zero-initialized
> > when defined with `DEFINE_WD_CLASS`
> > +                    // globally on C side.
> > +                    //
> > +                    // Ref:
> > https://github.com/torvalds/linux/blob/master/include/linux/ww_mutex.h#=
L85-L89
> > +                    acquire_key: unsafe { core::mem::zeroed() },
> > +                    // TODO: Replace with
> > `bindings::lock_class_key::default()` once stabilized for `const`.
> > +                    //
> > +                    // SAFETY: This is always zero-initialized
> > when defined with `DEFINE_WD_CLASS`
> > +                    // globally on C side.
> > +                    //
> > +                    // Ref:
> > https://github.com/torvalds/linux/blob/master/include/linux/ww_mutex.h#=
L85-L89
> > +                    mutex_key: unsafe { core::mem::zeroed() },
> > +                }),
> > +            }
> > +        };
> > +    };
> > +}
> > +
> > +/// Implementation of C side `ww_class`.
>=20
> This isn't informative at all. The names already match, so I wouldn't
> have thought otherwise.

I didn't want to duplicate the docs. I will update it (and others) on
V4.

> > +///
> > +/// Represents a group of mutexes that can participate in deadlock
> > avoidance together. +/// All mutexes that might be acquired
> > together should use the same class. +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// use kernel::sync::lock::ww_mutex::WwClass;
> > +/// use kernel::c_str;
> > +/// use pin_init::stack_pin_init;
> > +///
> > +/// stack_pin_init!(let _wait_die_class =3D
> > WwClass::new_wait_die(c_str!("graphics_buffers"))); +///
> > stack_pin_init!(let _wound_wait_class =3D
> > WwClass::new_wound_wait(c_str!("memory_pools"))); +/// +/// #
> > Ok::<(), Error>(()) +/// ```
> > +#[pin_data]
> > +pub struct WwClass {
> > +    /// Wrapper of the underlying C `ww_class`.
> > +    ///
> > +    /// You should not construct this type manually. Use the
> > `define_ww_class` macro
> > +    /// or call `WwClass::new_wait_die` or
> > `WwClass::new_wound_wait` instead.
> > +    #[pin]
> > +    pub inner: Opaque<bindings::ww_class>,
>=20
> Why `pub`? Abstractions normally don't expose `Opaque` wrappers for
> bindings. Especially because this type is marked `#[pin_data]` this
> seems wrong, because this would allow people to construct it in a
> non-pinned state & also non-initialized state.

It was for `define_ww_class` macro. It obviously says you shouldn't do
that but sure, I can undo the `pub` and create a `const` function for
`define_ww_class`.


Regards,
Onur
