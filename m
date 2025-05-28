Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C46628643A
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 18:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748455439; cv=none; b=PZ3gyVKM0LgaNEx5vrhBY3uz0CHKPiEJgcoEN4g4Ptc4vVrixdnyAUsJIrqVBbjwI6GtINIarvpeplwiR6qiX8P8aJKYMD8mYOOOZGy+X62t42oN0umhtPFVrZoWgzEEjbb9ooG4gaHr08epT6KQ7xzdk+Tk7V/0Nv6ykbLr/co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748455439; c=relaxed/simple;
	bh=y3gDfBvmW3cfiD0V313GhN2HKcJE858T1+tCRVjO7pE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CiFqAsbyJSd6x54myMi/PDHTG1S3EFQw66X9n3J82Yexc+b+G+ZACH22pq4XmsdK8hn9nnA062Q2jbARaIMG7T+RKibQRCb0e9jL0dPtlveLR8EBMMdwpNvgk1GKNFSOjT0OFO+Fo9Mcbgx6PxvEjjEO5HNSci3PMEIhMizlCQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NpIImjmx; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NpIImjmx"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3dd89a85414so22525ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748455437; x=1749060237; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxCBPuzPZYMMQyoxJpdKY9mjMg1Fs4mGiYtoajGbWLo=;
        b=NpIImjmxO3QK2VXIBbYHWE45CKGliLsftWOZgUCWXoMt7CWgS04faOW/r7He0xFK3u
         zFSGWrNAsld9k2ejOJiMDJzQhZ/F60Z8xXNK0cwmtWIN90hwkBl9hc/Rrb+qf+WUgyy/
         MQZAKTxDgz/ufwecMdhpJgc1ralWbOqCbHRM0/F5x2WtHY/EvjnFcCxgwBzPbnL6o+Yv
         OPe1/znPv0bqcrF8aIMTWo70TI1DVVuxlw5X09hASwPTvSBk9Z4oV4tiJvYGVcLar+d8
         3Hvf2xxguKsTRJvCKXpEeiz89TwG2+eXDEUI3mYczG274UyMtzOJvJLGXnAUArVyptfq
         3TkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748455437; x=1749060237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lxCBPuzPZYMMQyoxJpdKY9mjMg1Fs4mGiYtoajGbWLo=;
        b=fDoNOf5OiKbkx3vnGU1nVlIvSTb42v8CPq6KePld72ZEOE3ELWzN3/sYklIO4VNDte
         JVSZ+D4dymKddeHIc5OrbaG4jgIv4yYq7Fr0OljYuLPByZ7T+fUULy22Zks0QlOf4C+F
         iDLrdNEq0Bb5lg6953XBXmFzXapo/boaXrCpSVMwv4+1Xis60qzCJKHKbuLFM4azwmJf
         sKWN7AuzrKrC5xJg0gw+FH3vQP9YiUhldHKdqzPJDiHqXD/2j0AMvVXuI5DqqNR5raYX
         hI+7KhSljyO81bCgqGIwpKvBMB345ZzO/qjXhsq+CZ2TPQOGPbhH8/cEii6oZl1jnXTe
         Cvww==
X-Forwarded-Encrypted: i=1; AJvYcCXr7WjvIR3laMDORWGhyv72B60eBnYsh/jSFg1qcbJVMsGtlLbEroywbJFBsKZLGa7UavyuZjRauVtWsoc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGPiiySMKYNyZxN6arj974b32QEerVDQI6og0gMEV/pUryIm6q
	0Vbm4xHawaMhcdPPrEerLyrgR8UPvZo1Wexg714KaEbffycMZdtODiEmjQq4KzNQtNotbj6Z6FJ
	I7vfJ4W/M38nK89ituIt8EZ9ylVvu08mugGK2KmKx
X-Gm-Gg: ASbGncu5pufP7n/lur4dnR0YJ93+EelmFR9N3qFiIkkVcVcrdKd06p2zdZbfpaN6m/3
	YG7EWC3bQf7Hn6ioVONi5nzNnIWjeputPY8dLziq5NhUbIMgbJRRHmPNxFszjd9vRgLnLx9X7AI
	xUOpH6ygJ4/6j/TemBNoxT5GwmidbJ3185jgOot3kfOnpRLp0sboRjYuOlNLw535tRmtIzwOYv
X-Google-Smtp-Source: AGHT+IFZ63PJyaMXkDMN2RPPrQh1dWrNucQH4ctX9WtR0X20S4rMRW+kY0QVFHH5e0k98gRk3nOHrX/SoDRyfIExzVg=
X-Received: by 2002:a05:6e02:2587:b0:3dc:6151:5903 with SMTP id
 e9e14a558f8ab-3dd91bb286bmr219855ab.10.1748455436707; Wed, 28 May 2025
 11:03:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527180703.129336-1-irogers@google.com> <20250527180703.129336-4-irogers@google.com>
 <aDcF7_pIU5M_XEAs@x1>
In-Reply-To: <aDcF7_pIU5M_XEAs@x1>
From: Ian Rogers <irogers@google.com>
Date: Wed, 28 May 2025 11:03:45 -0700
X-Gm-Features: AX0GCFvdKyVA368LKetlo9s4uYxP2lbsSg2xZ2-A7hEEtYGI2AEq5-UvDX1LzO0
Message-ID: <CAP-5=fU6vnbLUbUr=+ZsmKyPo+u3w3F-2qM_6tBxeF=F0C+w1A@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] perf symbol: Move demangling code out of symbol-elf.c
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, 
	James Clark <james.clark@linaro.org>, Howard Chu <howardchu95@gmail.com>, 
	Weilin Wang <weilin.wang@intel.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Andi Kleen <ak@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 5:47=E2=80=AFAM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Tue, May 27, 2025 at 11:07:00AM -0700, Ian Rogers wrote:
> > symbol-elf.c is used when building with libelf, symbol-minimal is used
> > otherwise. There is no reason the demangling code with no dependencies
> > on libelf is part of symbol-elf.c so move to symbol.c. This allows
> > demangling tests to pass with NO_LIBELF=3D1.
>
> At this point:
>
> =E2=AC=A2 [acme@toolbx perf-tools-next]$ alias m=3D'rm -rf ~/libexec/perf=
-core/ ; make -k O=3D/tmp/build/$(basename $PWD)/ -C tools/perf install-bin=
 && perf test python && cat /tmp/build/$(basename $PWD)/feature/test-all.ma=
ke.output'
> =E2=AC=A2 [acme@toolbx perf-tools-next]$ m
> rm: cannot remove '/home/acme/libexec/perf-core/scripts/python/Perf-Trace=
-Util/lib/Perf/Trace/__pycache__/Core.cpython-313.pyc': Permission denied
> make: Entering directory '/home/acme/git/perf-tools-next/tools/perf'
>   BUILD:   Doing 'make -j32' parallel build
> Warning: Kernel ABI header differences:
>   diff -u tools/arch/arm64/include/asm/cputype.h arch/arm64/include/asm/c=
putype.h
>
> Auto-detecting system features:
> ...                                   libdw: [ on  ]
> ...                                   glibc: [ on  ]
> ...                                  libelf: [ on  ]
> ...                                 libnuma: [ on  ]
> ...                  numa_num_possible_cpus: [ on  ]
> ...                                 libperl: [ on  ]
> ...                               libpython: [ on  ]
> ...                               libcrypto: [ on  ]
> ...                             libcapstone: [ on  ]
> ...                               llvm-perf: [ on  ]
> ...                                    zlib: [ on  ]
> ...                                    lzma: [ on  ]
> ...                               get_cpuid: [ on  ]
> ...                                     bpf: [ on  ]
> ...                                  libaio: [ on  ]
> ...                                 libzstd: [ on  ]
>
>   INSTALL libsubcmd_headers
>   INSTALL libperf_headers
>   INSTALL libapi_headers
>   INSTALL libsymbol_headers
>   INSTALL libbpf_headers
>   AR      /tmp/build/perf-tools-next/libpmu-events.a
>   CC      /tmp/build/perf-tools-next/util/symbol-elf.o
> util/symbol-elf.c: In function =E2=80=98get_plt_got_name=E2=80=99:
> util/symbol-elf.c:563:21: error: implicit declaration of function =E2=80=
=98demangle_sym=E2=80=99; did you mean =E2=80=98dso__demangle_sym=E2=80=99?=
 [-Wimplicit-function-declaration]
>   563 |         demangled =3D demangle_sym(di->dso, 0, sym_name);
>       |                     ^~~~~~~~~~~~
>       |                     dso__demangle_sym
> util/symbol-elf.c:563:19: error: assignment to =E2=80=98char *=E2=80=99 f=
rom =E2=80=98int=E2=80=99 makes pointer from integer without a cast [-Wint-=
conversion]
>   563 |         demangled =3D demangle_sym(di->dso, 0, sym_name);
>       |                   ^
> util/symbol-elf.c: In function =E2=80=98dso__synthesize_plt_symbols=E2=80=
=99:
> util/symbol-elf.c:761:27: error: assignment to =E2=80=98char *=E2=80=99 f=
rom =E2=80=98int=E2=80=99 makes pointer from integer without a cast [-Wint-=
conversion]
>   761 |                 demangled =3D demangle_sym(dso, 0, elf_name);
>       |                           ^
> util/symbol-elf.c: In function =E2=80=98dso__load_sym_internal=E2=80=99:
> util/symbol-elf.c:1778:27: error: assignment to =E2=80=98char *=E2=80=99 =
from =E2=80=98int=E2=80=99 makes pointer from integer without a cast [-Wint=
-conversion]
>  1778 |                 demangled =3D demangle_sym(dso, kmodule, elf_name=
);
>       |                           ^
> make[4]: *** [/home/acme/git/perf-tools-next/tools/build/Makefile.build:8=
5: /tmp/build/perf-tools-next/util/symbol-elf.o] Error 1
> make[3]: *** [/home/acme/git/perf-tools-next/tools/build/Makefile.build:1=
42: util] Error 2
> make[2]: *** [Makefile.perf:798: /tmp/build/perf-tools-next/perf-util-in.=
o] Error 2
> make[1]: *** [Makefile.perf:290: sub-make] Error 2
> make: *** [Makefile:119: install-bin] Error 2
> make: Leaving directory '/home/acme/git/perf-tools-next/tools/perf'
> =E2=AC=A2 [acme@toolbx perf-tools-next]$

Sorry, was so focussed on getting the sanitizers clean I'd missed the
non-sanitizer build. Will fix in v3.

Thanks,
Ian

> - Arnaldo
>
