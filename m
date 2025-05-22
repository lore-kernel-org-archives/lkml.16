Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1AB26B958;
	Thu, 22 May 2025 22:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747952028; cv=none; b=fgAeXkW/d/fvm02n9eQXtTMQYiMxtiUYQIJccxumeHidg9CunjR+p78GNflc07EF7essnFP/I2ZngtPSkmMT72Fb4qpcp9ucgYd1w4yy4GJ8AxTvT+IuvDz0WHstKxsowOipAhRTySaI2TsUeUB4mv4E/fGq49bxF8LqFxxZyNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747952028; c=relaxed/simple;
	bh=5dENeOLtnJGFObbzdDXN0f5y5BtraJcblhTQRAod3S8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AuW06mELLhPVFcyjxN9m1hizufhBPdkfcGbUyOomk8+jTapJq7qiR1eSuEFmaNBhsJ+FBkuy/wjlc/gZHsP9ZBt4a0zgBqnPfTxIbGlUCif594TyttqMhsL6EfZxqqANIunza3p/KY6auwcV7ayuxgpOs9jS84bm/EjJ//bfAMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGRESWor; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGRESWor"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-231c38c9d9eso6917505ad.3;
        Thu, 22 May 2025 15:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747952026; x=1748556826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMhz1MVSg+20hErSHEivJDb3RiqjMCis/42ObFUBGKI=;
        b=TGRESWorsWj5QhsVEHLZVj2gEKzxRvoD3P+7nakYG0kz2YN4TJS19EwfKDhaQ2+JKa
         Og1SwQIaUQDgRFYpCuQ9VtkgAvUOLVn5z7D13Ij6tcCNhtKNnmOj6xmUfYwOM1mmf+Y5
         ioAN4anUvMLyMXdRyhGa1ataHWnux9xmbINLnYX0ffGvsRqL/+dctEfFHJe+ecw0a1ZR
         lCakiOjv/JQjahO/ejf0H+UJY+cKTo6KdDfbpGjCwegL9R2dLufFEQ6/Q0qU7ZLnpICw
         DcwvCg0Gbcv4Lgm81wfnmaCNqP9j9dC9pIAbbFCQ+1S4ZyXkUdHaEBwRqw8Q2qG0+Twx
         hWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747952026; x=1748556826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMhz1MVSg+20hErSHEivJDb3RiqjMCis/42ObFUBGKI=;
        b=LoSEq5ez/f270c4nbdr2uL+To+LfJJkUDHWQFIY7q8lU91k4AyuUppTLkxZuKXHrr0
         9CAKUv4mLgEEVsVjQmHlLsO4XaPxNpFCPkkFEqufDo2rmaL8JrfedDf41K5v9ZUJ2ycP
         aLPyxn3h7iX+34K8uUgserojDm2TyQbcKSl1tpU25GMt/cT3IOo//kusIHI0NB7pbmU6
         WzsIGguQldUpbfSxF99BM2LwFSQNAn6tu5WnQlxJDh1r/0r8snwqOo0BYanmpHmgadw6
         tGCNCtfRczu/1Df8q3xcLxgNWRxWfDSC7uzgfKqP4WfyLpOwn+6sTm4s0WaKWV9o4TBV
         Aatg==
X-Forwarded-Encrypted: i=1; AJvYcCWWbNlP3gpR4uCl4oP2cGqEFhTUq4ZkybkFMhNEVMp7deZ8nYG0QVZWbo7/85iSDwBgqfyaOjIaPZUsjjw=@vger.kernel.org, AJvYcCWpff++l8M+LHoCqi+SbA8oEMXJaHePXN8mlXc3RuTCYUhVm4H1vOlCZg7fnwd58wY9QYunVxmLVZDgRkPdsgw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi7dDAy7PjEZxaUziaLz+9VEUAI7tmFr/IrCHiZYhH5uRirAxp
	atoEg1NUYuLpbtWLlA9zI4ujg4w9Dg+HyvaXOqgOf+yxnccRzV1frrCGsvG1a66vNARD4LLVcLJ
	FRx1kMxyzCHjP/mFPFhhmUaSMlo45XtQ=
X-Gm-Gg: ASbGncsDD8/thdVtgiHOpuUFfoY6fVzIyEX8TqBkOJTs4ZidXcanRcchQXlb82+ObsV
	ilkiE3Uc8oB+vfhGJM4ioNkPFwiPUQMTWCxMI/QvymqSb57zo4drwfHp74CRvy63alM8As4f/PV
	33Pp7P03CUMm3DDEl7lygazAPf0BomOSzuafrBCvV1D50=
X-Google-Smtp-Source: AGHT+IFTyjvX9iO5arSB+Hrj2K8L6YOfX+CN4mhTlBRVV8gnFAIiCtQe8lkHwIlvRc1U3Eaocj5eWFvoqT3N1A2+8ZQ=
X-Received: by 2002:a17:902:d4cd:b0:231:c9bb:6105 with SMTP id
 d9443c01a7336-231d334d214mr141617365ad.0.1747952025723; Thu, 22 May 2025
 15:13:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522-rust-mno-fdpic-arm-fix-v2-1-a6f691d9c198@gmail.com>
In-Reply-To: <20250522-rust-mno-fdpic-arm-fix-v2-1-a6f691d9c198@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 May 2025 00:13:32 +0200
X-Gm-Features: AX0GCFtr6WgCm1ku7z1BrqoxOWC4SJPyclrOJsw4oTJrTJaoW2ki_s3m3SE0AGg
Message-ID: <CANiq72kHh9e-gB-b1udjJn07=ampsy+4dkTFgEeQ3VNUUw_7+A@mail.gmail.com>
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

Applied to `rust-next` -- thanks everyone!

    [ Naresh provided the draft diff [1].

      Ben explained [2]:

        FDPIC is only relevant with no-MMU targets, and then only for users=
pace.
        When configured for the arm-*-uclinuxfdpiceabi target, GCC enables =
FDPIC
        by default to facilitate compiling userspace programs. FDPIC is nev=
er
        used for the kernel, and we pass -mno-fdpic when building the kerne=
l to
        override the default and make sure FDPIC is disabled.

      and [3]:

        -mno-fdpic disables a GCC feature that we don't want for kernel bui=
lds.
        clang does not support this feature, so it always behaves as though
        -mno-fdpic is passed. Therefore, it should be fine to mix the two, =
at
        least as far as FDPIC is concerned.

      [1] https://lore.kernel.org/rust-for-linux/CA+G9fYt4otQK4pHv8pJBW9e28=
yHSGCDncKquwuJiJ_1ou0pq0w@mail.gmail.com/
      [2] https://lore.kernel.org/rust-for-linux/aAKrq2InExQk7f_k@dell-prec=
ision-5540/
      [3] https://lore.kernel.org/rust-for-linux/aAo_F_UP1Gd4jHlZ@dell-prec=
ision-5540/

        - Miguel ]

    [ Reworded title. - Miguel ]

Cheers,
Miguel
