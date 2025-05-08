Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3F22641E8
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746697366; cv=none; b=PWyOb5YklIqrkuX3kWBtfNujgJL+HnIjpg0rsitTiLogrJaOwEV24oAVHurXplOfzw8zZgKn5pY69gS/4obeiEK1VU84ZlgjXwNGN7g/oZdUzGbg82xQCX3NcfZNT73+uUdbYSimjlyV5UBcgiOS3mLjEJJf6r6KhEnYSrUlqGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746697366; c=relaxed/simple;
	bh=GYGVxYwCi8UGgrfChrXrFi/Yc7pHAuC/FLqU8ZAbjeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cYSuPM3loQykeaD58KBWGeCf/lfBEYDbDMfu9HA1celi0SbWKCQPeQDvB0K7r951HFTx9mz5TBxadBYN9bKC1hFFgVzQijseSf7NHskgn6zD1g+Q63zQJxjx+GVtPsVY59FGBSyVg99teAwNkqfGrIDv4fPsfeivJdfVXG+2DmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=j3sU1py5; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="j3sU1py5"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 7F20EA0402;
	Thu,  8 May 2025 11:42:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=FqcpfxV/1MzYuJfxO/fU
	aFYv5o/e4eUrzT9SJNKucj8=; b=j3sU1py5rlsFW59UcDLeXlEUpgqOgu4nEeMS
	jC2iKRwqy8LB1h/AjpluSZIg1PXou45w+xl9DtRSuHA0dXXjF31SHR5mBDPE2L5J
	MbDdZAiV47WOrRMt7oNrkiESYRI6IPf0PR9UVXX9j2oWoPCW4pagUypcjejq9QUy
	lrd/DjzBMyUVGYNAnru4hWF1XPN2MMdbjZpoSQIWQqoAdCFLlFX0SZLpVbvx7nGK
	iU9l1gueruqDgOTZDZ7yroaUf4Y39vm0zodXpVublUn8nwWxO2lVBm+kAqMaK7Gv
	/XjZujOkPXX0sgRnsweh/yrkj+v07H9QsxFpbjhS0e2VRasj7meMmMoU5V0hsQLc
	tjjt7VhcS6B+97EvqA4IYaKm++22VG2RPKG/mLbhJqyQ68qGGFWzUh8OpKpPXS7j
	+q0ETr5IfaxISJNFOY5cq+G8YXbfkrxkpN2ZRhL6JDSBYHwJIScQBrz7HkBBFTPi
	gxEklY1occ0nihfMcLRpx6ej0PR6Q8v8BdM2eIp/NKLJJH7eNcyMnVx5R7cYjWoS
	EhDoQp4NF7+ktNSAPSTLeF3IGNmyO/w2OR4YT7n1gMnydOszc+3NNZQd8KdUyJoU
	kBiuhRJYgkDLzpUFCzbQii/vwuqO4xEiBw3sFNGM3LU6/ZFCPtfei5QlSGgumo2b
	JqppW68=
Message-ID: <1f5412e0-f332-428f-899f-26ca06a3b0a4@prolan.hu>
Date: Thu, 8 May 2025 11:42:32 +0200
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
	=?UTF-8?Q?Tam=C3=A1s_Szentendrei?= <szentendrei.tamas@prolan.hu>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, pratyush <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20250415180434.513405-1-csokas.bence@prolan.hu>
 <D981O3AA6NK9.2EEVUPM62EV6S@kernel.org>
 <dd3c7cc0-a568-4046-b105-e6786b5c80f8@prolan.hu>
 <373620122.295980015.1744808943985.JavaMail.zimbra@nod.at>
 <c56c52c0-a824-4ad7-9847-e0e973f811ed@prolan.hu>
 <81225127.297167214.1744828878236.JavaMail.zimbra@nod.at>
Content-Language: en-US, hu-HU
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <81225127.297167214.1744828878236.JavaMail.zimbra@nod.at>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94853667266

Hi Richard,

On 2025. 04. 16. 20:41, Richard Weinberger wrote:
> ----- Ursprüngliche Mail -----
>> Von: "Csókás Bence" <csokas.bence@prolan.hu>
>>> I'm not so sure whether it makes sense at all.
>>> In it's current form, there is no recovery. So anything non-trivial
>>> on top of the MTD will just see an -EIO and has to give up.
>>> E.g. a filesystem will remount read-only.
>>
>> In our case, we use UBIFS on top of UBI, which in this case chooses
>> another eraseblock to hold the data instead, then re-tests (erase+write
>> cycles) the one which gave -EIO. Since the bus error is only transient,
>> it goes away by this time, and thus UBIFS will recover from this cleanly.
> 
> Are you sure about that?
> 
> I'd expect UBI to go into RO mode via a call path like:
> ubi_eba_write_leb() -> ubi_io_write() -> mtd_write()
> If mtd_write() returns an EIO, UBI will go into RO mode immediately.
> 
> (I'm assuming, your SPI-NOR has no bad block support, so ubi->bad_allowed
> is false).

You are right, in our case we had to patch bad_allowed to be true. But 
the point is, that UBIFS _does_ get notified, and it _does_ go into RO 
mode, instead of getting success from mtd_write(), even though the 
written data was corrupted.

On 2025. 04. 16. 14:38, Csókás Bence wrote:
 > We _could_ make it MTD-wide, in our case we only have a NOR Flash
 > onboard so this is where we added it. If it were in the MTD core, where
 > would it make sense?
 >
 > * mtd_write()
 > * mtd_write_oob()
 > * mtd_write_oob_std()
 > * or somewhere else entirely?

I'm now starting to think mtd_write_oob() would be the right place for 
it. Thoughts?

Bence

