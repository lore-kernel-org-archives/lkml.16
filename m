Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCA42BE7DF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745922339; cv=none; b=SrkvIu01/UpCIzg9HkPVjD0ussVamx9+Y9LDWshWnJn15IXMxxMGSwMQ6B9u5AjtIgpziivZptRff0/JomdeNoVROmPFwg3GTBSTMP2Hhxj3TepurSbJv/p58G1k0C+R29HrAsZejJ40lO7wp/6QpPcDCbB6ozOF4loPrgAJgrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745922339; c=relaxed/simple;
	bh=Sz4clg6K/zfuAweaf2ZHVfowXiOQZLM+vN+jJWsg3fI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=Zaeehtr6ijw47FjpHwdtjmyLowHCfvNjptFJY06/yeamAVCxPohAtJn1X9plCEbaoaeeSPNnfEEffnH7SieutcKQCDLpcWS2iNIXiBaN+cL3PQVNXJX7nDk8JkACdmFx6WZaEQyjbJW3fl94jTz8XR/qNSohUTuLkMpuS9d/6pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=BGEHGN5A; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="BGEHGN5A"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so3305315e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745922336; x=1746527136; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TusfjoOZJ9Q4uXowiWjYTIz+Nnd7Ky1WuLL0Fm5qU4=;
        b=BGEHGN5AjpGxWNAEud1yBjmadBdWxab9spx88F+Bkn0zjaeCG1EQ+SNxD0GkrFHnxP
         JzLWPYD7hulwGONnzuxB3My/ZBHhIQqPo8x+6uaVoO7ulw1dYmPii/By8GDDAEvDOh5t
         cALQvz/rSfBcgZsCbgsYznuDUK+cYpOd3p4vT4rDEF8z7UVRdIHbhRllmHq3uV9esyx7
         Pj2SoehES7CXivisNcMb9p1ZBWMDC5NfgIdtV9fZJatq0OUnpfjYoD/Hi+GYnk9SuYvI
         SWZPotKEfrtb+jFUKq7n15JgM3bYTYITokSTEmZRc4s148E+aoVjcZw74Vw33e0BqLcd
         gH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745922336; x=1746527136;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1TusfjoOZJ9Q4uXowiWjYTIz+Nnd7Ky1WuLL0Fm5qU4=;
        b=qoDvp8GhVfuVEIRyLNnJ7icLy2/mXiPeZp7lwOwkFkCxiqAWYvK5j/p6Cg1+TJoZfT
         itia4KOUUHBrSr7IqeQaZkj+v8mMaQMZYmLM36Y0EV2fPRNx+V7hhpWxR0li77HmsnJq
         DI2QPtolJjC8zDoYdvPaOB3SvZRv3IzzCUkXR2rCNBtD7240zjaFfhRdz0kvpUzTaNzt
         60J/FRQQzJ3qi++tiqPHMT5cKITBboJ6tS4gYI+UCuxZmUnKNQ2T/E4XGBKiyI/Hp6Fu
         2L4zLaFFsY6XS+qTZKcQ8xWm5Ws0BkT74AEyrwce/i2wQ3EOW/JrCOrlUBg5vuEUNymf
         HV9g==
X-Forwarded-Encrypted: i=1; AJvYcCUwQfphQ/3PNkhq09ds8EVM/htZPs5Sa9j3eXAQqKw3rIiQG9P+NPJfzw+9TmX1ar7andZ/TYYC8XgbhbE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw35AMNS3gZ+I4YMlDeALgKedMPATAIpNlkZlTTQfjmHRvXwWbc
	rQAJjwBSBUoOKLcRde5GRdmptxXjL+kigjWmOj8KaEvFy+FtNaiq9hqYL/oG502mg1SKOlXdqFx
	T5L8=
X-Gm-Gg: ASbGncvxylr/ZFc95bJoCXxpg1JOH/eb5VG4EqB+ttd8BjV8i8oPIJ61rCjYPn+L8Sk
	J4j7Sz/8G0jcfS7qqThUGKk+RRYrQoZJCsQskkqQtRD6F1Z7SpkPhFrG3H3cPiRtzhFcrNr7/fh
	AhkfFHKdnz6a+SsINV+UsCqcq0Yax+tpdGNBOUzWl1mOLbmH4+jM6QqxeUVP9zkn5ZvXwljLOvR
	Rv3c1SlC0FavAYWvoWAkSR4pA2EHlkvhOdPriQh8gNtzkRSO8N7/MJf4nKQlTK6swqfDR/WAuFZ
	b8FDmFXjLiqcDRxfvg1mQfQf0nW5iD+cy+gt89fps6FeXj57
X-Google-Smtp-Source: AGHT+IFSvfqpgAXd79kfkhiAw4afJN5Oi0WwlrlH7IsWV6fC8ECQn6pF0EjB3PiabWQYmavQwiPMEQ==
X-Received: by 2002:a05:600c:3c86:b0:43d:745a:5a49 with SMTP id 5b1f17b1804b1-441ac890c15mr8097375e9.4.1745922335484;
        Tue, 29 Apr 2025 03:25:35 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b996:f7e3:35e8:5091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5369cdasm154999805e9.31.2025.04.29.03.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 03:25:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 12:25:33 +0200
Message-Id: <D9J1TBKYC8YH.1OPUI289U0O2C@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH 4/5] KVM: RISC-V: reset VCPU state when becoming
 runnable
Cc: "Anup Patel" <anup@brainfault.org>, <kvm-riscv@lists.infradead.org>,
 <kvm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Atish Patra" <atishp@atishpatra.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Andrew Jones" <ajones@ventanamicro.com>, "Mayuresh
 Chitale" <mchitale@ventanamicro.com>
To: "Anup Patel" <apatel@ventanamicro.com>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-7-rkrcmar@ventanamicro.com>
 <CAAhSdy0e3HVN6pX-hcX2N+kpwsupsCf6BqrYq=bvtwtFOuEVhA@mail.gmail.com>
 <D9IGJR9DGFAM.1PVHVOOTVRFZW@ventanamicro.com>
 <CAK9=C2Woc5MtrJeqNtaVkMXWEsGeZPsmUgtFQET=OKLHLwRbPA@mail.gmail.com>
In-Reply-To: <CAK9=C2Woc5MtrJeqNtaVkMXWEsGeZPsmUgtFQET=OKLHLwRbPA@mail.gmail.com>

2025-04-29T11:25:35+05:30, Anup Patel <apatel@ventanamicro.com>:
> On Mon, Apr 28, 2025 at 11:15=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkr=
cmar@ventanamicro.com> wrote:
>>
>> 2025-04-28T17:52:25+05:30, Anup Patel <anup@brainfault.org>:
>> > On Thu, Apr 3, 2025 at 5:02=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rk=
rcmar@ventanamicro.com> wrote:
>> >> For a cleaner solution, we should add interfaces to perform the KVM-S=
BI
>> >> reset request on userspace demand.  I think it would also be much bet=
ter
>> >> if userspace was in control of the post-reset state.
>> >
>> > Apart from breaking KVM user-space, this patch is incorrect and
>> > does not align with the:
>> > 1) SBI spec
>> > 2) OS boot protocol.
>> >
>> > The SBI spec only defines the entry state of certain CPU registers
>> > (namely, PC, A0, and A1) when CPU enters S-mode:
>> > 1) Upon SBI HSM start call from some other CPU
>> > 2) Upon resuming from non-retentive SBI HSM suspend or
>> >     SBI system suspend
>> >
>> > The S-mode entry state of the boot CPU is defined by the
>> > OS boot protocol and not by the SBI spec. Due to this, reason
>> > KVM RISC-V expects user-space to set up the S-mode entry
>> > state of the boot CPU upon system reset.
>>
>> We can handle the initial state consistency in other patches.
>> What needs addressing is a way to trigger the KVM reset from userspace,
>> even if only to clear the internal KVM state.
>>
>> I think mp_state is currently the best signalization that KVM should
>> reset, so I added it there.
>>
>> What would be your preferred interface for that?
>>
>
> Instead of creating a new interface, I would prefer that VCPU
> which initiates SBI System Reset should be resetted immediately
> in-kernel space before forwarding the system reset request to
> user space.

The initiating VCPU might not be the boot VCPU.
It would be safer to reset all of them.

You also previously mentioned that we need to preserve the pre-reset
state for userspace, which I completely agree with and it is why the
reset happens later.

>             This way we also force KVM user-space to explicitly
> set the PC, A0, and A1 before running the VCPU again after
> system reset.

We also want to consider reset from emulation outside of KVM.

There is a "simple" solution that covers everything (except speed) --
the userspace can tear down the whole VM and re-create it.
Do we want to do this instead and drop all resets from KVM?
