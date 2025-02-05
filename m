Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894A3215778
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 23:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738797815; cv=none; b=LWvjr3Zd4jUzn4zbXt4IsRR23psISiYEjWOl69oqS0NHYKYnEVtHPj/ZoNnU0/pQhAEQy6wAkCD4sqcmm+VLaUtR0HuMb4bDiPsLgFt6deZXl3ZkfKttp15VvYFn49obWmiyWfMtkyZHArJlcP7ALrF4mvxlMi4DlkWxRBYt+Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738797815; c=relaxed/simple;
	bh=G+TXOunIv3Tr9PBEmAzSP/MWMhll2+g/orEIcMguvVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hcB9rIGYxIHSg5YUX1eVDKxM9yW79Csyt8d6mHCiw7MtUDcUdBDzLggOu/LuFTM2JzxuwUUf7uRS7sttAO1eMcp8ZL1U4rRx1nHBMvsp7LT4G9/q6rjJCSozjf6upIGQwvihxkJ4MHRphirwD9S0J+b5FJhm/G5n3KxQU1P4bMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA0CB1063;
	Wed,  5 Feb 2025 15:23:54 -0800 (PST)
Received: from [192.168.20.16] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D51523F58B;
	Wed,  5 Feb 2025 15:23:28 -0800 (PST)
Message-ID: <86bee3f3-acf3-4b3e-ad9c-e7d021355214@arm.com>
Date: Wed, 5 Feb 2025 17:23:26 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] riscv: Use of_property_present() to test for
 non-boolean properties
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Sudeep Holla
 <sudeep.holla@arm.com>, Sunil V L <sunilvl@ventanamicro.com>,
 Yunhui Cui <cuiyunhui@bytedance.com>, Steffen Persvold
 <spersvold@gmail.com>, =?UTF-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?=
 <mikisabate@gmail.com>
References: <20250205143903.413959-1-emil.renner.berthing@canonical.com>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <20250205143903.413959-1-emil.renner.berthing@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/5/25 8:39 AM, Emil Renner Berthing wrote:
> The use of of_property_read_bool() for non-boolean properties is
> deprecated and since
> 
> commit c141ecc3cecd ("of: Warn when of_property_read_bool() is used on non-boolean properties")
> 
> a warning is displayed when used incorrectly. Fix it by switching to
> of_property_present() as recommended in the same commit.
> 
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>   arch/riscv/kernel/cacheinfo.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index 2d40736fc37c..26b085dbdd07 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -108,11 +108,11 @@ int populate_cache_leaves(unsigned int cpu)
>   	if (!np)
>   		return -ENOENT;
>   
> -	if (of_property_read_bool(np, "cache-size"))
> +	if (of_property_present(np, "cache-size"))
>   		ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
> -	if (of_property_read_bool(np, "i-cache-size"))
> +	if (of_property_present(np, "i-cache-size"))
>   		ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
> -	if (of_property_read_bool(np, "d-cache-size"))
> +	if (of_property_present(np, "d-cache-size"))
>   		ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
>   
>   	prev = np;
> @@ -125,11 +125,11 @@ int populate_cache_leaves(unsigned int cpu)
>   			break;
>   		if (level <= levels)
>   			break;
> -		if (of_property_read_bool(np, "cache-size"))
> +		if (of_property_present(np, "cache-size"))
>   			ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
> -		if (of_property_read_bool(np, "i-cache-size"))
> +		if (of_property_present(np, "i-cache-size"))
>   			ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
> -		if (of_property_read_bool(np, "d-cache-size"))
> +		if (of_property_present(np, "d-cache-size"))
>   			ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
>   		levels = level;
>   	}

This looks sane to me:


Reviewed-by: Jeremy Linton <jeremy.linton@arm.com>


