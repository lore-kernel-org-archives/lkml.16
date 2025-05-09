Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71A715D1
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746794555; cv=none; b=V6xmjoe5NDMJBVL8PA/a8JqemztKSE2xYS5PWJnMKfb/9OuJ8WwAX2ArhxIZDsCg+/fA7lZdzzkcrmuprIb+1DJQ3JXlPbPUsiHt/jQ6hkVnYkbKuVKMxmNsMGKFaXfYaMqETDGDusfWZnp1CcN20sS2uPaeCtWRAd3PaKIWkU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746794555; c=relaxed/simple;
	bh=IRA85F3evbrLJfTGoTkrkLxnF0ftkrqQBexHW7YxuFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SpOwTVxA3R/snWXE4VTys7hAXvqVYwlde8IEj5Q/7ntnnXrCY3IEwWkaE+4cyLK+RyVE9E20UIGYRJtSu3eBokcxRrnQMUR0OhNqpHveIKoP3qieV0qX2ThkgSMQWPtoPJO56NbZBed4xMFZgK6+t+vp4WPJBcRNV/a75WnlakI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QXje0v61; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QXje0v61"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746794552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wYfXg65QeD2eBcwxZDRwVxlF4JRz9WQis3KMDUcOEKE=;
	b=QXje0v61iEMx2AziLvpFnttEGBQ1sJC9Nhv3KWV57ElbFB4bvtSo8xIqxWmtzF3jqn2CqK
	7Y6p8IaK4Fz7HOjqH9sCOojQPkWd1MDyCoJ7NEhi9F/YC6FMcU/tWQ11ZUdH9DBt0JtdpQ
	T7J4dYG7c/e7CgE4Cfo+DEgLnNm7QQw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-y_1Jz4FKMjSxJYbxWKmWUw-1; Fri, 09 May 2025 08:42:31 -0400
X-MC-Unique: y_1Jz4FKMjSxJYbxWKmWUw-1
X-Mimecast-MFC-AGG-ID: y_1Jz4FKMjSxJYbxWKmWUw_1746794550
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so9592875e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 05:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746794550; x=1747399350;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wYfXg65QeD2eBcwxZDRwVxlF4JRz9WQis3KMDUcOEKE=;
        b=EzDOEkpPjfy/v51hmDW05UeTlFp8xhki9PZX7fmtSnOeuh3omlISmjmzSIIFqGpEo4
         LCfgi5txmtr/l/alLCHsfwLunY4tWGCJmPkrASjcbO8urt2As3jXRqrCOOAr3kibm0C+
         /yMrJz4nv4KtXgso9sdPwdkEFEoDQGSXDS4FDTwuWZBqfPKQB5ynrj1yfKhDzthSap3s
         mEEf0Eq+S1rD1/M2qxDN6bs6JKPcbM9GiUXssmb+ddBLsJqlaFbjBAAUrOdmnkobRe0k
         D0SgfhGPnuU7tmWK4/3DtQQy8uiNeZpF14gtqPB/2iPDrF66reYJXVBVf8T2aIoD7ill
         EnXg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ/v/v4D8ER5ZX0f2ys/H3bQrKP4OzGkiXqp0SMEt9veQLMBo7qju3pBcMEx3VLcZNevxf2deAuO0KLM0=@vger.kernel.org
X-Gm-Message-State: AOJu0YygvQSF4MiB+bZyJSm4NyQsVdrarlMBBcg8diTeUFaSIsBNbroN
	6B1FCWkuMc0jy1GEyE1sYo2ss37O7xVSrvveJ3bwLO2pgCz9/FwYzRJ7fFHznVzoe/nzD/LFb4G
	DKD4V5Dy8l4gr8gw63/C5rXdSoXwUTpuPZHbpDNQwAmEBkqLDoGGGIpIknbC6vA==
X-Gm-Gg: ASbGncsKvZTF30TomXPuk1sjelkuXHF071gEcPpb8m8nCL1P0DBjuk57mQe1jP3MVRI
	7LfWYmb+h0aJQK7DK06JrIFxOxqbHSAgHLjZ6XpQ7/TzILhCq37licLkP2gaahAq1eTjGFDbRiv
	KWg+A92jBzzQoGhO9yCv6cIZtTVWg6Zv2YakClGZOb7qbgeeM/gK0HxdmOjOD4Ks15RfcrpBpJg
	ExEW1Fj/sDXQzLcNVF3LUNjihHkPjHlEPQJpOOUbtd1gB6CHfjwZR/7fnEJB9rrDDMcjqc4VPxF
	/ihAGh80hUcNxh5YDaN3EqsoH5agQt0ZH4RbR0GsgcEiJIVpk6ehxXCYvGuCM0oWZZAZT0kNCCc
	cslU1C5rmvomu6TywQ+Hzyae244fCbg5gaBauOfU=
X-Received: by 2002:a05:600c:444c:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-442d6d3dcc8mr29370455e9.10.1746794549807;
        Fri, 09 May 2025 05:42:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSVBQnp2nj1kkMkMJueOAGrVABCmmR0M5aXE611cw7NgbgRre2lK1uBcrHFa32Z4IBiB/ThA==
X-Received: by 2002:a05:600c:444c:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-442d6d3dcc8mr29370135e9.10.1746794549401;
        Fri, 09 May 2025 05:42:29 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f45:5500:8267:647f:4209:dedd? (p200300d82f4555008267647f4209dedd.dip0.t-ipconnect.de. [2003:d8:2f45:5500:8267:647f:4209:dedd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67efdd0sm28500495e9.24.2025.05.09.05.42.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 05:42:28 -0700 (PDT)
Message-ID: <c4dac352-5645-4037-a854-008d10a3a13c@redhat.com>
Date: Fri, 9 May 2025 14:42:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm: mincore: use pte_batch_bint() to batch process
 large folios
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org
Cc: 21cnbao@gmail.com, ryan.roberts@arm.com, dev.jain@arm.com,
 ziy@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <99cb00ee626ceb6e788102ca36821815cd832237.1746697240.git.baolin.wang@linux.alibaba.com>
 <c83ddc32-565b-40e3-b43f-12fe6e70586c@redhat.com>
 <3d52c5bb-60c5-4bfd-958e-737a8cc90853@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <3d52c5bb-60c5-4bfd-958e-737a8cc90853@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> 
> I tried this method, and it had no impact on performance.
>

Might be that the compiler already did that for us.

-- 
Cheers,

David / dhildenb

