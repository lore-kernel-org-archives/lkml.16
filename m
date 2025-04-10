Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05790284B5D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288462; cv=none; b=kM278XHZPW2YcoTNyIn7QXvG+ZAee/bdg51qK4W+NrrlI7Ofeb9S7Boe7UDDvA62cDZP8T98iQZcmgIbL0q/x28CVj60YV9c381jZ5OMI2XvqSz0J8O25FM7DRP3bmpgJw29gOUVwwY+uENB1vIRjdtGAaVUUTeY8qIYhGrPrVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288462; c=relaxed/simple;
	bh=8mfRqLvLgRotWJCcT9Cz8kGYBSu9kBsAWuuTYbB644I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ojv02Tdi+1UA1prA8apSasHVWNchrM8H2N44IPrnJmnfr22cEdjFPUtjf8+lss1B6ZrM2rjl8XmPsgTehrsFdNae937BE7tWKHwbY+qM7Bm/Wg+MrXsi4NAgm/LX/Hajl4uEQFPguLvqZUy1U/KUNO8D0Im6n93sRJ6cRZKM3e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iMJtyGTT; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iMJtyGTT"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43690d4605dso6202105e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 05:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744288459; x=1744893259; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0pxhhLeX4Bn01k1sSXCLRWiTuTUq5Ae/HRBR2bBu/SE=;
        b=iMJtyGTTFY5v4KmE57YPKIny7XXwdTPFdUY/zErFLK3+RdrHfmUZgLlYDwdc7gfLyc
         wtvmjR6K29aQIGirys8xQDqrckfXAKLryo4OEE86oha0Zaw73GVOHjxFBkxZVJvnVp3W
         bJKGzXr+mWMvfOg2jdezHOQXrWWR2bLQ56FeeOR+9UmE00ftQ5uT83+trjnFlMb24lH8
         ltv0ww2cg2HzIpTSd8bxxF6PEtkl1xJus65+i+T+TJvgbFwwGAEeqJjEDw3JPqI5N8Yw
         RcF7/06xfdIjml8k0QwNx/GMSfA6QnQte+LhtCBd+hXhWW57rXneVyrb1il0YnuVsDvo
         vi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288459; x=1744893259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0pxhhLeX4Bn01k1sSXCLRWiTuTUq5Ae/HRBR2bBu/SE=;
        b=SG1jFd/wzFGr8TMFLAmK1GS3f7lZR0zRH66ZH5YgEce2c3pm7wuRQHjLg27u0aUCaL
         dcguhpatYRNBuP0DGPXbge071WqRmA1qp353lQrG6bIPVREUICgNoIrCjdfoCqvj+Ho1
         RaUkHivSv/ALcHF4itsLUxjXIDN63L+rmNlDoNSJISFxiOYtrlkXGOpgT1Zv+Mhsw6Hh
         y2XidfvXoPZX7fO8xinErlszyggYnGNfYxbTAgh/gl8YipxMXa0Tynqr0OCPGDGMkgg5
         RDoNUa/16SZje09BWpdjHb8rh/RMWXR4dP6qhJBqFPdrCW++lIwF0P3B2D6NJ7zGJgkB
         L2wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJevxhGdggyz+/4wHYwOHekJRII4V9pB34sq7uEyQFng1pZXQi1nghgDPUhQ6IiJf9jBkSsjaIO14a3oQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsPlGGmO7N/Yd1BdMF4bZaX0iQyCsEOkkgXD3uxpdMIStSisEc
	JvlsKzsAEdGzc4k9f30nLNXyVLGIIqyJPtuMFaZdRdKB78+2tAvMP+nM1/9Sy+0=
X-Gm-Gg: ASbGncu6KqGml0qq4FMXQh2FetnZsonsjhjKJKTC9XJunQhLmHsPUdVOmSsjJyHYUSB
	plWCaQgPoKqt1tbd8eR66DDx9Q+JchSBwYK9pB1xJirSJ3Cr7I4CJRXboGsmicv1ic2IaJ8OUOM
	B4QNS5SwmoCRuzQtMrKEJjqTzojMLwItsfjh2DzH2d8eist1HFih+YTT93wYxZYOaSUEPVCuMGW
	sMqXuanYohHz5zJ8IjI5DExyszhDS6s7ZmnJCrVIigZFCExOECiNSlOmZEK1pBNIK/cYRbwN+/F
	pxHpXE/RFVhL/jcYL3K9SmlbXhN2hFxm3gKsq6L+aJ5z6QXL66RgNw3QPFtvlpg3DFKD9awyiFy
	OjsFgQGGUTgWO/A==
X-Google-Smtp-Source: AGHT+IGHSO33i5/vntPYjryZpYO+a8zSBqy4zSbBHLFgNSqa/DrJndjZWx8aL37V3WTtCc01VQ0umQ==
X-Received: by 2002:a05:600c:4fd2:b0:43d:7588:6699 with SMTP id 5b1f17b1804b1-43f2d7ae780mr26011325e9.7.1744288458981;
        Thu, 10 Apr 2025 05:34:18 -0700 (PDT)
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893773a0sm4659997f8f.25.2025.04.10.05.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:34:18 -0700 (PDT)
Message-ID: <8dcb5c6d-be4f-4891-a999-137d53edfc05@linaro.org>
Date: Thu, 10 Apr 2025 14:34:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] MIPS: dec: Create reset.h
To: WangYuli <wangyuli@uniontech.com>
Cc: guanwentao@uniontech.com, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, macro@orcam.me.uk, niecheng1@uniontech.com,
 tsbogend@alpha.franken.de, zhanjun@uniontech.com
References: <11740B01E659CAFF+20250407073158.493183-1-wangyuli@uniontech.com>
 <8E88DD5074AF3B33+20250407073622.495364-3-wangyuli@uniontech.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <8E88DD5074AF3B33+20250407073622.495364-3-wangyuli@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/4/25 09:36, WangYuli wrote:
> Declare externally used functions in reset.c to resolve compilation
> warnings.
> 
> Fix follow errors with gcc-14 when -Werror:
> 
> arch/mips/dec/reset.c:22:17: error: no previous prototype for ‘dec_machine_restart’ [-Werror=missing-prototypes]
>     22 | void __noreturn dec_machine_restart(char *command)
>        |                 ^~~~~~~~~~~~~~~~~~~
> arch/mips/dec/reset.c:27:17: error: no previous prototype for ‘dec_machine_halt’ [-Werror=missing-prototypes]
>     27 | void __noreturn dec_machine_halt(void)
>        |                 ^~~~~~~~~~~~~~~~
> arch/mips/dec/reset.c:32:17: error: no previous prototype for ‘dec_machine_power_off’ [-Werror=missing-prototypes]
>     32 | void __noreturn dec_machine_power_off(void)
>        |                 ^~~~~~~~~~~~~~~~~~~~~
> arch/mips/dec/reset.c:38:13: error: no previous prototype for ‘dec_intr_halt’ [-Werror=missing-prototypes]
>     38 | irqreturn_t dec_intr_halt(int irq, void *dev_id)
>        |             ^~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[7]: *** [scripts/Makefile.build:207: arch/mips/dec/reset.o] Error 1
> make[7]: *** Waiting for unfinished jobs....
> 
> In passing, also correct the include file ordering in setup.c as it
> doesn't merit a separate commit.
> 
> Link: https://lore.kernel.org/all/Z8A0JeFYfBxXOFCD@alpha.franken.de/
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>   arch/mips/dec/prom/init.c         |  3 +--
>   arch/mips/dec/reset.c             |  2 ++
>   arch/mips/dec/setup.c             |  9 ++-------
>   arch/mips/include/asm/dec/reset.h | 20 ++++++++++++++++++++
>   4 files changed, 25 insertions(+), 9 deletions(-)
>   create mode 100644 arch/mips/include/asm/dec/reset.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

