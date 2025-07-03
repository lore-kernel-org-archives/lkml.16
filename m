Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1015D190679
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 03:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751514333; cv=none; b=iPjvqh1zTrMARHbnnRwGsGQ+INlEar2XHl+iBGHJojYsiwKdnQFxmpl5y0F1aSSxDJwMQiRvpb6mvn43vOcphoq7ZNZunFr7WdbfkCe1ZX9mB/lC/H2OmKWXg0qaPkclZb0wWk+kUhU095imI6cgZydW6h/OpKtjJdEEOW2z5aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751514333; c=relaxed/simple;
	bh=4GdcrjfvQWdgelhDLWcQPzqnyTyKDTaFyKAS0EHNcDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L+pzrag8wFg3KyxWOUGM+OwiUBSZPkexmlfpBvM9SX6eQwjrHOr9+3VbmJ57p5C24Pf7j9Dw0TUJUUciihHHagu13Aafox49vPmMS4w8C2zLf65i1o/ir8FI0dd06xhOQUrbgYgO66ZDq/FphkdunAvI4vY80ahoPTsD7mhZ8AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zsnkZomT; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zsnkZomT"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3ddc99e0b77so127375ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 20:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751514330; x=1752119130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iDWofyikxgAby3E+Q/6GP+cuqkz+oCYSVWUcRwa5HlY=;
        b=zsnkZomTrGzSNSmdyGepFKtx76OCRwHB3T6lKWDVJRmhFFQLz4Te8L+uhkjwA0QOTw
         eQIRtMU7YDsHOUflpKihGSWhqj1UXKAcNvp9wvPqDtgzK5PiU/HoHLYjahi9gk+NxW/4
         lqeLicXRARhcn88vitD7d1F5C8OuztqtLNgBsr4/pwh+ErIYp51fCxO0uwmVVOETw7K5
         RoEhZ7i8WGhR9AiSGl0xGYd9r2+d/XGnx3kp8Cq+BCwJrD4zD9mNygc2OSkcdGoYzna/
         MijYT3KT2nC+4Z4r0ujwwNB0z5oOJzRCAVJUu32D7OZ8VMoJyPgmvSsrKRqpzBi4uo7F
         cZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751514330; x=1752119130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iDWofyikxgAby3E+Q/6GP+cuqkz+oCYSVWUcRwa5HlY=;
        b=rwLhNf/z9YTTAD4HJLmKwpjMxF/P1YsXLjekz9XDSLqcPOARitNx4Iwj67hXZeZWts
         U6tv0WaaaejBD+ija3ZTxi3a9gKMzMq4C0SJqBRUY6/lCbU81fW6GQk4hQ5hC4h3/yGg
         Am9iV1O5XWm24k9YQM+3ZyVsCbLP+M7DcspkkWvkF9B4mqDIME4eU9Vhdodz5Di0j399
         xEC7KeAVXjo20pZYu1XG6ih9/ZZxzIgvIkHpRUz6vw0O+9UXOpsdrcsmB9tymBkuZdO6
         tDF69KWpXxTr05rZOhGyVkWMaHpykSDzd3HT5XtvoTkEu4kgqIY9Jwh4Jks3DT82eI+e
         Va6w==
X-Forwarded-Encrypted: i=1; AJvYcCXneW/wFp0V2FGdpR+iZk5LhGIv2r9/Hhlb1KIfpAcn26AawA0M7DBDKy5Ui1yuUHGeG8XZYh0Yom53nNM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yymeukd+on7EazY7e6AkgJbX2O/7pHxJDgI4WBBtjHgjOLWPu+D
	Oxyn6wyZbqJoOpQ3NVQJPGy/qeEkzny7uNMSUirYlIWz6j+dzz0ZGBkBAIXsICF8vYYLAJAXH2d
	aCkmbecNMDUDiBRcHmFdXu9lOlcjQIvuvTBSguInj
X-Gm-Gg: ASbGncvVfd8pqQvcZkwxjIeFAY1FB1nALS64MTPgEhby9CC7wEq4YOXCkeq9GP/9V8m
	zZulxAE4hXmwQc8pg/3g5iwMj2Qn/YpGaFFen51+ZqMUe7jbITcjjYcQpZLznsxfXJDOBml5lIN
	aXvuLANWvZ2gZDNX3O7YyEGfr/tuSYFCCgFPqS3f+Kq3p8
X-Google-Smtp-Source: AGHT+IGigOGHKR1OKei6llPQJNr2padfok25eTJWSFN+CoLzKy97HkPYRmaIV6tVfjlKhqIFtjbGuk5nRPbIu5WQrEg=
X-Received: by 2002:a05:6e02:3007:b0:3e0:5511:9796 with SMTP id
 e9e14a558f8ab-3e05d239337mr1635885ab.1.1751514330009; Wed, 02 Jul 2025
 20:45:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703014942.1369397-1-namhyung@kernel.org>
In-Reply-To: <20250703014942.1369397-1-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 2 Jul 2025 20:45:18 -0700
X-Gm-Features: Ac12FXxa_W9a-oE_jO77-zvKjtu2PHdq5PT0jO1zmeclhFiNuV2WlouuvaN4Mbw
Message-ID: <CAP-5=fWyb54utMyi0uKj6ek4qBmHmX2Xr9RR=s4o-ek5HdHHnA@mail.gmail.com>
Subject: Re: [PATCHSET 0/8] perf sched: Fix various memory leaks
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 6:49=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> w=
rote:
>
> Hello,
>
> While running the new perf sched test with ASAN, it fails due to
> memory leaks.  They comes mostly from missing thread__put() but
> sometimes it needs to release other data structures.
>
> Fix those leaks and add more subcommands to the test.

Thanks Namhyung, it may be worth adding Fixes tags for the benefit of backp=
orts.

Tested-by: Ian Rogers <irogers@google.com>

Ian




> Thanks,
> Namhyung
>
>
> Namhyung Kim (8):
>   perf sched: Make sure it frees the usage string
>   perf sched: Free thread->priv using priv_destructor
>   perf sched: Fix memory leaks in 'perf sched map'
>   perf sched: Fix thread leaks in 'perf sched timehist'
>   perf sched: Fix memory leaks for evsel->priv in timehist
>   perf sched: Use RC_CHK_EQUAL() to compare pointers
>   perf sched: Fix memory leaks in 'perf sched latency'
>   perf test: Add more test cases to sched test
>
>  tools/perf/builtin-sched.c      | 147 +++++++++++++++++++++++---------
>  tools/perf/tests/shell/sched.sh |  39 +++++++--
>  tools/perf/util/evsel.c         |  11 +++
>  tools/perf/util/evsel.h         |   2 +
>  4 files changed, 153 insertions(+), 46 deletions(-)
>
> --
> 2.50.0.727.gbf7dc18ff4-goog
>
