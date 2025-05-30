Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CDA156F28
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748589279; cv=none; b=MzudZQPIMXYlXFyC3YKrhPqv3AYWFDulPgwoQWAbrWuSa3OWfT/CQ8SxJ+3YVLlv/eHDAY6r7unmFobOdKLIgR9+/lcwQibxFbVDZhEFxZiWWOIVQofl7gp0BNLOQwBynIGq4ijhN0GidqPQA+Sye4npbt8sKIg5g9Y0GlnloWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748589279; c=relaxed/simple;
	bh=4xLrstcpYJ6S1hQxNjebemGI13B05tJcV9ue6ae7k4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I2umxyJ7vt3bKy7NKXegaafRNY4BjhCZSy2Cn8VQdL4lx69AAhVfkkqAnEoQINWCV4v+KHKaAyQI/2a3HMAt94DBzwpdxH8sgC80ontwDZedsbg67EoLcUFnd8EBQGWch2jDLe6h6Qgfs2HX+iO1ymA4x+8EfOcIDL8vrUUUg2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AzWhwr0C; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AzWhwr0C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748589276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=w9jQ6j1KqZTzCqlqmSvQMKPQAl2FHHpF9NFt5NKfCSs=;
	b=AzWhwr0CM1FuExSNNl3MTf1Jl3ZNijAG5WeysZyu6YWyVORE2zyTNRVrxG/TWiUi3PhzcA
	dAQd3UTvuRp5vQzNzH3yW4zvR0DlWMhTHAWbQKD5l9CCNgIye0B0hdC+ZJPBBGUdG+3cyx
	BDHELH+nRZSAeymZAo4Uunu7la2+te4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-y7m35soMMDucF3REQ9DlaQ-1; Fri, 30 May 2025 03:14:34 -0400
X-MC-Unique: y7m35soMMDucF3REQ9DlaQ-1
X-Mimecast-MFC-AGG-ID: y7m35soMMDucF3REQ9DlaQ_1748589273
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d50eacafso6008245e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 00:14:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748589273; x=1749194073;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w9jQ6j1KqZTzCqlqmSvQMKPQAl2FHHpF9NFt5NKfCSs=;
        b=JDrlUMKwHAk6F+jMp1VZqm8gXqvd3Kk62afnWFiRbgm28HpsbZ+HIgkAkY7g0eIrUh
         0PRixAX4gSl6AQKpclpd3kxmiFWky6yztxs7lerLcxpSkzBYo6wmHtnsxcf1FPP1Eays
         Owpp5DzD+BkK7OZYTBS1q/0bkPxlEyYiYje7kJsk5M5/PsczxfenygA8GOpIMP6Rbbt8
         4EcFGKGBMqe55uNjEVkgj4HtHrGmlTCDMrDNS1UuBS9ovHlrupjfbqnDwPJvjRCFNheq
         /zAbZGq02WFciVMy2GL+KKGomh+bpOH9An1DAebOmmlb6HjlSoGt/6aQjvSuGnGIlh/p
         ZEew==
X-Forwarded-Encrypted: i=1; AJvYcCUUSVgWKezJ00Lts6he89bawpSpZxVBSYC0BY1gb+j40WVZgbRJgj1YPa+66DyKro3qWXtXoJHCWnLgSvc=@vger.kernel.org
X-Gm-Message-State: AOJu0YygxHO/sQjw5Q3xySiryShPyqKkfdMHUdeganOWsAHLc9F1VsXx
	jG81CoBeLDqT3OmMkFND9p/QPaMmQUqMpaOngsbcSVI6kBHn+DxhK5fKKS27ffCe7Vo42ZSH4j+
	CzXZc5h5YGIBqGm+WwCE3pk6eo/A+migeH1xip/RPb0OlM3E515oksk6D+YXCMHw1ag==
X-Gm-Gg: ASbGncvlI/khghQmNMBE8Q7vOPpbIb/cc9KZLfrcIgqVrq9ADncTh3C9NTWH0LD4/8M
	gGrTSRvOJh6Rs28RglFkqxu5UNUDlU+Nv90ScGtWE1gc1hL2laDICog11t698M/pNQuYS/wGec/
	ZawJJxmyW0lumnrnYH/rQwOEwHWUafc+634KYsCV39qNPQXgmZN907WF3ku6wOXBhKNJrC615mF
	M0wq2cafEuAAYv1H5EUY4tqUiU1Qh3qEdD6T8LcBWHlj5lPlT9NGsma5kQC2KKI/QhVRuRjonO+
	MOa703Q0yUjfVVu25XSKdBzTETpER7DxkQDD904yUTbJ1YNq3rL2fr2hqRN+93noBq1UmO3ee57
	RGV3bnVBwuFE29OIDp4LfuecGa7YEiRlkOqyEuiM=
X-Received: by 2002:a05:600c:1c96:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-450d64e2a8amr21980245e9.4.1748589273136;
        Fri, 30 May 2025 00:14:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxHNga9dusXzR5XdJh3x9MMIDpmAYxi8C7fv12F1JOm35KCjSas1u5c0ffHOC1Nspy2QX5MA==
X-Received: by 2002:a05:600c:1c96:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-450d64e2a8amr21979945e9.4.1748589272695;
        Fri, 30 May 2025 00:14:32 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f03:5b00:f549:a879:b2d3:73ee? (p200300d82f035b00f549a879b2d373ee.dip0.t-ipconnect.de. [2003:d8:2f03:5b00:f549:a879:b2d3:73ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b8f0sm3940856f8f.6.2025.05.30.00.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 00:14:32 -0700 (PDT)
Message-ID: <9d5886c7-bca1-47db-a6d3-6c313b7d1d8f@redhat.com>
Date: Fri, 30 May 2025 09:14:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add myself as reviewer of mm memory policy
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 lorenzo.stoakes@oracle.com
Cc: ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com,
 rakie.kim@sk.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250530014917.2946940-1-apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250530014917.2946940-1-apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.05.25 03:49, Alistair Popple wrote:
> I'm particularly familiar with mm/migrate.c and especially
> mm/migrate_device.c so add myself to MAINTAINERS.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b8f1125f68da..219f887f810e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15713,6 +15713,7 @@ R:	Rakie Kim <rakie.kim@sk.com>
>   R:	Byungchul Park <byungchul@sk.com>
>   R:	Gregory Price <gourry@gourry.net>
>   R:	Ying Huang <ying.huang@linux.alibaba.com>
> +R:	Alistair Popple <apopple@nvidia.com>

Yes!

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

