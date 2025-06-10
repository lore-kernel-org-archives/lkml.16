Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494762620C1;
	Tue, 10 Jun 2025 11:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749554791; cv=none; b=X/UZZgMKfcOb6x2sUmf+1koUtGtrI8xpcbRsmA2fYSSE9IrWhpfud6qD1DTvwO4jA8Zoj/cXUBXc1C+1mVM3yVPebgZgcsHkKlm2pO/4b6WrEX/83dQUiY+4vL12XYJhtP4etTnD//OiU7ef1nLVdeoUjINBAzWMUV3b59MinVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749554791; c=relaxed/simple;
	bh=1UaJKy00uTnH0vfVFPPYpWj5YFV75jKiG3h/gNhHPPc=;
	h=From:To:Cc:Subject:In-Reply-To:Message-ID:References:Date:
	 MIME-Version:Content-Type; b=DcOcS3gvlUHcX9jBlXVCnblTUu8apCnzy4YxnwMHc/FzDpivaVKtCG7E9BVcLVI+W4tNG06PKwCSJb2PpWMc6O7uwPr+4+SdYDlDjhxbJHj3hkZVlUfXUporuQ7RsHFmWDgrVqQK0GfqXH/vd0TVuAKCMUmIa9OAetOu4IC/Od4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tKuyHpFi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tKuyHpFi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5ADC4CEED;
	Tue, 10 Jun 2025 11:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749554791;
	bh=1UaJKy00uTnH0vfVFPPYpWj5YFV75jKiG3h/gNhHPPc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tKuyHpFimq7Tq8OiE0bJ0CTAcbkXgEYKg4ggQNligSj9Egg6F6jCstXT+BdQ7JHW6
	 BZDA69+DT2rvtQoWTlz4xNXANpWy9/Yug0DkW9XZtX/KQdtxB7Ikm9IhxBVQFE06x9
	 fIDWf/dakfn2FXxsJAZk9SYcEAfj4zeJY577HmqXx7nHz0V9zra+pGPgm9a/3PhjRy
	 1f3Vunxyhnp/8qO8yOz41exJsCEy4HrZfDpckwMQbeDaAAlZg8XoinXlgJo9mjKJLX
	 hJky92eV2KH9JLcM1dRBvyM1BVW1fFCRSCVb3CLXrxLCLV3J/2p+RjUuaSmt3Ux9GJ
	 b17yZrxWHIJSg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <alex.gaynor@gmail.com>,  <ojeda@kernel.org>,  <aliceryhl@google.com>,
  <anna-maria@linutronix.de>,  <bjorn3_gh@protonmail.com>,
  <boqun.feng@gmail.com>,  <dakr@kernel.org>,  <frederic@kernel.org>,
  <gary@garyguo.net>,  <jstultz@google.com>,
  <linux-kernel@vger.kernel.org>,  <lossin@kernel.org>,
  <lyude@redhat.com>,  <rust-for-linux@vger.kernel.org>,
  <sboyd@kernel.org>,  <tglx@linutronix.de>,  <tmgross@umich.edu>
Subject: Re: [PATCH v2 1/5] rust: time: Rename Delta's methods from as_* to
 into_*
In-Reply-To: <20250609102418.3345792-2-fujita.tomonori@gmail.com> (FUJITA
	Tomonori's message of "Mon, 09 Jun 2025 19:24:14 +0900")
Message-ID: <87zfef27to.fsf@kernel.org>
References: <20250609102418.3345792-1-fujita.tomonori@gmail.com>
	<wW2ulKgZ93y6nAY0hWxPjtxmCytCkNDF68V0jk2_ZXEYyu5TELZWfbw9OTt-Ea94d_XpvQjBcixeskA2ZuhG-A==@protonmail.internalid>
	<20250609102418.3345792-2-fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 10 Jun 2025 13:24:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> Rename Delta's methods that take self from as_* to into_* to align
> with Rust naming conventions.
>
> Using `self` is more common Rust practice for small values that can be
> freely copied [1].
>
> Clippy warns against using as_* names for trait methods that take self
> as follows:
>
> warning: methods called as_* usually take self by reference or self by mutable reference
> --> ~/linux/rust/kernel/time/hrtimer.rs:421:17
> |
> 421 |     fn as_nanos(self) -> i64;
>
> Rename the `Delta` struct's methods from as_nanos(), as_micros_ceil(),
> and as_millis() to into_nanos(), into_micros_ceil(), and
> into_millis(), respectively to maintain consistency with the other
> function names.
>
> Link: https://lore.kernel.org/lkml/aD1fgizC4FPT07vt@google.com/ [1]
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



