Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341EB23CE
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 21:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738791242; cv=none; b=o3T90VxYM1Poz0x7p4IHi4Ie5JoC6/QHMTN4fomAbpvA3hJiNk8y6an7F5H5R+6ELsOhfH48PCblvXB5Bi/5WbXB7VOENR4AY33ulYtXXRtT2m+wIXbuK7EDu2d5jLl4+PPW9o791tAsQqr6eRpKhzeBJw9mfhUoyCbk7wxOECc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738791242; c=relaxed/simple;
	bh=eBSTUGxD//kOShGY5ELVmIyMxkUfJTCp7ECASLoWsiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qs8xYU1k2udXLo0aeOTCaiCIwhPT1u7CxP3vPKYlId5RFaXGPh7N4tTjEod5Gra+S1bY/hB+vXqy9usOomgFB+O+mtJVvCiHREE8zanWBJJDMs0lG89rKsFNQL1+PThzbBLCbxvVIX9HqaPDaqq7ChEIJVysCgdJgCpI2uoygRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=37hM9eZk; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="37hM9eZk"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3a9d0c28589so26745ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 13:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738791240; x=1739396040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUUV625mQLpCEzHSpi7Az0I8LU0Hx7vOkVtXv2Yd2Gs=;
        b=37hM9eZkHW374Sf1FwkfMKXKSZap3I3ozCAi0BgSjYvypIPQw9IV5pAWRF2W99Zh4h
         QotHJwLTN75vJu8dT6Kq1D2jXabgoc2Ou0yxD3driudPln1FqpfD/+cIv2y3XU+bCcOz
         O+EZfQfkPguS0ogH5oWUIhkmFX6qWB6LdO4QS88exKdlbKkCJ16koJ9TWbXdxUsox4Jc
         gtC/pmrzIHzXuwygq13nw0QsdmzC/Xk2QFzD/1VvGhVYfwP4qv1bsDvN29HGps/rn0sd
         RdmuQAt6OAlcUTXFgspCdHhdJRxFJzZXwhJzFrrljmze+q8//Gae4szZgD3sr0hLfQiA
         ai4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738791240; x=1739396040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kUUV625mQLpCEzHSpi7Az0I8LU0Hx7vOkVtXv2Yd2Gs=;
        b=tB/NxBaNoYfvsmDUlZ1CHn1/u2sUZDoEnYeHTVECtvIV7wlVxF0QGp7TpL7Knn6wQI
         yMro56MfSBWbjcYWadUfj3/N/dyz6uw8Myo3PL15Kfddi2JIfae8xlzUM4Tw12FlzPe3
         11U9mtzqCzadCo2NxcH66tGjbkEv5FJhbT3ev7w0+BvoddPDZ+gdXLTLczV4OrE7FmDY
         lVrESqFAgIM/5W48V42tImsoLpYQmE4awUUT3Q3VTPzwXE5eeg14zPgN+JjzJz6dPjWa
         KrNG4GaDFLFaQPWmA+/FNdUkhiJWPufhcEvR/ZSZ+etpt4nqxA1lXGwnWMG078TnIzEI
         ks9w==
X-Forwarded-Encrypted: i=1; AJvYcCXF+OkyOrYrgAbHFfkAVcr6O6zD8EKuvrGfan2KRWauG7LJbRLD3bFICuArCfu/s4tRL0diPCJbm6mFXn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKBNg3L1za7TwheO8M9a/N2eBbZYjCQbVtU2+qdxjB9F+FIZ/A
	dpLFeRzAUhtEmXA4miI5ri6fw5SrHcmLQl0kyTznHs3oDbAy4WAJ1ZmfccYvHhsrTA2Gjg1JE0h
	uP2xxLJt1qHY9MhJ6ua9Qkctg7TCv/D3bSHqO
X-Gm-Gg: ASbGncuedQYwcmS1ySXV5KAyMan9CQ2yqPYGWy8m1Z29VLapxaJPEZQsB9qhjUbDrS7
	HEMznAuJxSSq9qUfTPP+3mYxHj4PhG+OfcawOdHS06evvCYYtALrjlB+cOvASo3xfHuzg6k7Sn1
	VJ+x1KaYdDUUq7C67w3iHgrgRR
X-Google-Smtp-Source: AGHT+IHE9Vx086lIoTrWWG1vp5TySLItIjd4vQpFqbKYzj+qrscX9TnMYQwc8CbtTQguFwdLajmDJdpxGp7G0ao0WJU=
X-Received: by 2002:a92:dac1:0:b0:3a7:7d6e:fef9 with SMTP id
 e9e14a558f8ab-3d05b55607dmr625755ab.27.1738791240131; Wed, 05 Feb 2025
 13:34:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205173140.238294-1-irogers@google.com> <20250205173140.238294-12-irogers@google.com>
 <7692d2d6-16d5-4f50-8c3a-37f1db356426@linux.intel.com> <CAP-5=fU+9MgMbQKpFix+Jw8k+-_yfAs-F+FYE4CmTWxevPmd-A@mail.gmail.com>
 <9fa56c75-2ee6-4901-9e04-0ec23412fd62@linux.intel.com>
In-Reply-To: <9fa56c75-2ee6-4901-9e04-0ec23412fd62@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 5 Feb 2025 13:33:48 -0800
X-Gm-Features: AWEUYZk1_XgKXzK7N8G8o0zkZNjpDmzS6I_UBHUVp7jTC8iYrMa6799OUcHoAtw
Message-ID: <CAP-5=fWpbXSwZq5biRZ1fjcSJY2DO4g=cv-0K8jZ1Gzv3bOfhA@mail.gmail.com>
Subject: Re: [PATCH v5 11/24] perf vendor events: Update/add Graniterapids events/metrics
To: "Liang, Kan" <kan.liang@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Weilin Wang <weilin.wang@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Perry Taylor <perry.taylor@intel.com>, Samantha Alt <samantha.alt@intel.com>, 
	Caleb Biggers <caleb.biggers@intel.com>, Edward Baker <edward.baker@intel.com>, 
	Michael Petlan <mpetlan@redhat.com>, Thomas Falcon <thomas.falcon@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 1:10=E2=80=AFPM Liang, Kan <kan.liang@linux.intel.co=
m> wrote:
>
> On 2025-02-05 3:23 p.m., Ian Rogers wrote:
> > On Wed, Feb 5, 2025 at 11:11=E2=80=AFAM Liang, Kan <kan.liang@linux.int=
el.com> wrote:
> >>
> >> On 2025-02-05 12:31 p.m., Ian Rogers wrote:
> >>> +    {
> >>> +        "BriefDescription": "This category represents fraction of sl=
ots utilized by useful work i.e. issued uops that eventually get retired",
> >>> +        "MetricExpr": "topdown\\-retiring / (topdown\\-fe\\-bound + =
topdown\\-bad\\-spec + topdown\\-retiring + topdown\\-be\\-bound) + 0 * slo=
ts",
> >>> +        "MetricGroup": "BvUW;TmaL1;TopdownL1;tma_L1_group",
> >>> +        "MetricName": "tma_retiring",
> >>> +        "MetricThreshold": "tma_retiring > 0.7 | tma_heavy_operation=
s > 0.1",
> >>> +        "MetricgroupNoGroup": "TopdownL1",
> >>> +        "PublicDescription": "This category represents fraction of s=
lots utilized by useful work i.e. issued uops that eventually get retired. =
Ideally; all pipeline slots would be attributed to the Retiring category.  =
Retiring of 100% would indicate the maximum Pipeline_Width throughput was a=
chieved.  Maximizing Retiring typically increases the Instructions-per-cycl=
e (see IPC metric). Note that a high Retiring value does not necessary mean=
 there is no room for more performance.  For example; Heavy-operations or M=
icrocode Assists are categorized under Retiring. They often indicate subopt=
imal performance and can often be optimized or avoided. Sample with: UOPS_R=
ETIRED.SLOTS",
> >>> +        "ScaleUnit": "100%"
> >>> +    },
> >>
> >> The "Default" tag is missed for GNR as well.
> >> It seems the new CPUIDs are not added in the script?
> >
> > Spotted it, we need to manually say which architectures with TopdownL1
> > should be in Default because it was insisted upon that pre-Icelake
> > CPUs with TopdownL1 not have TopdownL1 in Default. As you know, my
> > preference would be to always put TopdownL1 metrics into Default.
> >
>
> For the future platforms, there should be always at least TopdownL1
> support. Intel even adds extra fixed counters for the TopdownL1 events.
>
> Maybe the script should be changed to only mark the old pre-Icelake as
> no TopdownL1 Default. For the other platforms, always add TopdownL1 as
> Default. It would avoid manually adding it for every new platforms.

That's fair. What about TopdownL2 that is currently only in the
Default set for SPR?

Thanks,
Ian
