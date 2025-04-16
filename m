Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14639145FE8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744807114; cv=none; b=mOVxB7Dq1Xq0a7nMwlUf7x5z2pIXnLdEot/D1estyhX9CSR0CvOdWe6l0eo3zhMUchZUvgoPZN0SNlumu8DUUqmuGc/izdzUgJ18rViz4zrz3omQNUwu6Wauk+K75X3FMWUGLH1Ddhn/nw5DBV1Si5O+ZrhMyg1b69M02s1lupc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744807114; c=relaxed/simple;
	bh=YgJ+JdVbMSE7NayejcxkKgZeHUwKp4FKnadQVrdcFSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MJ3zT+Y413OJnAgR6p2kIksJ/EUPsdCMswHW8j72rC7EGV3Clug0/wXqwvpHn9TQ+CvlcH6SR83uPTC461ogTSJ1CPyk6qwBfNNxgNxrU9bxEDqDIM6zn8BTD68bKfq5J7gU7xKuRc7NwRQloFTnZcyBdj6LVG6iaut88HJUPJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=VXjEW+aF; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="VXjEW+aF"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 88E23A0370;
	Wed, 16 Apr 2025 14:38:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=xsYHMRwdAPxJj2dHnliF
	eUoFCJ2odDE4jo/I+AoFunY=; b=VXjEW+aFzazkOEWeNCFankADBtRmZQRw+kvy
	m1+CWvgni2he7gLoaP7p6ZLpfJ6vEFHJpiNuxjf0fMcNJcwBjMUtB32D/ZNZZpmO
	ZZ+wqzN+PxZjz1WBKoTO9JD3YD0QMRzoHJdBc0en2GQ0/rK7ESjikTC8VWhzd4g6
	UttxTm8HC3u+v1oGtg1WYcZqexEJPn5Mj3gFgjO1nz0yLTTRQDpePMcWB+XntaES
	0cH1k94gB7q0rw/iCfGZ7EisGORNI4qYM5ZedvZ7hEgi5PCeAK5Qo3PCpSeWPglB
	lkh+xdt5mDaEHPXB2tfWFeMoFzWK5g5GhLjY/K9mWUvCZg0KGbTSUKejTUtTvfk8
	8Y2oGySiljEnUVtTiQgIforP1rFR6C5AaPhfDCYd0EFpzMhQZM4G7EFLg/4UpyTi
	F0TNRJldqo6VYMeqkzjkeoButVtLe1GoI7Uxotp73zhwuW6xqHBWiTHDDxcmZ3IY
	1ZEAKT9xFPMGT5OBtpkS3NC8azeBFb78Iu9sZPhPfze9PYJNlQ1+kB6sIC/jy7zv
	a0hy2aenBGAxGzarfcT/EoLg9CHb4JgbF3NZrj1dFFja8ll1nVCrgQjfOkSUkKFr
	zr2/GyYCLCeE/PsutpwOXs0gOh418856FvrKxNfPFeZ4vuiHWVh0Bg8MlT/w3yMs
	3caiB0k=
Message-ID: <dd3c7cc0-a568-4046-b105-e6786b5c80f8@prolan.hu>
Date: Wed, 16 Apr 2025 14:38:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi-nor: Verify written data in paranoid mode
To: Michael Walle <mwalle@kernel.org>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?Q?Szentendrei=2C_Tam=C3=A1s?= <szentendrei.tamas@prolan.hu>,
	"Tudor Ambarus" <tudor.ambarus@linaro.org>, Pratyush Yadav
	<pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20250415180434.513405-1-csokas.bence@prolan.hu>
 <D981O3AA6NK9.2EEVUPM62EV6S@kernel.org>
Content-Language: en-US, hu-HU
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <D981O3AA6NK9.2EEVUPM62EV6S@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94853647664

Hi,

On 2025. 04. 16. 13:59, Michael Walle wrote:
> Hi,
> 
>> Add MTD_SPI_NOR_PARANOID config option for verifying all written data to
>> prevent silent bit errors to be undetected, at the cost of halving SPI
>> bandwidth.
> 
> What is the use case for this? Why is it specific to SPI-NOR
> flashes? Or should it rather be an MTD "feature". I'm not sure
> whether this is the right way to do it, thus I'd love to hear more
> about the background story to this.

Well, our case is quite specific, but we wanted to provide a general 
solution for upstream. In our case we have a component in the data path 
that can cause a burst bit error, on average after about a hundred 
megabytes written.

We _could_ make it MTD-wide, in our case we only have a NOR Flash 
onboard so this is where we added it. If it were in the MTD core, where 
would it make sense?

* mtd_write()
* mtd_write_oob()
* mtd_write_oob_std()
* or somewhere else entirely?

>> Co-developed-by: Szentendrei, Tamás <szentendrei.tamas@prolan.hu>
>> Signed-off-by: Szentendrei, Tamás <szentendrei.tamas@prolan.hu>
>> Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
>> ---
>>   drivers/mtd/spi-nor/Kconfig | 10 ++++++++++
>>   drivers/mtd/spi-nor/core.c  | 33 +++++++++++++++++++++++++++++++++
>>   2 files changed, 43 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
>> index 24cd25de2b8b..425ea9a22424 100644
>> --- a/drivers/mtd/spi-nor/Kconfig
>> +++ b/drivers/mtd/spi-nor/Kconfig
>> @@ -68,6 +68,16 @@ config MTD_SPI_NOR_SWP_KEEP
>>   
>>   endchoice
>>   
>> +config MTD_SPI_NOR_PARANOID
>> +	bool "Read back written data (paranoid mode)"
> 
> No kernel configs please. This doesn't scale. What if you have two
> flashes and one should have this and one does not?

Yes, we have thought about this, but concluded that "paranoid mode" is 
not device-specific, you either have a requirement to be extra sure 
about data integrity, or you can be fairly sure your system is sane, in 
both cases it is a judgement about the entire system. I also thought 
that maybe some devices could be exempt from this, contingent on a 
`no-paranoia` Device Tree property, to selectively sacrifice integrity 
for performance even in paranoid mode, but we only have one Flash 
anyway, so I didn't implement it.

> -michael

Bence

