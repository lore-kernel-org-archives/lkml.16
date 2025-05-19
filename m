Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3A92116E0
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 19:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747683642; cv=none; b=XO5XWQdcDOE09hZ844XWGXVkED4HM0CyUKWftLPT0EUpwFicbgG0cTEoNcSBZT0EiMwBJ0blAA9+I3wFdfeO5TdJZ2A+dzQm7DEj/IdeWMLeuX90UGbHbPb9Z8084ZaDSvxq+aUZ67Voc7oYWPImeEiktxP+gZMQ2ZFdAyDyk5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747683642; c=relaxed/simple;
	bh=fzDLlOGj1pvf//Mc9EeTou5DsvMR/5VqKWlOwhZhaNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QdSykY0y27xUSc7uTiBPE/x9P+6qMjT7t4XL7iI3qS2qvq5VX48cmv/XsAA79oLD5khH2J0g5b2UEkQxkNVBWuvB/NNBgB6HUxHNH1Kaa7TU50kjXl687Id5qs1ttdzreBkzTSckGcL3UYQ9pmEmmYgKNmAhqef/kRWFjSJqRLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=karlexai.com; spf=pass smtp.mailfrom=karlexai.com; dkim=pass (2048-bit key) header.d=karlexai.com header.i=@karlexai.com header.b=TtWBf3HR; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=karlexai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=karlexai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=karlexai.com header.i=@karlexai.com header.b="TtWBf3HR"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad5297704aaso746447966b.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=karlexai.com; s=google; t=1747683638; x=1748288438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzDLlOGj1pvf//Mc9EeTou5DsvMR/5VqKWlOwhZhaNQ=;
        b=TtWBf3HRRe9MoHp2ptGi7CQlEMyiY9ZFQry9lPxcK2ewEV1QCCth3HMFGLSyeYVCbT
         wQPO/x9oRQWgNlKiZtq+yCeg9InjLAltTCijmwKM+4sX1ikPlP26hUhEHKORa2qMZESP
         BJLVDvHGNa6+O5/hN9fFESwaX1r8E5JEy6ikRJ1njxKxlkXSFtEhitx5DwyR9n+FNm2i
         tkbUOC43UyCzbFxkGG7AnNcTzY1Ml1IsBPNgVcuhdCjnICADHdNtYFm9xsBXCvMFosbP
         rHIXfRf+5BOGMSC3TDzoV8NjjR+YEBB3xfZmDItfamEU/O/snSYrbSxlsmTimQn9KvIB
         lvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747683638; x=1748288438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzDLlOGj1pvf//Mc9EeTou5DsvMR/5VqKWlOwhZhaNQ=;
        b=NHa1PuL8HYF194hHfG/I9vLov0UGxjH16oW2eD6S1vGvLXEFTx3bTawKwDCFSi1A0l
         q+me0evBIoOvxURSCTz0yYGramD7qmMz4aPOQsyr294+Ip+/5UJT22KtX7FlS7hYUu3W
         FsCATdYLtjglAItiCkM9renAsH2r8wikobTh5d5uGt1iACTRBPohfp7S/yOga37ssL4a
         KdugGjqyAEk9mn7PY76ilfLLQa0gLW136Urk+MT9lFzQkntf37Or+jtP2bqSWl+65iMw
         18nb764QNlw5x+GNCmA2n49HQwxi0Qcv4serqObgjVBMowQHf/2vBHpSfEPa0Mtife0o
         wIVA==
X-Gm-Message-State: AOJu0YxfLe+daeMNr+HYbcUSTFpzsDfIMRYtBrrH7jgncTAPKJupQ+oB
	5a+be/JqFb7Plrjgg8Kgmr53ciKbAlOhNL5ekjQ6rd5MGguKG9/0oeMbmfz6Ns5OJnyLWzKDytU
	Bbpa/IGhE5tC1tkPiW5DMzga4ckxN5SBvzpnqsYnb+yYZMZO11H9Ae2M=
X-Gm-Gg: ASbGncvnWpOv3D/Yb07KnDBSspAOU+9RArN6UyI9pmrXbvDITH92oZqkf1nH00HMS2k
	bowYGe2bb0ybPGproHKCODQlYHDy3y+Q9PBmoz4zY4jUddjkDDQlpCE8hPqr0FIB1gfJY/Sovq7
	Ar/AduTNi6hrPCy1SNEZskW8ZhcO9P/dn7lw+C9THmHLfmdw2oBLgPLWBk8TfHUxqKSofPtAtBi
	4EOXw==
X-Google-Smtp-Source: AGHT+IEWuA8uFa+j9pIqSV3LWC71itWuheMdaBYA86dF2CXyMoxTfiZJ+WcUQW1lpKsnFUvYPPouTGg/k8ONC60Yb5w=
X-Received: by 2002:a17:907:2682:b0:ad5:2b4e:bb7b with SMTP id
 a640c23a62f3a-ad52d49e2ddmr1272560866b.15.1747683638056; Mon, 19 May 2025
 12:40:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAELLoAjVdYkmZR15e4TTzy21PxGBu=rbFp31uwMULcFvZx4V4Q@mail.gmail.com>
 <CAELLoAhC3emyLF26DNNb0m-D+eUJ2z9=G6r1Px+oYwOztzvZ=g@mail.gmail.com> <CAFLt3pgG8rzyULWGGeMifZWzV6si2U0zrzyZUjhYxm1BT-1JnA@mail.gmail.com>
In-Reply-To: <CAFLt3pgG8rzyULWGGeMifZWzV6si2U0zrzyZUjhYxm1BT-1JnA@mail.gmail.com>
From: Vikram R <vikram@karlexai.com>
Date: Tue, 20 May 2025 01:10:26 +0530
X-Gm-Features: AX0GCFvLECesW_9RhXG-s2dBDqipE3tkYNDVF6mllUnHb0akdowLEqvYy-NEzkk
Message-ID: <CAELLoAhV738NN0=0VLx6obioPfVuHqWjWA7GwcXmmOU_zR_t-Q@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BANNOUNCE=5D_Call_for_Contributors=3A_ASIOS_=E2=80=93_AI?=
	=?UTF-8?Q?=E2=80=91Native_OS_=28Kernel_Work=29?=
To: Grozdan <neutrino8@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-newbie@vger.kernel.org, 
	kernelnewbies@kernelnewbies.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the noise.

On Tue, May 20, 2025 at 1:00=E2=80=AFAM Grozdan <neutrino8@gmail.com> wrote=
:
>
> Please do not spam the list with your AI crap!
>
> On Mon, May 19, 2025 at 9:28=E2=80=AFPM Vikram R <vikram@karlexai.com> wr=
ote:
>>
>> ASIOS =E2=80=93 Envisioned to Host and Sustain Cognition & Synthetic Int=
elligence
>> The world=E2=80=99s first AI-native operating system.
>>
>> ASIOS is a new class of OS built on Ubuntu 24.04 LTS, designed from
>> first principles for AI workloads. We=E2=80=99re creating the foundation=
al
>> infrastructure layer to support ever-more sophisticated
>> intelligence=E2=80=94from today=E2=80=99s deep-learning models to tomorr=
ow=E2=80=99s advanced
>> cognitive and quantum-ready AI.
>>
>> Building on our May 3 thread, we=E2=80=99ve landed a resilient config-ov=
erlay
>> and build script for ASIOS on both x86_64 and aarch64. Key artifacts:
>>
>> asios-config-overlay.sh: idempotent Kconfig overlay that tolerates
>> missing symbols
>> build-asios-kernel.sh: automated clone to config to compile workflow
>> test-asios-config.sh: verifies .config flags post build
>> Initial perf on Ubuntu 24.04 HWE 6.11:
>> x86_64: mbw=3D7.3 GB/s, hackbench=3D53 ms, fio=3D1.6 GB/s
>> arm64: mbw=3D27.4 GB/s, hackbench=3D4.8 ms, fio=3D3.2 GB/s
>>
>> GitHub (scripts and tests): https://github.com/asi-os/asios-core/
>> Discord: https://discord.gg/rWuU7cWU4E
>>
>> Areas for review and test:
>> 1. Overlay logic: skipping versus failing on absent Kconfig symbols
>> 2. Build-matrix logic: host-only versus cross-build
>> 3. Test completeness: missing flags
>> 4. Scripting style and robustness
>>
>> Any pointers or suggestions are highly appreciated before we push to a
>> formal RFC series.
>>
>> =E2=80=94
>> Vikram R
>> Founder & CEO, KarLex AI, Inc.
>> https://asios.ai
>>
>>
>> On Sat, May 3, 2025 at 12:22=E2=80=AFPM Vikram R <vikram@karlexai.com> w=
rote:
>> >
>> > ASIOS is a new AI=E2=80=91native OS (Ubuntu 24.04 LTS base) bringing
>> > deterministic scheduling, NUMA=E2=80=91GPU optimizations, zero=E2=80=
=91copy I/O, and
>> > eBPF telemetry into the Linux kernel.
>> >
>> > Key directions=E2=80=94
>> > =E2=80=94 Deterministic CPU scheduling for reproducible AI runs
>> > =E2=80=94 NUMA=E2=80=91aware memory placement tuned for GPU DMA
>> > =E2=80=94 Zero=E2=80=91copy GPU I/O via GPUDirect RDMA/Storage
>> > =E2=80=94 eBPF=E2=80=91based telemetry hooks
>> >
>> > **Call for contributors:** scheduler/MM, GPU/accelerator integration,
>> > eBPF instrumentation.
>> >
>> > Project links=E2=80=94
>> > GitHub: <https://github.com/asi-os>
>> > Discord: <https://discord.gg/rWuU7cWU4E>
>> > Roadmap: <https://github.com/asi-os/asios-docs/blob/main/docs/ARCHITEC=
TURE.md>
>> >
>> > Please reply on=E2=80=91list with questions or join us on Discord to d=
ive into
>> > the design.
>> >
>> > Vikram Karlex R
>> > KarLex AI, Inc. | <https://asios.ai> | <https://karlex.ai>
>>
>
>
> --
> Yours truly
