Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15091A0BF3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 15:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751385128; cv=none; b=FvB0aEjjCMGBcig8v/ZlmWPbj4ymK97vi3P2PeEaUYGyNbp8VDZz9hYmaLYsumz8CCjKm1VrXzLA/BJv10CikhTx0QaXWp/UPl3EjyfFMcijM5tOtuU1SRVYiiCjIgJX1/lAU+uzQEVq5Z6A6N2xH9aGxD37do31VkHuqSu/gOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751385128; c=relaxed/simple;
	bh=60paJ9dkoePVY0joqWjxRuoqgt2se6eC5AkvvT7/45Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CQ/42rVER6EhBDVsHauQkgVmV7sMW3QnaQglllHMc2OUDRRGRnFRYOrm4cYt2n+AP1bFvm9yOT9I0Wczc5S69Ljb1W3/rwRKkrm4hu6mx3OshlnGw0SWnzpOTUJGXKP5g7xM3okZRE08fY3DS/l56upL0ov2WAnzZiBfeQaImoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3RnfCIeT; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3RnfCIeT"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3ddc99e0b77so249555ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 08:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751385126; x=1751989926; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ltFq5/UO7jS5LyNuHu5RFaNlO12ewRbrcE9wajSRRE=;
        b=3RnfCIeT+/RUpodBXuFpnm7XUvjgPnMr22gcZNXMmmZ5B+Q/KyaKuFkYQncOH4p347
         jVX+y0YWN+5/9U9dNSdmp79AsKdzmKzFXd2650dywAQmXs55J/21yzZWLwEVcspyX/nM
         oH3kN7UlbEf/pFLqUmJP4qcK7JTK9wmaNKgTzyQdZOzYhVM6OmpPLeE8l3EkFsvIAkQo
         1faTaqFWO42pfAdBvYHzChhZfWdrG3123hHN6IdnPSWEJXFaT1MaosrUPm/tzuYg05fj
         xXar6d8Jl0IZdiDGgh6xlgxaHtWKwGJ0KJgTGKkQoAH/KboxlA7md0rp9JC/UtWrvldr
         EjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751385126; x=1751989926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ltFq5/UO7jS5LyNuHu5RFaNlO12ewRbrcE9wajSRRE=;
        b=neVsaa0hfhdAbkVRe6MUlPg2Ii/FyIN2vvzqc5hT1yLZ6gwbdqW4dRM0P62l9A6ARE
         UiKDgMbQTY3MM08Jt003eV6HgdKUjq/Y7BaDmyh3PqBDpmxuED3u0YkHfOPD3d9qluJ7
         29iX25rOSQWN889+Qtdr/q3JoZc77xUmzmUMXQCVMH+83N4IVTUsnNL/FFoimGxXW4Cb
         TXPe7qK5ihYVrGEl0r6F9825RtMtm9RuT/n2noyjbx2q1w0D1YKc6VQUAyZMFdUmjvLH
         NUZOppvcdUmh5Dmng7Ae3Zad4bNE9Z4i8PP2SfysSFg97Q/2/I5gxo88W6gAroFc1W9k
         ivpw==
X-Forwarded-Encrypted: i=1; AJvYcCULJu3jPVV2+mr4jpaN/hCxJrIIREsNag9Q9xBr42G4TitGcG+vCC9ptzFA0nmtpLpmAQAzSTJWUceX2Jg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhaooGX1nyVBUGhWJUrNiY3b5iWX8i/nFn+1tcAiiA+vYD9M7s
	KjgO/JS572e/T1LjvLwEgrzpmL8k6LZsKckWtaCF0jKQ9hKiV6a1PGdjK89Anr11ewFfnYpcTPE
	VmQKNBnEAnm6A+oZ/cZpsRri9Ig4QTwhcMOL0GptS/lGEbuKprvNWmmdv5kc=
X-Gm-Gg: ASbGnctIEiZKSYillw5gH2eH0pXQSt2BWtd3Plttr/Aa2eUECrxrFG7OdQ+xpcu0wBt
	wZQNOiZVbCcXtNpWeuV1joGzMJepFdPhslOYFDlQ4HWpJbhkidb3IrqDxWkUvCLRDxV5NXEKRhQ
	uwuj5rMkgN712LIpWZmaBlQrK5lWXQqHcNlbA0AUty98JkdbedpGFkfRPREdLii+nzodoYqlI=
X-Google-Smtp-Source: AGHT+IF6DfbRMY20+4qfsy74YqduuAaRjdqEUFD3uatM0owIBT7apeOa0YClPxbIr9krf19DZjSDBHUIjAxeKGWy/Sc=
X-Received: by 2002:a92:ca4b:0:b0:3dd:c526:434f with SMTP id
 e9e14a558f8ab-3e049bb481amr2735795ab.9.1751385125570; Tue, 01 Jul 2025
 08:52:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630233246.1063977-1-namhyung@kernel.org>
In-Reply-To: <20250630233246.1063977-1-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 1 Jul 2025 08:51:53 -0700
X-Gm-Features: Ac12FXwEEhVNt79ZiRrfHo8f5aNNylKLoeDH5dXjVZFsY63Rq8R5Kb4soOkgIe4
Message-ID: <CAP-5=fXFESx7_+CY-QMnaZSkPSxTGFqwr1eKhHmTbEJoYeMTvQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] perf test: Check test suite description only
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 4:32=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> Currently perf test checks the given string with descriptions for both
> test suites and cases (subtests).  But sometimes it's confusing since
> the subtests don't contain the important keyword.
>
> I think it's better to check the suite level and run the whole suite
> together.
>
> Before:
>   $ perf test hwmon
>   (no output)
>
> After:
>   $ perf test hwmon
>    10: Hwmon PMU                                                       :
>    10.1: Basic parsing test                                            : =
Ok
>    10.2: Parsing without PMU name                                      : =
Ok
>    10.3: Parsing with PMU name                                         : =
Ok

This is better, thanks!

> Signed-off-by: Namhyung Kim <namhyung@kernel.org>
> ---
>  tools/perf/tests/builtin-test.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/tools/perf/tests/builtin-test.c b/tools/perf/tests/builtin-t=
est.c
> index 80375ca39a37a256..dfaff4185eb05a1a 100644
> --- a/tools/perf/tests/builtin-test.c
> +++ b/tools/perf/tests/builtin-test.c
> @@ -567,10 +567,6 @@ static int __cmd_test(struct test_suite **suites, in=
t argc, const char *argv[],
>
>                         for (unsigned int run =3D 0; run < runs_per_test;=
 run++) {
>                                 test_suite__for_each_test_case(*t, curr_t=
est_case) {
> -                                       if (!perf_test__matches(test_desc=
ription(*t, curr_test_case),
> -                                                               curr_suit=
e, argc, argv))
> -                                               continue;
> -

This will change the behavior so that if a sub-test matches but the
test suite as a whole doesn't the whole test suite will now be run.
For example:

```
$ perf test list
...
 39: CPU map
39.1: Synthesize cpu map
39.2: Print cpu map
39.3: Merge cpu map
39.4: Intersect cpu map
39.5: Equal cpu map
...
$ perf test -v "Equal cpu map"
39.5: Equal cpu map                                                 : Ok
```

whereas with this change the whole of the "CPU map" test suite will be
run. I think the condition:

```
if (!perf_test__matches(test_description(*t, curr_test_case),
curr_suite, argc, argv))
```

should  be:

```
if (!perf_test__matches(test_description(*t, curr_test_case),
curr_suite, argc, argv) &&
    !perf_test__matches(test_description(*t, -1), curr_suite, argc, argv))
```

But you could avoid computing the extra perf_test__matches with a
boolean as that test is done immediately before.

Thanks,
Ian

>                                         err =3D start_test(*t, curr_suite=
, curr_test_case,
>                                                          &child_tests[chi=
ld_test_num++],
>                                                          width, pass);
> --
> 2.50.0.727.gbf7dc18ff4-goog
>
