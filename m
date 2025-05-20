Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E5824C692
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 19:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770220; cv=none; b=MfFr6NyS3dxdkd4A4uSZJUH3xOrSaU+AlsbeWhzX57tr/amaBsVSZ1zLDrbpJYeWHFZsPbTR4s3oBAMsR1akWUAi7js2UKT0S3ZxgyVYpULI4QTeHtHm0+HDK6YaN7haB5MMyL8EgybSyJ5Ut8mDk8ZvLJfOSHYRgQ6MlZd058g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770220; c=relaxed/simple;
	bh=7iMP3VzOA6iwjrwMuGY+lRy6An1jzocIfGU1h7/Ibj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JmzkOB7qGV7LFfvIaSIuZYOY3O3bD4iCiwW28N/DxXzizcWNrHJefpTyZijSlNHleeYH0LOt2sWClWBIoklD6KEZv3TK2oL5r3H284JZZarObolRFMXpgzDznva0pCBPTlfAoG9HbN0NNL9AkLzV8amb5yo2luKvifsHAlr+T+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=myc/QjjK; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="myc/QjjK"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso26063a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747770217; x=1748375017; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVuh6S3J1F9TaWrAVLril0Q/q54OEZ/trnQNfVZ1jAY=;
        b=myc/QjjKPiVbzbJi+G0r12g+wecVjA+RRokdhOJ4Me3p6toFfP+v9qZbNudpaUufzK
         oizrnKy3Exm+0ZxqRt9tZihRG3QeJ2YxyOO8lqKwMQqc/XYEIWbhVPcHtlMHXXE57zj9
         oSc3sm7nGb6y5TYUyD7EtLxFQ5B7GYkvCCv/BA8sDgCDedTdKy0bBYZpRmd0pFcu83fg
         2fOmxP+QiZA6/UpSUSHKqmjoHZ6IDrpScISBLQ0uaCRx7+mEnrPd+j9R96I+TxLlG1y/
         ing7GUV7tFFKZ7SxpMChRtls48HBi1w/5bUGocL4EWyY64Wgv1vhXWhni/5zIBaNv6/C
         6TNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770217; x=1748375017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVuh6S3J1F9TaWrAVLril0Q/q54OEZ/trnQNfVZ1jAY=;
        b=iSJqMveAmKXh+0YnfKmpyJq9hOuei/dF7Om0HG3t57qum6mWPUFWCl2bsoN2TU6tIq
         cdaRZ4aouzn7BARlke9J82QfmevDhpXRNI4ysKWL7wJtklebmRE4Fimv/rjZfzRuaZt5
         Dmnxpv98HbUYGDy7znLiBYpY3YJ0IJyBwEIjrwCvYixdOJL22POcztQgQfGYYIWjTk5T
         TX+2aTapymuel2wfoJnLMw5ptDHnBU9TRDS/RPlgw9d4JE5mUciQpLtVu5ur706u38DH
         AF794Uq//jHF64dUpWMAqOWtBdWg68qqGiFIbLA2XKK+ALP71lQJWpgRI78Z0FXmXc6h
         q2NQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6w01H5HAiytbnmL9UndihVpZgIupF0fuo3uartUllHQDTG36Tk3YRrPIHJi+zXD/6geqgBzzNh6hh23Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB9e2D6ewyvUrqa+iyEuTXgSUeJvhdl/0eiTOk48+MF3xB2CeH
	Noos3pSbcKB9PYreMK+rSdU/cDK6aHl6SLxIeORLQs5e2tB1xjLYqHMC/Zay3mnao/tvioczoLX
	/VHVho2Gey95RgLPLDgkO7iaYOyNWHJJjzv3+LaDc
X-Gm-Gg: ASbGnctRkt1yMSwJYnfdPGFqTshPr/1yuuVUbO87yY3lzEly508EqA+ul7c9aiGDbwb
	v5rhD2u15jVUPaNHcHR5/hcExLDobUpmCQnAMKqFrPpW2Ful9hBZjr7liVV6Aqj6N475uRFO30M
	SgLGzq4CtOcxHemjqfqu1tmk6+lg65ck706G3nBzB5jc0imHKIZMzajMmGJOKCqeYln7COXx1Xw
	L/1ZlIjKw==
X-Google-Smtp-Source: AGHT+IHJvX9YjDx2d3c583rLSRmMUshXchB5sWSCQCJw3GuXnKAXqOqVSJqf4TKJyzYdOkmw2CS439Nybj4XBPXOmMI=
X-Received: by 2002:a05:6402:368:b0:5fc:e6a6:6a34 with SMTP id
 4fb4d7f45d1cf-6019c7917b7mr327364a12.6.1747770216674; Tue, 20 May 2025
 12:43:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519161712.2609395-1-bqe@google.com> <20250519161712.2609395-6-bqe@google.com>
In-Reply-To: <20250519161712.2609395-6-bqe@google.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 20 May 2025 21:43:00 +0200
X-Gm-Features: AX0GCFud_K6kp4jeZEy1YtPgHu6MpFW_3N3hcU-WCHo0eBEV6HSTF1SnPHjVTps
Message-ID: <CAG48ez1vpyAARm-fk1GBfm-Dq-+W1CpCtYiGJm9ZQFq-pDKoQA@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] rust: add dynamic ID pool abstraction for bitmap
To: Burak Emir <bqe@google.com>
Cc: Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 6:20=E2=80=AFPM Burak Emir <bqe@google.com> wrote:
> +/// fn get_id_maybe_alloc(guarded_pool: &SpinLock<IdPool>) -> Result<usi=
ze, AllocError> {
> +///   let mut pool =3D guarded_pool.lock();
> +///   loop {
> +///     match pool.acquire_next_id(0) {
> +///       Some(index) =3D> return Ok(index),
> +///       None =3D> {
> +///         let alloc_request =3D pool.grow_alloc();
> +///         drop(pool);
> +///         let resizer =3D alloc_request.alloc(GFP_KERNEL)?;
> +///         pool =3D guarded_pool.lock();
> +///         pool.grow(resizer)
> +///       }
> +///     }
> +///   }
> +/// }
> +/// ```

Hmm, I think I just understood a bit better than before what's
actually going on in the C binder code... the reason why you have this
complicated API for reallocation here in Rust is that you want the
guarded_pool to not have its own lock, but a lock provided by the
caller? And so pool functions are unable to take/drop the lock that
protects the pool?

This is just me idly wondering, and I know I tend to come up with
overcomplicated approaches and I'm bad at Rust - please just ignore
this message if you think it's not a good idea.

I wonder if there is a way in Rust to address this kind of situation
that looks nicer. Maybe you could have a function as part of the
IdPool implementation that operates on an IdPool, but instead of an
IdPool as parameter, the parameter is something like a function that
can be called to obtain a guard that gives you a mutable reference?
Could you maybe have some lock trait whose implementations store a
pointer to something like a SpinLock, with a "lock()" method that
first locks the SpinLock (creating a Guard), then looks up a specific
member of the data contained inside the SpinLock, and returns a
mutable pointer to that? Basically a subset view of the SpinLock. Then
the IdPool implementation would be able to internally do this pattern
of alternating lock/unlock. Though this way you'd still have to not
hold the lock when calling into this.

It might be an even better fit for a 1:1 translation of the C code if
you could then combine this with some kind of SpinLockUnlockGuard that
mutably borrows a SpinLockGuard; releases the underlying lock when it
is created; and reacquires the lock when it is dropped... but that's
maybe taking things too far.
