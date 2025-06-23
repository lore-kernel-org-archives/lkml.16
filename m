Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CCD3D3B8
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 18:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750701955; cv=none; b=IitfwSQhv1L8bo5CT1UUhvCfGU6CbE9BbTOfAi2lWqa/sio+fgFBSJldOh3Bpti6fDF9ZJTf1dSyoedNAsG7PYcfRb3pNz9Ez+Zg3x64QXMFJNMeJWkQmtZrlKVISgYHP8k3YUox4dmMCvnT7XT+lnw2GIWVcRwCjj1/wX7vpDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750701955; c=relaxed/simple;
	bh=uB9Xm6eaRNihSSkT6yK/cq6q91QMQcRLKlFVMK316kU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FZmvp2/aaxTSyxeFAs5HKGzXjcX16zA2I1xrKGuyxesvdOhbDqXXzs+PGGYeHDjKN26HF8vzljjNUiS+Bcq7hHpSLjZndWfoVNWMBWR0Tz001nt8f2W1u/x6Vhxw3l2ZCmAGxgHGdKYM5mRxXGwYc2tW6wL9nNMaD+h1Go7Kh7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DTZNCX/Z; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DTZNCX/Z"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3ddd1a3e659so16235ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750701952; x=1751306752; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLS7bcTJVBZve2BcOYUtDe8oViGu/YRD7NKWZ/1+BTI=;
        b=DTZNCX/ZAoiVonbCRXFZ+QjQooP4kyVhexgtt7UT8hUKeLeaB+2+tdAa8u9q3R2NY/
         m/wiVDUK5vY70tlXTepkGvYIg1A/07iqe/Na67yAsMAXr8qjHH7knpWUIwryP/JnU9L8
         mooelJtUUpU4+deE+uNoXCuSFScDNA1wJn7ZC/gKglzPFlLCi0UaXsgMjh1PjCglJXQf
         gtihMOY4o4wgvvmcGgdz9cCg6wsFjPlTuIlmTJdXDoC80iTfbwWNlOrvA13a4xjtNVp/
         PbJzCThPBhw+zrM2FNeqM5slQr//l4H4aPiWv7Wun9lbCCO6S2cupBWkXtk4mH0qFfk0
         yx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750701952; x=1751306752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CLS7bcTJVBZve2BcOYUtDe8oViGu/YRD7NKWZ/1+BTI=;
        b=lKuoq8RNk3QSRp/h2788HywMNYQaKRTegkegwDn4Xn2Yq87Uz2PJRvyvufWZVlzMiG
         D5/6IFD9Um7HHqyC/TY9zLFqm+fmZFpaF712EbAzW5pbKrrTU0cu9+qjQfXpny/O/CFG
         TgmJttoBSs4fQtgqSRW7yg9J07nVVGIYNjNrb6pdnWi4asV8faQpMRDpfXR+eeD/xe2U
         3TstDVleGTC5+zOxgurZfLqWU6+sOJ9dmF9xL8mmp0TRnzQDYV4itg45WJL5ZLKuS0u3
         RaB4vvlTt2apmncukezn/PnYUjtWKiwLIen1PTdxJDiXrBVsptPd8XD599Polrma+m/7
         40Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUbBgckCUpcpA0NI3NR4wBSBOy/x0Pf4M4istj1gvK8bs2JUood7YAbQ3kTR2Hhikz3MbP5pmNxl/MJMuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPqI/N2GOcl6FMg56IKcFFISIVLT1NE3YPiTmG67eclENhbpwC
	tyxRQQejax7S9vjAE7/kyk9+stDkk3yxPZMmfU9G++tuqw/645GYAkBSL3lsXiZ/qnqgDGyDsb1
	M3/RrNweZ8sm4ET73q684c4585Sgna3iOS986zaT+
X-Gm-Gg: ASbGncuaM+JHiB5JnidSfKE0q+A2bJPt42MjuwKqSkevzM5jlUyOm6TNLFNszHcS6h5
	JrzM2o5jBfg/FiNLFAzFLHSb77PNhmdhVCckhRHC1lYRSz5cJbBNYMvWyrxFec+FNJPU+Wvkr9x
	YDxulBHfG6exK+qV0bN7WZfD/xRYo9Kh2DT0kWbstMvRJ80pbMgrVMxG1Qn6BZJrIX+O2sHlSd
X-Google-Smtp-Source: AGHT+IFoPkNVe4Q2bVoIHmMNhdShHH6deoeW7JgoeZ5gaNh6f1dgwmJRG0/F7F+VMSx2Mmh2gTW3sdf91IuPyKpMs74=
X-Received: by 2002:a05:6e02:1b0e:b0:3dd:ed9e:a53f with SMTP id
 e9e14a558f8ab-3df070326dcmr6234545ab.10.1750701952276; Mon, 23 Jun 2025
 11:05:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619002034.97007-1-irogers@google.com> <aFW4VJtk96JD865U@google.com>
 <CAP-5=fUpnW1DE68pMW0q3vMT+n6d5SeNkwXd45XLaf01-eP47A@mail.gmail.com> <aFmSuSyZ1ZNT94Tq@x1>
In-Reply-To: <aFmSuSyZ1ZNT94Tq@x1>
From: Ian Rogers <irogers@google.com>
Date: Mon, 23 Jun 2025 11:05:41 -0700
X-Gm-Features: AX0GCFuWZKcC5pRfc9BZ8I6NY9sP1wGLxCTxil3Ood7reBNkagEFXiDzqyyZ-wc
Message-ID: <CAP-5=fXms87LVH-Y5V3OpVbwUjY=hWAe0NTX4uKQf1q3Ax-WSA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] perf test workload noploop: Name the noploop process
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 10:45=E2=80=AFAM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Mon, Jun 23, 2025 at 08:12:47AM -0700, Ian Rogers wrote:
> > On Fri, Jun 20, 2025 at 12:36=E2=80=AFPM Namhyung Kim <namhyung@kernel.=
org> wrote:
> > > I'm afraid it'd introduce a build failure on musl.  Please see
>
> > > https://lore.kernel.org/linux-perf-users/20250611092542.F4ooE2FL@linu=
tronix.de/
>
> > > I think <sys/prctl.h> would be enough.
>
> > we could do that but in the glibc man page it says:
> > https://man7.org/linux/man-pages/man2/prctl.2.html
> > ```
> > #include <linux/prctl.h>  /* Definition of PR_* constants */
> > #include <sys/prctl.h>
> > ```
>
> > It'd be nice to think musl was slowly getting fixed. I notice we're
>
> Sebastian reported on the musl libc, its maintainer replied:
>
> https://www.openwall.com/lists/musl/2025/06/12/11

Ugh. I'm not sure how we're expected to resolve this and have glibc
and musl be happy without basically not trusting libc.

Thanks,
Ian
