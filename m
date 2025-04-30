Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205662DC77D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 00:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745972674; cv=none; b=PweGSBk54xNCzGzpanIS44Q3sSRx3uF0B7uQaNYM07qXsTvp7H3IH1NKWJDw60YevaD91Vb7Ci04EfYghoT6Eo8B1NklcqZU9DjeMNJsxPWvZwI8j/XOHpODYGApvmVlF871pgsCNTKx5+X88kJyi1nchwBOJOe9+1STcMMYiTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745972674; c=relaxed/simple;
	bh=SVBKQRaD+pc2oozHM9FJP56TA7JsjUqWU4fId+vRf54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Afn05qUEUCzcKWv6QcGK694ZL06iEoWO5nqScnPP1osJv85AnEqNS04R8Two60t9Yz3yjGvKb/kUgmw7j/4oEYYA92fO1eEuzF/S4b276xce7Vyn5cfnfF5EYiOy8KAh3ThK4xcayPX06vIiFBXClkWnFMAXp6CEY3bI/HOkenk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TscSiY19; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TscSiY19"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3d44cb27ef4so80965ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745972671; x=1746577471; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfnEQM+OI/9Zb5rBitTrywPeYSIe0JsG+EMavn2ZaPs=;
        b=TscSiY19XVQKMjJo6pzDRzIFQ6fZrHhqg1Xgpa0KEAohkhZQTr2L7ACSbImp9sn5JN
         pCzuD+k0qG3sXnBxZmUYBt2FVlMwQN66Nzy+iHJrnmk//rf5aZ0fgAX9YywWG37l4KRJ
         326RXuA1g1CrWU/7Zqfy0iDvDQ6+eeoV8nX8DYWmWLA8TldUZ9rnQM86rRiNpjtMJjeO
         EyM5zRBpMoz+zn6E7QjM5Nj0OIbLFM6FJhkbVJFd0B5JvT2VFrF/PVdKqmOMQl6Fgj1R
         sqfk6nNIYO6zgGZ6OXBt+jCElqHCH6rmbgYv46Ezqwzz+JCtxBHsuxyDZUL1nYGpMWJl
         fj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972671; x=1746577471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfnEQM+OI/9Zb5rBitTrywPeYSIe0JsG+EMavn2ZaPs=;
        b=Xc9HGiZ+qQqSfVnx93O0CAZR9k3ifhaPEym/7xTft5OyUWGw4LC3WWOboI87QGwvv5
         Qn0x41YlCK2iFVbZzET9EcHcr5/zDPgxzlevMpXfpUllqy2tTyXEhTt3fYu6iA/ISNd2
         Qt7n4C3J5q1lTRpuzd5YXVuXafUkTJv3TRHfGXQhp3H3OCnm9m+fCVOKXyZW5wj+inW3
         p7rYq5AJ/Asq3LS6K8QyLX7UnIVtpBCmjoHQJxYiLyz50+U7DsoWt3ARBH7G05RYjuaQ
         urTYc39HXbfpDAr5jvG9NkZCfbIUAfOhYKM2VW9QgcEUnGlWg2LfZWSFDfmWnG6UWgID
         Iw2w==
X-Forwarded-Encrypted: i=1; AJvYcCVIYtpzyuYVP9w+r/SlKqWI08lDb8MhIvRefPOSliE6VDkgI+ws0Esuwcm4sc0jjXsTWXmdDki5ySc1Wls=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTTFzQUWMJOoYyaniaF0gSin5HBPSenlWu4GbexJ9pNabz1DMY
	iQaSDIZ6aREqsLJOvMeR+fO9wEPjQrJLOl/p18JeCrjumM8GmaAQERZtoO5D1GBfYMM0Srdjy9Q
	mHwWLojqHcArHKdsQ24GBRH8sn+BYgbmvvJGC
X-Gm-Gg: ASbGnctQBKH01RQdYaHs5q0ltzGOpOOKy7eJlQImcFFf7cSn69nslzd58chaTDcF5oY
	xuaanSLaMg4PNoqpltPcC3FkIIPErsvoZtVQFX6BCHuWXS5PYkzmmKMhqeuadRU5gthGW7fZ80z
	IfHBQXNocFYDCZbPpaD9Hs87Bs0S921ZcOCQ==
X-Google-Smtp-Source: AGHT+IFvMyC0i9SD2AIanZuarEXq/nVMiHDXfN1zanfzkQ1wYHtHOZeag/IQagtoWu0Y074s/SHzs/s1TZ4iy5ijQ1A=
X-Received: by 2002:a05:6e02:18c6:b0:3d4:6f05:dfde with SMTP id
 e9e14a558f8ab-3d96761218cmr1585405ab.22.1745972670925; Tue, 29 Apr 2025
 17:24:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402201549.4090305-1-irogers@google.com> <18c2fb33-2b3a-4ebe-ab26-8cebe0b6b94c@linux.intel.com>
In-Reply-To: <18c2fb33-2b3a-4ebe-ab26-8cebe0b6b94c@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 29 Apr 2025 17:24:19 -0700
X-Gm-Features: ATxdqUH3eXojgNt7cQNxNZcVbYdXqWfNpU3cNDaLVnlRGBaG315cXDbD7DXJitE
Message-ID: <CAP-5=fXDriX5ipdvierw5VMTBUp-Q+97Xi5peaTmabe=Gp1BMw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] NMI warning and debug improvements
To: "Liang, Kan" <kan.liang@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Howard Chu <howardchu95@gmail.com>, 
	Dominique Martinet <asmadeus@codewreck.org>, Levi Yun <yeoreum.yun@arm.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Andi Kleen <ak@linux.intel.com>, 
	James Clark <james.clark@linaro.org>, Weilin Wang <weilin.wang@intel.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 1:33=E2=80=AFPM Liang, Kan <kan.liang@linux.intel.co=
m> wrote:
>
> On 2025-04-02 4:15 p.m., Ian Rogers wrote:
> > The NMI warning wouldn't fire even if all the events were for one PMU
> > type. Remove a nearby, and no longer useful, mixed hardware event
> > group function. Improve the evlist to string function and dump it in
> > verbose mode after the reordered events warning.
> >
> > As commonly happens legacy events like instructions will be uniquified
> > to hybrid events like cpu_core/instructions/, even though the
> > encodings differ. To make this correct either:
> > https://lore.kernel.org/lkml/20250312211623.2495798-1-irogers@google.co=
m/
> > or:
> > https://lore.kernel.org/linux-perf-users/20250109222109.567031-1-iroger=
s@google.com/
> > needs merging.
> >
> > v3: Increase the verbose dump length from 1024 to 2048 as requested by
> >     Kan Liang.
> >
> > v2: Rename evlist__has_hybrid to evlist__has_hybrid_pmus and add a
> >     max_length parameter to evlist__format_evsels as suggested by Kan
> >     Liang.
> >
> > Ian Rogers (5):
> >   perf stat: Better hybrid support for the NMI watchdog warning
> >   perf stat: Remove print_mixed_hw_group_error
> >   perf evlist: Refactor evlist__scnprintf_evsels
> >   perf evlist: Add groups to evlist__format_evsels
> >   perf parse-events: Add debug dump of evlist if reordered
>
> Reviewed-by: Kan Liang <kan.liang@linux.intel.com>

Ping. The v3 patch series (this series) is here:
https://lore.kernel.org/lkml/20250402201549.4090305-1-irogers@google.com/

Thanks,
Ian

> Thanks,
> Kan
>
> >
> >  tools/perf/builtin-record.c    |  9 ++++---
> >  tools/perf/util/evlist.c       | 34 ++++++++++++++++-------
> >  tools/perf/util/evlist.h       |  3 ++-
> >  tools/perf/util/parse-events.c | 16 ++++++++---
> >  tools/perf/util/stat-display.c | 49 +++++++++++-----------------------
> >  tools/perf/util/stat.h         |  1 -
> >  6 files changed, 60 insertions(+), 52 deletions(-)
> >
>
