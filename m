Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C200AD23
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 01:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748914556; cv=none; b=jHvLYWe5rD5mHQh8LfVfWGv2jdtgUyQS+QYipY9BfN+HCB8pHDVF09XffDsEOUo0s8vdEeJzrG+9cJn+z6zKlIYErATjLYK+HWRSkdKWK31aktnFYkd3mwggcdz/khRo3vn6RlT8Ectn3jPALuuvEE26+NMwzU0iWFSqeCPmxkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748914556; c=relaxed/simple;
	bh=4G0OfYIvr4t0nCGwhIcWZuX7X19K6IgvteeM/fkIsKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MNlQ6b5iEXNUk+EYse9IjcefGZ3OZI1d9PXaG9jClfxWrRwkUDJ+sTxlVDQjeU+/Mah6FKQBNVb369IoRDX/VywEvRH7EQcOBRNxZ8huWCJO6un/gahKdBlXeq/M9GzQWAj3ehk46i+JSwkcpQru0SxLyjnM/qD66muz0lstzRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PM8OsDh3; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PM8OsDh3"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-551efd86048so5942096e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 18:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748914553; x=1749519353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G7z1zWm2f0RDeFE11G5uZs6TyNwcQgIGkKrmLWj+YKQ=;
        b=PM8OsDh3KGtAHMBTxkazJCykuRXatFLURzw1LM4d5jsy+P0qk7HkxrPqIA4t5HiL81
         NsBLwhfFg98Fy1bGIpImWY2HkQGl6EkoYxgGB2z0sTIgfLnYBcVWHlnEJJC+DlT3bWbn
         Bvp4SmCxjMJqvAJfhS5JLWmTjBJP1eMzEgbSCzSWlt5px1BZQ0DVRBE3POVcUVq2lygU
         1QgbGWVQwkVArZFUrlen5zGDPP7SqF841DEOTWMI3yVg25JtdGoFBS5mZQAgcOHTQiyU
         vPoHQWubcy1axjO6DjBiVHKPl6U+VX+h3uP4UiFXF78ZRe7w/wP//STbH15q3E9pQNai
         R47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748914553; x=1749519353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G7z1zWm2f0RDeFE11G5uZs6TyNwcQgIGkKrmLWj+YKQ=;
        b=plgt4YwtK9+wbuiZOQewb3FGSrr4rAzBKl+5zy9jvMTlHOLEFABpCWdCeQslknGw4M
         HfKBq9Qd82hbHHdxz5as7eMKsfX/m9qZcpTvCREk50+DD2oAy4eorYHnFH0Cb5XFTbQx
         jgmZLDMbI1iF9dcrrW2BL6+dDpXAsonz2S1LHgHgYmdGlTWwJVN9fzw4Ej+2P+BaTKx+
         Lv9UsOTpVhbepYiM3wMg4+QMgQPsZfB/n1dGw0D9NsXbXz9FBOOECF6wcCB0sErcqcal
         VvX5edL7Mj8UlgbpOnZEEHYWccyUxgyIesZRTFK5BSLmtOWLkDSv9E7p76w0f5fxnJ3D
         F8TA==
X-Forwarded-Encrypted: i=1; AJvYcCWpujl/4PZIf65H6UbnwhXUSGyb/snwKILkAKXdWZPjFsNBzN7uGw1R68NvUZgEripoxDKRO2oBAw4hHSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXYe2NpNtAb0subjte/xMYq1O5V3Ey5CUnXyKMKbczN4QMVTvK
	lgaGPlT+bpiHw1fSGiv3bsLXD0NdwNRJvCaC7b2CMoSAOJcADVXULpyJMhmoz53RM7Zs4riznor
	uw43VKJvCKXTPFXoPocgO0u9SkyE9VHm/4kEWhRc=
X-Gm-Gg: ASbGncui1OrM38qVCpBCwXlTK67xnv81hJ7/lRlG1StQHr3cIjWd3G+srsKG2Y3jsOB
	Vfv87IN4L85ypm7G2meF8xNrIibdIUIE0o15WN0Z0UG+dhu0QmVWF4FhUqsuW/l5lhyr7IIv6iO
	zKvS22pNuDWIGFmJkYVhsXvJt7XYljcQnAyTFDaOQIwaSK8f2K/f9ds+IMK5E9JK1usYUTQRgV
X-Google-Smtp-Source: AGHT+IGP1DpDlAMLqgB/BJty6L0bDEjIDqw3CLrA48UMvSzNP8W89NPXJInzzjKbnKXnTQNeMCf+YiR2kIyoD63errg=
X-Received: by 2002:a05:6512:33ca:b0:553:2f50:5dff with SMTP id
 2adb3069b0e04-5533d16d906mr3865578e87.17.1748914552831; Mon, 02 Jun 2025
 18:35:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602223251.496591-1-daniel@quora.org>
In-Reply-To: <20250602223251.496591-1-daniel@quora.org>
From: John Stultz <jstultz@google.com>
Date: Mon, 2 Jun 2025 18:35:40 -0700
X-Gm-Features: AX0GCFsL02MXcmFt8idvf01U17QpH97PImmoNy7cqUUKqT-MCi2zYF1O7oZzQJQ
Message-ID: <CANDhNCqn__w4kGE2N6P5MndR4=2KwJnrb9=+eMo0=j5ToP6UZQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] Prevent unexpected TSC to HPET clocksource
 fallback on many-socket systems
To: Daniel J Blueman <daniel@quora.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	stable@kernel.org, Scott Hamilton <scott.hamilton@eviden.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 3:34=E2=80=AFPM Daniel J Blueman <daniel@quora.org> =
wrote:
>
> On systems with many sockets, kernel timekeeping may quietly fallback fro=
m
> using the inexpensive core-level TSCs to the expensive legacy socket HPET=
,
> notably impacting application performance until the system is rebooted.
> This may be triggered by adverse workloads generating considerable
> coherency or processor mesh congestion.
>
> This manifests in the kernel log as:
>  clocksource: timekeeping watchdog on CPU1750: Marking clocksource 'tsc' =
as unstable because the skew is too large:
>  clocksource:                       'hpet' wd_nsec: 503029760 wd_now: 48a=
38f74 wd_last: 47e3ab74 mask: ffffffff
>  clocksource:                       'tsc' cs_nsec: 503466648 cs_now: 3224=
653e7bd cs_last: 3220d4f8d57 mask: ffffffffffffffff
>  clocksource:                       Clocksource 'tsc' skewed 436888 ns (0=
 ms) over watchdog 'hpet' interval of 503029760 ns (503 ms)
>  clocksource:                       'tsc' is current clocksource.
>  tsc: Marking TSC unstable due to clocksource watchdog
>  TSC found unstable after boot, most likely due to broken BIOS. Use 'tsc=
=3Dunstable'.
>  sched_clock: Marking unstable (882011139159, 1572951254)<-(913395032446,=
 -29810979023)
>  clocksource: Checking clocksource tsc synchronization from CPU 1800 to C=
PUs 0,187,336,434,495,644,1719,1792.
>  clocksource: Switched to clocksource hpet
>
> Scale the default timekeeping watchdog uncertinty margin by the log2 of
> the number of online NUMA nodes; this allows a more appropriate margin
> from embedded systems to many-socket systems.

So, missing context from the commit message:
* Why is it "appropriate" for the TSC and HPET to be further out of
sync on numa machines?
* Why is log2(numa nodes) the right metric to scale by?

> This fix successfully prevents HPET fallback on Eviden 12 socket/1440
> thread SH120 and 16 socket/1920 thread SH160 Intel SPR systems with
> Numascale XNC node controllers.

I recognize improperly falling back to HPET is costly and unwanted,
but given the history of bad TSCs, why is this loosening of the sanity
checks actually safe?

The skew you've highlighted above looks to be > 800ppm, which is well
beyond what NTP can correct for, so it might be good to better explain
why this skew is happening (you mention congestion, so is the skew
consistent, or short term due to read latencies? if so would trying
again or changing how we sample be more appropriate than just growing
the acceptable skew window?).

These sorts of checks were important before as NUMA systems might have
separate crystals on different nodes, so the TSCs (and HPETs) could
drift relative to each other, and ignoring such a problem could result
in visible TSC inconsistencies.  So I just want to make sure this
isn't solving an issue for you but opening a problem for someone else.

thanks
-john
