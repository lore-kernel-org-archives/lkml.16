Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2012A4B1E4B
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 07:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746517267; cv=none; b=Vf49vT9Ao1DWqiEaxM1AjJJV1iErzNNVRm/Qk88bcQfdw7ryZNp422uIRFgaYZrj+j420Li31rryLtGGNO3ZtssbvLxr1f+hjbsr6oEWsMlu1UffB5HUsdAxpDrjdpB3nXlXgsy2lxcg7UFatRQT+f8i+aHF30a6MYZrhomcpHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746517267; c=relaxed/simple;
	bh=JY8WoGW90Pj91rOsq/oYeEBvXp0D2kZwC+2KYnuqcVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kPy6TafPJ/ncdSweyHxzs1QgyywQcf50/TEQO5MIoq0yZK0mbh8ixFIQEDMQdM/Eka98+aFxpjirdRCVLSXLuSxXihwTuAjbJpFNrlLHTYz+ef6Ob6lWSZ5c2EFwSPGDVx+AOf3NbGwZsvubQ//sQzpDzmJU/vYk1eEDHUKf+co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z0tCf1Mz; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z0tCf1Mz"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso54780261fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 00:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746517264; x=1747122064; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+nzQD4jFvSZum6nHW0R1NgL+iqhlkq0Vsbi9LFz9XRk=;
        b=z0tCf1MzqnfpT33WZ7WDG2CzTN/+JuVgeCqT7xzfW1NN81gwKM0PbBv5vODvfrA7+B
         0OK2dPpXMoM63TeqeLRiELBvQymRY+gRKt/JKhazMpyJY5DpKna9/nmoLt5SGLeKEzq0
         h/eYDZ/oUMhm7mJIgPKlu+eb/mbRJB7n4MKywxeLBvrturEUFNvrmMdleVt6dz+LhddR
         +UFszlXAwAadqBBE/bTME5HlxYP6NcpLOVlq1KyJKZyQRgSkl4/l96R5hwxI0CFCaA5f
         f0IsW5MYFmEDorKog2coJQ/enXacvUsY8TkC1bfd7P7he2soQxCckOKk/Cd75DLseU/K
         0hZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746517264; x=1747122064;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+nzQD4jFvSZum6nHW0R1NgL+iqhlkq0Vsbi9LFz9XRk=;
        b=YL9qYVUT8J20tar38KUVKMdzlVz4g1vSIU5RHMza4IHWkgO4a3+JkWIIysY+eK9Mkd
         tYieSaDGnMXV0dVM77FPssR/5y/K68fEJRJEhbnVYp70OCTK2ejeIiMgKyotfQjYzs8Y
         Aqarqhnh7QhOjeS3aBx+CxuG9awWdsP1/0UG5Hz4yENOdzixptdN3q1pZuyQVZ56Qqmk
         ouc4QeNlqgcqS/Pijl0G/tMnHl2TbBGxsAPGZ+tDhVenDG/v+Tl11B1KjqxJhyVHN8wc
         vEnIx8Cwekt9Max2pFG3pvMJhfvUImd2iShsQhc1Ogr187rIsZDV98oyu3ZcWhvpXHTw
         DppQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXLFdQauCAWznJcQsAFesxRzsXgCvxmW4dLBpEtBOqxQ16Blpt5OmkMPe6oZhv2u62McBKfZmOLX0vlFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQC7L2b0YlK+LL1WIg2G6KJBqLXLfbHSKbr9xeekIjaGBenY8i
	zCpKeN2lX92LbDxR8sUKqtjNqWP3yRj8BK083N0l3v7m6IBpVcv507bwF7FFc+BNjNJ3g6FUN9P
	oEbfTMpcIfZAdYEaRsXfL3t9d/HSUayBH4R06
X-Gm-Gg: ASbGnct8slFC+ZqzaqGOfo+8hOYFnClUEei8am32KavGzadrswYRV4t32Ko+b9VVc//
	D6kPT5t3ZzymDNLUpEBupJZjXkybND9euUefnoSiqiyZvlu48TEKW4XTO+a6Opx+UppyyMQtYNJ
	84SWNMm3kgtR/HvR2a4P45yDN/wDty0fecU/HQ/zRqtPy/5LHqaRT099U=
X-Google-Smtp-Source: AGHT+IGOI6IHbySoO1IZWIh6/2yWi+wp6+T91WyNtYpLP6k+dhVIBXbrvoUB5YIFthxzkqlN3u0PN1dp7jJQoUqdLjQ=
X-Received: by 2002:a05:651c:2228:b0:30b:fdc0:5e5d with SMTP id
 38308e7fff4ca-3264eb33c75mr6720091fa.4.1746517264003; Tue, 06 May 2025
 00:41:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503003620.45072-1-namhyung@kernel.org> <CACT4Y+Yr7vffLYG+YmyB=9Vn_oxdQqR_6U4d-_WeQoOtPXZ6iw@mail.gmail.com>
 <aBmei7cMf-MzzX5W@google.com> <CACT4Y+ameQFd3n=u+bjd+vKR6svShp3NNQzjsUo_UUBCZPzrBw@mail.gmail.com>
 <aBmvmmRKpeVd6aT3@google.com> <CACT4Y+bm4gCO_sGvEkxLQfw8JyrWvCzqV_H5h+oebt8kk1_Hwg@mail.gmail.com>
 <aBm1x2as1fraHXHz@google.com>
In-Reply-To: <aBm1x2as1fraHXHz@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 6 May 2025 09:40:52 +0200
X-Gm-Features: ATxdqUG3QhqVHPk8nfvJR0__0B7VkFInHd-bB1n9FjrqgQvGGiibFdiD0Veg8lg
Message-ID: <CACT4Y+aiU-dHVgTKEpyJtn=RUUyYJp8U5BjyWSOHm6b2ODp9cA@mail.gmail.com>
Subject: Re: [RFC/PATCH] perf report: Support latency profiling in system-wide mode
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-perf-users@vger.kernel.org, Andi Kleen <ak@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 09:10, Namhyung Kim <namhyung@kernel.org> wrote:
> > > > Where does the patch check that this mode is used only for system-wide profiles?
> > > > Is it that PERF_SAMPLE_CPU present only for system-wide profiles?
> > >
> > > Basically yes, but you can use --sample-cpu to add it.
> >
> > Are you sure? --sample-cpu seems to work for non-system-wide profiles too.
>
> Yep, that's why I said "Basically".  So it's not 100% guarantee.
>
> We may disable latency column by default in this case and show warning
> if it's requested.  Or we may add a new attribute to emit sched-switch
> records only for idle tasks and enable the latency report only if the
> data has sched-switch records.
>
> What do you think?

Depends on what problem we are trying to solve:

1. Enabling latency profiling for system-wide mode.

2. Switch events bloating trace too much.

3. Lost switch events lead to imprecise accounting.

The patch mentions all 3 :)
But I think 2 and 3 are not really specific to system-wide mode.
An active single process profile can emit more samples than a
system-wide profile on a lightly loaded system.
Similarly, if we rely on switch events for system-wide mode, then it's
equally subject to the lost events problem.

For problem 1: we can just permit --latency for system wide mode and
fully rely on switch events.
It's not any worse than we do now (wrt both profile size and lost events).

For problem 2: yes, we could emit only switches to idle tasks. Or
maybe just a fake CPU sample for an idle task? That's effectively what
we want, then your current accounting code will work w/o any changes.
This should help wrt trace size only for system-wide mode (provided
that user already enables CPU accounting for other reasons, otherwise
it's unclear what's better -- attaching CPU to each sample, or writing
switch events).

For problem 3: switches to idle task won't really help. There can be
lots of them, and missing any will lead to wrong accounting.
A principled approach would be to attach a per-thread scheduler
quantum sequence number to each CPU sample. The sequence number would
be incremented on every context switch. Then any subset of CPU should
be enough to understand when a task was scheduled in and out
(scheduled in on the first CPU sample with sequence number N, and
switched out on the last sample with sequence number N).
