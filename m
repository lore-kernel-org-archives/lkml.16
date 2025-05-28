Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CAE28E5E2;
	Wed, 28 May 2025 18:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748456709; cv=none; b=mGG+5ZHk4i8A19EWQP8UUhlARuB3LI5gG3iupXck91cV47uV8CPfxw4GR9mLrSiSAJ3/5I6Wc6hU64VcCiRq+USkeoEMLBy25L3q8816oNEZSMydLu5AC2T+Ib3lUGiTytp2IKeQgZS4YG+06deBPzpvXRDsEGAGbjHPFYVpJrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748456709; c=relaxed/simple;
	bh=uyZuRX4Nw7zrA3erUec/G18l0Gbl/4E+/efJ+fXP/Os=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BGNwLUw7T+2dvm3Y6VqdF4MJHcTvlD+sQ8Hl0zdlL9R+YylgmcNuUBk8ebVl6DsZNmWyKdlCzv3+z2HfosYR1mRpanQY5IYbvuT2u8T0E3M7jwE+gpiDic6TfkzhR082bJStRmpiNNbMdbpHM30E5LPD3jycLshXf88dWGe3Tz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W0FQyEv/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W0FQyEv/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE678C4CEE3;
	Wed, 28 May 2025 18:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748456708;
	bh=uyZuRX4Nw7zrA3erUec/G18l0Gbl/4E+/efJ+fXP/Os=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=W0FQyEv/QioiuwoXwBKXsKDlVluV9IVTUhLest3VzzvccYmh5FG0+vlM4kH/YaQv8
	 Gfo3A0Pazh0yR6NnJvrrMfuxXf8i8FuzMBFqASaOuU3D/VZ47b+4HtxIzmPvQYyG2M
	 ZzikGfb1lXIJ++r53dmE4OlkmFSNZr7FONgbSLSwgJt/V8eimYx1u6V5SKNEsvt83O
	 S6Kf8mRaD6yjEgaqZ4pClowcAFOdqt2SY/eiLwDcXhCI+1ezcZghoj6GOXuTqCcZ7M
	 N5Xo66QWz4K5GzMaQdVKUB2eVK1jdqj1VV0iuXS7rYdlEDPiX2vz5MoiEWlYKoeg1B
	 EKQ39xNYlM5uw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org,  Arnd Bergmann <arnd@arndb.de>,  Boqun
 Feng <boqun.feng@gmail.com>,  linux-kernel@vger.kernel.org,
  a.hindborg@samsung.com,  frederic@kernel.org,  lyude@redhat.com,
  tglx@linutronix.de,  anna-maria@linutronix.de,  jstultz@google.com,
  sboyd@kernel.org,  ojeda@kernel.org,  alex.gaynor@gmail.com,
  gary@garyguo.net,  bjorn3_gh@protonmail.com,  benno.lossin@proton.me,
  aliceryhl@google.com,  tmgross@umich.edu,  chrisi.schrefl@gmail.com,
  linux@armlinux.org.uk
Subject: Re: [PATCH v2] rust: time: Avoid 64-bit integer division on 32-bit
 architectures
In-Reply-To: <20250502004524.230553-1-fujita.tomonori@gmail.com> (FUJITA
	Tomonori's message of "Fri, 2 May 2025 09:45:24 +0900")
References: <20250502004524.230553-1-fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 28 May 2025 20:24:50 +0200
Message-ID: <87seko1tl9.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

FUJITA Tomonori <fujita.tomonori@gmail.com> writes:

> Avoid 64-bit integer division that 32-bit architectures don't
> implement generally. This uses ktime_to_us() and ktime_to_ms()
> instead.
>
> The time abstraction needs i64 / u32 division so C's div_s64() can be
> used but ktime_to_us() and ktime_to_ms() provide a simpler solution
> for this time abstraction problem on 32-bit architectures.
>
> 32-bit ARM is the only 32-bit architecture currently supported by
> Rust. Using the cfg attribute, only 32-bit architectures will call
> ktime_to_us() and ktime_to_ms(), while the other 64-bit architectures
> will continue to use the current code as-is to avoid the overhead.
>
> One downside of calling the C's functions is that the as_micros/millis
> methods can no longer be const fn. We stick with the simpler approach
> unless there's a compelling need for a const fn.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Looks good to me.


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


