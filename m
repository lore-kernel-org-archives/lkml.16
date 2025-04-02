Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BB720E328
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743601016; cv=none; b=Myf62xRmV1xHXM1z3TPuVGa3FyDPoMTbN/BCwnakk9VbeNatr+9IwDQzPK1Oy7zp/YSGlYxrF5VLwpN9pISt/AWS/24mm88h14n5TvBBJjlU0jA/78dV5Cs8zocD9YEC+PQfti1rSDyehSlDMzWG69JmWPKaGql0e9loxWoD7tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743601016; c=relaxed/simple;
	bh=b9wZe3zUusuqi80SoEAKAiGo1Ofb54SdnVVM8IPNgiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q5COg2f5JkXwF1IdcWHTCqTTlyGRttlbU5w38xUBOcScQJhgc1QBTaM1wfbnaKZ0yaeWdNlcv3FSgL34vQZ1CRu09jI15gcfyyc2zLseTqwgUd2OalrILOg3qHLoQjMC9SjX6s4n9UZicOUDzRjCoVQTuj4pMdk4kX8p5itz9y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUXDahjv; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUXDahjv"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7394945d37eso119623b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 06:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743601014; x=1744205814; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CevzHgDI4EfoYMztFNapjbRDQjnuZqx7ZaIK/kY7TqA=;
        b=lUXDahjvGCAYUKIYDGI0kAixsjHiWBK+BCan4Hdx6wRy88nzHPafHBy4d75Uj34uYr
         7JgAbD4z4iML2N3VMx+H56xKTKxaqZbBx8eymltzoNQ9ZdEOR9kfsMWyuRBPROTG086F
         xqxQuFdF+AjBM55lJkJyfXkEjzXDR5l1NL5SoR0jsNVvuAeKtyClGpYyXea4f8HXmUAR
         GmNflrPgV14vCh9djsKABvGtOH6+bQ/qUBOJHHW9esX0HU9yNRdZCfy51wWApiFuvxGd
         kLRmZobwpSF0Bn+NFvxGk4LN1C6MqoIdZqmArrf7obPOs72OO4dAKZ4r1fedpRGAxkgX
         W1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743601014; x=1744205814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CevzHgDI4EfoYMztFNapjbRDQjnuZqx7ZaIK/kY7TqA=;
        b=OhuDMqvq0uXJ9jW0zUYSw+FGtDe5ztPYRoPwxQpnr2c4+2BBC1YlTZQEqSw/RUTfE1
         /M4NRtGcPhkO/x8ovHL3SOvUNAYinbxmKPFeHmr2mVMorDXqEyv1RQklBayqpfyn78qz
         p17Dxjyz3qzbfq5OXVMtLa74VBEoSYPgnnkkrv7YUGQ2lhCOInf4psz/s3sA2uuvpU9S
         ljisVT49lEjr5FV/FRokSxc/rWSD4xYx1cQLqXFnYopg/xxcUDlGL31b/iO+0zPUh6qH
         2ME0pG4BJ40tdy2wx6dbLI3L3ZGQNSYN3kR5xBkpBDKb1zTLJYRK8AlnLBYiWXYD7DCf
         IqdA==
X-Gm-Message-State: AOJu0Yz8elQOabbkCOg74EMmmkMGz7IEGhoyIxH6u6+lxRJCGVY8NEyj
	sic7uqhEOIkLlWJTxaHI6KYT7IGjKvOCJpCpAc1RspI/bVP38MbB
X-Gm-Gg: ASbGnctUrxdzscuVIKuc+nT8UuLnhY/F4Ao/CK/WABD4NhruJ1rSIEOkp7RtQJR4bYs
	18ALKqFuiPKgVsUrQi9KXQWddoHBZ1Y2ZCeiz1Jr1eBS75v2fvUCYvWlrFc6ao2K0Mv7/Kqk5hf
	0Ryq2NEoDdc1q1b/ySxi51guzAlQu4kvPH7KO2tpEdX6XX4csy10IqfgdwXPry2rwR02jED5pyv
	To6GSKDmf/ExxHTKnqS5AcwsBiaZmomUEaB/3ZukmUfMIHrswX8NibqtQj2vaxm0pYR5Xe0ZaA+
	pAleWCQhdhMlhxzGUpHN0oA8QE+5hBniMsz/L/L6M7eM18qCG2RewdKg
X-Google-Smtp-Source: AGHT+IEG0CGWYCtJMD10Yjwof6pX0tM+SD9K1zb210PZ0rhjrYZw7pGNPoVdlVUOQhEHs9Dwm/9C3Q==
X-Received: by 2002:a05:6a00:856:b0:736:7960:981f with SMTP id d2e1a72fcca58-7398037c9d8mr25756724b3a.8.1743601014112;
        Wed, 02 Apr 2025 06:36:54 -0700 (PDT)
Received: from [10.189.144.225] ([43.224.245.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7397106ad9bsm10944008b3a.117.2025.04.02.06.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 06:36:53 -0700 (PDT)
Message-ID: <15dfe0c4-c1cb-4146-ab06-cd36b7412b2e@gmail.com>
Date: Wed, 2 Apr 2025 21:36:49 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] lib/iov_iter: fix to increase non slab folio refcount
To: Vlastimil Babka <vbabka@suse.cz>, akpm@linux-foundation.org,
 willy@infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@archiver.kernel.org,
 Sheng Yong <shengyong1@xiaomi.com>
References: <20250401144712.1377719-1-shengyong1@xiaomi.com>
 <b2c07fdf-5ab1-4a65-9ce2-38638b7c718e@suse.cz>
Content-Language: en-US
From: Sheng Yong <shengyong2021@gmail.com>
In-Reply-To: <b2c07fdf-5ab1-4a65-9ce2-38638b7c718e@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/25 23:22, Vlastimil Babka wrote:
> On 4/1/25 16:47, Sheng Yong wrote:
>> From: Sheng Yong <shengyong1@xiaomi.com>
[...]
>>
>> Fixes: b9c0e49abfca ("mm: decline to manipulate the refcount on a slab page")
> 
> Sigh. That went to v6.14
> 
> mm-hotfixes and Cc: stable then?

Hi, Vlastimil,

Shall I resend this patch with Cc: tag to the stable list?

thanks,
sheng

> 
>> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> 
> Acked-by: Vlastimil Babka <vbabka@suse.cz>
> 
> Thanks.
> 
>> ---
>>   lib/iov_iter.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> ---
>> v2:
>>    * update commit message
>>    * update coding style
>>
>> diff --git a/lib/iov_iter.c b/lib/iov_iter.c
>> index 8c7fdb7d8c8f..bc9391e55d57 100644
>> --- a/lib/iov_iter.c
>> +++ b/lib/iov_iter.c
>> @@ -1191,7 +1191,7 @@ static ssize_t __iov_iter_get_pages_alloc(struct iov_iter *i,
>>   			return -ENOMEM;
>>   		p = *pages;
>>   		for (int k = 0; k < n; k++) {
>> -			struct folio *folio = page_folio(page);
>> +			struct folio *folio = page_folio(page + k);
>>   			p[k] = page + k;
>>   			if (!folio_test_slab(folio))
>>   				folio_get(folio);
> 

