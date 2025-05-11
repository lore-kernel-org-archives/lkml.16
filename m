Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE62256C92
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 13:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746971031; cv=none; b=Ag4h1x3HShH4pWYC0+MKcXAkcCBgbEVfkn35LBjrzxK+/T6WDjguH4xQ94OwxElNARX77Hva4X7rzDuiGvwZgtgDt2M2bgX1m1frh8y8wIRq0iCWt93hkIWDrZXFZ0uKe9Z8uXP0nXBk6aSLZdX6cyyP1dh3Uz7V5NyE1li0+ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746971031; c=relaxed/simple;
	bh=FAXQEQiRSJBFkJYUsQBsiyj/bzB2dareIVDnQ2+JyzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p/cxnY351oXJo7RDuC0tUw7YDEVbgho6uWwNlb7hB8UWEk+o4GARXinrZkMtxGHOvlm64N+74bGdS2dM+A7qJhQ1nKUoG9f/vIYDLDbk6DCW7sFj9h21aMWaHpUqgl0RTDZwtd6jfHQncG9JTfT5CHJ/5emq6vQgvOfbIKkl4vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=tGNw0hPz; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="tGNw0hPz"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3d8fc9dbce4so16750865ab.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 06:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746971029; x=1747575829; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tikqvcPSSM0+ie8ei00WO4p/o6p01PdEuZ4eNfazi4=;
        b=tGNw0hPz9twQaPKDXrcehXDuK13xr9bKweC78DMS/FlZpWCHf1EGEXjAKA1XOBr8ci
         oIpMxhngXO51I7Yu8ikP2s7wZtPJVzBtNWY9sf6xu7OYc7z/8eGLDEQe61FST85HYFEx
         8E0t7D7idJZHzsoMEwAKSd+WAwwFDAcH/5/RkmJKza4Cl9STndLad6VuNONKWQZYiqcH
         cV2AC2H14akL3Huk7vEBnkT+Nv6sCQ+B3iQkZkYjiP1uBX9rmorMZyycUeofgpmI6WZY
         OeNELxsRlgTfGX8UGIAuINCpIpQxpXHSUxtmHjxAwMR6MUdILkTR+JZUympel+fqXbNQ
         M6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746971029; x=1747575829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7tikqvcPSSM0+ie8ei00WO4p/o6p01PdEuZ4eNfazi4=;
        b=IE2/avRKer7+Ilrw3FYIR5RST8K2w1prNddZsYwC45x8tnM+abAjntqlHY8AvHCsX1
         sOl1Y6Z15NteLIThvS9hQD7b+x29OZKXwlm9e6rIlh+r2r9rePG2VMbaN1xZynFbF6es
         0nune9pL2RLEW5ws9ymJ6L7xlWSWMxEBRElWJltcmx8/9nJVtnLmPpRcxZN1thqQ3b2W
         iKp1d2ShDvOztRd9oZ1o6EIxoKxwBwUQQ+e2xuR3/hqos55kBxq1uxtwibNQwaiwmUd5
         AwWRA+QxzzBglIk8nDcwUeqIew2gvn+FExhK7DDQL5/vECxwJNl7VvUT42B8GnPd9g7C
         sQRw==
X-Forwarded-Encrypted: i=1; AJvYcCV4MOesHb5EHB1JUB8itI88XD9+LCfeuAOWmhh3wRIcB/ETXE1nbRUQAwYY3mXPACJMOG2XWUYIS4iKRcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvtMqtCAwKgdeaI6a1kchfBbjH/NcfiPnmvPMxG9Kx5H0jd13m
	dk7OxsYo8Puy6hNAPurkCNUOAaDK5RBYVPtkGDubVu3+/WCQngrJUzCwB3gtjW+UlA9+4a5YZQi
	CUC5XH14U1yWoZujzJSYqDNiEUzkIY7Acyli6Dg==
X-Gm-Gg: ASbGncv2WrJ3L7FzwvAp+qss1PLlIqS+LAHHQFKsYy8LUhdgf1cH4ZHuxNB4o+rSdrH
	a5I6jmnirO5iE42+/xT8CUJLZ7z+xyMRoUwumtuxiLXcwlWu8v1edzNTvWWkMNPhM3XOLZ0k3A3
	Mw93iCM0mg1VPn3wd8vOZw6TM5tRP+ixHz
X-Google-Smtp-Source: AGHT+IGyy1tvQ5e1+LwmeN6aMxyvc+Kf3eAUBMdPUntGYmvmLxOM06L/3VzGSjkoX8RjJISKXUhUmqEwo7e719ksem0=
X-Received: by 2002:a05:6e02:1fc8:b0:3d0:26a5:b2c with SMTP id
 e9e14a558f8ab-3da7e34871amr88924955ab.8.1746971028558; Sun, 11 May 2025
 06:43:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508142842.1496099-2-rkrcmar@ventanamicro.com>
 <20250508142842.1496099-4-rkrcmar@ventanamicro.com> <CAAhSdy2nOBndtJ46yHbdjc2f0cNoPV3kjXth-q57cXt8jZA6bQ@mail.gmail.com>
 <D9RHYLQHCFP1.24E5305A5VDZH@ventanamicro.com> <CAAhSdy2U_LsoVm=4jdZQWdOkPkCH8c2bk6rsts8rY+ZGKwVuUg@mail.gmail.com>
 <20250509-0811f32c1643d3db0ad04f63@orel> <CAAhSdy389g=cvi81e7SKAi=2KTC2y9bd17aHniTUr4RNY=Kokg@mail.gmail.com>
 <D9ROL5UEYYHX.1B1FE6LZJ9ESO@ventanamicro.com>
In-Reply-To: <D9ROL5UEYYHX.1B1FE6LZJ9ESO@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 11 May 2025 19:13:37 +0530
X-Gm-Features: AX0GCFs_ezw8XJlOzMkddRA3UmJgoXKaRdAdTo6LGXAA1hZrT5A6WwM3ss5-FXk
Message-ID: <CAAhSdy3j0Uf52hs+_gRxkROTA4sjMkLk1sMtv=XZWsyv15TBSw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] RISC-V: KVM: add KVM_CAP_RISCV_MP_STATE_RESET
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 7:27=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar=
@ventanamicro.com> wrote:
>
> 2025-05-09T17:59:28+05:30, Anup Patel <anup@brainfault.org>:
> > On Fri, May 9, 2025 at 5:49=E2=80=AFPM Andrew Jones <ajones@ventanamicr=
o.com> wrote:
> >> On Fri, May 09, 2025 at 05:33:49PM +0530, Anup Patel wrote:
> >> > On Fri, May 9, 2025 at 2:16=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <=
rkrcmar@ventanamicro.com> wrote:
> >> > > 2025-05-09T12:25:24+05:30, Anup Patel <anup@brainfault.org>:
> >> > > > On Thu, May 8, 2025 at 8:01=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=
=99 <rkrcmar@ventanamicro.com> wrote:
> >> > > >>  * Preserve the userspace initialized VCPU state on sbi_hart_st=
art.
> >> > > >>  * Return to userspace on sbi_hart_stop.
> >> > > >
> >> > > > There is no userspace involvement required when a Guest VCPU
> >> > > > stops itself using SBI HSM stop() call so STRONG NO to this chan=
ge.
> >> > >
> >> > > Ok, I'll drop it from v3 -- it can be handled by future patches th=
at
> >> > > trap SBI calls to userspace.
> >> > >
> >> > > The lack of userspace involvement is the issue.  KVM doesn't know =
what
> >> > > the initial state should be.
> >> >
> >> > The SBI HSM virtualization does not need any KVM userspace
> >> > involvement.
> >> >
> >> > When a VCPU stops itself using SBI HSM stop(), the Guest itself
> >> > provides the entry address and argument when starting the VCPU
> >> > using SBI HSM start() without any KVM userspace involvement.
> >> >
> >> > In fact, even at Guest boot time all non-boot VCPUs are brought-up
> >> > using SBI HSM start() by the boot VCPU where the Guest itself
> >> > provides entry address and argument without any KVM userspace
> >> > involvement.
> >>
> >> HSM only specifies the state of a few registers and the ISA only a few
> >> more. All other registers have IMPDEF reset values. Zeros, like KVM
> >> selects, are a good choice and the best default, but if the VMM disagr=
ees,
> >> then it should be allowed to select what it likes, as the VMM/user is =
the
> >> policy maker and KVM is "just" the accelerator.
> >
> > Till now there are no such IMPDEF reset values expected. We will
> > cross that bridge when needed. Although, I doubt we will ever need it.
>
> The IMPDEF issue already exists.  KVM resets scounteren to 7, but
> userspace wants it to be different, likely 0.

The scounteren set to 7 is temporary workaround which is supposed
to be removed once Guest Linux initializes scounteren correctly at
boot time. At this point in time we can remove this scounteren
workaround from KVM because the SBI PMU driver is initializing
scounteren correctly since many kernel releases.
(Refer, pmu_sbi_starting_cpu() in drivers/perf/riscv_pmu_sbi.c)

If we absolutely need a mechanism for userspace to provide custom
reset values of CSRs then we should use the existing ONE_REG
interface to define a new type using which CSR reset values can be
set at VM creation time. But, I still think we don't need such a
mechanism immediatly.

Regards,
Anup
