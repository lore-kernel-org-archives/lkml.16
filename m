Received: from smtp.smtpout.orange.fr (smtp-80.smtpout.orange.fr [80.12.242.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADA21D5176
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 18:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738605956; cv=none; b=GJlS9nwbSV/VdJEPH3lF4j9G80bVCxSK7XfG9CNzZ57pN4HWK+8WFxiTLPshJLI1C4Vd8WnjvIbZGUg+WX7jaQUxs86SxVIGK/BjxD03sakSE4D4fHZGhy3lW7qT+boZ1Se3HMxQ5Q+oZ4ThZWgvgHeqEfgoiYEcTRZ5ETR6Z/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738605956; c=relaxed/simple;
	bh=AjHzt1gBdsj9GiVW4eYzHMTLuHdf2AKqUhlShTXdpEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R56LpHQhHH9TErNiHuKNsVqlaCq5+76UQyW6nr39PlzqwZ0YCuSZtDolnPH5QqSXCmATaJn5fWeQS6dHvePBBJ8I6ziP1vbDS3XL1r6mEJ+mQLn10ONbZY0f/KkTXPiVMQbGN+GRVIsaLf8rZQjJpnz0HEFuykt3NwcA1XRIAB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=rEDdxMRt; arc=none smtp.client-ip=80.12.242.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="rEDdxMRt"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id f0oGt2ORz0JH5f0oJtt8sj; Mon, 03 Feb 2025 19:04:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1738605882;
	bh=gLHLa2XdqwW7+r0oY0nu4QSOxnRWXRNBPOE98c52yc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=rEDdxMRtjkilBCKJEIJ9ggoEND0Hoyyf2MvcXEI9mEdowPxfDWzNBgnaQekFYde4P
	 MVpOxfUViLIk/24ouSE8hfjT75IrP7NUlaebTxPambp3tutG9gczmChr+kdVEKEC+H
	 LbVw13JByeIGjSu1WLiaX/gVV19otYFGc2CdRZxgNUzy6vdoFYHYqyz+oDlspEc62H
	 cO+2SV3dAZf9BJA00Daj7rKqPaAAuKU38AnWicvFtxDJAgmUlUJcAr76uVOJYwJfhu
	 vhE6G05/JrJFRSMVcMJQIGHUedvEflew1c4vDrWKZVrzj9/T6QS9SQQckucHLzTmTM
	 Zc4UZJUgpKjuw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 03 Feb 2025 19:04:42 +0100
X-ME-IP: 90.11.132.44
Message-ID: <30ad77af-4a7b-4a15-9c0b-b0c70d9e1643@wanadoo.fr>
Date: Mon, 3 Feb 2025 19:04:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: Add check for kcalloc()
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, gmpy.liaowx@gmail.com, kees@kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250202205456.40790-1-jiashengjiangcool@gmail.com>
 <87tt9bxwc0.fsf@bootlin.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <87tt9bxwc0.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 03/02/2025 à 09:32, Miquel Raynal a écrit :
> On 02/02/2025 at 20:54:56 GMT, Jiasheng Jiang <jiashengjiangcool@gmail.com> wrote:
> 
>> Add a check for kcalloc() and print an error message if it fails.
> 
> Checking, yes, but logging, no. IIRC the core does it already if required.
> 
>> Fixes: 78c08247b9d3 ("mtd: Support kmsg dumper based on pstore/blk")
> 
> Cc: stable is missing
> 
>> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
>> ---
>>   drivers/mtd/mtdpstore.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/mtd/mtdpstore.c b/drivers/mtd/mtdpstore.c
>> index 7ac8ac901306..368997155c07 100644
>> --- a/drivers/mtd/mtdpstore.c
>> +++ b/drivers/mtd/mtdpstore.c
>> @@ -423,6 +423,11 @@ static void mtdpstore_notify_add(struct mtd_info *mtd)
>>   	longcnt = BITS_TO_LONGS(div_u64(mtd->size, mtd->erasesize));
>>   	cxt->badmap = kcalloc(longcnt, sizeof(long), GFP_KERNEL);
>>   
>> +	if (!cxt->rmmap || !cxt->usedmap || !cxt->badmap) {
>> +		dev_err(&mtd->dev, "failed to allocate memory for map\n");
>> +		return;
>> +	}
>> +
>>   	/* just support dmesg right now */
>>   	cxt->dev.flags = PSTORE_FLAGS_DMESG;
>>   	cxt->dev.zone.read = mtdpstore_read;
> 
> What if register_pstore_device() fails? Your only partially fixing the
> problem if you don't handle the free()s there as well.

... and if an allocation fails above, then some kfree() also needs to be 
called.

And, unrelated to your patch, these kcalloc()/kfree() could be some 
bitmap_zalloc()/bitmap_free(). (but i'm not sure it really worth the effort)

CJ

> 
> Thanks,
> Miquèl
> 
> 

