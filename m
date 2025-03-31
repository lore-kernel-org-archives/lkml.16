Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDBF215764
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743452326; cv=none; b=oi8T2HrsqPj2d1iB3L0QBIk/nRb2fuH4xiSUPQZ5xCkluz4uvKfSVeo0M84yVZqU0pgcLAkGDZHeGa4Fe2ywe26ZY0om6dn8ZRTU6caLyaO+mnxbLyD8uXdaFAy3KEETiBTd+wrmQwvOXc+H+Pmx4aGRqPIe7S09HqTK/VoyHiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743452326; c=relaxed/simple;
	bh=PYMtYl96JcBRAqsapGFiaNuGnexhsTUE5yatrVZ43ak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QnDSx1BKI0RLSq1TVhZvu5bsnpLEprB/e2DTyx/in49DHoeHJ/n+hE7UKlnKBfbJnKFjfG5KG9s6QpB/QtMg3NuvFNm7kaTre84umWNU1UP6Tftzi6zaAoo5hPFLVi/kXQ/Qb37bVrM/huDx4n7LaORp+uvKXiA1cs6oGkhTPwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h6e+Qg2u; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h6e+Qg2u"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2240aad70f2so54275ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 13:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743452322; x=1744057122; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HH9ugR7ohl5FyibYV7g8QOpVEDbx2dyyKdGZjKHgMmo=;
        b=h6e+Qg2uwW+FA1wFSfbfNomOeFNaXA+R0aATTy7Slc+iAhwiEk23hFtJhMFlcgNKWH
         2sA47WV/XUDQR5gYkIkyzzraE+ru7kja/FcP+CnIPEALMDqjV8C13UG/utQHN1dftahd
         CBxQa7vgeh+i+i9nqsHUrX+nnM42n7U6qk1I+K2LEOreBONKQCkDRK0u+tImabtJcuuG
         WOVwU/fjNA0VzecADooWsO5UU9vK2jnWfUYDj6durRi7dQPwTrfuoi6M0XjQ5UCCOu9Y
         YVrs7Mf378TL2Ppgb8CmDHwakSqb3fhUoxaRIiiF++V81qDpGOr3aY9EsL7DOvsqUcdS
         d8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743452322; x=1744057122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HH9ugR7ohl5FyibYV7g8QOpVEDbx2dyyKdGZjKHgMmo=;
        b=uT0Cg7WxtB7MtpfJ5FrJhedJdIdRHa8eID+o00SEHv/6Lwn/8f44LtilMkj4Ymvq5O
         /s0+jkI9/PaEFZy69bd7KdhM2x1e5W3rJYds4GmlRSJqlgt92WCQoI/bbPJgnNJuZnM6
         5xQc0TOkPpfB760JqMIG/yS7f1IPRBtD/snoHvzAcoKEbQCKoR8yvdyJpK9xpHueQ6Pw
         /GCZ2AIpaDXRX9acvX98GJb0pHV4zdGxHqcGtLOdIVKSIjbBAsAJyXeTUGgqOxf2lg/q
         bOAMQ+YkyiQYm6jn1F6Uc7bb0CMlP2RBIGkLTCEZ+Ves0NqVyln8UjDH8zO2oBV9faZi
         dXbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2wzAgCn4LJ4yy6VMkl49LH+p47Zj4JTGozFwP0xtLaY4Rd+WbOIDL79HbEmAZOGg8vl6dVMkLf62bXG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJpY1ae06ravQ7+jpJ2jlBUwZ8bS2hm3+Vcrw4J8ja+ZDqL1ic
	GHiGkyXR09EWofJ5wpRgT/KGGga2yRC3EgZHLsAbU4nz+G1vrJ28X12lX6ziDXZh9HfszI3NJNd
	LSokJEDvWs8+KLG+vrA1qUKA6hKf9Rb0g2v2S
X-Gm-Gg: ASbGnctz1BytDjRV5DoZ/dhfn/cuQDkqj8GemWApVpzdLzEyTL5z6uFgjf+AdADjmQ3
	no5OCO5TQ8BNDw1u/vaEwZZMYdGly/TB6O1dZPaF+bjfa1hUNStacY4iiVCodvCGaD+Og0migzu
	ESXlsIgnHsVOWGxIhKnFXz0gaAd7ykP0zoeDDdkKa6e0+Q/87vW2kHtYI=
X-Google-Smtp-Source: AGHT+IFL+rqYMbMSKezzEmH9uYCqvoFOtP8dbcbBgT2uz7t4kPEwNc1ulvIn1uNlGvnsBU7pLVmLH1JIMQOY9KUsFcA=
X-Received: by 2002:a17:903:2a90:b0:21f:40e8:6398 with SMTP id
 d9443c01a7336-2295b086e65mr688595ad.26.1743452322203; Mon, 31 Mar 2025
 13:18:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331172759.115604-1-leo.yan@arm.com>
In-Reply-To: <20250331172759.115604-1-leo.yan@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 31 Mar 2025 13:18:31 -0700
X-Gm-Features: AQ5f1JoUf2iRDSaddKTe28EiQsiYENfLfeNwASpTQpr1ndGUoNWAL0jYQr3RGTQ
Message-ID: <CAP-5=fVsgahBhOEOac52PmL0V+n1jqAxzf7n9PVWgWsxq9TvgQ@mail.gmail.com>
Subject: Re: [PATCH] perf tests switch-tracking: Fix timestamp comparison
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, "Liang, Kan" <kan.liang@linux.intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 10:28=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> The test might fail on the Arm64 platform with the error:
>
>   perf test -vvv "Track with sched_switch"
>   Missing sched_switch events
>
> The issue is caused by incorrect handling of timestamp comparisons. The
> comparison result, a signed 64-bit value, was being directly cast to an
> int, leading to incorrect sorting for sched events.
>
> Fix this by explicitly returning 0, 1, or -1 based on whether the result
> is zero, positive, or negative.

I'm reminded of a Java check I wrote for this:
https://errorprone.info/bugpattern/BadComparable
In clang -Wshorten-64-to-32 looks to cover this. I'll see if we can
clean those warnings up a bit.

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> Fixes: d44bc5582972 ("perf tests: Add a test for tracking with sched_swit=
ch")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/perf/tests/switch-tracking.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/tests/switch-tracking.c b/tools/perf/tests/switch=
-tracking.c
> index 8df3f9d9ffd2..6b3aac283c37 100644
> --- a/tools/perf/tests/switch-tracking.c
> +++ b/tools/perf/tests/switch-tracking.c
> @@ -264,7 +264,7 @@ static int compar(const void *a, const void *b)
>         const struct event_node *nodeb =3D b;
>         s64 cmp =3D nodea->event_time - nodeb->event_time;
>
> -       return cmp;
> +       return cmp < 0 ? -1 : (cmp > 0 ? 1 : 0);
>  }
>
>  static int process_events(struct evlist *evlist,
> --
> 2.34.1
>
