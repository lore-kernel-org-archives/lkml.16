Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EF5148FED
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 07:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738914678; cv=none; b=m/3xhS9IR2JEVbj0Iead3E1wUM0VIVVgim0kbS3vn3N2x6JH9GF2gtOO0hiKDxpzXX8Xycmh8J4PzElEisqvJslUfg0sKe+6Gm3rTEwbFiuIRy0OADaU4C6m0PAUF/4XRMcOBRk7Hbm0FFnUorHYryVbjzhxCvlpVKj/tBoo0R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738914678; c=relaxed/simple;
	bh=eRVinGj2S3v0VlJVHhwxqXd43YaM6DSrZx2C8cOZHeA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=r7xpRn6vKhWIwm89cFgMF0nLwWJy0EyQjVqPsoesgDQIrKB4Hz5jgALTs3NONL0XqZjUPslqiC+8/tyD4qtnk/geNV2UVZmYgors7kI5wmw9byLQdEiSUt36qSpTza7upwoQm8Fn45a3ZuHc3PZ2oB9OfO2iqrIssq26e06QNJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 4b311c22e52811efa216b1d71e6e1362-20250207
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:2b91d666-3be3-4bd3-a863-acd9e749915a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-INFO: VERSION:1.1.45,REQID:2b91d666-3be3-4bd3-a863-acd9e749915a,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:-5
X-CID-META: VersionHash:6493067,CLOUDID:cc5e5b58d7cdf6f0a1fc14d7143cf5bb,BulkI
	D:250207144718WD2CAVF2,BulkQuantity:1,Recheck:0,SF:17|19|64|66|78|80|81|82
	|83|102|841,TC:nil,Content:0|52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:4
	0,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE
	:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR
X-UUID: 4b311c22e52811efa216b1d71e6e1362-20250207
X-User: liuye@kylinos.cn
Received: from [172.30.70.73] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuye@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 935327732; Fri, 07 Feb 2025 15:51:09 +0800
Message-ID: <1b58ede7-062a-49fe-bea8-e99b3dd7b2b1@kylinos.cn>
Date: Fri, 7 Feb 2025 15:51:06 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: liuye <liuye@kylinos.cn>
Subject: Re: [PATCH] mm/mempool: Use kmalloc_array_node to replace
 kmalloc_array
To: "Harry (Hyeonggon) Yoo" <42.hyeyoo@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250207055213.141890-1-liuye@kylinos.cn>
 <Z6WsZsczBNOrmN0N@MacBook-Air-5.local>
Content-Language: en-US
In-Reply-To: <Z6WsZsczBNOrmN0N@MacBook-Air-5.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


在 2025/2/7 14:47, Harry (Hyeonggon) Yoo 写道:
> On Fri, Feb 07, 2025 at 01:52:13PM +0800, Liu Ye wrote:
>> The kmalloc_array call could be replaced with kmalloc_array_node
>> to allocate memory on a specific NUMA node.
> 
> Why is it useful to replace kmalloc_array() with kmalloc_array_node()
> in the code?
> 
>> Signed-off-by: Liu Ye <liuye@kylinos.cn>
>> ---
>>  mm/mempool.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/mempool.c b/mm/mempool.c
>> index 3223337135d0..51eabcc87177 100644
>> --- a/mm/mempool.c
>> +++ b/mm/mempool.c
>> @@ -328,8 +328,8 @@ int mempool_resize(mempool_t *pool, int new_min_nr)
>>  	spin_unlock_irqrestore(&pool->lock, flags);
>>  
>>  	/* Grow the pool */
>> -	new_elements = kmalloc_array(new_min_nr, sizeof(*new_elements),
>> -				     GFP_KERNEL);
>> +	new_elements = kmalloc_array_node(new_min_nr, sizeof(*new_elements),
>> +				     GFP_KERNEL, NUMA_NO_NODE);
> 
> What do you mean by 'allocate memory on a specific NUMA node'
> when you pass NUMA_NO_NODE?
> It's essentially the same as what kmalloc_array() does.
> 

Yeah, my brain short-circuited. Discard this patch.


