Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6B824C09E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 13:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750339406; cv=none; b=pu8F1UzCcs/Q7p3Oy4ZWuFEX1XgREuAKW6RdMdMSIZTQntyI1NKJGCXWWyIXOmDdDtAuAz7gOBWIiZcUdI0l2akKa5uqKQ8s4zcPZRP/LayF48Jc3PE4vwng9DI79EOxUr7QCerVbvzYH8qkEBevLWmvsGoWfCRHvG7G7X3t5xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750339406; c=relaxed/simple;
	bh=1VIncuOXKXIdppmIXOnXByGjjj43tUTod0CayZIPC38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aXwKAtH3mc48CDwbJBHHq/LYGQPPcwO4n3coCDc3VBy6ayUBPwlQuyqgro0Qb0Ptee6YLlkVQFFGH7W/mLaxdFSkKqyC0LT9sFHl25i4445CYShzinlIF22e9waEkrjhCcEPtMopcqnMLXmOlIrD9QGjkf2uIKV7Sr1PTE05XwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=xNf2PZZu; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="xNf2PZZu"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-40905ae04e4so191513b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750339403; x=1750944203; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/8CfBC2bXTzgQwWZYshC/feOH//kuqxuZpnRg/tZqBY=;
        b=xNf2PZZum0GL45x+L+CeiHfBIEe41ZVccD7eabWd8ZrRHBayi5DgLcn5BS/N8gQn65
         fNmI1n80juTpaxIzyV7R3/5JnGCT3bbpXRhSmAzBceN0hEDEADX5ng06KEALhSHdIqDH
         MEd4ldtzFn5ffNmtLsYgOBpvOg6lrQckUBT9TXekwA7jcPu0rsB3ie5JY7pOLx9WdySa
         EW65KKsu1bbv0nUioa8WTzRiMVQ+XbXBxMDdJrakC+8V2OsEZhH3TkrDx2SkcmUKH5mO
         BrGsaJdkmERI/KjeecvPqcnMI0bFI6jch1UJzx7B4xgOlfp+vl6JoWm+HgbL8oN3oVhz
         t9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750339403; x=1750944203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/8CfBC2bXTzgQwWZYshC/feOH//kuqxuZpnRg/tZqBY=;
        b=UBIl6wCqbO6F4bonziarxuEAflqcCrY/zCCNRyzaiPmIc35hpw0Ws5r+YlPHEpZ42W
         eZyWpuFaWIZzBshPIoezQiYSayMlgljCDlOqB5JmFtTkxp67GX5+ZgwB29EZ4/jU+SdJ
         O5wG7Zlo83dM93Mpv4TdVaez+MfYuXho0RlL+ohU0OSoxYNhJLQypDZ0mws2BHm955Ae
         TTv+QlN0NDL7K9AvUgEJCG07Az8l0Es51OQqw9FtSOLfL4pDGFL4GXu4+p63oqZOqjNy
         PHbvThuBic0i9v8pqpVp+MQKvHUjsr6JCub2PXAZI7yOMNxXaXPwrIeVy+Q8K4BJL22G
         lSTg==
X-Forwarded-Encrypted: i=1; AJvYcCUNNrAkPX+9oNU9u5EyTf4zDUKBF19Ies5M9pIVcifwBKZoLAsSJGWv3u7LBXaSidH0rYpumjY5B8esrdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRsnRgv3sXByGbohR6OQzsQNYuB7BA+zVxrNBiEg6WRU5Y9nXB
	1RZbu6Z8rcA5SnRcsrdEH6DNtL2JDGOinENRvXWHs5dHEr5JfJ2TbV36yRWMEC9OAxc=
X-Gm-Gg: ASbGncsNBT87gw4v04M/ZWGHRthZii8eI2dcO48eP8y8nh9r2yu81E27tTbEgDWJsy1
	RTGGXOMlT3z2TMMw7oTO88UEgmfNeJxdRaxENYzQ5kSkkV9Jwm86IvAZki1aEfGC+GnY2ufj3IW
	99siifNRsR0B9/BNbDQBViefnWrMAW4axwB0XjpWnZes30kyr3JYA3qxMxxmzDhFINHRnDIuRD/
	M47lwJL2decXKMSgmlx/VaCCTnINjMzgybeGnLnANDDLWHj/8F9q6j9fxog60cicHEpc70JF/te
	RHMvmyD3TCrPpfn51JXXlfiBuhoka14+yegwN/mfuvx4aRlQn+NTXu6sq537usSxavHBFCGNz5B
	qjk+xCD3MTG26DaeqG6wbFH2klw==
X-Google-Smtp-Source: AGHT+IGY28hFmDr7ULoWj9fl8QS8bDjzI+smc76lgSZ1x1dv+k82B0BpK2D8Bz8W0iYI/okzRPVkRA==
X-Received: by 2002:a05:6808:2128:b0:3f4:1c2:874a with SMTP id 5614622812f47-40a7c23eabdmr13775263b6e.24.1750339403015;
        Thu, 19 Jun 2025 06:23:23 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a741b8837sm2759463b6e.46.2025.06.19.06.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 06:23:22 -0700 (PDT)
Message-ID: <13cd66da-dff4-4985-989d-d757fbae99e7@riscstar.com>
Date: Thu, 19 Jun 2025 08:23:20 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add support the SpacmiT P1 PMIC
To: Vivian Wang <wangruikang@iscas.ac.cn>, lee@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-2-elder@riscstar.com>
 <123a7558-fda9-4b56-b6ae-a29d704419ac@iscas.ac.cn>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <123a7558-fda9-4b56-b6ae-a29d704419ac@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/19/25 1:03 AM, Vivian Wang wrote:
> Hi Alex,
> 
> Before the patch body, there's a typo in the subject line: "SpacmiT" ->
> "SpacemiT".

Thank you, I will fix that in v2, which I plan to post today.

					-Alex

> On 6/14/25 05:01, Alex Elder wrote:
>> Enable the SpacemiT P1, which is an I2C-controlled PMIC.  Initially we
>> only the regulators will be supported.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../devicetree/bindings/mfd/spacemit,p1.yaml  | 86 +++++++++++++++++++
>>   1 file changed, 86 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
>>
>> <snip>
>>
>> +
>> +examples:
>> +  - |
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        pmic@41 {
>> +            compatible = "spacemit,p1";
>> +            reg = <0x41>;
>> +            interrupts = <64>;
>> +
> 
> (Not really a review, just a note.)
> 
> I couldn't believe it at first, but it looks like the SpacemiT K1 really
> does have PLIC interrupt 64 dedicated to receiving PMIC interrupt [1]
> over pin "PMIC_INT_N".
> 
> Regards,
> Vivian "dramforever" Wang
> 
> [1]: https://developer.spacemit.com/documentation?token=AZsXwVrqaisaDGkUqMWcNuMVnPb
> 
>> <snip>
> 

