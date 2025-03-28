Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9818F49
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 04:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743135650; cv=none; b=X05W8rm9Yl7ZqSC2JDOV8ZQawaECWpfD3lMsHE1tNrHDoA/0cBJRQdWhVh4zMNUAl6KDkOK7WgdD3/v1O5FSmkPMQFqcGA40mP62pu8py2JaBjliDL9sHg33KM3gD1Zp2Bg+udKIxgYHv6XZekZETwQraK+BdQR9+YqL0ER9edM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743135650; c=relaxed/simple;
	bh=4VvG6x9EQmUnaPxos72iekLFHhrDTBgN8+Z3RX8VReY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GiN8xqgjjzFIY06RZ1JZs9XCBObgnaOzCSkSQj9zCkA6TGgjU9L33lp1Oj3oM9JUXmDnXYs3HwJceFnug/a0p7rbKovlqaZhhw9aNaX//UkfA4qndI3CBrdmyVXpRv5l/Z2gax1Vb1vs1Yg6LIwlKXBMnXrECGgjO+mz7317s3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xMt/zlAd; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xMt/zlAd"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2242ac37caeso68685ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 21:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743135648; x=1743740448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjI8M30yNl0TGEXappoLSH56B+TzI7ZNLtph3A+iHC0=;
        b=xMt/zlAdBdheORVJK5vhKWsABpJg3PfuMivCRVav+JcMFxeefcoNwy3LCMnvPg6wtH
         URboOSEgDZSF7gUhYfPyaTa9HnxNMWUC319yNP1uVk42zDk2gmcb9NTI+LIaI8Gvg+bs
         05be0x26cgRwd5g2fZspeY5rJR+a9yCE0ZDnXToHAsKt9Fwu3d4+x+nOxRsvWz7OEXeX
         4SXLt41Ugyktr+i2kDiJdcUFeKOVhFevteOSez4UXVtzaSPGVnSCkaMR6ezccSv27Sg/
         bAuGE6kEQ3VF4NN3eJnCacs+B+mywzykIS9YnVs6PWJK74+kdLc1sSqFxJK+ZCJAgQqo
         NIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743135648; x=1743740448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjI8M30yNl0TGEXappoLSH56B+TzI7ZNLtph3A+iHC0=;
        b=AJ+iOohAwkqzVQ4l8nkPbbcOWRJMCHNP0cGSlGQCWUBUk6IekOt3v7LSgzXPSBGpkw
         mUwlSqO/J++QLwMrl7G5fHeBRhutHocKLHPi0VDEloakzJgB716uNOJIw9eMo6TNpCJL
         gg6DCpUIARvKHbBUC6e1yzikTYvbrDxfrOTr83e86PUocxoJLhaCHSP/skLh7hZ9D3ov
         aZG6Cos0bl8B4mwG8T+CwYD6e0U8nlM8biZjGzwQze995moM9WxORvNQbgT7ZsD4A0n7
         /0KmcPKgaxMydleGekxw3G/NBm0I9R+HGul994O9JOEbBKSGhI69WK682fpeEGwgDGOm
         r3jg==
X-Gm-Message-State: AOJu0Yw15sz9586fFQRGl8LkV79cHPeb/bIVBb7xDtkNG8TMt1/YXIYT
	rvykLmDZBIwRVtlRAiP1T/aIyaIov2XRgHFQLZ8mPKWLpjq2FBr2in4MFmCXq21BwHUf0IWdWmX
	LmuHma9DAXKRsgtZrFhE1H1wfzIBzhpgjXLYD
X-Gm-Gg: ASbGncvGAdJKs0s56hd7sEiLrTxUvg17QQThBgSuU9DYVOEFZU6wdoAPJjYemXGh65T
	4wZj/rT6rdhX7TM2KkxgA5qzu4V5iMMyyYgDxPQAU68voMJyM1B28l1BvoMRDI7RsOuh7dj4HZO
	3tNqWl/3d2CLDgSq9InOEabgAFFtw=
X-Google-Smtp-Source: AGHT+IFm9BzGAaqh6rhMTsdvArk8QYfZ4BiD7DS9eqvAjwM3xXPk4D7Y8NsBIWa8UBrfMNcPdTlEOa2Co9SOW5Szdy4=
X-Received: by 2002:a17:902:ee02:b0:224:6c8:8d84 with SMTP id
 d9443c01a7336-22920ad2e6amr1747645ad.4.1743135647450; Thu, 27 Mar 2025
 21:20:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327225651.642965-1-ctshao@google.com>
In-Reply-To: <20250327225651.642965-1-ctshao@google.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 27 Mar 2025 21:20:36 -0700
X-Gm-Features: AQ5f1Jr-scFYaP9RajDzeU_599eda8QGvwnthEF_v8Ujb_R1wC0Ccyq38bdPe6s
Message-ID: <CAP-5=fWv4=8Uq8jDbqNR3O+JAw-T0OUGoj5o=pMHxyFKsbEDyw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Fix incorrect counts when count the same uncore
 event multiple times
To: Chun-Tse Shao <ctshao@google.com>
Cc: linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, james.clark@linaro.org, howardchu95@gmail.com, 
	yeoreum.yun@arm.com, linux@treblig.org, ak@linux.intel.com, 
	weilin.wang@intel.com, asmadeus@codewreck.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 3:56=E2=80=AFPM Chun-Tse Shao <ctshao@google.com> w=
rote:
>
> Let's take a look an example, the machine is SKX with 6 IMC devices.
>
>   perf stat -e clockticks,clockticks -I 1000
>   #           time             counts unit events
>        1.001127430      6,901,503,174      uncore_imc_0/clockticks/
>        1.001127430      3,940,896,301      uncore_imc_0/clockticks/
>        2.002649722        988,376,876      uncore_imc_0/clockticks/
>        2.002649722        988,376,141      uncore_imc_0/clockticks/
>        3.004071319      1,000,292,675      uncore_imc_0/clockticks/
>        3.004071319      1,000,294,160      uncore_imc_0/clockticks/
>
> 1) The events name should not be uniquified.
> 2) The initial count for the first `clockticks` is doubled.
> 3) Subsequent count only report for the first IMC device.
>
> The first patch fixes 1) and 3), and the second patch fixes 2).
>
> After these fix:
>
>   perf stat -e clockticks,clockticks -I 1000
>   #           time             counts unit events
>        1.001127586      4,126,938,857      clockticks
>        1.001127586      4,121,564,277      clockticks
>        2.001686014      3,953,806,350      clockticks
>        2.001686014      3,953,809,541      clockticks
>        3.003121403      4,137,750,252      clockticks
>        3.003121403      4,137,749,048      clockticks
>
> I also tested `-A`, `--per-socket`, `--per-die` and `--per-core`, all
> looks good.
>
> Ian tested `hybrid-merge` and `hwmon`, all looks good as well.
>
> Chun-Tse Shao (1):
>   perf test: Add stat uniquifying test
>
> Ian Rogers (2):
>   perf evlist: Make uniquifying counter names consistent
>   perf parse-events: Use wildcard processing to set an event to merge
>     into

Tested-by: Ian Rogers <irogers@google.com>

There could be minor conflict with this unreviewed series:
https://lore.kernel.org/lkml/20250318041442.321230-1-irogers@google.com/

Thanks,
Ian

>  tools/perf/builtin-record.c                   |   7 +-
>  tools/perf/builtin-top.c                      |   7 +-
>  .../tests/shell/stat+event_uniquifying.sh     |  69 ++++++++
>  tools/perf/util/evlist.c                      |  66 +++++---
>  tools/perf/util/evlist.h                      |   3 +-
>  tools/perf/util/evsel.c                       | 119 ++++++++++++-
>  tools/perf/util/evsel.h                       |  11 +-
>  tools/perf/util/parse-events.c                |  86 +++++++---
>  tools/perf/util/stat-display.c                | 160 ++----------------
>  tools/perf/util/stat.c                        |  40 +----
>  10 files changed, 329 insertions(+), 239 deletions(-)
>  create mode 100755 tools/perf/tests/shell/stat+event_uniquifying.sh
>
> --
> v2:
>   - Fixes for `hwmon` and `--hybrid-merge`.
>   - Add a test for event uniquifying.
>
> v1: lore.kernel.org/20250326234758.480431-1-ctshao@google.com
> 2.49.0.472.ge94155a9ec-goog
>
