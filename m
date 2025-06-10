Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9835027AC3C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749541866; cv=none; b=hswvBdLMx6cHlTXWyXCMY2uCqjkulvI3+77/8GOqYuiqlBypwlntyAdqdApi65rWE48UPSsZsFlu7zQNhqzMlAll3ZlZo29AXAehdtnZ6+CvPoVjSHCDj9RET/MDv3AZXUdaCQMPjSimCqAgkMQ4TJAVKsFDHTNMVVecvVRNH+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749541866; c=relaxed/simple;
	bh=gv29aj+vsAZrcB9WDoAepg8CpOoN3mNlSU5r6wtnsMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fcmOjP7CeHIzvJ9/EbytjUhnDKY/U4wRA0PYWF1XvFu4Bl3khloJHMpwa/sIIGi4pdpuyD01SqaZQ8uUDkzmywDb4fu3OR3PDQPP4i1lBbiQFSRY56QCICJX/NTSBoUowk/AHLt6w+/Hvaq81fFrGEOemujZGiR0ZO8GkoKPcmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BfIcVssF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BfIcVssF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749541863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+HkwxVBC4+ibjCGhT4EzzYacqJZb+Dp7DpwSu453xJY=;
	b=BfIcVssFvODqa+Bvajk1jRI0rcJwhIhBWluk52GiFpS5360KN2hJoQFatgsipxC86gDpEG
	RVNoJWrQIZYeQVxsixDIsKisYvKBjrMNdbdJFdvPEJZKM4AknCv+zjkJXLGpzO6F4e9qZb
	B2SMwhMpvDhaxs4ie0MfAHVlElcJDeY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-1JByTP3OMleeQtv5v2_sZg-1; Tue, 10 Jun 2025 03:51:02 -0400
X-MC-Unique: 1JByTP3OMleeQtv5v2_sZg-1
X-Mimecast-MFC-AGG-ID: 1JByTP3OMleeQtv5v2_sZg_1749541861
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6023d9a86ffso3650969a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749541861; x=1750146661;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+HkwxVBC4+ibjCGhT4EzzYacqJZb+Dp7DpwSu453xJY=;
        b=uTL43JcHZJs0+bS2HaonP1jbtwtrHN6XI+TNSAgl8NlBOBc49Q2P9MfIclycR5bjyl
         ihbj8gEKhKIXBz3Am5dLS5/0fisNDZ05suvfV2u8f2dIdN2KfageUlt8QrX12SH2/LSP
         bqVjpJ8EivSobIEmLyZE8dxJMGp37c/YBvC4oECQhqNQwYQSZQuGQ/MdAAnOBmpo3zIe
         ypi11xs0LcPYQEfQRBGBvOY6LzzAE6iqNhizo6COcCdB3fUuOrHcMQLpPamV7+JfdJsl
         IJWiRifxlvQFpY1LwZcPtqyVOv8DP6TcOS37U5csPGFdie8VnOU6qeLGfX6wo2YUOtH7
         o5rw==
X-Forwarded-Encrypted: i=1; AJvYcCWHXAd721LEZx1AlcTZ9LQa8hEeyMUz4LuIndLsE9fhVq8/AFUJ71mN31SZObtGVUvHnzRWMbU07fFVhbw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPkXLSgIth/iSNgA9/g/5maha/TpP5XQX4WbdCLFbGq8kO8lTq
	kxl06sqOFqRxBdx8J5w+eqkmviz/RIpdxeoH0VW5R/sHpEoDO5bs8nyeB+QEn74E/Vponhk7EZ+
	Xt1snRAil+WqjaDNoWiivAI28ZOzK3MBLONyWYoIpV6X7NjNzKwvUxQXPO12uycag7B4GXxVtJB
	23
X-Gm-Gg: ASbGncuVrTkM0f5Buro3uzTTuKRux/KTvd0Ain+tT5p1u8SpyTMz88i10xfeQo6rp2i
	BDkCJzCRIBwc2I37/8iWwyH7W9c6Mqj5OFboRAB8H5wq/cjpnN8z26M/b/y8t1fektgWIztRdMP
	lBscMiY5o3yjXmEBx/wo5OAwkIMv+oBsMchqu84vEAcwW9h33R8TwUMG2udDsENuAjL/G155J9P
	FsvCAtNAiLGD8BJdhCw/hPFPDBrGgGvDbJ7vAaf8YdatR5RQge020MIP0NSZpXCd266v2rbrGos
	oLMZdPd3BAkejGCDHBBAX509tK2NMeJ5f+F70qZCAiKKK5T23mhlgCY=
X-Received: by 2002:a05:6402:3241:b0:607:f34e:27be with SMTP id 4fb4d7f45d1cf-607f34e297dmr4805677a12.7.1749541861164;
        Tue, 10 Jun 2025 00:51:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZOxO7HmOVg2Bqv0PNb4bNjbX344ootsB/fjStGoxSlabISn+iJ0tQSYydCrQJeJtSR0ii9w==
X-Received: by 2002:a05:6000:240e:b0:3a5:1c3c:8d8d with SMTP id ffacd0b85a97d-3a531cb237emr13568205f8f.55.1749541847173;
        Tue, 10 Jun 2025 00:50:47 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324638e9sm11374692f8f.89.2025.06.10.00.50.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 00:50:46 -0700 (PDT)
Message-ID: <b0124a57-d3cb-489d-a667-90e57ab26996@redhat.com>
Date: Tue, 10 Jun 2025 09:50:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/10] mm,slub: Use node-notifier instead of
 memory-notifier
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250609092149.312114-1-osalvador@suse.de>
 <20250609092149.312114-5-osalvador@suse.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250609092149.312114-5-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.06.25 11:21, Oscar Salvador wrote:
> slub is only concerned when a numa node changes its memory state,
> so stop using the memory notifier and use the new numa node notifer
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

