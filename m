Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9095F86353
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 18:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743617727; cv=none; b=B7gv3QjtuHuTj6PGsUYgFFrPDfKU1sMpxkACrzqUpTpZI+uy45SODksmXd5GxfPg/kKOMBt64DMINExRtWNa74uPnc22CuH9mLSWtimb4fH8H1oysOtGfrb265PQOHeWqGnrKTOXObauXdoO/eDtzhGmMT/spNQPb945DMeWTDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743617727; c=relaxed/simple;
	bh=YbVw1bgCZBM/8Ivthj91i0k+tWYSbUMBaUUe4eP2L0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wc6e/1tAp8dIHImo4ZQVFLbSfVLwyeVWfj5/JxDhefOmAqYmsMAPC+jlZldGldCbmmCVrBfUvtlWni6cSa8r9q15S6OhegJ/KuNJ2M1MXtaWSbQomuMg2HfMgF1BO6U3LKPp8C9WihTj4lm359GoUF5cbT523TgfKvcX4b55jnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xVBKCsDz; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xVBKCsDz"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2242ac37caeso195475ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 11:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743617725; x=1744222525; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkpVgtqumussxG6Af6cXfWN7sUk6r8XQdfsIxt/L8BM=;
        b=xVBKCsDzm2UAgYMto08Js/T2zWdGqOwZXN4NAfYly+e3j8cCRor2FdLRsL6b1M232p
         kDYnKJ5ZAknuxk/bHPpETJuzaJy9FxrBtI89obrORyceCjkW+BijrBh5Z+6mG7CB+8BK
         4skq4gqUJ+RAVBZJYWlZImMsvuGxBAkX/VrWjeVm+9haWzl2zfPblU10rGCSAspwhLgo
         IkAeROjuWny22ocpXphICW5TI5XERDWH3Ri2c2EUlrrA3/6LamtycCFSDBEJQ+IqBD5q
         y33Fcbd29BdZaMYz91g8n2zTjyAgdF64UeNfsEh65MB8chBh6brUmtwbV6fwLjVHPLdy
         rRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743617725; x=1744222525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IkpVgtqumussxG6Af6cXfWN7sUk6r8XQdfsIxt/L8BM=;
        b=pNOWnO8N6OVd0bD39/cGHXn7ANja/eart8ieMWEA/4nj8+bloxeSwxsSn4HF8L9m8n
         iweK27PA8its0E47TfsHhjaGA6/TW3yOOV6n4qAt9oR3frrkwrpylOxcusJlk1qy1vre
         vWrsVlb8pxNPBrII5S8pt7e8UzGN1a8QWtB6Dh8O5fN1ceJ0Pi93th9Z/LUnCsubb9s9
         ZzHN7PyscvnLtI9kS/5OPxoW9qIbALn09JIFtFxRoVUwl2uHzBOYr5cxTEVBnbQUNUVq
         almgB2wLi502LXRnDnL3QeJptAzQWe9ae4Vm1TUhDzj88FHozWFBmvGc2RMJV/tAjKa7
         QANg==
X-Forwarded-Encrypted: i=1; AJvYcCW2YxA9590be02X2HjXuGv4MbBLU0dx17/3aDrcQMpD8DpDjMGV8GeVRM0K5+q3JKH5C78JemyAshEYNmk=@vger.kernel.org
X-Gm-Message-State: AOJu0YycZG5ZFa8+K0JwfWiei0c/4ZO310R1pwnLiUU9UwvRn7u0MbqN
	6vhy0rQYhvJ9WhTcNiEdde8GUJNTZAotOvZvoEAeqAKOCUHfjnTiv3inYJeP5rD019AOe2CSVit
	xncH8wkJsB8P0kTFEbUwOGiSzC0DsoNW9Yn0B
X-Gm-Gg: ASbGnct2n/DUVMXlrVjbfEbN+ivScL6atBStY1bIPc/EnB3lma6wyZrCPwlJSP7HT+v
	9+wFWkCvBCS1oi9HxV4QWSrRf7Lg5yAoalT7RA3ODrkObrjkfG+rlh2AVn9gdGIYCFwJS7boPmM
	YMnuI1APCWwHUxfTYXdgIHLQGTBJdY4tei2H+eM/k1XmLXmp7yD0HoAQ==
X-Google-Smtp-Source: AGHT+IHnbca1Y9vyZMDDL+SMwwosmZ7ZcbHHIyClQIMXHMkZahyXmx37xfgXXOa2yZOv017YzZiS5I70nAnBrVyADdM=
X-Received: by 2002:a17:902:b183:b0:21d:dca4:21ac with SMTP id
 d9443c01a7336-22977502449mr183555ad.6.1743617724455; Wed, 02 Apr 2025
 11:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402164720.3847573-1-irogers@google.com> <20250402164720.3847573-6-irogers@google.com>
 <6ba85605-39ea-40e0-a6f6-379deec30db7@linux.intel.com>
In-Reply-To: <6ba85605-39ea-40e0-a6f6-379deec30db7@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 2 Apr 2025 11:15:13 -0700
X-Gm-Features: AQ5f1JraLvZ-cTYtm5Av7f4N1Vg6zyqVG__idpn80RcGPHYwPd0MJMvz_jz6_yU
Message-ID: <CAP-5=fXhpx7O-BRLaaCpiXaG+vdcD+s8jpBJwzk3qptFRXsZEg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] perf parse-events: Add debug dump of evlist if reordered
To: "Liang, Kan" <kan.liang@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Howard Chu <howardchu95@gmail.com>, 
	Dominique Martinet <asmadeus@codewreck.org>, Levi Yun <yeoreum.yun@arm.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Andi Kleen <ak@linux.intel.com>, 
	James Clark <james.clark@linaro.org>, Weilin Wang <weilin.wang@intel.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 10:52=E2=80=AFAM Liang, Kan <kan.liang@linux.intel.c=
om> wrote:
>
>
>
> On 2025-04-02 12:47 p.m., Ian Rogers wrote:
> > Add debug verbose output to show how evsels were reordered by
> > parse_events__sort_events_and_fix_groups. For example:
> > ```
> > $ perf record -v -e '{instructions,cycles}' true
> > Using CPUID GenuineIntel-6-B7-1
> > WARNING: events were regrouped to match PMUs
> > evlist after sorting/fixing: '{cpu_atom/instructions/,cpu_atom/cycles/}=
,{cpu_core/instructions/,cpu_core/cycles/}'
> > ```
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/util/parse-events.c | 16 +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> >
> > diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-eve=
nts.c
> > index 5152fd5a6ead..0f8fd5bee3a7 100644
> > --- a/tools/perf/util/parse-events.c
> > +++ b/tools/perf/util/parse-events.c
> > @@ -28,6 +28,7 @@
> >  #include "util/evsel_config.h"
> >  #include "util/event.h"
> >  #include "util/bpf-filter.h"
> > +#include "util/stat.h"
> >  #include "util/util.h"
> >  #include "tracepoint.h"
> >
> > @@ -2196,14 +2197,23 @@ int __parse_events(struct evlist *evlist, const=
 char *str, const char *pmu_filte
> >       if (ret2 < 0)
> >               return ret;
> >
> > -     if (ret2 && warn_if_reordered && !parse_state.wild_card_pmus)
> > -             pr_warning("WARNING: events were regrouped to match PMUs\=
n");
> > -
> >       /*
> >        * Add list to the evlist even with errors to allow callers to cl=
ean up.
> >        */
> >       evlist__splice_list_tail(evlist, &parse_state.list);
> >
> > +     if (ret2 && warn_if_reordered && !parse_state.wild_card_pmus) {
> > +             pr_warning("WARNING: events were regrouped to match PMUs\=
n");
> > +
> > +             if (verbose > 0) {
> > +                     struct strbuf sb =3D STRBUF_INIT;
> > +
> > +                     evlist__uniquify_name(evlist);
> > +                     evlist__format_evsels(evlist, &sb, 1024);
>
> Why is the size even less than the one in pr_err?
>
> The user probably prefer to get the complete list in the debug.

I thought the previous 2048 excessive but kept it for the previous
case to not change anything. If you are happier with 2048 here I don't
particularly mind, it is a lot to display in verbose output.

Thanks,
Ian

> Thanks,
> Kan> +                  pr_debug("evlist after sorting/fixing: '%s'\n", s=
b.buf);
> > +                     strbuf_release(&sb);
> > +             }
> > +     }
> >       if (!ret) {
> >               struct evsel *last;
> >
>
