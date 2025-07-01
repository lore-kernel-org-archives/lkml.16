Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33183275AFF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 17:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751389262; cv=none; b=MBZMbvyUFCFnqpWDzwVPyCg1iH3YqL5K3w2dqgjIefDeiZudBJtnN8kncYs6ly5yMkLEa2k4ViYQn6+T1icDTTa4eme+YQMP0BhZ6gNV0XEstT4EnkuG4vNkFyHfsCJhkDVKpT6iVnc/YZ71z6jxu1AgpVNIlnqMlcGW1rW9Af0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751389262; c=relaxed/simple;
	bh=bkXhikRamz3TYR+syj/QXhLIxFxYsmkj2lhNT1/lT2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VuYOhTl6bDXgBO9JwVp9VIMXryh2d9TTlD1YPVYpYx25QIEsVIuji8MWH1hcR/RxzRPZWESXQS7+bh8erVp0gZb5I6RvFj/iS5NloP4fkzW0/xiVG3CZROBO3ApLBfuIv+9xapkf8LXw7davU1vW43ijj8TiH27uxxgQ8JwNXaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1mZZ1iJc; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1mZZ1iJc"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3de210e6076so144785ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 10:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751389260; x=1751994060; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UgRjLg1bANNvxWkIL2D0B4OzAbnbrdTRnXpfNQyHPk=;
        b=1mZZ1iJcuXiwxxu2KJIZe6jQgJLWF45SuEuVtMpx1tXkdNBHoMpyZXGMGupfZOMSi1
         W15EbV7C+878rCvYlpGSsFQ7KLWtNNtIHB6p+KQwnqsR8lxboSWXu/YCH3+lrFwL73sG
         IIPIyfrarzsBzGaWua3ZNOpUiajqySbmXlqIMrsU862Uy34/d37T5HCLR3Pws6h8tREa
         X/nRZ+yivLwDZxx2c2fMTbJsvhiGCRcGUEHUGBIhV5MfURMATmD/e81OFlNcrlldFFvE
         PCjXoudkdr5XUlprWnh7ehREKnnkavMr1NkiDiUUUqrcPbeFFwHx1FouS5P+4KxTcftE
         nRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751389260; x=1751994060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/UgRjLg1bANNvxWkIL2D0B4OzAbnbrdTRnXpfNQyHPk=;
        b=gTbceb8AERa0jvjIAajz5lIGKu2LJa4+PK/NGNOB6qVlMK2x687Ili+vktbcmr5k+h
         DhCxMcwPkMXEBVAmRVdKF1aN+N/0jVSQhcvbY7ptzrsYviPyYHSjEJxua5QWZMd1pSkz
         AYke51PlW+sFRzaw7xik3vLXxNPLVG8aaT4tWun++V6igGBxDE59ACiaPTvX2VmBgdij
         eYBGwAXxT3++iyxb/t9OWJ4Lz+aELfRZi/LOQKOG+3m9HDeE4LlkIeDpKGZc1ZbtfQFy
         ZoxLqDzUKonCrSaU7jM0neilTCzdBOhDcXu5Qumb/NM+eKM7EnOvFCTn8vVJg6yuni7n
         /VlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKKenGyonNRbOsraP7tmGoleCU9h6mM6a1LtcwK4aRr0nxYi7Uij+/ZFpm7j7MgnJzlD48wdzpxBm2Gqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN0qzvnALRCsv0DDCr99fkPDhryR9nb0gIu+B7oQWf33WRv5pA
	mv7SzJ2lPv4mpP5ZKpLW+9c9ofce0zTCnd/je7KbQA2Znd6lz2RNqZM+Jkc79ruBEM9ftyNvY6b
	we66VfFnU4EjggsqI+76F4vCfd8S3ZZRKqWhExaql
X-Gm-Gg: ASbGncu5xFG0pK7kKxARc3vsKnWS1K8eAaFTlzqkEVaw1XfyZfMYmpK5B5MHCnH7Tj+
	X7Zq4fyUlwVK6zJLjv69ruDFnhq3bo5cV5mGfbkSnRNZOLyM47BUzEzOOJBjHxiAT5JvEuOZ9WZ
	sU2vOhyr7dc7nCXvjiKLgFVDH3DS5QFiMfFILWhB5lThuxmcGpQir/BZnKcs+H5GqUPXJDkuQ=
X-Google-Smtp-Source: AGHT+IEAhz64e+5NmGN5DM9cSM9FAys6CW3b3NwAestgSJtBnITuejAnC/VvbJqmG/3u6aIr/6ecA3b9nT+k3h8kfT8=
X-Received: by 2002:a05:6e02:4610:b0:3e0:51fc:6e8 with SMTP id
 e9e14a558f8ab-3e051fc0c97mr1053115ab.15.1751389259861; Tue, 01 Jul 2025
 10:00:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250628045017.1361563-1-irogers@google.com> <20250628045017.1361563-11-irogers@google.com>
 <aGN_wBXVt6YN4Itb@google.com>
In-Reply-To: <aGN_wBXVt6YN4Itb@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 1 Jul 2025 10:00:48 -0700
X-Gm-Features: Ac12FXz_X_5IipKr8vd50gwfTiNlhqt4RWPZaW22n1cB2CNPPqiGwCwVNqiqJs4
Message-ID: <CAP-5=fXVxykN_pyydC_8LtNO0wAOz2yZPhwYsThQhgR0QeSP+A@mail.gmail.com>
Subject: Re: [PATCH v5 10/23] perf session: Add an env pointer for the current perf_env
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Colin Ian King <colin.i.king@gmail.com>, Andi Kleen <ak@linux.intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Graham Woodward <graham.woodward@arm.com>, 
	Ilkka Koskinen <ilkka@os.amperecomputing.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Athira Rajeev <atrajeev@linux.ibm.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Li Huafei <lihuafei1@huawei.com>, 
	"Steinar H. Gunderson" <sesse@google.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Chun-Tse Shao <ctshao@google.com>, Yujie Liu <yujie.liu@intel.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Levi Yun <yeoreum.yun@arm.com>, 
	Howard Chu <howardchu95@gmail.com>, Weilin Wang <weilin.wang@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Matt Fleming <matt@readmodwrite.com>, 
	Veronika Molnarova <vmolnaro@redhat.com>, 
	=?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>, 
	Zixian Cai <fzczx123@gmail.com>, Steve Clevenger <scclevenger@os.amperecomputing.com>, 
	Ben Gainey <ben.gainey@arm.com>, Chaitanya S Prakash <chaitanyas.prakash@arm.com>, 
	Martin Liska <martin.liska@hey.com>, =?UTF-8?Q?Martin_Li=C5=A1ka?= <m.liska@foxlink.cz>, 
	Song Liu <song@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 11:27=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> On Fri, Jun 27, 2025 at 09:50:04PM -0700, Ian Rogers wrote:
> > Initialize to `&header.env`. This will later allow the env value to be
> > changed.
>
> I'm curious when it is changed.

Thanks for the reviews! I'll dig into them for v6. Looking at this one
I don't see a current use of the changed perf_session__env so I
suspect we can drop the change. I need to think about the lifetime of
header.env, use cases where have >1 env like perf inject (in vs out),
perf diff and what's going on with TUI in patch:
https://lore.kernel.org/lkml/20250628045017.1361563-12-irogers@google.com/

Thanks,
Ian

> Thanks,
> Namhyung
>
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/util/session.c | 3 ++-
> >  tools/perf/util/session.h | 2 ++
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
> > index b09d157f7d04..e39a1df7c044 100644
> > --- a/tools/perf/util/session.c
> > +++ b/tools/perf/util/session.c
> > @@ -156,6 +156,7 @@ struct perf_session *__perf_session__new(struct per=
f_data *data,
> >                            ordered_events__deliver_event, NULL);
> >
> >       perf_env__init(&session->header.env);
> > +     session->env =3D &session->header.env;
> >       if (data) {
> >               ret =3D perf_data__open(data);
> >               if (ret < 0)
> > @@ -2750,5 +2751,5 @@ int perf_session__dsos_hit_all(struct perf_sessio=
n *session)
> >
> >  struct perf_env *perf_session__env(struct perf_session *session)
> >  {
> > -     return &session->header.env;
> > +     return session->env;
> >  }
> > diff --git a/tools/perf/util/session.h b/tools/perf/util/session.h
> > index e7f7464b838f..088868f1004a 100644
> > --- a/tools/perf/util/session.h
> > +++ b/tools/perf/util/session.h
> > @@ -45,6 +45,8 @@ struct perf_session {
> >       struct perf_header      header;
> >       /** @machines: Machines within the session a host and 0 or more g=
uests. */
> >       struct machines         machines;
> > +     /** @env: The perf_env being worked with, either from a data file=
 or the host's. */
> > +     struct perf_env         *env;
> >       /** @evlist: List of evsels/events of the session. */
> >       struct evlist   *evlist;
> >       /** @auxtrace: callbacks to allow AUX area data decoding. */
> > --
> > 2.50.0.727.gbf7dc18ff4-goog
> >
