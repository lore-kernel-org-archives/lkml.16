Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6021D303DDC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751476849; cv=none; b=G1V2dEF/O2XPM5lZWSAQfh7KaJYi2B4tJ7oxF2m97rW70h0TdamgNprKX8Stp4J1GtvW+6U8/VTulM6muKtpSKBZoiK2gwHGXcNYJm+M++y/oUzVNLf+Eeeqzn9QNZxAq7FMM5tak8gh/NZ6WuOilQbHErvCEO1X66siGBiLjAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751476849; c=relaxed/simple;
	bh=Oy7O6hGcdvfwO2s1KCbDKzmLZt+/4BEMN8r3Rj1P+bY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jjoG23sHYUb2ye8C7/Ci0UwJr7MsmTFYN+cebquABuKZfiE1cScy5TKo6NPQ0eQw83j6OMZSzcC3E8EraGl2jvZfUBbZOkaGCVd0bC7znjySlTLM3sRvOgW17hEY/sVIxBg844AhLt312u5qCFcOYjpbOYpAxW3RqiaLXkQIeyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0216322D9;
	Wed,  2 Jul 2025 10:20:33 -0700 (PDT)
Received: from [10.57.29.161] (unknown [10.57.29.161])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A5AF3F66E;
	Wed,  2 Jul 2025 10:20:45 -0700 (PDT)
Message-ID: <ec98776a-318e-4dc1-9d40-e9d8b1c4c28f@arm.com>
Date: Wed, 2 Jul 2025 18:20:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mtd: rawnand: atmel: ECC error after update to kernel 6.6
To: Zixun LI <admin@hifiphile.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 SoC support' <linux-arm-kernel@lists.infradead.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Ada Couprie Diaz <ada.coupriediaz@arm.com>
References: <CA+GyqebQnWQ3fj4Lrb4-hvzRpphuqw+jh4B9En1j2NDTNFumvQ@mail.gmail.com>
 <599c677a-ace0-41fe-b264-51de0fa7badf@arm.com>
 <CA+GyqebFpav_ixDyp84-XA2WcQdrm_t6nfaKckm98tt5MpM2EA@mail.gmail.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB
Organization: Arm Ltd.
In-Reply-To: <CA+GyqebFpav_ixDyp84-XA2WcQdrm_t6nfaKckm98tt5MpM2EA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/07/2025 19:04, Zixun LI wrote:

> On Tue, Jul 1, 2025 at 5:49 PM Ada Couprie Diaz <ada.coupriediaz@arm.com> wrote:
>> Hi,
>>
>> I've written a small patch below that I think should fix the issue, but again
>> I don't know if that's upstreamable as-is.
>>
>>> Best regards,
>>> Zixun LI
>>>
>>> [1] https://github.com/torvalds/linux/blob/19583ca584d6f574384e17fe7613dfaeadcdc4a6/drivers/mtd/nand/atmel_nand.c#L1058
>>> [2] https://github.com/torvalds/linux/blob/ffc253263a1375a65fa6c9f62a893e9767fbebfa/drivers/mtd/nand/raw/atmel/pmecc.c#L772
>>>
>> Hopefully that can help !
>> Best regards,
>> Ada
>>
> Hi Ada,
> Thank you for looking into this. Internally I've written the same patch as
> yours and it works fine.

Glad to know that you already have a working solution and that I wasn't too far off !
I got interested and wanted to dig into it, I hope it didn't come off wrong.

> What's more interesting is the issue happens depending on chip individual
> difference or aging. Among 3 chips tested, two with date code of 1933 and
> one with 2223. The 1st one has many ECC errors as in the mail, 2nd one
> has less errors, while the 3rd one passed the nandtest without error.
> Maybe that's why this issue is overlooked.

Really interesting behaviour, that could indeed explain how it might 
have been missed during the original refactor as it seems it was tested 
with similar SoCs.

> Best regards,
> Zixun LI
Best regards,
Ada
