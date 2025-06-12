Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C24EBE5E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 03:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749698332; cv=none; b=rIDtVpW2UyP06Ht59fo4B7Ixhy0+c4YY5JS6l6BowwhlEb6Y0tZlpqm47vEY24E2Kiq2g+sR+UtML79pV1o3vdp6Pdqgw52VbZHaPnD34Y4FSjGcXeLf6RFQLYsnkmy/wsyQkhkVukH3YOK8MC6j83+E1zMfIfqxovxwfXM0sJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749698332; c=relaxed/simple;
	bh=oWbfHnwsDcvRiVIG47R2mARy4M+VrLkvjEzVd2T5AjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XDsT7WCj+LJbfl8X2weOv0I3K/1tr0L5B7mI5lxVYwGA4y/O1wV4xqmYWPfDahZb/RSVwx6tstqrgtAbExYlDB5EIam6YPOx2GmWklMnhHW+0Bbog80iC6jqbpGpQBiq3cipxYNDsaHXYOSclFlHNX/QGO4xmkJj+DrHGUnK35s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r9hxtVtG; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r9hxtVtG"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-604f5691bceso1337953a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 20:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749698329; x=1750303129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27e+okI1P/k74gjOKKGPL59BBptQM40JJvOeix/wj8E=;
        b=r9hxtVtG8999Fr0ziEUBUq13yRNkxwaIBgByEva/3ws1cu//72Xc9aKwro9kdOvc7i
         Pn3UBsu3W+cV4QXyftuSMDT2pNVbF+lbyzj7mVJZvSdoaLmYt0gLMi4hDugSxF28zsek
         A6knt3CHwa7TL/Ob+79EMIZ2m0ltoFxYm/WNRe6+8XTdX6/tWDtuX66qSRBsZ1nqvFrT
         IvfN8jaVWGl4GPsGfkGqLgYgAiCRYgSOYkEh6FuNExVqzbeoE6R3dor9tRUd/xo4Q04P
         C2LQR3YOUJkqH/x4Ng2niKm7KB3zNStNt8pMPnpMHe2GilZnYT4Jo0Ta2dD78Pts7u7D
         aSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749698329; x=1750303129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27e+okI1P/k74gjOKKGPL59BBptQM40JJvOeix/wj8E=;
        b=oflGNVaAYQ1ENgt1mv0c2SnS17LkA6T0z3R3S2YI9ppH+Ca0edqSD0wCRzU7jLrmw3
         SB1jG9HR02McwtbBT1JYOuxUGVPCPs79wnPc4U5Sg84AXNNCPOSQVVsLaySvB85b1ILu
         AF6MkJV7eUmlzv6SYq6NZf8BAUFsA2Gw5leWZ6K7SYjAZtVaNg9mO7FiiR7Blqr7Efkh
         AWMdoJ80DrRUoLgwkzltBli6b8jFHZikhidekN83KWHJNDeBPOHF6xr+2FjVapsZFmEZ
         NzAnC24kGu4ampBkUgOCK0AqatN8e4p7pymnl5UeZEnt1fZaTpeFk04MjSakosAarGlv
         SVSQ==
X-Gm-Message-State: AOJu0YxbxdSlowh+wOt0e/EtBY/l06jAWtpXIvkuh9ptWe16eFF+lu/P
	oQm6L22iZeS6DGDU5eBonAx05yAHLJj8VlD3V2hSOS8Y76AsUKI7kowBRZ3a5fXXoOuKzmeDYUj
	xbWDlh1aK3YMzbRERsheymcbcbxXytcQxAfGzU0Aq
X-Gm-Gg: ASbGncs8+IuS1u4eChB6wyG54onzJyyfM71nrIUJBE2TnoLOjUsAwKKPWWNXkvxqgCS
	Dx0VG1y8Fwj0Rjyo3HnpUoHIqFxh6YTMA2PJnQsfir/Vn5TQeSzk64RKmfczAsuAL1yElrS7V4m
	jHseFHq9+b51uSeSA9AAEbtcXvoHtudzEwpk8Zw5ZC1A==
X-Google-Smtp-Source: AGHT+IGT1nq+v77NrogwC2vPW2rtS/9YmduwTQIuRku0gKjRxiTwDFKSBdaGdBr+aOmizt1RnUe062KnCvjThW3LkfM=
X-Received: by 2002:a17:906:7308:b0:ad5:59ef:7f56 with SMTP id
 a640c23a62f3a-ade8979c4b6mr652471566b.48.1749698329198; Wed, 11 Jun 2025
 20:18:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611233239.3098064-1-ctshao@google.com> <CAP-5=fXyB3H-msiSUGH_XqOntJNv-A2X7DtjvZO=nLzJgdTY+A@mail.gmail.com>
In-Reply-To: <CAP-5=fXyB3H-msiSUGH_XqOntJNv-A2X7DtjvZO=nLzJgdTY+A@mail.gmail.com>
From: Chun-Tse Shao <ctshao@google.com>
Date: Wed, 11 Jun 2025 20:18:36 -0700
X-Gm-Features: AX0GCFtprLsA0M2y1ufqbSz5pPgmEtShGMa5HqQdjZurUUQoPCjBD3meKiFjhuM
Message-ID: <CAJpZYjVxs3yAS1-Uj_aQjkHGo+hRkHnwCbWxNsS4pT50-rvRPg@mail.gmail.com>
Subject: Re: [PATCH v1] perf stat: Fix uncore aggregation number
To: Ian Rogers <irogers@google.com>
Cc: linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for your test, Ian!

I wonder if `nr_pmus` makes sense, since the column would be shared
with multiple different pmus. WDYT?

-CT

On Wed, Jun 11, 2025 at 5:16=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> On Wed, Jun 11, 2025 at 4:36=E2=80=AFPM Chun-Tse Shao <ctshao@google.com>=
 wrote:
> >
> > Follow up:
> > lore.kernel.org/CAP-5=3DfVDF4-qYL1Lm7efgiHk7X=3D_nw_nEFMBZFMcsnOOJgX4Kg=
@mail.gmail.com/
> >
> > The patch adds unit aggregation during evsel merge the aggregated uncor=
e
> > counters.
> >
> > Tested on a 2-socket machine with SNC3, uncore_imc_[0-11] and
> > cpumask=3D"0,120"
> > Before:
> >   perf stat -e clockticks -I 1000 --per-socket
> >   #           time socket cpus             counts unit events
> >        1.001085024 S0        1         9615386315      clockticks
> >        1.001085024 S1        1         9614287448      clockticks
> >   perf stat -e clockticks -I 1000 --per-node
> >   #           time node   cpus             counts unit events
> >        1.001029867 N0        1         3205726984      clockticks
> >        1.001029867 N1        1         3205444421      clockticks
> >        1.001029867 N2        1         3205234018      clockticks
> >        1.001029867 N3        1         3205224660      clockticks
> >        1.001029867 N4        1         3205207213      clockticks
> >        1.001029867 N5        1         3205528246      clockticks
> > After:
> >   perf stat -e clockticks -I 1000 --per-socket
> >   #           time socket cpus             counts unit events
>
> I wonder if there is a better column heading than "cpus" given that
> these are imc PMUs.
>
> >        1.001022937 S0       12         9621463177      clockticks
> >        1.001022937 S1       12         9619804949      clockticks
> >   perf stat -e clockticks -I 1000 --per-node
> >   #           time node   cpus             counts unit events
> >        1.001029867 N0        4         3206782080      clockticks
> >        1.001029867 N1        4         3207025354      clockticks
> >        1.001029867 N2        4         3207067946      clockticks
> >        1.001029867 N3        4         3206871733      clockticks
> >        1.001029867 N4        4         3206199005      clockticks
> >        1.001029867 N5        4         3205525058      clockticks
> >
> > Suggested-by: Ian Rogers <irogers@google.com>
> > Signed-off-by: Chun-Tse Shao <ctshao@google.com>

Added Namhyung's ack from the previous email.
Acked-by: Namhyung Kim <namhyung@kernel.org>

>
> Tested-by: Ian Rogers <irogers@google.com>
>
> Thanks,
> Ian
>
> > ---
> >  tools/perf/util/stat.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/tools/perf/util/stat.c b/tools/perf/util/stat.c
> > index 355a7d5c8ab8..52266d773353 100644
> > --- a/tools/perf/util/stat.c
> > +++ b/tools/perf/util/stat.c
> > @@ -527,6 +527,7 @@ static int evsel__merge_aggr_counters(struct evsel =
*evsel, struct evsel *alias)
> >                 struct perf_counts_values *aggr_counts_b =3D &ps_b->agg=
r[i].counts;
> >
> >                 /* NB: don't increase aggr.nr for aliases */
> > +               ps_a->aggr[i].nr +=3D ps_b->aggr[i].nr;
> >
> >                 aggr_counts_a->val +=3D aggr_counts_b->val;
> >                 aggr_counts_a->ena +=3D aggr_counts_b->ena;
> > --
> > 2.50.0.rc1.591.g9c95f17f64-goog
> >
