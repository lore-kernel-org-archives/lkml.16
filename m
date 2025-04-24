Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8EF290BC9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 22:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745534313; cv=none; b=d30VGwZwrvRDXXcnSYwqcFBA5U5BshYosfMXAs67Uut3IkQiA+6qMiWaq8O1/Vc6d4MN/LgiLJ73kvGMa0geTrCtsEpqjq2JE0feMcV5t/ExSk3JV43HCcpG5QlLhkKX6hzDBU97BA6hBKWgxhTNKtM+VPioaafxzW2r+754+RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745534313; c=relaxed/simple;
	bh=SuVGuLPWXRTw2XBo3wLqRg4mWBMzlan/Fdd/ceeK+m0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uVBfituQkcbNx+c9y3IDmw2VyR+0wt67ypG/1yQZnwBeaVPh57+vvX6Aa5UlGaZEVAsl0ih+Mt1aPysYRqhltRFYBDjzYGQxaPMN3JaUsYRAGCM7dxJK7lIqEmlk8ZZJMEbdbySEZjCPdrGly7Y84K5OFdflOcTW7b+nPCaAqDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DjF4h2bx; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DjF4h2bx"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so250612666b.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 15:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745534309; x=1746139109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZs76uIchCrwsJqCT+S4BB1Qj4mv/z4p+yQgfmNcgZA=;
        b=DjF4h2bxiQf7IzaFxoAzQ/OxMmKrJyXftVIgMGXX5e3e7SQd69cF/4CL7dfmS6Cfpa
         bnE2aitQ8hOlcB6Lsy4QuFkAevTRF/T3jk4cIeF5nk4ZPRLlakvfRcxbeZQsQms9ZwM9
         FA4zkcykZO3qjt3sJCcuTUp9b9UCEX8QXapTihakX3fHtfQuEBT92AXlHDAez9BfErUO
         fJzvTIuVCagTeJPfT6PDO2MFJpX3gXWsUy0HljG3nHeoqcRpa533b7IqL9oZflyarAu2
         OCT5illL6FIjPj11B6mgq5iHFEw0/sljgXxM3fLbNFw6Sm1t1gZvJNbMqcVNSP2G5rHY
         quJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745534309; x=1746139109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZs76uIchCrwsJqCT+S4BB1Qj4mv/z4p+yQgfmNcgZA=;
        b=oQjt5kvknLz+ohBdwezLCAU55FujJTD23Dk3ezWZtLaY0NacNkeiZaMNpaFQu9efqQ
         cVDl7wbHc8oP1LP2YL+50rss+AntPHZQLbnVGtbsMw+DHlIUb9ITY6HkqR8AIDE4KXrW
         RDTq5XGhh/h26Fh54vHHZR8eJ52z73+rOU1ROE4hDMgYAGaClKog7T9wS5lesmf/9eO8
         BfoaO7xF7eyPf1P7UT/jLedxnVudb5noIhMI2F3ebvd449T7Wdr/OXVIA8aARbK7LMK+
         Y/IQUp8vVImsm0rk6DsUCWQle60uibMddknUhl+hnU+XFtHGXA1ZsHskXHAXxQjyNSVZ
         zxVA==
X-Forwarded-Encrypted: i=1; AJvYcCUtMHnd+W7q/2GOqV3EeLXp5iFrqTMohlq1r+KWrcPKUXIviNi0jBe9NsjUr8tWeVMeeqvvvgdhArRHqNk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI1UO3cyO94AsHw4+KulWVUvW745tYXlGvT0Jx0sQUV38TKA9b
	Cj4AyAyf2uLO8Ko+EQZAZbPBhvjPYys/zXZgj80R47fC5kV86+P1kjMeuICJ+etOOUrwE0VypF6
	EDnCl4AU3DOvrWH6TSzon2vcoMZYJbGxAGKUTbJz3dMDibFmX8Are
X-Gm-Gg: ASbGncu+gmPwuNgkUv6UYPUuQf2fhlPU2Z5fN9EyNXfPs2UR1mofC0ccsY9sqwbuux7
	ZgsC+hv1IyJzAjvNxnwoTppjaczbCBqPdEUctGM6QU9nJH2TrOjrCn8vWdw2XgbHnDMytXQsQau
	uocntfCAJ5BPgs01/C01nwM4JuL87KSBoMpBCebj9PH22Z9Cc=
X-Google-Smtp-Source: AGHT+IG3MnYI0bmjFs1Ub5SgzwgKFOkJr0O/+0+ozMNFTj0WeOHAT3DtP/7YoC7pgKXf1I2Z6zt0Gnvi3S4GULDzMcw=
X-Received: by 2002:a17:907:1c29:b0:aca:95e7:9977 with SMTP id
 a640c23a62f3a-ace7113336fmr17668566b.28.1745534309428; Thu, 24 Apr 2025
 15:38:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414173921.2905822-1-ctshao@google.com> <CAP-5=fUJip8odShuUVCnwQg9MrMLVdCWjGdSFfUxWubfQYBy1g@mail.gmail.com>
 <CAJpZYjV1Z_A08A1GSTLZwo7BCaJNGGD+Q06w2A1Uc9p1ihT=Tg@mail.gmail.com> <aAo0IoT0xV4HysKk@x1>
In-Reply-To: <aAo0IoT0xV4HysKk@x1>
From: Chun-Tse Shao <ctshao@google.com>
Date: Thu, 24 Apr 2025 15:38:15 -0700
X-Gm-Features: ATxdqUGxnFHYMdiH6QdyUK2sRPf3xTXG6-Dub1uKAhq18MriPRC1xMgHBDQMQVA
Message-ID: <CAJpZYjUrScM=zh8yTu5GV8AK3zG6wVCa_9OYXmsfk10HYpgaTA@mail.gmail.com>
Subject: Re: [PATCH v4] perf report: Skip unsupported new event types
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>, linux-kernel@vger.kernel.org, 
	Namhyung Kim <namhyung@kernel.org>, peterz@infradead.org, mingo@redhat.com, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	adrian.hunter@intel.com, kan.liang@linux.intel.com, dvyukov@google.com, 
	ben.gainey@arm.com, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Arnaldo!

-CT

On Thu, Apr 24, 2025 at 5:52=E2=80=AFAM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Wed, Apr 23, 2025 at 03:46:21PM -0700, Chun-Tse Shao wrote:
> > Ping.
>
> Thanks for the ping, I just applied it with these changes, please check,
>
> Thanks,
>
> - Arnaldo
>
> =E2=AC=A2 [acme@toolbox perf-tools-next]$ git diff
> diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
> index ba32f8461a4b6438..81cc56503a2d0f51 100644
> --- a/tools/perf/util/session.c
> +++ b/tools/perf/util/session.c
> @@ -1645,7 +1645,7 @@ static s64 perf_session__process_event(struct perf_=
session *session,
>                         return -EINVAL;
>
>                 /* This perf is outdated and does not support the latest =
event type. */
> -               ui__warning("Unsupported type %u, please considering upda=
te perf.\n",
> +               ui__warning("Unsupported header type %u, please consider =
updating perf.\n",
>                             event->header.type);
>                 /* Skip unsupported event by returning its size. */
>                 return event->header.size;
> =E2=AC=A2 [acme@toolbox perf-tools-next]$
>
> > Thanks,
> > CT
> >
> >
> > On Mon, Apr 14, 2025 at 10:43=E2=80=AFAM Ian Rogers <irogers@google.com=
> wrote:
> > >
> > > On Mon, Apr 14, 2025 at 10:39=E2=80=AFAM Chun-Tse Shao <ctshao@google=
.com> wrote:
> > > >
> > > > `perf report` currently halts with an error when encountering
> > > > unsupported new event types (`event.type >=3D PERF_RECORD_HEADER_MA=
X`).
> > > > This patch modifies the behavior to skip these samples and continue
> > > > processing the remaining events. Additionally, stops reporting if t=
he
> > > > new event size is not 8-byte aligned.
> > > >
> > > > Signed-off-by: Chun-Tse Shao <ctshao@google.com>
> > > > Suggested-by: Arnaldo Carvalho de Melo <acme@kernel.org>
> > > > Suggested-by: Namhyung Kim <namhyung@kernel.org>
> > >
> > > Reviewed-by: Ian Rogers <irogers@google.com>
> > >
> > > Thanks,
> > > Ian
> > >
> > > > ---
> > > >  tools/perf/util/session.c | 13 +++++++++++--
> > > >  1 file changed, 11 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
> > > > index 60fb9997ea0d..ba32f8461a4b 100644
> > > > --- a/tools/perf/util/session.c
> > > > +++ b/tools/perf/util/session.c
> > > > @@ -1639,8 +1639,17 @@ static s64 perf_session__process_event(struc=
t perf_session *session,
> > > >         if (session->header.needs_swap)
> > > >                 event_swap(event, evlist__sample_id_all(evlist));
> > > >
> > > > -       if (event->header.type >=3D PERF_RECORD_HEADER_MAX)
> > > > -               return -EINVAL;
> > > > +       if (event->header.type >=3D PERF_RECORD_HEADER_MAX) {
> > > > +               /* perf should not support unaligned event, stop he=
re. */
> > > > +               if (event->header.size % sizeof(u64))
> > > > +                       return -EINVAL;
> > > > +
> > > > +               /* This perf is outdated and does not support the l=
atest event type. */
> > > > +               ui__warning("Unsupported type %u, please considerin=
g update perf.\n",
> > > > +                           event->header.type);
> > > > +               /* Skip unsupported event by returning its size. */
> > > > +               return event->header.size;
> > > > +       }
> > > >
> > > >         events_stats__inc(&evlist->stats, event->header.type);
> > > >
> > > > --
> > > > 2.49.0.604.gff1f9ca942-goog
> > > >
