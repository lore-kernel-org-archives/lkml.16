Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B74A248866
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745945948; cv=none; b=HKM3xZWYhrpON2j6M1AaHlnSuA1i2CBqj7KVphOV3jhmhr2yL3hQFzQjwJtdnHY+HUoANX89AvMUMpMK5QFvphUgguCTIR6NfKGHSEY7uX59b2cCd8pp8SQvn4SzZTQJIIZAiQP7r8P3hzZjem5Vw7+8yd5byErSbLLmdRbke8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745945948; c=relaxed/simple;
	bh=W/4zpcUVilN5uIQEY4rs28RgSKNIxSITgSABsCrtPEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZlNsqUu94V2oZN79SzDsmpu67UtKfYZ2bNmpQP2D3D/Z+0vLmk0wiYBblxyIRo2cs63SJIHPg4VzTp+wGlH4v17p5f/rZPFsIy5hGMYlQDpwvpA+wkKEeY2EPImHb5E5iRzJgOR9D2W37v4OxxihKaPmcpx7J8ZrbaZrefkFG8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZKvAah0q; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZKvAah0q"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5f728aeedacso7244015a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745945944; x=1746550744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mn+5ZgmCVf2M5vltNK1wOsGuf2phvT5CTFIIIiCVMc0=;
        b=ZKvAah0qmtK9g93FubxjU+IL3KCB5p69oVL+n68GJfQQuIlhm3hB60sG50XyqsZrF7
         5c1GHpIS/wbUlvTvyue1HNfHI7qYLy9t3QXUpnVMcbhXXyoewjFCeSAmnitoKAhNVW7p
         vJi3LkxFp8TDpmLJYq427mj/1bZy4yCMKYjZX4mghwi7OyhpAj52OzOOAJu9I3IkdxHQ
         Rz7O326duywBtix00Etx3tReUQzecMUVxWKf0IdrFZHvzbB9lSU4wkttVJ/bkFd0UdZf
         9b2X/VAeJknbBon2wtWDoCsAvciO8wAI/iXCxwYycvlxXZXlZNspQaEcQ6HFnyGEaIH4
         W0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745945944; x=1746550744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mn+5ZgmCVf2M5vltNK1wOsGuf2phvT5CTFIIIiCVMc0=;
        b=EWq/ZSzcMhvwTJlS0DRuyUaxj9wBrZu70NkW2Xs/PXX1V7jXWG0wGhw8rQyn+Tz9e0
         5Di5cETTPQfp3MsJ8eEvr/XK8nmbReNXqZkMpTCJTymH/0iCCje5c/hjqAACa01+RQQC
         1vFoFCyhMj6FUE+QCPsObzujFTf3tNkvc8ZSQKZF+pnwS3VgMTHYGV6xhPRAgOG3+EjZ
         gCbtFWCDdC6PSM0gCyHgGvYvy++ruTQmmbJQDKK0KJ0ncGl2SuC4Tn1QTf0fn/xxzPj8
         bBC03/I4Gj7XskQC3u8QiUB09mxulCaryhBHvMPv/srVCyBSgKLVC+YW8FN0sjBKivig
         mi8Q==
X-Gm-Message-State: AOJu0YzyTAAgN6VyI3mFZCgFXUoUJbIwcLbPTYgAZU7qROfnmDI/B0uZ
	Kg+a0q/xmorfTm3w1CK6in1Xx9DoB1o8EQV56Xs7nBMP3eI49uPr1SpbsqONJpZKZawzZkI0T0p
	JfgSxceTheckCQPNMMZC6CQa6XwWI7jcsTFSj
X-Gm-Gg: ASbGnctQ8BNRHBlSyXarixo2iBMHGMWg0+WFxUZO+GbJTMVtF7p8SLAQ1zkqEn8C3w0
	liS7cXIS8Zl5/0XKgWadLk0yTpiEBleHjrO0RmT5uTDrArK5Viv2zFd941amntamcmNzd5l3s1f
	mU/4zjBdSts2E41JGN17QwRh4BfctpmFtO/jwrXb8GhdkKAwtU2oII54RiPeIw
X-Google-Smtp-Source: AGHT+IHlYsGdt+lKsFw09PJNfhuQhzmhzMRAuDq59dV5aojdMEnYbfZBvnVPEapBVjly9gvEwhgKl1oMPwAAc+ZlJRE=
X-Received: by 2002:a17:907:94d1:b0:ac7:95b3:fbe2 with SMTP id
 a640c23a62f3a-acedc767e1fmr8597466b.56.1745945944207; Tue, 29 Apr 2025
 09:59:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327225651.642965-1-ctshao@google.com> <CAP-5=fWv4=8Uq8jDbqNR3O+JAw-T0OUGoj5o=pMHxyFKsbEDyw@mail.gmail.com>
In-Reply-To: <CAP-5=fWv4=8Uq8jDbqNR3O+JAw-T0OUGoj5o=pMHxyFKsbEDyw@mail.gmail.com>
From: Chun-Tse Shao <ctshao@google.com>
Date: Tue, 29 Apr 2025 09:58:52 -0700
X-Gm-Features: ATxdqUHUP32Wbv51hq_UWyC165E5uyVyyGJjwTBzdrWCa2_ytyIaLVOfds3bh-8
Message-ID: <CAJpZYjUWSkoXhoZDvLwgJcWqJvXAi8AmDmvsehJEJS6WOczF4Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Fix incorrect counts when count the same uncore
 event multiple times
To: Ian Rogers <irogers@google.com>
Cc: linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, james.clark@linaro.org, howardchu95@gmail.com, 
	yeoreum.yun@arm.com, linux@treblig.org, ak@linux.intel.com, 
	weilin.wang@intel.com, asmadeus@codewreck.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping.

Thanks,
CT

On Thu, Mar 27, 2025 at 9:20=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> On Thu, Mar 27, 2025 at 3:56=E2=80=AFPM Chun-Tse Shao <ctshao@google.com>=
 wrote:
> >
> > Let's take a look an example, the machine is SKX with 6 IMC devices.
> >
> >   perf stat -e clockticks,clockticks -I 1000
> >   #           time             counts unit events
> >        1.001127430      6,901,503,174      uncore_imc_0/clockticks/
> >        1.001127430      3,940,896,301      uncore_imc_0/clockticks/
> >        2.002649722        988,376,876      uncore_imc_0/clockticks/
> >        2.002649722        988,376,141      uncore_imc_0/clockticks/
> >        3.004071319      1,000,292,675      uncore_imc_0/clockticks/
> >        3.004071319      1,000,294,160      uncore_imc_0/clockticks/
> >
> > 1) The events name should not be uniquified.
> > 2) The initial count for the first `clockticks` is doubled.
> > 3) Subsequent count only report for the first IMC device.
> >
> > The first patch fixes 1) and 3), and the second patch fixes 2).
> >
> > After these fix:
> >
> >   perf stat -e clockticks,clockticks -I 1000
> >   #           time             counts unit events
> >        1.001127586      4,126,938,857      clockticks
> >        1.001127586      4,121,564,277      clockticks
> >        2.001686014      3,953,806,350      clockticks
> >        2.001686014      3,953,809,541      clockticks
> >        3.003121403      4,137,750,252      clockticks
> >        3.003121403      4,137,749,048      clockticks
> >
> > I also tested `-A`, `--per-socket`, `--per-die` and `--per-core`, all
> > looks good.
> >
> > Ian tested `hybrid-merge` and `hwmon`, all looks good as well.
> >
> > Chun-Tse Shao (1):
> >   perf test: Add stat uniquifying test
> >
> > Ian Rogers (2):
> >   perf evlist: Make uniquifying counter names consistent
> >   perf parse-events: Use wildcard processing to set an event to merge
> >     into
>
> Tested-by: Ian Rogers <irogers@google.com>
>
> There could be minor conflict with this unreviewed series:
> https://lore.kernel.org/lkml/20250318041442.321230-1-irogers@google.com/
>
> Thanks,
> Ian
>
> >  tools/perf/builtin-record.c                   |   7 +-
> >  tools/perf/builtin-top.c                      |   7 +-
> >  .../tests/shell/stat+event_uniquifying.sh     |  69 ++++++++
> >  tools/perf/util/evlist.c                      |  66 +++++---
> >  tools/perf/util/evlist.h                      |   3 +-
> >  tools/perf/util/evsel.c                       | 119 ++++++++++++-
> >  tools/perf/util/evsel.h                       |  11 +-
> >  tools/perf/util/parse-events.c                |  86 +++++++---
> >  tools/perf/util/stat-display.c                | 160 ++----------------
> >  tools/perf/util/stat.c                        |  40 +----
> >  10 files changed, 329 insertions(+), 239 deletions(-)
> >  create mode 100755 tools/perf/tests/shell/stat+event_uniquifying.sh
> >
> > --
> > v2:
> >   - Fixes for `hwmon` and `--hybrid-merge`.
> >   - Add a test for event uniquifying.
> >
> > v1: lore.kernel.org/20250326234758.480431-1-ctshao@google.com
> > 2.49.0.472.ge94155a9ec-goog
> >
