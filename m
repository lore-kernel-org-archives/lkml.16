Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127A526B951;
	Tue,  8 Apr 2025 12:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114598; cv=none; b=N6jWRqGgxLzidQtvs0jbfFPju0qKt12Q9t/zt2+EHi+bF382fh7S58/TVnZELZYBzPinckF5Fio0nGjALQFLeaE9OByQcJVgW0JvikgNRU3GXWdW5x/GaMHp3wtw75tiqpt+OY1ZSCOgDEJ4v49JGaIMXF6+oLikkAXgL7fVgEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114598; c=relaxed/simple;
	bh=AEUJ6Wd7pOjKauMOFiCeSqvh9KCOER+sDjq82RyaCRc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nf8hyApNPF/6QI86uCHKITa568YmzLWLJdKvXE4Hnuj1EC+dcdb0v807UUpnMQSfY8eNQSsJZPAL+Xghjy3G1ABXdpJaig6UvTQ8LAfPwZ0r/TDUNUEBYa7qzerZcZXKv0r7ZzkHqq1qDYNW9tmxz1Bs42XAOD1LBqTYjR9aAQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RjVjKMtl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RjVjKMtl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86269C4AF09;
	Tue,  8 Apr 2025 12:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744114597;
	bh=AEUJ6Wd7pOjKauMOFiCeSqvh9KCOER+sDjq82RyaCRc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RjVjKMtlTA1GNuA6CCo/cd3mR5/s0vuo4ObQz1DRpqarOpULL1XgDG86AV25gdTxi
	 hjPkW+4Fl9Gfcja9mGGJZVUQH+ndtVDR4dGVYMYcGE2V1Tqg8Pe92913cpXHTj/FiC
	 d+vYPhJJY3Cx5E8TOu0EDB4s9hL02rLrmgWWzXF8hrAJ/juUNT01XXQ9q/Tszl+pXd
	 9Lfb3TFUvDPl5fYOsocOLiess0zAcKo5kUVWWMQZyJWTfFTdwI4Ci3PvCbic/jcHnX
	 H7b9Sc7n6x7727A6G5kNm+zndIbKNXRVxMPgS9A73MeNcZghyHlHRwqKAoRC5qJJlT
	 MqDVbUFHBFdEA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>
Cc: <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  "Boqun Feng" <boqun.feng@gmail.com>,  "Frederic Weisbecker"
 <frederic@kernel.org>,  "Thomas Gleixner" <tglx@linutronix.de>,
  "Anna-Maria Behnsen" <anna-maria@linutronix.de>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>
Subject: Re: [PATCH 4/6] rust: hrtimer: Add HrTimerClockBase::time()
In-Reply-To: <20250402214109.653341-5-lyude@redhat.com> (Lyude Paul's message
	of "Wed, 02 Apr 2025 17:40:32 -0400")
References: <20250402214109.653341-1-lyude@redhat.com>
	<xSUp_ccwbO6iB2teXXkhQM_lCfMGwvI6OLC9-N0yjSyOdcNrRMG2VSszh7eUg9fPKUMD3X7gp6LlVqwdq6G5xA==@protonmail.internalid>
	<20250402214109.653341-5-lyude@redhat.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 08 Apr 2025 14:00:09 +0200
Message-ID: <87ecy2j22e.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Lyude Paul" <lyude@redhat.com> writes:

> This adds a wrapper for the get_time() callback contained within a
> hrtimer_clock_base struct. We'll use this in the next commit in order to
> implement HrTimerCallbackContext::forward_now().
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/time/hrtimer.rs | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index f633550882247..521ff1a8a5aa8 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -186,6 +186,16 @@ unsafe fn from_raw<'a>(ptr: *mut bindings::hrtimer_clock_base) -> &'a Self {
>          // - Our data layout is equivalent to said struct via our type invariants.
>          unsafe { &*ptr.cast() }
>      }
> +
> +    /// Retrieve the current time from this [`HrTimerClockBase`].
> +    fn time(&self) -> Ktime {
> +        // SAFETY: This callback is initialized to a valid NonNull function for as long as this type
> +        // is exposed to users.

Why is that? Is it by C api contract?


Best regards,
Andreas Hindborg



