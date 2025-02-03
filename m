Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E8A192B74
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 19:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738609863; cv=none; b=JHJNCBgxHcs+FEYpy4zLFclIyGicIbKeAIXbGAK0C605B4o/vuC8FFwiEEmf2PmbXBFTyWVciYF9rj2Poe+vA70ZyWrDS/W8eq+kRbg5MUzaX+gb0+TWK2VuH2DKlLmZxuQzZ6ePNRaN2xfZg0R2alprbBnb/D0vmS1MuzJR6N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738609863; c=relaxed/simple;
	bh=cWkN6Wus5rQgkywr9t4nC/2nXTrW2TRQSZoyHLp8nB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ul0Gu54dD9R0OY8cGwsvHCMBKoBhHOJ7lqboMZ+Mdf+C9pyGiu73wFOogOL6RSD530V2DJQS5v2zKN2SiQJD0nx904Ae+/7SDMlguSNLe1BpFQ1Hm1lZPv1CwhEB3GpyrvlDtobPzfP38BwMKB2k7VFb/mhbYIYrkMsFykrZP0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ht/XIQBQ; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ht/XIQBQ"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3ce82195aa0so18505ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 11:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738609860; x=1739214660; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UuQ0P6aa5euSiNOGk5a0mkHvd4tUoriLp9ElbvjCQv4=;
        b=Ht/XIQBQW5zGgfEPsJkCVppDlgnOXztDEQiLQSkmSVpzo6Jf1RpJJGG4qEvyXbJFhL
         qos0UtYVOLSQc8sh29mR1SIwsY1PbQkpHBmQ8XtrcBpRAuH3QCEkbltLmjZHE4fK6NKZ
         KzA22GENdUJYBY3AQjjDRGWhgMh9PeMEZOo+YJ15KZ1jlFdoL3l9HcIzFJuJgc+fhXik
         PlcWsw7GddC6Sr++gZh0CUCaHSxrOTbP352Yjf/u+wguCK894sGpWA/2uhMkCNBmgkoY
         0Tx3tJajE/tCwPn+AdfcqCuSJDHVgwlwpQk6yDH7J0999Y9U+gcXf3Pdzzc0h1c6uBTP
         LUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738609860; x=1739214660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UuQ0P6aa5euSiNOGk5a0mkHvd4tUoriLp9ElbvjCQv4=;
        b=oR/sx6G9cI/RZS1HN4IyutsE1st+X0rhrPJYTh68V7fTUpra1/1sKqgWkoMhMOooFs
         3GTuMqaiiHAv0ZewoLwgAguj1p+/xMv9qn1olr9egPxyLfGMJu+kM/KhDB/wLDl4srGU
         N+tz+/cT9jVa5HmSaFm16SWJvYcw2hPzTCutouOCkbG6jU3flzxlXp3Gdro7qjipUluO
         U0IRkG1Mm03JCCdIpa/WUVn8NrXF/96nd6s+rgwbSTpQkAHwwBHySzfyV8AjhGJCyorb
         0KCm07KuNjTe03BiaMRZVk5jmgcAlAFACzQo+sSGEJ75Ehulc/zBBDPQAEr0m5juzeTU
         qdMA==
X-Forwarded-Encrypted: i=1; AJvYcCVHOJBHz0qW5YCOeZXxk8mRA11f7mY2zCvRUDGFpfEed5bUNvDIlftKNb1I+/8sKRpKywkgB/DskvBTm24=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCZ0K+0eeHdPqcpDtBrnH/BC9LD3aowT1pXzoGvWDdkCjUmKL2
	a/amLlvzreYbrTbFxItdrM861SApvU8TQnpXiD57xCKCmew0DgU24H07xvdwf+xYz59qIOtPJMy
	FYLDFV2Z41ynSoxVWGy5WMUimmbYnba5PTRAw
X-Gm-Gg: ASbGncu21i90tuoTVDGQCbux8N0TMcvdeKhD3j69UESh9SpV61R70Ui/3ytQTL6WN8C
	fHImB8lhahh/FlGeV7a3QfPkZhuSRwjdhFRfg4NqdbA2XvBfZTw2K0u8u6s4GOb5fXYnZyYb1MR
	lQckU4g4APlc2dRgAOfd610P0=
X-Google-Smtp-Source: AGHT+IGFam83cjFexWYWxYML0aNMo7d0bERNXXrQRxxhtI+ko75GLdGDjsk3yHchwpsCyHuJtDvXW2RiHXR1t2nBo34=
X-Received: by 2002:a92:c544:0:b0:3ce:3873:48d4 with SMTP id
 e9e14a558f8ab-3d03fbc113dmr232265ab.4.1738609860250; Mon, 03 Feb 2025
 11:11:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201071455.718247-1-irogers@google.com> <Z6EStkn-YZ8zaO7u@ghost>
In-Reply-To: <Z6EStkn-YZ8zaO7u@ghost>
From: Ian Rogers <irogers@google.com>
Date: Mon, 3 Feb 2025 11:10:49 -0800
X-Gm-Features: AWEUYZkIMZtV_LyqmOa-QL7z_3riCEn0NPF-ooDjGEkZz_zb41gccBqBZrEDEvk
Message-ID: <CAP-5=fXRz_8CKNz4Fr-=0yhKbf_QE2ND+PPykSAO5p8wcUz7xA@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] perf: Support multiple system call tables in the build
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>, 
	Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 11:02=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:
>
> On Fri, Jan 31, 2025 at 11:14:48PM -0800, Ian Rogers wrote:
> > This work builds on the clean up of system call tables and removal of
> > libaudit by Charlie Jenkins <charlie@rivosinc.com>.
> >
> > The system call table in perf trace is used to map system call numbers
> > to names and vice versa. Prior to these changes, a single table
> > matching the perf binary's build was present. The table would be
> > incorrect if tracing say a 32-bit binary from a 64-bit version of
> > perf, the names and numbers wouldn't match.
> >
> > Change the build so that a single system call file is built and the
> > potentially multiple tables are identifiable from the ELF machine type
> > of the process being examined. To determine the ELF machine type, the
> > executable's header is read from /proc/pid/exe with fallbacks to using
> > the perf's binary type when unknown.
> >
> > Remove some runtime types used by the system call tables and make
> > equivalents generated at build time.
>
> Our approaches are very different but I sent out a patch to do this a
> couple of weeks ago [1].
>
> Did you look at that and decide you didn't like the approach?

Missing link?

The patches generating a syscall(_32|_64)?.h landed. These changes
take your changes and make it so that we just run the script once
building a header file for all architectures. On x86 we then have the
tables be guarded by ifdefs on i386 and x86-64. Then rather than the
table just matching the host architecture the ELF machine is used for
the executable running.

Thanks,
Ian

> - Charlie
>
> >
> > Ian Rogers (7):
> >   perf syscalltble: Remove syscall_table.h
> >   perf trace: Reorganize syscalls
> >   perf syscalltbl: Remove struct syscalltbl
> >   perf thread: Add support for reading the e_machine type for a thread
> >   perf trace beauty: Add syscalltbl.sh generating all system call table=
s
> >   perf syscalltbl: Use lookup table containing multiple architectures
> >   perf build: Remove Makefile.syscalls
> >
> >  tools/perf/Makefile.perf                      |  10 +-
> >  tools/perf/arch/alpha/entry/syscalls/Kbuild   |   2 -
> >  .../alpha/entry/syscalls/Makefile.syscalls    |   5 -
> >  tools/perf/arch/alpha/include/syscall_table.h |   2 -
> >  tools/perf/arch/arc/entry/syscalls/Kbuild     |   2 -
> >  .../arch/arc/entry/syscalls/Makefile.syscalls |   3 -
> >  tools/perf/arch/arc/include/syscall_table.h   |   2 -
> >  tools/perf/arch/arm/entry/syscalls/Kbuild     |   4 -
> >  .../arch/arm/entry/syscalls/Makefile.syscalls |   2 -
> >  tools/perf/arch/arm/include/syscall_table.h   |   2 -
> >  tools/perf/arch/arm64/entry/syscalls/Kbuild   |   3 -
> >  .../arm64/entry/syscalls/Makefile.syscalls    |   6 -
> >  tools/perf/arch/arm64/include/syscall_table.h |   8 -
> >  tools/perf/arch/csky/entry/syscalls/Kbuild    |   2 -
> >  .../csky/entry/syscalls/Makefile.syscalls     |   3 -
> >  tools/perf/arch/csky/include/syscall_table.h  |   2 -
> >  .../perf/arch/loongarch/entry/syscalls/Kbuild |   2 -
> >  .../entry/syscalls/Makefile.syscalls          |   3 -
> >  .../arch/loongarch/include/syscall_table.h    |   2 -
> >  tools/perf/arch/mips/entry/syscalls/Kbuild    |   2 -
> >  .../mips/entry/syscalls/Makefile.syscalls     |   5 -
> >  tools/perf/arch/mips/include/syscall_table.h  |   2 -
> >  tools/perf/arch/parisc/entry/syscalls/Kbuild  |   3 -
> >  .../parisc/entry/syscalls/Makefile.syscalls   |   6 -
> >  .../perf/arch/parisc/include/syscall_table.h  |   8 -
> >  tools/perf/arch/powerpc/entry/syscalls/Kbuild |   3 -
> >  .../powerpc/entry/syscalls/Makefile.syscalls  |   6 -
> >  .../perf/arch/powerpc/include/syscall_table.h |   8 -
> >  tools/perf/arch/riscv/entry/syscalls/Kbuild   |   2 -
> >  .../riscv/entry/syscalls/Makefile.syscalls    |   4 -
> >  tools/perf/arch/riscv/include/syscall_table.h |   8 -
> >  tools/perf/arch/s390/entry/syscalls/Kbuild    |   2 -
> >  .../s390/entry/syscalls/Makefile.syscalls     |   5 -
> >  tools/perf/arch/s390/include/syscall_table.h  |   2 -
> >  tools/perf/arch/sh/entry/syscalls/Kbuild      |   2 -
> >  .../arch/sh/entry/syscalls/Makefile.syscalls  |   4 -
> >  tools/perf/arch/sh/include/syscall_table.h    |   2 -
> >  tools/perf/arch/sparc/entry/syscalls/Kbuild   |   3 -
> >  .../sparc/entry/syscalls/Makefile.syscalls    |   5 -
> >  tools/perf/arch/sparc/include/syscall_table.h |   8 -
> >  tools/perf/arch/x86/entry/syscalls/Kbuild     |   3 -
> >  .../arch/x86/entry/syscalls/Makefile.syscalls |   6 -
> >  tools/perf/arch/x86/include/syscall_table.h   |   8 -
> >  tools/perf/arch/xtensa/entry/syscalls/Kbuild  |   2 -
> >  .../xtensa/entry/syscalls/Makefile.syscalls   |   4 -
> >  .../perf/arch/xtensa/include/syscall_table.h  |   2 -
> >  tools/perf/builtin-trace.c                    | 275 +++++++++++-------
> >  tools/perf/scripts/Makefile.syscalls          |  61 ----
> >  tools/perf/scripts/syscalltbl.sh              |  86 ------
> >  tools/perf/trace/beauty/syscalltbl.sh         | 274 +++++++++++++++++
> >  tools/perf/util/syscalltbl.c                  | 142 ++++-----
> >  tools/perf/util/syscalltbl.h                  |  22 +-
> >  tools/perf/util/thread.c                      |  50 ++++
> >  tools/perf/util/thread.h                      |  14 +-
> >  54 files changed, 598 insertions(+), 506 deletions(-)
> >  delete mode 100644 tools/perf/arch/alpha/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/alpha/entry/syscalls/Makefile.sysca=
lls
> >  delete mode 100644 tools/perf/arch/alpha/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/arc/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/arc/entry/syscalls/Makefile.syscall=
s
> >  delete mode 100644 tools/perf/arch/arc/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/arm/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/arm/entry/syscalls/Makefile.syscall=
s
> >  delete mode 100644 tools/perf/arch/arm/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/arm64/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/arm64/entry/syscalls/Makefile.sysca=
lls
> >  delete mode 100644 tools/perf/arch/arm64/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/csky/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/csky/entry/syscalls/Makefile.syscal=
ls
> >  delete mode 100644 tools/perf/arch/csky/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/loongarch/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/loongarch/entry/syscalls/Makefile.s=
yscalls
> >  delete mode 100644 tools/perf/arch/loongarch/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/mips/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/mips/entry/syscalls/Makefile.syscal=
ls
> >  delete mode 100644 tools/perf/arch/mips/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/parisc/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/parisc/entry/syscalls/Makefile.sysc=
alls
> >  delete mode 100644 tools/perf/arch/parisc/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/powerpc/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/powerpc/entry/syscalls/Makefile.sys=
calls
> >  delete mode 100644 tools/perf/arch/powerpc/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/riscv/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/riscv/entry/syscalls/Makefile.sysca=
lls
> >  delete mode 100644 tools/perf/arch/riscv/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/s390/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/s390/entry/syscalls/Makefile.syscal=
ls
> >  delete mode 100644 tools/perf/arch/s390/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/sh/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/sh/entry/syscalls/Makefile.syscalls
> >  delete mode 100644 tools/perf/arch/sh/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/sparc/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/sparc/entry/syscalls/Makefile.sysca=
lls
> >  delete mode 100644 tools/perf/arch/sparc/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/x86/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/x86/entry/syscalls/Makefile.syscall=
s
> >  delete mode 100644 tools/perf/arch/x86/include/syscall_table.h
> >  delete mode 100644 tools/perf/arch/xtensa/entry/syscalls/Kbuild
> >  delete mode 100644 tools/perf/arch/xtensa/entry/syscalls/Makefile.sysc=
alls
> >  delete mode 100644 tools/perf/arch/xtensa/include/syscall_table.h
> >  delete mode 100644 tools/perf/scripts/Makefile.syscalls
> >  delete mode 100755 tools/perf/scripts/syscalltbl.sh
> >  create mode 100755 tools/perf/trace/beauty/syscalltbl.sh
> >
> > --
> > 2.48.1.362.g079036d154-goog
> >
