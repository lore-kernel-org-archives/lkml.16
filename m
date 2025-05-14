Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310AE18859B
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 01:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747186925; cv=none; b=eZo6FIsCuPl1/ePzGstlxEsClTaPnD8eJZJTMjnjJiJRaP4sLxmnH6rQzkTYQcrmskBj/YyLx5FAqem70yY6dmcRsEmqKYOfnrSkvtDWlJLwxraoZQzATJUyZM2T4Qr/+cd6x/X8wwPmV/R7M+10x2PhwwQNit7uC9Dn3oH/BbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747186925; c=relaxed/simple;
	bh=cGEgwZmgqQTS2ygoAiNzKYg+uSWno+UzEHA6/2/FQ1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AjMiFz0vr3iq8he7vu4uLvaTlUajNIr+Filp2jvUDoDUXXCH67QcLdjIXB0HCg1bnMIXESLOQzd2DnetUjN2gJJDdTCqyFHzfFCwmC/y6Ef3xeEbMHp4vPZtEVWyrPoA8phWyQ0aNItULprerFTQzEkSEnj2rwl+wYmp8G0ehdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDviCHLe; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDviCHLe"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22e6a088e16so2644565ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 18:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747186923; x=1747791723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=82tOiKYSlWiRPbo/gDIQRfx9of4V2dOX4JgTL8C7ii8=;
        b=hDviCHLe8n2u4eudVjCDHj7rsKAf2gRaZ0oDi+HxvgBoJY3TMwEyP055rkvBFNx97d
         qBF7/oqDznE6OzY/HjpsXVAIRaQAtRzpg/dQGzHJ17lIij87OCPJFq8woFVlZHB2838I
         uwEbpsdXV7bhbnozcxVNexkuaYOA66cJ/V3vAy3kMAq09IenvepvCvaCYCmniJ+NyCDW
         AhRucbN5A1oVXWus4bdsDJut9izFjnMQdFL2u2nM5Wp07RewX7UBPpk2PFKhANN0lMzl
         sYSBHCKKvwdAd1osGKHBnlu39qxmzRWG7rjTsEu6mdI6RGAXM+xjYGVct5PgGt8iIB60
         6KJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747186923; x=1747791723;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=82tOiKYSlWiRPbo/gDIQRfx9of4V2dOX4JgTL8C7ii8=;
        b=U3Us1JqvOhlueElPGM0hdNMm0AQLvnDJJoBEuQvYXdr7uwaJ17VkaNIgTbi2QMUWu0
         89OrN+8MKi3XsZ3PRz/awnpkHpTV2G++WajNTjZpeTaou7kAhyD35IWz0LxgFEga9MEX
         YDq9nj0IAXa53dn43M7/IPjejrYb2QQS4/sVvdHQ4UIuav1dbc69x6s2XyJ6cMvaRCc+
         Cop3yr3KqmjCeqCeMI7TqxXf+SRejU62YzO36CvWucBl0HXkQxIenc29CcyX3bNYeDQ2
         Z84Ie9B1cMwfVRVku+4LkcK8tR5Q8HyFRv8B9bF7bI9Rd6+n83XLKKIVnpNIjciy4puX
         fB3g==
X-Forwarded-Encrypted: i=1; AJvYcCXhzMsK+j3g6kobtoNJ9RoAsP3jctF4l4cXnIYgcvvKkqStgkpLo64w7QDNIi9uNLdRLKEzsdmqyUztBmg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+m/yWxrXWoMke2J8eeS4S4FGtKe9ZE2V+TwgJtPVawU/bvYFF
	qYDbSxqjOVG5c4U/7wQSDY8Jsf5k7+GMylPzgsAGVpqTsf8s6Nex
X-Gm-Gg: ASbGncsJ8k66ak4kNMLQGlsebJk6vHvyl7pqZnFVDTFebsNvZJpUaKjRYk9TogvPd5Z
	X/eIIrsIXPsU4hrse/Cw2RAZLeINGxkZ2Tq6DLK9N0J/6pgyY1qNCeJzBbtVlMRa8YfphLgqRNL
	GuxtEdv/SOLNsFmwG6ejStTmY2KApbw41L13AiJevnbRiqZQw/VAbl4jgw+i8uRLrnu6niZYdG3
	R+nUKtW0HvjL/z95grOJ+FeuQe5JtGztMiODEOyqvkd5+nLIysWj01RoDYVKlclm3I1Rz/zjFhd
	+HMAXyaB8xLDTul6q94ptMYRBVFwg/KP/NKM2ShgtVilUrpevEBttQlttUgRhgE=
X-Google-Smtp-Source: AGHT+IFIk7IJGw/uTRyIdBXZ7R74+M9tJir8t+7eJlq7ujoV0qWJhLnIh10ZuaUyIj7mBfGlJWXqbw==
X-Received: by 2002:a17:903:18b:b0:223:3394:3a2e with SMTP id d9443c01a7336-23197f92bb8mr22478725ad.18.1747186923276;
        Tue, 13 May 2025 18:42:03 -0700 (PDT)
Received: from [10.189.144.225] ([43.224.245.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc828b38csm87518545ad.173.2025.05.13.18.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 18:42:02 -0700 (PDT)
Message-ID: <f62b0d18-f5af-4063-b644-f6b8069ca200@gmail.com>
Date: Wed, 14 May 2025 09:41:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] erofs: add 'fsoffset' mount option for file-backed
 & bdev-based mounts
To: Hongbo Li <lihongbo22@huawei.com>, xiang@kernel.org, chao@kernel.org,
 zbestahu@gmail.com, jefflexu@linux.alibaba.com, dhavale@google.com
Cc: linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Sheng Yong <shengyong1@xiaomi.com>, Wang Shuai <wangshuai12@xiaomi.com>
References: <20250513113418.249798-1-shengyong1@xiaomi.com>
 <a20ac409-f8a5-48d6-9e8b-3c40f829bea9@huawei.com>
 <a78509f0-f333-4a53-a618-2f05a53ff91b@huawei.com>
Content-Language: en-US, fr-CH
From: Sheng Yong <shengyong2021@gmail.com>
In-Reply-To: <a78509f0-f333-4a53-a618-2f05a53ff91b@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/13/25 21:59, Hongbo Li wrote:
> 
> 
> On 2025/5/13 21:56, Hongbo Li wrote:
>>
>>
>> On 2025/5/13 19:34, Sheng Yong wrote:
>>> From: Sheng Yong <shengyong1@xiaomi.com>
>>>
[...]
>>> can share storage.
>>> +fsoffset=%s            Specify image offset for file-backed or bdev- 
>>> based mounts.
> Hi, Yong
> 
> fsoffset should be formatted with %lu ?

Oops, yes, it should be %lu.

thanks
> 
> Thanks,
> Hongbo
> 
[...]

