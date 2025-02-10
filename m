Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F813596A
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211337; cv=none; b=K13fWLeWS1hYHjRObLnA1MWMKgPpTqAdJITk/tFOPRXZpigJpcesENt3fLAQAzQXDUVM7c0qz8nPh/wJmAt4c/XvU06lSFZCkcmCh3SQOL6DDrd5VWDmPV6pXkyOtLNIQ/dyPXCPnPge2O4FbQ+QoOKePzcS2loNEnMIXcWUvrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211337; c=relaxed/simple;
	bh=F/96u3NNUqcuJXiA7GkTj1P26oKp/ehSs1cHwi+YUpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=CabbzZcVQRWgZJL/uREiGeoXGDXnXdmtlJnCmBeEbX3NhqiQ4ZaieLM+zkx+6Et7XC0joNO8xviO5shZylQbIibsGGITjv4QErDTQzxf/giADvTgNBkoTHQXRmpaXIhI7rBcVCIgr8FZKz60gEmY2Vt6HurV16+dXAvngXGiwpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pmeR/8ER; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pmeR/8ER"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3d13fe99d03so4495ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739211334; x=1739816134; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/96u3NNUqcuJXiA7GkTj1P26oKp/ehSs1cHwi+YUpQ=;
        b=pmeR/8ER749MZTx+mv1b12fDjHywZeCu2UIoaitmxneNn+0E6ynhJ0E/tQrOtUQhB9
         sQ9K4ETKqIudKku4px98vqLA08D6yi+IfsYVjVpoWLh4pzaeMrbOkks7IAiaaTOGopOm
         O1e3Yh+wYuFT0n6xsc55THEExY2ug9TJwpxpGBO/Xu/OSv5Ma5Wi6pj/qGZxioRToXgv
         VuNPlwQcL7Pzph3sRTu0HqSq+mUIVj8IdmHEjHV88xqkQXEuLQyPqTEmlAyWapMtK2Aq
         dZcIxShTl0J+no9PyUXfCT5KWlvkz+16PGC6N3G/rlJPWDuUc2mNSO+uuX5wdAP7TrPC
         EAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739211334; x=1739816134;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/96u3NNUqcuJXiA7GkTj1P26oKp/ehSs1cHwi+YUpQ=;
        b=VAEwhGX3038Ym8DL8/AIyVsXUBgvSRYvDyf0h5AvmiM7fv0f485OCI98526UCVsABf
         GEo/rHVYA5kCBYaWcjE2E2U1L+6O3+4wj25a4ox4ljmJvYfC8qCZZCwY6zG7j/eANOSV
         +8aQq3nLat+1SA90EZY5wf2I5UC9FjBFvQ3Km9Z7YVpbzWNh9Eq6e+f+EH0npkHxsakC
         Jyy9VSjblbWOt5dHb7Q/mjCXsIbcTydzsnHSVcZNuwi05wE6m3mLvlM932YwF545dsIZ
         7yKbe+fXfuoEFE8kCtFOzD3pP3zlpkas3GlL6KsXRgOveDfBexBSIN1nI5gZiBddhzwm
         Kt3A==
X-Forwarded-Encrypted: i=1; AJvYcCU2E+od4ktkTj+R1KNBFeH0eaazS/N3IsVaNpsr2+bGBSyaNkvPcYxEs+QqSzgztSyTrgLmZGjZBwG+NOU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3BYmptmKDJfZUORYiL8srapDy2WaCr82WGjvieY1JErPQiPTr
	jnilAsRu6gdT48tV8WM2MTRWMyUS/v1Z5cNqFbvs6+xNmozT0plhgoAym8sFZ4FB5Tw1tkoHy5w
	HQAiZvZ7fCoyZ0rPzOX4CFBFU6qq3c0dm0EXE
X-Gm-Gg: ASbGnct/ZsUkDFJ32wrDyAXtr7SoPzpxJGITQnLNY8v2mjCxuH0KSPpPUec8dh36bF4
	cn4suYXf4jUIsQnSXxT2A6WgFdwZHx0bKVBCLcfR8lro3KYaMR4CNsnH3UFAIrBHynxYhbKiyFJ
	FYVLfMDeJHaliMgutw0SW9Qc15
X-Google-Smtp-Source: AGHT+IFqTvA0kT0d8/s2/LY0/DyAghSw5k4WybfSH3hPb2dd+fkXBPi3nvvKEIQesGbSUsmWCmzVLcTwx/r2AwSYTGI=
X-Received: by 2002:a05:6e02:12ea:b0:3a7:dcc1:9936 with SMTP id
 e9e14a558f8ab-3d14f0f576amr7064045ab.23.1739211333209; Mon, 10 Feb 2025
 10:15:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113194345.1537821-1-irogers@google.com>
In-Reply-To: <20250113194345.1537821-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 10 Feb 2025 10:15:22 -0800
X-Gm-Features: AWEUYZn7d4ZEktR9aWJ_xgpCMfHw12KnOcZgrjIapk5zbV_Lb74ntXY_p46rN_Y
Message-ID: <CAP-5=fVoQRhd-8jyXfjc2dCuwt7_o1sU208aADT1FriwCNa9qw@mail.gmail.com>
Subject: Re: [PATCH v1] perf sample: Make user_regs and intr_regs optional
To: Tavian Barnes <tavianator@tavianator.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Charlie Jenkins <charlie@rivosinc.com>, Andi Kleen <ak@linux.intel.com>, 
	Veronika Molnarova <vmolnaro@redhat.com>, Michael Petlan <mpetlan@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	coresight@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 11:43=E2=80=AFAM Ian Rogers <irogers@google.com> wr=
ote:
>
> The struct dump_regs contains 512 bytes of cache_regs, meaning the two
> values in perf_sample contribute 1088 bytes of its total 1384 bytes
> size. Initializing this much memory has a cost reported by Tavian
> Barnes <tavianator@tavianator.com> as about 2.5% when running `perf
> script --itrace=3Di0`:
> https://lore.kernel.org/lkml/d841b97b3ad2ca8bcab07e4293375fb7c32dfce7.173=
6618095.git.tavianator@tavianator.com/
>
> Adrian Hunter <adrian.hunter@intel.com> replied that the zero
> initialization was necessary and couldn't simply be removed.
>
> This patch aims to strike a middle ground of still zeroing the
> perf_sample, but removing 79% of its size by make user_regs and
> intr_regs optional pointers to zalloc-ed memory. To support the
> allocation accessors are created for user_regs and intr_regs. To
> support correct cleanup perf_sample__init and perf_sample__exit
> functions are created and added throughout the code base.

Ping. Given the memory savings and performance wins it would be nice
to see this land. Andi Kleen commented on doing a reimplementation,
which is fine but out-of-scope of what I'm doing here.

Thanks,
Ian
