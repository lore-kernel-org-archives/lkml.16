Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A943F26FA4C;
	Wed, 23 Apr 2025 08:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745397396; cv=none; b=Hz3MxzgNeficRSB1e7RKspeEvvtZtt8bAI+jc8tGu2iUc9l+Ptn6MxG0KGLgrPoWOvlm/b5LPwCkvIfdSZnEQvO1bQGKp1VriFPP9rWAHVoxdLtr1UxivZSmZhjeOCsk9aJKe86BOaEuQCIBtJzzYGUjXW0gP1tHB8NAXHiCXMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745397396; c=relaxed/simple;
	bh=8NyeEl5sGV5OeARNT+FJtFkxcpDYsjMyBUmmpLZFRO8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=p6BbJg3ND4gtL97iZaya5+QO5WOeHRqxTViBqkHzi7raB6wegmDt/vQKuvMQLRn5BE2/ziEbDEt7rrU1wpUn9NinUvGawTWrO+Sl0e0E3NaC+Ki+5ZwOHfM0FSSQWXo3dw6sgyfRGkcVo6llrpaALct1MX+y9EbPoDhDuo9Z2pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dtt5CYBt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dtt5CYBt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC1EFC4CEE2;
	Wed, 23 Apr 2025 08:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745397396;
	bh=8NyeEl5sGV5OeARNT+FJtFkxcpDYsjMyBUmmpLZFRO8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Dtt5CYBteqwwFc8n/QuUf9IsXI6dx68XhigRzYmiOYv1r5rDkCQh0OucM2MmgUiVn
	 u58Z30vwSinXZnDU2OMP/WxTbHjLYzpCjT6+lsA1Vqo515vTMkBJr2VMv1p8rh5skN
	 MHCKL1rzR9pOkwh/ePaC+g9/Jjd9C1ADC/YLjTGHDilBEVjDFDRWoECqnnOpxcL2jg
	 qrG6q9pPa6c6fb12wb7e0LptKx8ON25gay8l+iMRNHzUnykv7RGrFdVzcOKM3Yq/Z6
	 1f7m/y4vpZBZC+jgQa2NWFHQsxZRKid4uFUduye8ELSR7tqZUsVbkrAtOW+c0Sbox1
	 lnhlz0svhPvzQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org,  linux-kernel@vger.kernel.org,  Boqun
 Feng <boqun.feng@gmail.com>,  FUJITA Tomonori <fujita.tomonori@gmail.com>,
  Frederic Weisbecker <frederic@kernel.org>,  Thomas Gleixner
 <tglx@linutronix.de>,  Anna-Maria Behnsen <anna-maria@linutronix.de>,
  John Stultz <jstultz@google.com>,  Stephen Boyd <sboyd@kernel.org>,
  Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,
  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
  Benno Lossin <benno.lossin@proton.me>,  Alice Ryhl
 <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,  Danilo
 Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 1/8] rust: hrtimer: Document the return value for
 HrTimerHandle::cancel()
In-Reply-To: <20250415195020.413478-2-lyude@redhat.com> (Lyude Paul's message
	of "Tue, 15 Apr 2025 15:48:22 -0400")
References: <20250415195020.413478-1-lyude@redhat.com>
	<20250415195020.413478-2-lyude@redhat.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 23 Apr 2025 10:36:14 +0200
Message-ID: <87r01jmg01.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Lyude Paul <lyude@redhat.com> writes:

> Just a drive-by fix I noticed: we don't actually document what the return
> value from cancel() does, so do that.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/time/hrtimer.rs | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index 27243eaaf8ed7..bfe0e25f5abd0 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -304,6 +304,8 @@ pub unsafe trait HrTimerHandle {
>      /// Note that the timer might be started by a concurrent start operation. If
>      /// so, the timer might not be in the **stopped** state when this function
>      /// returns.
> +    ///
> +    /// Returns whether or not the timer was running.

How about:

  Returns true if the timer was running.

?


Best regards,
Andreas Hindborg


