Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174351A840D
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 16:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747325523; cv=none; b=t3WDojetbsaKnjh6IWercgDd0TMayfEKVLzWRqc7AwLK6qDNi5gfi7waWvpxZwnAadcTsmBna+df3WJxGDJA8Rctjw8G9WsuKmIBvAjxGCx/A3H3B423gAFLVrEkclvcHoEicyHJ+f6VE8go3GGKYgAuDuMEYWgGVGG+0wqdSYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747325523; c=relaxed/simple;
	bh=iBTGQMhLUweU+5fwjjSU66vqDviQFvcGCLzCm2xJfAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a7CwWL0TqmdZbTXokViHsACs/fUTWUTNbGaUeOD0s0DsYCpgoJjYzgkrzqf+SX1bE0G/yRTJga1Du98+yz+EBr7LcAcESmmRS5xrY9aYuHsiYp09kodtertU6KBpfO7GFWgiC0JFY8kWuEVESXv/42BCIUVZ855zIiQ1HXdVpuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Or2Zsd33; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Or2Zsd33"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747325520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pYX6pzUrNp/JkxVUjXurEPPbvnfMDxPvC1bKPTm0z0c=;
	b=Or2Zsd33gdQqXvAYjMSHVBrTjnXhq/CCKJv1hjZjNj/gUP68SYxendRaU5ZJKYpT0UhvOk
	jyIVZ4hi8ycKG6218lkpryGaDoB1Ab6gB1XoFXxD7t/2uJzxQ2XU3MTtO9OZuMrv9+a218
	1OHgG0CRNnn8DfbPV49BaMdds5ic2o0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-pC5ZJ7oQMcKhrtr3JoWUtw-1; Thu, 15 May 2025 12:11:59 -0400
X-MC-Unique: pC5ZJ7oQMcKhrtr3JoWUtw-1
X-Mimecast-MFC-AGG-ID: pC5ZJ7oQMcKhrtr3JoWUtw_1747325518
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a0b6cb5606so707613f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747325518; x=1747930318;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pYX6pzUrNp/JkxVUjXurEPPbvnfMDxPvC1bKPTm0z0c=;
        b=CjfAQ5gnLKrIE2L7L/rhzstExdJmwYefcumAVd8TF6UyXGYEoqIB/W4EJbG/B+RTsB
         U9e5jenjLX6+r3MkyAitCn1CN23uuDzbFKZfib5BDR7gU3FWDgjnJ36305b0UkMmeQvF
         8oqsIzDKnLJrRAWXJVvJO5QIzr1huF5Xrbdr+IkrwiJfFy++yVk+89zlq3zpbYxEtMd1
         3vRaFmsDW9n0Lne3B/Wc6JOIu15x6gz4GGerA3shceaz9qyvvNvjoXYYKyYvFRh0Jb4d
         3hVGT6FxjoeEUiI3FCybGufsuY1PuvakMCAX2Qz+Hqctrm5irOS2QulRsZkHQa2X0z44
         QuOw==
X-Forwarded-Encrypted: i=1; AJvYcCUQLTZ/i+VVl6qgethyvVlir3wnpFTSbtHHqEjkhZP+nB+JXNQzPgJOkAZpVIr/6J7w529xGjR7gegV6PI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/iRb39UyJhOArdQEnqqdh+6fHZy2PMqiWshWv2P3eVJZjESzh
	+zg5B5nMibsMBGNaUG7qAdozINNQB7C3nPTRQlYkndF7f4KlFPp0pqjk6iS/G5LQyPfqtQStS/D
	rzrIl1+L1+gpelopXL3JbhL4uPKFhfqnL0Av4ewmbdijTbe9sGGknHzJznMGB6KLQ4w==
X-Gm-Gg: ASbGncs8OTjz8qnZMelKOfGOqEpexwTSWK89JAqXeHxu5bjzw4x66XEtqTRi1KsQ9Zl
	p4POE+oQrI2gjJIJGColWTyRnC3TRX0jfdkMB2idWP0sfuDaHnPTVe/luRgH8dZIyYaZ7I+/Gx9
	bQ3chj0oV95aMtYIlE5hVfjpe+rZtJPtG9r+dF5a3/kNWMyX0iIyQ5AwkcHalOeiNljmgeDTJ+U
	yxxyecvn2hk+CZVEU29SIarYMqIA7ofg6ncqDjZyYDbKCRE4ZM6zQ0KAjXXa8ZOStH8ESuQtfdU
	Eq3lC9VlmgxMe0h3mDY4GNlUsMuHl5Pvgr79aD4GHc3tqws4/x+CP3l1YdXZvHAPR+UWkSxlNPa
	RURValbsjc+qBgp2D2LjFIIOptQ00H4h8uT5sOPI=
X-Received: by 2002:a5d:64ee:0:b0:3a0:b23c:15b9 with SMTP id ffacd0b85a97d-3a35c808c9fmr393291f8f.4.1747325518297;
        Thu, 15 May 2025 09:11:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQQ20rBbriB3eJ6Q6t7YWav8+v2qIBjQNGt9Fi1PjVXin4VUmaUWqasRYcxubc/vsPJeRKJA==
X-Received: by 2002:a5d:64ee:0:b0:3a0:b23c:15b9 with SMTP id ffacd0b85a97d-3a35c808c9fmr393245f8f.4.1747325517894;
        Thu, 15 May 2025 09:11:57 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4a:8900:884a:b3af:e3c9:ec88? (p200300d82f4a8900884ab3afe3c9ec88.dip0.t-ipconnect.de. [2003:d8:2f4a:8900:884a:b3af:e3c9:ec88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fa3e2ce5sm24293475e9.13.2025.05.15.09.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 09:11:57 -0700 (PDT)
Message-ID: <3a2a329d-2592-4e31-a763-d87dcd925966@redhat.com>
Date: Thu, 15 May 2025 18:11:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <20250515133519.2779639-2-usamaarif642@gmail.com>
 <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
 <ddc0dd46-8541-4d4a-ac59-287e11e1d3ff@gmail.com>
 <02ead03b-339b-45c8-b252-d31a66501c39@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <02ead03b-339b-45c8-b252-d31a66501c39@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>> So if you're not overriding VM_NOHUGEPAGE, the whole point of this exercise
>>> is to override global 'never'?
>>>
>>
>> Again, I am not overriding never.
>>
>> hugepage_global_always and hugepage_global_enabled will evaluate to false
>> and you will not get a hugepage.
> 
> Yeah, again ack, but I kind of hate that we set VM_HUGEPAGE everywhere even
> if the policy is never.

I think it should behave just as if someone does manually an madvise(). 
So whatever we do here during an madvise, we should try to do the same 
thing here.

-- 
Cheers,

David / dhildenb

