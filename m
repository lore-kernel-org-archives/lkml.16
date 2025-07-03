Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98542E4256
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 12:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751545694; cv=none; b=Cu61QNqa3Be+AaCIIhjl4OqCeGHsJ6MnWcp3aZBzzRvUh4e9peQIMdqcoYesrIIBfHvoYiUSX92CH+TQKQJAazHMdD/GFAd/j4OWOh63q5FW+AuXGUHrmIP46FkOMXqbXxFosoQInEKmQuWKV7qYk5VOnKrkwirntVk+RZDUq0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751545694; c=relaxed/simple;
	bh=PtpH5wJVqKYW0rZnDY/be1PL8Rh1jP1zsGBqF++aL/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DHQd4xQFQhjs7+HpIMoL+A5cSKCnl7mAW2/H7cR4JDwPN6yz4+GitMmEYPvk8JqKVn/BLEkgMCN2/UYOjYsTqo9XpK4NxRUVV2llTMjECDpXhUnLmIdkgM+NK8MCuzhq3pQXvulMdeR8Z+834Sc2nVEm3P8BHsZYRZUlk/h6kO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0QF0w4f+; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0QF0w4f+"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-73b5350980cso547351a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 05:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751545690; x=1752150490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CQOX2bCYGxP3nqwfchundKWBgCNNg0w16agVTjZVQEI=;
        b=0QF0w4f+fw8UC700Wv7UJ+VBlcMTygaM7mZjBnb58RZFwXrMOSy6xDCQp8oNaevcbj
         4vCXTMMEeLsaEjis2iSS4RaATrQjK6j8sQ25z/xfjzxbRN7fnEHIqNiCXSImjL2oKPvL
         a5BZpAURQHLsQqC68qRP5zGK5CUe8OlL9WY/zLY7VMsRR/mDDjXIWVl3h/Ck+afkH2y/
         WhgZFU2Ju31VnTQl6KHCzffl+wz7ky20huPN+cSb1luwFhfL23WzkrUcHNjey8cArkEr
         k80EfZOVwOarv87EnuEPSeyOAVIJjUPfrL/ea8Wob4T3rygOt4+wsFODSxtPFMhm5htF
         XmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751545690; x=1752150490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CQOX2bCYGxP3nqwfchundKWBgCNNg0w16agVTjZVQEI=;
        b=Va/Z3j5Mumf/SjD+5pg/EISne1iyW9ZKKJhdhOAFYWufBdkDRxnD+IaTGyI3OevGVA
         Z8JCsXmbX6u+K2NbFbz6GDsz/QXB4UBsBuvMjtbTW/bWevgAmIVxA3OpGnsYHHKiAVDQ
         QYYxyEROEZ6rTWVvDCFnec71yNj9nfluqL0jzeUoKuJcZMcv0F8T3Idtj7OPhufmQTwA
         iSLoJ6o11UvhNh2/qhZG+pCiuA/8qsc5Qzb6d/VgvRK8OJCATnrPyrfB7XnW+JcP48Ps
         6m745QyctXZgmvHhFhPf8J4skNzQZjxfwN+y7LJw5ueSX5nkpDSikFBj3xDlG/XgVpPj
         nCng==
X-Forwarded-Encrypted: i=1; AJvYcCXcAn80+0Vjz7V1Ny60tD6KFNIuXphQ3+GOwDvSzkNKz3Kv6sY0U85PYoEsW5mmM2UZ9lAgGR6REcXlk3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI3ZMBeV6D7ySyl5HmLIqOJyQToMUJGU6V6IHVnovLCu73+ccI
	Nctfpkj+2WRcA48F8B9p7DHI6SeyPr/QK5T8vNKYR5gxpyu2gpyaUxJO7t/BEQQsbbs=
X-Gm-Gg: ASbGncsrLRPsRi4XIy5KB3gFPMslMHqsime2hnY5bekVss0utg5tVXpMuUxZmW/1fgV
	j3g2ZoFQ8V+tKoWaGMWuJJksDPoYLxdhKCNHmBn9tUBf+tioZ0WoW89D1wkPIsb5Zkx3SUVffhJ
	31yfhEpcfx4NfdUs0c1F6P+s2fMmaglTjUUj987+xw4UWuiCeD1CQV77bcxejg0VvmxSV6E1b2i
	Pdl44XNE58D1zbZmocWq3PDScaX2NmUwJ09pWYT5xuhUQZl8+/64qk9QM16eaCsfBn/hK7Zvuqe
	0GKkBxwHFVtwbQH9/e+JVjzOY+omo4ADAaZ3irLtFhWPZDKTlRngXBYoylNZNbxNDC6gwWV9gzz
	tK7joQjWHaGs+DekK+aOPAeagrpmV1Z5wC+xTadc=
X-Google-Smtp-Source: AGHT+IGqc5LcxnZGH4pFB8Kic92Bfiq8ngbiGeDjZRrypBSEyQOjixQHs54dBB6M5/TaIr4sv7Kp7A==
X-Received: by 2002:a05:6808:2e47:b0:3fe:aebe:dde7 with SMTP id 5614622812f47-40cf2f297a2mr1385913b6e.2.1751545689623;
        Thu, 03 Jul 2025 05:28:09 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:5c00:24f0:997b:5458? ([2600:8803:e7e4:1d00:5c00:24f0:997b:5458])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b32421047sm2955454b6e.41.2025.07.03.05.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 05:28:09 -0700 (PDT)
Message-ID: <b0b0443d-143f-4e41-b8b8-91c6726e838f@baylibre.com>
Date: Thu, 3 Jul 2025 07:28:07 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the iio tree with the spi tree
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>,
 Jonathan Santos <Jonathan.Santos@analog.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 linux-iio@vger.kernel.org
References: <20250703163824.2f08d866@canb.auug.org.au>
 <20250703093122.00000684@huawei.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250703093122.00000684@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/3/25 3:31 AM, Jonathan Cameron wrote:
> On Thu, 3 Jul 2025 16:38:24 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
>> Hi all,
>>
>> Today's linux-next merge of the iio tree got a conflict in:
>>
>>   MAINTAINERS
>>
>> between commit:
>>
>>   e47a324d6f07 ("dt-bindings: trigger-source: add ADI Util Sigma-Delta SPI")
>>
>> from the spi tree and commit:
>>
>>   0dd88eaa7126 ("dt-bindings: trigger-source: add generic GPIO trigger source")
>>
>> from the iio tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
> Thanks Stephen,
> 
> David, do you prefer these merged or kept as separate entries?

Ah, shoot, I forgot that we had added the gpio one and just made
one section like this.

I think it would make sense to also merge the new adi one with
the reset to keep things compact.

> 
> I don't think it matters either way in practice though this is the
> more complex merge (the other being just putting the blocks in order.
> 
> We can put a note in the pull request on preference but ultimately Linus
> will resolve this however he prefers! 
> 
> Jonathan
> 
> 
>> -- 
>> Cheers,
>> Stephen Rothwell
>>
>> diff --cc MAINTAINERS
>> index dd764b947dab,d0809d62ff48..000000000000
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@@ -25333,19 -25201,15 +25341,20 @@@ TRADITIONAL CHINESE DOCUMENTATIO
>>   M:	Hu Haowen <2023002089@link.tyut.edu.cn>
>>   S:	Maintained
>>   W:	https://github.com/srcres258/linux-doc
>>  -T:	git git://github.com/srcres258/linux-doc.git doc-zh-tw
>>  +T:	git https://github.com/srcres258/linux-doc.git doc-zh-tw
>>   F:	Documentation/translations/zh_TW/
>>   
>> + TRIGGER SOURCE
>> + M:	David Lechner <dlechner@baylibre.com>
>> + S:	Maintained
>> + F:	Documentation/devicetree/bindings/trigger-source/gpio-trigger.yaml
>> + F:	Documentation/devicetree/bindings/trigger-source/pwm-trigger.yaml
>> + 
>>  +TRIGGER SOURCE - ADI UTIL SIGMA DELTA SPI
>>  +M:	David Lechner <dlechner@baylibre.com>
>>  +S:	Maintained
>>  +F:	Documentation/devicetree/bindings/trigger-source/adi,util-sigma-delta-spi.yaml
>>  +
>> - TRIGGER SOURCE - PWM
>> - M:	David Lechner <dlechner@baylibre.com>
>> - S:	Maintained
>> - F:	Documentation/devicetree/bindings/trigger-source/pwm-trigger.yaml
>> - 
>>   TRUSTED SECURITY MODULE (TSM) INFRASTRUCTURE
>>   M:	Dan Williams <dan.j.williams@intel.com>
>>   L:	linux-coco@lists.linux.dev

