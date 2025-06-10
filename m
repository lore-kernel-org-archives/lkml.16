Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59196279789
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749541927; cv=none; b=oGth3k88JqN7ueKm9UXePTt/7eqlHIWeTVDmvmzOmUbUbgVqKitsvlDagpRp3yii+6eC6eUBmifghQqvG1uQy3JeV+HiNAxV7ACNEXlOqgpDerKlXpdrm23RRtsvhd5RADJrwjI1ws4h5kLxwL1cWYny9Lg9frLrv8XS0j2RscQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749541927; c=relaxed/simple;
	bh=oIJ9yiO42voEkixXV08CFs+J9ellp6GpIZIun1LKi9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i005K0uHnw5Bj8kMs4+HtYCoyXBmQBr35osFGHtHGAo5FxmcUGh8omJ65O00cwN4csyFhyIn62Tq2LuS1hSr7qpDPxFRDH8xy7Jtp9PojIiU7jvO1I7srtAmZZiki0yRBso7s5QPTMh0zwbM9nwCdXU8pAiIO6L5WUljb39ThMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Odr8zD/E; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Odr8zD/E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749541925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lR3dwAXxDbOT5PsQULHotrQMeSlknkHEmRR30onTPxo=;
	b=Odr8zD/E8CItumnhSFveCRqH2kSv5tOE5hDNlE2/cM3lU768Md3rOVkxlBIpXLJFX9FVpp
	AKsbxnGaG3x9Xv5kSSjfvdZOzdx2bCYGtVfFC3o1jvSFvg6OmjVHrN9Jm342i6Q4jP8v7k
	vC0tTHqFzpBKXQd8gnW1x/XfTYRWUJs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-FM_DhtmGND-EGX_aWNS1fA-1; Tue, 10 Jun 2025 03:52:01 -0400
X-MC-Unique: FM_DhtmGND-EGX_aWNS1fA-1
X-Mimecast-MFC-AGG-ID: FM_DhtmGND-EGX_aWNS1fA_1749541920
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450787c8626so29232645e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749541920; x=1750146720;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lR3dwAXxDbOT5PsQULHotrQMeSlknkHEmRR30onTPxo=;
        b=MYtrszY/NJ8CepL8eFcyjhjgIHTv4BxVUuBxjlld/fc54Ar96my83BxpDltvVwiKx6
         bWwJ3GuwgNd/Sq/7Iq/s/tvjKdflo9Gh3BxXFNWeHtY54pd469gAEjLSlTxpznJUw/iS
         I9GODbRwVrV8F/CX5QKEnkimhB/EowljHVKqWMhlnaLVSkSJVZ0BkRqyqBlP3ZQ/iDZA
         fU4HNaIX3Ux3WFEHOt89S+DxGVWAi31MP0AhGnUA4LvMEye0u4eR5PJeTsKdqfrJRJWE
         s8IjgQil8f7dDcpZ1A8voFIOW0ns8Ke5eUCheU+o5oFz7egDZdYEm2trubVw1tr933S7
         zjTw==
X-Forwarded-Encrypted: i=1; AJvYcCVCr3BS1MloEkdpb7MD+JmrC8hWdPeGuhra1nfCqdVrREq4pvayUTtizJ01GRzYA++ZUNxWiS3f2NSb4Qo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDIRtoUEjMJbPHxvchQ1jK2q1HvAATMoZm3m24J9VPBfuL48xu
	ED0nFWI74y+Ca9pwtb6WjWCk5/9QsX+TrFTsG740XFIuamNl5h4xDu9+0s4kYChMSVcKyqj64bH
	IQ3j4gTHo2Yp35ShgOkCxMPlJYKpdiO3n2bB6iwOVHwvFeC+G2mASLo5iHbnUbQ1Zig==
X-Gm-Gg: ASbGncuyAn8JMgs8VHPMyoi4UsopPgjz/ttKbOARGA1zVfg4MaprKapidVW3EsiNcBz
	AZSWIVoPm3AlUKf3bbOyMNqbz8kSChhn0THhs74DYKzfozr3lA/piI/n4N/FQr1PRFIJH1iWIN+
	P6Al8OdShenGhKK/lfrmTyXYQUf93cGdaH9v20ff9cguJv4Qn8ux0qnLclwlKdcUQC9v4eqKbV7
	DiOMUYGhcPYowqTleGXh2hofpvrp/85ZwOyv0aqcN8iVyiup3vLES/uUnNu5lag+6n0SInDtVVy
	N/Ctfi45xxAnnGPjCDWOTYAdEwiMLNFyTV7lD4giRo7D8/N4E3sS2Us=
X-Received: by 2002:a05:600c:58d8:b0:43d:17f1:2640 with SMTP id 5b1f17b1804b1-4520151f219mr94765215e9.26.1749541920368;
        Tue, 10 Jun 2025 00:52:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+Yr9P816ItykzAj3SLfutEc/D4lAhT0M4lDjmKNbngJDIgVPf6OiejdYbq/JViK0voP8w4Q==
X-Received: by 2002:a05:600c:58d8:b0:43d:17f1:2640 with SMTP id 5b1f17b1804b1-4520151f219mr94765045e9.26.1749541920011;
        Tue, 10 Jun 2025 00:52:00 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213726c44sm135380935e9.28.2025.06.10.00.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 00:51:59 -0700 (PDT)
Message-ID: <f067dae7-ba53-4528-bd3f-5ce52797701c@redhat.com>
Date: Tue, 10 Jun 2025 09:51:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/10] drivers,cxl: Use node-notifier instead of
 memory-notifier
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250609092149.312114-1-osalvador@suse.de>
 <20250609092149.312114-7-osalvador@suse.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250609092149.312114-7-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.06.25 11:21, Oscar Salvador wrote:
> memory-tier is only concerned when a numa node changes its memory state,
> specifically when a numa node with memory comes into play for the first
> time, because it needs to get its performance attributes to build a proper
> demotion chain.
> So stop using the memory notifier and use the new numa node notifer
> instead.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

