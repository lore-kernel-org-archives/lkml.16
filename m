Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60A41EE033
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 22:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743545115; cv=none; b=Uh4EkTR4ciFlkbmI16yyi8nffOGHWbDsJYK31L2+MMvj6ARLTHSVguc9uCipomKy4aumS0lZSdnkpOT9VuPQjN443KNcq1zAVuwSn+7sYSL33yKt7Se5Vzx0BmcmGs62RvvAm00y/vXe2OH9e5HMLABSMwsh8LXxpEbLUoSDItI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743545115; c=relaxed/simple;
	bh=HlGfv4iz54EHzctztjZOLKN1PODK/B4a3a8b77wJGvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=mYRHq9ZcogkLURFP0poWH/7HfNftLCXy26ADmR+4inoSXq+T2arB6taKPTP+DmVT2eZWlojhA3izhfI8iWzyxvNNu0GfoeK1ulA6kO1nf0ECEt5zNN9UDmVPVnLJOG5oQrOEicuH3yk7wmLwU5uYRaGYJnQMhCy50FRWYUE3b50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z4mgXXJe; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z4mgXXJe"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2264c9d0295so66105ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 15:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743545113; x=1744149913; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qai9DMQZxsab9OWncJhs/lmdIQOyIQkiN593aFUVGd4=;
        b=Z4mgXXJeZ5tRradS8rNrR7KnMefeP0pSmfDlGFWgQGC+q+WVsN0QCgIRfpsnIGGsxA
         YZEbHGdh4BrSvcVjMuf0cQwD8JUZ1JnnXpCPnVEsBgLeFXkkmLvEfHMT1AqlMfu8I0CW
         JlvAypGhBNarNM509hA5xqQkIAoc36+VXV2prp4hZgD6sUpy69yoBbk1cXU0amlhoi0S
         5/VBYWjavbmm+XadowQdaNi2fPVtaf8dBWwvzvEx1tfcJv7t4rbytfmBXXnhzWD2luj7
         SU6BJUvxLNTU6W/2uvU/xp3uyO39RMdb9rjyH1NwjrLUmDJ6P3fs3bgcysjcrepQuKc0
         P2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743545113; x=1744149913;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qai9DMQZxsab9OWncJhs/lmdIQOyIQkiN593aFUVGd4=;
        b=YFJBlYPUThDDp+A6sQR1JLVi/uRbfraW4Ic/NWDqpguYIynWdymvbTkvTQZGiHk/Mn
         O9gsWrnyARU8lB/3MQe4cuQXOu/XmwySfV/J5AjMgHsbeYAeqW19ao4SCVktf7o0kahV
         tbspLpBP/ZoVzP+2oFBdy54oejy6u1DgZQdo9qus+xJ2+22DWiZtve+BQD5s4UQHTv5t
         AI4Iq8nn8iOOKnvIojXD09vvOYbcBQP5FD8C6/sxsrSMldFq5Zdha2StLIpQSUIcPR6g
         VYNccl6sHTO7oKKLpy9Icd3fw3RFJS4NveMw5aXTr2hjNqzVjTfqe+zW3J5eMDcPEtpj
         PBhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3VLxxQ5WsVXCPc1FW3BFAH0PR3u34SLW8r9mBmo6Iqa9bSePTrBQf/swPnKjpcC2MKcykyNGOlBJWPmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTN/ep8xYepAz9pgOg8Sbx/l4nBTpizMiLdvxmj6VSAEPYKGTq
	rwcw6eNMVARkwYd2+xMWbDGZ0idJd0DPPSKaUTzKHWdaCSJ1eFuzKsGRzzip2n8BhnldNvXc7O9
	6sMCU+PO9fwfBIZ7uooyhcBqNjENNEW0QhB77
X-Gm-Gg: ASbGncuNolI4xqiLLIxZTzoNc1iRgpSqAquTunQbs+j0K36wcRGJXYboqng2VQgcgs0
	ShVbXoXZJq4zhMwXytEvkxh3G0SQSjlMV6wMZVLWzxcTr6NFKQrPAIR40esN1Jx5gTuAkH5IYs0
	Dl2U5kPbOeGd0heksMWbUiQiRdf8Mxa11nm44RbnjNlfGSpoA6+vvl3IEAvm08KrON
X-Google-Smtp-Source: AGHT+IFVQpufgbLLA6YECN41K61P1pEGrmuIBYIE15m3wWzbXyC5CFZGk1U9guX3blOCJkUvw+PNymy7JiuwXiX3vwY=
X-Received: by 2002:a17:903:2343:b0:216:201e:1b63 with SMTP id
 d9443c01a7336-2296bbaa3f4mr235505ad.11.1743545112407; Tue, 01 Apr 2025
 15:05:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318041442.321230-1-irogers@google.com>
In-Reply-To: <20250318041442.321230-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 1 Apr 2025 15:05:01 -0700
X-Gm-Features: AQ5f1Jrm0n1hpopd8bYhxwuZIQuw9NdG27Q-sy1ltH8Ws2qq834WxY1YasF98-4
Message-ID: <CAP-5=fX6FubpJeROoXa10jV8RnAD0LKS1GaAcidLzbwZgOmQXg@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] NMI warning and debug improvements
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Howard Chu <howardchu95@gmail.com>, 
	Weilin Wang <weilin.wang@intel.com>, Levi Yun <yeoreum.yun@arm.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Andi Kleen <ak@linux.intel.com>, 
	James Clark <james.clark@linaro.org>, Dominique Martinet <asmadeus@codewreck.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 9:14=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> The NMI warning wouldn't fire even if all the events were for one PMU
> type. Remove a nearby, and no longer useful, mixed hardware event
> group function. Improve the evlist to string function and dump it in
> verbose mode after the reordered events warning.
>
> As commonly happens legacy events like instructions will be uniquified
> to hybrid events like cpu_core/instructions/, even though the
> encodings differ. To make this correct either:
> https://lore.kernel.org/lkml/20250312211623.2495798-1-irogers@google.com/
> or:
> https://lore.kernel.org/linux-perf-users/20250109222109.567031-1-irogers@=
google.com/
> needs merging.
>
> Ian Rogers (5):
>   perf stat: Better hybrid support for the NMI watchdog warning
>   perf stat: Remove print_mixed_hw_group_error
>   perf evlist: Refactor evlist__scnprintf_evsels
>   perf evlist: Add groups to evlist__format_evsels
>   perf parse-events: Add debug dump of evlist if reordered

Ping.

Thanks,
Ian

>  tools/perf/builtin-record.c    |  9 ++++---
>  tools/perf/util/evlist.c       | 32 +++++++++++++++---------
>  tools/perf/util/evlist.h       |  3 ++-
>  tools/perf/util/parse-events.c | 16 +++++++++---
>  tools/perf/util/stat-display.c | 45 ++++++++++------------------------
>  tools/perf/util/stat.h         |  1 -
>  6 files changed, 55 insertions(+), 51 deletions(-)
>
> --
> 2.49.0.rc1.451.g8f38331e32-goog
>
