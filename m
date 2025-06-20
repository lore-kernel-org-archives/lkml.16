Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988B521C18E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 12:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750421074; cv=none; b=A2gN51aRJgGvkZPvlk1aaOmtlgZPdB8lCoanQn/A3wvdgowCFw9vAYp0ZzOV7nEteh95j22M7KxbTtmggiOemRSrP2lYZIdGi/3biSZCpJRQ2AGcB80i+DSIh8q/++UUZyRhROaIadTrAc77+QvNS5dcgeF83ezxkfwrITBKM/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750421074; c=relaxed/simple;
	bh=D4CLahTcm02K4MIrgNUooEK1xt6s6SBPZH2zMP2SJFU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Fn238s38TivKED8Zp/MC9PRV2NsJKnOYVH0hwvaX3OSvDX5snqScqMS9Al5anxOoKYq34TV+iOlqQ5u0hl5joq5/fSDIEz/IPjZt5AaKv61/prROSdyx3W/xDrPIuXqSUboUWO3kBpipYtPw8PICjnxBWB2eniDpG0Rv3NEN3T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=AFP35sF1; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="AFP35sF1"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4ee391e6fso290632f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 05:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750421071; x=1751025871; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XeTD7cN51Pn2KJSTE1mvF0ehQNPT1Jdjz2pWXS0RPo=;
        b=AFP35sF1RK2x7kFTHo1q0Dvw4GvfVfyJkbsHwj5mndAJMshYV0g5q4C6m0sbQtvgI5
         OToN8Vubm/Tqa2+USeVj39CC+ECIclY6y+oagdLGt3b1JM7GJ8cpUW1NcXFYADCrYKfU
         2Rg+I5nOgEg4JYtqWg6vJaPX/WJKTXkt+bQMvUukceYEmcPChnisO9uC8d9Nuv8UAP0c
         TAOUNitHYNRXCZQ2bbMWkTwINNlXJyySCeBDo2mI4yspsivg9Gv3QAaO0SwBjPigrLvE
         jYRbJemVu4zJDGxxq/hUpeCFswp68EoZzOV9kyOoTdGlc7mrMqKVfKkmTeoGklN2WeVm
         bNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750421071; x=1751025871;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+XeTD7cN51Pn2KJSTE1mvF0ehQNPT1Jdjz2pWXS0RPo=;
        b=Hd74JM6QGzSzt+90/6AL1s/5eYk56Z1Jl3SrwNxg7npyYvUAEnYdCCMcMX9RuixGS9
         C3E+H3ksdmzhoOHS0EeU2ffanRR8617sjOeM35XrthVRTEi28BaiAZutjrhzB7QERA93
         fKYiggHQD6NN33Ar8GN8dp9WoWbrxLaLSk3wG0LZ1bNH30ihxGEcQNc1+QSsfZFdN3Tw
         UwxCoxfQVqxIy483dfsncIAbUQTHxlxIYrqOlWwXki2cuP1l1xLLJLaXihd8hkSgmE0b
         j+/QPWQvnEBsslNdpL4bYrg9GeMluA9nwFifLhFeAFjETiVJhaUShuiJuD9eCmDSfO6J
         PFkA==
X-Forwarded-Encrypted: i=1; AJvYcCWa9tziNHkng3LbBOuxXnpty7ZF3sbW1lXvDkjkFjBC1nh7yL5ZhYDlziPYEDExR7BTiDMI9imSOt4EAFU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYhqCTGJVhoO7xMPwVVOmKw5yk1Js9SQWrdTAsOhHS/HFkB56w
	Ouz5c4giomMYCm3SCHLS5y/lI4UXNTX3E9HE9RgddsGr5Rx856pIANeHkvf3YFHV1P0=
X-Gm-Gg: ASbGncv2q7OA8Yy2mSDtmCyy7Q0IX+t3PMKNtbdqfn0qpsvOxt6kQRB7YlmP/UfhV2g
	CM+RhKGoqN7Nu3Zeo5IdfcDENrcCY5DEAdN8WqWZxC3QVAZQBOGHs7uP9LoETcMkl4Ib/fzra+/
	q692/7BGQD2YIeB0suEZKiUag/U3eDxUVRxdjxH0tY1t0FnZ6x5hYvWb9dgfeavqTQVckIg9GXw
	dCjbIywQMyGVf8Br8q0OTonUnd5IYvTsjtNSCUOIGG2qHLgUBVYpMiEjNCUR68dL0ml5fDw2qgD
	XABj1lYYEj6Z9opxWz5Fh3ZFojnCyqO6XRYrTR0wSUhM/QXBvOS11i4DofT5+JiiXM/V
X-Google-Smtp-Source: AGHT+IE5Nwx55CYVDH94kaBUPm5U9VYUEHy18TPg0VqIF2/T7Ln2PcZvxS2VOj8pKTt4zB2/NGi+iQ==
X-Received: by 2002:a05:600c:c087:b0:441:c1ae:3340 with SMTP id 5b1f17b1804b1-453657bf6camr6628245e9.1.1750421069056;
        Fri, 20 Jun 2025 05:04:29 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:81c5:fb37:d08e:99a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead2a5fsm57299655e9.34.2025.06.20.05.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:04:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Jun 2025 14:04:28 +0200
Message-Id: <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com>
Subject: Re: [PATCH] RISC-V: KVM: Delegate illegal instruction fault
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Xu Lu" <luxu.kernel@bytedance.com>, <anup@brainfault.org>,
 <atish.patra@linux.dev>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250620091720.85633-1-luxu.kernel@bytedance.com>
In-Reply-To: <20250620091720.85633-1-luxu.kernel@bytedance.com>

2025-06-20T17:17:20+08:00, Xu Lu <luxu.kernel@bytedance.com>:
> Delegate illegal instruction fault to VS mode in default to avoid such
> exceptions being trapped to HS and redirected back to VS.
>
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> ---
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/k=
vm_host.h
> @@ -48,6 +48,7 @@
> +					 BIT(EXC_INST_ILLEGAL)    | \

You should also remove the dead code in kvm_riscv_vcpu_exit.

And why not delegate the others as well?
(EXC_LOAD_MISALIGNED, EXC_STORE_MISALIGNED, EXC_LOAD_ACCESS,
 EXC_STORE_ACCESS, and EXC_INST_ACCESS.)

Thanks.
