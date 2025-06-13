Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1579B22370A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 17:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749834502; cv=none; b=Y/lpDWXUFY0DrzisknXnYnoQuFsim1RyrPnUZ4gXK31VfcxWYrxkd8k16X6DNYuqreXi0AmcSLPq9HK9oZFK7O/fprX+/1k0TuVgStRSvqIgxkRfZlLGS79/DPQ773zp+49Nnuy6qxymrLVHGnYOwCLGKg9f8ubFSfPz1qV3lCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749834502; c=relaxed/simple;
	bh=xmOtvu3aUqQL7JZa5bDY6mjNVveVay4n816Uni9tUbA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Hjvxsnfhj9i67cnpe1Aies00EIi2/O59dlWWq6JQBYpYfAbdp3tLfmacwn4LcuZnNp/JvDSkzcX2j57VmtG2drJIFj+CgyF/Z9d4MN5TL2Sxsi8nXQmYfw3zKyo0pHmKB+LpPPowyVVBZvWJhdf/l6fo3eBi1Li2JLu2CQLacLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=o/KvmdMt; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="o/KvmdMt"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4eb4acf29so257231f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 10:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749834498; x=1750439298; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vue51+MgfibcA28it1/xkcw6YG/3bQrUPQvFZm0rgdk=;
        b=o/KvmdMtkmEn6grtZdx+RZD0p2Ej9e6Cv67pfHGqDuMu62qA+kHjanyzg+nU1VavtK
         sA9ILWDXAkoypodY5YBJvfcp2h5W1f/5uqDhhADMhiFGx5m7QcUajoqIA3toOdMX0wVe
         xJCCC77VAvdDzn10N39k6wvFfCgtmNCLnSic8kxvModt8DiXwzrqJ8GpEjsS1JPrqhOp
         4jKLLU3YT7R9lqqk3B3rl3vwq8KgdfCmVq2vhNmAkuxw1UIrb4DFyc1EXl2UnTi+HIUj
         qKtHjnPUm0Ugh74OuppgpJm/x6Sjp/Vf2y+oj0B8ALSOJ4BunMKJlP4S2sIw4bon1ssR
         Ox+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749834498; x=1750439298;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vue51+MgfibcA28it1/xkcw6YG/3bQrUPQvFZm0rgdk=;
        b=hsC4gqD+SmfkOg0G/kmqxLNnET2QOv/kT4I4M9xHMvNgmztuLJNMkyeh2jLrZY1q5i
         wYYFCU2ZmHrXqimzEIwqKZSLxwApmm4+U4+Wj7ugbK/3xFytQPIV6ZYdsSHKjfAeNND4
         qjCbkQ4McpkaSix5TlRY6AdPGe3XQWcnsiEH3D8vNa3JiewxcXpQ0CHj+J8I1F5ixMBH
         clMR2OUkfzByA3fepFLk5dtZ3NGYYk1hrBYlUir680d8xS0OCACQIKxh9dQLTgiO/AVK
         IPcTLxKa3mbSYr0aZhFHTqIRiZOIz/3NOFZkchs0T4JV6YvJkPsljUI8MRy16pzXNxp1
         QKzg==
X-Forwarded-Encrypted: i=1; AJvYcCVR46YoVdNd2dhG4azEyKWWk40cneZ/tPYfII2r7BJq7Ug+bdCahrajRAdv+082CparcKWH5zTq0guk3Yw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1tgfdnGQ5WSo5OLS6e5kPFb2Skghf/a1LELwDjeXsN6BdD6Ph
	OBXXhtu9mxCWMcMFojAE9KI/1HRtA2M78bknCDncGBSTkTfDP11WVTLYZ99puWlp4sJlTsP/UKA
	n/cLb9wE=
X-Gm-Gg: ASbGncvyOKn9qromE4EvHaZJDRg8rtwBvsOubtmDLxfWvQKdwqBg/WTDI1K/Q2s6mJd
	Y1p00EfjQSYMyG9i6GWKZBoxvg+1t+yFjChAe20iX0jVJoBvtUG7HYxaPql1BVx6osGHaKV+TRv
	YNzldY0d/TOl2SKOSuHFnnibQnBRsL1t38Qi3Z9cvJsGGVJE8a6XKYJG5MQQikS+06jNjtkU2R6
	HIpvbjnKE71kNKwrXBT1BDg7QzoEA4oCqBr6/prHhSr7ourUceYIRHEFo/hDBF2N9oMgkK6rIZI
	NLBtrmI6Hy3kfnfnLSGMBkUumEoN6UGVyr7BAEv8BrAdckhFSNeDexbJq3gngtYNwVdM3Q==
X-Google-Smtp-Source: AGHT+IHfUlqWvloCSvdoAAhCyaKAAKDpychdD+BfdH2KIKQft+7sNerlZ4YyA9yLV1CZzyAdw2xnjQ==
X-Received: by 2002:a05:6000:1789:b0:3a3:7be3:d0f3 with SMTP id ffacd0b85a97d-3a5723aea0cmr190535f8f.14.1749834498233;
        Fri, 13 Jun 2025 10:08:18 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:3c9f:2b68:ce36:f64b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b2c957sm2820587f8f.76.2025.06.13.10.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 10:08:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Jun 2025 19:08:17 +0200
Message-Id: <DALKK6MHWD7D.3ZFXSS6YNLHL@ventanamicro.com>
Subject: Re: [PATCH 2/2] RISC-V: make use of variadic sbi_ecall
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Atish Patra" <atishp@rivosinc.com>, "Andrew Jones"
 <ajones@ventanamicro.com>, =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?=
 <cleger@rivosinc.com>, "Anup Patel" <apatel@ventanamicro.com>
To: "David Laight" <david.laight.linux@gmail.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250612145754.2126147-2-rkrcmar@ventanamicro.com>
 <20250612145754.2126147-4-rkrcmar@ventanamicro.com>
 <20250613115459.6293f929@pumpkin>
 <DALGSCDW0GIG.10I22KD2SCSNX@ventanamicro.com>
 <20250613165226.751541c6@pumpkin>
In-Reply-To: <20250613165226.751541c6@pumpkin>

2025-06-13T16:52:26+01:00, David Laight <david.laight.linux@gmail.com>:
> On Fri, 13 Jun 2025 16:10:52 +0200
> Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@ventanamicro.com> wrote:
>
> ...
>> The macro will result in the same arguments as before, and it is what
>> the sbi_ecall actually should do.
>
> Ugg...
> Are you using pre-processor 'magic' to add a pile of zeros and then
> select the first 'n' arguments?

Sadly, yes.  The zeros should have never been introduced in the code, so
I'm hiding them for the moment.
I planned to remove the useless zeros in future patches.

> That ought to be banned as error prone.

Sounds reasonable to me.  I will try to fix the insane tracepoint bloat,
and send a v2 that fills only the correct amount of registers for the
ecall instruction.

> I think the one for strncpy() removes the immediate compile error for:
> 	strncpy(dest, src, 1, 2);

I would have preferred if sbi.h had a wrapper function for each SBI
function, and we never allowed direct invocation of the ecall
instruction outside of the library.
