Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42D2289815
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746633424; cv=none; b=UtlYeNepATZpFAY24zx3KEsvjboeI/qf+840mO9i9YpwQ2yMJvdfi4vXqXN/awrnWirpKKPIzM+pnhIudFIolw+nyrSvr642Vn+dPTJBiNJN36rwChyFMd4GFaMmHfao2cCR/yBcSh4S0ygVGTITbyD3BnqUh8EjywUQyeH/+kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746633424; c=relaxed/simple;
	bh=NTNl3P+fq5lCsDHlnsdh3mf77EycibLg7WMw+O8HKkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i9ulTs/xrpDhYaDuLDBmLWKa1T9lnFFJf785oipgajkpzC8W4uySp0289JY2dxyJYY2jOTbAyhD0nmHN0cFvElcvjagaAKgCru7VVt+njNBU+VEZEzqEdB1h+ENSJ8Jz4/pYMrzH8XsqrNqQHYv64lBsARNnpusXjJ7cApXNOOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GaUBvnfI; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GaUBvnfI"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3da73d35c11so183105ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 08:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746633422; x=1747238222; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykDpkAM2sXvXYZSjDalTbIgb2nTcNniwyG0Gjx+kJAo=;
        b=GaUBvnfIWXc13XOM3ZnuDBmSDNdyr7/49Ba6I+hCWhIB1lo4oKfMGG1lCHt6BbZS09
         B7OAbFg60wBSArA56+1hdNzFkGmi2vzSw67NUe2AQKGeoiZfzomady+p4ySLJbzWiBcW
         lgJixYpMfowHYztin0EtZyxfLo/gJXXMt7AAphNnW194fjC02c4QjhVAVy4FuCRgYQ6t
         ruqfEAFbYw1Ii2itcaa2W5DdEWcx9d0UoRnEZAz+YSg9PJ2Dk1pfmvaRtgXJ9BntEOl3
         l0SyUPF+1NgHjLRvaVvbRnfKsvsqe2D6Nsf/Vzz5e7Xuf+wr+hxVkrO7EDPi29BmdBPf
         mmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746633422; x=1747238222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ykDpkAM2sXvXYZSjDalTbIgb2nTcNniwyG0Gjx+kJAo=;
        b=aDhYXSNBIngOiZomuo2L5rFqR3y8Opg3RfC8qJ8GvjFIfAKRG8STjAdC2U7FB+AbBM
         bES+ZAR7UbkWvpiDlFAVb8Cht39EF69olWLb7HEuA+5Pc2GgTwLFx4F5KkTEBlLL4ljZ
         gz7m0d07yNgBnR2kaJnmJCWSlbiroh9Dv4+ILXNbGD57ScAzRtEx1SZCpvx9DKxBE80b
         GarVIbA4Gz1Gnc8YNIEEijMF4zQSiWLVMQFuRucLyAgmfsyir74fSTsXV83oyMoHcvcW
         3c7nUVailZlecwTaOnb4jYgMc23n7Y+vpS/yPR+dD/2ahtwFP+rUbvDcLEjiZntPDKio
         /roQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTedP5hJQNiqQZSTEF1lK/WeX1w4FcncgUit+GZgxWK/ai1WyDNTuxksLbiX1VBWSBKUJCsh+Mmt3Y7bY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUh7VQi8EoxgEzcSrbU1/FIdLLflz6VkY9Lz1NY1OBG8+RIc0U
	J2jhife6mw9xtqZMoie2p3R662viKFJhbpoYtTKr3/xJ0V9Pv6Rt2ff62ZNVfBcgeSUjqZZGNQe
	bcc2zAJxFrxxW9znUAc7eQtwuc7rIoY9o7Dpl
X-Gm-Gg: ASbGncvaO+U+RqFmj73RsL9iBP9L86RWqwDA1KDgcj8YD2Vz0o8dpd05eITx0Vc642l
	BzWr5tqzmDlzS4aE/7/HZyer57fshi01GZfvPCQwtshu4jGOzJkk9kLbj8lHCIlGOFhKxhkN9rp
	yqPSs66ZAshnxmRC554jytRLNVzYP50pkWnSlmDanks2H8B5A0urI=
X-Google-Smtp-Source: AGHT+IFW2jlrBx5rvnWqUJCGGZ/vNfDAJ4GchVrKzbBv2MfE/Sb33H5VFCY+zf6KNPxytQqDQyGffoG3Q1QQvt+bH+M=
X-Received: by 2002:a05:6e02:1aae:b0:3d9:6e55:2aae with SMTP id
 e9e14a558f8ab-3da7384a1cdmr4493615ab.0.1746633421645; Wed, 07 May 2025
 08:57:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1746627307.git.sandipan.das@amd.com>
In-Reply-To: <cover.1746627307.git.sandipan.das@amd.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 7 May 2025 08:56:48 -0700
X-Gm-Features: ATxdqUEVk5ap3Ro9zQ37LWqA-dyg-_rUJj1mv9TtCWTKq9jDzIJAnq3O20-GKiU
Message-ID: <CAP-5=fUEeFb3jh-MtxEEH0Z+HFAD0oxSc4uE66Rfg+BRzYRB5Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] perf vendor events amd: Address event errata
To: Sandipan Das <sandipan.das@amd.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Stephane Eranian <eranian@google.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Ananth Narayan <ananth.narayan@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 7:28=E2=80=AFAM Sandipan Das <sandipan.das@amd.com> =
wrote:
>
> Remove unreliable Zen 5 events and metrics. The following errata from
> the Revision Guide for AMD Family 1Ah Models 00h-0Fh Processors have
> been addressed.
> #1569 PMCx078 Counts Incorrectly in Unpredictable Ways
> #1583 PMCx18E May Overcount Instruction Cache Accesses
> #1587 PMCx188 May Undercount IBS (Instruction Based Sampling) Fetch Event=
s
>
> The document can be downloaded from
> https://bugzilla.kernel.org/attachment.cgi?id=3D308095

Hi Sandipan,

the document is somewhat brief, for example:
```
1583 PMCx18E May Overcount Instruction Cache Accesses

Description
If PMCx18E[IcAccessTypes] is programmed to 18x (Instruction Cache
Miss) or 1Fx (All Instruction Cache Accesses) then the performance
counter may overcount.

Potential Effect on System
Inaccuracies in performance monitoring software may be experienced.

Suggested Workaround
None

Fix Planned
No fix planned
```
Given being able to count instruction cache accesses (for example) is
a useful feature, would it be possible to change:
```
-  {
-    "EventName": "ic_tag_hit_miss.instruction_cache_hit",
-    "EventCode": "0x18e",
-    "BriefDescription": "Instruction cache hits.",
-    "UMask": "0x07"
-  },
...
```
to be say:
```
  {
    "EventName": "ic_tag_hit_miss.instruction_cache_hit",
    "EventCode": "0x18e",
    "BriefDescription": "Instruction cache hits. Note, this counter is
affected by errata 1583.",
    "UMask": "0x07",
    "Experimental": "1"
  },
```
That is rather than remove the event, the event is tagged as
experimental (taken to mean accuracy isn't guaranteed) and the errata
is explicitly noted in the description. Currently the Experimental tag
has no impact on what happens in the perf tool, for example, the
"Deprecated" tag hides events in the `perf list` command and is
commonly used when an event is renamed.

Thanks,
Ian
> Sandipan Das (3):
>   perf vendor events amd: Remove Zen 5 instruction cache events
>   perf vendor events amd: Remove Zen 5 TLB flush event
>   perf vendor events amd: Remove Zen 5 IBS fetch event
>
>  .../arch/x86/amdzen5/inst-cache.json          | 24 -------------------
>  .../arch/x86/amdzen5/load-store.json          |  6 -----
>  .../arch/x86/amdzen5/recommended.json         | 13 ----------
>  3 files changed, 43 deletions(-)
>
> --
> 2.43.0
>
