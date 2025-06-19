Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7023A241663
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750310056; cv=none; b=Kv2ogxWNDHP2p7AuP57WU54/+iT0KAqWIMFJds20qx/50HlVIiCvIAQyBLS9urNli3RuMGMat4mfPsK+PsJktcUCSsaDKHkwxbGGvTBLwg2FVieThu/tMN1no4y64SSch9Is4fxiA2n15z8i0/fm+PpW8/va0CaQMPAZbftWsUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750310056; c=relaxed/simple;
	bh=QBkyhwQRKWCAhVy2NsG2DtnIeKuVCEijDsJQuYKzn0U=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type; b=BsTs2/cXRUcpyNTKyhTn1ntNOrNmtlA+OyP723Avlty5dHeUkQDZpjQjLBbGMrv3eoBptlq5dG4O8d0MzQTPBBqxmZF1AQMHCim9BD05GmmcVAfWOn2nSrdYUnzJELdI+0wi9gzFYaDis+ocqSuchoM2/FC5OFrYZAzukicr5wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVH/Rne7; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVH/Rne7"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-73c17c770a7so421110b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 22:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750310055; x=1750914855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:user-agent
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QBkyhwQRKWCAhVy2NsG2DtnIeKuVCEijDsJQuYKzn0U=;
        b=ZVH/Rne7a0doQhtv+chRVNg34nS3eOkDBorE5V7zyGY++8rtL4jitCS91a2tBBX8v/
         WA0YNWghq0qG2bn3MrtSjjSwcrvalG+CXZx4Z4aMNCHYUItfU5pmbsgzhj5XxDtJPm4N
         sBvoUqHFOslWaCHNN9h9wpFUznhJJbFLwCRhP3byOrcWR4E+/zTK405+6Jyck0BR3CJq
         LiJzUJIUHIBGbPLhsRzAT2IaI2RPmy9zjpko4fRuQnwkwgyPeFJBaCturGvNLmlONWU4
         oAlIRGaJCXXDX+NHhCY5RCdtp+gIIjiLTxtlLM3/Gy036t2JFsHcftl1jaytMWQe+Q+y
         ujwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750310055; x=1750914855;
        h=content-transfer-encoding:mime-version:message-id:user-agent
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBkyhwQRKWCAhVy2NsG2DtnIeKuVCEijDsJQuYKzn0U=;
        b=rVynNF7hGG24ECWlwSFaFgBdwLiUtZ8gF+HBcsPblJxQtY9yq13agd4BYz13TyJCtX
         a5tjbFSH29vrmo9BrMmF8th6m9eB9CGCOskOer9Nc7FFtQxrHCLdhxf6yzVEVMKDamIz
         bTO5by+ZP6XDH3ovsjD9igYCw3LvBAOGVCAttrrizrnkqvvwej2CSnZkoh55bFBzFZ+C
         9JnD4Vb0ROHRIsG6mcDVCBoqWpBnhZSe1riG9ZgHsVI9P300Yi+5ey5onW2OdkK1Uhnr
         uDS9EEp/zPTxfq1qsn9cDk9kniYHZpuF0kOPTVFmv5ZhBB/XZA0NPzztPScJ3+JsJTSq
         Hz6Q==
X-Gm-Message-State: AOJu0YylD1CZyULEQRCN6xya9VrGYexUisjgNw3GwCG4BM+ciXRrraEf
	qxyIlzMIC2U/OmJOMlJ3ONoaCEax3C8ftWBVstYAAh871XPQOD2QFqsvQfyux6vh
X-Gm-Gg: ASbGncvgmpk1YIJ+e0w1YqgzoFrjAUcVHRSNgLUuu9VLk5nNov0stGmm1Xqcywk0sl5
	dTbwmUKJsDkukdGFrJthCnWret3GL7hq18WyUgL12XBl8HSDeNi3csAUi25QAZEI4yMTvbsdhr4
	6yzq2duVY9nDCQ4zJYQwNc6PoDUAUYygXXtgPInbctfmd7CCIWzBFvu6lJm3K6kZLTMRC2W698x
	13ryHjFHqqR+g5VMs5PgvZuJmEd1ndH13sLJlcQtVoiHyxqYPUO54RQwojAth0RYn/pOTfqG2vY
	RDDZVwm3bbUx953SLXwmhJ1dzuCZw2nY3QK0YO7WoDJKpZ/iESYmlJG9y6vBU3Lt7eH64ZQ=
X-Google-Smtp-Source: AGHT+IHpmA2ik98Ba61BlClIZJ/wu6L/lJ6ztECrv3Tt23OzpSoT6PG6rY0aVfitsWmYPFKoC4dufw==
X-Received: by 2002:a05:6a20:43a3:b0:204:4573:d854 with SMTP id adf61e73a8af0-21fbd54d331mr27318939637.9.1750310054704;
        Wed, 18 Jun 2025 22:14:14 -0700 (PDT)
Received: from ?IPv6:::1? ([2405:201:900e:b1b1:9137:fb9b:67f2:dce4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1680c5fsm12056465a12.49.2025.06.18.22.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 22:14:14 -0700 (PDT)
Date: Thu, 19 Jun 2025 10:44:10 +0530
From: Abhigyan ghosh <zscript.team.zs@gmail.com>
To: jhladky@redhat.com
CC: linux-kernel@vger.kernel.org
Subject: Re: Kernel panic in __migrate_swap_task() under stress-ng
User-Agent: K-9 Mail for Android
Message-ID: <6FAF1A0D-540A-4E08-B358-3335BAD36BAC@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Hi Jirka,

Thanks again for the detailed logs and clarification=2E

Based on your trace and timing (often crashing around test 30+ out of 41, =
after long runtime), I suspect it could be a use-after-free or delayed wake=
-up race in the CPU stopper thread handling=2E

In particular, I noticed:

The RIP __migrate_swap_task+0x2f attempts to dereference +0x4c8 from a NUL=
L task_struct pointer=2E

That offset is near task->se=2Ecfs_rq or task->sched_info on some architec=
tures =E2=80=94 which makes me wonder if the task was already de-queued fro=
m its CPU=E2=80=99s rq during swap or sem cleanup=2E

Since stress-ng uses short timed sem/fork loops with varying threads, mayb=
e the task was migrated mid-finalization?


As an experiment, I=E2=80=99ll try:

Looping stress-ng --sem --taskset 0-15

Watching perf top and tracing with ftrace on migrate_swap_stop and task_rq=
_lock


Let=E2=80=99s see if I can narrow it down further=2E If I get a hit, I=E2=
=80=99ll share the trace=2E

Thanks again =E2=80=94
Best regards,
Abhigyan Ghosh
zsml=2Ezscript=2Eorg

aghosh
