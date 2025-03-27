Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CC314D2B7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743088285; cv=none; b=m2lT+S2oSgjP19YDfXAw78yVZrzKtUrmv54sF/aYxGYT/lXAAzyN67N5vYG7mEAXXL2OyzwSgabqQ5hZBVbwmXurMFXQLpi41oanR8UM1VNBFN33Wa6mPqZVYjaf4aUjS7am//uJe169QLCp52HVXl0ybLro7SgAQO01z7WmBuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743088285; c=relaxed/simple;
	bh=wBQJ8H0SYNkyT4BaoNXsacSzvU3YkFd6/mC/KCirIW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CSANdm1cZLGCzPN4ITv6opkdKSIg/JZQbuVY4v7CO5yRx809VlA0Nh9ern8n+N0zZT+10f4o8HgS3/roNeVC+GLTCirZZTqR6xTZHbsXWBIcXWIm0j86FL6xaVvHSgEgiesDuFGxf+bvNE4N5BnK4mhrN4b4L2+D+t23QrLTZ5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2lmFiB0k; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2lmFiB0k"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2263428c8baso187215ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743088283; x=1743693083; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFT0Tlu/Hika32/TdgxS6ejrdxXM/PdIfs46XY+0fN0=;
        b=2lmFiB0kBiK4M5R5qEBwL84qb0r8rkr5FUolhL6/2IBqGAYBZ2ISOW54WERe5mfZyq
         LfMfJWE2VrJUeb9B29mF2fRJ6Uum+9IgX2aQeJSvwukMFJGGZ1juJcohIESdMEYFs0uW
         /Ff+XXwn8fuz9rYCaQz4JgF50I4LOzRE81GErWCmkrdvM6DbaQK4+BJ0kGmoIjdM9ljh
         7feniihItcGyjjwTdBSz26gvKTEeHGUw+KtujVt/3pfufYoYZM0x1zdKE6tG4eIPz1Kk
         Zh3fN8EU2Vq3ssfxob1QAq4x/DITX3/J31ryEm45OXJlZAmvK6BRqCvxcNHZevWQmYml
         OBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743088283; x=1743693083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UFT0Tlu/Hika32/TdgxS6ejrdxXM/PdIfs46XY+0fN0=;
        b=LXL+QtrflCyZWNllsOrM+hn9veJ4JCx8m6o0maAempCxn4O1qqVXrqPjx6RsKIIz8u
         /aHW5UyzTzkz3aB8VhLXLVe3XENJ9xV7pmEQtcvmnpJyQtmvC9O/If7VkxLg7aa5HkMj
         moOFgbS1EQ6b/WpYfJCI/WHTYhXzZDTxuHcbPCIQ6OPUlIk7yr5lGrMpbeUEwYa9ahee
         hftBevynkqmfPpOsWnQzOYc6vPqUdWxraJr9Jk4O5uHZzceYHRsF75Oj8CRaNjz0DlcA
         4fGbgf804F6oNsltjHI4Z3ifGaoKPwpkF5MZwSWgVQHGk1ZOszC+33R6B+qJfJGNcaPr
         tLlg==
X-Gm-Message-State: AOJu0YxRR7dX5ypE/eZKXdk9oh2iImAbpA5luojXihJy/agoxwFuQopm
	YaS+aqs7NGoMs7erw9aRY0RILAM2nizSzbEcAaDVJ8iTeQw3K1M/GQmT+U+AsB0hB4Hw8dHV7QN
	lUPvRQcZAjmGR2fZ7BqYx5TPdrhCmWUP84hQ8
X-Gm-Gg: ASbGncumzardLLpZosM0wDQe0jQf5ucRJ76BPeWYFv13/qs+9YDfCqSrerEA43oD/fa
	AJPeq9uAG4XJ/qr20iVBu1CxSdIDrWEdzhqj2gs7pbB71VSsXpdJQUF3jNwot2mXEOR/eeeyL4h
	8rg7eWvPwYUFQeKa2mf+KKtomyyIyYKHwzdW2z2gp8sQBZDNIQEMOKH3A=
X-Google-Smtp-Source: AGHT+IEmUlg8vfNHKdNwRJgEYBStuk1Iqnk9Tb7Rh3F1o2XWlpyWwxqPnTAeqSUMln3x+u0VE3DK2iGVOFMpNM/Zimg=
X-Received: by 2002:a17:902:ac95:b0:215:8232:5596 with SMTP id
 d9443c01a7336-22806bdf663mr2614605ad.16.1743088283014; Thu, 27 Mar 2025
 08:11:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326234758.480431-1-ctshao@google.com>
In-Reply-To: <20250326234758.480431-1-ctshao@google.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 27 Mar 2025 08:11:11 -0700
X-Gm-Features: AQ5f1JrUNgyp-Ys5KZ-MHxFkmzlIa7yR9ImeiDhqzkOC5aDhHZD6RX-sIVZhKqw
Message-ID: <CAP-5=fUAd5rjXp7evGLqm+gk4yjq+eoGaHNCkaAYNEcKonb4gA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Fix incorrect counts when count the same uncore
 event multiple times
To: Chun-Tse Shao <ctshao@google.com>
Cc: linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, james.clark@linaro.org, howardchu95@gmail.com, 
	linux@treblig.org, yeoreum.yun@arm.com, ak@linux.intel.com, 
	weilin.wang@intel.com, asmadeus@codewreck.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 4:49=E2=80=AFPM Chun-Tse Shao <ctshao@google.com> w=
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

Thanks CT, I tested on hybrid and it looks good. I did notice a
regression with hwmon:

Before:
```
$ perf stat -e data_read,temp1 -a sleep 0.1

Performance counter stats for 'system wide':

           212.12 MiB  data_read
18,446,744,073,709,284.00 'C   hwmon_acpitz/temp1/
            46.00 'C   hwmon_coretemp/temp1/
            32.00 'C   hwmon_iwlwifi_1/temp1/
            40.85 'C   hwmon_nvme/temp1/
            47.00 'C   hwmon_spd5118/temp1/
```

After:
```
$  perf stat -e data_read,temp1 -a sleep 0.1

Performance counter stats for 'system wide':

           213.08 MiB  data_read
18,446,744,073,709,448.00 'C   temp1
```

So we're not uniquifying the hwmon events any more, I'll look into a
fix. I also need to open a bug to use my acptiz device to solve the
world's energy problems as it is currently running with 5% of the
surface temperature of the Sun.

Thanks,
Ian

> Ian Rogers (2):
>   perf evlist: Make uniquifying counter names consistent
>   perf parse-events: Use wildcard processing to set an event to merge
>     into
>
>  tools/perf/builtin-record.c    |   7 +-
>  tools/perf/builtin-top.c       |   7 +-
>  tools/perf/util/evlist.c       |  66 +++++++++-----
>  tools/perf/util/evlist.h       |   3 +-
>  tools/perf/util/evsel.c        | 116 ++++++++++++++++++++++++-
>  tools/perf/util/evsel.h        |  11 ++-
>  tools/perf/util/parse-events.c |  45 ++++++----
>  tools/perf/util/stat-display.c | 151 +--------------------------------
>  tools/perf/util/stat.c         |  40 +--------
>  9 files changed, 214 insertions(+), 232 deletions(-)
>
> --
> 2.49.0.472.ge94155a9ec-goog
>
