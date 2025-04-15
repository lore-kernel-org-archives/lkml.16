Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4252DFA29;
	Tue, 15 Apr 2025 15:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744730147; cv=none; b=NJ9/Q1KdzieSZPkzvAKtdrov9+eYX7wYbuzNfHDCSfLa2opSY4OEuWklWNVGJIxPXyFV//n28Ut7bodYFNX8Gdfza7jk+HUzJCngsSZ5+Iu9OkEg558XX6ZtgKpVOXi+oxRlQqivYLVr5n9ty/lDc7KHLGGQwtjRtIPNM67EC5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744730147; c=relaxed/simple;
	bh=NpC2l7gMdFN7S4l3VmerC2J4g0BTa/HJrMGkyw2j7sI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fU/nMX0fheIj9W6s2F7jGGHSJoUC+x51XMYVzso50l/3xvMvcIUteeZieSrHd5B0UogYPcXOuQ008e8MVuT+89zqpj0q4vGSL9iC/Y8k6YIv8rtILjyXFqLLbWzRt5L4u/GGEMlyvf0P62/r2Vbyy89S0DtCK6y3z5TTthBs1Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4rJ7ACQ; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4rJ7ACQ"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ff73032ac0so853483a91.3;
        Tue, 15 Apr 2025 08:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744730145; x=1745334945; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2468/LM85vMjkRChHfRHxsgSwhSOwl5E/WHDOoeYPTo=;
        b=I4rJ7ACQRWtq461SpCWcqQqN1phdRbpDOnPPBPCC9T8vnMHhxMgIRf/4NCbOj+rWg5
         gNhZO8VUcNUlJ2LTXMVnUd+mrnCQV9lkHq6dDL3Sl05VnjeV2rhXoDPXlPhlZg58PSuv
         T5c7TbFxX3/dFeGNSKTkI5KHs3VkIG27AcDR6TkzVc7IqugXXbYQrZ9TIwNH+Mf+eNAX
         iYOPuGEHwklZsYw9bPrSW7iqSfKUsjMpPmRXzrs4zcZtpu/mlGwIbvMYPQse6xWOFUfV
         hqDooNkh5xqVS7zhGLOuEqV86+zUmUtHDd2634ANM6dgf4AZ/cBSIvGFG+KchH07q/iu
         0Sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744730145; x=1745334945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2468/LM85vMjkRChHfRHxsgSwhSOwl5E/WHDOoeYPTo=;
        b=Z7T6VvQMnCAEZnTcQ2TNNpDXPZFQhJL0paSysMTUSqIBBpZKChdZZ7GGfSMZQa8utR
         TMOK2PeF9Ju9qNbP73I0F3P8thGTXY+9fwnkGMsxziX0Kx6Mkc4Q1oyubG+lUFzU8R+P
         5HzrG9lJHfiUhD99YSSx1ddX3lp5C0Hv5V7SKofd6oGGe+yk243onyilBtuhokBN3hww
         THsQA4Woy5iwsg+FeLJeFynVq+2OwuOAaG2Tv8nnD7u1H2jgDdp+CGAopuAEIljhyFp6
         mU3lSOXTAawmXv4/QoKMvA5w70qrz57KLUfjZidRbxGips1mOUk5xvjiGR9sUfnrWweL
         ECDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyawamcJragxUANC8DtQiaGjsIatE/1x8oGuPh1npz+tPhFLPCgJFNjiOgT2wSIV2PaY6QAefjeQ5r9mg=@vger.kernel.org, AJvYcCXBMqx7gi5WHRG8mclMDyWyZCn+TJV1n1Q8o0Fdj/XAwZXELO7UNPRUUYg/L+SOaIXdtjO1yicK32FgsWEOki4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKyETdLwrH12XHp3rdrjlLNvXVzyiZBgvisLFUqAtN3OMAv6a5
	s85cs66eipeEYgTKY3AdnABqJDR8aS6+10tkoNmpHncqT82GFkC9t3SP5B1J8lGfv7Lar/ZsFqi
	j9iXjE4G1TZ6B/dqGYO7E/HWE1AZ4ybrk
X-Gm-Gg: ASbGncvrgzvjPJVIMrDjfp/0sW6ABbJ5pGoTT4fy2vJvfO7eHDRiR/4LXOJ2OWlEIg/
	sUPY+WoGJWV/V6YXJRlqBnj2lta18VLW0ldpgIFqabYbAA6cy8KTTlsfNUpFkRjlS3lo3n6jXd4
	TTB3W4O8xl+TTWTdrEd8JWZA==
X-Google-Smtp-Source: AGHT+IEFtNfPYrRt8OtnFJdTJOSjdTNl3ZwiRUfdzkcjE16zsauWc+s5qcKhNOFduPWtd+QgjELZmANl1IldidZvAgM=
X-Received: by 2002:a17:90b:1651:b0:2ff:5540:bb48 with SMTP id
 98e67ed59e1d1-308237e291fmr9552418a91.8.1744730145258; Tue, 15 Apr 2025
 08:15:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410115420.366349-1-panikiel@google.com> <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net> <20250410130944.GA9003@noisy.programming.kicks-ass.net>
 <CANiq72=k+tZ3ACEB5k9qwJ8ZYu-dXkA3=Lisg1b8ze-2D0STog@mail.gmail.com>
 <20250410132649.GE9833@noisy.programming.kicks-ass.net> <CANiq72=Q_Z8KfV+n4z9wWVJsZwVevag=Vh3URe71XkUuWuqEDg@mail.gmail.com>
 <20250410133446.GF9833@noisy.programming.kicks-ass.net> <CAH5fLghrcqSYwkqbC4SSp6oYCny0riMRGA6W+oqQ69aA=NwYWw@mail.gmail.com>
In-Reply-To: <CAH5fLghrcqSYwkqbC4SSp6oYCny0riMRGA6W+oqQ69aA=NwYWw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Apr 2025 17:15:31 +0200
X-Gm-Features: ATxdqUHa6UdR98KTWL2iHc9V1olrDQLq-UwRQIcblSixMFPevJPtLVIQDFs4VWU
Message-ID: <CANiq72k0AM3v9JZe=8mDN6T1ToiAt1-1e1zJ3z0Oh6ZWfchzag@mail.gmail.com>
Subject: Re: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alice Ryhl <aliceryhl@google.com>, =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>, 
	Ramon de C Valle <rcvalle@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 4:00=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> I submitted a PR that I believe should fix it:
> https://github.com/rust-lang/rust/pull/139632

This landed, scheduled for Rust 1.88 (2025-06-26) if all goes well.

Peter: are you OK with landing a patch like this? Well, modified to
look like this now that we know the version:

    depends on FINEIBT
    depends on !RUST || RUSTC_VERSION >=3D 108800

(assuming we confirm the nightly build works properly)

Thanks!

Cheers,
Miguel
