Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C7A1FFC55
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748378376; cv=none; b=WTld7NtAG2q4+B0N9QH1Ze0XMVZshgpuKzXMaqfZTe7Yl8wWH2+XihPpGtBCe6Dvbh9GItvxs9vEYtTpdbrgLA2JsBzDQxVd0OQtHkLqxoXsjPzxflMQHQuvwrK+XN6THQW0CnD/LYQ6tEr7mxEf9I457rtxZEjyH/hx5TzDpO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748378376; c=relaxed/simple;
	bh=9K1qlOPi3Awpjhz2tRNBvB20u2JUlbfEpuK12EzVwtw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=FoJdzBrM3TaZgnRnF4As0J3xddSBvradvzjl7nq9Og4iTfOM9D8WwlXr7gzi2ati4MByOO7xutjGrEaM6/AQq1KqK6fqBQUv4Zbo5xE7fjW9Nd/+oo6IzeKrrtfI6Ycz0qgahRnl58PJEVJJ/OrITWxBHPAhVZITfApvGrRm6WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tOxnQWeC; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tOxnQWeC"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3dc8897f64cso15055ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748378374; x=1748983174; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxGFDwqRyg2W5WWt9JDFqQi7bJLxV0e0m6+5lkNnCUY=;
        b=tOxnQWeCCmb/9bEsZUP05MnZMLeNYM9Ok2N+QAhTxHPVviQN50ATJ5Lt5WaUEpty9H
         Gv/ZI5ZNjGLf/N4LPswky3ykKoRzrONV7p0TjjUtaUwu/9q6ZVKsoI5MVpLVSjIHeCDO
         6yNRW1SaTmPiGPM5KbQKl1YhV42CAsbDcsUHZykc6YNsubZFJWjXS6F0AcpZeNFWm3aC
         XA6ZZ/63S56zvb17aeTQar2+53Azl5ChBoW0lcHcT2zbG8Tewcm/1ksoUg6qUmMzrr6c
         N02lGG5J4rincUKY3VsMldjuAwoAKeX4y9L0nbltGwQDGmNyCcExYs/4yAp/wIKFEpZC
         +8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748378374; x=1748983174;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxGFDwqRyg2W5WWt9JDFqQi7bJLxV0e0m6+5lkNnCUY=;
        b=EsFrH3Ynmp8t99a/5VYFqmThBtQDTK7G7Wc/wF4+nvV0I2o0KEvhXCMLJ3WJZSf3/J
         zN5FP7O8lL3FKyaLkKdkw+gjm5N+nzwOeyOfE7sM12jCfXkkqo0mIT83vASHqHzaPzlR
         SSGiWSmyq8aWhe47cT94ntd3HxLVSoIfByWFLK5a245j2W/JA6a/nrgH338JM0bvo3nm
         GYEPVR0HAXTtdiaFeiQ/LAIkpFNYVEQMQvibQ4jMRopjbYEYImCa5rDnZLm9MLvp7Vqt
         I6wGFnvxZjQsE3hADc9xaFC9waNE0DJn+KttaR5n/4xZCj40Ja37/QmQiRRyuHwX7Txe
         V/dA==
X-Forwarded-Encrypted: i=1; AJvYcCW00jvhHrjQEVONEi2sfE/dW/2c6n0HTBEabZ292NJAk5FrEa2KQWNy4EE2hdKXO9eTRyNzNd8qmpUjPgI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzSqHOKyYC9LPLrZ8hND8VLla8jVli0rpiO/3KYsS1vZmg4Gs6
	CBXxdCUXVJO5Y93OTTLLZ32lXSALKQWS+yQWexlRapQPUAjMB67lyzsKZ6GYcBlAPCy8xLyk+pp
	Ig2RLatFrZOIOEL0Fr7SIchZQ5HCC7j+LX9ZZElIq
X-Gm-Gg: ASbGncsP6g+uyvDBYc86ENA7kPAujwyZqqtZ1sD2ymx2y6oQq62R74fI1KyrMTCTo1p
	FZobwv8OE6KlR7SB0cwYRSOUA9iXr2GYtkOXGW3gXFL47X71l3R+RP7mwFxi1WefAtROWUV1cb6
	PuMt4FyDHBGVf4UDikF7bgZVPbCSf1RnzcJFb/JDyDBn8FSvNikE1Z8/C5XyHhtaRQ7GAVrKzd
X-Google-Smtp-Source: AGHT+IG2icH2Y/FDLmWBOJMI54v0jKh22yxG1sb2LsUiO/EZg2xwKxpSIbO/FXeBFPngtSOnKjNsvL6ErGsQKy9C7Zo=
X-Received: by 2002:a05:6e02:1a8d:b0:3da:7c33:5099 with SMTP id
 e9e14a558f8ab-3dd89c5208dmr132745ab.13.1748378373491; Tue, 27 May 2025
 13:39:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425214008.176100-1-irogers@google.com>
In-Reply-To: <20250425214008.176100-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 27 May 2025 13:39:21 -0700
X-Gm-Features: AX0GCFu0vMV0uYp2KCfFVMxr8EIjrtS4vYgJCyG4a9k0iDeW-4w_Y8OZKcn1IOE
Message-ID: <CAP-5=fXiYHbe9gd_TNyy=txzrd+ONxecnpZr+uPeOnF5XxunGw@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] Move uid filtering to BPF filters
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Veronika Molnarova <vmolnaro@redhat.com>, Hao Ge <gehao@kylinos.cn>, 
	Howard Chu <howardchu95@gmail.com>, Weilin Wang <weilin.wang@intel.com>, 
	Levi Yun <yeoreum.yun@arm.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Dominique Martinet <asmadeus@codewreck.org>, Xu Yang <xu.yang_2@nxp.com>, 
	Tengda Wu <wutengda@huaweicloud.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 2:40=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> Rather than scanning /proc and skipping PIDs based on their UIDs, use
> BPF filters for uid filtering. The /proc scanning in thread_map is
> racy as the PID may exit before the perf_event_open causing perf to
> abort. BPF UID filters are more robust as they avoid the race. The
> /proc scanning also misses processes starting after the perf
> command. Add a helper for commands that support UID filtering and wire
> up. Remove the non-BPF UID filtering support given it doesn't work.
>
> v3: Add lengthier commit messages as requested by Arnaldo. Rebase on
>     tmp.perf-tools-next.
>
> v2: Add a perf record uid test (Namhyung) and force setting
>     system-wide for perf trace and perf record (Namhyung). Ensure the
>     uid filter isn't set on tracepoint evsels.
>
> v1: https://lore.kernel.org/lkml/20250111190143.1029906-1-irogers@google.=
com/

Ping. Thanks,
Ian

> Ian Rogers (10):
>   perf parse-events filter: Use evsel__find_pmu
>   perf target: Separate parse_uid into its own function
>   perf parse-events: Add parse_uid_filter helper
>   perf record: Switch user option to use BPF filter
>   perf tests record: Add basic uid filtering test
>   perf top: Switch user option to use BPF filter
>   perf trace: Switch user option to use BPF filter
>   perf bench evlist-open-close: Switch user option to use BPF filter
>   perf target: Remove uid from target
>   perf thread_map: Remove uid options
>
>  tools/perf/bench/evlist-open-close.c        | 36 ++++++++------
>  tools/perf/builtin-ftrace.c                 |  1 -
>  tools/perf/builtin-kvm.c                    |  2 -
>  tools/perf/builtin-record.c                 | 27 ++++++-----
>  tools/perf/builtin-stat.c                   |  4 +-
>  tools/perf/builtin-top.c                    | 22 +++++----
>  tools/perf/builtin-trace.c                  | 27 +++++++----
>  tools/perf/tests/backward-ring-buffer.c     |  1 -
>  tools/perf/tests/event-times.c              |  8 ++-
>  tools/perf/tests/keep-tracking.c            |  2 +-
>  tools/perf/tests/mmap-basic.c               |  2 +-
>  tools/perf/tests/openat-syscall-all-cpus.c  |  2 +-
>  tools/perf/tests/openat-syscall-tp-fields.c |  1 -
>  tools/perf/tests/openat-syscall.c           |  2 +-
>  tools/perf/tests/perf-record.c              |  1 -
>  tools/perf/tests/perf-time-to-tsc.c         |  2 +-
>  tools/perf/tests/shell/record.sh            | 26 ++++++++++
>  tools/perf/tests/switch-tracking.c          |  2 +-
>  tools/perf/tests/task-exit.c                |  1 -
>  tools/perf/tests/thread-map.c               |  2 +-
>  tools/perf/util/bpf-filter.c                |  2 +-
>  tools/perf/util/evlist.c                    |  3 +-
>  tools/perf/util/parse-events.c              | 33 ++++++++-----
>  tools/perf/util/parse-events.h              |  1 +
>  tools/perf/util/python.c                    | 10 ++--
>  tools/perf/util/target.c                    | 54 +++------------------
>  tools/perf/util/target.h                    | 15 ++----
>  tools/perf/util/thread_map.c                | 32 ++----------
>  tools/perf/util/thread_map.h                |  6 +--
>  tools/perf/util/top.c                       |  4 +-
>  tools/perf/util/top.h                       |  1 +
>  31 files changed, 150 insertions(+), 182 deletions(-)
>
> --
> 2.49.0.850.g28803427d3-goog
>
