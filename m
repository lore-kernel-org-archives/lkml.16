Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A56521771B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749539793; cv=none; b=Z8y+PB4kShCXHP/I6ZrVkcLgHCHj3zbxYe+recWI19KRWa5QBo8td4VEHXkVS0NvlWV4CvFn8H7X63dYTnIBogwQ8ms3Mq0R50JOGDJV5zcuymQB2j0UKfFvI3Rsk4W9sHbdpJZSq5DgLq5gykgzjU+SkfaoztgFmGVe6kHgFHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749539793; c=relaxed/simple;
	bh=oPMBpP5P6NIqIid06Df4t2QTkR7jniqISJdnz+ZMnYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=j9aRpwLOBVUaaGoCcDfrk0Qq8z3Z7GBuAWGlTqKXOgjQapyOr+VIFoQvbGLaYMeIuBL4pUsol9p97kU1SB/5DL/6EKAwEDkEaPHEMHiRmEEhNM/WEhTmrIcx6gTys2aHzB0Huc9gRnFCpxlD5ZDYKmgLFm/sfAJirDdo3F7qUGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b=kcQrK5g8; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b="kcQrK5g8"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-ade76b8356cso133110466b.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1749539787; x=1750144587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a2eOazHVKyHkkCQfeGAzg5EDzBrF51Lt7JeIJ+TS1x0=;
        b=kcQrK5g8b4s6JFAUs40ACn/givVgvoOQ56MLcEIwXgJ2vY6GC8cgHi5xGTmzhzzqg6
         F5V3QAIIQTAxs2V5szcA75zsWIHnq8BhwcC6Y/UOAYsBVGhqwnbfk19rPmTlFtMNEjFa
         on+lBViHU5pVpECOUzaAa+6nzXF7yK1wlXsxj/YRdx3V5JdK6Pw50Gb6rd3cEJq9JTyh
         dnoysN2upUFgTCvXdrcZN6p7dImUEJOJAgIJ/SDV36lopdA8BR/9an5PI2QpGoVNSFNI
         CcdJg/TWTOGMTXI2+kIdi9ZWsm6Ln5aI0XnqhYOZkpZKpVekUbULhuKP6xls4UN0hAeL
         4oaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749539787; x=1750144587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a2eOazHVKyHkkCQfeGAzg5EDzBrF51Lt7JeIJ+TS1x0=;
        b=JdJ1/+KOANbqHot+GjukxMUfehjIFgAi4CftyYQrHJa7DH0qjToxeV05yn/kjuhQR9
         mpdoybaLr+zm/2inGJmtKkmsv9JE0A/Tb4w/Du0Vnns9cPqIZ5ij5D+NvVxaTLBuowUH
         4AdCxym49qKCOmz0+1jNfUt1KV1+AqjQFqGB+rAINaKpUopGG7u+4gKuMdAFtGd4t8du
         6b78y889Dq36C2hIskmhrorUiIpdw2ghtMopF/Kdt6tauBJKx5kKUVwdZxZIWm9Vhkez
         KTe9IHtlvZzyIUf3MkVgI9VpDVO13xIB/xzHBOkghHCLfiw7KlEZ4rtFHqaUtilQ6IVN
         SaRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmySItQi/Ls7niRytdY1y0kjKXaL+mOjn4h67Iv4+qVPEjZY5/ZxhZ6I82y0vDhAYH2CjRWfEX+ryNYMs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1jxOnN4IdB7gC2cMX/1sDkvJ8THGdXUmVdpDEnvTh+DZpBrWt
	X6sKgagNEUH6V+FOUYBOFuB7WQ6MUyRZujYldDuZ6JXmrj3K5fdG6BsUzTC6BHQEW/3S/Z6rTVM
	LS6i2G1op/2mnzw==
X-Gm-Gg: ASbGncuhqsWlpT4EhOwColFiYvYPYcj8MGtbeuXlK3icyn0xmIAU8XoSYhh0QRdDUsb
	DIYL8rDYnXgm9dSYCjQ5laR2bUXxaTyTWoODp+4LDe9Rdb3Nvts9eiKvZWYToPwHNCN3SX6u+Ni
	/YmLHleqfTPYwVx5hg6c8YOPcKLtrE/sQf7uxlHM/7bjY0ImiVfvk7BbQb11smNx5oLSSta6r1A
	YoGf6B94kcYDBSSC48sA1tN5AaYITj4OkIXbD0/vQMA+p5u48rdc8pTrEoWCN1Nfdk5NuwAtHBr
	JNP1a0FtVR2ZiNc1aVA6Us33L30SRsNDIyTJjcBgeqQd/VEs0yKS5rW2O8DgA5qIJhziHOddoA4
	z2GYeqQdRsTF4
X-Google-Smtp-Source: AGHT+IEUmqEKlXlfVwWa8c5JShggmNPnxM0Fr3epL1+mL84SHGuE9T13CIVpM32Ur9+rkThXz+PhbA==
X-Received: by 2002:a17:907:7ea4:b0:adb:300a:bcc0 with SMTP id a640c23a62f3a-ade1a9c8279mr1537526266b.46.1749539787197;
        Tue, 10 Jun 2025 00:16:27 -0700 (PDT)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc3a609sm679041366b.145.2025.06.10.00.16.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 00:16:26 -0700 (PDT)
Message-ID: <f8ae0c3a-ac83-4840-823a-d24fcc456c11@monstr.eu>
Date: Tue, 10 Jun 2025 09:16:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] microblaze: fix typos in Kconfig
To: =?UTF-8?Q?Ahelenia_Ziemia=C5=84ska?= <nabijaczleweli@nabijaczleweli.xyz>,
 linux-kernel@vger.kernel.org
References: <2pg4pexvl2guyww56tnjrt3hjsb6bqtccmpkzt42sqz3igcq56@tarta.nabijaczleweli.xyz>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <2pg4pexvl2guyww56tnjrt3hjsb6bqtccmpkzt42sqz3igcq56@tarta.nabijaczleweli.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/4/25 14:18, Ahelenia Ziemiańska wrote:
> optimalize -> optimize, these configs turn the functions on instead of
> allowing them to be turned on, consistent pluralisation
> 
> Signed-off-by: Ahelenia Ziemiańska <nabijaczleweli@nabijaczleweli.xyz>
> ---
> v1: <f6e465fee5a824a67be1ae7c3bc1b72adcf9471f.1746558529.git.nabijaczleweli@nabijaczleweli.xyz>
> 
>   arch/microblaze/Kconfig.platform | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/microblaze/Kconfig.platform b/arch/microblaze/Kconfig.platform
> index 7795f90dad86..9cf9007ed69a 100644
> --- a/arch/microblaze/Kconfig.platform
> +++ b/arch/microblaze/Kconfig.platform
> @@ -8,10 +8,10 @@
>   menu "Platform options"
>   
>   config OPT_LIB_FUNCTION
> -	bool "Optimalized lib function"
> +	bool "Optimized lib function"
>   	default y
>   	help
> -	  Allows turn on optimalized library function (memcpy and memmove).
> +	  Turns on optimized library functions (memcpy and memmove).
>   	  They are optimized by using word alignment. This will work
>   	  fine if both source and destination are aligned on the same
>   	  boundary. However, if they are aligned on different boundaries
> @@ -19,13 +19,13 @@ config OPT_LIB_FUNCTION
>   	  on MicroBlaze systems without a barrel shifter.
>   
>   config OPT_LIB_ASM
> -	bool "Optimalized lib function ASM"
> +	bool "Optimized lib function ASM"
>   	depends on OPT_LIB_FUNCTION && (XILINX_MICROBLAZE0_USE_BARREL = 1)
>   	depends on CPU_BIG_ENDIAN
>   	default n
>   	help
> -	  Allows turn on optimalized library function (memcpy and memmove).
> -	  Function are written in asm code.
> +	  Turns on optimized library functions (memcpy and memmove).
> +	  They are written in assembly.
>   
>   # Definitions for MICROBLAZE0
>   comment "Definitions for MICROBLAZE0"

Applied.
M

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs

