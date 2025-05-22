Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D7C2BF3C2
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 20:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747944612; cv=none; b=oXw6sAZYdHPaYhGa0vC4cRLkhbhJws9Eb8WbJN3b9dDvOxO0VymDXPYAvFqPkFfnqpeiyevZ6VFQC9BsXI7fleUA9/UcmurwVIyvPjbUib8OX3K8PLDRXJMmaWEcBaabk2Z3S713NNWJRjuelWVEy/U/Cn3As0/hPUrUMMy4P+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747944612; c=relaxed/simple;
	bh=uw9HYp7TY+y8RJAkMxxO3mIxoLQxok6Z5rtlhqEMtzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jpuU/IEOD6AuwoOmmyW8rFTsFZziEounnBdp210CwN0/8rWSMvL7nSrykRuKSlRfdWGz5JpHuWqenblkMLB/U7pUzVOBfYH3PrtUo2BGC3ERyNlaIXwiiCfiO29xa08gbAmLAv5QvnXWtV/33CTGtG0jtHRYjf0LvAtdqVSuhPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eD1TjFOP; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eD1TjFOP"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-231f61dc510so46585ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747944609; x=1748549409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uw9HYp7TY+y8RJAkMxxO3mIxoLQxok6Z5rtlhqEMtzA=;
        b=eD1TjFOPkjSwBVHXOIHu76jvAcFSaXXMXMXz2HL9y/4ezxy3cb3qPBTibsfEjVuYgJ
         cGWALBcfHDy+D+dn7e8Wkai5YMUGyqXdpm+cT7kl6ImiCE3TRmGjrdANxBtCLG8XflCA
         BV1Jjxe+1pT5Y8IaHz3pzqaIfsPVE35Qn0FA2q3e8JNBUcW26RoTkQ0xTpuhwLUcB65p
         x1a8HlvchAwJ4o7yqjv/ObZ/dq+6uEUPW0suT00Qgb6aSO59sd3eKaP8nfrzVV7vqgpo
         13Op0nlDZulKS+8UN63TLdZMNEOq8tVMkxdYYJaojJBdz7UB+FqgPOv4+gBEbzMKCOl4
         IjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747944609; x=1748549409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uw9HYp7TY+y8RJAkMxxO3mIxoLQxok6Z5rtlhqEMtzA=;
        b=r3h0jN1PL5QLZAWCzndpLqBdWw33g16Ium8lf9Lc/I4AHBtV6Q0FQNjLNUFXmh1Ytf
         zJhKQ36x9eftfS9Ugvw6Q95PN8C3mETxzO8s/RDf/H0DSNj4i7/JQ3njeNadPBw2Tqs3
         MKpfcceC1hQkq05GJr0Tchw5avf0z5U0TPraz4aK6qQ4j7+NwaLy66r2tMLAvDRDVMOs
         uCySEp5+JbCWgm1WC4N0zCfX8mJXxD//ChPwMLXai6j+1BgW7UyFRJlhcoflff1XVnW+
         kvmm/IRNZuic5FUralh/TzLYYy9rSsK0dAtJF9u1Xt1fCtM3XX7CG7G4OCIFsmGDiX25
         6v6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhea9DifxW7MMNidZt6zjnDPWgPnWS2CxEfoZxRs4vhLyTW2NCSAnP9aZAN18HhniPmmkyBPAf7agW9EM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLtPQ3BtWAqoJRSwAxNPMT+Bw5eX5VOZC2zoyVLt/mV1pN6Neh
	7GgCRgW4ScKNvuue3v2hgktaf+S6iT71JsgQWxkfD7sVTbv+t/RBcJKB1TLju8MUgRBnJQzKjYK
	+AIFuHRYpdU8LI7E/HtMMREQ1s2fLZecvAi/znAE0
X-Gm-Gg: ASbGncv+fd1zaIxrnNvs1p7rM33YH+Ss1CLNch62avoPlGhZcR7CNSDNZOJ9HHJX8nI
	hrFUJBznjMcVkvW1vOVIWIdT5elhAim3I/cNjHNt5auHYGqjtQxYZJFJyRhZrI9jeI4bCHHjH1h
	DM9sVAlh32P8FHDihkiEDORnFF14exJXe30ZXm57STVlIQtBgAy5YVCZ6ciXtkSlmvyq7qnPxCu
	dUxUREj6SA=
X-Google-Smtp-Source: AGHT+IG4FGsVqHi6rXN0E0dPwqX5wRsFdCXEIotJn97oIcWC4dLCcVTQiIBGn9UbqgH9et/oSpeWPLDEyduIif4u4cA=
X-Received: by 2002:a17:903:41ca:b0:216:4d90:47af with SMTP id
 d9443c01a7336-233f2ee4e98mr119985ad.29.1747944609372; Thu, 22 May 2025
 13:10:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522171044.1075583-1-namhyung@kernel.org>
In-Reply-To: <20250522171044.1075583-1-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Thu, 22 May 2025 13:09:56 -0700
X-Gm-Features: AX0GCFtaaENpG6rhZsQXbUSYKKSuPuamXi8st3_wtE7GATXAz04cGZxz0L4ToMs
Message-ID: <CAP-5=fXDaKueO9HE-Gr3Q7R6qm2EjwnL845nh7R2OU+DCfrhyA@mail.gmail.com>
Subject: Re: [PATCH 1/3] perf test: Support arch-specific shell tests
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 10:10=E2=80=AFAM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> This is a preparation for shell tests belong to an arch.

I keep repeating that I don't like arch and I think ideally we'd be
getting rid of the C arch tests. I just sent out a patch doing this
for 1 test:
https://lore.kernel.org/lkml/20250521165317.713463-2-irogers@google.com/
We should be able to make perf, tests, etc. dependent on a PMU rather
than an architecture. This means that running perf built for ARM will
be able to do things running on an instruction emulator on x86. It
means the tool, the kernel APIs, etc. are generic and new
architectures like RISC-V can test things. It means cross-platform
(record on 1 machine type, report on another) can work without
tripping over load bearing architecture ifdefs. It means that we
benefit from more testing on generic pieces of code on all
architectures - like sample parsing. We can always strcmp the PMU name
or the architecture at runtime.

Structure wise we could have:
tools/perf/pmu/ibs_op/tests/
tools/perf/pmu/ibs_op/tests/shell

It feels noisy compared to just having the shell test in
tools/perf/tests/shell skip when the PMU isn't present. There are also
things like library dependencies that aren't clear when we have >1
directory. I'd prefer if new testing followed the existing model
rather than this.

Thanks,
Ian
