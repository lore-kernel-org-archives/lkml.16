Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B30F22338
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 13:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738761323; cv=none; b=cUCb4YiJ+ENps72WEE+5n2WtDumcXRR2P41ISPFfsIP5gBV+IK5caz3bNiToxgIvIcho38pM9U7yodU1Wz7ztoW+1IbhjhiRdcDAuayjBGGMeCzi0dz7yBjQbW4GGtx7msG0IuzPb3beryEaphcVqae+bFSYQrjf4EbtbOE8wfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738761323; c=relaxed/simple;
	bh=6EdqnBNcqnIHydGEBNR6e8JFOzTCHGwPB0b8W93PzC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cM7jTAEvcl81rXrjQ96u/wE4Fwhx2w06zbC0JIzbGge038zaGlaJNaZiVe6pqgb+nGtRg7yazlVBriDtbXBQHFOSz3jFdhAnRDVfaywLVao6jW88hkXz5dY0UFbLf/4XEV1oFj5vyRVdCRf1EAXYM0A/xpaibHAWM7B560jum2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zSRdZXZI; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zSRdZXZI"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21634338cfdso66270845ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 05:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738761321; x=1739366121; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wu/sc/L4OPn7cAk2v/XNwJZ1ybARuz3FCSjlWNrd2uc=;
        b=zSRdZXZIfnmGRwi+2nqokYp/dEOLuKPK4ogttRg5xcJCvSaN5WZgabspeBYp26UTrP
         ayKkI3AInY8kfYA4vG/l1cBIa0UlKJO5V8nYYdRGjU81Ws/gYXfmMZRViAyg3AQYXa2c
         1pVhXBoia9HDtutK+TeiQioMvgdgmN6KikvcVTvvZSIJmggqaJ8swau10HL35GQd4a7O
         sYz4TnQrX1sTkL0nMcArWCUO2UIjLCwi3gzxl1Jrm3anmTuCkMkc7Dbk5HKnNjgDdwFN
         i9NI++SfEJ1ts9djjMI23OFOkC2fmJbUElasHOTHMvC9ewquIxZpx7EdQE80j7lIxzxQ
         W7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738761321; x=1739366121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wu/sc/L4OPn7cAk2v/XNwJZ1ybARuz3FCSjlWNrd2uc=;
        b=IIhpStvVHD+DzxhzNLLIKQ8VxPDGpQRm8SEGQ6f79jHGKFiwrPcw1aHOEnPg4ftwl/
         p8ud9Mp8Z+jR94psqVnu8l+h4dNM8+OFLsHeuUbxoDcrKbMvliiSwInA3WW4DpDdu8Km
         5N/CgXLuV3pxpao1OPybegddriaOOlvN8PNyOHmdtyAGokZUYs+g6oUdCpN9/plHTpYI
         9NXlYzNT0Ab2CrOBaCRgd3N9MAutJnzJDQQpGVlOSdB/7+9tlnt3i44D97MLmX35osty
         dRGqMpemvlyZg0eNj/tqWe5sCoJdZR2rDCuoEb4lihxOregQaVElNt9d81adf+NwWgrQ
         HTdA==
X-Forwarded-Encrypted: i=1; AJvYcCWtGP2HMNRKmUG3L11ow2Zjm9dQyln57v367YIylHXHd0BWGkLmLDcXz7yjLggfexl/D1Ki4jwmiVHn28c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOMbbtMXFoFz2k4VCDhbdpOSjXWiaIF10ZcH3Y8ot+6CsnkIAU
	bvgGzDkAo/6+wIeLX2rf+KE8UULJh8UtHnvRq+Fj5SO/n7F9NOsx9Gi6aOSjsDLTOlx5rFU2ake
	b4RseA8RM1dI/5nEi0+1LHoWgs6sZs4YZrlB9
X-Gm-Gg: ASbGncurdQbcmX9NimI4aB7kYFtNwfUg3QpPiDzuH4p0alcW5PIu6p0hYtFF/35PFDV
	6bwcwdl5dwTxYrhvfiElQ1Rux4Rv/71koZhMB4cEgJqCdrmDdMLi984IgYIXnkG93RGd4Ez8JDG
	0Y2bOiTFhwMrb7FeK46oiJlOWsV2U=
X-Google-Smtp-Source: AGHT+IFf8uqGqejiqDC+WsvJ+0IKFQdep5DE/lTTj9Lq2uU4fvUimsIEKmftbwK3h1qE8+ChhRZkPz5mlad/lMYnjFo=
X-Received: by 2002:a17:903:2b10:b0:216:3732:ade3 with SMTP id
 d9443c01a7336-21f17ef01f1mr55209855ad.35.1738761319655; Wed, 05 Feb 2025
 05:15:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
 <a83b0149-7055-411b-ba86-d227919c7c32@app.fastmail.com> <f8b59f05-55b5-4208-8bdf-b4be8e93bc22@gmail.com>
 <65da77f7-bbd4-4cbe-a06c-75f10a6ec4ce@lunn.ch> <CANiq72n7UhQEh9TJU7UNBv2t0ZR_rNO3dqbVZ2cwr99u5SOVeg@mail.gmail.com>
In-Reply-To: <CANiq72n7UhQEh9TJU7UNBv2t0ZR_rNO3dqbVZ2cwr99u5SOVeg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 5 Feb 2025 14:14:51 +0100
X-Gm-Features: AWEUYZlASz-FWWUxhqCKYiMuN_a0MLJAcx7YSx21Wkzf07cjFQ7z0fJLREmrNHo
Message-ID: <CAH5fLgi05p6KTN2v=+jy4HoK-oC9pg7dYBuc8wvfx_uN6SVjOg@mail.gmail.com>
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Rudraksha Gupta <guptarud@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Geert Stappers <stappers@stappers.nl>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Sven Van Asbroeck <thesven73@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 2:12=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Jan 31, 2025 at 5:05=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrot=
e:
> >
> > Floating point is banned within the kernel, except for in very narrow
> > conditions, because the floating point registers are lazy saved on
> > context switch. If the kernel uses the floating point registers, you
> > can break user space in bad ways.
> >
> > I expect this has been discussed, since it is well known kernel
> > restriction. Maybe go see what happened to that discussion within RfL?
>
> Yeah, it has been discussed, including in the last couple weeks in the
> Rust Zulip due to the upcoming move to the aarch64 `softfloat` target
> (the disallowing of disabling `neon` in the hardfloat one).
>
> Ideally, I think upstream Rust could perhaps give us a way to do
> something like `-mgeneral-regs-only` or `-march=3D...+nofp` (in the form
> GCC does it, i.e. a hard error if one even tries to use the floating
> point types even within a function implementation, not just in
> interfaces like in Clang), i.e. a way to avoid unintended use of
> floating point facilities:
>
>     https://godbolt.org/z/o1E5nrrzc
>
> Currently it is unclear what form that could take (e.g. whether a
> `-nofloat` target could be possible, "disabling" the `f*` types, just
> Clippy...).

Seems like we already have a warning for it:

warning: floating-point arithmetic detected
  --> /home/aliceryhl/rust-for-linux/rust/kernel/lib.rs:89:5
   |
89 |     a + b
   |     ^^^^^
   |
   =3D help: for further information visit
https://rust-lang.github.io/rust-clippy/master/index.html#float_arithmetic
   =3D note: requested on the command line with `-W clippy::float-arithmeti=
c`

> Cc'ing Catalin in case he wants to be in the loop, since I discussed
> it with him recently.
>
> Cheers,
> Miguel
