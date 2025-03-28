Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943012F37
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743166938; cv=none; b=epqn24Qdn2Orf21bopbUDW/0lXItLEuHhXUx7SwS9e9ib6hcmnWCv3S1G2Vpdqlh26X6nmY5rWidBanlGMTX9KhTkaWoH4tws39ur1lH1I7xH90Ue0CYPuxoQN4Xd9nzT016y+EbzhO9fed7vDIMn3wchmRnS8q2rIg4ji8n2bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743166938; c=relaxed/simple;
	bh=zw7McFQdkB/LT8MMnEaqgE3uejx+nD/2Y0VWVhpfulM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sZdmJaU+2MOeY4kPgNwRW5hwUGBUCOy6wogJyUI1sBgQfFrazMk5o3uPaipY4gPEN+wlBy7bH+wd+wl+RL97s6RuwIvIn6yEQRzhD+J20z/FY33ebOmn6koY00UvtruaVliGf0QM0VzYgcOtfu9G8NBZkexaHGhJA7fhqIg29Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=vJb28hfE; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="vJb28hfE"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2240b4de12bso1892405ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 06:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743166936; x=1743771736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TW7rcmweIlsrSC+6IbMmik/ob6BAUTJ219vwGjKT9mM=;
        b=vJb28hfEbbve2bwxdQHKZ1nr5CvquKVEL3f+xY4Lvf+MNDxgHBy4PptO1IgvkfzNAU
         DU2T/ZmDQ7nYeFU210Fwn74IHjqKHrbiNXL5ltbnAQG4RAbne/4W+v5nt4Ecq/Y442ff
         2nEuD5E3i/4rOpq9AivLPA33wRUTn7QoBbmXd3EGEoBAcOm5k3cSrm4Zn2vWcAJNiAWz
         6jI9n1sHiMC5mclL2Uuubn1xcKaEVB6RyxhCpOwYEuHsh9dTQQO4ksx8qZEPZ90IgzCs
         SnG6JjBbYWqWgsEFRAUfOjuOeMbmTwSpAZsvUvaHG7yItXAHx9NuT8+ZfSUE9qzrkV4N
         90vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743166936; x=1743771736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TW7rcmweIlsrSC+6IbMmik/ob6BAUTJ219vwGjKT9mM=;
        b=nFhF5hbQZ+6+G8sdrnvvvtKlePaRMhYsnLkiC9fM65yNCHdYiQugibka5AP9qVp/NX
         Xj2Q0swKv1WLjCf7GikRxhusZrnoUWFf3YSOhg5dUYrZKxZNoT1HCoOQsJgMcxlz+80q
         PxFnsuh4BDc4PeZW/PhVktDsh9ObS/nL0980ZaQU+SNT2lgnw/f7MLCwBSz6C1T3dBHd
         ta9z45mIa3czoKlL+w5a+eKK2xaLJmWKs1YC8TN1kkSaTPIvfwz88s2fsmfCKbqkLZF6
         u0qUpNarUafAlUPXQhKs95S5eu6TRzYkq+run1MCCAHQZbSqtg/eXyeDNEFh/BqCFvz4
         nYMg==
X-Forwarded-Encrypted: i=1; AJvYcCW6OsFLw9xO1/ia5aSVR2smatNtJvY2wVEKHMuMvKEwqaWsmxjVNFQVLySEKDjqw6xb9L9zPFkbvE6YARA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQN60HHr/ENBQCxM88D7bZjthgnC7W8+WBNeFm6OyhUG88dWFe
	PeIVq/iS8P5B+jNUadSkt732nU0Yf7aSZEADYPoTt9YYFHAoOhazfHXzFZkIKAc=
X-Gm-Gg: ASbGncsTd+LsE7ZqBXLGLBFUY1GNhMBRpvAFaiZOHEdATcYPrKL3srWI4IqEgnN2HQe
	NPl+/vOXc0HqMIdU5wBDefNlmpQHHq1SvvQj5J088/x+mFH9AwTlXIV7D5xVSrcoXttqyQv4Igv
	lBhjCqDGXJvrWoY9pUkrrXZH5WLOHO0dB2p0fALM6zcMIpWE/RwwCBAwIzYMWVBM7piyD2fb1Yl
	LkYiBGcGl3SeOIYKWzJi5/DGCtGAY0IorZs19OEh9Wc6YIkypq5iutSVZDpEGwS9zLhXlITZR9c
	5DVVf+iT8ikYL6YvjXkVIK9JbBKPJNK19XI2KUAjllYRNpwhfH/dnKcnPcrsPJIp65z3UhmVnd2
	MsLX16LrIU+3FQg==
X-Google-Smtp-Source: AGHT+IH1GOqGgr7ayswYiJhPbU/AHZRTKtdQ78gPezC52OtNfXU679qlT5nrGGQooRauw8nPfoeTGQ==
X-Received: by 2002:a05:6a00:852:b0:736:46b4:bef2 with SMTP id d2e1a72fcca58-73960e2cfe9mr11451684b3a.6.1743166935461;
        Fri, 28 Mar 2025 06:02:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970deef04sm1642170b3a.1.2025.03.28.06.02.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 06:02:14 -0700 (PDT)
Message-ID: <c0f425ec-6c76-45b2-b1bc-8d9be028a878@rivosinc.com>
Date: Fri, 28 Mar 2025 14:02:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Make sure toolchain supports zba before using zba
 instructions
To: Alexandre Ghiti <alex@ghiti.fr>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: kernel test robot <lkp@intel.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>
References: <20250328115422.253670-1-alexghiti@rivosinc.com>
 <7352dfbf-51e0-47b0-81e2-264f30989bf1@rivosinc.com>
 <26afad1a-bee0-498b-8213-aea87167dedd@ghiti.fr>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <26afad1a-bee0-498b-8213-aea87167dedd@ghiti.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 28/03/2025 14:00, Alexandre Ghiti wrote:
> On 28/03/2025 13:51, Clément Léger wrote:
>>
>> On 28/03/2025 12:54, Alexandre Ghiti wrote:
>>> Old toolchain like gcc 8.5.0 does not support zba, so we must check that
>>> the toolchain supports this extension before using it in the kernel.
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202503281836.8pntHm6I-
>>> lkp@intel.com/
>>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>>> ---
>>>   arch/riscv/Kconfig                     | 8 ++++++++
>>>   arch/riscv/include/asm/runtime-const.h | 5 +++--
>>>   2 files changed, 11 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>>> index 0d8def968a7e..ae6303f15b28 100644
>>> --- a/arch/riscv/Kconfig
>>> +++ b/arch/riscv/Kconfig
>>> @@ -735,6 +735,14 @@ config TOOLCHAIN_HAS_VECTOR_CRYPTO
>>>       def_bool $(as-instr, .option arch$(comma) +v$(comma) +zvkb)
>>>       depends on AS_HAS_OPTION_ARCH
>>>   +config TOOLCHAIN_HAS_ZBA
>>> +    bool
>>> +    default y
>>> +    depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zba)
>>> +    depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zba)
>>> +    depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
>>> +    depends on AS_HAS_OPTION_ARCH
>>> +
>>>   config RISCV_ISA_ZBA
>> Hi Alex,
>>
>> Why not add a "depends on TOOLCHAIN_HAS_ZBA" here so you don't have to
>> check for that config option when using CONFIG_RISCV_ISA_ZBA ? This is
>> done like that for ZBB and ZBC.
> 
> 
> Actually Conor changed that for Zbb in https://lore.kernel.org/
> lkml/20241024-aspire-rectify-9982da6943e5@spud/T/
> #m89d45ba3cbc6c2f953516c0e9977fecf397809b0 which is queued for 6.15.
> 
> Zba is also used in BPF, so we should not require that the toolchain
> supports zba but instead just that the platform supports it.

Indeed, makes sense !

Thanks,

Clément

> 
> Thanks,
> 
> Alex
> 
> 
>>
>> Thanks,
>>
>> Clément
>>
>>>       bool "Zba extension support for bit manipulation instructions"
>>>       default y
>>> diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/
>>> include/asm/runtime-const.h
>>> index ea2e49c7149c..c07d049fdd5d 100644
>>> --- a/arch/riscv/include/asm/runtime-const.h
>>> +++ b/arch/riscv/include/asm/runtime-const.h
>>> @@ -77,7 +77,8 @@
>>>       ".long 1b - .\n\t"                    \
>>>       ".popsection"                        \
>>>   -#if defined(CONFIG_RISCV_ISA_ZBA) && defined(CONFIG_RISCV_ISA_ZBKB)
>>> +#if defined(CONFIG_RISCV_ISA_ZBA) &&
>>> defined(CONFIG_TOOLCHAIN_HAS_ZBA)    \
>>> +    && defined(CONFIG_RISCV_ISA_ZBKB)
>>
>>>   #define runtime_const_ptr(sym)                        \
>>>   ({                                    \
>>>       typeof(sym) __ret, __tmp;                    \
>>> @@ -93,7 +94,7 @@
>>>           : [__ret] "=r" (__ret), [__tmp] "=r" (__tmp));        \
>>>       __ret;                                \
>>>   })
>>> -#elif defined(CONFIG_RISCV_ISA_ZBA)
>>> +#elif defined(CONFIG_RISCV_ISA_ZBA) &&
>>> defined(CONFIG_TOOLCHAIN_HAS_ZBA)
>>>   #define runtime_const_ptr(sym)                        \
>>>   ({                                    \
>>>       typeof(sym) __ret, __tmp;                    \

