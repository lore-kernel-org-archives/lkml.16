Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17941A933
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 17:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747590366; cv=none; b=lljjtVOWazt1vtx84ItkWW2nhK/MrYwBYd9cmXmiKGtOiERAlReO7Yme8OfKtTYV3/xyXdZQ/6d6nEbMXpmD6LrVr2W11hvezxOKjvQGK6PGDADcLbNSjqoTAql5UbjtP6wStaDSnxjjOdNTYmn9V7iwh9DyeZCDSVdEyfGsK/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747590366; c=relaxed/simple;
	bh=CqQXhcuaV3YPlO3/nXymOWII1imAvM2bGDiijCgGmG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dD1/7WL8OfBMOWF7at3essO6xf6Os8M/pJJcWmODp5OkpgVTDAJJpx441wg1OHkQSGSSBVfAh6LHyXVAb3UmZGUSpUYhG9vpOeVUn0rWqv49jmyQ+3+EpYITncnCDgEceZKfGr73yEBNZSOmo/bgJ3rwCeBdHIHxRhc6fiSnrSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e0eW7I5i; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e0eW7I5i"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3d96836c1c2so339495ab.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 10:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747590364; x=1748195164; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tq6BJICevICy+8NLXEWZ5sLSE5pdxMQLnEAjqPMDfl8=;
        b=e0eW7I5ijV5nemcHJy+aH41VvDYqpbc7btT7KQ0eyqJ70JPVqBOvhUhVd4NDjojr2k
         KSbnkObdAGRyX6PJmRo/Ze2+5sFzGtSQ05m1pbqlLoIcj9c+xx64sqBJ52g3ouya3OEC
         /1f/B16nnQhYEc4bK6Yqd3Iaz9BMNvPQXxpVVuN6Tr9hBt8sbjJ63BJj4sYLHFaZgqIq
         ydxdZgACltp3ii3j7fQugX35hsKJLnd5kScp+HCWYI8rHYruCAxV3LHmR6Y7zDP3fWEx
         foAoMjNM+SWOqNBYtz27gLbHnBt3IjndGVVAr3r38xdzHvnm7D2zk43km3ztSFYWzgBC
         Os7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747590364; x=1748195164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tq6BJICevICy+8NLXEWZ5sLSE5pdxMQLnEAjqPMDfl8=;
        b=hZ2uz+OHj5VWFosa/CzBuF10LlJsDGxMT13dZXiirj0oI6hKFcRUfzJOS2mvFBPZeM
         29HJpolmzYei9bsZ9YkNAiVkTgeRzqc/ZFYjVsQlQycljCZhzLm11lReEj8gme9NBdBD
         eo7msQWSqp+fblomtzjSY8sYxgv5yeYwWiJ9ns0zw0gtQJ3nQqr1jq4VmzQ+koRYmzLX
         reGt7AfFmOJh9Yehgl6xgnk9zGJyYlsLcaX5ObkqGs1QV80F55mLbrQLOOLnMNex6Fir
         xbwVaPZnzPlZEwvLznvFW6Zd4M90OhmO0ml+Aaw23F4ooBuhO1z7kzAreSsh2dNE3VVr
         YhUA==
X-Forwarded-Encrypted: i=1; AJvYcCXZ+60pUBVZzFEuHK1temXQ6cU0sBArgb2SZIU4sp6cCrwz4FFZfnkQ/xwLGIzCuIkX1skYooCGhf+xszs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4DQbNu9Hc224ugcwy7N8W0wBU7bBYqWI1D1Gq9ZMtI8OzlhgX
	9Y/0FibGAY/f2/umXx5dOF8eBBIUOghfovyEfcz8oDcDPgWkEpEDW2iwyQL0Ys3V8/mdJ7woN8J
	oeDhyHytsdonnOwOhxjZ7FEAF/4OI9bO6opt5FuYl
X-Gm-Gg: ASbGncscXpNt8Afe4awTVNFBN4phXxosfeJ2BBb/GX4/K6Hd2adMUvIjgnUa87sQbXD
	7eji4fn8b4VXgJqDaeW4kX78V3wh8OYno53CxiJ/HGdA+EueYVokn79Zn8keVwV5vZZRaYkqyMf
	NLf5AOx3bp5ruGnnfDAHOxQtEKGGfrPWDkOA==
X-Google-Smtp-Source: AGHT+IGvvhnQ9pjRVSnXeb2vGemb9gcHDqJ6g1rDqhBp7CDQFxYf8B3e9Lao4IFAEVvWVtZGDolYIzy1n58NQyME0Ig=
X-Received: by 2002:a05:6e02:174f:b0:3da:7c3f:22d6 with SMTP id
 e9e14a558f8ab-3dc5d6162c7mr3928195ab.22.1747590363941; Sun, 18 May 2025
 10:46:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515181417.491401-1-irogers@google.com> <96c8fae8-b8f9-4094-b03a-9dba3ca234c2@linux.intel.com>
 <CAP-5=fVDF4-qYL1Lm7efgiHk7X=_nw_nEFMBZFMcsnOOJgX4Kg@mail.gmail.com> <aCoUMOVRjCr_t0ae@google.com>
In-Reply-To: <aCoUMOVRjCr_t0ae@google.com>
From: Ian Rogers <irogers@google.com>
Date: Sun, 18 May 2025 10:45:52 -0700
X-Gm-Features: AX0GCFuhwLE8uKAEI-NPKhg3vYsEZFq_Vsn2Bb03waqk9pF--XleBBzmGZNbfRE
Message-ID: <CAP-5=fXnvRLiGmV7rr2H8A2Hj7HDE9m+B6Qn0areRXBhz-tK+Q@mail.gmail.com>
Subject: Re: [PATCH v3] perf pmu intel: Adjust cpumaks for sub-NUMA clusters
 on graniterapids
To: Namhyung Kim <namhyung@kernel.org>
Cc: "Liang, Kan" <kan.liang@linux.intel.com>, Weilin Wang <weilin.wang@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 18, 2025 at 10:09=E2=80=AFAM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> Hello,
>
> On Thu, May 15, 2025 at 03:35:41PM -0700, Ian Rogers wrote:
> > On Thu, May 15, 2025 at 2:01=E2=80=AFPM Liang, Kan <kan.liang@linux.int=
el.com> wrote:
> > >
> > > On 2025-05-15 2:14 p.m., Ian Rogers wrote:
> > > > On graniterapids the cache home agent (CHA) and memory controller
> > > > (IMC) PMUs all have their cpumask set to per-socket information. In
> > > > order for per NUMA node aggregation to work correctly the PMUs cpum=
ask
> > > > needs to be set to CPUs for the relevant sub-NUMA grouping.
> > > >
> > > > For example, on a 2 socket graniterapids machine with sub NUMA
> > > > clustering of 3, for uncore_cha and uncore_imc PMUs the cpumask is
> > > > "0,120" leading to aggregation only on NUMA nodes 0 and 3:
> > > > ```
> > > > $ perf stat --per-node -e 'UNC_CHA_CLOCKTICKS,UNC_M_CLOCKTICKS' -a =
sleep 1
> > > >
> > > >  Performance counter stats for 'system wide':
> > > >
> > > > N0        1    277,835,681,344      UNC_CHA_CLOCKTICKS
> > > > N0        1     19,242,894,228      UNC_M_CLOCKTICKS
> > > > N3        1    277,803,448,124      UNC_CHA_CLOCKTICKS
> > > > N3        1     19,240,741,498      UNC_M_CLOCKTICKS
> > > >
> > > >        1.002113847 seconds time elapsed
> > > > ```
> > > >
> > > > By updating the PMUs cpumasks to "0,120", "40,160" and "80,200" the=
n
> > > > the correctly 6 NUMA node aggregations are achieved:
> > > > ```
> > > > $ perf stat --per-node -e 'UNC_CHA_CLOCKTICKS,UNC_M_CLOCKTICKS' -a =
sleep 1
> > > >
> > > >  Performance counter stats for 'system wide':
> > > >
> > > > N0        1     92,748,667,796      UNC_CHA_CLOCKTICKS
> > > > N0        0      6,424,021,142      UNC_M_CLOCKTICKS
> > > > N1        0     92,753,504,424      UNC_CHA_CLOCKTICKS
> > > > N1        1      6,424,308,338      UNC_M_CLOCKTICKS
> > > > N2        0     92,751,170,084      UNC_CHA_CLOCKTICKS
> > > > N2        0      6,424,227,402      UNC_M_CLOCKTICKS
> > > > N3        1     92,745,944,144      UNC_CHA_CLOCKTICKS
> > > > N3        0      6,423,752,086      UNC_M_CLOCKTICKS
> > > > N4        0     92,725,793,788      UNC_CHA_CLOCKTICKS
> > > > N4        1      6,422,393,266      UNC_M_CLOCKTICKS
> > > > N5        0     92,717,504,388      UNC_CHA_CLOCKTICKS
> > > > N5        0      6,421,842,618      UNC_M_CLOCKTICKS
> > >
> > > Is the second coloum  the number of units?
> > > If so, it's wrong.
> > >
> > > On my GNR with SNC-2, I observed the similar issue.
> > >
> > > $ sudo ./perf stat -e 'UNC_M_CLOCKTICKS' --per-node -a sleep 1
> > >  Performance counter stats for 'system wide':
> > >
> > > N0        0      6,405,811,284      UNC_M_CLOCKTICKS
> > > N1        1      6,405,895,988      UNC_M_CLOCKTICKS
> > > N2        0      6,152,906,692      UNC_M_CLOCKTICKS
> > > N3        1      6,063,415,630      UNC_M_CLOCKTICKS
> > >
> > > It's supposed to be 4?
> >
> > Agreed it is weird, but it is what has historically been displayed.
> > The number is the aggregation number:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-nex=
t.git/tree/tools/perf/util/stat-display.c?h=3Dperf-tools-next#n307
> > which comes from:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-nex=
t.git/tree/tools/perf/util/stat-display.c?h=3Dperf-tools-next#n135
> > which comes from:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-nex=
t.git/tree/tools/perf/util/stat.c?h=3Dperf-tools-next#n435
> > However, I think it is missing updates from:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-nex=
t.git/tree/tools/perf/util/stat.c?h=3Dperf-tools-next#n526
> > but there is a comment there saying "don't increase aggr.nr for
> > aliases" and all the uncore events are aliases. I don't understand
> > what the aggregation number is supposed to be, it is commented as
> > "number of entries (CPUs) aggregated":
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-nex=
t.git/tree/tools/perf/util/stat.h?h=3Dperf-tools-next#n26
> > it would seem to make sense in the CHA case with SNC3 and 42 evsels
> > per NUMA node that the value should be 42. Maybe Namhyung (who did the
> > evsel__merge_aggr_counters clean up) knows why it is this way but in
> > my eyes it just seems like something that has been broken for a long
> > time.
>
> I think it's the number of aggregated entries (FDs?).
>
> For core events, it's the number of CPUs for the given aggregation as it
> collects from all CPUs.  But it'd be confusing with uncore events which
> have cpumask to collect data from a few CPUs.
>
> On my laptop, --per-socket gives different numbers depending on the
> events/PMUs.
>
> For core events, it's 4.
>
>   $ sudo ./perf stat -a --per-socket -e cycles sleep 1
>
>    Performance counter stats for 'system wide':
>
>   S0        4        225,297,257      cycles
>
>          1.002581995 seconds time elapsed
>
> While uncore events give 1.
>
>   $ sudo ./perf stat -a --per-socket -e unc_mc0_rdcas_count_freerun sleep=
 1
>
>    Performance counter stats for 'system wide':
>
>   S0        1         23,665,510      unc_mc0_rdcas_count_freerun
>
>          1.002148012 seconds time elapsed

I think we're agreeing. I wonder that the intent of the aggregation
number is to make it so that you can work out an average from the
aggregated count. So for core PMUs you divide the count by the
aggregation number and get the average count per core (CPU?). If we're
getting an aggregated count of say uncore memory controller events
then it would make sense to me that we show the aggregated total and
the aggregation count is the number of memory controller PMUs, so we
can have an average per memory controller. This should line up with
using the number of file descriptors.

I think this isn't the current behavior, on perf v6.12:
```
$ sudo perf stat --per-socket -e data_read -a sleep 1

 Performance counter stats for 'system wide':

S0        1           2,484.96 MiB  data_read

       1.001365319 seconds time elapsed

$ sudo perf stat -A -e data_read -a sleep 1

 Performance counter stats for 'system wide':

CPU0             1,336.48 MiB  data_read [uncore_imc_free_running_0]
CPU0             1,337.06 MiB  data_read [uncore_imc_free_running_1]

       1.001049096 seconds time elapsed
```
so the aggregation number shows 1 but 2 events were aggregated together.

I think computing the aggregation number in the stat code is probably
wrong. The value should be constant for an evsel and aggr_cpu_id, it's
just computing it for an aggr_cpu_id is a pain due to needing topology
and/or PMU information. The code is ripe for refactoring. I'd prefer
not to do it as part of this change though which is altering a
particular Intel Granite Rapids issue.

Thanks,
Ian
