Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189A8BA4A;
	Sun, 15 Jun 2025 09:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749980096; cv=none; b=jjINTXgIsMUwyd7jU5lNvjEwp25H9hkBTOdm1EB4rS/MQaZCUacoqujd1bMaDjxdzjGJrSuy2eCnFPk/Y9DQxbUDTZCwHA1one2vULqiAgrTZzlNpCtP74UBvibYeJetJX8JepPIdh6GwyYosC9Jz+B6t78unD4bfEzwfZSrjKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749980096; c=relaxed/simple;
	bh=y9MDb4/fZlWl7GgWKvw+St9l8HOAuIQQIpXO/7a536M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U/OgrFPArlTFFZm8Ri8xnNDm00TqMamDVkTR7dR9nimbMfaAUWmmrbjGxw1WhprmUNQyEMHHGh/0BoL40R9U4IGXzJjHPWr6oKwxb1Vw8qJD2I3lG066t7KbceWrVbLlY0gQ4DUPSDnds6iJ8P5duO7T2eZUcmN3JUOvMRMLekY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAKVC08C; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAKVC08C"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-313862d48e7so668374a91.1;
        Sun, 15 Jun 2025 02:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749980092; x=1750584892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNs6VvUML7GUTVqwajoJRnr40mNrl5rIh7sudQM3gmE=;
        b=kAKVC08CEWbvzFw4PblG1/zikAfXTtoP4t3W3Lj0K64LmuJvEziaVRwoB6zhoLDvFH
         77QklxA1MDUQtFr1KiwK/1XVYxU1iz8Q+h3P91ONsji7eSupLIlzG79bP2GX8vaycmUp
         v352M3LFNK4Xd6fbk6B8aHCqLM4PhrW8uw86dQilPwMJVk704x2GZK6Q38xTPCELVaxb
         zoLiFNHrYQUdkfDDaLPpe7Kl3A8VjOrUs0vTjn4OA1SK42hdpGUN9AChh2WzlmzCnaQ4
         UjrBgTd3Uze/ycXm8PrhbQvumZJavhNe+hgBSd5PYAlT/E12mJsZBNi9nvTddEWz1M+G
         uETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749980092; x=1750584892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNs6VvUML7GUTVqwajoJRnr40mNrl5rIh7sudQM3gmE=;
        b=Vt9HxO4QEn5+veEkOdr3rG7YXCLOcvfSO90j8NtE2zNojn0XwZgYjOHervs1ODaMm8
         W1aq0bsV08j/5f8QB3oGFvOrHJqdx+GUQmiJABczOYt6qcQf/Sl5Srdp8JYmeGPq5MR7
         F0JLYUSvu8tTkWJogmyi6Df52TmzvexJgVjiRSFXbvy4KkXzFJDIEtKEUFXPmyRqsFMn
         k+hTBiQIVH0xxOa3lbVChEqGhOz28c8zf7kpLX/+F15AOYbHx+g7dPVvZNjQCDEAiIgW
         5j5aYim3Cr1Pw8Xm2YIF2TOT3iwgh7bIsaGMhO18RpTO8CNqyxtYCmJxdvx447iXg8Pl
         NNxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8dRPMmilZ2+OJUIkZZASwJrym3R0JPExQyTs5Q/t/KGVSVzOmrEM1g2V38exVe8kkpi9LjtE/mL0gldSedzE=@vger.kernel.org, AJvYcCVOlreCsodh88PtMoH3yxyRMSx0yxpX6eR443raFjYjdKg8Z8vtT/Rh+brRnBBgGNNdTavxASahk7n3EZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZOYIKmb/iJCYQq5ZtAWn4qqnPKpTIGjFSD0YCGihtE4weGssn
	/uPZ5EwBBcU0X8FaPIgh5/lWgqXmav4QbiVsCac3h8bwjAUFn88/4A0n2tTqF9RDd5CHvhk4pjc
	rmF2CRZ3pQprmVxGp83UsPihziaS7kAI=
X-Gm-Gg: ASbGncs67JOSNDhjqAhaxeeC6hhsJ/c6zikfEYhJ84CTfji2Ku+5YMngKbIPhhrbLsi
	2zw1BLygMtVBKmsTlaTY2hPC60ac8IcGsLhOPzwKr9miAuf9tmFWWVHXPnrBr1nl089S+Ko/wUS
	cFJm5w5t7jt+aSs2Icyux95lLNLNAIibcLbUjkrzzAlEA=
X-Google-Smtp-Source: AGHT+IHzMRBP5kIxotiPDI08pCiSOwJQuBHD8G/qzRVSBExGnp+FMv9eAkKZ2qwBATQ/BVJQSMJECJZpAnDXTLwaEHs=
X-Received: by 2002:a17:90b:5546:b0:311:c939:c855 with SMTP id
 98e67ed59e1d1-313f1db7c87mr3258246a91.3.1749980092125; Sun, 15 Jun 2025
 02:34:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250615072042.133290-1-christiansantoslima21@gmail.com>
In-Reply-To: <20250615072042.133290-1-christiansantoslima21@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Jun 2025 11:34:39 +0200
X-Gm-Features: AX0GCFtu4OY83idM--qYAmts1mcZshed3J1Vyix5ZVLbClCircT9dOHQrI_e9N4
Message-ID: <CANiq72mnxRquFmjoJemb=3LSq+ZdUfs9J+HXTwM6AavprsVNUg@mail.gmail.com>
Subject: Re: [PATCH v7] rust: transmute: Add methods for FromBytes trait
To: Every2 <christiansantoslima21@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ~lkcamp/patches@lists.sr.ht, 
	richard120310@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 15, 2025 at 9:20=E2=80=AFAM Every2 <christiansantoslima21@gmail=
.com> wrote:
>
> Methods receive a slice and perform size check to add a valid way to make
> conversion safe. An Option is used, in error case just return `None`.

Please start with something like "Add methods ... and ... They are
useful to ...", i.e. the idea is to try to explain the "what" and the
"why" (what is being added, and why is it being added).

> Signed-off-by: Every2 <christiansantoslima21@gmail.com>

The previous version used your name in the SoB -- is this expected?

> +/// # Example

Please use the plural: # Examples

(and empty line between it and the ```).

> +/// match result {
> +///     Some(x) =3D> assert_eq!(*x, 0x4030201),
> +///     None =3D> unreachable!()
> +/// }

If we are going to use something like `unreachable!()`, then I would
just unwrap.

But recently we are trying to make examples look more like normal
kernel code, so please use `?` instead.

> +                    && (bytes.as_ptr() as usize) % core::mem::align_of::=
<$t>() =3D=3D 0

Can we do the cast earlier and then use `.is_aligned()` instead?

Also, since this is inside a macro, we should try to avoid assuming
anything about the caller's code, so please use `::core` instead of
`core`.

> -    // SAFETY: If all bit patterns are acceptable for individual values =
in an array, then all bit
> -    // patterns are also acceptable for arrays of that type.
> -    {<T: FromBytes>} [T],
>      {<T: FromBytes, const N: usize>} [T; N],

Don't we still want this safety comment for the array case?

Also, this is still missing safety comments on top of a couple
`unsafe` blocks (pointed out in an earlier version). Are you building
with `make ..... CLIPPY=3D1`?

Thanks!

Cheers,
Miguel
