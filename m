Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533B7225791
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747992025; cv=none; b=ecKuLbkrNFZnT98KrLLv9d8woBC37RtvCgLDtrE52D3T85z2BeJ8RVU4mBVXGHkOsw59tFuLtCP20pxAA+/49HqxboCHLw3QzCcXSNOcDFq/9LltKl5Aq2kIQvaDlzvAo6hRNoykoNx05agBtxw6blc21KPoe0uiTqyyLD7GPGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747992025; c=relaxed/simple;
	bh=H6jCMhovcKvXnJaFVFncaQ9ZSSarjarBVGBLD/TKfc0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=uJAVoP3pGn6DT7UINZiggAZ1VpIEO4BINGA8M0ewbmp7UsbtEVfjMVmCN8ESJQ25FqGMbDdRkoQHe5SF090d6HfSfp72Bn3QBU4KI47IxBMOjekPyxYkaLSCJDaLPDnZUa1/qfxca9hvMpCyVIemt7XeMw3OS53QCHQu5E6Bzm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Vy4Hcxtr; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Vy4Hcxtr"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4c2e42ce0so55713f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 02:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747992021; x=1748596821; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpJiR9jmmCdIglXVSKgEoS5Pv74wpHne5sRyii9bqBU=;
        b=Vy4Hcxtrp8hQ2cNP7NAW9PdfyqoK9R/tauaN3UB2Qru69KzJ90JmOD0fsw9A4kZPxc
         y74HJ7cxIUBsBXIbPinFV930kJuc0vIz6boQYQpyY9h0OHBMd0qNl5N0GUKcPf+329MZ
         DB4jtvAj7BE0CBHl0vLMm0agDyEt89Y11l7uSKaS23/ceoA2wymvO0PTistrghgxIps1
         fGDMyeMVBwMtKATHpnjfouWX0HYi1t6B0eaKLtAevXcLNsF3GwO0sQw6pEl8aVpPLYV6
         zed7h+WQNKJ0pCrFdLhqs8lWRjcUUJGQHIz9wJc5xImRpaQusBHyLab72O2liSdIdXo2
         D6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747992021; x=1748596821;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KpJiR9jmmCdIglXVSKgEoS5Pv74wpHne5sRyii9bqBU=;
        b=ErdMmMKfxaLAovdVo/CNW6QRy65+M58HrxAkB2RBv+hj3f5DBh3rlHoBVrT4Crfso2
         V7qavo2Xc8yWwzCQfd28rcX4QXaPjD7lkCopaZKQFa8jCxf7VztabbnuGV7mUGbKdPYR
         yEknI/yjg7D/eP3xb+Y6MAahJ111MvvF5wNRm3wAhFlB0vXa5/LwsWKSuK+rq2OaBrhR
         Fxpzm/t8JiCs4s1kc/kMSZ20IRe8Fpy1+CGJANNrcQ0es3d1pHxJT0ZCA/KXfYTJg7jQ
         mfwmdPa/7Btv2TZ214uX7RliHCyUmutfhN0GJ5PJZHgQlLLzHQK1FeOSeyjdzWour8kc
         qmyw==
X-Forwarded-Encrypted: i=1; AJvYcCUihPtUt/Nt1UzZ7pfkOu3Vo8P4lBxM9ux0iyBZrmG9lg5As50tBXkX0nuSAgMKM8alrLRzXfZdPMv2s7U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5PI/q7OBah8e0lkWcsc4pogbcjW+Q2z1lDG0N/tUFXd2msLeJ
	jXO9bg8E6NtHv3TFDkEYThfsEsfQl7Ml6czbe5DtfViC9KY/9EK1GIItFXB6dm47I18=
X-Gm-Gg: ASbGncsD7LkRRKtQdO/ps4GpQsQ1/y/qC+gk35GKZUhskbWyVADSvKfUeAETHWVhGjW
	JgVP3rHptwQRSTDtdbllyKwgX/sQTZdp2qNoxctZ/d0C2pXvq5yi84QTDbku8n6ABcmy/Wq+Yso
	lhH8d1qWzdktHjefz1lZ5di2n0KlRAevccXp6BUlrboBaqeuXgX1fJnwVQ2DQInF/aUOyH3GmfM
	ymYIWzOy0vhVxCTtQ/RYxlGUSsqd9gftKfWWZSnK+7dv2FzEqWS3YwNe9R3K2331wdKR1OOvh34
	xypNTLKYpZWdhWSl6VC1TmB7clGl8DMsEtGRz31TpZNEE63h13yDL4fkdhC/4mJcEysnpw==
X-Google-Smtp-Source: AGHT+IEMU9a6aZGz+kLhPKpDgsPP465aof0p3jZZCP5dmiHATC63+CKThZDo4xy3NUbvdUIjkoiEdw==
X-Received: by 2002:a05:600c:4f8e:b0:439:a1c7:7b3a with SMTP id 5b1f17b1804b1-442fd60ee47mr80699975e9.1.1747992021455;
        Fri, 23 May 2025 02:20:21 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:be84:d9ad:e5e6:f60b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef0aadsm132780315e9.12.2025.05.23.02.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 02:20:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 May 2025 11:20:20 +0200
Message-Id: <DA3FGGI5PEZG.3T26KJXT2QO8M@ventanamicro.com>
Cc: "Atish Patra" <atish.patra@linux.dev>, <kvm-riscv@lists.infradead.org>,
 <kvm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Anup Patel" <anup@brainfault.org>, "Atish
 Patra" <atishp@atishpatra.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Andrew Jones" <ajones@ventanamicro.com>
To: "Anup Patel" <apatel@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v3 0/2] RISC-V: KVM: VCPU reset fixes
References: <20250515143723.2450630-4-rkrcmar@ventanamicro.com>
 <1a7a81fd-cf15-4b54-a805-32d66ced4517@linux.dev>
 <DA3CUGMQXZNW.2BF5WWE4ANFS0@ventanamicro.com>
 <CAK9=C2Xi3=9JL5f=0as2nEYKuRVTtJoL6Vdt_y2E06ta6G_07A@mail.gmail.com>
In-Reply-To: <CAK9=C2Xi3=9JL5f=0as2nEYKuRVTtJoL6Vdt_y2E06ta6G_07A@mail.gmail.com>

2025-05-23T13:38:26+05:30, Anup Patel <apatel@ventanamicro.com>:
> On Fri, May 23, 2025 at 12:47=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkr=
cmar@ventanamicro.com> wrote:
>>
>> 2025-05-22T14:43:40-07:00, Atish Patra <atish.patra@linux.dev>:
>> > On 5/15/25 7:37 AM, Radim Kr=C3=84m=C3=83=C2=A1=C3=85 wrote:
>> >> Hello,
>> >>
>> >> the design still requires a discussion.
>> >>
>> >> [v3 1/2] removes most of the additional changes that the KVM capabili=
ty
>> >> was doing in v2.  [v3 2/2] is new and previews a general solution to =
the
>> >> lack of userspace control over KVM SBI.
>> >>
>> >
>> > I am still missing the motivation behind it. If the motivation is SBI
>> > HSM suspend, the PATCH2 doesn't achieve that as it forwards every call
>> > to the user space. Why do you want to control hsm start/stop from the
>> > user space ?
>>
>> HSM needs fixing, because KVM doesn't know what the state after
>> sbi_hart_start should be.
>> For example, we had a discussion about scounteren and regardless of what
>> default we choose in KVM, the userspace might want a different value.
>> I don't think that HSM start/stop is a hot path, so trapping to
>> userspace seems better than adding more kernel code.
>
> There are no implementation specific S-mode CSR reset values
> required at the moment.

Jessica mentioned that BSD requires scounteren to be non-zero, so
userspace should be able to provide that value.

I would prefer if KVM could avoid getting into those discussions.
We can just just let userspace be as crazy as it wants.

>                         Whenever the need arises, we will extend
> the ONE_REG interface so that user space can specify custom
> CSR reset values at Guest/VM creation time. We don't need to
> forward SBI HSM calls to user space for custom S-mode CSR
> reset values.

The benefits of adding a new ONE_REG interface seem very small compared
to the drawbacks of having extra kernel code.

If userspace would want to reset or setup new multi-VCPUs VMs often, we
could add an interface that loads the whole register state from
userspace in a single IOCTL, because ONE_REG is not the best interface
for bulk data transfer either.

>> Forwarding all the unimplemented SBI ecalls shouldn't be a performance
>> issue, because S-mode software would hopefully learn after the first
>> error and stop trying again.
>>
>> Allowing userspace to fully implement the ecall instruction one of the
>> motivations as well -- SBI is not a part of RISC-V ISA, so someone might
>> be interested in accelerating a different M-mode software with KVM.
>>
>> I'll send v4 later today -- there is a missing part in [2/2], because
>> userspace also needs to be able to emulate the base SBI extension.
>>
>
> [...]          The best approach is to selectively forward SBI
> calls to user space where needed (e.g. SBI system reset,
> SBI system suspend, SBI debug console, etc.).

That is exactly what my proposal does, it's just that the userspace says
what is "needed".

If we started with this mechanism, KVM would not have needed to add
SRST/SUSP/DBCN SBI emulation at all -- they would be forwarded as any
other unhandled ecall.
