Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A3D20B806
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317227; cv=none; b=UFMPQ9M+OvuxNyjvoPmhFNJAsuzdp5zSbKqbWmO6UlDGSWt6MVBgF2iN4mIGQkeYhOfx2dvsq6WERFp0k1BH171XFE0EFq9OMxIjJ5KwMP1GRYPFCF5MiXIcWl1QGBw02f4wuzOs7yL6BfKiq+y8l55c5lZYVvIZM1ZRP7tNnR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317227; c=relaxed/simple;
	bh=YdbfQlGUGOXyKhbsXVQD8RS/6LOk2JpRZ6NF2vcjmBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AW+QasMqKwLJbRwqCbvfrQ1X8GexhtPlTl5ly2ER2ycGedj0M6IBTHXenn28bd31BNKBj6b6yN8xQWn0q0/kB1X15XVZB2yL4vKZ1IWbeOo7QAfCxZoy1sBCbmgm5gKUfkUoAj+Sdnhui18Y4eR+mYomnTvI9NrPolN/RMr9fYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B3UNRDiL; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B3UNRDiL"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c14016868so4891393f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 03:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745317224; x=1745922024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bj+0Q+EB1V2pPyRxQBEmN/DJlQu1UVnuS3zStM7Ud70=;
        b=B3UNRDiL/vCQHPLqFZZQGksG8JMLq/5huJH9aKhaXZk47+BYBRo29l7XmERCF/cZak
         nAZ6SDurrDgzqxirMEkoa3n2j0QIZ9WMBJmZrD1NoHZ/NDPxb4Un6H6IPN8M3mIgfX8Q
         pTW3rU0YQ8AQZUG0V6RnwOAB8zcWmNJJEvY7luhINwQO0D1O1fqMj/YnO+THyl72875d
         jhZvGTNQJ46h/hjHP/YyU/w3b2eziKMs34yzEUpzovYRxsIbVXHFRQ0APMh6anfJ5kh2
         Nj8ORoQMDyocM8Q6Fuo0znL3qushiAOpqUfEFrbd6u7p3Z1SeB91ATeh5s1OPtPdAhnu
         ZBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745317224; x=1745922024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bj+0Q+EB1V2pPyRxQBEmN/DJlQu1UVnuS3zStM7Ud70=;
        b=cvzr7ozDEpPfs1TiDgh01HsujF6ZR1HaWWQAlKITMktT+t/74B+wSEb8Ph2Te/XYF1
         miHvsFdj0jadec1Oer3E73XBdX5xldYnq1SwNRnaZnL3bGIFnRuplEaTOOQkxe3Obi1x
         IxdDxqFrBAPvxMjdIL+/FYsG9VcFfwXI84eDBiRs4tk0+3tboTObWsP4QiejtdMbE/dk
         N+SzAPSPtw6SEvj0/szgfd1lywN2frpOIPYHAR4lm+1A67dsnals447Ku7fe0BjwOLul
         udpIJan9hb0iWJxnahMAbEih0wcSfpPTm4rhy5qAfU69BBEQsBJS4HYoYvw/KzzCN32b
         X3pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuidNqTLNReDkWWiWFfwAyJE4KE1EAEVJGdAS67uo5ougZcFoZTxZ9ZwENQGi+h9HCrG0kGHvOAprGqSI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzrbcoiZH3vChAEN38h2+TqkML52av5+4c61kBiYtANtKefKnh
	3sqhpb7HruwKVqElqRfj4bCs3lqCH+d37aktij2Op44ynOOKuFl8XvAgCjDZ0CU=
X-Gm-Gg: ASbGnct2xi0uBXXmnEX/2JIxXTtBoFsMZ0j0Yjrqxg4LjZx3MusNTvVTDI4oJu2t/a8
	UZ3ocsA65p9Z2yiNi3codVvGbIOKv1KQUq1n8ifBjbP5Zw7UBeuj3AcYNtWMovIkBKUC4wiE7oU
	v00aFobHtEZiuwwzRC469jLPW3t2Ur0zVTgiAp7svxIpKv62ykpwp4d/kbcNvO12ji1crQwJeMY
	VFx2CaqAjyV970XnoxF7lq933xWAxQ9w6ikr3XB97RVj+Jkjl5HL1EomPKTGbUG7V1twfUJ1G1d
	Pv/eWylkgPLzwuGFAF15ueJ6D9/ZnRyfO1tzoJGgGWotSccC+SUyHkYdi6ulTN2QJJGTgF0+f2g
	yLOOoQ1qO
X-Google-Smtp-Source: AGHT+IExxiC1/7BEDxlUOLO/mtxEuxbqvG4oZX6ER4Jw2XdzzKvzbDTjBvuvcHjBv9h1dlP2oFw8qQ==
X-Received: by 2002:a5d:6d88:0:b0:39a:d20b:5c14 with SMTP id ffacd0b85a97d-39efbad3217mr11799503f8f.36.1745317224351;
        Tue, 22 Apr 2025 03:20:24 -0700 (PDT)
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5acc5dsm171044195e9.9.2025.04.22.03.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 03:20:23 -0700 (PDT)
Message-ID: <fff7f6f1-8fb6-4ff9-8f13-cf0e2a9ecb1a@linaro.org>
Date: Tue, 22 Apr 2025 12:20:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] riscv: Fix typo EXRACT -> EXTRACT
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
References: <20250422082545.450453-1-alexghiti@rivosinc.com>
 <20250422082545.450453-2-alexghiti@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250422082545.450453-2-alexghiti@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/4/25 10:25, Alexandre Ghiti wrote:
> Simply fix a typo.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>   arch/riscv/include/asm/insn.h | 2 +-
>   arch/riscv/kernel/vector.c    | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

