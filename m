Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478A1139566
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 22:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745448396; cv=none; b=jpw1eHUgqUyeDcp/IBh05xiIuANr51RI3xjFKeaGLze7oXRdwu6kSQicFiys/sPEna815a8J1OrTOcnlPKu/a9zje1a6Tk7Fn81qiVeIptywWu8yMfzK8hwrTJ8N7yroHmNgiIMp1AOrGLYeb9QSJt4swMxDyTZB8zhm2n8bkao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745448396; c=relaxed/simple;
	bh=IMXl/A3yFuGvvJmg1HepUP07i7S5rKed7ldc4avjuHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SilQuVRm4y5mfiJGI7fTgP1f8FwZBoZRRbcV4j3rvEHpzJMcCHLXvTAHwq2Wut1g4VCdxwpeRHVkO8sAO49D8eNX12+cNOhoHt3uyumm7Q1CziV03cO4WjXUaDlX1V1qL1bOVKCaC7TPyl7eLEyHYnjDC8q+e0ubsdOhLny5gxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fEZmjZXU; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fEZmjZXU"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aaecf50578eso58227866b.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745448392; x=1746053192; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2Qmb+wkwvs0jE1HR4ELuVOB/X5QTEJJo/QFMT2gUfc=;
        b=fEZmjZXUV8fjxDLBg6Mp5L+U5ZL5QJbyjBkgRDv3+P2IanKgPI0fFVy8JEFi7roZHy
         hE6CuLytFefqR+B17zKOZDcb1Ta4HunpHkVPGzpkOBdR9jSB4nV6hvpXy0T8/kSExPm0
         4OHVUabV7rh98wq7dKjb7/cCSu+3HgLZTL7Pv6oj64JEGN73aG0GN+mogowNh8dAf4Ur
         HRlp3GU/DoB/XECA+FGQ2DNuP2PfcGLo2nc82YPISWuWG1pirCk49NXFZx/xjp5NBu+z
         jeJBKcQfgjeyO698YxH9WSj94W+KtBlfEpN43HGSWfuvzLkZaEfqDwM1eoC5jDlyxitt
         1bvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745448392; x=1746053192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A2Qmb+wkwvs0jE1HR4ELuVOB/X5QTEJJo/QFMT2gUfc=;
        b=pwnmyr/F+afizak4SE4n+XlmV1/fgH/5rKsv+qlEQr2Wsu7DT4RUKFPUGymVAD84sU
         Q5bw5xpuaCjS14o+z4WrU0HFEnNziBXiVRr888ntq8CbyOeJsy3BtLZ//TxyJNIoenaM
         bqVSb0GD2s5hCRRHc+q+8MkRPhRrZbtlxYUB1hFN32BQp6dfnJCQzJoApkfeFMzAvWJ5
         uNpOaPPswDYZ2j8Jr/tY5g4dh8PD6VQhGRLIpErbiPZG6HThaPGmOcNk0Nuv4cWSoVsX
         NKXj6e9LMNP5fEYFNXvfi1Y3pklJAJL95OUjd0T9lIMA6WfShPnrK4dRm1A8CiJ/4DgF
         Djwg==
X-Gm-Message-State: AOJu0YwCF9w1GZu6/mvn2wylEFAPiiS5aJopanunZEhoisLHGbpXr0zc
	05P9u8OCKZcvjYyZesakVm871zQzWB5FN42AhbFQV5tpjmhhBUDthWb1/qnfnDBSJWm1/JeyVLp
	fz7n9MG+2XIWiUGRjSGTuU3FgYFIWlg2ddWhyyMbB6lHC5Cn46Q==
X-Gm-Gg: ASbGncuFQFz9ZGinuqshyU3ihfCWPEwGvYN7ROdvFzM7Dve7PnUHkuogPcRl7mvIC3S
	G1wpT+RujTt69ZYzTAouS9mHMJiH7MHle/ir8c8vs8+QJaGcYWlaiO5s8p9jQq8B0ooQFNqqhSY
	uATbmowoCsmTVtAXAtijLJcuwpi/bYg9FgO39HrLE+sOHVhQDu3ohYwlj85g==
X-Google-Smtp-Source: AGHT+IEIUQX3u2UbHVW2Q3GZfyp1v107uY/UMh5B+ccLdxuZ554TWiJJ5a7OOifECgFbKGAyDKN4fsCYMXYb+co5kiU=
X-Received: by 2002:a17:906:fe08:b0:abf:7453:1f1a with SMTP id
 a640c23a62f3a-ace572a2deemr57881066b.36.1745448392443; Wed, 23 Apr 2025
 15:46:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414173921.2905822-1-ctshao@google.com> <CAP-5=fUJip8odShuUVCnwQg9MrMLVdCWjGdSFfUxWubfQYBy1g@mail.gmail.com>
In-Reply-To: <CAP-5=fUJip8odShuUVCnwQg9MrMLVdCWjGdSFfUxWubfQYBy1g@mail.gmail.com>
From: Chun-Tse Shao <ctshao@google.com>
Date: Wed, 23 Apr 2025 15:46:21 -0700
X-Gm-Features: ATxdqUEGsYrpqaCxnMFHoDZpNPVkMcK9ff04teDDvJ08RgpruLSH8VAl7VnJK7c
Message-ID: <CAJpZYjV1Z_A08A1GSTLZwo7BCaJNGGD+Q06w2A1Uc9p1ihT=Tg@mail.gmail.com>
Subject: Re: [PATCH v4] perf report: Skip unsupported new event types
To: Ian Rogers <irogers@google.com>
Cc: linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, peterz@infradead.org, mingo@redhat.com, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	adrian.hunter@intel.com, kan.liang@linux.intel.com, dvyukov@google.com, 
	ben.gainey@arm.com, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping.

Thanks,
CT


On Mon, Apr 14, 2025 at 10:43=E2=80=AFAM Ian Rogers <irogers@google.com> wr=
ote:
>
> On Mon, Apr 14, 2025 at 10:39=E2=80=AFAM Chun-Tse Shao <ctshao@google.com=
> wrote:
> >
> > `perf report` currently halts with an error when encountering
> > unsupported new event types (`event.type >=3D PERF_RECORD_HEADER_MAX`).
> > This patch modifies the behavior to skip these samples and continue
> > processing the remaining events. Additionally, stops reporting if the
> > new event size is not 8-byte aligned.
> >
> > Signed-off-by: Chun-Tse Shao <ctshao@google.com>
> > Suggested-by: Arnaldo Carvalho de Melo <acme@kernel.org>
> > Suggested-by: Namhyung Kim <namhyung@kernel.org>
>
> Reviewed-by: Ian Rogers <irogers@google.com>
>
> Thanks,
> Ian
>
> > ---
> >  tools/perf/util/session.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
> > index 60fb9997ea0d..ba32f8461a4b 100644
> > --- a/tools/perf/util/session.c
> > +++ b/tools/perf/util/session.c
> > @@ -1639,8 +1639,17 @@ static s64 perf_session__process_event(struct pe=
rf_session *session,
> >         if (session->header.needs_swap)
> >                 event_swap(event, evlist__sample_id_all(evlist));
> >
> > -       if (event->header.type >=3D PERF_RECORD_HEADER_MAX)
> > -               return -EINVAL;
> > +       if (event->header.type >=3D PERF_RECORD_HEADER_MAX) {
> > +               /* perf should not support unaligned event, stop here. =
*/
> > +               if (event->header.size % sizeof(u64))
> > +                       return -EINVAL;
> > +
> > +               /* This perf is outdated and does not support the lates=
t event type. */
> > +               ui__warning("Unsupported type %u, please considering up=
date perf.\n",
> > +                           event->header.type);
> > +               /* Skip unsupported event by returning its size. */
> > +               return event->header.size;
> > +       }
> >
> >         events_stats__inc(&evlist->stats, event->header.type);
> >
> > --
> > 2.49.0.604.gff1f9ca942-goog
> >
