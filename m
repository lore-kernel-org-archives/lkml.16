Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760F32116F0
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 19:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747682857; cv=none; b=AOklqKzmuliGi4ODTdDMMi8aG4NVMCfjJPc7h+Sbs4rhOCWe8Q6EK6C9EucgG8tZk98GsLNoHvUYbO+Riv0Hfrmfmo64OVfkAqJNko0iRWliC05JFxyRy+rjVnMpTk1gg0QZdli59J47/Ru/O/TAwZpgvwJXWfdI745UoazaeyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747682857; c=relaxed/simple;
	bh=OEXzDXo6H4vTtWDq+uXC6uOmRK3eW5wxofAl6/Ho7Rg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=od+KYcdOat53C8Uyazj6hL46GSXFgbuZ1mrvWESMBW6l0vtCSARJnwATzqvLsiopLV0FlzVa8BdBWJJ1Ss9Qio7g5Prz10U/AFsDBEd05bavcwfALMSGq0of4SBD++hWMSS/ZXlZm0M3ZizTTMNHEZ6zzu5J1utlt+6SO2QMqa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=karlexai.com; spf=pass smtp.mailfrom=karlexai.com; dkim=pass (2048-bit key) header.d=karlexai.com header.i=@karlexai.com header.b=RtpWL6wE; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=karlexai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=karlexai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=karlexai.com header.i=@karlexai.com header.b="RtpWL6wE"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6016d401501so5369478a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=karlexai.com; s=google; t=1747682853; x=1748287653; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OEXzDXo6H4vTtWDq+uXC6uOmRK3eW5wxofAl6/Ho7Rg=;
        b=RtpWL6wEBkPAkaFLHYSzkwv9CkgcfqT8tQuGdV3IgLWFLyab0FnsCSsyfmBEYKG6WE
         ji56UhTXziUdKiyDtrM9aypbXXO1bgUudSTSe/GMtUIwKrRi8W4xPTtstG7f7czyGAuZ
         TCehGMoun9d9HsVAEabBQPe4XFDVyCmRt5rCSjD4Ws3zXCg6AKQIodTePE6p80MvMSr2
         1zzfp4ZTqpiH3UdVEXAxuuwqrVhQHZGGsrLko0Id5XAalUTcM4srsWYA7VDIsScHiQ8i
         GN2PjNyIiAIO4LzvElMkZK40TsED9qMYhH/tzirYpgQzA2ms+vJdoXFhJCrMiRPgfZZq
         AFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747682853; x=1748287653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OEXzDXo6H4vTtWDq+uXC6uOmRK3eW5wxofAl6/Ho7Rg=;
        b=UWA4ub1/aKIfJJuvlU/kU8xt2UHh4kFiFs63wZ9U7SBQ4OVeJM6neUO/tmYtxvfWEQ
         sdR4xPlme8cKSiVwbjdkn7Qml4AxBUqSHmT3+bkivEKOGKceMWZ4z5ykxrzTnkklra2b
         iREv9h7+FusVXcEhYuUvS0upv63AA4jxWcCrNWskU7HFvc2wsydMdz9iWEWeBUHlVuf5
         hqPnksonZdLIkfufVqON9/1QZZ9YVDR/jKF9waBe40vaMOKzJcwliNlROoKVGLZOVxbb
         t8kFfeUXUrAKV8H2xcW1nLvtjc1aejbgjtUHCg06DKd+PbN0SR3Z4x6B1hPPK/EY3qmN
         oRAw==
X-Gm-Message-State: AOJu0Yz1AR+lbA2Gv8ooxlKy6Axyq4zhFUhbYiOvWhAObfQ/JOr3NRTA
	AUY5qpQA8A/vYQGj/hkFaxSD3hXM3YnnmHOOQsxLDbB3/NboNA9/69jxpAVuG2T1kNFgWkEsRqJ
	PeJt8TvTaaPYwTPquAWRjZxIiyHsMIzdENj4l10Az8E1FvH78pi72msU=
X-Gm-Gg: ASbGncvrCkgY9OQyWCu7cV9ZLPujr3GdfhWpytGSnAUH73eKxj4NJBOHK9nYWJ3n/hQ
	z0ummRzV9oF8rXxEzzeLIALxYBnqEgRbgd6jK6+PqVD512XidoKu216SMu/1dkJAQK1DvjWWTUA
	Mmk0T1u/cF6k2cachw2lVYG/DoYhbZDBCpPJBgTSHDInz/yb6IsuF9nZysBfTWnUup60w=
X-Google-Smtp-Source: AGHT+IFKSrTFPi9H4xxU9df8uMr0nv/PBlYh6IIyywsbi6BDMHIZxmmho21Xbhhgk84UJl12imenaU+XZtAHXAKVl3A=
X-Received: by 2002:a05:6402:2804:b0:5f4:d60f:93f0 with SMTP id
 4fb4d7f45d1cf-60090114a38mr11653006a12.31.1747682852771; Mon, 19 May 2025
 12:27:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAELLoAjVdYkmZR15e4TTzy21PxGBu=rbFp31uwMULcFvZx4V4Q@mail.gmail.com>
In-Reply-To: <CAELLoAjVdYkmZR15e4TTzy21PxGBu=rbFp31uwMULcFvZx4V4Q@mail.gmail.com>
From: Vikram R <vikram@karlexai.com>
Date: Tue, 20 May 2025 00:57:21 +0530
X-Gm-Features: AX0GCFvgkNA2aHvbK4lDATIpy1IcksB1qFLM-BgpX2lT1tQ1sooFBhXpsso3grM
Message-ID: <CAELLoAhC3emyLF26DNNb0m-D+eUJ2z9=G6r1Px+oYwOztzvZ=g@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BANNOUNCE=5D_Call_for_Contributors=3A_ASIOS_=E2=80=93_AI?=
	=?UTF-8?Q?=E2=80=91Native_OS_=28Kernel_Work=29?=
To: linux-kernel@vger.kernel.org
Cc: linux-newbie@vger.kernel.org, kernelnewbies@kernelnewbies.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ASIOS =E2=80=93 Envisioned to Host and Sustain Cognition & Synthetic Intell=
igence
The world=E2=80=99s first AI-native operating system.

ASIOS is a new class of OS built on Ubuntu 24.04 LTS, designed from
first principles for AI workloads. We=E2=80=99re creating the foundational
infrastructure layer to support ever-more sophisticated
intelligence=E2=80=94from today=E2=80=99s deep-learning models to tomorrow=
=E2=80=99s advanced
cognitive and quantum-ready AI.

Building on our May 3 thread, we=E2=80=99ve landed a resilient config-overl=
ay
and build script for ASIOS on both x86_64 and aarch64. Key artifacts:

asios-config-overlay.sh: idempotent Kconfig overlay that tolerates
missing symbols
build-asios-kernel.sh: automated clone to config to compile workflow
test-asios-config.sh: verifies .config flags post build
Initial perf on Ubuntu 24.04 HWE 6.11:
x86_64: mbw=3D7.3 GB/s, hackbench=3D53 ms, fio=3D1.6 GB/s
arm64: mbw=3D27.4 GB/s, hackbench=3D4.8 ms, fio=3D3.2 GB/s

GitHub (scripts and tests): https://github.com/asi-os/asios-core/
Discord: https://discord.gg/rWuU7cWU4E

Areas for review and test:
1. Overlay logic: skipping versus failing on absent Kconfig symbols
2. Build-matrix logic: host-only versus cross-build
3. Test completeness: missing flags
4. Scripting style and robustness

Any pointers or suggestions are highly appreciated before we push to a
formal RFC series.

=E2=80=94
Vikram R
Founder & CEO, KarLex AI, Inc.
https://asios.ai


On Sat, May 3, 2025 at 12:22=E2=80=AFPM Vikram R <vikram@karlexai.com> wrot=
e:
>
> ASIOS is a new AI=E2=80=91native OS (Ubuntu 24.04 LTS base) bringing
> deterministic scheduling, NUMA=E2=80=91GPU optimizations, zero=E2=80=91co=
py I/O, and
> eBPF telemetry into the Linux kernel.
>
> Key directions=E2=80=94
> =E2=80=94 Deterministic CPU scheduling for reproducible AI runs
> =E2=80=94 NUMA=E2=80=91aware memory placement tuned for GPU DMA
> =E2=80=94 Zero=E2=80=91copy GPU I/O via GPUDirect RDMA/Storage
> =E2=80=94 eBPF=E2=80=91based telemetry hooks
>
> **Call for contributors:** scheduler/MM, GPU/accelerator integration,
> eBPF instrumentation.
>
> Project links=E2=80=94
> GitHub: <https://github.com/asi-os>
> Discord: <https://discord.gg/rWuU7cWU4E>
> Roadmap: <https://github.com/asi-os/asios-docs/blob/main/docs/ARCHITECTUR=
E.md>
>
> Please reply on=E2=80=91list with questions or join us on Discord to dive=
 into
> the design.
>
> Vikram Karlex R
> KarLex AI, Inc. | <https://asios.ai> | <https://karlex.ai>
