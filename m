Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA7C28136B
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 14:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746628594; cv=none; b=ZKtnI0VmwCWv2SzZIbh6KpSKRZ5GewKgi308YUusrZwmoo0VC6PgfGMn/PXL3LsYlHCG3EKkM94IfdRdJxaDN8OZotFxqtJby3vUCRLNGUCT9UP6VNsJKoam/oATxgthiafjDQcOcSNmvwl0bLeUgfkKg3dt50ECGpuhDpn+vlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746628594; c=relaxed/simple;
	bh=fVlSFbG3u628EYseVWSf4N6fNlIkvPxjlWaKQ+obPNo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=ctY/zezNTm6PpOgdFiwj+JNGRom0Qkeyl3hcHkmHwOXUw4BGCzlMrpPO+byMghXThEbpEEYUkJLDB4A+bH8ToX3vqDpVDgVKTqYCMeDSzsm/QuJ4J5CFMbF0LI0AXPjBeKWMYiWBVP/WaLN3SHo6/JnsrwX0bSaBJBuOFKQTRnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=GGpJfSiD; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="GGpJfSiD"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a0b0d8090dso176081f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 07:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746628591; x=1747233391; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ziqHwwsRYBlnOytFFSvfeo7+WCPTNxHeZbIxMBlJdhs=;
        b=GGpJfSiDkF+av8Huk4dE9niZ99bCkYcYkCWrZbetJrdHyzZxjyLSN4DT6E1eJrTjAr
         EYvegDuqJtBtE/L2W+JIfJkA9r3eZPAi9OE4GsB0LdiUJapHnYU0drsD6Fh+/GwXrwJ6
         D+ZaDKxlf9vhbJApMTqwGQ7PeiUEtsBGaPd6DdHB0j8Z5HWPRqbYSQcJN1j2YV3yi/5l
         IXaIlKuL2qAas8IkLSfCuW0cHIH9KCIkD4AR90f0pA8O6p9rjIb9EoNjNVDsA5crd+54
         xgn7M30UZd0wsyQmLIKpb/Tm1VeLA20t0J8KyKrEBst1YeK86p7g4D80bTCn/eOltZkn
         ILEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628591; x=1747233391;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ziqHwwsRYBlnOytFFSvfeo7+WCPTNxHeZbIxMBlJdhs=;
        b=cHhHuSJLIHS/gGfHlCpWTD4Ig4ao8iIRkgGeU3W3EJpMZx0teoY7tVHVzS0cShB30B
         /XfcrCnmbZ1Z4ytVX1QcButmq/A3Qlxmly8lD+MR45OZyd6BdsEGf96KMPiBAf19oGJl
         JvJB1WS3RFsbxhWJWhzVoxaxFiyV8UVx81Y2PsWoq1yic0zZNp30mYTLiHeNdA6+BDvT
         LKhyM3ImGzgcGrexiNcm8ojflIjMInz0tMYN3SIJ5UWZ8QJ9GAZ1+p8DRKSVKVyDIrsY
         NqySysGFBqjAxFfcabZ4z6q4fDYemYM9XFKHSlEganAvvgmFkkFo19+aqPUkw7aPIK4E
         96Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUbrUUhw/xhbU6u93hSLm854SDapGwD15iKhYXz3xiYO7xmvONeGHFitfjfUi5QR++V+DU6wODgIunvPMU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvom6mMcSKtg1//tK08LzElIJy7bYjcOZdj5V7sSAlqRERhfEg
	jDWlMQgEKR8VpMkYjyX3Gf/HdNZyrJV/rY9pNLTiNcJQE5DKphbxGekUzUwqTLU=
X-Gm-Gg: ASbGnctCjIxS2Gy/P/hocXgEq90ARfUya+QNR1Pt9lZsn6E70tRvnl2tPH3jnnJBSL1
	98wdTNrlty44oM7j8ct4vTR18BxWbG16z48UQRR43VUYU9HGLmWQ3JXLytOlDtijSbx3ixQkdfU
	PPpolcVvjP9KWjGED6Aokyz9xOkdn+VaMMkHgIRpQV4qlSGvYu98d5zvc62UyMgpgY7nhyDmR8p
	v9IvVW/U4pvRuK2ZaxLicbT0ftjhJksPAMNgCsB0IplCrAkMJBPQZsMulaaYkStzkeOBTbNntKU
	yvfKLmspmEbRZRJtyUH8KxgmJoKDOHxLgTGBWhv4msDKvAeR
X-Google-Smtp-Source: AGHT+IEajZZzNeyoeib2XsmQjInc2KEWeUmYjGy4p5Qc/30lHXvX26EPvLDj1a/b0VLqz2Zq6F2iCA==
X-Received: by 2002:a5d:64e2:0:b0:3a0:7e53:b52d with SMTP id ffacd0b85a97d-3a0b4a69bdamr1109869f8f.15.1746628590982;
        Wed, 07 May 2025 07:36:30 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:f39f:9517:bfc5:cd5e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0efbfsm17536249f8f.69.2025.05.07.07.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:36:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 May 2025 16:36:30 +0200
Message-Id: <D9Q05T702L8Y.3UTLG7VXIFXOK@ventanamicro.com>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atish.patra@linux.dev>, "Anup Patel"
 <anup@brainfault.org>, "Atish Patra" <atishp@atishpatra.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Alexandre Ghiti" <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH 0/5] Enable hstateen bits lazily for the KVM RISC-V
 Guests
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com> <D9OYWFEXSA55.OUUXFPIGGBZV@ventanamicro.com> <bc0f1273-d596-47dd-bcc6-be9894157828@linux.dev>
In-Reply-To: <bc0f1273-d596-47dd-bcc6-be9894157828@linux.dev>

2025-05-06T11:24:41-07:00, Atish Patra <atish.patra@linux.dev>:
> On 5/6/25 2:24 AM, Radim Kr=C4=8Dm=C3=A1=C5=99 wrote:
>> 2025-05-05T14:39:25-07:00, Atish Patra <atishp@rivosinc.com>:
>>> This series adds support for enabling hstateen bits lazily at runtime
>>> instead of statically at bootime. The boot time enabling happens for
>>> all the guests if the required extensions are present in the host and/o=
r
>>> guest. That may not be necessary if the guest never exercise that
>>> feature. We can enable the hstateen bits that controls the access lazil=
y
>>> upon first access. This providers KVM more granular control of which
>>> feature is enabled in the guest at runtime.
>>>
>>> Currently, the following hstateen bits are supported to control the acc=
ess
>>> from VS mode.
>>>
>>> 1. BIT(58): IMSIC     : STOPEI and IMSIC guest interrupt file
>>> 2. BIT(59): AIA       : SIPH/SIEH/STOPI
>>> 3. BIT(60): AIA_ISEL  : Indirect csr access via siselect/sireg
>>> 4. BIT(62): HSENVCFG  : SENVCFG access
>>> 5. BIT(63): SSTATEEN0 : SSTATEEN0 access
>>>
>>> KVM already support trap/enabling of BIT(58) and BIT(60) in order
>>> to support sw version of the guest interrupt file.
>> I don't think KVM toggles the hstateen bits at runtime, because that
>> would mean there is a bug even in current KVM.
>
> This was a typo. I meant to say trap/emulate BIT(58) and BIT(60).
> This patch series is trying to enable the toggling of the hstateen bits=
=20
> upon first access.
>
> Sorry for the confusion.

No worries, it's my fault for misreading.
I got confused, because the code looked like generic lazy enablement,
while it's really only for the upper 32 bits and this series is not lazy
toggling any VS-mode visible bits.

>>>                                                     This series extends
>>> those to enable to correpsonding hstateen bits in PATCH1. The remaining
>>> patches adds lazy enabling support of the other bits.
>> The ISA has a peculiar design for hstateen/sstateen interaction:
>>
>>    For every bit in an hstateen CSR that is zero (whether read-only zero
>>    or set to zero), the same bit appears as read-only zero in sstateen
>>    when accessed in VS-mode.
>
> Correct.
>
>> This means we must clear bit 63 in hstateen and trap on sstateen
>> accesses if any of the sstateen bits are not supposed to be read-only 0
>> to the guest while the hypervisor wants to have them as 0.
>
> Currently, there are two bits in sstateen. FCSR and ZVT which are not=20
> used anywhere in opensbi/Linux/KVM stack.

True, I guess we can just make sure the current code can't by mistake
lazily enable any of the bottom 32 hstateen bits and handle the case
properly later.

> In case, we need to enable one of the bits in the future, does hypevisor=
=20
> need to trap every sstateen access ?

We need to trap sstateen accesses if the guest is supposed to be able to
control a bit in sstateen, but the hypervisor wants to lazily enable
that feature and sets 0 in hstateen until the first trap.

If hstateen is 1 for all features that the guest could control through
sstateen, we can and should just set the SE bit (63) to 1 as well.

> As per my understanding, it should be handled in the hardware and any=20
> write access to to those bits should be masked
> with hstateen bit value so that it matches. That's what we do in Qemu as=
=20
> well.

Right, hardware will do the job most of the time.  It's really only for
the lazy masking, beause if we don't trap the stateen accesses, they
would differ from what the guest should see.
