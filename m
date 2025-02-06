Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBA615D5C4
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738860035; cv=none; b=XN6qhhM/UQ4+co2XyuW7IMX945x9Xc1ckGjP2NF8Q1TCZ3d77EjSLUsIlsqQa14FRuBeIalOQvFjcqjNgl/V5APUt8WGlWATBtT18RUJk7pi3BUnvRs6SPdKSRmyp55OUIVr6dN574yOZAhljs3yYqf9KhMLbTDHynPguMvSZPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738860035; c=relaxed/simple;
	bh=N8LaKVz6Sr+5Y91hCshuCZW809GeV+AbChKifv0j7No=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i3TbUqZA8iEvKKi5pF6U/S1418mRtugsF51ryclIKa1lJm1gCxQ/zECXLsgSX6mVH/80G02d6M7uaYev4F9Rfk95dl6/x5c15tKTL8CxsV/ABXx4uNDmMN12NuhQHVtjnTJpfkb/KZNUNEk/R3kGtx5YQIJins+6CPcL33sUR64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ykKIDZI9; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ykKIDZI9"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d04e5bd797so22955ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 08:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738860033; x=1739464833; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvaLQbYrpkz6oaxKPG/e/JRHpRGrA3lEpDx5RhfGgrA=;
        b=ykKIDZI9t2uLyTJ5fTz6AKqtuF/oggkl/WM4AiarkLNN9EozepyszVwEJWwh7cJEVB
         YxfL8STpnnnxpEKwvUCF1aXvEwGG4nNlAGEnNx/HnNS6P7SV52pH5bfEebKVlf18vOa1
         uh7BKuR2R8B//2Of2L0+9Di0S2IJmAS7XfCDmdwPATiIoRnLb69bJOwdN7HFTuFOaX+L
         5pGldBqd9q4bYJYmKsoJ4s5CgI7TvSMUwOD9xiTmPLFSRS0HtK7mSrVm76z/9zSDrIjL
         c5cPDr8y1heHhXk9Yq6bL12ihrn0/OJYh+iZCuvh327Th3FvF6z8AckNhVdC/8etNVGa
         wkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738860033; x=1739464833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wvaLQbYrpkz6oaxKPG/e/JRHpRGrA3lEpDx5RhfGgrA=;
        b=W7ORm12TqW/2rA2g16gNPoqbGtSeKhzh07YV4yZosR9+DXKC6LJMgevj3m6GvU0+Y0
         pX/q/qNqqJLteSb3ez4yeMKsWnIPMOkHb0sRCiiweq1teC88gtbpxCYJc4szpmJtj1wF
         haZSwP/8tEMrBt6xIDMFVkG7a/BtqUYSU39kK+xquVFG6Y79goVjHA7tyaZUPrzuJDP9
         dpilnFNgdDajjK6DUN2TNls0RgXcMfpNpEwj52bM5FOqzs1Lj3wKmUnPJUhMCOam4Qte
         Ebi6yXEmfK/bDCwDe2QCuSYgtegbtbsV2jfPHztMdgpvdjI9NvuiXYaiAkpvZZ6TbO/K
         YDJw==
X-Forwarded-Encrypted: i=1; AJvYcCXrWt2HXh1Ah/lUsQPNgSeJzrTH8B1q0ElUcoDLq7YlQcj4E/7EnN1XueTU/lbVKBi+LMS7Skyc/0DnBWs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8ZycShjLZgxpCKpvbn8svEqnG3yJMAvr1+o0a+iB3ssvsh7Gt
	UP0U2/UBeATdjcEIaeiJFOJgagwADVRVbCFoxEmfEIQUUILWOw0hoBy5uP6+R8zB26zLea7S29N
	X8PvCzioAkE/olA6KZIpHahgiRYSHj8DMGmmn
X-Gm-Gg: ASbGncs2tuHJ1CEKEFPRR/O12Ij39uM/AF7lBksf8QYddnd7ppEpufBOBrzz4cegrbG
	3OP6x3HFWZB4BgBk0WaSm+9Q3McAsXsBdkjY/fFEa9GqzOp0Pu9wDip3yqXwEjDAhDSIy1WddEH
	37py3UDHuFVjnZpfggdev1ITnC
X-Google-Smtp-Source: AGHT+IHLh3L3HufG9Uu/dBT96ccYmbNC6w5WpBwncZSnSYxA2d+Xfq9AEVk/1w67dwiAq9/ZZ+qMtxXsh5A22cgDgyA=
X-Received: by 2002:a05:6e02:3113:b0:3a7:e301:a1f2 with SMTP id
 e9e14a558f8ab-3d135cc2b82mr252015ab.15.1738860032611; Thu, 06 Feb 2025
 08:40:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205173140.238294-1-irogers@google.com> <20250205173140.238294-12-irogers@google.com>
 <7692d2d6-16d5-4f50-8c3a-37f1db356426@linux.intel.com> <CAP-5=fU+9MgMbQKpFix+Jw8k+-_yfAs-F+FYE4CmTWxevPmd-A@mail.gmail.com>
 <9fa56c75-2ee6-4901-9e04-0ec23412fd62@linux.intel.com> <CAP-5=fWpbXSwZq5biRZ1fjcSJY2DO4g=cv-0K8jZ1Gzv3bOfhA@mail.gmail.com>
 <58e08371-8d43-4f84-baaf-64b0af95c7cb@linux.intel.com>
In-Reply-To: <58e08371-8d43-4f84-baaf-64b0af95c7cb@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 6 Feb 2025 08:40:20 -0800
X-Gm-Features: AWEUYZkBblHkw2VPUKClA4hYnNXC-LPOEuDEkju6NG2NP_KPrRAMbPb2jLB4fpI
Message-ID: <CAP-5=fX+u_Un-WYKA35sc366kniuXFVfRDT+dzWd-axTG5PmpA@mail.gmail.com>
Subject: Re: [PATCH v5 11/24] perf vendor events: Update/add Graniterapids events/metrics
To: "Liang, Kan" <kan.liang@linux.intel.com>, Thomas Falcon <thomas.falcon@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Weilin Wang <weilin.wang@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Perry Taylor <perry.taylor@intel.com>, Samantha Alt <samantha.alt@intel.com>, 
	Caleb Biggers <caleb.biggers@intel.com>, Edward Baker <edward.baker@intel.com>, 
	Michael Petlan <mpetlan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 6:32=E2=80=AFAM Liang, Kan <kan.liang@linux.intel.co=
m> wrote:
>
> On 2025-02-05 4:33 p.m., Ian Rogers wrote:
> > On Wed, Feb 5, 2025 at 1:10=E2=80=AFPM Liang, Kan <kan.liang@linux.inte=
l.com> wrote:
> >>
> >> On 2025-02-05 3:23 p.m., Ian Rogers wrote:
> >>> On Wed, Feb 5, 2025 at 11:11=E2=80=AFAM Liang, Kan <kan.liang@linux.i=
ntel.com> wrote:
> >>>>
> >>>> On 2025-02-05 12:31 p.m., Ian Rogers wrote:
> >>>>> +    {
> >>>>> +        "BriefDescription": "This category represents fraction of =
slots utilized by useful work i.e. issued uops that eventually get retired"=
,
> >>>>> +        "MetricExpr": "topdown\\-retiring / (topdown\\-fe\\-bound =
+ topdown\\-bad\\-spec + topdown\\-retiring + topdown\\-be\\-bound) + 0 * s=
lots",
> >>>>> +        "MetricGroup": "BvUW;TmaL1;TopdownL1;tma_L1_group",
> >>>>> +        "MetricName": "tma_retiring",
> >>>>> +        "MetricThreshold": "tma_retiring > 0.7 | tma_heavy_operati=
ons > 0.1",
> >>>>> +        "MetricgroupNoGroup": "TopdownL1",
> >>>>> +        "PublicDescription": "This category represents fraction of=
 slots utilized by useful work i.e. issued uops that eventually get retired=
. Ideally; all pipeline slots would be attributed to the Retiring category.=
  Retiring of 100% would indicate the maximum Pipeline_Width throughput was=
 achieved.  Maximizing Retiring typically increases the Instructions-per-cy=
cle (see IPC metric). Note that a high Retiring value does not necessary me=
an there is no room for more performance.  For example; Heavy-operations or=
 Microcode Assists are categorized under Retiring. They often indicate subo=
ptimal performance and can often be optimized or avoided. Sample with: UOPS=
_RETIRED.SLOTS",
> >>>>> +        "ScaleUnit": "100%"
> >>>>> +    },
> >>>>
> >>>> The "Default" tag is missed for GNR as well.
> >>>> It seems the new CPUIDs are not added in the script?
> >>>
> >>> Spotted it, we need to manually say which architectures with TopdownL=
1
> >>> should be in Default because it was insisted upon that pre-Icelake
> >>> CPUs with TopdownL1 not have TopdownL1 in Default. As you know, my
> >>> preference would be to always put TopdownL1 metrics into Default.
> >>>
> >>
> >> For the future platforms, there should be always at least TopdownL1
> >> support. Intel even adds extra fixed counters for the TopdownL1 events=
.
> >>
> >> Maybe the script should be changed to only mark the old pre-Icelake as
> >> no TopdownL1 Default. For the other platforms, always add TopdownL1 as
> >> Default. It would avoid manually adding it for every new platforms.
> >
> > That's fair. What about TopdownL2 that is currently only in the
> > Default set for SPR?
> >
>
> Yes, the TopdownL2 is a bit tricky, which requires much more events.
> Could you please set it just for SPR/EMR/GNR for now?
>
> I will ask around internally and make a long-term solution for the
> TopdownL2.

Thanks Kan, I've updated the script the existing way for now. Thomas
saw another issue with TSC which is also fixed. I'm trying to
understand what happened with it before sending out v6:
https://lore.kernel.org/lkml/4f42946ffdf474fbf8aeaa142c25a25ebe739b78.camel=
@intel.com/
"""
There are all some errors like this,

Testing tma_cisc
Metric contains missing events
Cannot resolve IDs for tma_cisc: cpu_atom@TOPDOWN_FE_BOUND.CISC@ / (5
* cpu_atom@CPU_CLK_UNHALTED.CORE@)
"""
But checking the json I wasn't able to spot a model with the metric
and without these json events. Knowing the model would make my life
easier :-)

Thanks,
Ian
