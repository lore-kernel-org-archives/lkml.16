Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B044210F59
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748465696; cv=none; b=ofJxmhcsejHBpcQEvo6KClQ8EoNOdy4Sum6/FGb9LykRufk8q70VheZ7FbgbhO2KQ0cY6gfOf0BkK8Gw1tGzzuvJJmIvZ62/nqgaN7CcNIPz2c0HjDPP0eKSUKoSd2XPcKx1pXTbD3eZ08PdKwLHpsp2XOfr00v6qqvvLJQCsFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748465696; c=relaxed/simple;
	bh=xIimBHEnubvI1RNUwaZk7mevQW+rVmfJnnmc1+Raeyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FyTp10A1ED+a1PC9VPyAHPc+bLmupW0JN4Q2X93otg9546S2YPh8GQcP/tkRO5uxDXoh09nkA8V4DNjEy1EZVFKg59IKxSTQlrLDcx6HY1DICODigsQJeDEDwbrm8IxN3fjguIKGB6IHju3rMT5Sjay+HKHlZWrYc7TePCZBzTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jn2aNi4r; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jn2aNi4r"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3da76aea6d5so9365ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748465693; x=1749070493; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdlOZCKDMArurVrblUluAnT3I/LqvljRBf10OHDKJk4=;
        b=jn2aNi4rVO703Zc/LD7t3DzprHI5LriYxPi/mtYtUDNhscDzefjhmdsOJl6A3jg07W
         KuhGpedMUUZdJk1ZcoTWmB3cwtjn2lMFkU87ACibnKufBRnIzmrX9BAgbNLDExzqjt+l
         EN9+D6ED9FzJPPyrv6AULbLcQ+1g/Z8LA+eIVZ3dxDlPxHLeLJKmTIzas7kP4qLKBe/c
         AxIiY51hSo3QyHBMJkhvHnRLG2ORsqALccbZ3FF5oadBuwbLw2VWul11Q8yaXIYiJkI/
         B9rGwCD0bnSq2VdYjQteWLKhBeBkH5CAx4Pjqgo4ig5oQSRv9GzuMILfjCfnbBquwacX
         GPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748465693; x=1749070493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdlOZCKDMArurVrblUluAnT3I/LqvljRBf10OHDKJk4=;
        b=NiwVsMMPtJtN5+L80DMiRRUVwpS1XV8UBjtgQ536+KbXYeU/aF0oOIlEaACdMkyBaI
         2cvUgzrNm0O+nTU2MsE6DKQgjARbj2ZeewFe6m2VTIr61Fml+eKSRxzd1L3Z2swiO9Pj
         mjjnmeJOr7GiVpBn+T40gsMl0tfHy/vPmcac/ozrQAznmW0942K6va18lO3FYXTx0Lam
         NsURbifg6Y05G0vvoyV/pa08674zo5pAWxfBsJKWyFTWOZCieJJI7sjehjmtmZqRbthB
         cHzjMpDpk/CQN2zWTo8tJtZN8dMSHwcWkM9NAn+MimT3t8MmOZu9knn1V7PX/Qu+q3zK
         YbOA==
X-Forwarded-Encrypted: i=1; AJvYcCXgO9qro1KPRg4H6w1RyKJ3wZHqmRp/Il2fvjvSVr0B2ial0Hexxa5DRXx9KajnDsIe0hBowleXC78rELw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr8MLNzttvKVKjRmcS+/vnslHnxNTKzWYvN2ym9GzxOHoTolzX
	QoSXI61QLSqTFohQLmP5RiumoC1TyKHHBy7ix3x1uWhvTuZ9+sgk1pxdWtPJnJWHM2S8qNS+R+M
	zGeOK2um1fTZRmIPsgoU/LOL1+RT14UDw0Zso5b+s
X-Gm-Gg: ASbGncvuP+PBIEoGHTECjy4u8i4YyDVJKhe6Kv5p5jFA32FHF8mzMqFz50IpvyP651z
	bJNh0GiLenVIzjHr0b/RwYolixaT5CjArtU89zbYmugE7eDyOZ8TXxvl1JKNaRkcnQsNDUMyp5V
	fGIPLt8FoQ0JxBU6lKDpRMEO66lMVYJ1AF0Nej8OHL0df6mKFZQQ6pAjm6OBCI9l+r9dm0Trgg
X-Google-Smtp-Source: AGHT+IEyvfYTw0mn4+GgJyNPW6570BQoAYmVlK7RXXKRPXSFk27gHSBw0DItHvVa99igwyW5RMtuN7/vqE0Y32dT4bU=
X-Received: by 2002:a05:6e02:2587:b0:3dc:6151:5903 with SMTP id
 e9e14a558f8ab-3dd91bb286bmr1022095ab.10.1748465693041; Wed, 28 May 2025
 13:54:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428213409.1417584-1-irogers@google.com> <20250428213409.1417584-6-irogers@google.com>
 <aDd06eK7fKFsFsVS@google.com>
In-Reply-To: <aDd06eK7fKFsFsVS@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 28 May 2025 13:54:41 -0700
X-Gm-Features: AX0GCFuQLXaMlCZS-eW1PxsDzne05baAUy2xOg-YY_seEoybSoBBpOObFNiHOm0
Message-ID: <CAP-5=fV-cLLpdyoqL8+Jrt3iYU7EbpZZDOyM1kBCc+54gA2Nzg@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] perf build-id: Mark DSO in sample callchains
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, 
	Li Huafei <lihuafei1@huawei.com>, "Steinar H. Gunderson" <sesse@google.com>, 
	James Clark <james.clark@linaro.org>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Andi Kleen <ak@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Zhongqiu Han <quic_zhonhan@quicinc.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	=?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Zixian Cai <fzczx123@gmail.com>, 
	Steve Clevenger <scclevenger@os.amperecomputing.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Martin Liska <martin.liska@hey.com>, 
	=?UTF-8?Q?Martin_Li=C5=A1ka?= <m.liska@foxlink.cz>, 
	Song Liu <song@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 1:41=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Mon, Apr 28, 2025 at 02:34:04PM -0700, Ian Rogers wrote:
> > Previously only the sample IP's map DSO would be marked hit for the
> > purposes of populating the build ID cache. Walk the call chain to mark
> > all IPs and DSOs.
>
> I think this is correct, but I'm afraid it'd also increase the processing
> time.  Do you happen to have any numbers?

It increases time spent processing the data file but to get a large
data file I had to run for multiple seconds and I struggled to get the
performance cost of this to be in the milliseconds (ie a tiny fraction
of the record time). Ultimately I found the change imperceptible and
couldn't think of a good command line to make it perceptible.

If the time is spent populating ~/.debug because more DSOs are marked
then this is fixing a bug and isn't a problem with the patch.

My personal opinion is that it is somewhat surprising `perf record` is
post-processing the perf.data file at all, and -B and -N would be my
expected defaults - just as --buildid-mmap implies --no-buildid (-B).
I didn't want to modify existing behaviors in these changes, however,
in this case I was just trying to make the existing behavior correct,
similar to fixing the same bug in `perf inject`.

Thanks,
Ian

> Thanks,
> Namhyung
>
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/util/build-id.c | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/perf/util/build-id.c b/tools/perf/util/build-id.c
> > index aa35dceace90..3386fa8e1e7e 100644
> > --- a/tools/perf/util/build-id.c
> > +++ b/tools/perf/util/build-id.c
> > @@ -42,10 +42,20 @@
> >
> >  static bool no_buildid_cache;
> >
> > +static int mark_dso_hit_callback(struct callchain_cursor_node *node, v=
oid *data __maybe_unused)
> > +{
> > +     struct map *map =3D node->ms.map;
> > +
> > +     if (map)
> > +             dso__set_hit(map__dso(map));
> > +
> > +     return 0;
> > +}
> > +
> >  int build_id__mark_dso_hit(const struct perf_tool *tool __maybe_unused=
,
> >                          union perf_event *event,
> >                          struct perf_sample *sample,
> > -                        struct evsel *evsel __maybe_unused,
> > +                        struct evsel *evsel,
> >                          struct machine *machine)
> >  {
> >       struct addr_location al;
> > @@ -63,6 +73,11 @@ int build_id__mark_dso_hit(const struct perf_tool *t=
ool __maybe_unused,
> >               dso__set_hit(map__dso(al.map));
> >
> >       addr_location__exit(&al);
> > +
> > +     sample__for_each_callchain_node(thread, evsel, sample, PERF_MAX_S=
TACK_DEPTH,
> > +                                     /*symbols=3D*/false, mark_dso_hit=
_callback, /*data=3D*/NULL);
> > +
> > +
> >       thread__put(thread);
> >       return 0;
> >  }
> > --
> > 2.49.0.901.g37484f566f-goog
> >
