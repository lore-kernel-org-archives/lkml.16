Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3EF22D4F0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744877669; cv=none; b=TQNh1KugPOjsjxgIGZKS9NzrJp+seADP7JgyJdrClPG1qErI0tDimkkSfUoPpvko55IVavyL1M3Xi5TvSliQAlZeyaj6/jBhMBQrldmBpqKfDNjoxajfL4x0V+yA2js5PiMWobeKzuKogtY5rAA3XsOs5B2MZ5iXniBYv3qM6gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744877669; c=relaxed/simple;
	bh=K96gvCKxLfvWCDXtn9fru+kV52XnRImVxtMbAOexTDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HBbdd0zs6xi5QyxtaUOIzVM8Cvhg0h3xuTypYULf+PqOLtFcIpJbcwG5G1ESHloXaKQQ0PkOG7yqDoqxdg+K0hItSIW4iBcW6DwY3nlj2OL5es21lMgrPCsjdOi1WHfHAWP6AbnK6/j48RnNvWyz+ITE2I4Dw6Kc3W9oe59S4O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l9KiG2M3; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l9KiG2M3"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so6523236d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 01:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744877667; x=1745482467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaiHtoNBz7N5DFvLSjtxO2fIGN8TT/ntEXFFU/tTPXw=;
        b=l9KiG2M3dP3E/ECuU8N6WQQYG2gswJcOJ5PN4H3jM9hufmYmlETsoPP7geShWvf2fk
         cU7yGL3jAcwW4Myc+igvLBVnTYZlSeAT8B4R6oRsEGHbWZ1UJqa+uPD1OMvbvylKIcUB
         Qbow4Mq75YPwYhBYQrP8FskZCs2WO5KxlbchoE/eG1vUPVf1F7886IOxhAw7GwxyNTVN
         +MMnRWwswjMyEveDirdAwQAVWNZ6D+AWXGAcLFOm59IEx2v/g64JBF6JFMkjjjC+ttBR
         H9AO17caYLK6Xcz1DWbrkHqnDA9c8vz2iC6RXMGXH1jsydy5hPyw34Y1HftO6p1liN6y
         6lJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744877667; x=1745482467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OaiHtoNBz7N5DFvLSjtxO2fIGN8TT/ntEXFFU/tTPXw=;
        b=RBFledcZhM71gFU8rv4Hb3XPgigVdE6l+azSyjiwDhRaw6Xlmi4175MSgjVJPpNv/n
         TRGD8AQRHZOmd9bdQsexBeL5LOygC5/RrexlWQ8S9TXnMjtBwIEQPmrhd2k4fhfYztD+
         LzDNfbu/TXNoRbs+GI+gLA2aYZic1M74Qmdixu3n/H+28XNf7O+71LnYlppvQRgpxXwv
         nrKw5OCi9hUcJPs6LFdoQX4BnWemi2YfNJsIZ827+hcGr8/tWdnGCy24UwvuQOVy6QFu
         2EPKWdlZe4tWHiDW8+fqrbEtOVibXJlhfGqNKG4pkTLwxAQksooW6D5+zC4ASDwxydkr
         837Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvptcUpo+RdAdKluLyKGq91VbFHjKP3Yd+tx7PQ+k4J97pTsANQITqmcDxvTJzJOxHAVkIAfdyGp2ZlJA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0L3XYTUe7ST8KN7pfYHgnVG+V5WbTJa4Cb1f5iOpl/VH1gyAk
	cBDojxr85HPkhB8/9jZjRnjXBUmdHY0QVcacQBN3nnSpu3Qp3wQK6TGvCTgZEuTQKMTb6Drrbzq
	nKKArvGC+98x2+q2JeAvalGEjQwagX5B17JHB
X-Gm-Gg: ASbGncuUtCbu9XUWz63VKaElLZj9YhZIgZD/7QRONw8+1ATNl0uQP+dhOEGMqwnDiYa
	cY6r/2xxHFTBpWXgFtgR+tRsviFZvXs5rxtKS9X7+0l7uA8DqlPgjNuFo7g0fJsPM3Iwi21t5te
	XOv4o1ur2hKKLF8oN3SChMchQNihz1Fb2VKPNUbT7eeklQlqCTu6Iy
X-Google-Smtp-Source: AGHT+IEwruGLS4Draj+33/v1rw0zvr5K1sypUHEjtPGgvpb/YYzmAmAlbcdveecjcYLCXrZk8/CiRUIP2Ed2MkNKYt0=
X-Received: by 2002:a05:6214:4001:b0:6d4:1425:6d2d with SMTP id
 6a1803df08f44-6f2b307e7femr67265446d6.43.1744877666833; Thu, 17 Apr 2025
 01:14:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416085446.480069-1-glider@google.com>
In-Reply-To: <20250416085446.480069-1-glider@google.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 17 Apr 2025 10:13:49 +0200
X-Gm-Features: ATxdqUE8zseXJA43ZAhAMTdI6D4ruJXnW0e3Yc0OVf1KYUbilqiiH3jBvVsIOQE
Message-ID: <CAG_fn=WNMWFXND0BZMyydUtxzet-mdG3dCiETCw0sH1YK65NAQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] RFC: coverage deduplication for KCOV
To: glider@google.com
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> We've conducted an experiment running syz-testbed [3] on 10 syzkaller
> instances for 24 hours.  Out of those 10 instances, 5 were enabling the
> kcov_deduplicate flag from [4], which makes use of the KCOV_UNIQUE_ENABLE
> ioctl, reserving 4096 words (262144 bits) for the bitmap and leaving 5201=
92
> words for the trace collection.
>
> Below are the average stats from the runs.
>
> kcov_deduplicate=3Dfalse:
>   corpus: 52176
>   coverage: 302658
>   cover overflows: 225288
>   comps overflows: 491
>   exec total: 1417829
>   max signal: 318894
>
> kcov_deduplicate=3Dtrue:
>   corpus: 52581
>   coverage: 304344
>   cover overflows: 986
>   comps overflows: 626
>   exec total: 1484841
>   max signal: 322455
>
> [1] https://lore.kernel.org/linux-arm-kernel/20250114-kcov-v1-5-004294b93=
1a2@quicinc.com/T/
> [2] https://clang.llvm.org/docs/SanitizerCoverage.html
> [3] https://github.com/google/syzkaller/tree/master/tools/syz-testbed
> [4] https://github.com/ramosian-glider/linux/pull/7
Ouch, this should have been:
  [4] https://github.com/ramosian-glider/syzkaller/tree/kcov_dedup-new

I will update the link in v2.
>
>
> Alexander Potapenko (7):
>   kcov: apply clang-format to kcov code
>   kcov: factor out struct kcov_state
>   kcov: x86: introduce CONFIG_KCOV_ENABLE_GUARDS
>   kcov: add `trace` and `trace_size` to `struct kcov_state`
>   kcov: add ioctl(KCOV_UNIQUE_ENABLE)
>   x86: objtool: add support for R_X86_64_REX_GOTPCRELX
>   mm/kasan: define __asan_before_dynamic_init, __asan_after_dynamic_init
>
>  Documentation/dev-tools/kcov.rst  |  43 +++
>  MAINTAINERS                       |   1 +
>  arch/x86/include/asm/elf.h        |   1 +
>  arch/x86/kernel/module.c          |   8 +
>  arch/x86/kernel/vmlinux.lds.S     |   1 +
>  arch/x86/um/asm/elf.h             |   1 +
>  include/asm-generic/vmlinux.lds.h |  14 +-
>  include/linux/kcov-state.h        |  46 +++
>  include/linux/kcov.h              |  60 ++--
>  include/linux/sched.h             |  16 +-
>  include/uapi/linux/kcov.h         |   1 +
>  kernel/kcov.c                     | 453 +++++++++++++++++++-----------
>  lib/Kconfig.debug                 |  16 ++
>  mm/kasan/generic.c                |  18 ++
>  mm/kasan/kasan.h                  |   2 +
>  scripts/Makefile.kcov             |   4 +
>  scripts/module.lds.S              |  23 ++
>  tools/objtool/arch/x86/decode.c   |   1 +
>  tools/objtool/check.c             |   1 +
>  19 files changed, 508 insertions(+), 202 deletions(-)
>  create mode 100644 include/linux/kcov-state.h
>
> --
> 2.49.0.604.gff1f9ca942-goog
>


--
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
