Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7CD19E967
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 06:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746255183; cv=none; b=F/VR8A61X2+CqpQgc4RV0driEEJBM3hHE5RU782IYHFQmMOag6dQeEkedLBgXn6T0gCHlTvNN3wmI3MC5Jih9uEXgP6WdcUXYVbSQ6hp0LVrg9rko6H3hTpIo39gqTmktpaZgx3heRpyTBoo+QeBwNn/rZOeW0dd18jLUccEijw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746255183; c=relaxed/simple;
	bh=l0AzVZ2FROvsUB1Hp9YrG/3G5OrEjJQyEi8OEhMviXE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ltLpB6pJ4n4m0mwxFL+v1wmrf5oxuw/6ajyWLt2q/8y3meq6tc+hSkajV4JdywQP21PW6GSQD66t/XZtQrmQb3bugGaHRf0jRK0yfP+uCvekmBicIsShAoLF/TBXnQaVsN89LsHoWG6+hqBv6BGY/YRJC6ckMfUDctATQJgjpbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=karlexai.com; spf=pass smtp.mailfrom=karlexai.com; dkim=pass (2048-bit key) header.d=karlexai.com header.i=@karlexai.com header.b=P50AwPWi; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=karlexai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=karlexai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=karlexai.com header.i=@karlexai.com header.b="P50AwPWi"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-acb2faa9f55so349088266b.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 23:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=karlexai.com; s=google; t=1746255180; x=1746859980; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l0AzVZ2FROvsUB1Hp9YrG/3G5OrEjJQyEi8OEhMviXE=;
        b=P50AwPWiz2fOVW5BmUCBKT11Cs3esT8GBwbeD0ps3snR8nBOWagKnYIWkZoLSl0QuI
         1IJ8qv9gGqK799vakhCutpg9nr/l0UiT+NoiK9ReKcLs8tHqLJ/32ypzJLQisrdJ6BSi
         zk0ew5JN7ijf8FUnkTmjQRoE+JZfa4fjmhf6hUzstXzsnOhyLYO4nof+GFUF4FXb1u2y
         NSHXg1fAnzyAQSWsP9obCc/BSIBj4xSIlAz61tm5wRQvh/pyOwE57LCyGsw6uPI18gq3
         7VcbvdUG5BxDsgcHOaD0f5vujbfiu/OsuVnitUPzRvrSDVz+qyYyU+suEwPC8lNURzxW
         kSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746255180; x=1746859980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0AzVZ2FROvsUB1Hp9YrG/3G5OrEjJQyEi8OEhMviXE=;
        b=w29+mycaFMs+ZAYIBHSBTs6KHZXLncAcKZLhyWliS6aeSUcay9z0PCfYcG86SzDnr8
         AbxEUQfct3HrLhN4VB9Nl5COSmGC+Ac01SF31V8Ni7Zz1otn6GHRscZ66Vj/X2OQzgg+
         NESSH2F3dQH9Sa5I9nTtSTaoIrLywk4DszaTpJwjvwDlBh8IRvuXzhnte2sLxhv608SZ
         LFKktDjQubjsoQzklPJ5DmJm23h/6WyDup6mygQGwSaBoGYpfW8rGE2DAYHIVXUnxjEY
         EZ4DlnYRO03ai+vVrI28kbuyjpQZ1bsj8zB3Fzk0gl7JQHtd+a9c9zrZWwLZl77fyWWe
         Tn/g==
X-Gm-Message-State: AOJu0YyQ0pkAb2zAvLHGYXsXfEAtPuXZ9TbxkevZ6NMy4i5iliw7kWxg
	0iPNTW/z23dbPWtYZYYD7z6YYLL3orjciAfMb3IRzkut2Jv9sLaIrB4zXTgkOEvC8RxBcFd+70H
	tMpvae+kWCsORM/gtG+7yXnKLx9g50HY5ZRijU9KzLA7lGSIJkVuarg==
X-Gm-Gg: ASbGncvZAGeBAeM2pb3/8aWusLpJhzC4QQPJ4dITxyh0XEEKxutUnA9pRh/xjGtPVM1
	k15EgVqi1jm+rE5swGvF5m2KzItOrnB5OaV8nITOP4HtavGGFXASQXuN7+xWtI4S4YB3hU5cu8a
	/jzoVVDcT2KL8JHitWW0fWHVPwJKnOUlmcthuY25QD8WbT8fDqAW8YGb4=
X-Google-Smtp-Source: AGHT+IGeoGRVT5n5ddquTmrFAKQX5XJ0EhdoA+jv93EV2Eu8bp2WsuI2pTW5KYNMuLaToR5c4uxNkLH8PzBAEu4sTqo=
X-Received: by 2002:a17:907:2d07:b0:acb:5f9a:7303 with SMTP id
 a640c23a62f3a-ad1a4a0a0d5mr6582366b.35.1746255179773; Fri, 02 May 2025
 23:52:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Vikram R <vikram@karlexai.com>
Date: Sat, 3 May 2025 12:22:48 +0530
X-Gm-Features: ATxdqUFeR6lU_RnEVAJro_FfmXkXVu0v2jvifaAHY4ZgAQ5wvxxPOXFed4Wd7s0
Message-ID: <CAELLoAjVdYkmZR15e4TTzy21PxGBu=rbFp31uwMULcFvZx4V4Q@mail.gmail.com>
Subject: =?UTF-8?Q?=5BANNOUNCE=5D_Call_for_Contributors=3A_ASIOS_=E2=80=93_AI=E2=80=91Nat?=
	=?UTF-8?Q?ive_OS_=28Kernel_Work=29?=
To: linux-kernel@vger.kernel.org
Cc: linux-newbie@vger.kernel.org, kernelnewbies@kernelnewbies.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ASIOS is a new AI=E2=80=91native OS (Ubuntu 24.04 LTS base) bringing
deterministic scheduling, NUMA=E2=80=91GPU optimizations, zero=E2=80=91copy=
 I/O, and
eBPF telemetry into the Linux kernel.

Key directions=E2=80=94
=E2=80=94 Deterministic CPU scheduling for reproducible AI runs
=E2=80=94 NUMA=E2=80=91aware memory placement tuned for GPU DMA
=E2=80=94 Zero=E2=80=91copy GPU I/O via GPUDirect RDMA/Storage
=E2=80=94 eBPF=E2=80=91based telemetry hooks

**Call for contributors:** scheduler/MM, GPU/accelerator integration,
eBPF instrumentation.

Project links=E2=80=94
GitHub: <https://github.com/asi-os>
Discord: <https://discord.gg/rWuU7cWU4E>
Roadmap: <https://github.com/asi-os/asios-docs/blob/main/docs/ARCHITECTURE.=
md>

Please reply on=E2=80=91list with questions or join us on Discord to dive i=
nto
the design.

Vikram Karlex R
KarLex AI, Inc. | <https://asios.ai> | <https://karlex.ai>
