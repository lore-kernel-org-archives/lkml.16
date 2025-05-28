Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0BD28E56D
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 18:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748455378; cv=none; b=g/0CWf1jB2WEGYOizNlnK+TzuIiQm/NGCQYs9b7kziVPcOTrY5ge9N6mf2IB7SPZx90iraoaInmUkRW/snHnby2RiYPrA4I15oonUWM4yyC6W/8K1nvUY7GvgL5JcViv1FOfROWoKriQQyPbfatNWNJAtMYGKpLwl5yUE8ajr7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748455378; c=relaxed/simple;
	bh=m4h+499vGYh+iYxijfsahqG0vZFEdsOg94f6d1R6aEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J+YaaVble0dnx2q/leZaU78w/0xdPULxJIbaUtegtRMNp3uvpHAx1XjCfzj9OuuWLvC74/Ff7j5Ig8QnH5OIo8fuHT1EHszTRQ6BluCOpz8aAfirM4ZyTuG65gajTchcyD97/n7o5rVAzXuUBDeWlkz6On6InVjyKRx/xCQTsMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yV7ogBkV; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yV7ogBkV"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3dc8897f64cso25595ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748455376; x=1749060176; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZwa7gPGfpqcfVjfPBpJgP+00qIL0eiwvLWJGKbrQm4=;
        b=yV7ogBkVSA7gEHPdaF+f0rHFiIfJHztong+rXRbKiSYnaNryKGZchS6odeVdA+gehc
         nPVKsORPw8fbus8DyDBeAN6f47RYpyK8EeXMNVNDOFtM0j2vGomhQprtZD268XrE0QSj
         BXA+BCnaNQx0n4+XD6PlN6mjI3jHYcarA7IjIkSFDrMyy7vY/wqXB9bE5hjbx6tHevnV
         0TGFW1vnRLNKaBx9R8K8jexqyukWFvMk7dS8vXktdKIW2eddw21jcqjXueYhr9d9olGC
         GsrT77JmiIgLvoWdcB8HE/HDKabEPRgFqkNR6sRVDyQeoB+K93stGsmaOklUYF3wwsCh
         sn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748455376; x=1749060176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZwa7gPGfpqcfVjfPBpJgP+00qIL0eiwvLWJGKbrQm4=;
        b=P9aWoeThTppiVZTv7K37WojRpV5I7xhgd9cdC3U93R9QwGYOV+JucmF34R7QYVO+sM
         U9s7LzZQwqS1bG4/O8dByFKiubDMZQfyE6JrpCMUpysirrEVdiE160T7+ZJCACJQotqO
         LKyDkAye9fPtrQ8wiffk9uYQrvdAmSEYnsmNWFcyP7b29nhiN1cIk3QiYjbHBebQNbUk
         /Da5CEw1Qq6u6CaOMCoWPsRf4c908vk8FO2Mdnl/LP1zy7k2Rfu13vsUYatsNUSBbOuo
         x3Sjth+qmrroPLk5fV4jhyOC9GepdoCkD0MLSRkFRLdq3g+n6igFZQBAKo1oKM0wgLAP
         Og5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwyVLphU5AX0QL+ENrEQ5aLiqMsVWvpgiJ//E1a22DW/dO6O/nI1VbdQvkOB2Jyx/eskkCu9hWnEKQV08=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8AW8nSXi260U1iu/PHm79MaHITs8cbCXwqGQ5wRX9YoKfAS/O
	CGRoiLL2g+p5zpEDPK6Sixj8gVV9a8ipqqutiPmSyZXeuinpZNxRWV5OMPnB4UzC3mKRX6UG2n9
	bXh0g4Dqcmh/XBGEuR2JrgSusrvlFrPT/o2ltHTqt
X-Gm-Gg: ASbGncvht7cxl0Y8goHzChZszHf0kw0bjuUCkhllM4XVloAFfwaecFZXB8YloSezGWL
	MwROZUHzmo5A5veFBJLjPqIJLWg1KAAwR7Rws44Bkh8460MlfR0SBXdzGuq4wtu6ljVkcagJSTr
	dzZqrA4VL3OukG0qaWsnt6Hmg4w/s2cyzCQ1A4AQSvbEK1agQ5dGgk9n0s0RRj+WgQgEJyYILv
X-Google-Smtp-Source: AGHT+IHXVQtYnSEhg9S6Ul4Dw2KI+kuRxxZduzNu/XhB4JQvv3y5qplcavKDXgnjzk+dDGCqQiJHpne8h1TEyjl/eck=
X-Received: by 2002:a05:6e02:1185:b0:3dc:7e19:fcc4 with SMTP id
 e9e14a558f8ab-3dd91bb281bmr133785ab.8.1748455375252; Wed, 28 May 2025
 11:02:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528032637.198960-1-irogers@google.com> <20250528032637.198960-5-irogers@google.com>
 <aDdNk1IOqtyM44AX@google.com>
In-Reply-To: <aDdNk1IOqtyM44AX@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 28 May 2025 11:02:44 -0700
X-Gm-Features: AX0GCFvrd4KaGrUHxBiOU6BspUaFU5sD2jWIH0NE1i9_H57R3df7_M2FSm5zBYI
Message-ID: <CAP-5=fUmrnOUOBWcypD=Q7bCSQ3HTnicRXhr8nmSRqcbZv7Mmw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] perf intel-tpebs: Avoid race when evlist is being deleted
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
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

On Wed, May 28, 2025 at 10:53=E2=80=AFAM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> Hi Ian,
>
> On Tue, May 27, 2025 at 08:26:34PM -0700, Ian Rogers wrote:
> > Reading through the evsel->evlist may seg fault if a sample arrives
> > when the evlist is being deleted. Detect this case and ignore samples
> > arriving when the evlist is being deleted.
> >
> > Fixes: bcfab08db7fb ("perf intel-tpebs: Filter non-workload samples")
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/util/intel-tpebs.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpeb=
s.c
> > index 4ad4bc118ea5..3b92ebf5c112 100644
> > --- a/tools/perf/util/intel-tpebs.c
> > +++ b/tools/perf/util/intel-tpebs.c
> > @@ -162,9 +162,17 @@ static bool is_child_pid(pid_t parent, pid_t child=
)
> >
> >  static bool should_ignore_sample(const struct perf_sample *sample, con=
st struct tpebs_retire_lat *t)
> >  {
> > -     pid_t workload_pid =3D t->evsel->evlist->workload.pid;
> > -     pid_t sample_pid =3D sample->pid;
> > +     pid_t workload_pid, sample_pid =3D sample->pid;
> >
> > +     /*
> > +      * During evlist__purge the evlist will be removed prior to the
> > +      * evsel__exit calling evsel__tpebs_close and taking the
> > +      * tpebs_mtx. Avoid a segfault by ignoring samples in this case.
> > +      */
> > +     if (t->evsel->evlist =3D=3D NULL)
> > +             return true;
> > +
> > +     workload_pid =3D t->evsel->evlist->workload.pid;
>
> I'm curious if there's a chance of TOCTOU race.  It'd certainly help
> the segfault but would this code prevent it completely?

Good point. I think the race is already small as it doesn't happen
without sanitizers for me.
Thinking about the evlist problem. When a destructor (evlist__delete)
it is generally assumed the code is being single threaded and in C++
clang's -Wthread-safety will ignore destructors for this reason
(annoying imo as it hides bugs). I don't see a good way to solve that
for the evlist and evsel for the TPEBS case without using reference
counting. Adding reference counts to evlist and evsel would be do-able
as we could use reference count checking, but it would be a large and
invasive change. Wdyt?

Thanks,
Ian

> Thanks,
> Namhyung
>
>
> >       if (workload_pid < 0 || workload_pid =3D=3D sample_pid)
> >               return false;
> >
> > --
> > 2.49.0.1238.gf8c92423fb-goog
> >
