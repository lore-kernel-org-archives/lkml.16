Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7502D2920B9
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746799064; cv=none; b=nlfK0MevCfsUAYty7aOsX1C8AmE4LpnUM2cvI5gXZefthsgq5VqmiQw/1tLaRB9AEOPlbpRACOeVcya4A0D/pwwcf1fxYZpKh4g1vB/d5KT9wtY2/hxrN/QVgwxOjVh5boYV4RKcPdiafvRdb+1ro3ZDQ/QklqlBYrrEyvKqQd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746799064; c=relaxed/simple;
	bh=uXbSh30SrWCCLUYB2fIrcVdMaScZKq89anW8KRg2CYo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=MsI1kKngxqB9tSkycDj/jFbW5+KkvT211R+i+qJPXwgH1V8eRcFX5ZoKk9gpoWiI1Vboe+adBS/Qf/tQa2NVG63nnyyHUV8P/93HDGE/iuBTtNbgU17u44zgFIb+B9Ke+iymdaK3agFfzQrIovezfC9QhQZnD8q8w0SyYcL9JOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=P58N5FQ8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="P58N5FQ8"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43e9ccaa1ebso680195e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 06:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746799061; x=1747403861; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89ii3tAdP6qYOru2WdH/cAWgrXsFKNVha3J9tXFOzI4=;
        b=P58N5FQ8PC6Ro9iq8lJAdpjx54i7odd0umPqu+qDcyHX/dPXJts1Nj8AxkGY9ZuAw+
         CeMDrC+HHrY6WToWc9pbtxAo/8mDW7ZPo+HeJ49QksFgpK/ZP0PsR90cGE0gImpetHrD
         6PSoqt6SaQeRtXbSZv2n/Uw/LM/F1aNybRqd70Dfzn8DGj/Il2+QydyQZFlNA5ososp8
         aznRdByTzZjn6cB6DjeWeYvtyiuyAeOUFtnV76lchaCu8JaKVqv2C/ICHEYLvVnZdFu1
         6ljEN2up4WDVfO/eeXm5vIwMfOKvUSNT8EmYuOoma87Ap0W53+lWckYAvvCSGUVy5TBH
         xw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746799061; x=1747403861;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=89ii3tAdP6qYOru2WdH/cAWgrXsFKNVha3J9tXFOzI4=;
        b=vJ0ksWXmnkqFzTaCQ7f7JWnTWS9dfBy7nFc48pasaXLn/+xTJ8q7LKIJpriKcr55rB
         b0xvNcVAsjSvX+pTtJUbRDsc0cppDJBP7v7Y54eSssEYkKit6czm++RhTKA9Fhj/ZixD
         lwvjnE5BxJckv85wZh1ys5ou5nCfepftsWXN3Ow+H+1eWZVDTk7+b9V0KZlIcyoarkwj
         8OTVb5D8eunBWA/fiusR2ddTiNgt70dKxKaffnfGlGCUb7xxHkLfa0QgtU9eaFV/YWq8
         cUKje5G8OVf4RqbtxXXNdrRn85bRWb2/eIDkS3Tkp0KNN3gCzmdL5UPnwTu01200LYLT
         fKrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzGm80qy+KGBCtcY/EYoIJ3ReU+vCYhuiSECPU14Nnx6FoaQlJrKrOhgB4XcBRBNBLUF5f1jtf3YOU6SE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWlKnVDs9Ta1Ab+SldRwAMwYib0sviLxIVifCchWm24mbBLGzJ
	NYDzZIjFt/lk4h9ZnJvtDKHeWvzlUXKIuWH+BGwkxK+GY2A5fV+SUhk35lM8g10=
X-Gm-Gg: ASbGncuBAjtXjDXjfQo6Cs9lMxOMA69kwGJoJ8AyVjFT/mOFmCySc3JazB2bXS8e4rl
	a9Q/6058tpcCSbDV97wNs1BXxgGCRZi2Wg16qWA1e48coEW8IT/x7FidbE6XPhJc4EX+8ARDEEt
	9VU5WL8Li1X+TLlU+E/ijgD5w8UEfneAP53z3StH+RPmGqCEiMu6MgUsJ8e7lXuZNYDNv2GdJpC
	eij1EPpoXg7LMbUz01gndg8qw0qR1wvVuvPfPV7gfSCuNGDzyEoilQvdNsa2LC5w0v5HEsSkzhB
	4Gjy2Af2zdG1XHP1/NmIq8HF1t1AJyC0Zqk1N1nPdIXfwEz3
X-Google-Smtp-Source: AGHT+IEcAmbHJpk5CxOrqm5l+BEA2PNktNRuHCKGe+vwxNwlbx7QLnODKWUwlOC/RXddA54K8TiWJw==
X-Received: by 2002:a05:600c:8215:b0:439:94f8:fc7b with SMTP id 5b1f17b1804b1-442d6c39708mr11774315e9.0.1746799060674;
        Fri, 09 May 2025 06:57:40 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:1f7f:4cfe:e0bb:202b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3aeb26sm74090875e9.29.2025.05.09.06.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 06:57:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 May 2025 15:57:39 +0200
Message-Id: <D9ROL5UEYYHX.1B1FE6LZJ9ESO@ventanamicro.com>
Subject: Re: [PATCH v2 2/2] RISC-V: KVM: add KVM_CAP_RISCV_MP_STATE_RESET
Cc: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Atish
 Patra" <atishp@atishpatra.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>
To: "Anup Patel" <anup@brainfault.org>, "Andrew Jones"
 <ajones@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250508142842.1496099-2-rkrcmar@ventanamicro.com>
 <20250508142842.1496099-4-rkrcmar@ventanamicro.com>
 <CAAhSdy2nOBndtJ46yHbdjc2f0cNoPV3kjXth-q57cXt8jZA6bQ@mail.gmail.com>
 <D9RHYLQHCFP1.24E5305A5VDZH@ventanamicro.com>
 <CAAhSdy2U_LsoVm=4jdZQWdOkPkCH8c2bk6rsts8rY+ZGKwVuUg@mail.gmail.com>
 <20250509-0811f32c1643d3db0ad04f63@orel>
 <CAAhSdy389g=cvi81e7SKAi=2KTC2y9bd17aHniTUr4RNY=Kokg@mail.gmail.com>
In-Reply-To: <CAAhSdy389g=cvi81e7SKAi=2KTC2y9bd17aHniTUr4RNY=Kokg@mail.gmail.com>

2025-05-09T17:59:28+05:30, Anup Patel <anup@brainfault.org>:
> On Fri, May 9, 2025 at 5:49=E2=80=AFPM Andrew Jones <ajones@ventanamicro.=
com> wrote:
>> On Fri, May 09, 2025 at 05:33:49PM +0530, Anup Patel wrote:
>> > On Fri, May 9, 2025 at 2:16=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rk=
rcmar@ventanamicro.com> wrote:
>> > > 2025-05-09T12:25:24+05:30, Anup Patel <anup@brainfault.org>:
>> > > > On Thu, May 8, 2025 at 8:01=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99=
 <rkrcmar@ventanamicro.com> wrote:
>> > > >>  * Preserve the userspace initialized VCPU state on sbi_hart_star=
t.
>> > > >>  * Return to userspace on sbi_hart_stop.
>> > > >
>> > > > There is no userspace involvement required when a Guest VCPU
>> > > > stops itself using SBI HSM stop() call so STRONG NO to this change=
.
>> > >
>> > > Ok, I'll drop it from v3 -- it can be handled by future patches that
>> > > trap SBI calls to userspace.
>> > >
>> > > The lack of userspace involvement is the issue.  KVM doesn't know wh=
at
>> > > the initial state should be.
>> >
>> > The SBI HSM virtualization does not need any KVM userspace
>> > involvement.
>> >
>> > When a VCPU stops itself using SBI HSM stop(), the Guest itself
>> > provides the entry address and argument when starting the VCPU
>> > using SBI HSM start() without any KVM userspace involvement.
>> >
>> > In fact, even at Guest boot time all non-boot VCPUs are brought-up
>> > using SBI HSM start() by the boot VCPU where the Guest itself
>> > provides entry address and argument without any KVM userspace
>> > involvement.
>>
>> HSM only specifies the state of a few registers and the ISA only a few
>> more. All other registers have IMPDEF reset values. Zeros, like KVM
>> selects, are a good choice and the best default, but if the VMM disagree=
s,
>> then it should be allowed to select what it likes, as the VMM/user is th=
e
>> policy maker and KVM is "just" the accelerator.
>
> Till now there are no such IMPDEF reset values expected. We will
> cross that bridge when needed. Although, I doubt we will ever need it.

The IMPDEF issue already exists.  KVM resets scounteren to 7, but
userspace wants it to be different, likely 0.
