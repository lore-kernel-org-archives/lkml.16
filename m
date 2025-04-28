Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD2120330
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873698; cv=none; b=hEUxwN0BjxZRvrN2ywZMI9D6qEAcE9Qaz3xdYrfpQ/hSTibUYTc6+9tC9DBrNHHygxEmJDvOSM/drGu3P4aw882EBGtybejABZD06rqBbovGuUa+zk/R8k97MWKaYf+edMtsMaxICM4ymuVzEDPRuk9858+p/uyNmDqBdnozKWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873698; c=relaxed/simple;
	bh=KhvcLvd08gHEQUWX+OWzE4XdOsnFHsAv01Lgj6Sr0A8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pwxQwlFV34scLquLpjL90CDykXac7gpgxfxgB5FQc/5ZKp9S1qP7TG9UEi+IBzr53IOjj9qEpGkPXtuFi12w/HtuV36hRfsRdFJvQF96/GrS089OzAbM1BWl022mzkpDCsEDDXWYSDzDWd7HZw+G33IzIJBB3PlTzGnuY3IukdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F7D+V/rE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F7D+V/rE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745873695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PqcpNNyLingDb4R7LEbmsqH+I+020RY/OlGZoSq7qPs=;
	b=F7D+V/rEfPtcYI0O8P36tVspP8L1RjL/aNggVMoH0lHaka0oEY7P9oBhMNgE/lWgCJX24E
	h3mZJA/nznAhJEzBOlnToff+N40nTzVNNVzSDNdruvRxFi73V17NvyZK++PY0bj4XTNW8A
	C+7lv7YLk3/eyKAbz64vXKuVWJ6lCxA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-rSTt-3AHPXSfeK36sC8Yug-1; Mon, 28 Apr 2025 16:54:54 -0400
X-MC-Unique: rSTt-3AHPXSfeK36sC8Yug-1
X-Mimecast-MFC-AGG-ID: rSTt-3AHPXSfeK36sC8Yug_1745873693
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39ee54d5a00so1667632f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873693; x=1746478493;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PqcpNNyLingDb4R7LEbmsqH+I+020RY/OlGZoSq7qPs=;
        b=VpfxFG9hrZdVwmRphwyn+R+JH0H3bgrxPgHlx6RFRPUzLr1YJoKfHO3to4uknzwyqH
         c+qMmhD+kY9KCYWmTwFvI8T0gJ5ay3EOWkf4zm/sX/+2dstVKGlTYnGAK4+j8DXxyMlY
         Ij8U6soVOO2EPTpuFwZw4OOYss2+qf6UOtHyhzX7vY3mlyZgqvTyXypIB/vMd1NCnw9f
         POuwHjOTwLeVZSrS3tv3+f56zJ3rSoKVSERwq8sLOPvgxXCS6N8LWBqndF8kj4cs0t6Q
         DElv1KhfdZlEguMQvV2fpVLnXWdq3k/IPRREfIoRvADDw6nso3GRGSEPiCAY3lWxsx5z
         aIxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGUvHKnxH348624R/NBtvQpHIf3nnTBNpCorh3O0oi1LJnInW7ppJE7JxwVS14ms3aPsZArWSAt4CHwG8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0uK3AqwboyeGbok8m42v3sB/dylx2HatN4VpKk/zmk5PD4dik
	bK4kkZaNpjeKr6WTuMAbb7QKUuq3U5p643GeGzvowjmAGQtEIPGDGlST61d/Or3IZCYiuQmnnn7
	3dp/ZnwA74hJGSjJtOzSa/WslB77KKg6GTKlq14rTu3rqfnuUtJ5Fxp7cu6S6lQ==
X-Gm-Gg: ASbGncu8kr+lbkoWN3pKGvQpMyEoquulGBt5K3HG2wuZApJQqHd/n5M+i4BSMHmVrU0
	mMB2FUR7qJNtyK/Pv8fd0IMWr+KIYMHGHoac45YUZZbZZK1uBu4UCPLO8uNHbIF8lcUjT1Awxjl
	DNhzkytEaprkObF/Tj2h+7H5gJDVmt7l3iT/Jm3GEJn5rEJVt4wsqLDnlI9rwuAsvd8ndwvXsa+
	1gy3Vu5loRjmwxte+ft4OXQAC6iNMzh02u5/l7qi+2QkhkqskcxngoTa40clQvA2gJlPf7S6jB1
	J8QgLW5t1Nh7tPYfkefpwaZDu4QfVKoGE5dsSE7LSfH/4GrjoodtA+o2LZtti18X6c2PA8VtmcM
	T5nhtCNquiiPQLV6064UfJrhHe35OlZPVDBmNZ3w=
X-Received: by 2002:a05:6000:144b:b0:39a:ca04:3e4d with SMTP id ffacd0b85a97d-3a08ad285c7mr163625f8f.7.1745873693214;
        Mon, 28 Apr 2025 13:54:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG75wwskIcTFrtWb0/VBOfygbam7bVUcEfkLo19Fp+EvsfhVX7mC95wHhCjSZ8YQ2jbotz1kQ==
X-Received: by 2002:a05:6000:144b:b0:39a:ca04:3e4d with SMTP id ffacd0b85a97d-3a08ad285c7mr163611f8f.7.1745873692904;
        Mon, 28 Apr 2025 13:54:52 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea? (p200300cbc72fea002f00e7e58875a0ea.dip0.t-ipconnect.de. [2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ccb8e1sm12244903f8f.59.2025.04.28.13.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:54:52 -0700 (PDT)
Message-ID: <3eda315a-cea4-455e-87e8-39e6b82d4afc@redhat.com>
Date: Mon, 28 Apr 2025 22:54:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] mm/hugetlb: Let unmap_hugepage_range() and
To: Fan Ni <nifan.cxl@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: muchun.song@linux.dev, willy@infradead.org, mcgrof@kernel.org,
 a.manzanares@samsung.com, dave@stgolabs.net, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250428171608.21111-3-nifan.cxl@gmail.com>
 <20250428123143.2b644354975c2b89e5ae51c6@linux-foundation.org>
 <aA_Z9R-vffyuwNyV@debian>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aA_Z9R-vffyuwNyV@debian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28.04.25 21:41, Fan Ni wrote:
> On Mon, Apr 28, 2025 at 12:31:43PM -0700, Andrew Morton wrote:
>> On Mon, 28 Apr 2025 10:11:43 -0700 nifan.cxl@gmail.com wrote:
>>
>>> Subject: [PATCH v3 0/4] mm/hugetlb: Let unmap_hugepage_range() and
>>
>> What was intended here?
> 
> Since I have changes in each patch in this series, I thought it may be
> better to have a cover letter to summarize all the changes in one place.
> 
> Should I just mention the changes in each patch separately?

The subject got trimmed, I think Andrew is asking what the real subject 
is supposed to be

"mm/hugetlb: Let unmap_hugepage_range() and ... " ?

-- 
Cheers,

David / dhildenb

