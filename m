Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF050204092
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 20:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738786101; cv=none; b=Z9fKMWZIKVEzQ8LrUbjQL7RmGTOuU8nSJhulxCJiMqF3qNIVNvMRSoSr75wfPhswZeFZITKQ51Wzm+kW6njx1kk99PBs8z+TL4cMtvt3Y9pdxUgLlXiLvxKdCaNtWeeoru3AZSUQFf/a6nw1gANuaOkB2aK56OwAMM76LLiCkAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738786101; c=relaxed/simple;
	bh=1+8osiND+poixajs+uGj5lEQpMJBkufcI1G19mRvd3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wuj6/xv6EhE0mpKpTMyJYL//FSgHQEjhAZ7TJ/85M+hUbFEBizyF5JmgCzuUWe7IYhd/Y1ELsPnQPbfaZCl0KICygEtAzKZfKg/Ta6kyKuPnzs1YLIGRCSJ5J6ZSoNEGZxOy/xvtKX+eD0D2DKteLPccJ0hIMm2bAqE9Dnid1KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jBQ6llRZ; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jBQ6llRZ"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5dcd33d9d9dso1868a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 12:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738786098; x=1739390898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+8osiND+poixajs+uGj5lEQpMJBkufcI1G19mRvd3U=;
        b=jBQ6llRZ02MZVPxYtOHzmc6eu3aHzUTef+rOegP6UxrPJtSbe51yyb4D7oO4P68ZLI
         O1H5li2ZtDaqHKJZjVVJH0smxXdzHS4ZmEa1wIuNiI2ryNgNvVDmMxwRnKbBIYI2S4LV
         6V1VJXb7TAh4QchnVUaQOjhu1i/Iiuf7SXfWyLPc+OnvA82OtwXv6SMLX0SM9iqYALsq
         jGj2sqyPhYvIRvxLPATyT+A6VgsiFjJ6IpVFwwL3SlvMkUJ7ZXslsYAvfqdIvS2eSfa3
         mGdwb4rvRTQYtFeJ1e/QKvdR6JhjPCu21BBUj8mA1JzV1MJjGqyND8ihLpFEx99DGSaG
         gJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738786098; x=1739390898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1+8osiND+poixajs+uGj5lEQpMJBkufcI1G19mRvd3U=;
        b=AP1rYkefR3q4DdK1o+GsPy9mM6pGKena13YvcOEdnHg0N8E4pbqyeg6kfmc6bQuU81
         1ZWXGqLyrhGuW5FUSYCrbm+2yJX4f5aO4fgXN3qs8kyZBp+iOJIw3pnXlKIUPjMfFqV9
         PpKsOf9rJPwCKL8xVzatTL4ghJK4ypmdYUBcTt3WZjdxzu+Eyz0GYcp6WurnzMl2sMkZ
         UttVjNiQ54XZvRkrAc49KXPJqweUSOI+cWONBBfUeoLIa+QoUQjb/nNqYDk7kTdMTG/5
         MA3Rd7M5SFnQMnLHzE8CFBbbncSDbNpNOS3uav0ktYig11hVrBClLmIqAX0gNFfzUI2S
         1vXw==
X-Forwarded-Encrypted: i=1; AJvYcCXqxlSfW4rsjK7yF7vZ4O4bUWW8Amea1azGJblzlWwbPq034phKgV8XFerBTdhY2FLMTSEYoEHdG7lPAZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YztW4Vt53WddOfszxIomnVRbdEtbs631z8vRiiiVqxPs2IrSI+F
	AgrCvXzPwuVHzOp+Sq9ILYIHGZ5A6OBv92U4eVevFtRzOpT2a1oqbAq1vtUquY2wjS78Fzh5rpg
	QzvtRBvb88OAtA6dt8ZWpmk4Nom9mpHyTHWrD
X-Gm-Gg: ASbGncu53IHQJlXVwX5SUlyGsCzGlGIgaR2NmWe6GlT/UiiCF+edzoErlwOZOPJ2/lV
	yo6EWNcxUkXauFS1pSKKqypV+D5CMAyL2RD+DEmfqMmLzeLZDOEeuHic+Mhz5s8Bpo0MtUwNOzf
	snfFExVLbiUwQX+acfWT02Fv9qEOE=
X-Google-Smtp-Source: AGHT+IGx316vv85yz2/nvJFRxkFiWThWunwKRnKhnVM6RkZhlGbx8MIHHEJ25sjRD9Jdsb9vJmcFpLr/AhWfE2Ty9Tc=
X-Received: by 2002:a05:6402:f90:b0:5d0:d935:457b with SMTP id
 4fb4d7f45d1cf-5dced624585mr15835a12.0.1738786096220; Wed, 05 Feb 2025
 12:08:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122-gendwarfksyms-kasan-rust-v1-1-5ee5658f4fb6@google.com> <CANiq72nr9vTgUF9u0uyypzprQrEpGv4qbOUJS_QgYbMZhTTrRQ@mail.gmail.com>
In-Reply-To: <CANiq72nr9vTgUF9u0uyypzprQrEpGv4qbOUJS_QgYbMZhTTrRQ@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 5 Feb 2025 12:08:04 -0800
X-Gm-Features: AWEUYZl61QhSjJhgUceZS-V8R2uiiR6L4GKn0W5Urdj0QBNHHGznj3vzrZ4SpcY
Message-ID: <CAGSQo02HFMn0b=d6LVFr35Bc06F0AY8XmPFtqWi4b17cQSF0+g@mail.gmail.com>
Subject: Re: [PATCH] rust: Do not export generated KASAN ODR symbols
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 1:12=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Jan 22, 2025 at 1:14=E2=80=AFAM Matthew Maurer <mmaurer@google.co=
m> wrote:
> >
> > ASAN generates sppecial synthetic symbols to help check for ODR
> > violations. These synthetic symbols lack debug information, so
> > gendwarfksyms emits warnings when processing them. No code should ever
> > have a dependency on these symbols, so we should not be exporting them,
> > just like the __cfi symbols.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
>
> Sounds good -- are those generated unconditionally by ASAN to check
> for C++ ODR violations and so we get them anyway or do we benefit
> somehow?
>
> I also wondered about whether we should search for an extra underscore
> (`__odr_asan_`), but I also see mentions of `__odr_asan.`, which I
> guess that is the reason you used that prefix. Is that right?

In case you were waiting for an answer on that, it's because I was
trying to be as loose as possible, since `__odr_asan` isn't going to
end up on random symbols we *intended* to export from the kernel.
We could technically restrict it to `__odr_asan_gen_` to be more
precise and it should still work.

>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
>
> Thanks!
>
> Cheers,
> Miguel
