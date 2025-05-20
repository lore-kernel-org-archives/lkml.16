Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F2C20D506
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.156.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747731910; cv=none; b=GxsHrQdH8XFnYJFflM+trpX2C393+q+BmISVftNH01srVggUWNuWqWA9//NWRaDtA7kv2aN5DvkTlsAuBdzx4ee4GiBq6aNOvHOPWEKS2021HDOJBvtYJpkFZwCKIjHwj8+fptJNUZH0ODvjndbHvlXWSPzIqVC8r0Id08WbYIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747731910; c=relaxed/simple;
	bh=yBbdj7NlwMTxQ67l5t0qFWn7th72f332I3gFq49d3kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BKKh5q3gjb7Wf/1xkwgVQ5pMjyIKGUV/7lIPfwMhoZ1DOl+ru1/G1nanJAxpjGIfoZfsdNvpRYvIDYqrU9QjrVhATQD3SVZYkV3REllssD/3Z3FP09xX6k72c1eQ6J2duvLUqjh+rjp73rLaOP7kr7ALtQlx9x6cW1dGqwKW3XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=temperror (0-bit key) header.d=aruba.it header.i=@aruba.it header.b=RHnop4Z/; arc=none smtp.client-ip=62.149.156.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=aruba.it header.i=@aruba.it header.b="RHnop4Z/"
Received: from [192.168.1.58] ([79.0.204.227])
	by Aruba SMTP with ESMTPSA
	id HIrDueuvb1ugbHIrEu6UMu; Tue, 20 May 2025 11:01:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1747731716; bh=yBbdj7NlwMTxQ67l5t0qFWn7th72f332I3gFq49d3kk=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=RHnop4Z/13NUHHIaqHKFs5/V45U20yPHUv+wcekwlnZ+lngOjSR4jv9q32CXilpXc
	 c4lpW69sNC5NOJweIRIC4PDlw7ZBZwkxlTMxlkV6sPMeyS5E2Vt++MA+D4sPi/fyoT
	 oj2tyyL2gMptGuEzbPEpqU5HfCHx6/nydQ+rdQRTjpqLi2YD9NmVvBE4p8s5aeK46w
	 GRNxFq8kEvRWzMl8E6lYgbmJtID0PSgvM3Walx+489OfTaIkgqRhooEVkL41wlsTJg
	 qO/7esMlW3aE9PPW7b3j6HgVDC/hFzNS0fPckwPl6G34iC+NrnLY44tgkjuO3cKUlL
	 8fsbyZM+rVETg==
Message-ID: <c682e4da-ae75-4e93-bbf1-a68f31bd15de@enneenne.com>
Date: Tue, 20 May 2025 11:01:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V1 2/2] drivers soc: add support for ST stm32mp13xx family
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Eric Fourmont <eric.fourmont-ext@st.com>,
 Yann GAUTIER <yann.gautier@foss.st.com>, linux-kernel@vger.kernel.org
References: <20250519130859.3389704-1-giometti@enneenne.com>
 <20250519130859.3389704-3-giometti@enneenne.com>
 <4566f4c1-f4d0-4f32-8fcd-bb3057b5d1fa@kernel.org>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <4566f4c1-f4d0-4f32-8fcd-bb3057b5d1fa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJEjQksEF2gr1H+kBdUbxxgnkrI7vfEOspMWR+zMH4bcN/GomTOL9m5YhNhmULAAHo01QUSDpomTsicddghDGtLGxp2WePiPIRXKZquNVP5Sz7CY1OY6
 7onfNyX02udqJq7Jkyc9mSa2FQo7O/A4sg6dfaACmA3ZWRguE8wmFqG1JMgB0CgJwc+IufEqos231NdANrqJ1cw+y+pRY5mQfuZnWKe2x72P9Bri+xWZXXTH
 iEbWOP1YokbZMxVgmnEAQMHsLP2H/OxwqETIPkU85Xs7N/BuLAzlhoivY8O6z7hc9lUfecxpfUscw5OBhHWLP1njczo1EGu6sxAexIZ3Kvzv5//wtPno/8aD
 9pZUWSLcIwiTMNCUpzRds9LmRbONIA==

On 19/05/25 20:34, Krzysztof Kozlowski wrote:
> On 19/05/2025 15:08, Rodolfo Giometti wrote:

[snip]

>> +
>> +static int __init stm32mp13_soc_get_idc(u32 *idc)
>> +{
>> +	struct device_node *np;
>> +	void __iomem *regs;
>> +	static const struct of_device_id devids[] = {
>> +		{ .compatible = "st,stm32mp157-syscfg" },
> 
> No, don't add compatibles for other devices into the driver functions.
> Use standard methods for binding, like every driver does.

I need to access a region assigned to another driver very early on boot, and 
this is the only way I've found to solve the problem. Can you please give me an 
example of these standard binding methods?

Thanks in advance,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming

