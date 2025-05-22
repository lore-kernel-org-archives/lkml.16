Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD98F1F1518;
	Thu, 22 May 2025 12:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747918367; cv=none; b=XtYrTQK3aQCeP8KaZHahg+d4BuO9gmAcYaU/xDI9Nk5GX3hevs/S0eLSpLWyDVqjxdV6Zj5X6X2kHloC8aMAn7wT3NDLoPk2uUf8Y3+/cM/jWBQQSYMzUwLK8uyQDKWtMh/lYz4dpvUURpIweCiv/45fUTvmvxme23PH3khcN/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747918367; c=relaxed/simple;
	bh=tJv4QNjBKtokHjJxeh7G67BZfnogRDLdbuB/31QUnks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c3Y7CPg2cSs0Ii7nVOMhntLy86g/zPHyYCpQDPrGXDx46XZJ6aJD8zUnF9U6GvmxIFIp016Ye+z+H4IjkXTGAemyLDOrgyekX5lJjNlsiyFRNqNrXSGTLxqkFx0IgmGw70Zium/RmnNQK/5u3pfkHKOAuspPqgxr3QHLADIM0/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Geym4q+0; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Geym4q+0"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-30e85955bebso1105300a91.0;
        Thu, 22 May 2025 05:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747918365; x=1748523165; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJ1dqFNlHXFf99EeiB4N9E7VkmnO2BZbDxwhgOO2l9U=;
        b=Geym4q+0VdhYCIbsA9ep2z+M98bdmHOODDKbfJiCxmsUUBJJFDRvWhLQS/3GwI3hOP
         5MD7G+9QNKYkl0Fy+BDcI0ATcR0b3/iBHkBgJ/tZ1sSS51k5IHHuna7Xej5YdbB+ZwhR
         q8XNe2KvrA7e96SOXQysxx+yf2yccnMMOt8AX2udC8va5DFXfYAm5jY0MwYXw53bbj58
         hpAS+a1BqC24upqUrTFlY5VZnOGiIqZrnkQ5vQ6JLz1WaqQlr6UaP73epmtI0LopbJbu
         4zPwOExpEAGZ5yEytJWxoBDUvL0qa5v+Dqd5BdPI9Ckoo+EQVQHIbqFHxuFWXu/0lVKL
         +RBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747918365; x=1748523165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJ1dqFNlHXFf99EeiB4N9E7VkmnO2BZbDxwhgOO2l9U=;
        b=HFkJOE/t7HBRwJkaBXxCKwSHys8Cnd2KlcltIcgcBfyEvyFYiYZ1CCZejbRLI0giF7
         Y9OvtzUisyQ20W8wgK3hMpvT+JC5KTZ4MZGl9KvL2Bhcn7SWoiOQuOwqMALoOjWky2Pd
         RKuOcCQlZyWXtyOBCC0lVyplhnu244w+/T7g8W9j+IKHicQGpssAygKlvSFyczCeGy8J
         clZJ0LZpp4fKI421fxgbH12FVjm9GHkNW5cXgJVPzySreLl6b48PRHOI2T3GTr/K3Ur0
         o6wHrccqerTJ4cDDP2fTZypA8lRzYdF4q5359mYVW6T8dxiYaKNOQym2KiXQJenhSIeA
         dS4A==
X-Forwarded-Encrypted: i=1; AJvYcCWAA4n3UblOB9x+fN4IRxr0Bc4HxorhgBzdEGQaHYaTZkGvDYMO6ML4i446hzd8DNv3bnqvUM8H4RFVsi7e/Ho=@vger.kernel.org, AJvYcCX+QeD6/zj9dBcLRuBCdKTXE7FA3tAabQ/MCwxHARbEyIut3C6pRHDyKWV/K4N9D81kIEND6QUdfCxcuaw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/fSXCBmd5c3+EWSiFiqV84/846KVnLeiugbnFlhwrBl9ix8fs
	zFoxy5hrt9tF05I0fcB8lBCac8+VVnpCZbFLIQVNNuRu/ph2Se+IkpDTbtWMyE85qTjMKjOdieq
	yYCHNryHI8ByyL7LBhq/IOsefDk5IWwk=
X-Gm-Gg: ASbGncvMFlmgEjeKltzEAHCmeS0doUfN4ZvDpghgtxl0SwaBeXQViHp6Bz9MsUD6X7G
	VtIRWkxUjgDYt54XzL/P2gNaOV5GjRLk9OhCkfj9tytJQrJP5SibPF44aSGtREp90XlXmB5vl7r
	IIzAxgj8G17p4id9LnQgOYUUXrn9um3INm
X-Google-Smtp-Source: AGHT+IGQab83uIDU/GDVEexZuM5wwTP4lC86/RT9iNGRKxL/kDU1nqV9xYvUEmkaYpYKc/nYSDo/XA0Hp3rhrP5TbQ4=
X-Received: by 2002:a17:902:c951:b0:21f:356:758f with SMTP id
 d9443c01a7336-231d438823amr134924235ad.3.1747918364882; Thu, 22 May 2025
 05:52:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522-rust-mno-fdpic-arm-fix-v2-1-a6f691d9c198@gmail.com>
In-Reply-To: <20250522-rust-mno-fdpic-arm-fix-v2-1-a6f691d9c198@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 May 2025 14:52:32 +0200
X-Gm-Features: AX0GCFtFzPcuH3SiIlAcuYu5MJfjb9QDePgyNRa2KtJcWu-QNzrT_t3oGCGwMkk
Message-ID: <CANiq72mh1h8d-EWrZef=BPPtadZyHG0B+tg9GgA_RnWiETWMkA@mail.gmail.com>
Subject: Re: [PATCH v2] arm: Fix rustgcc unknown argument '-mno-fdpic'
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	torvalds@linux-foundation.org, Ben Wolsieffer <ben.wolsieffer@hefring.com>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, Christian Schrrefl <chrisi.schrefl@gmail.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>, anders.roxell@linaro.org, 
	arnd@arndb.de, dan.carpenter@linaro.org, laura.nao@collabora.com, 
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev, 
	Nick Clifton <nickc@redhat.com>, Richard Earnshaw <richard.earnshaw@arm.com>, 
	Ramana Radhakrishnan <ramanara@nvidia.com>, Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 2:02=E2=80=AFPM Rudraksha Gupta <guptarud@gmail.com=
> wrote:
>
> Currently rust on arm fails to compile due to '-mno-fdpic'. This flag
> disables a GCC feature that we don't want for kernel builds, so let's
> skip it as it doesn't apply to Clang.
>
>     UPD     include/generated/asm-offsets.h
>     CALL    scripts/checksyscalls.sh
>     RUSTC L rust/core.o
>     BINDGEN rust/bindings/bindings_generated.rs
>     BINDGEN rust/bindings/bindings_helpers_generated.rs
>     CC      rust/helpers/helpers.o
>     Unable to generate bindings: clang diagnosed error: error: unknown ar=
gument: '-mno-fdpic'
>     make[2]: *** [rust/Makefile:369: rust/bindings/bindings_helpers_gener=
ated.rs] Error 1
>     make[2]: *** Deleting file 'rust/bindings/bindings_helpers_generated.=
rs'
>     make[2]: *** Waiting for unfinished jobs....
>     Unable to generate bindings: clang diagnosed error: error: unknown ar=
gument: '-mno-fdpic'
>     make[2]: *** [rust/Makefile:349: rust/bindings/bindings_generated.rs]=
 Error 1
>     make[2]: *** Deleting file 'rust/bindings/bindings_generated.rs'
>     make[1]: *** [/home/pmos/build/src/linux-next-next-20250521/Makefile:=
1285: prepare] Error 2
>     make: *** [Makefile:248: __sub-make] Error 2
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Closes: https://lore.kernel.org/all/CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJX=
Yu7wWK51w38QUQ@mail.gmail.com/
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Acked-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>

Thanks for sending a v2! I was going to fix it myself, but this is
even better :)

By the way, submitting a patch typically requires / generally implies
that you actually tested it, so your own Tested-by is usually not
provided.

Cheers,
Miguel
