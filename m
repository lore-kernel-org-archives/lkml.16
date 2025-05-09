Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9DF27FD7C
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746782816; cv=none; b=aEM+TuGaBi9uN3qE39uUCOyOPG1rjNRuT3uMPiEjD0sYqtvVmb8kxnIhZlzdih/IB9QDoY4yuyhANtoeUzuyc+gr/ne+KYsKrAWM9A9HO780oyPS2iEradN9cpDclXi1K1A99lLKhrBJIfA7+1mBYatzkMyLF77ZOwSPvFL9Bcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746782816; c=relaxed/simple;
	bh=+g4Nr3dERA0P1aZoYdPBQ4jqF2BLvFkj3ONTv3PdxJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aK5tg6s07J0w/9cEzhCuusK2OZRp76h2lXT8qPl+TFTgF4DhPSur4owKckA+nC2+vD1pAJbrpxupZ64Oq0JnQbag9BvU5bIRGfC/ajtbHSY+dcyUgMjNo7nASb9+ABZYOTJIWMVqrvhsF+9qyGYzmJWCV3nwktxlpQSfr3el8xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UTgEhadl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UTgEhadl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746782813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=REI5eNUPcXCMM7B5bDInrS866zgHWs2jaw8sT9NyvpQ=;
	b=UTgEhadlLzqFmJ0cB+97m4gojsOKLvFDxo70f8khyokgyvNM5SoAoK7DrX8SyUhsoz25ON
	yObnHXnG2ILGNPeKlVaDL/eo2Qmdi9hT5sxc08NYLtUOPFVRccbP9EOxHBqWkyklFuKN34
	0kGgv8PkbioOvUhKonmNg/SoxR52WcU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-dWiTwrAcNTuBKjAFLj8OSw-1; Fri, 09 May 2025 05:26:52 -0400
X-MC-Unique: dWiTwrAcNTuBKjAFLj8OSw-1
X-Mimecast-MFC-AGG-ID: dWiTwrAcNTuBKjAFLj8OSw_1746782811
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d4d15058dso13464285e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 02:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746782811; x=1747387611;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=REI5eNUPcXCMM7B5bDInrS866zgHWs2jaw8sT9NyvpQ=;
        b=tSUM9IcXWGXNaoUw1EKHT1aRcD8CwWrnSZZKCSTif86TemuT/eoU6l3qbae9GDERxT
         Wc9GmG5O/AZrX+dBNc5UJVSeM/WNwN+2Ioa3uvPqYPtZh9fIUQoRtjQw/asFndXndKS9
         AgoTZ+UeaFwG1XR9cEIsWOrJapBovVrw9GoVCnNIirLeZ5D13WFJVQvAir1ydlPLU0Em
         AtRnCIN2pQ5uTbyCqoLy8XUrslTwEGjCtq+nWHT5xYmhM+myla8PJ2uC9kjzfZnNYtnb
         5on189anpwIHmPkXQgiJDg5ieCr407s2jp9KO/izax34Wxg/ap/3wPrdep/REtpGNPt8
         kMAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMwK4jukead4RwWBkr3sC0tk00grEo591OhOhmDC+iBfIJxNzltMajJfeHDr/uh4EH8OZzELtCgmbOtSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp0oM9gIzeReYMtS+dBLFci5VIuhQTMlpgga5+zKj0UOizc1mD
	7PDJsUPoXyPtrPtjCOXwWqxSGInrl+LJDpqN2/M5Q3RdJaOWbqROSH/jCsf+E7ie4rmP5xL0PAg
	sPZ4AqMHBzI7OmEvZ02EMhmzNV5oYm0WlgQnXiPGZerEcZPDvkzas8FMm0e1auQ==
X-Gm-Gg: ASbGncu2jxd4ZsH5YA4ktuXz6ziNfxF1hy8W0mrp961BB4fqM8Ze3ZDmBtHK634C36o
	Y2vcIAV68V/Waa2pgkBEjaAS5uLtSMmN76fCi58UjX7AdnkYOt4vFHd8lEmT5tOlG98mYYPDPEW
	5yl3IM20MT4ybR5fQebp7ka2snwM5Bl1xHN+cLFka79TBIDUe+T3JeOOxR6VC+pBDKJnAxIV6jK
	oIVbzyPBSQprj0eKO2VqALBhWg69SW3QVI62W3jqz1diXI7T5GPzrt31yUSYaK/mrCGGfRvNt7B
	u6MspnXSLFwSCHhobZ7U3cdU5HkgjDfLP7ln4GGOFJdeEK+DaztPo7tVK57dGmZrqSqUSeBIYU2
	qp4gJabIFHEXaElJYLWFA48rkMQHYIxezZYfUqgY=
X-Received: by 2002:a5d:5f4a:0:b0:3a0:b563:2451 with SMTP id ffacd0b85a97d-3a1f64276b1mr2167880f8f.5.1746782810986;
        Fri, 09 May 2025 02:26:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSNKT7IHrKAojdKB2nWJGVtzNJ6hMbiIrKKqFcnIbOPXTYq1x9jzhXpNlgnyhSQplCVrWJFw==
X-Received: by 2002:a5d:5f4a:0:b0:3a0:b563:2451 with SMTP id ffacd0b85a97d-3a1f64276b1mr2167859f8f.5.1746782810525;
        Fri, 09 May 2025 02:26:50 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f45:5500:8267:647f:4209:dedd? (p200300d82f4555008267647f4209dedd.dip0.t-ipconnect.de. [2003:d8:2f45:5500:8267:647f:4209:dedd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2ce36sm2655932f8f.71.2025.05.09.02.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 02:26:50 -0700 (PDT)
Message-ID: <ca31408b-d882-48da-b69a-4b7ea7a0ac5e@redhat.com>
Date: Fri, 9 May 2025 11:26:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Optimize mremap() for large folios
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, peterx@redhat.com, ryan.roberts@arm.com,
 mingo@kernel.org, libang.li@antgroup.com, maobibo@loongson.cn,
 zhengqi.arch@bytedance.com, baohua@kernel.org, anshuman.khandual@arm.com,
 willy@infradead.org, ioworker0@gmail.com, yang@os.amperecomputing.com,
 baolin.wang@linux.alibaba.com, ziy@nvidia.com, hughd@google.com
References: <20250507060256.78278-1-dev.jain@arm.com>
 <3fe90c96-da4d-4240-bd58-0bed5fe7cf5f@lucifer.local>
 <e258ac09-2338-49cd-a9d7-8e3be8045d8a@arm.com>
 <89f33688-00dc-4073-90f4-657b6527cec4@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <89f33688-00dc-4073-90f4-657b6527cec4@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.05.25 10:44, Lorenzo Stoakes wrote:
> On Fri, May 09, 2025 at 10:57:05AM +0530, Dev Jain wrote:
>>
>>
>> On 09/05/25 12:05 am, Lorenzo Stoakes wrote:
>>> Dev - a general comment here - but let's slow things down a little please
>>> :)
>>>
>>> The mprotect() version of this is still outstanding fixes and likely will
>>> need quite a bit of checking before we can ensure it's stabilised.
>>>
>>> And now we have this mremap() series as well which also has had quite a few
>>> quite significant issues that have needed addressing.
>>>
>>> So can we try to focus on one at a time, and really try to nail down the
>>> series before moving on to the next?
>>>
>>> We also have outstanding review on the v1, which has now been split, which
>>> does happen sometimes but perhaps suggests that it'd work better if you
>>> waited a couple days or such to ensure things are settled before sending a
>>> new version when there's quite a bit of feedback?
>>
>> Sure, I should have waited my bad, I usually do, this time I was in a haste
>> with both series for no reason :( thanks for your detailed replies btw!
> 
> No problem, I've done this in the past myself haha (sometimes even faster
> than you did :P), just a case of tweaking things to fit the mm process :)

We've all been there, desperately wanting to flush the todo list ... :)

-- 
Cheers,

David / dhildenb

