Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB991DC988
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745944309; cv=none; b=NYqIwgLZ1LFmBw5wpO1gMzQ6VUByPus5Fc7CjlYD0aLT1vcd4jbP2VTZ7uBAk9jkZPvQX+MmQrWY5H8Ye6eUdTvKnc+SFK29qLNKz7huFk1cBdt4JKV5KJpdEj6v9m7JgI9JFQ5dZYhRbKkV2Rk/v2xxkj3EKoacltVYSjAis6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745944309; c=relaxed/simple;
	bh=QiN74z+CJEBXRYb/UPpnxQjD/3aQMsEEyVGv9MGEl1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nHuVShjaNZR2HBjYuwDpawNZBhZgDtzAcUaffPD89pHEnQq2RpUiK9PyUvZn2xk9dNYGPXW9aJ/51GR26SnUOEBUqB9IpVOxcHIURbOh4V5oY33fXloyACrl8Br3LgxgQxXTHlQIdgB5oJ8rLvjRFlzP/Zh3wECZwr0D3WN3qeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WL6T84iQ; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WL6T84iQ"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso59553711fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745944305; x=1746549105; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4gyoyXQBZP5CNYAbU6ri0C7s2lZnMGSz9WMtHSn0K8=;
        b=WL6T84iQh41CMvw3Zf+WcssIFOhcXzhvR7MJNAyVDUcO+hAVzhNinGAveYDgJMIPRB
         Yxk2VDzrhOR1trnfPYLFTEp/Aaoms6hwTDY+lX78qfB+cVLyl8OXQNXzSU5MtNA7zT0P
         qhFsw5mHip6Mk3U3Y26k6dwi9pTgJFrnqEEmaLJw7/hQ8XLvRvyp9Ji22Z43eqaBDcGc
         OgngLbkedAx7BRREweRJGx0Ak7qFqPgVv8UpHvl5xOrLfV4naIrHKQEg191tih4c28gb
         lKOcNy0gmatnXPuxlkHUYUeI7cq5ut+5PbRkgcMpo2sIKs2pzVOIiTNUc+WP5a2suWVd
         W5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745944305; x=1746549105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4gyoyXQBZP5CNYAbU6ri0C7s2lZnMGSz9WMtHSn0K8=;
        b=SxYYAKcJMgkEKIFtXQNa1NNsOfE2cYOsjDMiSIwHf9IsAM6VjquEElLRhcuHrEYzxo
         w7VS/25pFxOF6jn4LdPxrRc0uWbeCiu0x9ZkAt1pQ4HbLMGc+Y0vTHXOFJi5NEfOvzdK
         SJHApR4dNt6CK5YbPH0npUE+gbdi3jIF+SsBYpt658rv2+3vJoFotai7/dDUHxrV9K55
         VbB1RE8aPAlF83BPEwtf6pXKl6pnA95+OPuC4uoHPVQwN3hY+2t5n1CUBXk66ygaU1Ok
         Avvdm6Bx9D0N0eTHTNIQtyd4Bp/GKyWQ8M8BMgrPnYVrWXPE9bMUMqpLdAP2sk3swY45
         WKMw==
X-Forwarded-Encrypted: i=1; AJvYcCWbw1z6g3TJsdRYrQI0Musm142368c7vMxi7btNGIF3l/Dj6iASiHr696ZfOZ9mO8Nd5U/nJvWh/wR4WRE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdPhxI2p7V0AYa+N3ab1bHhX+Gzvx+jZyds5aykOqupTlupy0U
	TiuU+KkDBt9X4mWluVUS3SvLz+hh5mL+CnuhQzHaNKlAlPz0Xs92n9dPCgQhdoTSkMDH94fLRi+
	dzvWZ09uzHk2ppK6s5p3dQ6LRyCM=
X-Gm-Gg: ASbGncuXIBfNeaNc3hSulUa0TW7dMBGo6MDvECwZT2b1B4YrLmod7LQM5JGysYgdwvX
	GD/vkuRYN376SUDWdupwfhVSshLRKbNUZWhLzmv8LhjYAwSmZwM5B7eSQwq53JCKRewF3NBdv5j
	H4Nm0YaEDdtx+VxMILY9BcurPRDHUfyj7x
X-Google-Smtp-Source: AGHT+IH7re8OZF5bBSB4k0ZAEY2C8Zq+JO8DnU0SlRx83CgjrM1oycE+00LS/WCWFBKeaAgxWkGcPHQ96qS0/rLqulw=
X-Received: by 2002:a2e:a545:0:b0:30b:acad:d5ce with SMTP id
 38308e7fff4ca-31d34d606ddmr13916301fa.21.1745944305393; Tue, 29 Apr 2025
 09:31:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231001131620.112484-1-ubizjak@gmail.com> <CAHk-=wg6P8pPg-x4BPUQj-wE0xC7HkGzFk89ftuji8MVo+RRxw@mail.gmail.com>
 <CAFULd4Y+HXuditB51Q0LznqiBsvxJr3BjEYvx4_224XmqrycCw@mail.gmail.com> <CAHk-=wh+cfn58XxMLnG6dH+Eb9-2dYfABXJF2FtSZ+vfqVvWzA@mail.gmail.com>
In-Reply-To: <CAHk-=wh+cfn58XxMLnG6dH+Eb9-2dYfABXJF2FtSZ+vfqVvWzA@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Tue, 29 Apr 2025 18:31:33 +0200
X-Gm-Features: ATxdqUFGYsvKCzBX1UDWQvn2O_lq9gpMRDEWpGUYKuz45NvPITjcFjU0ANZaygA
Message-ID: <CAFULd4Y-gr+UAvi4m1-p4MnJyMv3NRcyH=TFLZfFfNngnE_Kpw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] x86/percpu: Use segment qualifiers
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@kernel.org>, Nadav Amit <namit@vmware.com>, 
	Brian Gerst <brgerst@gmail.com>, Denys Vlasenko <dvlasenk@redhat.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Dead thread resurrection]

On Sun, Oct 1, 2023 at 10:21=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:

> And indeed, the *very* first thing I tried shows that this is all very
> very buggy in gcc.
>
> What did I try? A simple memory copy with a structure assignment.
>
> Try to compile this:
>
>     #include <string.h>
>     struct a { long arr[30]; };
>
>     __seg_fs struct a m;
>     void foo(struct a *dst) { *dst =3D m; }
>
> using the kernel compiler options (it's the "don't use sse/avx" ones
> that matter):
>
>     gcc -mno-avx -mno-sse -O2 -S t.c
>
> and look at the end result. It's complete and utter sh*t:
>
>         foo:
>                 xorl    %eax, %eax
>                 cmpq    $240, %rax
>                 jnb     .L5
>         .L2:
>                 movzbl  %fs:m(%rax), %edx
>                 movb    %dl, (%rdi,%rax)
>                 addq    $1, %rax
>                 cmpq    $240, %rax
>                 jb      .L2
>         .L5:
>                 ret
>
> to the point that I can only go "WTF"?
>
> I mean, it's not just that it does the copy one byte at a time. It
> literally compares %rax to $240 just after it has cleared it. I look
> at that code, and I go "a five-year old with a crayon could have done
> better".
>
> In other words, no, we're not using this thing that generates that
> kind of garbage.
>
> Somebody needs to open a bugzilla entry for this kind of code generation.

FYI, after GCC PR 111657 [1] was fixed, gcc-16 will generate the following =
code:

foo:
       movl    $m, %esi
       movl    $30, %ecx
       rep movsq       %fs:(%rsi), (%rdi)
       ret

And adding -mtune=3Dskylake:

foo:
       movl    $m, %esi
       movl    $240, %ecx
       rep movsb       %fs:(%rsi), (%rdi)
       ret

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D111657

Uros.
