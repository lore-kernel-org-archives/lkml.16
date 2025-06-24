Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06E228EA4D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768842; cv=none; b=dmnnJGMad+bO2lhTDG2B8K0Sm1v0voqM8BTgIHiC5em4b/w6F+2GVsMTgeJ6zHyUZUK7fwPOD5HtV9qab/DCXPeoyDaFTWzzJyRYRR4cG3+E2QyXkgiE4QSH5PU09lsUpfc7lF2MeHoqR7yzxtH3DaIxBuCBxFcF4DHIJa8on6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768842; c=relaxed/simple;
	bh=Mq6eEx4LjXIDzsVw76+zQsnLQXaYDihkcemklVGG0cQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=q6/COLLXNEn/NesS5Q7GyBwBr2wzhkWFqMCQyIbMglEzniv4Tom1PW+NJZUVhstEz0nh4aC5bQNzl4s7Dt1AUCbFf8953+cv74GU2eZ62UlwyAwv2NryYdiEyooOqH+WjMVkq0EmzbJspgXsEXI5/vzaf/G/k0FVO+4t2LJcAyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=C3OXtmZQ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="C3OXtmZQ"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a577f164c8so724129f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750768839; x=1751373639; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BUkMXYeiLB2X2X6RyKrmWWY0LEGjeorwnNRCnSQkn8=;
        b=C3OXtmZQIVsmzIUYaa5EDif+jT2Bnz7vH/3ICr1qS6egGwHvKT8tU9392dbIGh0yKJ
         okyavE1MP58RPzcd5veg1ec/s21xwqQpOPZZ1l2kwaW04V3LRl1xdy67uxan0WZxwkJh
         spRCdu8gvU2HBvmt52zENKYX7ys3co49KYz5AFXU5r8QA21HO7OoqSKLl1kE3+OYnzQr
         xPOPwe5FoIjbLG54G2tPlk+wGNa1+CUTC/vZr9svfxIkbExOlzFg0KaVFLOtwUqUEYx5
         A8+bH4EQoxbWlz5BChrPNeyv2ckMb2YHaRVeXIfNwiGtiZuk1yNRHtW+EUEFYZgB97sm
         7CSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750768839; x=1751373639;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4BUkMXYeiLB2X2X6RyKrmWWY0LEGjeorwnNRCnSQkn8=;
        b=juLy7YUL3HcL5nZrBkYdZynddNMyDBXkVb5qX5TkPZtap3TrK+dfEDTezt/6GX8q6m
         8JVlsHUHeyIIN5/A/CnMig8KZDuhuu26/1YsdVCcdAO+ob2h96jjnhrf+bpcSObcDXGU
         7t23fQgsu3zXk0fbURmtQ32wmC+ss/cAJmIf9+Mc3bGaHPsvqufY8mbqdfcgrTMwbr/d
         r1QuAg+JykzXqSdcobRe76fllrwHoM7Xn81w+mExYzt/1VtOEKsGEbm0DcTt/ccEqyrp
         bARlvJVOzAZY1A8TiEZnIqDXPGCYqsaqxG+R/PUgVG4UuqVsFiGtRQJCbAAacaXcjPd9
         J1MA==
X-Forwarded-Encrypted: i=1; AJvYcCVYi8OB0hwDkcge8DM4UU90388VSjPT24cofsMEwCm1v2qRGqu4gyyKuk9jCEe+TWBSs4jkORGjqJNaC7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTSnOwwS0iyaIgiwhyVZc8RGQb38WpY++OzyojYaKGLhmmhBuY
	L2iYJgnRgfXky2M/hzZvyvOpAi89IOYitCCWRWQl13JvEr6ZTrUXBR2zTHniAHLxj5E=
X-Gm-Gg: ASbGnct74qIUdNVbvCfuZ4eIc3pYHjSD05Zf8sfTQJ1yKC92aO9qA1u2tJm1FFHJvwR
	dUn1M6o1fY9e3JDPMD/sXAC0CV3NTg1uSiJRX+f/IYI11wbNshoX5tSr9NBFn8bJ0w2T0wR8Dgk
	nq6DehDUYtsJ9v4YhEgheZsBcqF96D/oo6pvFKdCcbFwc7WGldNN1F7cy+ex99n8On7I0vwncBk
	F6pwl9PyPupCJYsKBTxwyWclroFDPJV5as/2IzgxIx2BfwKpDkopLk3WW0IGh3FnHu0raGH3zqE
	raHhwExU2/ef5ZOLL20lsYgjaINyUazVMS6bU1aBKI+6FkP1IrI1Lw3pdAVBzIUheQCOwg==
X-Google-Smtp-Source: AGHT+IF8B1WW4U7x6j+EHfMn1Eh1HNElh7tkerO1BXSChz4AjPz7+BmbvR0LGTv8ywPf/lT//RsyfA==
X-Received: by 2002:a05:6000:2512:b0:3a3:584b:f5d7 with SMTP id ffacd0b85a97d-3a6d12a4f93mr5267059f8f.5.1750768838760;
        Tue, 24 Jun 2025 05:40:38 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b00d:6d5f:6e67:f5e8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4536fefd2b4sm83300675e9.36.2025.06.24.05.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 05:40:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jun 2025 14:40:37 +0200
Message-Id: <DAURR8R4IVN1.3U4UFSWQD6JZL@ventanamicro.com>
Subject: Re: [PATCH v2 0/2] RISC-V: turn sbi_ecall into a variadic macro
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Atish Patra" <atishp@rivosinc.com>,
 <ajones@ventanamicro.com>, <cleger@rivosinc.com>,
 <apatel@ventanamicro.com>, <thomas.weissschuh@linutronix.de>
To: "David Laight" <david.laight.linux@gmail.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250619190315.2603194-1-rkrcmar@ventanamicro.com>
 <mhng-C1133FA3-71C3-4ECC-B3BF-13DC7640464D@palmerdabbelt-mac>
 <20250624090923.5521a0f2@pumpkin>
In-Reply-To: <20250624090923.5521a0f2@pumpkin>

2025-06-24T09:09:23+01:00, David Laight <david.laight.linux@gmail.com>:
> On Mon, 23 Jun 2025 15:53:58 -0700 (PDT)
> Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> On Thu, 19 Jun 2025 12:03:12 PDT (-0700), rkrcmar@ventanamicro.com wrote=
:
>> > v2 has a completely rewritten [1/2], and fixes some missed trailing
>> > zeroes in [2/2].  The fixes in [2/2] are important for v2, because
>> > sbi_ecall doesn't fill the registers with zeroes anymore. =20
>>=20
>> The SBI spec says "Registers that are not defined in the SBI function=20
>> call are not reserved." and I'm not really sure what to make of that. =
=20

At the beginning, SBI says that only a0-a5 can contain ecall arguments,
and then each function indirectly says which registers actually contain
arguments.  a0-a5 that don't contain arguments are not reserved, just
like all the other unspecified registers.

>> Specifically: does that mean implementations are allowed to ascribe=20
>> custom meaning to those parameters and might start doing stuff if=20
>> they're not set to zero?

SBI explicitly reserves registers if they are intended to be used in the
future.  The result of the ecall must be exactly the same regardless of
the value in unspecified (not reserved) registers.

We can't really tell what an SBI implementation will do with unspecified
registers, but the most sane thing would be to ignore them.

> Or does it mean they aren't guaranteed to be preserved?

No, they are preserved:

  "All registers except a0 & a1 must be preserved across an SBI call by
  the callee."
