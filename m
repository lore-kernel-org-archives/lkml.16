Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E02E21D5B6
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750336971; cv=none; b=B51GjJkSUJS7LnqApUHTugv1sbkjBVVbTsZ8jHrx4UcePEpATUZGzRdclhjtBFaJqUpqndNnRQNih69B2K9NBI1Wnr0epB9YimwJAWqtHtgIHcYQtEE32FTNvQcEDwRXsWgXJxWW+hyXSItG66NeCQMpIwjgMgWadV3I52xLCFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750336971; c=relaxed/simple;
	bh=D6VWPFyDtct8+F5EFuKze9vhXbPl3tZJTchBaHvDcOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WiLgiij0SmqgULN3YF+JpIg0L5mDaA1clu1oXu+gFMp8m0MWR3MwyoUVNIGvUnOmc56HOilaq3GAr55AePMBaG1dH2wjb25x0pHoglTi+33hbQSSUOcvYGH/meAyJGF2Xo+lAdWteuj/Zp01ktgJZhU37m6envjYtUyqAl/0qJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z+YNb5cz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z+YNb5cz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750336968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D6VWPFyDtct8+F5EFuKze9vhXbPl3tZJTchBaHvDcOQ=;
	b=Z+YNb5cz1Rd4NfMxU5j/F0j4G7TN7Cxrt2vlDuI0/+sSESqWadkJr6nh88SJ4QrDax3nLM
	s7bw4TTjEDYI/Z2k/nz+v5w+WO44U2jPv8kwehI90qRT/MH8fGAySFhl63cX60EuBJePxF
	bP4Jw8aTue633yy46y87BAQetoa9er8=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-8039SRmoPvGorjWhifFnnQ-1; Thu, 19 Jun 2025 08:42:47 -0400
X-MC-Unique: 8039SRmoPvGorjWhifFnnQ-1
X-Mimecast-MFC-AGG-ID: 8039SRmoPvGorjWhifFnnQ_1750336966
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-32b78b5a8fcso3136571fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:42:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750336965; x=1750941765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6VWPFyDtct8+F5EFuKze9vhXbPl3tZJTchBaHvDcOQ=;
        b=EQIXEkNE0ri/BzmEdn3/CfG/tqUVVbkRPRSXOO0/Ix7dOTrDfLvqyKA9U91dYfqcvW
         3PwfRUmr2iBgEH2U92BeNA5Dq9zZvnFPA4bO6oJiS7WLGtcjipWLSq4iDXBfx1y2pSKF
         ARCu751pn/+ssHeWQ0YA4O1jtHX2xXNZypHnE4atmnG4Td/QJRRDX6WbJ7lzKHYGn6xD
         OUfWLj80yjWcnAe4xkdj/L6PvgAMmI2ISiDLOp9cl7ot6hUVzzDhDcqI5/hfKB/G1KZP
         WOjhXeEnRxiZJHrXZRJP8IKdAKyMlDnTCrwzkJsCmTm631yLBgbe/uc2cgtyLQ+jcC4/
         HIpA==
X-Gm-Message-State: AOJu0YxNRVRZVWlaUpPg/oI/JX9HxpCdtXmXPBNjNGGeZLoh/0b2Sz4B
	1QVgkTdOIFk2/Q6rHR5nqxkb0ruCEmIk0bcPgp8g7AAzauVBmOfn4ich0ZoCeYKqAqgbes7qolA
	6wf7fZXrPLkXgQ5Oikv0oKFCe26iE4RjgDjWG9NmFMm/ulEhNbSNP2uVoCiMPns3pEIi9YA2n0J
	I6RjNI4uQS+mVcR73ucpaWUnZhJewK8DKIxT7zlGzfC3Z6Ne/+bJY=
X-Gm-Gg: ASbGnctqK70jlfMAxiqc5OrcQo7FiBUwtSl8RH4KnMj+DHQVvPadupuaEqy0vnIzsay
	w87UDVqIYZa35Ell5pvt+Iiv2pQY09V4g7A2NyKXQJYqdlgN4V+7p0qg507cPwGuhFpjSUz93tp
	ew
X-Received: by 2002:a2e:a548:0:b0:32a:6b23:d3cc with SMTP id 38308e7fff4ca-32b4a5b9701mr74308121fa.25.1750336964610;
        Thu, 19 Jun 2025 05:42:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH99ITPMlxfQKzsRRzFIkncfAymoy3P8SEPYaD9a9kR9Zjb/F9MnaMFF+qr5bCFCrLLHHPf6ZKVcydxfjGtJwc=
X-Received: by 2002:a2e:a548:0:b0:32a:6b23:d3cc with SMTP id
 38308e7fff4ca-32b4a5b9701mr74307951fa.25.1750336964162; Thu, 19 Jun 2025
 05:42:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6FAF1A0D-540A-4E08-B358-3335BAD36BAC@gmail.com>
In-Reply-To: <6FAF1A0D-540A-4E08-B358-3335BAD36BAC@gmail.com>
From: Jirka Hladky <jhladky@redhat.com>
Date: Thu, 19 Jun 2025 14:42:31 +0200
X-Gm-Features: AX0GCFvkO2TgMY-YkMzgCR0H2NkfELLL6yE5iA_CNpCE4bEz2BWWow1pzk9w12U
Message-ID: <CAE4VaGBJeKCCF11kLq0_a6UO3TCm0PK89QhovjYJsZExwCyUeA@mail.gmail.com>
Subject: Re: Kernel panic in __migrate_swap_task() under stress-ng
To: Abhigyan ghosh <zscript.team.zs@gmail.com>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you, Abhigyan!

>often crashing around test 30+ out of 41,
This is not relevant. We run 41 different benchmarks from Libmicro and
order them alphabetically, so test #30 has no special meaning.

 Let=E2=80=99s see if I can narrow it down further. If I get a hit, I=E2=80=
=99ll share
the trace.
Keeping my fingers crossed!

Jirka


On Thu, Jun 19, 2025 at 7:14=E2=80=AFAM Abhigyan ghosh
<zscript.team.zs@gmail.com> wrote:
>
>
>
> Hi Jirka,
>
> Thanks again for the detailed logs and clarification.
>
> Based on your trace and timing (often crashing around test 30+ out of 41,=
 after long runtime), I suspect it could be a use-after-free or delayed wak=
e-up race in the CPU stopper thread handling.
>
> In particular, I noticed:
>
> The RIP __migrate_swap_task+0x2f attempts to dereference +0x4c8 from a NU=
LL task_struct pointer.
>
> That offset is near task->se.cfs_rq or task->sched_info on some architect=
ures =E2=80=94 which makes me wonder if the task was already de-queued from=
 its CPU=E2=80=99s rq during swap or sem cleanup.
>
> Since stress-ng uses short timed sem/fork loops with varying threads, may=
be the task was migrated mid-finalization?
>
>
> As an experiment, I=E2=80=99ll try:
>
> Looping stress-ng --sem --taskset 0-15
>
> Watching perf top and tracing with ftrace on migrate_swap_stop and task_r=
q_lock
>
>
> Let=E2=80=99s see if I can narrow it down further. If I get a hit, I=E2=
=80=99ll share the trace.
>
> Thanks again =E2=80=94
> Best regards,
> Abhigyan Ghosh
> zsml.zscript.org
>
> aghosh
>


--=20
-Jirka

