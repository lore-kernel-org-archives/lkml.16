Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAA020EB
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747173405; cv=none; b=d31ClJAmrCWLYsbuE97nviqyXet6BwnWgdv9IqLC9t8TI4YXE3WckmW7W7GySNYD1WJ/rWvDuaan/PV8vfSM4HaEFYfDJGR0p1PycldoXesu1Ldbj0vmqEnYKz19xUwyi9ji21PDkjG0ptQIi8fazDVRwjoTtpDvgxzyXyeRvd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747173405; c=relaxed/simple;
	bh=aD/mEFUBTkfBHzNIG9+JcFy/HMufvEOYsbmJj0l2WhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OYUysVKTmdo3gcp0/IDlTzQPVVJ8bnd7+06fBNhH7pRlYQsDSVVERvhQxRrjNU79aeWpArJ2VYDcyKIK1LwYzeCko6CYfpkd6bS+1nb+SkQ3aa9cYuj1oUEFvv1sQSuE+4+uULU6ER3CfTA3Vqmwk5RIM3IT7810KqBfDOrQGPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lq29rgsU; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lq29rgsU"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5f624291db6so10449577a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747173401; x=1747778201; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOFLs70pIgzQa04xbutz7kB9QFwJKXh9NUKfCB1ibxM=;
        b=Lq29rgsUTHbpKrupyBrfWC7sctf/VEaIXoomDmxsM8xThU80qzqQmdW0lUuD7/Bj/S
         6kOk1WhAD4w/u6S2dXzbw8bOOh2y3yhG+oUlCRfxxa7OuGC4zvXPDyCeajtA1LUDHBuc
         /7ZOhNO2Vp6TLE/gt94Y1BvJaEaXXCDKpPgGjbzt7M0fsq4xn8JrM+ntohM6jCYv6+lr
         I1EtdaPTs6hD7Oc7751FWqmMNkV4OaHH+wrlAs6HRhy63JIua0w+HAyVJlpseYGNhzSX
         QRkcwWoo/HfY3glce6NEygewOS2pHglaq/37Nn4TCOye6HzlDrHepXM1nnQpeTMOsNPs
         ENYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173401; x=1747778201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOFLs70pIgzQa04xbutz7kB9QFwJKXh9NUKfCB1ibxM=;
        b=OY5wkU55MNByz1PSV95TsQ90vINkJj8YD1CZu3KdS849jPsuxdE5YfL+LTNWxr19Q0
         pGSGnA04G25s37C28MT1nR2akgvohKLHHahmC5zeGV5yFTcjlK7UPI601jEGIuSVATOJ
         9NH4feSVEDdQvnPrCwvTgUfQasNb06flBJTzlNGFs2hae+6bJa7je5+Fmpz+jLX0aJ+S
         1f6dRtpUxs54DLA13zASTK5J8Y9B+jOhtoHnntbnSjRBrJTPOW1JdLVx2H1cxdecKX3T
         24OcoX/a8cst0I3A+OQhPGe8bIb+A5s2bafo/ihK/aBN+2fDnAXeKLHBvmdwepeP2SF8
         e2Jw==
X-Gm-Message-State: AOJu0Ywn1aETBpNI3Qh0bNgNPw6Aq/SMaNBH7Pc3TcEJ0qCGLJMq41w9
	V7/JwZ5fNZwwEJi1TkJOsG79nq6uFKg+tWNF94DjAhoNR+bOQ1kq916RE6s9qk4Z0bflGCYWlnV
	GWdFamizANPQtWMSwrOm+j1uX/ZJRLW14QfXS
X-Gm-Gg: ASbGncs6iDWgwqv27XTg0LpjOBc5wulTFHaf/ILSVzu/FJhTKr6q9JCjEK48kU2UJGK
	gj82iK5LedynbMLdQpyEOZTq6/oTRwI8ZwAaRCcD8G+o4t1L+heDUv+X3U20S948sk0vTXL15kC
	evQo7EdXfhmL3qVi5z7Snr9IRhNi0jigHGHNoOxd3qZwMsDAHzmnu1wpRuSHxv
X-Google-Smtp-Source: AGHT+IEYjRvE6PlVymRHJJQ7Gf6ST+yoBuVka0SKzQN0kSSqNcqHK+deaqC8x7aHlUD5vU8KWxzuGppBJ9gZoBtjFZE=
X-Received: by 2002:a17:906:c106:b0:ad2:28f9:7dc8 with SMTP id
 a640c23a62f3a-ad4f751af0emr103363566b.59.1747173400790; Tue, 13 May 2025
 14:56:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512215929.2098240-1-ctshao@google.com> <aCOlViKRwS0kE0tg@x1> <aCOl5ep67uTeGVmm@x1>
In-Reply-To: <aCOl5ep67uTeGVmm@x1>
From: Chun-Tse Shao <ctshao@google.com>
Date: Tue, 13 May 2025 14:56:28 -0700
X-Gm-Features: AX0GCFudFRAZHZW8-nxTXKuoYdOS9e5fgp4rg2CJgkbrCWU4aOY4LUEu1tsOqLM
Message-ID: <CAJpZYjUBiCw2ApT0oeYN9nWW-orgxFP7dNt-aNUO9HMQY5WAnA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Fix incorrect counts when count the same uncore
 event multiple times
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, james.clark@linaro.org, howardchu95@gmail.com, 
	weilin.wang@intel.com, yeoreum.yun@arm.com, linux@treblig.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Arnaldo, sorry for my mistake. Please check the v4 patchset:
lore.kernel.org/20250513215401.2315949-1-ctshao@google.com

-CT


On Tue, May 13, 2025 at 1:04=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Tue, May 13, 2025 at 05:02:33PM -0300, Arnaldo Carvalho de Melo wrote:
> > On Mon, May 12, 2025 at 02:50:29PM -0700, Chun-Tse Shao wrote:
> > > Let's take a look an example, the machine is SKX with 6 IMC devices.
> > >
> > >   perf stat -e clockticks,clockticks -I 1000
> > >   #           time             counts unit events
> > >        1.001127430      6,901,503,174      uncore_imc_0/clockticks/
> > >        1.001127430      3,940,896,301      uncore_imc_0/clockticks/
> > >        2.002649722        988,376,876      uncore_imc_0/clockticks/
> > >        2.002649722        988,376,141      uncore_imc_0/clockticks/
> > >        3.004071319      1,000,292,675      uncore_imc_0/clockticks/
> > >        3.004071319      1,000,294,160      uncore_imc_0/clockticks/
> > >
> > > 1) The events name should not be uniquified.
> > > 2) The initial count for the first `clockticks` is doubled.
> > > 3) Subsequent count only report for the first IMC device.
> > >
> > > The first patch fixes 1) and 3), and the second patch fixes 2).
> >
> > So, after having just the first patch applied I'm getting:
> >
> >   CC      /tmp/build/perf-tools-next/util/bpf-filter-flex.o
> > util/parse-events.c: In function =E2=80=98__parse_events=E2=80=99:
> > util/parse-events.c:2270:25: error: implicit declaration of function =
=E2=80=98evlist__uniquify_name=E2=80=99; did you mean =E2=80=98evlist__uniq=
uify_evsel_names=E2=80=99? [-Wimplicit-function-declaration]
> >  2270 |                         evlist__uniquify_name(evlist);
> >       |                         ^~~~~~~~~~~~~~~~~~~~~
> >       |                         evlist__uniquify_evsel_names
> > make[4]: *** [/home/acme/git/perf-tools-next/tools/build/Makefile.build=
:85: /tmp/build/perf-tools-next/util/parse-events.o] Error 1
> > make[4]: *** Waiting for unfinished jobs....
> > make[3]: *** [/home/acme/git/perf-tools-next/tools/build/Makefile.build=
:142: util] Error 2
> > make[2]: *** [Makefile.perf:798: /tmp/build/perf-tools-next/perf-util-i=
n.o] Error 2
> > make[2]: *** Waiting for unfinished jobs....
> >
> >
> >   CC      /tmp/build/perf-tools-next/pmu-events/pmu-events.o
> >   LD      /tmp/build/perf-tools-next/pmu-events/pmu-events-in.o
> > make[1]: *** [Makefile.perf:290: sub-make] Error 2
> > make: *** [Makefile:119: install-bin] Error 2
> > make: Leaving directory '/home/acme/git/perf-tools-next/tools/perf'
> > =E2=AC=A2 [acme@toolbx perf-tools-next]$
> > =E2=AC=A2 [acme@toolbx perf-tools-next]$
> > =E2=AC=A2 [acme@toolbx perf-tools-next]$
> > =E2=AC=A2 [acme@toolbx perf-tools-next]$
> > =E2=AC=A2 [acme@toolbx perf-tools-next]$
> > =E2=AC=A2 [acme@toolbx perf-tools-next]$
> > =E2=AC=A2 [acme@toolbx perf-tools-next]$
> > =E2=AC=A2 [acme@toolbx perf-tools-next]$ git log --oneline -3
> > 6ffcaec3ac0d055a (HEAD) perf evlist: Make uniquifying counter names con=
sistent
> > 4102ff8b1fdaa588 perf metricgroup: Binary search when resolving referre=
d to metrics
> > 754baf426e099fbf perf pmu: Change aliases from list to hashmap
> > =E2=AC=A2 [acme@toolbx perf-tools-next]$
> >
> > When test building the second patch, it builds, so I'm now looking if
> > you used things from the future or if the second patch removes the
> > problem.
>
> At that point:
>
> util/parse-events.c: In function =E2=80=98__parse_events=E2=80=99:
> util/parse-events.c:2270:25: error: implicit declaration of function =E2=
=80=98evlist__uniquify_name=E2=80=99; did you mean =E2=80=98evlist__uniquif=
y_evsel_names=E2=80=99? [-Wimplicit-function-declaration]
>  2270 |                         evlist__uniquify_name(evlist);
>       |                         ^~~~~~~~~~~~~~~~~~~~~
>       |                         evlist__uniquify_evsel_names
> make[4]: *** [/home/acme/git/perf-tools-next/tools/build/Makefile.build:8=
5: /tmp/build/perf-tools-next/util/parse-events.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
>   LD      /tmp/build/perf-tools-next/util/scripting-engines/perf-util-in.=
o
> make[3]: *** [/home/acme/git/perf-tools-next/tools/build/Makefile.build:1=
42: util] Error 2
> make[2]: *** [Makefile.perf:798: /tmp/build/perf-tools-next/perf-util-in.=
o] Error 2
> make[1]: *** [Makefile.perf:290: sub-make] Error 2
> make: *** [Makefile:119: install-bin] Error 2
> make: Leaving directory '/home/acme/git/perf-tools-next/tools/perf'
> =E2=AC=A2 [acme@toolbx perf-tools-next]$
> =E2=AC=A2 [acme@toolbx perf-tools-next]$ git grep evlist__uniquify_name
> tools/perf/util/parse-events.c:                 evlist__uniquify_name(evl=
ist);
> =E2=AC=A2 [acme@toolbx perf-tools-next]$
>
> So its the later, the second patch builds because:
>
> =E2=AC=A2 [acme@toolbx perf-tools-next]$ git rebase --continue
> Stopped at ed3b26e31f42d1e4...  perf parse-events: Use wildcard processin=
g to set an event to merge into
> You can amend the commit now, with
>
>   git commit --amend
>
> Once you are satisfied with your changes, run
>
>   git rebase --continue
> =E2=AC=A2 [acme@toolbx perf-tools-next]$ git grep evlist__uniquify_name
> =E2=AC=A2 [acme@toolbx perf-tools-next]$ git show | grep evlist__uniquify=
_name
> -                       evlist__uniquify_name(evlist);
> =E2=AC=A2 [acme@toolbx perf-tools-next]$
>
> That function isn't there anymore.
>
> Please try to fix this and build it patch by patch so that we don't
> introduce bisection breakage patches.
>
> Thanks,
>
> - Arnaldo
