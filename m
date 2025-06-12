Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807B9247DEA;
	Thu, 12 Jun 2025 13:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749736016; cv=none; b=aAxs6WMNBEe+aCKimsZaDB6iSE0GyWNp4rWadlxeagsn23LTDT3t5tmq4BoOHjVNhNn0s7HZxZl0Q4/8xmWQ+g8TauwnEjU8QjRpxdLc+XqIKpVuP7VsAarqy3SEJsmHAAkpdJZXOiJlp/IWKxp4wHW3OdV62aDROvn3GCELaEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749736016; c=relaxed/simple;
	bh=hT/bQ9IGewEqAteujdCHealqh+6L8uhjT0UGYnjnpBY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SHXHZ2zkx719KnThWnowoB2Zb2ufIrdqAAB7i2+2fX1XtK3NVSGJRPw8hr1t8nTAqDHR7TnToxFL1UB49ps5AW2IiosN0jCQrqv2Mtz2du7wTBq2gVSwDh2pWhh35LtpXwm4236tNdEhkfJRKDqSUX4HmXvryyVJdhF10mj+dHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ehENRr+w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ehENRr+w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4734EC4CEEA;
	Thu, 12 Jun 2025 13:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749736015;
	bh=hT/bQ9IGewEqAteujdCHealqh+6L8uhjT0UGYnjnpBY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ehENRr+wQeUQfWI7DWJUxjpVMJSGdm78/rslgoMuGjahzxO08dL/2SRVwORVcTzDu
	 TQm9g19u0Qy2lC2qePI0+bXQ2y02huJZMPEa8DB732LY1SuAL1Sh7mhLMQkE5QVAAT
	 yRNh2YKvf7KJXWP7pGMEf4SJNpDfP48C74xHWQTq6W2bqJUtF2BU+CwsuvvZLbqunj
	 5ODWsD8nzFYTnsiNS7parMKvZ9Crg9o/se/2ZmK5nQ86zDVKnbPzHCgdjMzlAitjO9
	 EigKo/rtcXoscxAwOZ87I7irCJFLjXEAktDwJEUpgVI/Z+wN5hNCb8qekeIUFMiYtS
	 qHkeok0xqyD2Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <alex.gaynor@gmail.com>,  <ojeda@kernel.org>,  <aliceryhl@google.com>,
  <anna-maria@linutronix.de>,  <bjorn3_gh@protonmail.com>,
  <boqun.feng@gmail.com>,  <dakr@kernel.org>,  <frederic@kernel.org>,
  <gary@garyguo.net>,  <jstultz@google.com>,
  <linux-kernel@vger.kernel.org>,  <lossin@kernel.org>,
  <lyude@redhat.com>,  <rust-for-linux@vger.kernel.org>,
  <sboyd@kernel.org>,  <tglx@linutronix.de>,  <tmgross@umich.edu>
Subject: Re: [PATCH v3 4/5] rust: time: Make HasHrTimer generic over
 HrTimerMode
In-Reply-To: <20250610132823.3457263-5-fujita.tomonori@gmail.com> (FUJITA
	Tomonori's message of "Tue, 10 Jun 2025 22:28:22 +0900")
References: <20250610132823.3457263-1-fujita.tomonori@gmail.com>
	<aLAKkgBtJFi7eoQFKUAK328qMA9leoq0zggUJFvmVLvPKMS2zd93GP46_ctT_OyR_KidYBqkaweZYPt1sQ4VEQ==@protonmail.internalid>
	<20250610132823.3457263-5-fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 12 Jun 2025 15:45:43 +0200
Message-ID: <87cyb9xed4.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> Add a `TimerMode` associated type to the `HasHrTimer` trait to
> represent the operational mode of the timer, such as absolute or
> relative expiration. This new type must implement the `HrTimerMode`
> trait, which defines how expiration values are interpreted.
>
> Update the `start()` method to accept an `expires` parameter of type
> `<Self::TimerMode as HrTimerMode>::Expires` instead of the fixed `Ktime`.
> This enables different timer modes to provide strongly typed expiration
> values, such as `Instant<C>` or `Delta`.
>
> The `impl_has_hr_timer` macro is also extended to allow specifying the
> `HrTimerMode`. In the following example, it guarantees that the
> `start()` method for `Foo` only accepts `Instant<Monotonic>`. Using a
> `Delta` or an `Instant` with a different clock source will result in a
> compile-time error:
>
> struct Foo {
>     #[pin]
>     timer: HrTimer<Self>,
> }
>
> impl_has_hr_timer! {
>     impl HasHrTimer<Self> for Foo {
>         mode : AbsoluteMode<Monotonic>,
>         field : self.timer
>     }
> }
>
> This design eliminates runtime mismatches between expires types and
> clock sources, and enables stronger type-level guarantees throughout
> hrtimer.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


