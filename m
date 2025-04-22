Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A284690
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 01:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745285930; cv=none; b=Dc7cI10eKlXztqwsdOsYGNHgAhsGtOGolpoz9hLNnoxI7KDkqOi7dzAV1OL2JxmDGxCVNEWimYd0tcYKhrocCnuk5pvpW5E4z5KMEmdLp3+D5UiXnWq3VU5v6BHt9IrYsUSPWREI/4PAB8/MGiWa8Bq7p6Wo4bcZ7phB0FQoLbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745285930; c=relaxed/simple;
	bh=VFK+/x9U9zWLUCWy1Ri7ZISj6kg56Jo3Ao9PF1aRSHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fvlaOZH+ydXKpmRn4Dk0Xz04ApSLQZn7whOpxcd9WhPp7jplgcyOT6eg6drbppxSTSFucDLFWu2b9BNmbIFSEVZPPiJSWeq3OEbc8PqbWleBJ9zrgI646fayj5CbQHRtdvfIT27E7Vy77v9ePxybLMGvWJZUOAW10yitiqvWtKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7mCHgnn; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7mCHgnn"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-225477548e1so44234775ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745285928; x=1745890728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pihn7LwUvtVfN0XhK8Z3OEivWDjRGoVE90mOrmOu+so=;
        b=I7mCHgnn8/EMxIlqqs2rMupWixSHYGPLHu1rWsE6wxhn34Hz82XRs2X2naHYdXgYsR
         s/1ME44uNMDKKcA/031mmNbn8UfD1vScgyOVr+FwrgMElHqxGhkG/bTguUboYhZOEX/I
         idFslLWxhvOEyWu6iHeeh3tRacoxbj+ZPYDDKrZIkx7T62Iq3AECA4uMpNJNGNQLrDlL
         v4ewv2Y+WWjpWsKCUEfPzDzoqySMsWdyFgdmIzsCf3YsbW3EKLmQAAiuiVMZB8izet4Z
         s0AIk7BlIUn6IrIoTFbouHIFnI15jcyCxsTWLYRjYK92hS7b1WwiuOEGV8yOUu/nDBVZ
         rzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745285928; x=1745890728;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pihn7LwUvtVfN0XhK8Z3OEivWDjRGoVE90mOrmOu+so=;
        b=PI/zmY7P0LE/ZhRJB1qJi+jZo73kDw8Hr0SCdgb1yG6lfj1WqSZmNwYCdFXiySPU1J
         Uy5QEyQ1rynH0KmnMxF8NqmVaqxyzJ/Mhtg2eCRlYCt526CmpwfvcTwbcUUyWRB5rOYO
         d3x9VTHeXGc8WA1TJiBKzDMJqqnV6G//YpOdxDWb7tNww3q55D9O43ElArRz0K0I6HP/
         W2Vv8RtA0k8r9qi1bi4ozn+LNbHMXp5dYWOM6KW9mQcqYxCdWBFNUsvY9SLi3hONUfci
         XC8nUFIonwlDUtx6Sezgi0p2mBj8frw0237ojFmL+gLJ9+Q0tI8yarH9Oy+6j8vxRUfc
         QPLg==
X-Forwarded-Encrypted: i=1; AJvYcCWKGT7IjNwfOHLr5v5FuJhXUD81noa/jJcp6MznnhJ1m72KfFlhfswJ0bnOikYbqaYgMsOGSJSDSbZLFYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN1Tp0/nMiu/RnDMdlEeovMwU28N7MVhZFuYOFkxW61xxgbCGD
	ezDG5k9/Hsih6Ur2SNolOvY8feXvcrWvVXLuCeztMUPvMqL++hMw
X-Gm-Gg: ASbGncumqJPkBLxmjy4x3cYHhC/4qFF00R6LATZpWdBQdrTHrLiEI1wJIjgzyXAfYce
	mZQ3q4L0J5VW3HTK59SyJQxCnOQ6AnJu6qnghEfa7ZQXb2szC+7CF8P/8ubMgUg+Hv3AcqPCcSv
	gWyVjVDQb1t4F3DKCmEosMejN/3PYgJNqSZicg1V307Q504kCip52Jn59yWnxb97In7++b9AFmw
	f1KEVDzz4AZ73PKDAkUsjvXPffYQyRAxPnYEyZmOq+lerUKRB30O+4w6k9V3durd460I1sCR8yC
	nWMnjYZ1Gm8gAWAKUiOR8W/v+15/E0Ke/v6hMMbR8H4PLN1NoYuVNRhW
X-Google-Smtp-Source: AGHT+IFnOJAIOYBHLa4wObdFkR0uD9Ygi2NKzxRE1wPLcAvg5M8KaAp2Fh+vAO/hoWG+KYGbLiD78Q==
X-Received: by 2002:a17:902:f60b:b0:224:826:277f with SMTP id d9443c01a7336-22c536041a9mr197018305ad.33.1745285928302;
        Mon, 21 Apr 2025 18:38:48 -0700 (PDT)
Received: from [192.168.98.254] ([104.28.254.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eceb74sm72112005ad.166.2025.04.21.18.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 18:38:47 -0700 (PDT)
Message-ID: <c1e2d8ea-1b37-479d-8239-cb9bf0efdcaf@gmail.com>
Date: Tue, 22 Apr 2025 09:38:26 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH nand/next] mtd: nand: spi: Use write_cache first and then
 update_cache in write operation
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Daniel Golle <daniel@makrotopia.org>, Chia-Lin Kao
 <acelan.kao@canonical.com>, Cheng Ming Lin <chengminglin@mxic.com.tw>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Steven Liu <Steven.Liu@mediatek.com>
References: <20241119093949.3014-1-SkyLake.Huang@mediatek.com>
 <871pymtab3.fsf@bootlin.com>
From: Chuanhong Guo <gch981213@gmail.com>
Content-Language: en-US
In-Reply-To: <871pymtab3.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello!
在 2024/12/5 23:32, Miquel Raynal 写道:
> Hello,
> 
> On 19/11/2024 at 17:39:49 +08, Sky Huang <SkyLake.Huang@mediatek.com> wrote:
> 
>> From: Sky Huang <skylake.huang@mediatek.com>
>>
>> According to discussion with Miquel Raynal <miquel.raynal@bootlin.com>
>> and Chuanhong Guo <gch981213@gmail.com> on FORESEE F35SQA002G patch,
>> Chuanhong recommmends that we can use the following sequence in
>> spinand_write_to_cache_op():
>>
>> x1 mode:
>> 02H(program data load) -> 84H(random program data load) -> 84H ...
>>
>> x4 mode:
>> 32H(program data load x4) -> 34H(random program data load x4) -> 34H ...
>>
>> 02H or 32H commands will clear cache buffer on SPI-NAND and load
>> data to it. For those SPI controllers which can't finish transmission
>> in single step, 84H or 34H will be triggered for the rest data.
>>
>> We observe that some current SPI-NANDs, including FORESEE F35SQA001G and
>> F35SQA002G, must use 02H or 32H to reset cache buffer in flash before
>> using 84H or 34H. Or users may encounter program failure issue. This issue
>> is not always reproducible, but it may occur and cause system instability.
>>
>> This sequence should work on all SPI-NANDs nowadays. I also check with
>> Foresee that the sequence can solve the above program failure issue.
>>
>> On my test platform (MT7988), SPI driver is drivers/spi/spi-mt65xx.c.
>> And I limit MTK_SPI_IPM_PACKET_SIZE to SZ_1K to simulate lightweight SPI
>> controller which can only transmit 1024 bytes.
>>
>> The test step is the following:
>> - mtd erase /dev/mtd2
>> - dd if=/dev/zero bs=2048 count=1 | tr '\0' '\xA5' > output.bin
>> - mtd write output.bin /dev/mtd2
>>
>> Before applying this patch, write operation uses only 34H(update_cache):
>> [78.937720] OP code: 0x34, addr val: 0x0, data nbytes: 1020, data 1st byte: 0xa5
>> [78.945297] OP code: 0x34, addr val: 0x3fc, data nbytes: 1020, data 1st byte: 0xa5
>> [78.954251] OP code: 0x34, addr val: 0x7f8, data nbytes: 72, data 1st byte: 0xa5
>> [78.962966] OP code: 0x10, addr val: 0x300
>> [78.968816] OP code: 0x34, addr val: 0x0, data nbytes: 1020, data 1st byte: 0xff
>> [78.977233] OP code: 0x34, addr val: 0x3fc, data nbytes: 1020, data 1st byte: 0xff
>> [78.985124] OP code: 0x34, addr val: 0x7f8, data nbytes: 72, data 1st byte: 0xff
>> [78.992527] OP code: 0x10, addr val: 0x301
>> [78.996981] OP code: 0x34, addr val: 0x0, data nbytes: 1020, data 1st byte: 0xff
>> [79.004416] OP code: 0x34, addr val: 0x3fc, data nbytes: 1020, data 1st byte: 0xff
>> [79.012031] OP code: 0x34, addr val: 0x7f8, data nbytes: 72, data 1st byte: 0xff
>> [79.019435] OP code: 0x10, addr val: 0x302
> 
> I am sorry but above you said that we should not perform:
> 
>      0x32, 0x32, 0x32...
> 
> because the second time it would clear the cache again. And here
> you tell us that actually the core already handles that by performing
> instead:
> 
>      0x34, 0x34, 0x34...
> 
> So what is the problem?
> 
> Or maybe I misunderstood the issue, but I think Chuanhong raised an
> issue that is already solved? Isn't it?
> 

The issue is that the FORESEE NANDs require the first cache writing 
instruction to be WRITE_CACHE instead of UPDATE_CACHE. i.e. it needs a 
command sequence of:
     0x32, 0x34, 0x34, 0x34...
This patch does exactly that, making the first instruction issued 0x32.
It should be applied to fix the issue above.

---
Regards,
Chuanhong Guo

