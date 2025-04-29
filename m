Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72900218ABA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745938893; cv=none; b=rrUnAmSQnSAm3NzIBxU8t5SyJnFwjeLcquR1ZYBUj3jSbwipv+0lT5SdpxUS8cG98uzvB4lUMoJqyTzUePkzEXrMbq27qbH3gjw7O/8WiyaSj/eSQOLHkbraZD+ebAT5/a35e6grfa6jt1Lp3HIoXXesN1m92EkfEgVFAJKY0y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745938893; c=relaxed/simple;
	bh=zBrKqhCfsBSldz6E7mX68CuqQb8grQqysBjP6gFyGPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YrRIRIo9Wt0Q6foTP6WlPFFKfsgx6aX158VeuprMNvk8YjBV742HMj7xtE4WkicAWAaVtKFvL8mii86ePzeDUp1WsFmrBIpWNm08oq5/U9oPMnkXyJxmeOzBsCB0CMF8uL7PE300esuTu8CnqW9LRHaG9WclpN2xfzlUelPuz6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=LavjyAeF; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="LavjyAeF"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3d5ebc2b725so20783765ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745938890; x=1746543690; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHS4l6RlCuYVQuHb0jm+ZP/YKZBOyNxDq6lKlO8yTMI=;
        b=LavjyAeFr4biUpsjvilexN/UxSilVlE0c8oWzEsfHYeu57mEiHV9aZ6nFizuFaMfN5
         Q7BRMiOgC2PpblG6NMmZpiDau+sMUHyjdp2VSU8kN7cIzTptdI1K5KC3F9hJH55Q2bCo
         hmT2OY7yJZEDKV73JMXugvrg4xL7vqOKPKK33GsZ1uIkl6s4n6r9D+lW0hV5fzsdRS8d
         69gTwX3pIY6BywvyDk0M/LH2BKWOBzOMdqGG5X0bVkDKyBdoWXFYKfjffN3SmDMnzaeK
         PW38iek2XzDdY0V2V4cY/cPjVsMJiNWBdJ+jISLcSKQoFxRhJteNF2QmYbgNWwHZScwi
         MU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745938890; x=1746543690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jHS4l6RlCuYVQuHb0jm+ZP/YKZBOyNxDq6lKlO8yTMI=;
        b=tB3M2+/Xrk9Vk1CFai3t0MpNHLZ6e+RugQQXL5heeid+UvB9OyKWdtuOrlovYoYr5I
         S+HNDMzb1zBOn7D+Vc7uSCz2sGDhwuB5iLXqf2aeIQUNXCYutDW/ZAjg8m+DqgIVLJ6n
         9PjEKA0Yp3N8iBR3ONxIXXDWPHCWbilE4i5tKqbgixqkvJzU0AnxoW2PuYx7WF2GqB+q
         ULpzzSs/7351RmA4w6hmq7b7z4hO9VT2tz20mfOfP3RzZQBggZ4bTdn1f808MwAILQY6
         fmgYPz6HtmIDwQVRTlNtYvaKhTS+YDrG2PryGkxXYZ18J12jEwnNKQEq9Txi2ch0eK26
         9d8g==
X-Forwarded-Encrypted: i=1; AJvYcCWsBEBKQ3TwvgB2DdvTYXXUi/D5r7zYLCaL/GEdK3VggAalGWkzkhJZnvzAnYzKBtqnUAbCsVBHEKLRSMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpYPmHWjAiqVXB+MEtFivTY0kgRxNJZFDn8bASr226+kMGEhZi
	aoaSg7tuzNaVI/lgotE064KqxPZlOaPMbJyYAXLNwe3Tb+2evWhGGmp1uJXiPt+/oomEj0xjS/2
	/n8d95xI7U+xGmr4fipufpMA9WSkGz/07DeLVow==
X-Gm-Gg: ASbGncsK8i5vLrBNKc4Lz486OV0gNM1MhF1UNV9xXrFEYOjhSoWFDLasmoGiDQ8hcmN
	kszBnNV2o9I7gY/rWIhw2ADuTKyDwyWevLfZ1c2x8pwzzme/P2IDLRuk/1BcLEzr479QbSXcJud
	LKDE66YEHZisHNCopdfwETNks+taNtICv/WQ==
X-Google-Smtp-Source: AGHT+IHo2DZ3uMBqZ8yg3qd4VMFlyLDgboisK6S9lgCMm7JZ5BVsaB07IAemCjbCQKxGLUvsVPdmwklxacR8zt864hQ=
X-Received: by 2002:a05:6e02:3a0d:b0:3d6:d162:be02 with SMTP id
 e9e14a558f8ab-3d95d311a8cmr40608305ab.21.1745938890305; Tue, 29 Apr 2025
 08:01:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-7-rkrcmar@ventanamicro.com> <CAAhSdy0e3HVN6pX-hcX2N+kpwsupsCf6BqrYq=bvtwtFOuEVhA@mail.gmail.com>
 <D9IGJR9DGFAM.1PVHVOOTVRFZW@ventanamicro.com> <CAK9=C2Woc5MtrJeqNtaVkMXWEsGeZPsmUgtFQET=OKLHLwRbPA@mail.gmail.com>
 <D9J1TBKYC8YH.1OPUI289U0O2C@ventanamicro.com>
In-Reply-To: <D9J1TBKYC8YH.1OPUI289U0O2C@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 29 Apr 2025 20:31:18 +0530
X-Gm-Features: ATxdqUHbWefMOrW2Do9QiC5PVMhlBHVdqKQcPmZPNhp77_UlZJlXnw3QOAdLvxI
Message-ID: <CAAhSdy01yBBfJwdTn90WeXFR85=1zTxuebFhi4CQJuOujVTHXg@mail.gmail.com>
Subject: Re: [PATCH 4/5] KVM: RISC-V: reset VCPU state when becoming runnable
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Anup Patel <apatel@ventanamicro.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Mayuresh Chitale <mchitale@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 3:55=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcma=
r@ventanamicro.com> wrote:
>
> 2025-04-29T11:25:35+05:30, Anup Patel <apatel@ventanamicro.com>:
> > On Mon, Apr 28, 2025 at 11:15=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <r=
krcmar@ventanamicro.com> wrote:
> >>
> >> 2025-04-28T17:52:25+05:30, Anup Patel <anup@brainfault.org>:
> >> > On Thu, Apr 3, 2025 at 5:02=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <=
rkrcmar@ventanamicro.com> wrote:
> >> >> For a cleaner solution, we should add interfaces to perform the KVM=
-SBI
> >> >> reset request on userspace demand.  I think it would also be much b=
etter
> >> >> if userspace was in control of the post-reset state.
> >> >
> >> > Apart from breaking KVM user-space, this patch is incorrect and
> >> > does not align with the:
> >> > 1) SBI spec
> >> > 2) OS boot protocol.
> >> >
> >> > The SBI spec only defines the entry state of certain CPU registers
> >> > (namely, PC, A0, and A1) when CPU enters S-mode:
> >> > 1) Upon SBI HSM start call from some other CPU
> >> > 2) Upon resuming from non-retentive SBI HSM suspend or
> >> >     SBI system suspend
> >> >
> >> > The S-mode entry state of the boot CPU is defined by the
> >> > OS boot protocol and not by the SBI spec. Due to this, reason
> >> > KVM RISC-V expects user-space to set up the S-mode entry
> >> > state of the boot CPU upon system reset.
> >>
> >> We can handle the initial state consistency in other patches.
> >> What needs addressing is a way to trigger the KVM reset from userspace=
,
> >> even if only to clear the internal KVM state.
> >>
> >> I think mp_state is currently the best signalization that KVM should
> >> reset, so I added it there.
> >>
> >> What would be your preferred interface for that?
> >>
> >
> > Instead of creating a new interface, I would prefer that VCPU
> > which initiates SBI System Reset should be resetted immediately
> > in-kernel space before forwarding the system reset request to
> > user space.
>
> The initiating VCPU might not be the boot VCPU.
> It would be safer to reset all of them.

I meant initiating VCPU and not the boot VCPU. Currently, the
non-initiating VCPUs are already resetted by VCPU requests
so nothing special needs to be done.

>
> You also previously mentioned that we need to preserve the pre-reset
> state for userspace, which I completely agree with and it is why the
> reset happens later.

Yes, that was only for debug purposes from user space. At the
moment, there is no one using this for debug purposes so we
can sacrifice that.

>
> >             This way we also force KVM user-space to explicitly
> > set the PC, A0, and A1 before running the VCPU again after
> > system reset.
>
> We also want to consider reset from emulation outside of KVM.
>
> There is a "simple" solution that covers everything (except speed) --
> the userspace can tear down the whole VM and re-create it.
> Do we want to do this instead and drop all resets from KVM?

I think we should keep the VCPU resets in KVM so that handling
of system reset handling in user space remains simple. The user
space can also re-create the VM upon system reset but that is
user space choice.

Regards,
Anup
