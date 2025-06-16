Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5232E4279
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750076470; cv=none; b=LU6p1eYoxNLvJ6Lr1upTcPHfikRcf134RCW63CoaJzvcH42JeUaEkiiUmqopUEoYexDO2uoB1lZyW1zLqcznSh5kpA+0KHH5oj9dLrmlxgggnb2f+lAHmiRVMzkyosepgQsCbaCvNVCsFmMCGZWO7iG8dgyD/zl+wepbK3V7A9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750076470; c=relaxed/simple;
	bh=GYZKUfNdhHxaRvB2VOptalYZ8vItJPtiQ13bmJRxum8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F0dyymwBBzDv1LfxF2gQfD8V5qUZo3yeVbzbWxmQFuHqcOvyudmGKYBBJS47m87+hkS9mqP4PZuyiNP11jBq2PMPaH7rZlKbq12dKvvdtNN6btr3BFgtc+0i3dKVyqFDUfsKGIgTDYisfxu+iQu+zarvgRhsIGhs60TTUw/8K/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JuvSkTmT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JuvSkTmT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750076467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rupm3VDCoAld/2pq6rtQWKArPHie9P4J1nsk+bgv55A=;
	b=JuvSkTmTgCsmTCvu/kn1ed2XdTvUeyLrX3osMG8NUoCT7S/mPEUOnVRby9rePUha6cpjgq
	TaX0xZQUZsCvZn5igGA7ykepl5+J54cmlunPrmZVdn1p4ycL+hcd8M7dDEzLMschL3u7pc
	a7Q9DPbIbQo97Pd0/cLCdIy+xBo+bgc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-YHXALDD0PrCrcaYgIoEgeg-1; Mon, 16 Jun 2025 08:21:06 -0400
X-MC-Unique: YHXALDD0PrCrcaYgIoEgeg-1
X-Mimecast-MFC-AGG-ID: YHXALDD0PrCrcaYgIoEgeg_1750076465
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a56b3dee17so1520237f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:21:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750076465; x=1750681265;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rupm3VDCoAld/2pq6rtQWKArPHie9P4J1nsk+bgv55A=;
        b=NagGwT6X9kb8X5yj795TK9rj4/8M5r4x2JI0NNHiK+2xigvIL05tHUzAAaVO1OKQid
         3O4rx1JvfY+phq/tqJ5kaotnCR7uJkUeCNssXHuFyHa4Zmm/zPecv4k4trXMsBdKtmaK
         Xhm+bnlekEjW0Rah05u47ae2kWhF7IEER7sA/EgkBjmlzukiVGwoT+asY69JTdSecJxe
         unIpXr5PxFAzYNL+GRZTopwyDR6eY8M+S15v1qqsl8vOLEIL8NYFxW0pX4rjLgIFnWhI
         m0EW35yOQVYA4GGgo5EhLEnWL/LOT5z3/gqwkUGce0o+TW3ZIPal/L1AkPWFpcPAeI4s
         22Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVNqB0EAmqIqQ3gAuOVRVaX8YqkhrZuDTF9VaD4P1TI7qjDx7ruEKIRawDu171X5p02T1J7UPX0zX67CMs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkpgA3ZP6wXbeCGsUr2AUmjsRqe3YfjhEZTbbeRJtR1fH1HRv4
	unRfhzmEM5Tpwf4UmsBqLhS9Z9ltM36lm7P3nKmuMwB3S3/RUKvyA7/+HpYVCx/gCgF4diOdazt
	Cl0ZRlU8AJE6Y4yOW0MzlXuZlzLjs9jHsZtKup1VrYzGsi2x7YcKetn+LpDZVFGSdrQ==
X-Gm-Gg: ASbGncuTy6YqPIHA4AQPirOIFCZOkP0r5x08J/+NL7AH7i3RQQZkRjYe+YJlGUsI7Uq
	hdlBVvDi7Ir9UXS0W3U40v4yaIqgfanT3uLtuPl0waFhiCm4nTboosbBi9lunxpue0iWRioimmO
	gyL0agXLzPkNQo7p2/U8VdNOLGzb+VR67UF9jp21PQqphEkM/gXdIMHaE1rWUoSrAiPmDltTYi2
	1GJUd/Ttzk+WDqiz3olEXf/SAbh2EATwM3OetQp/voA7pxczoVqgZQrc+tjnc9nWGv5zUT6H2Ll
	9BSOevMusjKzvllygkpOHdtA9OknQilNaxaK3QV2/xeBk0jXbDPkPv93GKDOU3+7Dwc9sNs+FcW
	fJpxQkstYjqIUVXgDkbizl66Po7fgjKEhRhRZW7DbdT5gwgs=
X-Received: by 2002:a05:6000:2486:b0:3a3:64b9:773 with SMTP id ffacd0b85a97d-3a572394d3cmr7106110f8f.10.1750076464855;
        Mon, 16 Jun 2025 05:21:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBAJU8h/LHlTU4YFrtHj4piRaDDRZSSm+aQpvene6in796GVuxj3NXu3FCTOyOQjjBYCHbFA==
X-Received: by 2002:a05:6000:2486:b0:3a3:64b9:773 with SMTP id ffacd0b85a97d-3a572394d3cmr7106093f8f.10.1750076464446;
        Mon, 16 Jun 2025 05:21:04 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:bd00:949:b5a9:e02a:f265? (p200300d82f25bd000949b5a9e02af265.dip0.t-ipconnect.de. [2003:d8:2f25:bd00:949:b5a9:e02a:f265])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5689e5f3dsm10951486f8f.0.2025.06.16.05.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 05:21:03 -0700 (PDT)
Message-ID: <23431108-b5b8-4c8a-8869-8f994371e7a5@redhat.com>
Date: Mon, 16 Jun 2025 14:21:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/10] mm,memory_hotplug: Implement numa node notifier
To: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250609092149.312114-1-osalvador@suse.de>
 <20250609092149.312114-4-osalvador@suse.de>
 <2bec8b53-f788-493e-a76e-1f804ed3aa0c@redhat.com>
 <aE_WG6bnjtLBzCp8@localhost.localdomain>
 <10c87a0e-c9fe-48fe-9bbd-16afd244b4ec@redhat.com>
 <aE_a4_rGbMLJKBIs@localhost.localdomain>
 <360f2f04-4542-4595-bf36-c45ed10335af@redhat.com>
 <aFADwYs9LcyK5tVn@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aFADwYs9LcyK5tVn@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.06.25 13:45, Oscar Salvador wrote:
> On Mon, Jun 16, 2025 at 10:52:31AM +0200, David Hildenbrand wrote:
>> Probably worth checking, to make sure we don't have accidental bugs in there
>> ...
> 
> I did a quick sweep, and we should be cool since users of the node notifier
> don't really use *_CANCEL* action. Only ADDED/REMOVED.
> 
> Now, users of memory notifier is a different story.
> E.g: page_ext will call offline_page_ext to mark the section->page_ext invalid.
> 
> online_page_ext does:
> 
>   base = alloc_page_ext(table_size, nid);
>   section->page_ext = (void *)base - page_ext_size * pfn;
> 
> This is fine, I think, offline_page_ext will not mark it as INVALID because
> section->page_ext is NULL, so we just skip it.
> 
> This is just one example. I checked some others like kasan and hyperv and they
> seem fine.
> And anyway, the we could already hit this situation with MEM_* notifiers, so
> nothing new.

Exactly. I recall I checked some of them in the past as well, when I 
stumbled over this behavior.

-- 
Cheers,

David / dhildenb

