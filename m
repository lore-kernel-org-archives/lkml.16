Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765601FE46D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750666083; cv=none; b=tXk1Dp5ABtctcQzYXRhvRGW5KJRpKwvgZsoNappbgrVcQObE23RwBysUh1XhbWDO653w5EvITyleeEculTWjzuRQpzpGo8PCkm7H2RNK67bcKYTRCOdd/9TZJR9BLBv9RGM7SU1eI4IRkJ1xrGMpjeTIr4qUiYQTEHif4odgST0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750666083; c=relaxed/simple;
	bh=Yh1kw1hKQqBhWmop6qzlDNGwkyJtpBrDnLSzRWo41xM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bl3ZovpkpK9iwnusDxw6+/KquxCRyJzN7GvfrpJSWGjCtP2yiW1RlfGmcOK2s8zAohY0t3H39iRExQKBbGRXHyODFgd7+4GCjyA11KlKRpwNZ9PiadhrtECtcEKTzVhJzR9dsTWG6gzEcXhkMMoOTSJR4ADbXM4WXdH/utFKPW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ZN/k0oYg; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ZN/k0oYg"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so2977687b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 01:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750666081; x=1751270881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZxpsxBnAztApt9xBJdH0Ct2uH1bvpAVjnJKcApgLnKg=;
        b=ZN/k0oYgm7mf2IOMeQbB27IlZfKRQfxx3nCy5eSeWWNlZH6GV4+Wzm6EexWWrKJQHu
         3XgtI6TNo9KEJ+hZZiB9cpiTv6xUBh7vYPtF03Dzlcud7iFvP/977oxi3afWDErsCJtr
         0TTtX4nW4FZ9sugzr7I2gygFI7aTbNdyz4vlxVziDXa3dTzj0zBAgk2gYnsF51zzKYEF
         vrVOsVnurBxMA1GLuy/ZDPKGvAm+MyUWNMB6My0TWj7NBs2Y1e0pCpmo2SKDwwo/17YR
         S8NQPCxk5QB2GqKu1dzMe6dTYQf4w2CQUa0C/VA6nNNIcQjx4ZfU8INzEXngp+b8yn/E
         qvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750666081; x=1751270881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxpsxBnAztApt9xBJdH0Ct2uH1bvpAVjnJKcApgLnKg=;
        b=nAQol1J09d/Be2OdARJnT3eKkL0hHpzjET2jpYX1OFN6hWX3mdEj8W0xYFYjrx2JmL
         sd8J9Uq3/SIKW1W2JpidIc/vKtTyae1F986kL/G9grRVugN9wgsyKDlXT+wADEVwa3KE
         SGB7Xk8EUXDt4nwYrZGDQyg8CZJ4pUAaUecP2maOe+tM9l1akQMWVMe+5k44LUJDRPjr
         /nAqavVyQ9CGHIli97DAvgTMUxqUyTPF0CXKZ7PZvBw6JSBTXLBxJy4/ZOBeZidPGisc
         2PH0p65PC86s7VnsC/mvbCPcZb3I7PdIzql+QRauSvyX/2Bd0ji3m7rFvqWt4SkFXqOb
         nXDw==
X-Forwarded-Encrypted: i=1; AJvYcCWrBX7x1AqXMe6xhFF7k61amD2Ztar+CNN4GbIHbylrPYbNOJ1dgxpnHdYDrHEO35UNgYFzhymAut4ISFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSgs376aWV4kyks+fZ1pP/fR/RIeXNbYeCUtIINJ2rQ5YKaiOl
	zXG/J9w1WwKETE+bvVZLn3AWGHd/o90e20S4O5yoees411PZg6/228iq1BL7toVCL+A=
X-Gm-Gg: ASbGnctJtIwd02UAmwTVBfYzQw6Z5mh880oEyA9GNKGgvk4NMHMRn1JIEeDVCBJQ2YA
	1EVJp1tQAC6EzegNkH/5SA3mgk6BDzBukongspYjGP0x7IoaI9LKX4gtBynxaoOEMd3iqgQK0xI
	4POm2GKZq6l4ICSwVjByhVTENRDupo4XLu7JLnoGKxYX2RcxFcf0Eq4HzFzay3vwO2t8uSDuOkR
	aJnUxPOGFYd7ZIDvWYfnGkuQp8/677wpM3ip5GVZ/rZVZErLmfhoTXlXjHhUpp1h8rCAuHfCwCx
	eNZsijw2tlZn9NIeG5T85ZiwtdwVRzMnvOaM1b1jZOnp6+wPIwa8oSDeRyrHGiPntCfTtXKfxLZ
	60vd12D9gCTAwFkpPat07ApUkWLnBCqVdhtE/+pKBDA==
X-Google-Smtp-Source: AGHT+IHuhK51wxxmabIbzoHHlgBq8UYX82HbhRz2QXhvMRsa67AChvnWz1JFNbTr22S/kvZSFTb/jQ==
X-Received: by 2002:a05:6a00:cd4:b0:742:ae7e:7da1 with SMTP id d2e1a72fcca58-7490f287c44mr14337992b3a.0.1750666080714;
        Mon, 23 Jun 2025 01:08:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a64b2aasm7719241b3a.116.2025.06.23.01.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 01:08:00 -0700 (PDT)
Message-ID: <c12729a1-5046-4821-b5fe-5fea72af76c8@rivosinc.com>
Date: Mon, 23 Jun 2025 10:07:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Move duplicated instructions macros into
 asm/insn.h
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>
References: <20250620-dev-alex-insn_duplicate_v5_manual-v5-0-d865dc9ad180@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250620-dev-alex-insn_duplicate_v5_manual-v5-0-d865dc9ad180@rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 20/06/2025 22:21, Alexandre Ghiti wrote:
> The instructions parsing macros were duplicated and one of them had different
> implementations, which is error prone.
> 
> So let's consolidate those macros in asm/insn.h.
> 
> v1: https://lore.kernel.org/linux-riscv/20250422082545.450453-1-alexghiti@rivosinc.com/
> v2: https://lore.kernel.org/linux-riscv/20250508082215.88658-1-alexghiti@rivosinc.com/
> v3: https://lore.kernel.org/linux-riscv/20250508125202.108613-1-alexghiti@rivosinc.com/
> v4: https://lore.kernel.org/linux-riscv/20250516140805.282770-1-alexghiti@rivosinc.com/
> 
> Changes in v5:
> - Rebase on top of 6.16-rc1
> 
> Changes in v4:
> - Rebase on top of for-next (on top of 6.15-rc6)
> 
> Changes in v3:
> - Fix patch 2 which caused build failures (linux riscv bot), but the
>   patchset is exactly the same as v2
> 
> Changes in v2:
> - Rebase on top of 6.15-rc5
> - Add RB tags
> - Define RV_X() using RV_X_mask() (Clément)
> - Remove unused defines (Clément)
> - Fix tabulations (Drew)
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
> Alexandre Ghiti (3):
>       riscv: Fix typo EXRACT -> EXTRACT
>       riscv: Strengthen duplicate and inconsistent definition of RV_X()
>       riscv: Move all duplicate insn parsing macros into asm/insn.h
> 
>  arch/riscv/include/asm/insn.h          | 206 +++++++++++++++++++++++++++++----
>  arch/riscv/kernel/machine_kexec_file.c |   2 +-
>  arch/riscv/kernel/traps_misaligned.c   | 144 +----------------------
>  arch/riscv/kernel/vector.c             |   2 +-
>  arch/riscv/kvm/vcpu_insn.c             | 128 +-------------------
>  5 files changed, 188 insertions(+), 294 deletions(-)
> ---
> base-commit: 731e998c429974cb141a049c1347a9cab444e44c
> change-id: 20250620-dev-alex-insn_duplicate_v5_manual-2c23191c30fb
> 
> Best regards,

Hi Alex,

I already gave my Reviewed-by for the last two commits of this series in V4.

Thanks,

Clément
