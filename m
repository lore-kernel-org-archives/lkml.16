Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843ED289E0D;
	Wed,  4 Jun 2025 09:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749030218; cv=none; b=BqEc69sT9UEUZtNZaxslpE56TvsQ1TDHhyXXzI/juM89MS+lUOLQhMui85tfYUPYjNfsW1Usq9Qk67jomCnrNRal9lyZDfIcxnszWPYHGGfHFiuv1wWPrYU93YNFwcPM+G6Dcbig7lVJeUCFhH4nJ4vbbCDuyHm6GDYzElccOF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749030218; c=relaxed/simple;
	bh=u3ITzXDtBPeWmINtqbDG5XMJFYRTbSTBD+34NqEtIIw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=fOgyZbnf2es2/yrnZ3dmtA0aPr16lwzmmNaxorJ32zcFHaIW9ptoF+zm+xiuRDNOnfAeGEYoVEQglsdr3fEzB79Jtqoi2l798M8YNTjaGJC8qd3nf6Tm7OsedvlEOC926FIXkYWhaZFG06H1c5cNNGreA5VggzyFnvV1NpPWiLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o2pQ31OT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o2pQ31OT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 125C6C4CEE7;
	Wed,  4 Jun 2025 09:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749030218;
	bh=u3ITzXDtBPeWmINtqbDG5XMJFYRTbSTBD+34NqEtIIw=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=o2pQ31OTGPpfavAMXXNxkWmmCgWzCpZ2rc5Eq3D5tsqjcZy3vaulVrhITy0iIXiVr
	 x7a3DcGrSJMKGCeWyxhXdNBG/Zx6Iwi6g5Lj0u3reRjRiBr1v/tlNuFxxv7nZhe9gF
	 GuFws3L0nCDU7Ds4koU1VZN4dY7ZALWQq09nJPUoThJU3+eCa4a5E7r+K/pz2xKPi9
	 sFtRyTP5o/FvfF41HYP3mBKJUSHOgca1s9Ql0aQWOUpG31ACWUyChlvZgeZSqZnyuV
	 LvecELZ06iOi5x3A3fLFqYed8EycyWBCw0hd1vAeHxZhlu0/ohrbj6AblTfZwvI5G+
	 yhVQ73P4gQLkQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Jun 2025 11:43:33 +0200
Message-Id: <DADNGRP1CDJX.1J7CGF3093LG5@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com> <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com> <D9W5IX9Z7QMU.3DL48O2KYTN1Z@kernel.org> <aD3BN7-MAyYq2NAX@google.com> <DADKRV2K4A5I.3UAZF5O9EW6R8@kernel.org> <CAH5fLggaX18dAzWqLLkn9ii+hpu14u4aY5vd=kSCkk6LvsW-eA@mail.gmail.com>
In-Reply-To: <CAH5fLggaX18dAzWqLLkn9ii+hpu14u4aY5vd=kSCkk6LvsW-eA@mail.gmail.com>

On Wed Jun 4, 2025 at 9:48 AM CEST, Alice Ryhl wrote:
> On Wed, Jun 4, 2025 at 9:37=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>> On Mon Jun 2, 2025 at 5:20 PM CEST, Alice Ryhl wrote:
>> > On Wed, May 14, 2025 at 10:04:43PM +0200, Benno Lossin wrote:
>> >> On Wed May 14, 2025 at 9:20 PM CEST, Daniel Almeida wrote:
>> >> > +                )
>> >> > +            });
>> >> > +
>> >> > +            if res.is_err() {
>> >> > +                // SAFETY: We are returning an error, so we can de=
stroy the slot.
>> >> > +                unsafe { core::ptr::drop_in_place(addr_of_mut!((*s=
lot).handler)) };
>> >> > +            }
>> >> > +
>> >> > +            res
>> >> > +        };
>> >> > +
>> >> > +        // SAFETY:
>> >> > +        // - if this returns Ok, then every field of `slot` is ful=
ly
>> >> > +        // initialized.
>> >> > +        // - if this returns an error, then the slot does not need=
 to remain
>> >> > +        // valid.
>> >> > +        unsafe { pin_init_from_closure(closure) }
>> >>
>> >> Please don't use `pin_init_from_closure`, instead do this:
>> >>
>> >>     pin_init!(Self {
>> >>         irq,
>> >>         handler,
>> >>         _pin: PhantomPinned
>> >>     })
>> >>     .pin_chain(|this| {
>> >>         // SAFETY: TODO: correct FFI safety requirements
>> >>         to_result(unsafe {
>> >>             bindings::request_irq(...)
>> >>         })
>> >>     })
>> >>
>> >> The `pin_chain` function is exactly for this use-case, doing some
>> >> operation that might fail after initializing & it will drop the value
>> >> when the closure fails.
>> >
>> > No, that doesn't work. Using pin_chain will call free_irq if the call =
to
>> > request_irq fails, which is incorrect.
>>
>> Good catch. That's a bit annoying then... I wonder if there is a
>> primitive missing in pin-init that could help with this... Any ideas?
>
> I believe initializers for underscore fields would do it. We could
> potentially abuse the _pin field, but frankly I think that's too
> confusing to the reader.

Oh yeah that's the feature we want here, will add it to my list for the
next cycle :)

---
Cheers,
Benno
