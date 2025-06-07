Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8AC3BBF2;
	Sat,  7 Jun 2025 17:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749317423; cv=none; b=NcaI5fSwZ7HQDPotubqo1N4ssfTaIOe+hVzIh6XFODkFVTxR1Rj8EX5xuxnMU0zwNLzLxpYFF40s7GAEy6ZLzMNvegnNXOSXvrXfJqMfeTKwpH9K6lIXa9W3YroW57xQAeA1zrsl/41NouRRHdh9sYIN0FfAkUviL/L405946Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749317423; c=relaxed/simple;
	bh=5QdmPWlZNgjhTezfrcYSpb88MvFDjq9ek7pK6GBAKv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dX8w+AaJneDLoV2kqofO8YuiT33uZXxbSfgySAnjAu9Z/DtB+aqh6VnHK1xlzDJyWc+Y3ttFZh/l6kVf+6O0UJyMZTm6k/bdum/UGpeaBLR2mBBAVfyIhgyro7/NjReyxLN7Ms/j08tjm/1EsmGwK16Mlf2UHCQsU5xHzv8Ey7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Td/0dTtF; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Td/0dTtF"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-31306794b30so478666a91.2;
        Sat, 07 Jun 2025 10:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749317421; x=1749922221; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5QdmPWlZNgjhTezfrcYSpb88MvFDjq9ek7pK6GBAKv8=;
        b=Td/0dTtFNUGuhzaGqf226YElQT4uj3XmEi2tgPEsSGeP+Lzk3CIg5PzmSorDIrWy+N
         neyuSxrWvTWLbVSYGYTfyGdBXXVhSPCS/g2goRac7ZFlSsqN7b9WD/w+M42dH6JMDNeW
         2Qvt2NSlZ+z+ik+0witK2uryPptlstUk4HwFD6CHCdP1Jcx6qEHdJPXpTDAf30MgYb/b
         QbS/TxDrp7JC0cPJfPO8VdZbUXQSlQxyyeRHyyUCStdf/C3bxr1GafZ+erkNuBu9nO/c
         Q6nHO+v1AIZzCfzdoUO8Xpdrkcw5FDOU5K1l6xz7dm9buLHXeFhbimc1CKpRGas/hrX+
         zeZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749317421; x=1749922221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5QdmPWlZNgjhTezfrcYSpb88MvFDjq9ek7pK6GBAKv8=;
        b=kY9dBnIkdwsOCdjTiIgQezogZGUN1T1taqSszOeZXxM6VvTfSob8bmMlKqAYBvzoI+
         3saFK8OUG3Jfs6AmmT/xnsn5+m1OT1mnc9MZOWs0MkMpBCukAJOXwCHjXvyOmuLB0FVW
         5+3v+86SeMk/DB5NI2YLS/ho3cBrXpNw7HlmrkzKl+glqnyC1xaWRGq73dnBEaaRVC1H
         QIeQW33U1a+vemvb1bBUEfH1hDhTbnY6YaazQLIFnrvpxAyJ+5Kv1Xje+G+4qLPsc8E5
         lTNbPNwQ8WuSCoon3c6UH+u998Xu5HFUl03G4pEDmilSeiuXcduD0Cfn0HrF34539S0I
         rTOw==
X-Forwarded-Encrypted: i=1; AJvYcCWfqHTpG74bbChQEfEBdwHAgUtaWjSiCLgGBl4qoLHimhmqgYTYb/PrDsRYunAtJvKVTvK0Z+jpAC+qnacbVE4=@vger.kernel.org, AJvYcCWxlu4NWzMn5KYAPthfMK1fD9cKp6KG6XhBGo52czQoJWfNdT3OTZ/4//1CpdotTUfB0HaFeGaHEQCt+Bs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPWMSx4emD74T/AEenrOj9uma5C3EWz+0NGka9d7Z3AfVEJEqF
	e/Gv12oLwQwNbXu2x88K1o6yWJ+odRhLqqRsy+iVzq9kFZE4/GQiw9Ictpu+C/5wbWfOATRdBad
	Eetn97RL8ASOrwiVeGHJsfcALzMWTKXY/Yt+UQM8=
X-Gm-Gg: ASbGncslN9GwkjyKSjkt32hRbf3y/7FP9KAaGzbkhydFq8w9IduzSfywBSoDDZUNqxx
	u/3p0xDmqYlE2tZEKzbiynjJpd3sIib1p3Sy/bp0q3mdyebjZBkfAkW5eOlhNEmxZu8z3n49BLQ
	jDii3n+5unMUMks0bUVlNbFaX7/8EiY5+R
X-Google-Smtp-Source: AGHT+IGW/LDxuSB/3nYGAdGDq6RIhvnQtQyrgCDYzBZ3yFxjOFtw3GS9BRdis5xtEJqwV/BCpkwpkndBZ37C1zCl4Bs=
X-Received: by 2002:a17:90b:2247:b0:30a:80bc:ad4 with SMTP id
 98e67ed59e1d1-31346af79bdmr4449901a91.0.1749317421422; Sat, 07 Jun 2025
 10:30:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250607-assert_sync-v1-1-b18261da83e2@gmail.com>
 <DAGEZCRR61A0.30H1MJQXW4CV5@kernel.org> <2531463d-fa6e-430c-a3a6-b179654cfbbe@gmail.com>
In-Reply-To: <2531463d-fa6e-430c-a3a6-b179654cfbbe@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 7 Jun 2025 19:30:08 +0200
X-Gm-Features: AX0GCFu-3IHC_l70zzTiuV93NAq4M5Z6SVWOXfPDAAJLHI2u-sfAg81oIIt8AVc
Message-ID: <CANiq72mv3RAT0rxApNV=xftTjMBKikRMrdFnPfUuiCBN=YRhkA@mail.gmail.com>
Subject: Re: [PATCH] rust: add `assert_sync` function
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 7, 2025 at 5:54=E2=80=AFPM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> Should I already add this in V2 for this series?

I would do that in a separate patch (possibly in this series, or later on).

> I've tried it with `compile_fail` and it didn't work, I think
> that's not supported in (kernel) doc tests yet.

Yeah, it isn't -- please leave a normal comment to indicate it, so
that we can replace it with the real annotation in the future.

> That might make sense, with macros we would not need to write
> a const block to ensure its not executed at runtime (although
> it's probably optimized out anyways). It would also mean that

There is nothing to execute, no? It is `#[inline(always)]`, and even
if that wasn't enough, we always build with optimizations enabled.

But yeah, if needed, we may want to have macro(s) like that.

Thanks!

Cheers,
Miguel
