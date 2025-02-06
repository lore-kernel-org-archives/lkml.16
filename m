Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B80A19D884
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 19:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738868725; cv=none; b=Zgw+tyhq0nnyD9iSHgxuJx+MM3b7ECVtx59hmuuE1pX7w+GbF6k/z5U40OheqIEynWF66/FdtTgmjjwma9iRDIqkXnaI0OZST6Jq37x9bwIRU7w5u3gEbBd8XBZorllHcojNsOGMP26rQ7AJQ+U4+d/7ojqoj/rdfGv3pLic+sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738868725; c=relaxed/simple;
	bh=QGckQ3zhS5/mxBXaeJkT6BFXODnZryVB3wXQsm43k/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h3mS6rQKX0v8Jj2CgLkQOBwJuAtrdeK6OV9seXq917Na+28z6TINWcNaAg6vHHZ0Ntyg7TQAz2H5aeZ/GBF0cj2K8qfOYNYxssS+Hf9k8GBdcjAsC3JSGdl/Nfh3TCmC1kR4UB5SdIv4Fk1YpKVg4buURKbVICNv3wuHEJUtjj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ntiNh4Cb; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ntiNh4Cb"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d04b70fe79so14775ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 11:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738868723; x=1739473523; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VId24H4wHGunZB5n2wwHvJOKU5QvzuEoF0Yap+UdsOY=;
        b=ntiNh4CbRLFXzuxhHwnoNzbVIWqUlTj0CPv/14Pf8mohRUadiUbnc08xKHP5jhmo9v
         q1XCDzURh96eR657k+oyRMJrRU4ovnayUCcu+NtMFQz0uVoHhvpneyw4O56I/IFSe3fr
         MX5aE0AFPxXy5S7KnTq/2IiMfkMiqWKoEg0UazqMLhNXI5s9cCmh/hEBmjAQJzcKa6oO
         X5ZumQtan2CCuETd2xWsdD+8/baztA2X2kD4PUXxHo+r+1yWtSZdYxw3fuK0AySF+pRa
         yziU54YM6GHtEKbLlqZwTt0hN6LWvr/JkMA26nTRp7IUy3V/qQ1Hkv4VcYo6gcYi2joX
         kJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738868723; x=1739473523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VId24H4wHGunZB5n2wwHvJOKU5QvzuEoF0Yap+UdsOY=;
        b=Iz0dVQIbJUZpnnAjqFIemOC/fxli/nG1fmdhgmgA/35gwbC/gUm0eBS53pjRAoM37S
         oAJ77aLlLs70yuLvjmwmIwBtEpyQeqKRbtQi+uBWtFvty4YM42frLCyijodVkJH9SX/3
         crK7aQY8H6NSyjo2V8Imcb86Wj3v98sB78BJ2l4sKS0CWJuL1cUlat4iaIkqjWz05Rc/
         aMRZbUZcaW5NQduhOsIIEfouoX7PzCodWoMx0Jat9ywGelz+fJd/yaJY4vMlrlGuNQyc
         LjLs6KPsTlE8wSJE7DMklCfABiO+332pWTplSKepIMi+RMb+B+2fdYz7iUj7pCrcNNw9
         BEZg==
X-Forwarded-Encrypted: i=1; AJvYcCW1IEOEpzNEYdVplj48uzNZOz1TAuOkNKYRNwexybU07vKQtByEWmScJlfUcFh4Mt4wDZVpGhjTon238UI=@vger.kernel.org
X-Gm-Message-State: AOJu0YznGYjR2MEfUBJqbVIxqZ7Pi/K7w1yOPPGGB+/DSJUCXoDYgkDx
	eIJug/qJMlRyZQDekMxNtOfBv19pKTGdVRCi5w40cZ4pLgHPch16aX27LEn43sD/6ggg33C15Fu
	z8ZtD9mjTDwJjSNeqZRF6IUwrX61KfWsSxgcE
X-Gm-Gg: ASbGncsOaQ4uLuriaptiMN7Lav+FUyPS/u8AggEleXZGGb0oOXhzhgtVmb2+K5k+maH
	BM5ETN0OJvufc87lALcvCgQFtaF2+PN0gwNkMJRRvfmE5/TWpaTjsxjlFfDnO1jUee5CtlsTBpb
	xKh9U0BR5NgQrb2LnH9hZSaqgq
X-Google-Smtp-Source: AGHT+IFa2tFD/6S9dE0nYwjY3v4qM6hZG8eFHsPE7nQGdowjWlTE57muM0rbVH52AT7PCV6DwEEwh387lQxBEqbXQQk=
X-Received: by 2002:a05:6e02:1c8a:b0:3a7:6126:ca3 with SMTP id
 e9e14a558f8ab-3d13e0082d2mr176685ab.24.1738868723037; Thu, 06 Feb 2025
 11:05:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205173140.238294-1-irogers@google.com> <20250205173140.238294-12-irogers@google.com>
 <7692d2d6-16d5-4f50-8c3a-37f1db356426@linux.intel.com> <CAP-5=fU+9MgMbQKpFix+Jw8k+-_yfAs-F+FYE4CmTWxevPmd-A@mail.gmail.com>
 <9fa56c75-2ee6-4901-9e04-0ec23412fd62@linux.intel.com> <CAP-5=fWpbXSwZq5biRZ1fjcSJY2DO4g=cv-0K8jZ1Gzv3bOfhA@mail.gmail.com>
 <58e08371-8d43-4f84-baaf-64b0af95c7cb@linux.intel.com> <CAP-5=fX+u_Un-WYKA35sc366kniuXFVfRDT+dzWd-axTG5PmpA@mail.gmail.com>
 <51732c12-b5d7-4b81-8ea5-79e87b87795d@linux.intel.com> <CAP-5=fWQj01O3WmGLoAf6O_uEeMHpOUqVWvHi3nW_kGj4VtZWg@mail.gmail.com>
 <145ce38d-67c5-47e5-9625-0ae9e9831fd9@linux.intel.com> <f0eb58c2-afba-4810-96d5-61f1c942ed57@linux.intel.com>
In-Reply-To: <f0eb58c2-afba-4810-96d5-61f1c942ed57@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 6 Feb 2025 11:05:11 -0800
X-Gm-Features: AWEUYZnByVDIvIeub23ATwY6yo2eInrwdHkrMa3HOa4926QxIXgAHQLRrADGT4U
Message-ID: <CAP-5=fW3eY70Vh_GuTVB=M2MFcpe-WqRy76cK++UMYT5OKMtLg@mail.gmail.com>
Subject: Re: [PATCH v5 11/24] perf vendor events: Update/add Graniterapids events/metrics
To: "Liang, Kan" <kan.liang@linux.intel.com>
Cc: Thomas Falcon <thomas.falcon@intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Weilin Wang <weilin.wang@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Perry Taylor <perry.taylor@intel.com>, Samantha Alt <samantha.alt@intel.com>, 
	Caleb Biggers <caleb.biggers@intel.com>, Edward Baker <edward.baker@intel.com>, 
	Michael Petlan <mpetlan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 10:59=E2=80=AFAM Liang, Kan <kan.liang@linux.intel.c=
om> wrote:
>
> On 2025-02-06 1:53 p.m., Liang, Kan wrote:
> >>> However, when I dump the debug information,
> >>> ./perf stat -M tma_frontend_bound -vvv
> >>>
> >>> I got below debug information. I have no idea where the slot is from.
> >>> It seems the perf code mess up the p-core metrics with the e-core
> >>> metrics. But why only slot?
> >>> It seems a bug of perf tool.
> >>>
> >>> found event cpu_atom@CPU_CLK_UNHALTED.CORE@
> >>> found event cpu_atom@TOPDOWN_FE_BOUND.ALL@
> >>> found event slots
> >>> Parsing metric events
> >>>
> >>> '{cpu_atom/CPU_CLK_UNHALTED.CORE,metric-id=3Dcpu_atom!3CPU_CLK_UNHALT=
ED.CORE!3/,cpu_atom/TOPDOWN_FE_BOUND.ALL,metric-id=3Dcpu_atom!3TOPDOWN_FE_B=
OUND.ALL!3/,slots/metric-id=3Dslots/}:W'
> > It because the perf adds "slot" as a tool event for the e-core Topdown
> > metrics.
> > There is no "slot" event for e-core.
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/
> > tools/perf/util/metricgroup.c#n1481
> >
> > I will check why "slot" event is added as a tool event for e-core?
> > That doesn't make sense.
>
>
> BTW: I checked the list of the tool events. Except the slots, others are
> all SW (or non-HW) events which should always be available.
> Slots is a HW event and only be available for p-core.
> It doesn't look like a good fit here.
>
> static const char *const tool_pmu__event_names[TOOL_PMU__EVENT_MAX] =3D {
>         NULL,
>         "duration_time",
>         "user_time",
>         "system_time",
>         "has_pmem",
>         "num_cores",
>         "num_cpus",
>         "num_cpus_online",
>         "num_dies",
>         "num_packages",
>         "slots",
>         "smt_on",
>         "system_tsc_freq",
> };

IIRC it was added on metric changes I wasn't a reviewer on:
https://lore.kernel.org/r/1673940573-90503-2-git-send-email-renyu.zj@linux.=
alibaba.com
and then carried forward by me. The event should only be enabled on aarch64=
:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/util/tool_pmu.c?h=3Dperf-tools-next#n38
Where is the slots event added to the metric expr (expression) string?
The metric should have events pulled out, parsed and
parse_events__sort_events_and_fix_groups deal with related issues to
this. I thought it was a requirement that the slots be in the metric -
or else why is the converter script injecting them? :-)

Thanks,
Ian
