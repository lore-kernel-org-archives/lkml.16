Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0376C25F78F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744098777; cv=none; b=bo8q9HnEde4kG8rjrIiwbEzI1nTYS1CEZULQ/gteDdGUae7FKRSYHBRgF2CzAbczxiUIiY4TuNma9C8Zzs05Q1p8LrMm0Vbq52xUDLVUvxR6vzMBJ1sPv50PBi3bDREOF8a/nKSSd9z3RtJafCOxu5YifMGWOnU8+bnMxjqOo3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744098777; c=relaxed/simple;
	bh=CTsItxJL+eAetG/isG1aUgyaeY2KhExTdrxot2RtR78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jUQ9KBNkf6Rf+ZNas+oWZvx/lhOT+0aYYIBqjIALwcbiFu8KgtmNq+qeyblfDY3cpy65pcQHrAjuLH24opuxVM1Pz49qswEKPMjHabXNTcY5Nf4q3nOV908IqPtHOmk6Cnu93NGyYc7CUgjZPk7CCQHQNL2ehodfM+dGAnebMxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bR5YL44z; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bR5YL44z"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c266c1389so3688068f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744098773; x=1744703573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VjqzmMMacWbqnYleHoXhpQrGKOlADT8P8Fl3BGcFhsk=;
        b=bR5YL44zld3EMthCyGntjPuWWVshcp2NhQSxYhlg6yAtAMHcMLzH+WwJBrhf6nBoob
         knCErgGn+jukq0pxMFm1XVDTh2vox5aJbKJDk2k5X0joNqrJJbWlhdliLsrrnOwoSPvA
         HfvLiD2hRsZV8CJaKByHn549MqtNxiGkI5IbKhWGZp12ZM+f/ukccKSDl6x8z4HaTh8K
         QgfZ8dsSRHlKyDdQ1HAxB714b6FP2wvVKIn2QIEUpuVu+PBV6dDPYqWlKRSve8aOAigF
         8uIONxyneu8QjewgBZ0a7bgrA7FdJK+PtzhePGE8aY932MDTBOSZk5li75vbZ1eeh0FW
         43FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744098773; x=1744703573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VjqzmMMacWbqnYleHoXhpQrGKOlADT8P8Fl3BGcFhsk=;
        b=Fy5GrsPHedMMiSm5YIApXuPow0tADGygHhoL/lfneIo8B2Zv2iwOKvaL5qUxeosKZ0
         xtwG2tL90VVLx5oDXBGzmu8p3RqSuB4Pn/ZjHKPifspTXJ8qdrsWW6QB6tQ//vx0sjYb
         gqbv7EECxzlkC/PxCjX7x5ls36xvawaRH10eZAaTN3EI8cE4Tx1ArApxa/vaOfg7EE75
         dKsm6VCLQSJ7fy9dVosnRXXfRn98frkS638chM8AYSADPIP66onpzGz4FKb2NEECxSu/
         yC5izyviC/VISFMs5xCdfZKmHelPIdRI0YqlQGJhe/J38UauuTTJAJOlkyI3Pu9eMjx1
         LHiw==
X-Forwarded-Encrypted: i=1; AJvYcCU8+4lWmCizHbZGhXiQC6pvBN4wIj9KcpxuF+py+HfJomawcbyj2gIwM53dsBdIIUG6VT3beqqfCW82KAM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXJSFy2eCllqay6gQzXbGefvmpX2TEcE9k1SPMNkwR7aQkuhYh
	b9cffyG3+BEU7Yapw7ZkW15Bzbh/DBSQGUW9SKYEfUyZzUClZ05kCmmrkk7CUOM=
X-Gm-Gg: ASbGncvNHfac2rvugskpUgEhH5YL+uztIgodRyygdGetGQ+CK0wa2au7oFxjZI3h7wR
	YPnzEnH4due8pVP0/cVWBZhvHpORoKWTc6XodSoAkiVjyi2nwbkVusQHHcPaZhgIOCaWlfwJRxI
	d+FPFG2peef7OjcXXvTIEFv87+Wk6WDt+7oTTbaz8V/5utOAE0+7zvDuP370Jcx1SL9Zp/t7vTC
	YCyqP+dHX94rG/3II39z+rzbswjY2Nx26T+rKmXyy/YyuBxSw/nX0MisGYMNbKd94prc/PudmmV
	7RtAtGMxL1Hmdny5y9LFEHQUwxDSAYwNJGMBy0vLV5RJQf0978rgg4hg1pYO/iJlo3lCJf7w5Q=
	=
X-Google-Smtp-Source: AGHT+IFjPNgRl4VdkKERBfDPcS8BhfY+2C/V1T+Jsm5dqC+mD8MANyETkIFS4IOMCADrnAUsLmNxeg==
X-Received: by 2002:a5d:588f:0:b0:390:d6b0:b89 with SMTP id ffacd0b85a97d-39d146622b5mr11257778f8f.50.1744098773275;
        Tue, 08 Apr 2025 00:52:53 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43ec169b4e4sm156238455e9.20.2025.04.08.00.52.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 00:52:52 -0700 (PDT)
Message-ID: <206d1405-5a8b-4f2a-8545-458c88345a41@linaro.org>
Date: Tue, 8 Apr 2025 08:52:51 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 RESEND] nvmem: layouts: u-boot-env: remove crc32
 endianness conversion
To: "Michael C. Pratt" <mcpratt@pm.me>
Cc: Christian Lamparter <chunkeey@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, linux-kernel@vger.kernel.org,
 INAGAKI Hiroshi <musashino.open@gmail.com>
References: <20250405045617.26106-1-mcpratt@pm.me>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20250405045617.26106-1-mcpratt@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/04/2025 05:57, Michael C. Pratt wrote:
> On 11 Oct 2022, it was reported that the crc32 verification
> of the u-boot environment failed only on big-endian systems
> for the u-boot-env nvmem layout driver with the following error.
> 
>    Invalid calculated CRC32: 0x88cd6f09 (expected: 0x096fcd88)
> 
> This problem has been present since the driver was introduced,
> and before it was made into a layout driver.
> 
> The suggested fix at the time was to use further endianness
> conversion macros in order to have both the stored and calculated
> crc32 values to compare always represented in the system's endianness.
> This was not accepted due to sparse warnings
> and some disagreement on how to handle the situation.
> Later on in a newer revision of the patch, it was proposed to use
> cpu_to_le32() for both values to compare instead of le32_to_cpu()
> and store the values as __le32 type to remove compilation errors.
> 
> The necessity of this is based on the assumption that the use of crc32()
> requires endianness conversion because the algorithm uses little-endian,
> however, this does not prove to be the case and the issue is unrelated.
> 
> Upon inspecting the current kernel code,
> there already is an existing use of le32_to_cpu() in this driver,
> which suggests there already is special handling for big-endian systems,
> however, it is big-endian systems that have the problem.
> 
> This, being the only functional difference between architectures
> in the driver combined with the fact that the suggested fix
> was to use the exact same endianness conversion for the values
> brings up the possibility that it was not necessary to begin with,
> as the same endianness conversion for two values expected to be the same
> is expected to be equivalent to no conversion at all.
> 
> After inspecting the u-boot environment of devices of both endianness
> and trying to remove the existing endianness conversion,
> the problem is resolved in an equivalent way as the other suggested fixes.
> 
> Ultimately, it seems that u-boot is agnostic to endianness
> at least for the purpose of environment variables.
> In other words, u-boot reads and writes the stored crc32 value
> with the same endianness that the crc32 value is calculated with
> in whichever endianness a certain architecture runs on.
> 
> Therefore, the u-boot-env driver does not need to convert endianness.
> Remove the usage of endianness macros in the u-boot-env driver,
> and change the type of local variables to maintain the same return type.
> 
> If there is a special situation in the case of endianness,
> it would be a corner case and should be handled by a unique "compatible".
> 
> Even though it is not necessary to use endianness conversion macros here,
> it may be useful to use them in the future for consistent error printing.

> 
> Fixes: d5542923f200 ("nvmem: add driver handling U-Boot environment variables")
> Reported-by: INAGAKI Hiroshi <musashino.open@gmail.com>

CC Stable is missing.

--srini
> Link: https://lore.kernel.org/all/20221011024928.1807-1-musashino.open@gmail.com
> Signed-off-by: Michael C. Pratt <mcpratt@pm.me>
> ---
>   drivers/nvmem/layouts/u-boot-env.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/nvmem/layouts/u-boot-env.c b/drivers/nvmem/layouts/u-boot-env.c
> index 731e6f4f12b2..21f6dcf905dd 100644
> --- a/drivers/nvmem/layouts/u-boot-env.c
> +++ b/drivers/nvmem/layouts/u-boot-env.c
> @@ -92,7 +92,7 @@ int u_boot_env_parse(struct device *dev, struct nvmem_device *nvmem,
>   	size_t crc32_data_offset;
>   	size_t crc32_data_len;
>   	size_t crc32_offset;
> -	__le32 *crc32_addr;
> +	uint32_t *crc32_addr;
>   	size_t data_offset;
>   	size_t data_len;
>   	size_t dev_size;
> @@ -143,8 +143,8 @@ int u_boot_env_parse(struct device *dev, struct nvmem_device *nvmem,
>   		goto err_kfree;
>   	}
>   
> -	crc32_addr = (__le32 *)(buf + crc32_offset);
> -	crc32 = le32_to_cpu(*crc32_addr);
> +	crc32_addr = (uint32_t *)(buf + crc32_offset);
> +	crc32 = *crc32_addr;
>   	crc32_data_len = dev_size - crc32_data_offset;
>   	data_len = dev_size - data_offset;
>   
> 
> base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
