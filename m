Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802CA1F461D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750840460; cv=none; b=IQq7fJMg9N7DT8LmtaudstidvCP+giBEdJw5vhJGYeh9U/S9hClJrWvyvQug2V2+lJqTeIKDF73ognsELoPeMzwQyKHiuSHzl54TczU7+CwZBCUvtZsdGCNBZtamQB7IOQqL0uLNlqqu0KIyxuGonMHyq+XMK3tDa/pFhLd6p4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750840460; c=relaxed/simple;
	bh=+QtwyR1NK6SfC2uELTLQv9t/n+xX9pp+Bk+GvUshkug=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lT8DTQm8CqD7PXyo7ex2r9zysmQxtvZ/4BONpoxU+S2RgZ/U0fxWAj2r6bd6ABqpCFXs2EGgU6SENfnJt6U8uIeqFGLMCqSAbhs1g5Hlt2U7fR2QeMFu44GUWXwk2yVS9j6+BQnq6KK2ftAEisE/TLTkbz+ifdhg1OxYgz8JIko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRyZ5gYW; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRyZ5gYW"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so1181823f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750840457; x=1751445257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzsHE0Dm+vaKIDZxCmSo57hINCBe8Wa9oOmgUaoD+0o=;
        b=DRyZ5gYWo9v0nmeBMeAyqVJmcRt+Tkq0lo93uJShkqzc2w0L7qyMGnRsmcjizEZ6kb
         664X/U4Cr5D1D/dm60GnanY55dS/TT1drT09WgQBbmA5CPqH3X0XppwFCrxXKzsReEBc
         uhHHOyVF9VTE1bRbQvYg7EOvp5Y+eXqH38dT2HCweZ38iaZOBARkBY1BsvB69rLOLtxG
         S0YPTmI6G01aGXK7hlUb567yRqtSsdF5dDDP5XoVjZ1WEWSzP6KvOJ5nqcJm8fmN9KgS
         etAEE6ZbKFG7iqqe7Wadbg0m1t3KGLH0l75aoAr4K6qZZwMHSV75a/fMqpFW2xVmyfTy
         3N5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750840457; x=1751445257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RzsHE0Dm+vaKIDZxCmSo57hINCBe8Wa9oOmgUaoD+0o=;
        b=uIhFWrtqwGQenRscEkEtTjseccCQcPeb9Cc7CdN5owWdWaTU7Njfx4IW2CMrNi3Pr7
         4/EPzVPxW5yOAHRtHdOU6DJuh/gJBoUg8f7D3fb5Uenzk62oaBR7tsUEjaV977LUXzkD
         rYCieuqdFTsgRQACk6tLUBSlEw+eXh4dHNmCEkBBPl2xKUhr4H32j8DGHATwn1XR2zLK
         5q0b9Yj/7W+FKELfy3A5hvuFrLqc0QEGjLzbG9273iiKCRUxKlQ4lVC3wGBKTs636KO8
         GC3dM30e5yyOza4OrOHiEs4MukYcPp6xs7NAfr6UDVBhib2j6if4G/8QH/LI+zs6TIzs
         KPjA==
X-Forwarded-Encrypted: i=1; AJvYcCU0+5sQrFpHYq5UKzoQ+si0NVDWGIX7ADkvqDejaL6LovPQEpFbrU2gAsIZVWDwKN4Oc7o/Dq4ZSEsmIj8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5TRTQRI9VkGW6H4BJlQKanxLj5Ysh4ByFuePm4CqhuwTdXAnu
	yilogcAiadwIMRRgnVB6+eOZ6Ef+JUpm2+H16Lw1afxts9ncw2MOJfhS
X-Gm-Gg: ASbGnctBXb4c2FFj/lEYg677mM7h+PgfFvl7rku649WpBXzbYYEHeA+hpc6jvRvGI/Z
	MpQKg+OCzcjJSLysxri09bki5fSF1Q+gNEI+h4ZAfqq7KtJIbSRrwTCPmxk0OwS6l99BcRlXMJY
	Bozh8UopkeFq6DBax4aPlLN3rS97HMWv77Qf4A5hzJXsIh5yA0+tNCtrcclvH81LHUb2sIag6wV
	6RrJwZ7Ll6c9WNlTmRQhjcJFdQ62uOZPtCmKvp1eFT4o/MojdjMJbE9s51sKUdYjEwOy3yRjWTK
	45QXyWHyoXn1c0W3zUu+oOrygAykSV7U2onTuBx5T+NpGg/DvIqdZUSF3CVMHKUSbMMgzY7G1oS
	HJN2DL0Wa8kGfIHskpQN2LGTW
X-Google-Smtp-Source: AGHT+IG4iG1MpnnxD3c0z3g1108nyY/UfjDrLLLTyFBsEARnqSoXsXoPNJxtt7ch3KoKN+2Mq6N5Pw==
X-Received: by 2002:a05:6000:1449:b0:3a4:dbac:2dc1 with SMTP id ffacd0b85a97d-3a6ed6506a3mr1622991f8f.54.1750840456547;
        Wed, 25 Jun 2025 01:34:16 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538238198asm12803765e9.39.2025.06.25.01.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 01:34:16 -0700 (PDT)
Date: Wed, 25 Jun 2025 09:34:15 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Atish Patra" <atishp@rivosinc.com>,
 <ajones@ventanamicro.com>, <cleger@rivosinc.com>,
 <apatel@ventanamicro.com>, <thomas.weissschuh@linutronix.de>, "Jeff Law"
 <jlaw@ventanamicro.com>
Subject: Re: [PATCH v2 3/2] RISC-V: sbi: remove sbi_ecall tracepoints
Message-ID: <20250625093415.53fd21cf@pumpkin>
In-Reply-To: <DAVG8M70SJ4Q.ZSTC5VSJWGSK@ventanamicro.com>
References: <20250619190315.2603194-4-rkrcmar@ventanamicro.com>
	<mhng-516082EA-5A9A-4A76-9448-70828749F95F@palmerdabbelt-mac>
	<DAUSD38QIV6D.1YO5ASNI3EUGV@ventanamicro.com>
	<DAVG8M70SJ4Q.ZSTC5VSJWGSK@ventanamicro.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 25 Jun 2025 09:51:45 +0200
Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@ventanamicro.com> wrote:

> 2025-06-24T15:09:09+02:00, Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@ventanami=
cro.com>:
> > For another example, let's have the following function:
> >
> >   struct sbiret some_sbi_ecall(uintptr_t a0, uintptr_t a1)
> >   {
> >     return sbi_ecall(123, 456, a0, a1);
> >   }
> >
...
>=20
> GCC 15.1 still leaves "mv" outside the branch, but at least seems to be
> on the right track (undesired overhead is marked with leading stars):
>=20
>    0xffffffff800236e8 <+0>:	addi	sp,sp,-48
>    0xffffffff800236ea <+2>:	sd	s0,32(sp)
>    0xffffffff800236ec <+4>:	sd	ra,40(sp)
>    0xffffffff800236ee <+6>:	addi	s0,sp,48
> *  0xffffffff800236f0 <+8>:	mv	a4,a0
> *  0xffffffff800236f2 <+10>:	mv	a5,a1
>    0xffffffff800236f4 <+12>:	nop
> *  0xffffffff800236f8 <+16>:	mv	a0,a4
> *  0xffffffff800236fa <+18>:	mv	a1,a5
>    0xffffffff800236fc <+20>:	li	a7,123
>    0xffffffff80023700 <+24>:	li	a6,456
>    0xffffffff80023704 <+28>:	ecall
> *  0xffffffff80023708 <+32>:	mv	a5,a0
> *  0xffffffff8002370a <+34>:	mv	a2,a1
>    0xffffffff8002370c <+36>:	nop
>    0xffffffff80023710 <+40>:	ld	ra,40(sp)
>    0xffffffff80023712 <+42>:	ld	s0,32(sp)
> *  0xffffffff80023714 <+44>:	mv	a0,a5
> *  0xffffffff80023716 <+46>:	mv	a1,a2
>    0xffffffff80023718 <+48>:	addi	sp,sp,48
>    0xffffffff8002371a <+50>:	ret
>    [Tracing goes to +126]

How much do a few register moves/spills matter compared to the
cost of the called code?
There will but much worse things out there if you look.

	David
