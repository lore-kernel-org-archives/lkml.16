Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D6421C17E;
	Wed,  5 Feb 2025 23:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738797414; cv=none; b=Fpd0QknDyyE+XBYgyzR3iay0OsGUkjf0zLlw8bQRhT8Ww8kriZY1n/JyH+4WD/5dl+EyiVvuKQfP/IWVl5omaO2WCcBQ3NkQsnN/w4yNEuDOFbGAR+f8sj16rsAvpLuYwS6zBbYulKuuena4C9hL51mjPuygegIKnC+ppBLTaD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738797414; c=relaxed/simple;
	bh=8aEVXKUAiX3jl+3diE6Q0vk3pLPdXXP6PT+//H2Bps0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZscP2K8IdtSiY+jkFFNbF2DusGkP2UsIzx3H/fNX17U2jN5w5XpWMXMTpNYWoCaeYu3AVSYxWslQcuvKxMOjxE3vbsnX7FqZnaMlKEs6XmbAoh+kd/HwspKWQUT9Xqaw1CjhXVTJrmQAw7VbiviYFbFaMPKW5zQiv5jwNBw80I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dcb8kTMn; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dcb8kTMn"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f7d35de32dso54678a91.3;
        Wed, 05 Feb 2025 15:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738797412; x=1739402212; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rHjeh69SCDv8DGOvORSauZlHYEzWBvt+ziip+sBEbg=;
        b=Dcb8kTMnoR7eKP2UXiOFIjWdPexSsDIXvBppG+OOCMo7f0vRFw5cNJLKND6kPGBCDU
         HTQAdmIWH/B8IdUXjhLs17Lf6jobaSzRNZTHPM4+hQZQrvN1Dq/io94AGSLuhyZ+cyvb
         ipFbILuGXIuG4zjnEP9l3m6SAQ1tpvTEn7ymRsbcl2oZ9QOukTMDaunvRgUr3kU7/K9S
         Cb8AacLMUWa4GLs+rM7v1x0ZPmCw4Q679rqwFOHEULoQ6CPe5ZXYpUZM/xZgnhyx8TcL
         YgH+bj5eFwnGkKBdyZwTRhkw1ynVjOWuGzTkoNAF+Q1YmeAfNTd6WdakC/IZQk0jbwK1
         Uvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738797412; x=1739402212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rHjeh69SCDv8DGOvORSauZlHYEzWBvt+ziip+sBEbg=;
        b=gEKpAxXNf7piab0VlbBT5klcyCbrZ6NP70bfMSrbNPN2wXOm+RcWqwM1EdiwTPwsBH
         Ep+OZi2Dc2enldB8CsV/lxt7NrVwkLd5Bmrc67P7Bg60cJwbvXXpgIUnLWHzgjWlYYF8
         CiY5aZXQ3Z8xsJTFt4wkIY/vGsEBeP/e5Z7sujqGJ0eJrRHJsGk/RJOKW5yCLPzmS8QY
         R/KRHz0+PSDikAnfzfydJQCri/TVV9R7dqSYwX5mLXqzkAY61kDtu8ZDjD/9zVfwI1yW
         F+CsAZYFBBm6Uq3GKk9Z1bY0vWELSAoNCnUpK+87SUISQYwIG+Z59rPWUPSTXzEIkW1s
         nPpw==
X-Forwarded-Encrypted: i=1; AJvYcCUQI9HySv7T5Op4qa8Vanwqv0/D9eOwXemcc7KPsenNp5XyNKvaneGINJAQ4MpZ9wY4/75InHMJUB8Qj82BVFc=@vger.kernel.org, AJvYcCWz20FfRuo91jt7XIVnZE4ujAZZg9xe+nRc6obPfC10slIkdvbWp7mUyvryBzH0wqjuN0vwfUVQBvP3yyo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz82yi00adJAl/Cb2hC1dpAMLMbPqNoonEHnUcB0SgeCch9pH7+
	45wkAxk+4tzp/d+vpi7OE9o5O/shkBetXqqNkwoQwggVnK7r0Bgoxq4+1rAEAifNpujArCq3fm8
	ldJHbIOzHIaL3VfXMfq9GNp6fwsc=
X-Gm-Gg: ASbGnct2PDM0/O42EYa7JVEFp4/YEqzddHAQG9KRaHY3FtKnHr2imS06GoDVzuujFMU
	sZSD2/V+ogYe7IBgFBgQq4N4vYrsE++TOubOrjnCSAx5N77rKwInExK8K2IeyiMznifn8JifO
X-Google-Smtp-Source: AGHT+IGZoNZSpEbGizDvWVQqh2XixWLkNh3RqvbaonWI9OERbfVObNviSaPkChrUY9WhqbQKZZAZBpwhNYPXAsOuMEs=
X-Received: by 2002:a17:90b:3a88:b0:2ef:93:154e with SMTP id
 98e67ed59e1d1-2f9e08349d7mr2914333a91.5.1738797412290; Wed, 05 Feb 2025
 15:16:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121200934.222075-1-ojeda@kernel.org>
In-Reply-To: <20250121200934.222075-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Feb 2025 00:16:40 +0100
X-Gm-Features: AWEUYZk0hKQpZ6bO4ChD_-_7c2CWiyRib0WSoFJb76HCurgVXjbYBh--z0xP-So
Message-ID: <CANiq72kJu9Gxqg5MHUPW-RQaMj7Rz=3HAT1Kbc_d=aQx3QOSqw@mail.gmail.com>
Subject: Re: [PATCH] rust: init: use explicit ABI to clean warning in future compilers
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 9:10=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Starting with Rust 1.86.0 (currently in nightly, to be released on
> 2025-04-03), the `missing_abi` lint is warn-by-default [1]:
>
>     error: extern declarations without an explicit ABI are deprecated
>         --> rust/doctests_kernel_generated.rs:3158:1
>          |
>     3158 | extern {
>          | ^^^^^^ help: explicitly specify the C ABI: `extern "C"`
>          |
>          =3D note: `-D missing-abi` implied by `-D warnings`
>          =3D help: to override `-D warnings` add `#[allow(missing_abi)]`
>
> Thus clean it up.
>
> Link: https://github.com/rust-lang/rust/pull/132397 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

[ Added 6.13.y to Cc: stable tag. - Miguel ]

Cheers,
Miguel
