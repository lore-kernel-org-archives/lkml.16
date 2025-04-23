Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC3C139566
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 20:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745438478; cv=none; b=ncZix+bwCWO+LtePcAILAA5ukvDNaZx9RNlJmhIvB41gjqb8WV0OE4GkJd9KrmB9p0+6phdlGiJwpdLrgYUa/XZtuS/EDkuLASjCqkBC9lFhr4R42saZg94K6FGDxnZ1z7ZbN6yaa6kkhtwzsI4Rv25i+6mPHsN8yUxAh+dE1Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745438478; c=relaxed/simple;
	bh=Pf8PH2t3WoU0meJ6dE8N7zGHohafdCGWsPMCYza/pDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UIh1/fJnlOTHMdg+CIdtANTxxYcxlqmh+mfYyOcDaQqaCinvbgnxDzTqaXo5Femjy83C5cwalA0HXh44/yrFJfr/o85VCz4pJVd9ZVGyxLmavWwxgXzE01QnABJ2uKdw3IKMUSyMY8E4K59ZohwRzRIuMpeZ1dObYLVSa4Y+RFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PWUS0q1G; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PWUS0q1G"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6f2c45ecaffso2594826d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745438475; x=1746043275; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lp4CdKMNjxvtvuUzztK6+9w/pLy8jiHgEZIHEVYZ3qc=;
        b=PWUS0q1GrbGN3TpHdQHr3M0uKwd/qp+IW/kI/iEePcd7MGZVWDERQ3G+8Wv8EMSNqC
         9sVRq4tqL0keg46Ydty1bs+RnO5VBWuV5pkzWvwwZa/Cy5NN0cwdEc7uGWy4lmtjRIhN
         Y2j8Nxaa+62GXHpleWRaM/RO1FNl1Ljlnj/GFWx+kmtlLKBPWJ/dWgWDxz/t9mEoqG00
         sww+jfvv/qFNViCWW+7gm8q/R2JtXuliHyqeHu//29GSwkyvto0oYl6P85uOa4CmDp2t
         2kNCREfQS/mq/I5mR8J6VNUXlDGT5jdwhrHAELBiMIFbiUC/TzvbqhGw/kKIAvTrjgGX
         Y2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745438475; x=1746043275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lp4CdKMNjxvtvuUzztK6+9w/pLy8jiHgEZIHEVYZ3qc=;
        b=tPvFqNJrUyXAJb0mKu4aGF2vS66LElL8l66OESRnIHWht5vaPub1s7I5YTuWAvKRwS
         Fzo4AWwGVuKO/BxEiSOOWlOch3wALgBqA9c23xShEdhb3n5jJmR1hZVzJ5uW4XW49gsH
         wthvts9iUKsz9YXMvWpJTrY5YrTrss9PJtNcEcZS/2s6vNfcIoKioHLVKwTP90zVPUd0
         hQrTMydjzaV6OvJkuH9fRzok91L0kfW/2cnw/Zbc8h0PMuYVdROoB33qaFOY4U9WMYCQ
         cX/Lw79njQvsSlIReFUvirL4RAzSx1M5yUI2iidDplpSvdVevEXHCkhr2ddNbsPcONS8
         8sBg==
X-Forwarded-Encrypted: i=1; AJvYcCWhVwlEYJjQ9bdiXSq3cIOGlbSjF2M9z9ZF7nme6uwUx3/TB4V3yd15a9fLMRGREDYFdmbq914UcCTFyoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOUM1axxC0zz4dzH1rymjc9vqvZ9PVZN0ZVEYmcJ7Khov7BaN7
	sCo6ENVxu8CLy4zl8o5CbQJsQqFXvfYMmt8aI6/g6SuRye8XTDBgX/muZNHfmrLWrjhRjuis7GW
	YWRIwuef9uFxxdkNh1VJ7V52iUpkxnBpTUws=
X-Gm-Gg: ASbGncsSp9F9aVGca1ZrPImDP07TA3hNAhU+QX3Tvt7FO8JCLDT42caGSwMGVeeJFbm
	QjAtERmsaLzL3VZ3KBMbVQblt23OeJUMTkmJt0K1Z8s1BLHzHRc0yMyp6BuJ6yuYYTa/sekeNE8
	j5UkjuN2ai/vOE8qURvcr0XzGikzqq3DiXpaM8uzAPduxQ1JC0DwdQ4HqrLo8VHg==
X-Google-Smtp-Source: AGHT+IGLQ5HSuz+Vu0fNrtBJpS4OlBT/hHsgAWnUcy9YtEjieTri+yDmgzJuQXVWkptGriSGBQGbhS8z3mhXYKbvHzo=
X-Received: by 2002:ad4:574a:0:b0:6d8:9c92:6555 with SMTP id
 6a1803df08f44-6f4bfc7afc4mr561126d6.29.1745438474901; Wed, 23 Apr 2025
 13:01:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421215818.3800081-1-yabinc@google.com> <20250421215818.3800081-3-yabinc@google.com>
 <20250422142102.GI28953@e132581.arm.com>
In-Reply-To: <20250422142102.GI28953@e132581.arm.com>
From: Yabin Cui <yabinc@google.com>
Date: Wed, 23 Apr 2025 13:01:03 -0700
X-Gm-Features: ATxdqUHxCe0dNQK1zzumyasbHqzp8bMN4VyHh8fq17oPYK91Kakr2wvuHppdyfg
Message-ID: <CALJ9ZPNKZU7nVLyodN5i7GeRxWL6KzkXnqEJMv2sJkk2SwYi9Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] coresight: etm-perf: Add AUX_NON_CONTIGUOUS_PAGES to
 cs_etm PMU
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Liang Kan <kan.liang@linux.intel.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 7:21=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> On Mon, Apr 21, 2025 at 02:58:18PM -0700, Yabin Cui wrote:
> > The cs_etm PMU, regardless of the underlying trace sink (ETF, ETR or
> > TRBE), doesn't require contiguous pages for its AUX buffer.
>
> Though contiguous pages are not mandatory for TRBE, I would set the
> PERF_PMU_CAP_AUX_NO_SG flag for it.  This can potentially benefit
> performance.

As explained in the patch 1/2, my use case periodically collects ETM data
from the field (using both TRBE and ETR), and needs to reduce memory
fragmentation. If the performance impact is big, we can make it user
configurable. Otherwise, shall we default it to non-contiguous pages?

>
> For non per CPU sinks, it is fine to allocate non-contiguous pages.
>
> Thanks,
> Leo
>
> > This patch adds the PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES capability
> > to the cs_etm PMU. This allows the kernel to allocate non-contiguous
> > pages for the AUX buffer, reducing memory fragmentation when using
> > cs_etm.
> >
> > Signed-off-by: Yabin Cui <yabinc@google.com>
> > ---
> >  drivers/hwtracing/coresight/coresight-etm-perf.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers=
/hwtracing/coresight/coresight-etm-perf.c
> > index f4cccd68e625..c98646eca7f8 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> > @@ -899,7 +899,8 @@ int __init etm_perf_init(void)
> >       int ret;
> >
> >       etm_pmu.capabilities            =3D (PERF_PMU_CAP_EXCLUSIVE |
> > -                                        PERF_PMU_CAP_ITRACE);
> > +                                        PERF_PMU_CAP_ITRACE |
> > +                                        PERF_PMU_CAP_AUX_NON_CONTIGUOU=
S_PAGES);
> >
> >       etm_pmu.attr_groups             =3D etm_pmu_attr_groups;
> >       etm_pmu.task_ctx_nr             =3D perf_sw_context;
> > --
> > 2.49.0.805.g082f7c87e0-goog
> >
> >
