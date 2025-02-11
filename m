Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F091D250BFD
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739284596; cv=none; b=Y21efdbfkWNkeek+rgiTG8iGnq2UM3QCx1pE2YWjH/62XMz1GGDa9Bcz5GybiTw1+xjluTwSQT2LkXm1cfRPb+vFLb2xjtpiObmjwAaLAUH4pSPLcKJsOwqe8E2KmyqLwlupm/+p7+XiO7bttUQmKwo5AYkP0uO/YUkryDA2JYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739284596; c=relaxed/simple;
	bh=SKRdCG4ach6Wv6A5flpQ6DzYONw7h0shZmp7bUuXyfo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SWi/6sKWGs0CUc9SDnJLE36Z4xZ8ZHFTyNAa1bww+Hh7h+c0T4yImBDCBn0J0VH2cdERTo+w8P/PlKpNhfzdTK9r5iXr21kDGtEbwNaVITTTjdNu+Hn918YL/cg9501A+lG6QS01Ol03+hOKFHNjoQCOP9Qd6bQXbjtMMWAYurg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CLfy6gW8; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CLfy6gW8"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab744d5e567so1095891666b.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739284593; x=1739889393; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKRdCG4ach6Wv6A5flpQ6DzYONw7h0shZmp7bUuXyfo=;
        b=CLfy6gW8Se7aOmJVyP8L6OVG+mrOsNTaIih2RxrnoV90y0g7R+PdQJyTdBuXrzN9fJ
         NfLUu54Y86kg+96CSts3tu6jTReDpmWl9JfJZEmLmAShgraoJtxRavVEKhG6bqxv6eNQ
         dwIhlFnT8/ch1ss2uX9NVdEHCfahdYypfO2FPydxKnrDq9Ix4DQwukddVNTCG+u8AOMT
         DPhtrNEkgBzW1Zd1aMqHOd0v8Iky9OXOorgyqV3TYMU6sKbToD7MHKeN/4SFgA3oU3tu
         8BttDVgky04RBUE2XUc4K8bXLAqqHWcALgCeSdCckuZyeZ5ULCWy1bM1acwjHFEEFCgc
         1UqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739284593; x=1739889393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKRdCG4ach6Wv6A5flpQ6DzYONw7h0shZmp7bUuXyfo=;
        b=KFblgqDo5nZuERVE+KBhkO5GRyuQl46nEBM+4gdpq8uDvH9SNDaVcUrkF3MJ8UbcJs
         3xu6hC6FLr9iqUx+FvbouXOFB8KY2CuESTb+X8qP/WLYnMiYz5dQApcqhw3WdgNp7E4+
         K72I6T+8I+utfrY0tCxCcZZVfn3VHgRfVjs2xGbwW2rygOIy9JZLKzAXCidaJl+Guo7m
         uQ7Q0HTF+ftF8U41sFlEJO4VnsDucXtwvwtyxPiatsnihd3K+Lp36y7JcZbUZkjXUoKY
         nXoPcRNrdwOy3gcDLLxp21AoRQx7aHcrpd4eLI4NSN5sdAoZ4z+Q9TGsxmIpjkRxQcLq
         ui8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVI0sZGjSmGd9J3u113QwFSkmReYAItlQ4tiJeyx8PvH3IcC9StQzkNt8yi6nHPxcgJ0PmZfobXjbMhy8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcCnArx8/wMKpvqJ+qWl3fq5oJpxvVpUTT7jFmh/1NQOHh8MWA
	sgDK49cmjxmCog+75/qU40jFGSki021fcURNUto31ECGPcTsL6tuTxcG+AM/z/sPHvk0/3989KN
	UG2ITN+TUxxwnDIL+fX8c+Rgg21vp7Usg/+gL
X-Gm-Gg: ASbGncsofmv0IxWAHRL+NtVc/htexupUTUk7ItRD2jyT0XrsdJDmuYkdAz8xcDAX9Pq
	aNSmbP3YkkrLj4aoZH3dhdTg4tFKb9MU+pEEdazprWGc/vAm8pRIZyZXdrt+1xFZtW7buzqR0tr
	xGJ/QojMfHDxROfa8auNen7/cQ4+4=
X-Google-Smtp-Source: AGHT+IFJClLAtCiLwKN30WOw56WHlM6aMkU7ly7YgQm9v/KGLaw/V8bPeAWSdIriklQLx95CtlS9zZMKiJ2ZJyN/yzg=
X-Received: by 2002:a17:907:6d05:b0:ab2:f255:59f5 with SMTP id
 a640c23a62f3a-ab7daf84878mr331110766b.16.1739284593112; Tue, 11 Feb 2025
 06:36:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207181823.6378-1-james.morse@arm.com> <f600712d-d089-4285-8d04-e12f53a61572@intel.com>
In-Reply-To: <f600712d-d089-4285-8d04-e12f53a61572@intel.com>
From: Peter Newman <peternewman@google.com>
Date: Tue, 11 Feb 2025 15:36:21 +0100
X-Gm-Features: AWEUYZm9EhzAaUSl-BfhZJkgycuakloqQIHOZ4N7qJO1hkFmyETRgdlgkoqW538
Message-ID: <CALPaoCjY-3f2tWvBjuaQPfoPhxveWxxCxHqQMn4BEaeBXBa0bA@mail.gmail.com>
Subject: Re: [PATCH v6 00/42] x86/resctrl: Move the resctrl filesystem code to /fs/resctrl
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: James Morse <james.morse@arm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	H Peter Anvin <hpa@zytor.com>, Babu Moger <Babu.Moger@amd.com>, shameerali.kolothum.thodi@huawei.com, 
	D Scott Phillips OS <scott@os.amperecomputing.com>, carl@os.amperecomputing.com, 
	lcherian@marvell.com, bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com, 
	baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>, 
	Xin Hao <xhao@linux.alibaba.com>, dfustini@baylibre.com, amitsinght@marvell.com, 
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>, 
	Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Reinette,

On Mon, Feb 10, 2025 at 6:24=E2=80=AFPM Reinette Chatre
<reinette.chatre@intel.com> wrote:
>
> Hi James,
>
> I'd like to check in on what you said in [1]. It sounded as though you we=
re
> planning to look at the assignable counter work from an Arm/MPAM
> perspective but that work has since progressed (now at V11 [2]) without
> input from Arm/MPAM perspective. As I understand assignable counters may =
benefit
> MPAM and looking close to settled but it is difficult to gain confidence
> in an interface that may (may not?) be used for MPAM without any feedback
> from Arm/MPAM. I am trying to prevent future issues when/if MPAM needs to=
 use
> this new interface and find it confusing that there does not seem to be
> any input from MPAM side. What am I missing?

I've looked into monitor assignment on MPAM a little, so I'll share my find=
ings.

Like with ABMC/BMEC, MPAM's counters can be configured to monitor
reads, writes, or both, so there are situations where it would be
useful to be able to assign 2 counters to the same group to be able to
break down the bandwidth between reads and writes. However, a group's
two assignment slots are called "local" and "total", so if MPAM's
resources only support one of the two, then only one counter can be
assigned to a group.

MPAM does not support any filters that would differentiate between
traffic serviced by local or remote memory, so it's difficult to see
an MBM event other than "total" ever being used. Multiple MSCs
measuring memory bandwidth at an interconnect and a local memory
controller could potentially be used to together to infer the "local"
and "total" counts, but this would require the implementation to
understand the platform-specific relationship between different types
of MSCs and somehow present them as a single rdt_resource to resctrl.
As best as I can tell, the MPAM driver today will choose "local" or
"total"[1] for what it will present to the FS layer as an
rdt_resource.

Based on this, I would prefer the arch/fs refactoring changes go in
first to give us more time to think about how better to abstract
counter assignment on a non-RDTlike implementation. I believe finally
settling on an arch/fs separation for the currently-supported feature
set would make the counter assignment work clearer for everyone
involved. Also, my own users have been using an implementation like
this one successfully for over a year on ARM-based platforms while I'm
still just experimenting with the usage model of ABMC on AMD hardware,
so I consider the MPAM work to be more mature and would not like to
see it delayed on account of ABMC.

Thanks!
-Peter

[1] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/tree/dr=
ivers/platform/arm64/mpam/mpam_resctrl.c?h=3Dmpam/snapshot/v6.14-rc1#n824

>
> Reinette
>
> [1] https://lore.kernel.org/lkml/9479c799-86fc-4d9e-addb-66011ecae9c7@arm=
.com/
> [2] https://lore.kernel.org/lkml/cover.1737577229.git.babu.moger@amd.com/
>
