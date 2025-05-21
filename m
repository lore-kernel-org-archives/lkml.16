Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD5A4A3C
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.158.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747842271; cv=none; b=AnYMWnYY4Qslx8UC7XAVmERME7f0Up3I+mD/g2gfB6s9fs3/7ZzJVEhvs+bShdqZHmxtLp36ms4JEdo9DPrzK2VDqPOcrnRTBdruXDRuI+BI9PKy7loJ01890M7Rx2HelIpd5H6kknJkmMUXOL5jshEZmJl0R01L1dT3lCKic/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747842271; c=relaxed/simple;
	bh=nA6TRtJyUThCdDlH1gCQMVjYEvuRW9ebcV0zI45OeX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D1AuydbRWfXbsFAdx9MY3i3+tUTYImw1srdRsrz23OKfDExtih2z3VBv2EuPHKYSGIdAFLvwPpwlvmwI59PR4CYPP7diYLOrTCHjVwMF4XpoA7qBoaJ7T2XSTrFNanNXy9sxaN1xPNVh9H3TeZwAenlny/Qy+jGxWJjGdtexPSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=temperror (0-bit key) header.d=aruba.it header.i=@aruba.it header.b=h1Sti6hb; arc=none smtp.client-ip=62.149.158.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=aruba.it header.i=@aruba.it header.b="h1Sti6hb"
Received: from [192.168.1.58] ([79.0.204.227])
	by Aruba SMTP with ESMTPSA
	id HlcAugUWJmHkSHlcAuR8NE; Wed, 21 May 2025 17:44:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1747842259; bh=nA6TRtJyUThCdDlH1gCQMVjYEvuRW9ebcV0zI45OeX8=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=h1Sti6hbd8ayGv/OQaHF7KUt9rZQmu4V3e8VVIyBPgoMNx0xfiXybZjMYe4Tdqy6R
	 GsBlcHyVL0FxXdxovYXz/i1d0o9Ge/aWZnaRkV+LpOqtjcMuV90CniUywMCxlRKxXr
	 /BF730YMzsFwqntAPUL1N6Aab2lxi2r6dGUhTHMpRJTwbDdDvjg+Eqgmue3mMGdxtf
	 dPp2G829d2F/xFcGMV6jUGVQrQQjeq+PI2u4AfWrqCM7Abp33MOBARz1i41nZ8qoyL
	 WLweLyy3bml7mvndPk209PzUfDRPqOr6ltzHoD1qjBs94YtQ8paOnqyfjKl7AzgM+a
	 RF5A8o8K+U19g==
Message-ID: <cf69b49a-e2bf-44a9-ad7b-df01572457b0@enneenne.com>
Date: Wed, 21 May 2025 17:44:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V1 2/2] drivers soc: add support for ST stm32mp13xx family
Content-Language: en-US
To: Yann Gautier <yann.gautier@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Eric Fourmont <eric.fourmont-ext@st.com>, linux-kernel@vger.kernel.org
References: <20250519130859.3389704-1-giometti@enneenne.com>
 <20250519130859.3389704-3-giometti@enneenne.com>
 <815b3972-8258-445a-a028-fd1707c7c1be@foss.st.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <815b3972-8258-445a-a028-fd1707c7c1be@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfIyzVCH+ivuGoIUsO/En2BDUT/bVQZzblDXNYKkGC1puw3yS1s8L9HpPhsmWVRjRloUXaQr38CS4GfATuXn67c5mrXrTncNeC4uyb8jPk1Q3/QyneYra
 tfPl7NHzKFiG2EvNr9BjiuJQ5otd+20AtWHYFnP8PWuKAG+LRbTQn1z0YAjyD8gvy/pKOF5I+MFypz8vKPPka64Q+v+W7JyT0IwrsikM5EaHeIPEU1+926ts
 GaWMH4y+7HxdFMtTqzAsNPkstVnpq2RNdl2RTd/SFcMVp2BsDRXqgiOsBJ0IbSWK/pgRR2bjd7m11/FvEtS9MAkZ+nGSrgPA/aFl/Vn0fa3HkdGNm5+bCJSa
 nWxmt74ErE7+9cf7r1EMoOlukjWj9vt7YnipBxWqWELb/AGjbIk=

On 20/05/25 18:58, Yann Gautier wrote:
> On 5/19/25 15:08, Rodolfo Giometti wrote:

[snip]

>> +static int __init stm32mp13_soc_get_rpn_uid(u32 *rpn, u32 uid[3])
>> +{
>> +    struct device_node *np;
>> +    void __iomem *regs;
>> +    static const struct of_device_id devids[] = {
>> +        { .compatible = "st,stm32mp13-bsec" },
>> +        { },
>> +    };
> 
> As said by Krzysztof, you cannot access the OTP fuses this way.
> There is already a driver for that: drivers/nvmem/stm32-romem.c.
> And the information there should be accessed through nvmem framework.
> 
> For the UID, you should add this in your first patch:
>              uid_otp: uid-otp@34 {
>                  reg = <0x34 0xc>;
>              };
> 
> And add &part_number_otp and &uid_otp to your driver nvmem-cells property:
> nvmem-cells = <&cfg0_otp>, <&part_number_otp>, <&uid_otp>;

I see, but since the device is called by the device_initcall(), when I try to 
use the nvmem framework I always get the EPROBE_DEFER error. :(

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming

