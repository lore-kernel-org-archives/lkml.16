Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C576220CCDC
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748380674; cv=none; b=hYWMDBCcgC+fHU9NNWnlvtOtbQ/aLhhSyb4tvTmWJw2kIS+jH/tFwpG/8Zzr+lmQDWfg3Q1L3NjeBgtZ9UAtauwYjKRaZJquhq0PoLilbwSzzxllxcHayZbtrOnMEZl6B0aGEt2aXYOCo8qzZ6HjVGs8PRO85IKyOKknAvPFNWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748380674; c=relaxed/simple;
	bh=B+99Rf+2I0jJZmtcZn+WFPEjXE9UraGmIhuRA3//flg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mf3hOSlxhOtqMZyo3nD0qfs7EcurKGu6vJkaxKR68xFcrHZdU1j9GA3df/+lgEg/k5Kr6lG7hxrSXcNrv+jC22JfgvtttTFFdCP5bGa2OZ5Fztc59WYv2DIDUgONyeLZSIpsCtEM1LzvwkmcMCUr53gLBmyjmpETQU75/9DhMF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s4piLsp0; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s4piLsp0"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3dc8897f64cso23315ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748380672; x=1748985472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+99Rf+2I0jJZmtcZn+WFPEjXE9UraGmIhuRA3//flg=;
        b=s4piLsp0ZE/jWrVrd0JEBdXJUC4lAI/1ER/WDxrDVCdNtc578gEcubwkh/R/ls/Rum
         XDwgQo2vP6eD9Z/gmXsVXJwsPTbcI2Cv8krgZZk55m7B31TS5orPIJoEn/Sm6KJuHx94
         eE2tfqJ9fTW4n47g3yjnM01OQh3FHrd5EHWGRftcsJvTTAEmq+W/pty0wr3tsC5r/3Dr
         mX9mu89/zLYUGJQIeEmMR9pjxFi2s2+zqiN0WER4q2E5LNnQVEPVsUGyWET+ilBJzybT
         +iw82jg1ZJh0syVIk/Xt5+sNw7Ng00Zz+WeYKSiauxlJ1mmmSbew2LssZJ+nLUSDZrlv
         NI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748380672; x=1748985472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+99Rf+2I0jJZmtcZn+WFPEjXE9UraGmIhuRA3//flg=;
        b=sjxVxDqDc8O7PhE9SlO2+uCl/j3RVkJigZrXUkDRt1l9OS9L77ScTo+768Rs+lKs0m
         3g0f771J4wXWtdS8Ils8eNQj8C4eXbknF+Hct4YYyiDfdiUjEfO5JUC1q4Bdq6kBFKTS
         x/qfARreo6XX9ySOkVZbvgvWxQZFJ6KwMdFMfh5CmW1u4y0xUXOQqvajzRXIVxGctCWt
         +qWJlPT2RW4H6X0/MRz6Oboiqz9OhGbnmoEV/LnUtDe37GAHrYDtVjRAEJf6KBJL7+qW
         chZ41PZ3et149D/zhj1BbEQB3oaMp1KIywV94CrIMQi/9CRjrA8tk0RCXttWDh6aVwT6
         zQ+A==
X-Forwarded-Encrypted: i=1; AJvYcCXVIPEWPEtkgdqULAee8aIlpTOwc5kFav7GSF7ZscqfZhNIV0jWUu59FyKEKYBjmdj/a1+vQ1gtx1HofLU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7xDou5aVkM9wU/q2jfhK12m1d0oZYSsm7D6NkBpUg0N4q2UV4
	wYv0ZdopOsrl0sU2uFprfDy88Dm4TdNcHxSBay13oEDYBx5G7iX7dtbNZOiY7GOznF7EB/O7KDO
	porQlbs11D51WJkssDWwcvRGFF1veuJX/X8HBzqCf
X-Gm-Gg: ASbGncuRHQy/79BIjjSn7g+2Sf3kAgi3kSN5rZhHn9VKG+naU0q1mQ5CVwFFQ/PJpQz
	XfH8sPYhLTJdXITaECj3PPPR0UOeqU5NctRA0hfuP+caLea/wfLHFogjDlfELYcIqqdPUgODFDi
	HFrmE5vlcEu5p48qPto0XrD6bhQ0wZLm+83T9FGWAxfdnqeAq0rHUWUPu4YDCUffoBUeOPSWXT
X-Google-Smtp-Source: AGHT+IHAuT/+L6BfBHpTYTb+SvZlo2rWXr6bkvbj/lWrD9rlW9tNhusiOjmF5tsFCXH8qEfKNkAYuNJ3s9Zd++Z2CWk=
X-Received: by 2002:a05:6e02:178f:b0:3db:854b:9f52 with SMTP id
 e9e14a558f8ab-3dd89c52111mr361775ab.7.1748380671633; Tue, 27 May 2025
 14:17:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313052952.871958-1-irogers@google.com> <Z9Rk-YdoK-fK_62d@x1>
 <Z9SK96s4PAp680k6@x1> <Z9SLL50yuiLOGGYI@x1> <Z9oGI8G3cOoluIKf@google.com>
In-Reply-To: <Z9oGI8G3cOoluIKf@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 27 May 2025 14:17:40 -0700
X-Gm-Features: AX0GCFvPUNGmSlZUOtr_MrctXEr7ggvsEHiXnYCnz1_Q4SqywMc8Qv_Y61_aDuA
Message-ID: <CAP-5=fWaTU7Ouj6ZnF2jaoiQbT_Niavx-JA=_bMdYRsr7T-P8w@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] perf machine: Factor creating a "live" machine out
 of dwarf-unwind
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	James Clark <james.clark@linaro.org>, Yicong Yang <yangyicong@hisilicon.com>, 
	Howard Chu <howardchu95@gmail.com>, Andi Kleen <ak@linux.intel.com>, 
	Michael Petlan <mpetlan@redhat.com>, Anne Macedo <retpolanne@posteo.net>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Dmitry Vyukov <dvyukov@google.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 4:47=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Fri, Mar 14, 2025 at 05:01:51PM -0300, Arnaldo Carvalho de Melo wrote:
> > On Fri, Mar 14, 2025 at 05:00:58PM -0300, Arnaldo Carvalho de Melo wrot=
e:
> > > On Fri, Mar 14, 2025 at 02:18:49PM -0300, Arnaldo Carvalho de Melo wr=
ote:
> > > > On Wed, Mar 12, 2025 at 10:29:51PM -0700, Ian Rogers wrote:
> > > > > Factor out for use in places other than the dwarf unwinding tests=
 for
> > > > > libunwind.
> > > >
> > > > Testing with another patchset being reviewed/tested, seems to work,=
 if
> > > > it showed the line number would be even better!
> > >
> > > But it gets the lines, at least in this secoond attempt, after applyi=
ng
> > > Namhyungs fix for the previous problem (int16_t):
> >
> > Nevermind, this time I built with DEBUG=3D1, so DWARF, probably.
>
> Can I get your Tested-by?

Ping. Thanks,
Ian

> Thanks,
> Namhyung
