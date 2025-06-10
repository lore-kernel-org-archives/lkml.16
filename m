Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12762227EA3;
	Tue, 10 Jun 2025 11:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749554783; cv=none; b=QSupaZy6me+JXMo9QU1h6tNagHdE6vrwYj+xeplgY7XFWNby7neiJZfcK/8nHOHVd1lkZ0xrmCG/HLvGio6XDwy2grxEwnvLHS49PicMulN0MwSM5+vzZR5/eLULlNjQUsSxKhZbSlnKs+gWzpqdUeOOUkuQshxu/FTKuFRNt7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749554783; c=relaxed/simple;
	bh=/z0GgE9IRkDYGHI/IsWXrA2ubAR+Pni9VNySYq6a7tc=;
	h=From:To:Cc:Subject:In-Reply-To:Message-ID:References:Date:
	 MIME-Version:Content-Type; b=AK+rSuq698/auuriTwnhx8NNnra1wQpCJTYlbUYZYU9d3tvtklVpEOdTsp6dseQdT8IDpoh9yjudrBTC5aAvhCApsP7ObaerJqp+2zqd12yXkJJwz/NktamlDqc0gJ6MeVt2/FN/wOnP4NoAdI6qelMNVnvInyDTCgZ0G/rUf5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=un6UbFjP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="un6UbFjP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3EB8C4CEED;
	Tue, 10 Jun 2025 11:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749554782;
	bh=/z0GgE9IRkDYGHI/IsWXrA2ubAR+Pni9VNySYq6a7tc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=un6UbFjPtKuVDW/6YPewUO7WtDpdqp0iNkImIUx8y8YJ/0yXWxLxCS+2dWSuG8FFG
	 Nebf7BD5tATniIyJNi3zQ4LFdtALVfMJ0m81WmfBzjPfYakFyl5EXKNJ+XIlnW+NyK
	 LqUuhITKY9Jl1etGapomihcbm5k05gOSLwhQhcA93XKq/G3JFnM6qynNfG5E+cEqjj
	 EhmGfpH5DrWzpRd30EJSxJzsKB6vtG3hkPC06qOfExGKg5VuvONpsRaJ6Wrj0sV0oM
	 2ciRCEPMZ6S+m8oC6xfq04c5rhz6tAXMPKG3dtncG+796KqY+qMJFbLx1Qj8oM5BGU
	 +TmNphtLDkl0w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <alex.gaynor@gmail.com>,  <ojeda@kernel.org>,  <aliceryhl@google.com>,
  <anna-maria@linutronix.de>,  <bjorn3_gh@protonmail.com>,
  <boqun.feng@gmail.com>,  <dakr@kernel.org>,  <frederic@kernel.org>,
  <gary@garyguo.net>,  <jstultz@google.com>,
  <linux-kernel@vger.kernel.org>,  <lossin@kernel.org>,
  <lyude@redhat.com>,  <rust-for-linux@vger.kernel.org>,
  <sboyd@kernel.org>,  <tglx@linutronix.de>,  <tmgross@umich.edu>
Subject: Re: [PATCH v2 4/5] rust: time: Make HasHrTimer generic over
 HrTimerMode
In-Reply-To: <20250609102418.3345792-5-fujita.tomonori@gmail.com> (FUJITA
	Tomonori's message of "Mon, 09 Jun 2025 19:24:17 +0900")
Message-ID: <87o6uv27qr.fsf@kernel.org>
References: <20250609102418.3345792-1-fujita.tomonori@gmail.com>
	<1zU91IwxagjPCPl0Nw9xz728DEqNqtV7KHWwCZYP2EiiVcUrZT3T2VFLOOdsmQ-LT9GrdHddepVw6__or-ZvPQ==@protonmail.internalid>
	<20250609102418.3345792-5-fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 10 Jun 2025 13:25:37 +0200
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

Can you add an optional comma after the `field` entry? I think it is
`$(,)?` in the macro declaration.


Best regards,
Andreas Hindborg



