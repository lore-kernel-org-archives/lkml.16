Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C88A288C04
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 18:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748975042; cv=none; b=TiLR7s2I9LivXR5qdTw/mQL59JXEKujfoD7uvLEgXVMqBirnQzOfLG79LQ1phc/F+l7He8Z5XColKFDx8XzloWJESTpX5bPxG88ILPPHrCWNy2sCjtUcu8RUFTnDcyTe9cWJcnnBQALVBkMvWIzL77v2e8Lhj1OfFlYBapwq+6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748975042; c=relaxed/simple;
	bh=eiutlgQbbFswcPoUKxtmnu9MmBbg4ONzk6H4t4P4Txs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jebtoqxQRIB3fnq1sL61stiWoXHWdwNc7w0islugsXLZvrDTa1GYlpPQdim7fEklC/i9LMJTuI1VyZfWRRPmeWSrYtOrET3IBb0i0OYNNezeiWB7+VNZ4lZF8BnASWZzKikRDGO68EtEN+CXO8ihkLEbEcMVQcGYz5HE6h7LQv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dVOpRlVH; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dVOpRlVH"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4e5adc977ecso1812615137.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 11:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748975040; x=1749579840; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiutlgQbbFswcPoUKxtmnu9MmBbg4ONzk6H4t4P4Txs=;
        b=dVOpRlVHAcBXHpJQhH4vcXcBNz/Ol0E20S1mx2ADnDuicz5BYNsak535bHcfiUILTZ
         TozmzIR1z9aQYODGbJFlBuervl8Pzid/5R6W1DgQcxFgwOinOVXQgt/0/1w6ZSQQ+ful
         r5h0rB0lAX2nVuhtosyRRiee6ocD7tOSdIgDXNeVkvmCaS/pk4ZYUpTXwRfUwMLJioxt
         UtCa4K357gfvhwoTARf2BHM3fBrvPig2HIn9pVIM3yjrP/kO3PACF+I857lGwVylPySc
         PxVEPlFNZLpeAbCsgQzQiWK5F5u9D0YTINMaD4lfB+x8O+iTgRAqvG4BTrfKIWsg3J3Q
         sglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748975040; x=1749579840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eiutlgQbbFswcPoUKxtmnu9MmBbg4ONzk6H4t4P4Txs=;
        b=m4k5cQ7wDSqDhoLkk5Bvy9LjzDoEf4+ItkbLErCi8Xf6GEiVCHLTpfuUfu9+DL480O
         XYslUVWH78DlDBYQkc9iCyQv9cntWEwA2iElqOgdAtRcEb4zi4EuT+NvLdXSmzMHarsN
         86f3lD0fyzCgkv+caaAKtKcXcHg7Hu6X1TlfTaeBG6aU/9xHvwMw2MkYEV/S3wA+72cf
         tgQ7aDHptaKuEHrLopBCv3FjGEypgDH+uGYKAuu0l3BT4mccujRmqEGRQdU6NbCwjtZK
         WIc22qdfhxCWbohQ80NYyJ/Z+v9lgsDSVPpk1O8MtHjUj5fvx0RhW1S5HSJTPVJRFqzH
         ZyPw==
X-Forwarded-Encrypted: i=1; AJvYcCW0p5rGrKLgLs9/dQJE9o1mwUb21aUlBe1K1Me0Wo2m+xFKdQdYG1jUxySsrE2qorT4mZIl5yqTkvdbiO8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+QsRgjOirmCZP3TvII7wZZXW3MC/GAAxmdxoyJDgyDOSpCbQ6
	l39X0JkQLNxZ1Yu2TU6MiNgArUv0P1LM6EDD9zrpIY44woE2tc03UNQn6lHZ3QElkcVBWjLHYxh
	X5UuSmdPWhO7BiMLmQBE1eE+c50AC8bWdv1XeafFz
X-Gm-Gg: ASbGnctI/nJkYfwoLKO4ErIm2GJnk/pNMepugQBHki/rM7IQqjKPpmthH9cnAoLtKms
	41FGpMAXpHZT+uLON6RnaSyKCCoUCuFb6d7yzwnBoiARAJ7lrIC+bh3nQaoBrT+BkeAl//cbfgS
	PRnRW6MqDyQVKnwqtbEszZMFNJDCwn3kjvCLhz94Bklb5lVBef4dvzEam7Tkfp6vQHabHEPs+iQ
	tetMunzqlo=
X-Google-Smtp-Source: AGHT+IGu3iGfbqqsG3F9IVzijCh7yIShG1fCIQdA9Dgix1KcAW3sFId+iZ1kuCoUZV8YX2AkrDLGqQebTSC/08SGhzM=
X-Received: by 2002:a05:6102:ccf:b0:4c5:1c2e:79f5 with SMTP id
 ada2fe7eead31-4e701b94cecmr9613373137.16.1748975039606; Tue, 03 Jun 2025
 11:23:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521222725.3895192-1-blakejones@google.com>
 <20250521222725.3895192-2-blakejones@google.com> <aC9iF4_eASPkPxXd@x1>
 <CAP_z_Cg_vH1+BAm87U4gYQ0hDRGtHkkYb2DHtTRSd_QNvg3ZLQ@mail.gmail.com>
 <CAP_z_ChErhmooT5rhyXH8L-Ltkz3xdJ7PG20UKDpn9usMUgqTA@mail.gmail.com>
 <aDntjJcJsrQWfPkB@google.com> <CAP_z_CjLtMq_FvmijnFUQbD5UUw=T9jP_pHWCw5fS=38dgSh9g@mail.gmail.com>
In-Reply-To: <CAP_z_CjLtMq_FvmijnFUQbD5UUw=T9jP_pHWCw5fS=38dgSh9g@mail.gmail.com>
From: Blake Jones <blakejones@google.com>
Date: Tue, 3 Jun 2025 11:23:48 -0700
X-Gm-Features: AX0GCFszGyqeZR0Dklu6vwdsbGkQkC3kk6Dhkl4_uVAGYzvPlnmcKX43Rvyctf4
Message-ID: <CAP_z_Ch8hKvGvot7140ShuCZOxkb+7M7Wpa4AY-D-Arp9P5ffg@mail.gmail.com>
Subject: Re: [PATCH 1/3] perf: add support for printing BTF character arrays
 as strings
To: Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Chun-Tse Shao <ctshao@google.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	James Clark <james.clark@linaro.org>, Charlie Jenkins <charlie@rivosinc.com>, 
	Andi Kleen <ak@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, Leo Yan <leo.yan@arm.com>, 
	Yujie Liu <yujie.liu@intel.com>, Graham Woodward <graham.woodward@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Ben Gainey <ben.gainey@arm.com>, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The libbpf patch set is under discussion right now. Once it converges,
is there a way to include those patches in the perf tree without
waiting for them to go up to the main tree and then back down? Could I
resend them here, or include them as the first part of my next patch
series?

Thanks in advance for the guidance.

Blake

On Sat, May 31, 2025 at 12:26=E2=80=AFAM Blake Jones <blakejones@google.com=
> wrote:
>
> Hi Namhyung,
>
> On Fri, May 30, 2025 at 10:40=E2=80=AFAM Namhyung Kim <namhyung@kernel.or=
g> wrote:
> > I think it's better to go to the bpf tree although it'd take longer to
> > get your perf patches.
>
> Thanks for the suggestion. I've sent this patch to the bpf tree, and I'll
> resend the rest of this series once that change makes its way to this tre=
e.
>
> Blake
