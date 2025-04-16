Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DA11FF1C9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814707; cv=none; b=HsI9N0QVEsTJcIABg4kfIDRASnL/ZZZ2pvemjdEnf9seD3v3Z2GMpP5x9wPND9L5fYHG3mT0GWvgBKEDboOGiFiComRlixnZmcca7hSq+0EMTUOIxI/v0geJT2rdXS/lptqV4e3BnRm6qgjdzNPl6piM1hMO+4fTTgty0pOUc9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814707; c=relaxed/simple;
	bh=rjMftAYCPN5ACCWoXek1N3fvkFUnIGaDkrb0U1rSsMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BTUV/sk+ascTUiIDkVoOEaLz5yy3Nism/+Hd2o0wT/lTwEOxBxyMC0+hIneiA0lkvXdXJPX60CeTSA5mzqY2PMePj691SObSbBc76uJsHvriLqrGX/4riF0VKCbnpsLc7D0SZU+cHEduk3JoDzmyETEM6undpui7WRJkjav1/G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=OmuQI8F8; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="OmuQI8F8"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 8C527A043A;
	Wed, 16 Apr 2025 16:45:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=wFlL4KarMxsmLqV1w7R0
	LsLYAx1qNHc06GmS7Bj9QUk=; b=OmuQI8F8KMvtkDJldQhE18/bshVriV8cyxk1
	/pwejPGI9fBRCs+etuap7iO7jDAYGwyuvE6LYKN8UPK9PQCb6KW+hjAzZCn4qPMP
	Lx4SqgEnub/cENFPHlGzDM9gzNkWNGuyHpDG6+iQs5iia4qBu/C4C8EKk5BhiI9I
	YsIU78NQd+h23S3yapOYQDVS/nPYb4iLNM7PvWVqrzdPs1jCR1GIwucaPX/l4cdA
	Y9IUolu567Miqn3ylgKDY2cFDDOj8p7QdYtd9Rkex5BHQFPUNSVvy+3yr+1JFQgL
	8uZw70xORd/xStGC78KKoDqkeC4Zu8BdlXosRVUiWhosD8wH2sqr+avkYQO9wQBv
	Nngs2USiIH1wLHas8dRKSO8zveNay4pmENjkBQ1hN05T6bNrxM2T0i0MS56tD5ko
	WU4qJ122Y8cVcef63AzdNnVjlO86x9Q9+hmaSHCqvSffLoPt/TAuFihyM5kimrUy
	242HKbEUSB7A0Aj8JgPz/VJHg9/CR+OlZC4FOUIA3yJApOVYqVl6uG4sf1A8K9pi
	scSaSgoDtT4EDcUZAl7AT1OsEVE/b15/cl+KPWTox4IBzYyFFLhLem609CBdVLX6
	/72k/0tDnNZr2kBaIetGQ9BPaKDt3F+e+74mCVMkQzHkSNko2UiSm5t3XB4c0YQH
	IfEq9hw=
Message-ID: <c56c52c0-a824-4ad7-9847-e0e973f811ed@prolan.hu>
Date: Wed, 16 Apr 2025 16:44:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi-nor: Verify written data in paranoid mode
To: Richard Weinberger <richard@nod.at>
CC: Michael Walle <mwalle@kernel.org>, linux-mtd
	<linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	=?UTF-8?Q?Szentendrei=2C_Tam=C3=A1s?= <szentendrei.tamas@prolan.hu>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, pratyush <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20250415180434.513405-1-csokas.bence@prolan.hu>
 <D981O3AA6NK9.2EEVUPM62EV6S@kernel.org>
 <dd3c7cc0-a568-4046-b105-e6786b5c80f8@prolan.hu>
 <373620122.295980015.1744808943985.JavaMail.zimbra@nod.at>
Content-Language: en-US, hu-HU
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <373620122.295980015.1744808943985.JavaMail.zimbra@nod.at>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94853647664

Hi,

On 2025. 04. 16. 15:09, Richard Weinberger wrote:
> ----- Ursprüngliche Mail -----
>> Von: "Csókás Bence" <csokas.bence@prolan.hu>
>>>> Add MTD_SPI_NOR_PARANOID config option for verifying all written data to
>>>> prevent silent bit errors to be undetected, at the cost of halving SPI
>>>> bandwidth.
>>>
>>> What is the use case for this? Why is it specific to SPI-NOR
>>> flashes? Or should it rather be an MTD "feature". I'm not sure
>>> whether this is the right way to do it, thus I'd love to hear more
>>> about the background story to this.
>>
>> Well, our case is quite specific, but we wanted to provide a general
>> solution for upstream. In our case we have a component in the data path
>> that can cause a burst bit error, on average after about a hundred
>> megabytes written.
> 
> Hmm. So, there is a serve hardware issue you're working around.
> 
>> We _could_ make it MTD-wide, in our case we only have a NOR Flash
>> onboard so this is where we added it. If it were in the MTD core, where
>> would it make sense?
> 
> I'm not so sure whether it makes sense at all.
> In it's current form, there is no recovery. So anything non-trivial
> on top of the MTD will just see an -EIO and has to give up.
> E.g. a filesystem will remount read-only.

In our case, we use UBIFS on top of UBI, which in this case chooses 
another eraseblock to hold the data instead, then re-tests (erase+write 
cycles) the one which gave -EIO. Since the bus error is only transient, 
it goes away by this time, and thus UBIFS will recover from this cleanly.

So yes, it is up to the FS/upper layers to handle the error. If it can't 
recover from this, then yes, it will give up and enter some 'safe mode' 
(e.g. remount ro). But at least it *does* get notified that there is 
something up, and has a chance to react. Before it just thought 
everything was written with no errors, and then there would be data 
corruption *on the next read*.

> Thanks,
> //richard

Bence

