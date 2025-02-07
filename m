Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42FD23C8AF
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738946852; cv=none; b=cYQWm0EGcrxEwG9uSVrsD3eWBr/i4VSlAhoOH0nSMV3zvJxxOj7HnN4eJbX/l/FNbF/664rzj+2jUT/4alhmCGzh3364V2q/YfzPjlMZEKi9dp8bYoxZuMjjnJp5J/vPf6avE4/PZ6OQwIxX40p8YmTlUaqwmfhWnn8X6x0V6So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738946852; c=relaxed/simple;
	bh=D8f3I3u57FMCJdbJ+2fZicYbvIPNstPYGZHfFh8j61U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XOlkkS8GVUCYdMG13+tbGJUhnhXvzQf6bJMePeW9Fvkk1PPu5dSEuDSertZOs6X2UJwrsBkM/R84noAtmyYA86Gnt5EYBVyXNJJcC6lNzdug2mwK/9FeObQNNYLss9wPBOJMHnTV4y5HlG7VjtqV8jdBtxT4a7RQOYxl7XCbRK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=0/n1c7z0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="0/n1c7z0"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso15911945e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738946849; x=1739551649; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mObKPDrgbbB2sa+ai7pN9n6YG7DdsbUbGGmSesxPMyI=;
        b=0/n1c7z0MLlMSe6jox64LJDFptN8F9AzcZ86nAoBbuh4lWy0po7QWRIMbek/gTVE+O
         CfJAoVDPKizevjbr83TqJWAo0v1/3qhVBqeJlxcPdJy+0A339y+91HwEay5EJBC0loSj
         PIxzcJBwJqjCYxWLWIfY3WNP930Blwq8RuaXmDCfAIxbeP7Hhs70c0y9LPgJJRWy0UI8
         qA6ISirfuvKB4GzCUuUr+bF6bg8hKOt2h1XlbXztCU/U9CbIyf8qhLRZgWTQSYPqBJpQ
         54IcfiF7tX1pM8h5pGPwSK/3UMGfOC4QeiDwSYLOOXuBLt5hwx92/4cUb2FW2iFnjoCp
         wFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738946849; x=1739551649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mObKPDrgbbB2sa+ai7pN9n6YG7DdsbUbGGmSesxPMyI=;
        b=qMFy/XOioD7YNBNCoRo0cCibIGp4VevEMHJ+IEVHbWV75ph47VN/nvoXniufQ1mP1d
         2kADYlcPpSTPlMyTAupjsF8MNVBjWWtlb7zPXuQ/oY7ARQvIZaEKtfUZtmhyf2Dt995x
         zPLKN3/aFZzKR6mEBpodCkVacrTtwvoNIHxx8DvNtqR+B8dCH/zadjQlRmAkCeasdZ1p
         C+sYXx5cRGTirtXB1DW8X29toTzk8RqV0MjgmqUZtiBL9MT0/rLGKiG4WTixWg13mzwO
         rJHGSGT0tuZFqJP9Q7gaoSsm4kERW5Zhs6k7WU3dxFd8PnZpunMiS3lscDJWB6YJ7MyB
         /K5w==
X-Forwarded-Encrypted: i=1; AJvYcCVE5noW5xKiLRxyxrhsF/SNiMbjDyt+5jxMtM5GKMn7lMshFOLrx1dB/Fj3EdcJWzaL5Hp6kJjufLiwhmk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3d3491vKVq8ATYStOsV6fIHVNjH9iddrHsIjzFmHfpHLpB2zp
	qWPh8VMUe8dkNa5+no+SlV2s1GjrBHO4IYcQ4ekQLF4ZIGwvcQ9vReEA5sxUv8o=
X-Gm-Gg: ASbGncsy6ijftgBW2kaZVidk+WDz+CpTZEape/WSFhbc4ze9M8dbVZ2BT/y38T/GWAI
	TF4n8IItDGLw/Ow5vWsegKlj+9wRzqUsoAz5JkPtd4TSICvCfQLlxajqw61Z8hw1qg2dnZ8dLMO
	jTzXi9wfwbd6aPcjQ68zM7tx32efPzK1lfmIbJ7/G5QastHGm3a6dg4g1WLgqIvPdXhHo355yPT
	aQ987BDdCIgRJsNvf5iZCRAUj81Q1dLNM/bFPTrERL7UwmdWCVg9WCcoSUSAyTU4WkF+Ue7Z2F3
	QskwFjr4jk3kXgnkVvG+Ya9vEHyfoyg1wdov6LA3iIFG6aDmiOMwiTwV7mqf
X-Google-Smtp-Source: AGHT+IHbSBzgrshza944qaKfsddsDEGNt8e8obbQqx/m7m5MFlSaV3zdt5K9iS7U+vNir5tVLD9iTw==
X-Received: by 2002:a05:600c:1c07:b0:434:a315:19c with SMTP id 5b1f17b1804b1-4392497db5fmr36624035e9.3.1738946849155;
        Fri, 07 Feb 2025 08:47:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde0fd00sm4952013f8f.78.2025.02.07.08.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 08:47:28 -0800 (PST)
Message-ID: <1a4de5bb-913d-489a-ac96-3f4dec48cb2d@rivosinc.com>
Date: Fri, 7 Feb 2025 17:47:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] riscv: Fix riscv_online_cpu_vec
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com,
 jesse@rivosinc.com, Anup Patel <apatel@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-13-ajones@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250207161939.46139-13-ajones@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 07/02/2025 17:19, Andrew Jones wrote:
> We shouldn't probe when we already know vector is unsupported and
> we should probe when we see we don't yet know whether it's supported.
> Furthermore, we should ensure we've set the access type to
> unsupported when we don't have vector at all.
> 
> Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kernel/unaligned_access_speed.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> index b7a8ff7ba6df..161964cf2abc 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -367,10 +367,12 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
>  
>  static int riscv_online_cpu_vec(unsigned int cpu)
>  {
> -	if (!has_vector())
> +	if (!has_vector()) {
> +		per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
>  		return 0;
> +	}
>  
> -	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED)
> +	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
>  		return 0;
>  
>  	check_vector_unaligned_access_emulated(NULL);

Hi Andrew,

Wouldn't it be easier just not to register the hotplug callback in case
!has_vector() ? In which case just set all possible cpus
vector_misaligned_access to RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED
at startup.

Thanks,

Clément
