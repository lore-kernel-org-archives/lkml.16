Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEC1153BD9
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 22:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749768974; cv=none; b=WgCNZnez/OoBpAphunyhUFibg5wuGERsPkgJEIoUe5XIBnsD/iec6UyEutzQiamHPgJRB1JRuM9UgeIcgPaC/tG3xWVQuXhCZ+nSwDLzQQ7BxJUpTf6rjT/bLO2Lbw7gxRxPuhCzLZJWIsEtafCD5XwteNkVd0yVTStt193nsVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749768974; c=relaxed/simple;
	bh=Jiw4lNt+dgmQpa94MwrbvDcNyxfGi5FH7juxU0sBHXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mh++o4TDDaKHXnffH9CkTNPxA5km6sLeSybjjrXaJmpRS+5iayd7oWJe8YboiKjKRaRRbo1ezFXpcs8xoe7l+lFrIlMRUunA+mRbenpyzJBVpaSo+1ybnTK/B1GFZV/z/XWinjPuzL8UBltCftRItQjKEtdOdQpC4kcinBeWJNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kf9/TeE5; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kf9/TeE5"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6071ac9dc3eso2611616a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749768970; x=1750373770; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4s+4tZ4UdwgPrThrnfOwIaYnPl8gTIzP7MXm01FET4=;
        b=kf9/TeE5utPplQpr58u9BX44wmiMyNRnK86i2XR92QWJshTfOYFl5k4ZcdUhqKZqLj
         mA0TFi3VL1OOhq4yQSZl/wV+3nU9kp+xChBxolW527LrWhdPRLWeTUSo2U0iB6FA0V7x
         kFFYTwpZEGIEf3OT3CQacZvXZa/CO76ITriQxplOisqYW8x7XFHRTIdd371H/UcQCowu
         Bk0lsBorWWI9O1WxgliNqxSSf6x5VBOBtUxMMGIHEgQwwsQ4dy5pCQbS8kFVBCtzaUjB
         dxddPAW+dtQALvEgVHMbrjbpyDCfblSEc/u3mD9xvpFGPHgKlokn5fol4Ch6mei1fL8q
         JaqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749768970; x=1750373770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4s+4tZ4UdwgPrThrnfOwIaYnPl8gTIzP7MXm01FET4=;
        b=Gh3wbYHHirqJg0Ylg/gikmmcSJVTQUhdkDKuVslIqceFDoT3c+rMzD00rSALqayTwv
         cg8DCKBjx5LT7vqGIriVI5sWe3WbtkqMX5YiwOm0Ja5oFgXV2N4O7Syr6rhqOT64DFob
         14XyTXKzPqg1tMnGEYZL4Hi0Yse4dVsFkd/vJ+3Vy9M4FkEVhSeA42FAYo+O5QmZtdN2
         YZowKgGvsqfbt9vOYkjVvQWcUb1+lXeu7jnyQFMDOC07Eex8+EBeHNeimt8vuIP2x5D3
         7da3x15xCPn5Gpr1Kyfe9gIiGWm0hw+uN8iC1qWUgVdQFDh5Dee36I5cdvMTy71v4J0i
         iE4w==
X-Gm-Message-State: AOJu0Yx+hHp3CVPnf1J4j16OCUO1himBiRc2W2qQUjo9fywkjul8ouJn
	vyxk/UJk1C7GVef7d7g4R1NLY0NcRqdCPYEG/BjpFtnSyCUCaujCq2FYRdzQmVlVM64zMUom77F
	/AJffq/gxbI6DA4/lzPIv2ql4wRudPoorqse2cEWs
X-Gm-Gg: ASbGncuf8fV5quYbIbkfhn7GP4MyscRa0NS0V82cNKx0gVfb5tZB10ygLVEmpKaQZVZ
	JLjS9zq138VMPl4TF/uSclaCznEksgDbkvLWz1TXJS2XgRoURu1uB4YqCZ5yW9SJaE6hBBTfOsH
	OrR2HBpcRK+jsViPqHzgnxv5WFyOCSK8nbbEIhwKcrhcdqp3U39QW0xeGi/z2DkEVLdJ+C/Iw=
X-Google-Smtp-Source: AGHT+IGFxBhbYomjhNyWT2ZAvl6IbMw2CRQO29wihDm8OaPcR+vaf0PqAsPFTJhXVi/PkYq5LhFGzW6B88P0f2OEbYo=
X-Received: by 2002:a17:907:1b04:b0:ade:32fa:7394 with SMTP id
 a640c23a62f3a-adec5cade15mr84921166b.35.1749768970292; Thu, 12 Jun 2025
 15:56:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611233239.3098064-1-ctshao@google.com> <CAP-5=fXyB3H-msiSUGH_XqOntJNv-A2X7DtjvZO=nLzJgdTY+A@mail.gmail.com>
 <CAJpZYjVxs3yAS1-Uj_aQjkHGo+hRkHnwCbWxNsS4pT50-rvRPg@mail.gmail.com> <CAP-5=fWvnALUJiHrb_xzHXjseD88HF7LExs4N_Okg+UguuXsXg@mail.gmail.com>
In-Reply-To: <CAP-5=fWvnALUJiHrb_xzHXjseD88HF7LExs4N_Okg+UguuXsXg@mail.gmail.com>
From: Chun-Tse Shao <ctshao@google.com>
Date: Thu, 12 Jun 2025 15:55:59 -0700
X-Gm-Features: AX0GCFtSIMlqg5rKAFSyl0q3VXJwmniN0QvIX3sWzwypACsultPp20GffeJkwYM
Message-ID: <CAJpZYjWUUbnNyBYXNSu_mmUrYLhNHHmdro8r08Xe0tN7nAanxg@mail.gmail.com>
Subject: Re: [PATCH v1] perf stat: Fix uncore aggregation number
To: Ian Rogers <irogers@google.com>
Cc: linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ian, I actually renamed it to `aggr_nr` in v2 patch so it should be
better aligned to json mode, which is using `aggregate-nunber`. But
anyway I think any name other than `cpus` is better.
v2 patch: lore.kernel.org/20250612225324.3315450-1-ctshao@google.com

Thanks,
CT


On Wed, Jun 11, 2025 at 10:12=E2=80=AFPM Ian Rogers <irogers@google.com> wr=
ote:
>
> On Wed, Jun 11, 2025 at 8:18=E2=80=AFPM Chun-Tse Shao <ctshao@google.com>=
 wrote:
> >
> > Thanks for your test, Ian!
> >
> > I wonder if `nr_pmus` makes sense, since the column would be shared
> > with multiple different pmus. WDYT?
>
> So each PMU in sysfs has a cpumask that specifies which CPUs perf
> should pass to perf_event_open. For example, on a two socket machine
> the cpumask will typically have the first CPU of each socket. If the
> cpumask (or cpus) file isn't present then the cpumask is implicitly
> all online CPUs. Given that the aggregation number is the number of
> CPUs in the cpumask multiplied by the number of PMUs, I think the most
> neutral name is probably "counters" possibly shortened down to "ctrs".
> I suspect others have better suggestions :-)
>
> Thanks,
> Ian
>
> > -CT
> >
> > On Wed, Jun 11, 2025 at 5:16=E2=80=AFPM Ian Rogers <irogers@google.com>=
 wrote:
> > >
> > > On Wed, Jun 11, 2025 at 4:36=E2=80=AFPM Chun-Tse Shao <ctshao@google.=
com> wrote:
> > > >
> > > > Follow up:
> > > > lore.kernel.org/CAP-5=3DfVDF4-qYL1Lm7efgiHk7X=3D_nw_nEFMBZFMcsnOOJg=
X4Kg@mail.gmail.com/
> > > >
> > > > The patch adds unit aggregation during evsel merge the aggregated u=
ncore
> > > > counters.
> > > >
> > > > Tested on a 2-socket machine with SNC3, uncore_imc_[0-11] and
> > > > cpumask=3D"0,120"
> > > > Before:
> > > >   perf stat -e clockticks -I 1000 --per-socket
> > > >   #           time socket cpus             counts unit events
> > > >        1.001085024 S0        1         9615386315      clockticks
> > > >        1.001085024 S1        1         9614287448      clockticks
> > > >   perf stat -e clockticks -I 1000 --per-node
> > > >   #           time node   cpus             counts unit events
> > > >        1.001029867 N0        1         3205726984      clockticks
> > > >        1.001029867 N1        1         3205444421      clockticks
> > > >        1.001029867 N2        1         3205234018      clockticks
> > > >        1.001029867 N3        1         3205224660      clockticks
> > > >        1.001029867 N4        1         3205207213      clockticks
> > > >        1.001029867 N5        1         3205528246      clockticks
> > > > After:
> > > >   perf stat -e clockticks -I 1000 --per-socket
> > > >   #           time socket cpus             counts unit events
> > >
> > > I wonder if there is a better column heading than "cpus" given that
> > > these are imc PMUs.
> > >
> > > >        1.001022937 S0       12         9621463177      clockticks
> > > >        1.001022937 S1       12         9619804949      clockticks
> > > >   perf stat -e clockticks -I 1000 --per-node
> > > >   #           time node   cpus             counts unit events
> > > >        1.001029867 N0        4         3206782080      clockticks
> > > >        1.001029867 N1        4         3207025354      clockticks
> > > >        1.001029867 N2        4         3207067946      clockticks
> > > >        1.001029867 N3        4         3206871733      clockticks
> > > >        1.001029867 N4        4         3206199005      clockticks
> > > >        1.001029867 N5        4         3205525058      clockticks
> > > >
> > > > Suggested-by: Ian Rogers <irogers@google.com>
> > > > Signed-off-by: Chun-Tse Shao <ctshao@google.com>
> >
> > Added Namhyung's ack from the previous email.
> > Acked-by: Namhyung Kim <namhyung@kernel.org>
> >
> > >
> > > Tested-by: Ian Rogers <irogers@google.com>
> > >
> > > Thanks,
> > > Ian
> > >
> > > > ---
> > > >  tools/perf/util/stat.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/tools/perf/util/stat.c b/tools/perf/util/stat.c
> > > > index 355a7d5c8ab8..52266d773353 100644
> > > > --- a/tools/perf/util/stat.c
> > > > +++ b/tools/perf/util/stat.c
> > > > @@ -527,6 +527,7 @@ static int evsel__merge_aggr_counters(struct ev=
sel *evsel, struct evsel *alias)
> > > >                 struct perf_counts_values *aggr_counts_b =3D &ps_b-=
>aggr[i].counts;
> > > >
> > > >                 /* NB: don't increase aggr.nr for aliases */
> > > > +               ps_a->aggr[i].nr +=3D ps_b->aggr[i].nr;
> > > >
> > > >                 aggr_counts_a->val +=3D aggr_counts_b->val;
> > > >                 aggr_counts_a->ena +=3D aggr_counts_b->ena;
> > > > --
> > > > 2.50.0.rc1.591.g9c95f17f64-goog
> > > >
