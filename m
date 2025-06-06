Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E41F1E25ED
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 11:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749210545; cv=none; b=Xxps6UQjFY+fSsUSfSmMx91vnGFI6jDBFyCEHxb2cxDDI2Y0GQpqQzWWSi6Y/Uwm2yceh2hw0fahb+2Fya4QST5j2GmH7kh3kTCpZ80w7vmhJXLOBAcUxJayV3UwrwdW45A7tElI7WsFqvIvVLFwT4R/EZEeRGzB3EF+32kMfFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749210545; c=relaxed/simple;
	bh=QSgOuHX+lE3ODZsvtKyyXyB68B5X60hsY4EiVrM8vYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CE+CcgaeLppTMo402iP3YyaT5GsCIBXi/B//oRtf+Oy1LetZWkXCclme+23yl/beyjjcIrwD/I/l6451W7ThINJNggW5NiNUVFUDeImqEQbZDoNLeUmJXMpsKMH0B7N5yDM6C5ZPq4mmQ6k+o1dkBghB4zOmh5bPWdwSvmjnXBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VpfbzX+x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VpfbzX+x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749210542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=68I4Y0TtXFxCNK2N6e3UcQSOeAu/7hc1LBplwDcwTcE=;
	b=VpfbzX+xj690SHvo5t/4ZxizXucWqboSSRtEA7Puf45VPWbj/fGIDvdh4wtcaPGtZJw4Ck
	bz1yMqdkZlMfR0C0sOaBTOfyH6++3XdRY+s0bCmLWnmEP+oARUeXNOOt6fQ0VnSR/jBnGu
	33LD9pzbybQx2YsV5FNwdD3VdIi22y8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-1_HFG19fMci0tdrRIEwZ7w-1; Fri, 06 Jun 2025 07:48:59 -0400
X-MC-Unique: 1_HFG19fMci0tdrRIEwZ7w-1
X-Mimecast-MFC-AGG-ID: 1_HFG19fMci0tdrRIEwZ7w_1749210538
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450eaae2934so17072385e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 04:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749210538; x=1749815338;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=68I4Y0TtXFxCNK2N6e3UcQSOeAu/7hc1LBplwDcwTcE=;
        b=qtsnxVDMLhkfr5V/JpPk20hUgqwMgcESHSHY6B4/aKC2xZyf0ZlE5IuRXu44kE/HcV
         ea8VwTGnG3wUpdudaSn8JlDag6+xSkc3Yg9xCGlV8ZWb5GYW8WYX7U6A1FmIecqWBkpx
         YNMNVjiyX5JG6DMsF7EO0zr0b3eP461Xv3NFr9Tlnums5DhevIE+qg8BcCMdmTeZxibb
         ncy/7yOTc92YGb0xBXws/QOHTw90wzCDMxUSAbDnt/X68yIXV6/dyX4itMWoge7C6AYO
         CrWdC7RfBxtowA+ougko4TEC+lriGglVzA144CPwv3ynz3NyH5yKbt8Z0U2SU4o0bo1j
         HZHw==
X-Forwarded-Encrypted: i=1; AJvYcCVT1X+H5u2CMmOUQqFXUNll4jhGyatBOVMLFiqLu7IciAhiwvKxIdSrny/VawTjaqAzMnUUjWbpVof+H6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCM0yMMjvjjjvTxw2sbWnjI9PZQN9n4824YlUoQR1Am9Wa2zZE
	5e8X1g5nIzSss+culGofL077D+fYXlx+YdYaS/vaXe2POFQarwiJ1HjQiYRtsjT00h7aF5xHkoj
	AE8Ctrbs5gRkW0Z8VNImWNuDARR35zw1tsTgwH7RvSDLMG9LyKOPzh7Zswangqq34bA==
X-Gm-Gg: ASbGncuA+zIWYw4fMR0tZoX1s2cc93pCnLzpdJXBoQRwclwxPw4ZhC0m8b30JKz70Sn
	4JY/G5FvRfiNgK2GEvCdPNu2XsDzHKNEwDqjk8M4jM2bPf3JdYJDYtK6uSfQbnbF3FEOmVjcYds
	CJhKzRplBiJ/MnGarYkTyOP7iNoYtppsA84MOHpGSNYAY893c0QQlcAp4LdGcpdkAcYSnxhS1Qb
	ZDu3HW0R4G+y4aKr02S12IFVoyA/Of8iGTseR6MlxjxEep0QwYJ++ihBsTfmz1ex5nnWq03ii3f
	H6ETRhc3h19qbsy8y4HKNt00C89ohYDt0/B5NemGrciPySbMMFcybnBghTInRDSm6zIGthytXM+
	c91DZ5wDd1Qhb43iyGfpws1IvRqEULiw=
X-Received: by 2002:a05:600c:c491:b0:442:f8e7:25ef with SMTP id 5b1f17b1804b1-45201458425mr27983495e9.11.1749210538465;
        Fri, 06 Jun 2025 04:48:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrdtAx79g1V5j+TxA2nNneOf5lDgPUH5YR6LNlzqQQIXuJ4KSCbPsPVZoiFWxBNVvQB+bDmA==
X-Received: by 2002:a05:600c:c491:b0:442:f8e7:25ef with SMTP id 5b1f17b1804b1-45201458425mr27983285e9.11.1749210538017;
        Fri, 06 Jun 2025 04:48:58 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:9c00:568:7df7:e1:293d? (p200300d82f199c0005687df700e1293d.dip0.t-ipconnect.de. [2003:d8:2f19:9c00:568:7df7:e1:293d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229de70sm1615032f8f.5.2025.06.06.04.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 04:48:57 -0700 (PDT)
Message-ID: <70f3fd39-6b78-4b2c-a09f-ec1e7a2c34db@redhat.com>
Date: Fri, 6 Jun 2025 13:48:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/10] mm,memory_hotplug: Rename status_change_nid
 parameter in memory_notify
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250605142305.244465-1-osalvador@suse.de>
 <20250605142305.244465-11-osalvador@suse.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250605142305.244465-11-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>   struct notifier_block;
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 0550f3061fc4..bccbc02ed122 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1186,7 +1186,7 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
>   
>   	mem_arg.start_pfn = pfn;
>   	mem_arg.nr_pages = nr_pages;
> -	mem_arg.status_change_nid = node_arg.nid;
> +	mem_arg.nid = node_arg.nid;
>   	cancel_mem_notifier_on_err = true;
>   	ret = memory_notify(MEM_GOING_ONLINE, &mem_arg);
>   	ret = notifier_to_errno(ret);
> @@ -1987,7 +1987,7 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
>   
>   	mem_arg.start_pfn = start_pfn;
>   	mem_arg.nr_pages = nr_pages;
> -	mem_arg.status_change_nid = node_arg.nid;
> +	mem_arg.nid = node_arg.nid;
>   	cancel_mem_notifier_on_err = true;
>   	ret = memory_notify(MEM_GOING_OFFLINE, &mem_arg);
>   	ret = notifier_to_errno(ret);

Okay, now I realize we should just remove the nid completely, because

> diff --git a/mm/page_ext.c b/mm/page_ext.c
> index c351fdfe9e9a..477e6f24b7ab 100644
> --- a/mm/page_ext.c
> +++ b/mm/page_ext.c
> @@ -378,16 +378,6 @@ static int __meminit online_page_ext(unsigned long start_pfn,
>   	start = SECTION_ALIGN_DOWN(start_pfn);
>   	end = SECTION_ALIGN_UP(start_pfn + nr_pages);
>   
> -	if (nid == NUMA_NO_NODE) {
> -		/*
> -		 * In this case, "nid" already exists and contains valid memory.
> -		 * "start_pfn" passed to us is a pfn which is an arg for
> -		 * online__pages(), and start_pfn should exist.
> -		 */
> -		nid = pfn_to_nid(start_pfn);
> -		VM_BUG_ON(!node_online(nid));
> -	}
> -
>   	for (pfn = start; !fail && pfn < end; pfn += PAGES_PER_SECTION)
>   		fail = init_section_page_ext(pfn, nid);
>   	if (!fail)
> @@ -436,7 +426,7 @@ static int __meminit page_ext_callback(struct notifier_block *self,
>   	switch (action) {
>   	case MEM_GOING_ONLINE:
>   		ret = online_page_ext(mn->start_pfn,
> -				   mn->nr_pages, mn->status_change_nid);
> +				   mn->nr_pages, mn->nid);

Nowadays we call move_pfn_range_to_zone() before MEM_GOING_ONLINE.

So we can simply do the

nid = pfn_to_nid(start_pfn);

unconditionally above.

-- 
Cheers,

David / dhildenb

