Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767F920F066;
	Tue, 29 Apr 2025 13:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745932767; cv=none; b=sxrcKOUDxf9KUR5VDp294E0m3wBIm953iCIKEW6vbTNdW39A4EkDyWOwF3uA+01wqCGHVP1QkTk3R77zhmTZLs5MzmV8oaUa8BMZIXfLeXhvHNc0N3BE6EJnTQDIHa8xjPTQ86ExzY8Cr2Isd03uzLVF/Ck3jGiUITkI0fNfHNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745932767; c=relaxed/simple;
	bh=q6pMNSJyTz849RKd8d/Eni1P8kzBFLPdHuoV6nEkUnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dilVZXp6NUcYuTTjxwPm0D7T5A/zBHNS7qjlA2eia1JJgoNliLZFQwEwASemTgAQykznl5WO1pKai9W6ewBP4RflF/THxRYRH5Ain07MXnIUdCetz8p/XoH2DbOfl/R/pgDiC4DZdZYyQohw4YNkX7fZxNIkyPEAiOhUGLiV2do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NisH+AMo; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NisH+AMo"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-309f26c68b8so552665a91.2;
        Tue, 29 Apr 2025 06:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745932766; x=1746537566; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfwi78OPJ+7NloXGVD0nV3Y/3cfDPkY2XA/mDHzCFKg=;
        b=NisH+AMo5dkEJ+EK9JCYpxQDyugrytMV2M7eep7bs/iwYjVv+ZR63V/lo0T3Srvxgb
         O6iVs3leUjO1Wxh3leKiuX27Zrx92EgZu3Pg71BIaEt+5B9x/LgINEONPqyL0IiiTiG6
         KzdJCGu0aa53blRO5/e9bgfu8KPrK66JbtNb/SK5aKmABr/k/iCiredFi9GT0GFZEpxY
         RL0m8teG84jjKxKj52dml8zmmba5aOwi54x8D20GaDgyZCmr4URNf0/BE1T+8NibOZyF
         CFE6l10opPh7GmM/LLBPj54RANV68TQ7v0QB2PmfsGiY89axvRf82ZI7Ku9g39bTcKbU
         r2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745932766; x=1746537566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfwi78OPJ+7NloXGVD0nV3Y/3cfDPkY2XA/mDHzCFKg=;
        b=SUhPTj5UmtrJ7/MclP1erMh9/QYeVurQmra7CqU7doeG6Xe7UIB2v/42BP3kU+qzWo
         fyIWziaWH68lZ8TzGhcN3/5f+xVZ2WJflYpJXST0pcld336FWnivrcIoQec5yUVjRfkD
         EIzoP9N93+m7CFvvGFwd5hW5PcnucWXhJiYqnjfngQgar4Ak5NRxeVPzqo90GPhwYDZE
         iYgfG/u5W0ZFM+m8jbXdIvyq8FlcWT33FvuAbicQh6ZEMVg+eXKUyMa5CSdotw3CIheB
         r72XZiGP9yotZxEZkTgEDjfb66Be/dRpj022I9Y3lXFyhTfVjdu8E2VOQ2QOzIgug1ub
         f+pA==
X-Forwarded-Encrypted: i=1; AJvYcCU69JzFEs52zDDQWPYXKA0A8AeIGq7297yJYJ5o3/l0zn/yDrM0X87iOhOHlTP+nv8JeDODLlQog4pg4SY=@vger.kernel.org, AJvYcCVpuevm43wnPh3v7DVTIX4PxY/QPUWrDxtn4D2vg857PdOG3bgwantp8JgZq4NaptXaRGpH0BYOeUOYfEHoHGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxelMX+4w5Mryj/ugrZBHQI+FpozOxPPMV3un3cfRuiYMFOf5sV
	E+5nek41IPSdyCzTVAb5dfubrloVfOPdPMSHgKuXmGk4OZk+Sa8VDC5TL3E6lPSMG7/A2b8PQSk
	aE8acXbtug+PKt/jZSvUda6iW4iu5qrUisYQ=
X-Gm-Gg: ASbGncui/pp8Eh+WPfkxEgXlVhM4Evi9DJXXH8ZS+EH8GmG+nenqiQ6HX40YYALrktX
	6632J35vHkHqla/6wYvHace6LyaFnuuVtld6fcRlTxVH0LaS7QCH3uA7x/wPE49Blj2VDHeZJ7C
	O0edy4Y10yYKVRdHrM7Vj4hg==
X-Google-Smtp-Source: AGHT+IHxnj2vnGMV80DWZ4aFFXP8qUs5JrcNSGq2bKT98m93IjisoHwKfYDtOCPyJ/O9yqy7+8fVIugvKcq0lL0lIqo=
X-Received: by 2002:a17:90b:33c7:b0:305:5f20:b28c with SMTP id
 98e67ed59e1d1-30a220f061dmr1555914a91.5.1745932765639; Tue, 29 Apr 2025
 06:19:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241119185747.862544-1-ojeda@kernel.org> <CANiq72n4Fw96hcuqQeorsfH7z4Tb+R1gdf80H_XkD-oA6z5TSA@mail.gmail.com>
In-Reply-To: <CANiq72n4Fw96hcuqQeorsfH7z4Tb+R1gdf80H_XkD-oA6z5TSA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Apr 2025 15:19:13 +0200
X-Gm-Features: ATxdqUGN0dlLf5NE4vIholiXMZscWUbgyfznzqrixWlWYYWoan5VvhqtWa-4NWI
Message-ID: <CANiq72mNJrMMbEcfJMLT4kM-_iviM0AR6oeigCyrb5eMWkn3KQ@mail.gmail.com>
Subject: Re: [RFC PATCH] rust: allow Clang-native `RANDSTRUCT` configs
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, Aaron Ballman <aaron@aaronballman.com>, 
	Bill Wendling <isanbard@gmail.com>, Cole Nixon <nixontcole@gmail.com>, 
	Connor Kuehl <cipkuehl@gmail.com>, Fangrui Song <i@maskray.me>, James Foster <jafosterja@gmail.com>, 
	Jeff Takahashi <jeffrey.takahashi@gmail.com>, Jordan Cantrell <jordan.cantrell@mail.com>, 
	Matthew Maurer <mmaurer@google.com>, Nikk Forbus <nicholas.forbus@gmail.com>, 
	Qing Zhao <qing.zhao@oracle.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Tim Pugh <nwtpugh@gmail.com>, Kees Cook <kees@kernel.org>, Nicolas Schier <n.schier@avm.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 3:51=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> I may pick this very early next cycle so that we can get some testing
> during the -rc's, and just drop it if something breaks for anyone.
>
> But any other testing beforehand would be still very welcome...

I ended up waiting on this one since I think Andreas would be able to
try it with some actual workload (the nice benchmarks he has). Anyway,
it will go in sooner or later.

On top of that, backlinking the seed discussion since I will need to
update this patch:

    https://lore.kernel.org/rust-for-linux/CANiq72mwYbg_L8u9NEfRD0Fp9E_zhCi=
=3Dt=3DU2jyjsZe_Ls306hw@mail.gmail.com/

Cheers,
Miguel
