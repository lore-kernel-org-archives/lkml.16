Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83A02566F9
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211551; cv=none; b=VZ1HadxcMb5dZSZnaQOQfSMGb12a9zp2NEoc19jV+QPIxsbrLT04yjfW7NxfpkTvbuv0PC82ilH2hdDeq8BKCT7hlOY7XMmKDWyDwObYfOFuGysx8BzP5ol7ktNOuyBwCOQhD+uVpJUGKvzlg8RLxU9kzfGmEZhnuAbh2v0pOQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211551; c=relaxed/simple;
	bh=V8w670mAfywvY80iWDaOWwhJjVFhg9fLqTvGMmPdjbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=DIfXKJlaRh19Fe+tqTzhSnUCboiVVC8Um3wRDd5fLLoOlVcImwOfzMkVnsg2P4ew2AHpEObGzU/PcKhyTUAocB2KP+9EME/YXialEUmuAZJynappdUgCHKdzczi9TJzHyjaCpXw9DlqxRO+ZITO2MopcW2l2y3ZvcfmiopqjZZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TUkpnlOC; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TUkpnlOC"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3d13fe99d03so5065ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739211549; x=1739816349; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+sMdT0NOuuWVhnkOu/gKigGyptSOEeKnR8OjvwL+j48=;
        b=TUkpnlOCXGVuvuoMq+xSSbxlOLj+BAVItajon2L+WgeWFX0nGWvHA/OSXaH6KBiRjp
         +ga2hP4VvMjVf9EmQ84XEN6Ti7pGQWEnmr09r+6gxRQ37kb3wTA8k7d3Gk28aNogpQMf
         wfDI5m5LrCcyDmYRn2PHjkCTrGN7nRemWKNRy5Ycf9dkPgPvyEg67EwmH8YcEKgfUHRX
         51OpaL8JamSkuj7sLjMtqVxFpwjzZ5ydzYE0oJDqqjB7+ZVKV5BDQFR7yRSjqFKF6d0P
         bMvy//uS1xrbmagfVukwJwEWHIDsq7iybUwEHaP+KJjoW0C3+LTZ6H/EhWYD0eO+UV+g
         c7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739211549; x=1739816349;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+sMdT0NOuuWVhnkOu/gKigGyptSOEeKnR8OjvwL+j48=;
        b=lyXD1HFFGDhWimXDjIa/3D9TLerUhNra7uClc9EjY3NqsnlY1Vys0pdQSrUriDSWqY
         6PnWZrz2lm+PzUor6ui5YscVm5CyqBNi/jpkjTP4RxJ65tOw5TL0GHPXR13LijUshI8h
         9nA70HpZm+T80GnFlamjfdonJ57u1LHFqT07n0IBoZKtUBU0ikm+eM4M6H2tcYrjhALs
         aeLG+s++Bu3TQYxl6Ty0WA5dv/eNXfNag65Rd1I3y4Y/K3H8tYJpzRS3vPFEJI9KkjNk
         qWh0j1+hbxs2DKD7IbkGO6XVPDysJPErwIxSUcjosWE/ab0hLDrvj3VVZ+NvUzfISHd5
         CG1A==
X-Forwarded-Encrypted: i=1; AJvYcCXbqaPFE43PwfzVECQD/1nay7dhZ6W7yxIr1uDOYc0w3ycZqiTpWjK4G2zYt+7/HKPuSlUucg2OB1MLkJg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAXzuZtmvLZSsQ3vodvnALwuyUldHMTY+fe5IIXLxcvY9f05Zp
	j5b5hsjcqC1ejpf8jqOGnKccNPw23Ldxy+pAm2Cd7NM02XOjASNRCEc3CCZ79dfKnrA2RD18RkR
	1m+RzmEFFBQGh9htw362Bg7XYPhiTIlerKEsz
X-Gm-Gg: ASbGncuV6zgb3h88v3Uf4UZEV2Mz74148iW6EaqEsAPjafhq9CA8ieKibv05kGu4R7V
	HQ9Rwb6+eOJ7yGYAwzwyCae16WVlyXud7t36gOj5T+cJZ0QbQ3LbHy6aEl6yA9RKMFG5ZuI9iq+
	dmrrK32RXv0FD+UkaygnmF51vx
X-Google-Smtp-Source: AGHT+IGpznAZrivBH2hdCHpBdnGOPhKQMLngzUuWqC/ahVWQ75hTN9Z1ZqfesgkfM3nc+Y6zu4kxmzfq8A8Bo9zOwGo=
X-Received: by 2002:a05:6e02:16c5:b0:3d0:5855:85a3 with SMTP id
 e9e14a558f8ab-3d14cc6576bmr6788495ab.8.1739211548863; Mon, 10 Feb 2025
 10:19:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111190143.1029906-1-irogers@google.com>
In-Reply-To: <20250111190143.1029906-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 10 Feb 2025 10:18:56 -0800
X-Gm-Features: AWEUYZnoUb57cYIMl1CkEykd9ZMpycyCdZOdhHQMfLU_3xnpe08EqINt_HHw754
Message-ID: <CAP-5=fUcj9JFtfoTtZFcQJZ_oRA-hLKAzOerSM0rT7at=sRUTg@mail.gmail.com>
Subject: Re: [PATCH v1 00/10] Move uid filtering to BPF filters
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Hao Ge <gehao@kylinos.cn>, 
	James Clark <james.clark@linaro.org>, Howard Chu <howardchu95@gmail.com>, 
	Dominique Martinet <asmadeus@codewreck.org>, Levi Yun <yeoreum.yun@arm.com>, 
	Xu Yang <xu.yang_2@nxp.com>, Tengda Wu <wutengda@huaweicloud.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 11, 2025 at 11:01=E2=80=AFAM Ian Rogers <irogers@google.com> wr=
ote:
>
> Rather than scanning /proc and skipping PIDs based on their UIDs, use
> BPF filters for uid filtering. The /proc scanning in thread_map is
> racy as the PID may exit before the perf_event_open causing perf to
> abort. BPF UID filters are more robust as they avoid the race. Add a
> helper for commands that support UID filtering and wire up. Remove the
> non-BPF UID filtering support.
>
> Ian Rogers (10):
>   perf bench evlist-open-close: Reduce scope of 2 variables
>   perf parse-events filter: Use evsel__find_pmu
>   perf target: Separate parse_uid into its own function
>   perf parse-events: Add parse_uid_filter helper
>   perf record: Switch user option to use BPF filter
>   perf top: Switch user option to use BPF filter
>   perf trace: Switch user option to use BPF filter
>   perf bench evlist-open-close: Switch user option to use BPF filter
>   perf target: Remove uid from target
>   perf thread_map: Remove uid options
>
>  tools/perf/bench/evlist-open-close.c        | 76 ++++++++++++---------
>  tools/perf/builtin-ftrace.c                 |  1 -
>  tools/perf/builtin-kvm.c                    |  2 -
>  tools/perf/builtin-record.c                 | 26 +++----
>  tools/perf/builtin-stat.c                   |  4 +-
>  tools/perf/builtin-top.c                    | 22 +++---
>  tools/perf/builtin-trace.c                  | 25 ++++---
>  tools/perf/tests/backward-ring-buffer.c     |  1 -
>  tools/perf/tests/event-times.c              |  8 +--
>  tools/perf/tests/keep-tracking.c            |  2 +-
>  tools/perf/tests/mmap-basic.c               |  2 +-
>  tools/perf/tests/openat-syscall-all-cpus.c  |  2 +-
>  tools/perf/tests/openat-syscall-tp-fields.c |  1 -
>  tools/perf/tests/openat-syscall.c           |  2 +-
>  tools/perf/tests/perf-record.c              |  1 -
>  tools/perf/tests/perf-time-to-tsc.c         |  2 +-
>  tools/perf/tests/switch-tracking.c          |  2 +-
>  tools/perf/tests/task-exit.c                |  1 -
>  tools/perf/tests/thread-map.c               |  2 +-
>  tools/perf/util/bpf-filter.c                |  2 +-
>  tools/perf/util/evlist.c                    |  3 +-
>  tools/perf/util/parse-events.c              | 25 ++++---
>  tools/perf/util/parse-events.h              |  1 +
>  tools/perf/util/python.c                    | 10 +--
>  tools/perf/util/target.c                    | 54 ++-------------
>  tools/perf/util/target.h                    | 15 +---
>  tools/perf/util/thread_map.c                | 32 +--------
>  tools/perf/util/thread_map.h                |  6 +-
>  tools/perf/util/top.c                       |  4 +-
>  tools/perf/util/top.h                       |  1 +
>  30 files changed, 135 insertions(+), 200 deletions(-)

Ping. Always nice to see code being removed and the BPF based uid
filtering functionality is superior.

Thanks,
Ian
