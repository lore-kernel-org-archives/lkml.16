Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F5A21CC5B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 20:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745526316; cv=none; b=UV1M+0lL4u3OAgpwCU0jYJkatzbXjmNV8DwVlcua7zy1jr8rfx9tRmgi+B8mI72rfMZnTnLjHvHZcJT7vXnbSlnW3FA7fwOM+/+nD7AcBrYOGKfzvjPeaoGDX4bppCULfGU6Q9XVoPAbtdiV9rwFkNQMVOn248Hht3hCm11ujUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745526316; c=relaxed/simple;
	bh=fafVTpiamEHy/uMqhecPP6xoPwLgHu181eBWDrBjYPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=rTBrTsLQ/h5v1JFuIl1nOuRYLFbmhqSobQlNg8z+rRM167m4VupZIV++0z9+Hemv+8+0yLwzHSrbcUl7InqYrBLCSI3Ec3/PHRrm7L7EBuujVaFFTNZas+BRzpqg/3ItlUAXbW9wIn7eMtNjuoku4KOj4n4Te1g8143taMIC3Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rhsY8quE; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rhsY8quE"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d44cb27ef4so3125ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745526312; x=1746131112; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1CCui5nQ+UD3eYDY+CSYEAL46oUEZP2/pCYzQHZplJA=;
        b=rhsY8quE+x6XCcUMEvyYo2kBnHIjwJ4zDJguPSukBp0zoSdxZHNVt7r1jXCQpKlXKg
         vzbN6BcBC5JEex9hHBj2jiWOrfJcpv1ll1ly6nZJecAztvMThUFNpDxzXvQeOEWLQLrR
         FKKr/ynrfg8rMaHxXYgI97QRjlWpVQ8HwSxpkSSwuIeN3g+jGzJht3YNhCBA0ggWwYWC
         rxbjGEs4o1tYWvN888ZDjknagwODLBx0ReimvwAl6YaqfoCQcslPc+otNbhB+BHn9B5P
         adc2X6DhK9O9lmM9GXWhw4YoejUVwefUYlBeCiIxP2D14ASjZrvQCm5eCEG3nbyVrTgo
         u1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745526312; x=1746131112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1CCui5nQ+UD3eYDY+CSYEAL46oUEZP2/pCYzQHZplJA=;
        b=Trb5WzLnqISbpWKaNDBAIPojBkqHCEiByqQO37HVJk80QYyhIauvQD7QLKGoeN/jas
         dFI6+Qq1isF923s5ofZ/wLlbWgrk+7euX6556MXGY9GOtlcRmmotm8ZfQVzNrUy4vwLb
         YrRnufrpswoIciPDj0z/cGgEYLGWPAhkjgcqNON77n+9jF59Y6VrbHwvA65LuKJtY4d/
         Ck5gfHM3kXXBRxyAdDzxGSj8eR2vT+zI5KvrgZAjfkKualz/4vXBdjgS3Mi1gJmhZObs
         hfwEaOmuGT4d2mSkSVvadvtPFCWjmTMLNvtnDXdlKZ7srzwXI4NCVJOQluZ7OciUvWJV
         tbqg==
X-Forwarded-Encrypted: i=1; AJvYcCV7L5S/BTHO2WRa6Vf3VGZrM5ojy4mn7la5KweOtYfqT44XIlFkGG00LiH0q63E9/QEOhX/itwWs1ZoXmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS2xFE0Kf4jukLwSvaKuOFOHrqngZ7/rzo3lL/o4xI1aAEPpXr
	PKvnF66UqXb9ygeAi9HWXIaLenjgrf6wwIZK3ynZxJLEzOPzv20puIj95z/2oO/rTePOliDvefm
	KpwPnasYXEnWJqjr0XT9NfGRXgv5Qr7v7Ni6u
X-Gm-Gg: ASbGncte8iqd7eUpT1uBkDLHdKuuz2uvmTI9jlY/fGrONt4MQE5SxqarVfXDP1E5/IE
	libUiTqVRibO0Zqg9Hu5vBOpfVdIDGlZXm/eHI9R/Uz0nU/HuSt9jPz2TGh7h65TpJJMeRENUPu
	O5nBJGo61y8U9tKiRgDLogXdaUAXpA93sy7BD83TET+nfLE1eCLU0=
X-Google-Smtp-Source: AGHT+IE/sZKvnBNnWmKMWKbj4vT6Y3NTAhyE5RSAQ8RfFq17ESLSBVd85E820ZoDdX0XVKsiJSHpcAtlqZT6XpX1ED8=
X-Received: by 2002:a05:6e02:19cf:b0:3d9:2a76:94be with SMTP id
 e9e14a558f8ab-3d939823ce2mr714415ab.14.1745526312287; Thu, 24 Apr 2025
 13:25:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410173631.1713627-1-irogers@google.com>
In-Reply-To: <20250410173631.1713627-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 24 Apr 2025 13:25:00 -0700
X-Gm-Features: ATxdqUH0pzpE_olqwsX6H8de4juHukePstPSl5KesBuzVOEbeWOE41P_uOGuzjE
Message-ID: <CAP-5=fUM7TgwehAPb3e1_v_-R4h4eeetrSpYAGLP=aEXzchNAw@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] Move uid filtering to BPF filters
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

On Thu, Apr 10, 2025 at 10:36=E2=80=AFAM Ian Rogers <irogers@google.com> wr=
ote:
>
> Rather than scanning /proc and skipping PIDs based on their UIDs, use
> BPF filters for uid filtering. The /proc scanning in thread_map is
> racy as the PID may exit before the perf_event_open causing perf to
> abort. BPF UID filters are more robust as they avoid the race. Add a
> helper for commands that support UID filtering and wire up. Remove the
> non-BPF UID filtering support given it doesn't work.
>
> v2: Add a perf record uid test (Namhyung) and force setting
>     system-wide for perf trace and perf record (Namhyung). Ensure the
>     uid filter isn't set on tracepoint evsels.
>
> v1: https://lore.kernel.org/lkml/20250111190143.1029906-1-irogers@google.=
com/

Ping.

Thanks,
Ian

> Ian Rogers (12):
>   perf tests record: Cleanup improvements
>   perf bench evlist-open-close: Reduce scope of 2 variables
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
>  tools/perf/bench/evlist-open-close.c        | 76 ++++++++++++---------
>  tools/perf/builtin-ftrace.c                 |  1 -
>  tools/perf/builtin-kvm.c                    |  2 -
>  tools/perf/builtin-record.c                 | 27 +++++---
>  tools/perf/builtin-stat.c                   |  4 +-
>  tools/perf/builtin-top.c                    | 22 +++---
>  tools/perf/builtin-trace.c                  | 27 +++++---
>  tools/perf/tests/backward-ring-buffer.c     |  1 -
>  tools/perf/tests/event-times.c              |  8 +--
>  tools/perf/tests/keep-tracking.c            |  2 +-
>  tools/perf/tests/mmap-basic.c               |  2 +-
>  tools/perf/tests/openat-syscall-all-cpus.c  |  2 +-
>  tools/perf/tests/openat-syscall-tp-fields.c |  1 -
>  tools/perf/tests/openat-syscall.c           |  2 +-
>  tools/perf/tests/perf-record.c              |  1 -
>  tools/perf/tests/perf-time-to-tsc.c         |  2 +-
>  tools/perf/tests/shell/record.sh            | 36 ++++++++--
>  tools/perf/tests/switch-tracking.c          |  2 +-
>  tools/perf/tests/task-exit.c                |  1 -
>  tools/perf/tests/thread-map.c               |  2 +-
>  tools/perf/util/bpf-filter.c                |  2 +-
>  tools/perf/util/evlist.c                    |  3 +-
>  tools/perf/util/parse-events.c              | 33 ++++++---
>  tools/perf/util/parse-events.h              |  1 +
>  tools/perf/util/python.c                    | 10 +--
>  tools/perf/util/target.c                    | 54 ++-------------
>  tools/perf/util/target.h                    | 15 +---
>  tools/perf/util/thread_map.c                | 32 +--------
>  tools/perf/util/thread_map.h                |  6 +-
>  tools/perf/util/top.c                       |  4 +-
>  tools/perf/util/top.h                       |  1 +
>  31 files changed, 178 insertions(+), 204 deletions(-)
>
> --
> 2.49.0.604.gff1f9ca942-goog
>
