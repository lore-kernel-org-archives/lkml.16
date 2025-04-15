Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089672973A2;
	Tue, 15 Apr 2025 15:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731548; cv=none; b=p1xPS+cFurwr/a3Js27HmeVbXxBRYoOnBxN8GzG2JpNbFVBznwZ1IIoyT0P9bHJMwM6ex/Lgm/Nzr9AfeX2nGGKuuFtNpr04JUCs5RStOqXU72fGEeHPp+f7yV/3EjMt8Dxle714lkF0EWe3noRr2eg1sSgCwjkKWGegtoh5mUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731548; c=relaxed/simple;
	bh=dDWZGTWArKLiIUijlIgxDuLMl/Hhc0MZKDfBUpLSrtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mLm3frx1eZU04RvtvEQe8ALoYpdZEYQDWW4qFXHfpbEdhHOGtRwgSmxFOYUVr0rKK/0vvTnfbFqNEFkJqAezI/GCcTBN3Dp8GrtfaXdHIAHWO6G4AxyqZKYUwdjFWupO8n2hmuWuWGbpFixIVkwZKH9aXrKWlFSo2BaPMXj9yBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQeDZ3/A; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQeDZ3/A"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-227e29b6c55so6015725ad.1;
        Tue, 15 Apr 2025 08:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744731546; x=1745336346; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9Hgf71bbKZfJ9ujOKELACCuf2RGtWUNokQop0Z+buA=;
        b=FQeDZ3/Ao0jwAsPykzjtJPzb56ILteJ/xtOpB1NLSQE8XDUloOZtaFLuSuY9seoDmC
         mk8tY6fgkfYrYHRLPui79kfqMCS7qxnFl2q9ikd0TjBkP7pIuFC1q2uYNsD9FKSvD36Q
         oNYh6DALFTUWtTVybQm+ZklMuhe8SNJ0mWQjmtEdXAoGu2SWfm9tos9S3A1/ilIOQmX8
         RV1xKQnk6VhF9VttcbkjJW8ni1bg4Zm/1RtHSUmgz5vH1nwOv0eEk/pXS9XpHTsPBtpg
         s1Xtx5Msd8h97nfs+LqCVSZQ5DxmAr79nbgNOkFOtz95kKjPXBHXuhHwPFBkaWdCVzSq
         7nqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744731546; x=1745336346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9Hgf71bbKZfJ9ujOKELACCuf2RGtWUNokQop0Z+buA=;
        b=rwypa2PqKhCnyykZ9OZjmtYRAzwxSYb6oyFEEIUfEozVWCfxMTilSISW1gl3fGPoEJ
         8nbOW2YMBFkluI0f/kvmv11uKsL3qmRVTD682cR/3dyfTtruJ5wWzrxFbE2HWUZX/cm3
         6aQd27z3DUP9PliCSg6d2d9S3jJenjBwYhN/ILzslMzcDcGMfCMzANiQtv0AOorJd2z7
         CIS8qXZES2JkRWBzPOOD8e+i/CADQYrxSkCo6QHQnryJP2v8srRYAAQbVlOb1g/J8xpQ
         x0ywYcLnusdgL/yPF9aExVd13VG3VCEzUhCIUvS8ZNZqGud6i95k+2l1oBxV5rJycwKA
         jouA==
X-Forwarded-Encrypted: i=1; AJvYcCVh2JrPz9CO1uW2S+aWaUUPNKzyA0uNLAPkEk/FZW+SGTTTsWwTeOWJNgHIzG2Apob6BmnsgLN0PJaBmF0=@vger.kernel.org, AJvYcCWBI10Zn5CA1Xma94GYq6r0RRgvR/RragAx0T4pOVWiXv2mXMbfHE578HS+wAeJ8PUYdIXSzNcDazNyTjmm014=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhzzrqDzACBXln2Yse4G1fbFl67CbbQTycNFuLN8MbMb7Vk1U0
	WADQUACWWm27Xn9QlncDpjeoD8xcMbLooDQ/V89P1GU97ss+Su6zyKdvSeENW1edcTqiV3Po9ze
	HTdkJ9GeP3QofD/3sBv18FuOg60LySkjoYT0=
X-Gm-Gg: ASbGncsR3ksl/Ci+KGhs7wcSwjgkSMPZWXCiFExZeVPgn64ZiZIXliIKJOAQ3XHxh22
	X5VgQCGOSEyoHE04pyvN+rsP6eZ5ildOQhKCx8UwGn831OlbbDhUY1i1uD1D/KdP309EeS9KQAB
	pZUVZz8B7/1gIddKZNB741xg==
X-Google-Smtp-Source: AGHT+IGpan7ylJ+lGUJcAR9q3eXLCXTE+QbOlu5CF4icAGO8qCXWu4gBBhuVLjtf/D8BJT4SfUQVRqxMcusLpCW3mi8=
X-Received: by 2002:a17:903:3c65:b0:21f:1365:8bcf with SMTP id
 d9443c01a7336-22bea4f1830mr102714135ad.10.1744731546102; Tue, 15 Apr 2025
 08:39:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJXYu7wWK51w38QUQ@mail.gmail.com>
 <20250407183716.796891-1-ojeda@kernel.org> <CA+G9fYt4otQK4pHv8pJBW9e28yHSGCDncKquwuJiJ_1ou0pq0w@mail.gmail.com>
In-Reply-To: <CA+G9fYt4otQK4pHv8pJBW9e28yHSGCDncKquwuJiJ_1ou0pq0w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Apr 2025 17:38:54 +0200
X-Gm-Features: ATxdqUELU5btSgHGptRAiOx15wUhRNJ8mFAscobppbwbL3KXHSRC65REzivTL5I
Message-ID: <CANiq72napRCGp3Z-xZJaA9zcgREe3Xy5efW8VW=NEZ13DAy+Xw@mail.gmail.com>
Subject: Re: Build: arm rustgcc unknown argument '-mno-fdpic'
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Christian Schrrefl <chrisi.schrefl@gmail.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Rudraksha Gupta <guptarud@gmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Ard Biesheuvel <ardb@kernel.org>, anders.roxell@linaro.org, 
	arnd@arndb.de, dan.carpenter@linaro.org, laura.nao@collabora.com, 
	linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	torvalds@linux-foundation.org, Ben Wolsieffer <ben.wolsieffer@hefring.com>, 
	Nick Clifton <nickc@redhat.com>, Richard Earnshaw <richard.earnshaw@arm.com>, 
	Ramana Radhakrishnan <ramanara@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 1:40=E2=80=AFPM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> On Tue, 8 Apr 2025 at 00:07, Miguel Ojeda <ojeda@kernel.org> wrote:
> >
> > On Mon, 07 Apr 2025 22:58:02 +0530 Naresh Kamboju <naresh.kamboju@linar=
o.org> wrote:
> > >
> > > Regressions on arm build with config rustgcc-lkftconfig-kselftest on =
the
> > > Linux mainline and next failed with CONFIG_RUST=3Dy enabled.
> >
> > > Bad: next-20250327
> > > Good: next-20250326
> >
> > > Unable to generate bindings: clang diagnosed error: error: unknown
> > > argument: '-mno-fdpic'
> >
> > I assume this is the arm support, i.e. commit ccb8ce526807 ("ARM: 9441/=
1:
> > rust: Enable Rust support for ARMv7").
> >
> > Clang does not seem to support `-mno-fdpic`, thus you probably need to =
add it to
> > `bindgen_skip_c_flags` in `rust/Makefile` so that it gets skipped when =
the C
> > compiler is GCC.
> >
> > If you do so, please double-check if the flag could potentially alter t=
he ABI in
> > a way that `bindgen` would generate the wrong bindings.
>
> I tested this idea and it works but I don't know enough about
> rust to double-check if the flag could potentially alter the
> ABI in a way that `bindgen` would generate the wrong bindings.

Yeah, it would be nice to have someone knowledgeable about the
arch/GCC/flag confirm or not -- I don't think Rust knowledge is
needed, i.e. it is mostly about how GCC behaves with/without the flag
and vs. Clang (since `bindgen` uses libclang to parse code).

The original commit adding it to arm (and similar ones for sh and xtensa) s=
ays:

    When building with an arm-*-uclinuxfdpiceabi toolchain, the FDPIC ABI i=
s
    enabled by default but should not be used to build the kernel.

So it sounds like it is only an issue for particular toolchains/targets any=
way?

Cc'ing Ben who introduced it, and the arm port GCC maintainers in case
they may be able to tell us more -- thanks in advance, and sorry for
any potential noise!

Cheers,
Miguel
