Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2A1280A57;
	Tue, 29 Apr 2025 09:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745920050; cv=none; b=n+I+fkJBFr0uCHIMhbyrCqubis75mAxZkAlf1xeAtyLn8g1rGSBfV4mlB4n/FItYxef8+HM32u8Df32pGPYBlenzQ6jNNQttujkAOm2mMdH3/c+aacDTnhf7usx5AbwIa/ZdYoqIxHd5MCN8BRRzdHQI7XMytGKsC/LNzuj1QXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745920050; c=relaxed/simple;
	bh=rCCH7PnwRIKJjuMGwA5M2Oxhs/Vvpj/DTbC2aRuGz9k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lnxC5B0zT/f/FkWrd0sgC3COsy9/X70eyshyAA8mMgt12mRErvTQxYXuCyhy/ijeUs2CG8mIS87zpdeXI21YfXBWuo2/n4ytZrmvHkph6wIRzCVotpQsb26lmrmuG+KDIN0OtolPrgKLOlY5iIWEHkyDLcNWrjkyzcNgnZ7WTNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IfCjKN2X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IfCjKN2X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A94C4CEE3;
	Tue, 29 Apr 2025 09:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745920050;
	bh=rCCH7PnwRIKJjuMGwA5M2Oxhs/Vvpj/DTbC2aRuGz9k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IfCjKN2XfZ8mjckSmqV4/U6ip7XfuIBKGRU/E/o9GD27Rsg4oRc3kf+WRsptz919Y
	 c+BZ/BuwuXa1zOQHV7QzHFoaWr6CZtusvjEWViTDN4/D6PtPQSPG/a2dZrKWMGkeDP
	 TFYJ6t9VuI1uvbcKqFQAi98Y1r0i5evjDMh1gYcXDEWl4K1aFofcSSV3+gEyrc8KpF
	 ElxgeDn0JyqyCUP+BsS2yv77n9tcQdunJKL48ggtNUU34Yre1Rw0B909l0wuGeEmfk
	 N4Itlwn25FFebkUA5mwAW7KhDdqr0tViraMiyRgex2RX2Me+qQyhxG+uOFFuaH2hqB
	 AexSac/P0DrpQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>
Cc: <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  "Boqun Feng" <boqun.feng@gmail.com>,  "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>,  "Frederic Weisbecker" <frederic@kernel.org>,
  "Thomas Gleixner" <tglx@linutronix.de>,  "Anna-Maria Behnsen"
 <anna-maria@linutronix.de>,  "John Stultz" <jstultz@google.com>,  "Stephen
 Boyd" <sboyd@kernel.org>,  "Miguel Ojeda" <ojeda@kernel.org>,  "Alex
 Gaynor" <alex.gaynor@gmail.com>,  "Gary Guo" <gary@garyguo.net>,
  =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>,  "Benno Lossin"
 <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor
 Gross" <tmgross@umich.edu>,  "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 2/8] rust: hrtimer: Add HrTimer::raw_forward() and
 forward()
In-Reply-To: <f7d854d557423be6411ccb7c641aa2ab4c579345.camel@redhat.com>
	(Lyude Paul's message of "Fri, 25 Apr 2025 16:15:14 -0400")
References: <20250415195020.413478-1-lyude@redhat.com>
	<20250415195020.413478-3-lyude@redhat.com> <87frhzm5y5.fsf@kernel.org>
	<-vfKuS73b0KP2INfq0xBEquddbhqbpDA5pD6X2jc77grCWsjnPE9RKjsIdgFPnfp58Q6PSUSvQjF6dL65NHBew==@protonmail.internalid>
	<f7d854d557423be6411ccb7c641aa2ab4c579345.camel@redhat.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 29 Apr 2025 11:43:54 +0200
Message-ID: <87v7qn2tgl.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Lyude Paul" <lyude@redhat.com> writes:

> On Wed, 2025-04-23 at 14:13 +0200, Andreas Hindborg wrote:
>> Lyude Paul <lyude@redhat.com> writes:
>> >
>> > +};
>> >  use core::marker::PhantomData;
>> >  use pin_init::PinInit;
>> >
>> > @@ -164,6 +168,36 @@ pub(crate) unsafe fn raw_cancel(this: *const Self) -> bool {
>> >          // handled on the C side.
>> >          unsafe { bindings::hrtimer_cancel(c_timer_ptr) != 0 }
>> >      }
>> > +
>> > +    /// Forward the timer expiry for a given timer pointer.
>> > +    ///
>> > +    /// # Safety
>> > +    ///
>> > +    /// `self_ptr` must point to a valid `Self`.
>>
>> I don't think safety requirements are tight enough. We must also have
>> exclusive ownership of the pointee of `self_ptr`.
>
> Are we sure "exclusive ownership" is the right term here? We /technically/ can
> be considered to have unique access over the time expiry since we allow racy
> reads of it, and we only allow writes in situations where the timer access is
> exclusive and the timer isn't started - or from the timer callback itself when
> the timer is started. But we don't have the guarantee of unique access to
> `Self`, and both context and context-less forward() make use of raw_forward()
> since otherwise I wouldn't have really added a raw_ variant in the first
> place.

The function must be safe to call whenever the safety requirements are
satisfied. `self_ptr` pointing to a valid `Self` is not enough for this.
We must also satisfy the conditions for calling
`bindings::hrtimer_forward`, which are a) we are in timer context, or b)
there are no other threads modifying the timer. a) implies b) because
the hrtimer framework holds a lock in timer context, if I recall
correctly.

We can satisfy these by requiring exclusive access, right? In timer
context, it is given by C API contract, outside, we just have to have
&mut ref to the timer.


Best regards,
Andreas Hindborg


