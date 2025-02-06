Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEFD19E99A;
	Thu,  6 Feb 2025 18:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738868350; cv=none; b=WeGwXm7linAagWnkPrNSDk0KAE3dTblR5wN3hAifr6Ncx7jk5Rlx0iN8YW1sAE4CrhxqX937chvuFU1xwz1CQnxGCByZCdErKA6s+sFElH4tMUmwkfHu8r8Dfz59wUqYxexj9+1Hn1eboNja0BxtXo09D7djofnD7xE+33L+uyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738868350; c=relaxed/simple;
	bh=Mn4USTsueD1G7GSMkHmp8NppNtpg8/PCvuSqrrh+Gos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gqrYY3D2K4bSF3keCDU81TZT9Iy38YIj4alI5x2JkGrqurUg2Pthos7CWyAlMQkt8YxUzSR+VZ77/UY5kDvxHJ7Xe3dO6cGoMUz+6MP9K4lIPlMGsxsM1A8csqvzdnLT7WoJQvu0pJUUglJHphxnWhLlYUkw/0yrXAsxR5yl3PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5LCkOKG; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5LCkOKG"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21f0dca08b8so2320385ad.1;
        Thu, 06 Feb 2025 10:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738868348; x=1739473148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mn4USTsueD1G7GSMkHmp8NppNtpg8/PCvuSqrrh+Gos=;
        b=O5LCkOKGCAgCuevtOh3OHs5h+q28FE6f2AgFP+1AZpenU7BMFbRWauiiE85bqbNze3
         cZDJGp0zWjtbhz/dm+y9sb1sljYnaAwxzK2T+QccBl9bsi/0UXhAitezsWPRRZannDd9
         ukKjZs/72WHpp4OqV+d83FiB4TWmf8oxKCFJYzgxL34082MGqRoyGUqkTSIJlFFeTkAc
         /atlVlnIKnfRBr5WTcIarC3hsOkOVgh11bMIzFhTDHqklG0/h2ZAZaMZlmd48JEZHy/5
         TvBs6J4c1K8MPgm2Cr1Qp9RF6H/iSvJsTd2GDHcyIgxgKGkY833Y2crVQWDVSGV6PTEF
         /PpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738868348; x=1739473148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mn4USTsueD1G7GSMkHmp8NppNtpg8/PCvuSqrrh+Gos=;
        b=bF+/kvO89r95xgqX1xBbNMs0r9ZGbxjw51ZFSjxg1qPcw/SDvcA1e77X+4w1JVMZEy
         wRWz4Kfi+Lqw7Uy0zrrFdrPp4CxNkbayAKmVQ7BSNSEJQyKkCePmSkEMaQRJ0CpcZLqW
         21A5bdBmsBSkOyuMZE6bOnZiDPwBQKaAvLuWmUNQVQpmUiC0UQOuqmnzBFWg2+2Ps24b
         qHbIMGeaWCBeZoJx7IJCQNEswBTIJC/Ymjn0j1/oKrkU4h5uxr5RJq/sF42O9gFrDFMy
         lxTc3E+J1jbwXuZHZxgO2pIV9zcTXQ5uTGGwnArQx/i6WgJj0vgX0SPFyKd+QV5NpVaP
         Y5pA==
X-Forwarded-Encrypted: i=1; AJvYcCWe6S6NOpyUb9dkPIjkjpj+X5Jlgbux9aAmtUfyq97qTT+zWMZAs9QYstyiCF3ikDUZZhwpULloFk0ykZQk9fA=@vger.kernel.org, AJvYcCXLfp5+dl1x3RD40xA+PZ13Z/YD+UutvR3ovfZYdO+GeKuKiu/OFBWT3gLUwmssr0zvqTNb+YuflYQDWRw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqqo3qO24xf2sPAbWpiQJyBKzkuXhsGkw83fXZMcCQwtk8u2Tl
	7xEVRgN1mOeM6m/2XhatAYAPXw8dAubOaMKybh1lMA9GyCtjDQBUf2clmrTaT3rrLFM3orEZ1B5
	K+AHUP/2R+McL6GD88DEYG3MgGlZ5CplX
X-Gm-Gg: ASbGncs3mep00wYxabFSbeqa+t6jEWO43w3oZUm2nRuFnbQp/YE2CISZM7iBHDRzShB
	Rth6281fxf0wrI7FoxP2DfDHVJJY5YxQ03HLM6mwEz/moPkUbdg9s5OxCdJoB2eRaE/jiuos2
X-Google-Smtp-Source: AGHT+IGnRpUn2XfJ2LINEYmbvh9Snm3fVTBp24/lkJhCMPt2W6qS6jePbm2mV+8n9oC24MDFo0lX5gVSNfqXWE9l+RU=
X-Received: by 2002:a17:903:2f84:b0:215:aa88:e142 with SMTP id
 d9443c01a7336-21f4e70dccfmr1295945ad.7.1738868347791; Thu, 06 Feb 2025
 10:59:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129215003.1736127-1-jforbes@fedoraproject.org>
 <202502060744.6F701A4CBE@keescook> <CANiq72meqUFt136PQt=h6b5p+wJ5KvdYM2ci_QNKbHaR2wY71A@mail.gmail.com>
 <202502061039.A75818BA@keescook>
In-Reply-To: <202502061039.A75818BA@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Feb 2025 19:58:55 +0100
X-Gm-Features: AWEUYZmnqqBm8-a4q4INrSXW_BoF7WienOorg5PM5G2Exzt3-P5lQCtI5lS7L8M
Message-ID: <CANiq72n+LbwG=r=zGrEA4-sCD8spJfHF6J7ER=RtaUhFq+ZN3Q@mail.gmail.com>
Subject: Re: [PATCH] Add -fzero-init-padding-bits to bindgen_skip_cflags
To: Kees Cook <kees@kernel.org>
Cc: "Justin M. Forbes" <jforbes@fedoraproject.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 7:48=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> Many subsystems base their trees on -rc2, so if it missed rc2, Rust build=
s
> in a given subsystem will be broken under gcc 15 (but fine in -next).
> But perhaps that's enough of a corner case that it doesn't matter? I
> have other fixes I'm sending to Linus tomorrow, if you'd rather it go in
> sooner? I'm fine either way. :)

Ah, I see.

The Rust-enabled-mixed-GCC/Clang builds are best-effort at the moment
(this should not affect the normal Clang ones) and GCC 15 is still at
least a couple months away as far as I understand, right?

In any case, I can send what I have for -rc2, since I think I will
have others for -rc3 anyway.

Cheers,
Miguel
