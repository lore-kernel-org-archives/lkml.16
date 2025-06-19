Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412D0220F2C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750343028; cv=none; b=iObq1cP4tmneLJGrhaU1inPukcrDxgpl0AwJUHcyKwj/meOMfZke0N2mFazhOz21lxk5MbRvtpimZK9O6DxRfpjWSlmvy4GLVVZIvBqfscIRP8OQH1umSBq37+JeuOnVp+UWbyZ4pp4rqJs2cGIioeHQqvjXREn7ilBTC+Je4ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750343028; c=relaxed/simple;
	bh=FCo1DNjkW+T8595PSKEJlSCg/y4in9ylkXjLOWBoc5U=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=SmZREgzYasF2s2O8erdzoa33rafSTm4HM/0mHaQzk+b3qqeSgRNuin00lCgWXua1TC0YFQK1f5bONdeVd5magyOvrYXXV/Ti4Mn/u3b72+nAqxwCiRfQ5fZZ64v+0bwNuYuvrOLWrvrzaaWWwyi5h/twfGdB9JJb8EgHFTD2xo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAZS3BRs; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAZS3BRs"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23636167afeso8621325ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750343026; x=1750947826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FCo1DNjkW+T8595PSKEJlSCg/y4in9ylkXjLOWBoc5U=;
        b=HAZS3BRsUVnKd2ZwygEOGUr0+gxpWeHvnOKc0SrmM9JShwSuW7WVzOVdMKcZ0zuf/z
         pBqITXyc3B0xINM4IqxNtMwjp4Gxr8s4OSzRnUQTDAyjpqA5tGvb3z2QmeGYYctkt/kU
         1QrC0n8FYMipwPBzme4Mu5ui2vWdEKwcJupa0yb9Ov/bvE+bdHJ1S8H3vXnxurRyETaM
         YTr/pz9ahj6VFdQISsPYjtBwNNC9o4dq1quEIvRlPqf8B0NYNDo3R40HBja+79Sl6cjh
         mA9n+zZ6zlI/8Rhxw9WHk3rNfW6SJywDBAjLRtahkIdHSlb0zTSFvsI5npFyVkedlPhr
         B4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750343026; x=1750947826;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FCo1DNjkW+T8595PSKEJlSCg/y4in9ylkXjLOWBoc5U=;
        b=b/WAUWvubnDk8s17bxyqMN+AVqCn+ZC3NSryGLKK94XNTGXkI7qTFnBqXR7AAypOZ0
         FG/jmco/BANRs2srLMoeAcZoKtW1gYx1l/RB9PzhGRkEvAKbUVCdKTY0sXe4tTh9hZwl
         t8QzCyRJI2uP+jPbQkzOEX40PDu205wdZQygQ/6tyXgrPnYQslBCKvxaNxJaDMAg0130
         jXqwlrqi4SlPfGr4W96iyu2Pc/aRYdIpzydwTBtxRtZzzZAZjWcnUnLylr4Yx3voER+K
         +mHFVERGjKeBmQKmA5Z1oNWCpbDqCjDnmc9WzoP9BpPksS2+/+zyRG93NmgtUniRVkNX
         BZog==
X-Gm-Message-State: AOJu0Yzsjf6AiA4vRwutC2sdo2HB9exGm8KoYscAW/MjYxeUMqgS7/Lb
	ZUB2soL//GvI6aKhCQ+uva0XVaY7+PTKaVJMVyXYQIzoMLRmxA71LLSjVg/uxiir
X-Gm-Gg: ASbGncuYtSdWWBiF/NDcwiYfVtfsSdfrFT5jRVYB2WzIiwNAknAsYqCBIx8r+azt8Hi
	I1OJRiimUOUFh56yecYxS7FD6YPnjr2aLoUgRhiv2+vRHbFQItc4ZZAOph7MDsTRguh1B3H3sBq
	1hpoQwNmqSQmnHMN2gPLts2HtUdDIDBa8JE0jDRCkk7QtgezzcRzWQPFffBylenmIrovXqTeoI7
	14X9M+pOJgwizWSzE9WAFwU82xC4RJmYn1GjlJ87t57zzkHrPYyL/eTLP7iBP+HFzjGCadx6r7Y
	uBDUrEq6SVIWI1CI6qHRnfd+iiUDW4kz3RPle8w06EFZYXq6rN9xvBT2FBxOpxtYwR/+wjM=
X-Google-Smtp-Source: AGHT+IEhyse4GYaVucaW9fEgrLBLhWckOeSg4RsBEHFeub8RhPyajiMUIkuacVPEsE6YwMOGABB9Dw==
X-Received: by 2002:a17:903:1b45:b0:234:c5c1:9b5f with SMTP id d9443c01a7336-2366b32ce15mr336080295ad.16.1750343026040;
        Thu, 19 Jun 2025 07:23:46 -0700 (PDT)
Received: from ?IPv6:::1? ([2405:201:900e:b1b1:9137:fb9b:67f2:dce4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88e4basm120313045ad.9.2025.06.19.07.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 07:23:45 -0700 (PDT)
Date: Thu, 19 Jun 2025 19:53:34 +0530
From: Abhigyan ghosh <zscript.team.zs@gmail.com>
To: Jirka Hladky <jhladky@redhat.com>
CC: linux-kernel@vger.kernel.org
Subject: Re: Kernel panic in __migrate_swap_task() under stress-ng
User-Agent: K-9 Mail for Android
In-Reply-To: <CAE4VaGDi3+aO8U5CoHGa2ichToyUbhkc+6NwAvCmwq5LS5Trew@mail.gmail.com>
References: <6FAF1A0D-540A-4E08-B358-3335BAD36BAC@gmail.com> <CAE4VaGDi3+aO8U5CoHGa2ichToyUbhkc+6NwAvCmwq5LS5Trew@mail.gmail.com>
Message-ID: <DB8FFA27-CA9D-4693-9917-5478A0940C79@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks Jirka for the clarification!

That makes sense=2E I initially thought the crash location might correlate=
 with test order, but now I understand it's alphabetical=2E I=E2=80=99ll fo=
cus more on which tests were active when the crash occurred (like =E2=80=98=
sem=E2=80=99 and =E2=80=98fork=E2=80=99) rather than their position=2E

Appreciate your help again!

=E2=80=94 Abhigyan

On 19 June 2025 5:31:28=E2=80=AFpm IST, Jirka Hladky <jhladky@redhat=2Ecom=
> wrote:
>Thank you, Abhigyan!
>
>often crashing around test 30+ out of 41,
>
>This is not relevant=2E We run 41 different benchmarks from Libmicro and
>order them alphabetically, so test #30 has no special meaning=2E
>
> Let=E2=80=99s see if I can narrow it down further=2E If I get a hit, I=
=E2=80=99ll share the
>> trace=2E
>
>Keeping my fingers crossed!
>
>Jirka
>
>
>On Thu, Jun 19, 2025 at 7:14=E2=80=AFAM Abhigyan ghosh <zscript=2Eteam=2E=
zs@gmail=2Ecom>
>wrote:
>
>>
>>
>> Hi Jirka,
>>
>> Thanks again for the detailed logs and clarification=2E
>>
>> Based on your trace and timing (often crashing around test 30+ out of 4=
1,
>> after long runtime), I suspect it could be a use-after-free or delayed
>> wake-up race in the CPU stopper thread handling=2E
>>
>> In particular, I noticed:
>>
>> The RIP __migrate_swap_task+0x2f attempts to dereference +0x4c8 from a
>> NULL task_struct pointer=2E
>>
>> That offset is near task->se=2Ecfs_rq or task->sched_info on some
>> architectures =E2=80=94 which makes me wonder if the task was already d=
e-queued
>> from its CPU=E2=80=99s rq during swap or sem cleanup=2E
>>
>> Since stress-ng uses short timed sem/fork loops with varying threads,
>> maybe the task was migrated mid-finalization?
>>
>>
>> As an experiment, I=E2=80=99ll try:
>>
>> Looping stress-ng --sem --taskset 0-15
>>
>> Watching perf top and tracing with ftrace on migrate_swap_stop and
>> task_rq_lock
>>
>>
>> Let=E2=80=99s see if I can narrow it down further=2E If I get a hit, I=
=E2=80=99ll share the
>> trace=2E
>>
>> Thanks again =E2=80=94
>> Best regards,
>> Abhigyan Ghosh
>> zsml=2Ezscript=2Eorg
>>
>> aghosh
>>
>>
>

aghosh
