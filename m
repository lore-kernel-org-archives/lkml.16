Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71BA1A23B0
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235157; cv=none; b=bXpAsqP+ZA8FebqrJNRqJSDjxJglk0JE3IxFNDpmX6SrElbEEVvcsUhIToc7QLHbExdHtDaQ61UeALtl8ffiZFKn1NDHB9mzMEhY+YWzXe4pSzdUJriRDR85tBuOipu1389RhNp4a88nb0VwSFINLgqrYFyvdrNagX4WgnDzb5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235157; c=relaxed/simple;
	bh=zRHXtSXUEZEEK3PTfkjYgUsuNXEAzDR8CZiqeWbwF34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JyrBchmsnB4CdQBsuO74H55z1CgjTwNT+2RMoULQ2o2soqoV8zlVIsPFWTIeO0W4FFwvNpaexP7PUGQFxWDfECmzuHf52hxyzQlV/f97z9qmQXOF9+lYjPAh9vR5/WNuIVkbiEICM2q8ZbnreU413zFlXpIhz8WiFSv3e6rALRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GcEgDbMo; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GcEgDbMo"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3da76aea6d5so177495ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747235155; x=1747839955; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBwEDCsbuMxxVbCaLe0ZDfbDjJ026rxYJRU1vXl/qr4=;
        b=GcEgDbMoFMDt8RNGLXom+WFmtoKUGJKpwa+Dyi9JUI3kH1QKAnU25HgQ/2Tkln3kAq
         LN952blIFVLVMp3RrAw950LiRwXfPayoew5IzNU7eBkEDnMwnZ4bUyx0pTQN68zQGldv
         4SGDg/9EyKbIlrHMzlJrpDndz47Lrd8BdEMci9bBpAhzqk+YQs0E306dK9QhkVLHlqE2
         jU3WAIBA3mPKHVNURDf9uDy9JE6Um0MRK+bKEM5q/YXeKebNLr1ajkRWr5uhQkW09GGj
         IZFVYyfMs4ggQrbzBKGMa2KxQRVxIuVggGbSofqVA40k+dndYsdfhIorUCwOYXdEpDGk
         CB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747235155; x=1747839955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBwEDCsbuMxxVbCaLe0ZDfbDjJ026rxYJRU1vXl/qr4=;
        b=srcfa3QZrwW8XOtjc80WKY0uUzvVG0njUYosRauZ7lZGMgVYIqXV/6u/nycGWi6hVo
         bA+wRqdm1LEJEo9JyqcKfjRlOXvC5dDu5f5FFwOQOxFmaQuS5FtFPvvvdosA5zNSMMUj
         GMT+Rp6AEq4ijam4DQpj3Di3jItCDsKjpqnsMXN5H9XiJwok2Nlv6ikfEWWx5423xEYY
         0qtT5cQcJQhwJ4XfXoMqp/iF8gVm7tV1SLEYeypS7j8F/5s7SfXtujkk+40TQRKB6Cyi
         f7EN4QwWit/bFlVPpEBKtXABlxly+37HcLiVRMnAXfq/gSMu7UV3opGkxAVHKQm+fbcz
         gH+g==
X-Forwarded-Encrypted: i=1; AJvYcCV6L9ZX//NRKk7vnbyLUx/b6/hhQoFgq1yunfwtt0A19x4NRmytRq48isikTKBL078RpG0RSZB1+HBIjNY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvOpDZ3EeEh4IYVm1JiTzUO66jphM4m2I9bodVa+jrbIfCFdLR
	9v8AtMSeFE3oR8oNfD3+QrCm58Hx07DH9fUdQs1cW2crApBMgL+AqI0Cg3s2q8Aj9LRqAOEGPhR
	XnTpNIdZXaH5qc4dmpSuVSJ1JqEanHddjcUVJfKEf
X-Gm-Gg: ASbGnctciXFmsM5eh+sJDLe4OwHG5d+6scVLE8esVWKVgt2bflPTFr0GbUBpE3GA04s
	WHj9I1UBTj7R2WLUmACJ/7uNMgQ2CPDvimX1gDuDhEprOYsOmWH8L+Wv/85WBtgS4XwiflLv0Ms
	D3g0Rvz7/iMZcW6Ghdna2MQvOBmTz9NK6p1iRRuLhJVpuAs+Z+SDGkmUng5DA0jw==
X-Google-Smtp-Source: AGHT+IHI/F+qf+jjIVI/t0RACaAA5362bq72lQw/BShbJITOcV6N2SAlxkQFjmupoAJ6GQBB/mbrwIOCeXIztyL6nGg=
X-Received: by 2002:a05:6e02:17c9:b0:3d9:6e2d:c7ed with SMTP id
 e9e14a558f8ab-3db706435a0mr3229695ab.15.1747235154528; Wed, 14 May 2025
 08:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513231813.13846-1-thomas.falcon@intel.com>
In-Reply-To: <20250513231813.13846-1-thomas.falcon@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 14 May 2025 08:05:43 -0700
X-Gm-Features: AX0GCFtnwnSh7WBr6q1x7iyJ1LE0u_2hQI7GYeSBL4LD5fFxhKoET9QpVquX4y0
Message-ID: <CAP-5=fXJtkjJ34d-Rk_APUxXuummZpwPWawUWea3NHMaRFCD3Q@mail.gmail.com>
Subject: Re: [PATCH 1/2 v1] perf: move perf_pmus__find_core_pmu() prototype to pmus.h
To: Thomas Falcon <thomas.falcon@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 4:18=E2=80=AFPM Thomas Falcon <thomas.falcon@intel.=
com> wrote:
>
> perf_pmus__find_core_pmu() is implemented in util/pmus.c but its
> prototpye is in util/pmu.h. Move it to util/pmus.h.
>
> Suggested-by: Ian Rogers <irogers@google.com>
> Signed-off-by: Thomas Falcon <thomas.falcon@intel.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks!
Ian

> ---
>  tools/perf/util/pmu.h  | 1 -
>  tools/perf/util/pmus.h | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
> index a1fdd6d50c53..d38a63ba4583 100644
> --- a/tools/perf/util/pmu.h
> +++ b/tools/perf/util/pmu.h
> @@ -298,7 +298,6 @@ struct perf_pmu *perf_pmu__lookup(struct list_head *p=
mus, int dirfd, const char
>                                   bool eager_load);
>  struct perf_pmu *perf_pmu__create_placeholder_core_pmu(struct list_head =
*core_pmus);
>  void perf_pmu__delete(struct perf_pmu *pmu);
> -struct perf_pmu *perf_pmus__find_core_pmu(void);
>
>  const char *perf_pmu__name_from_config(struct perf_pmu *pmu, u64 config)=
;
>  bool perf_pmu__is_fake(const struct perf_pmu *pmu);
> diff --git a/tools/perf/util/pmus.h b/tools/perf/util/pmus.h
> index 8def20e615ad..d6a8d95af376 100644
> --- a/tools/perf/util/pmus.h
> +++ b/tools/perf/util/pmus.h
> @@ -33,5 +33,6 @@ struct perf_pmu *perf_pmus__add_test_hwmon_pmu(int hwmo=
n_dir,
>                                                const char *sysfs_name,
>                                                const char *name);
>  struct perf_pmu *perf_pmus__fake_pmu(void);
> +struct perf_pmu *perf_pmus__find_core_pmu(void);
>
>  #endif /* __PMUS_H */
> --
> 2.49.0
>
