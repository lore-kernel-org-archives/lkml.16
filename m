Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416292E11AE
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 18:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749837686; cv=none; b=jhRfcI9XStdI0uCCpvMVAN9WP5wdKfz+OqVvDh2c22qSGQZ7lJbee9OzQ6shTzHBb+x4ovclj2Z0M+XWpnn4JhBZ0nrYpWV+Hqg/FI5BedK/g0o4HDh6jgCKfuxo7Gw5f/5kLZ7nq+dy855BGPg7pSE6OSKUdF5n6n71gkWuS2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749837686; c=relaxed/simple;
	bh=Esw6ov3l8A5CaAtmTWBwTU2PX3RZ3hr0DfdZzU8Tu9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dOU77iacSgnuO/ORTsLXctRfCW2zz7YtZFqzHvaMa4nKTYwWsmr29onq+cKZDR1bf3vwFB/zL7RQZbyfpbo5Mza4OL/lU9ljgV+8Pl2Qc/wuoxtDDbhTI9qotgBQYUut/3TAwzR/fpBTdirs3QOva/Qv3Wz958KHCc3BQKbtlas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eAFIPc6A; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eAFIPc6A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749837684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Bsu+Wcnjd7wtWlxV8RLC0OdC2mEBW/GepWDmRtxUl30=;
	b=eAFIPc6A9iwqhTI8qf/j7KXDqC1DmHn+LPzpcp+fvDCWYFAFPeroPQwvrDIim6gEyQpI4L
	bgUJxw6+d1wO2Qou6P2Tq8HjBdadCgVhZ29XxR+1NjHcoQG2n+DGyPZSHAmBsfq74ew9HP
	uGOzyjaVduTOdyxVT6MQpiUpsO1xpqA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-mF41ahppO-mSZzRuMHCeEQ-1; Fri, 13 Jun 2025 14:01:22 -0400
X-MC-Unique: mF41ahppO-mSZzRuMHCeEQ-1
X-Mimecast-MFC-AGG-ID: mF41ahppO-mSZzRuMHCeEQ_1749837682
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f8fd1856so1346795f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 11:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749837682; x=1750442482;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Bsu+Wcnjd7wtWlxV8RLC0OdC2mEBW/GepWDmRtxUl30=;
        b=movRqQeDhaX6OW6VttuAXWGJ1AhEjCHFJHneWGJGv4zLLPdDQud+it2sfHFdVb/doP
         UGiLi+GdEDPfEN6Fk6V34eTufROMHs78Zzjpn3hrakrG1MMtMUpTdxGwvVVz5qwLFlnJ
         37gBv9C/w5YGaA5VQgqtrIh7K86HK3bfdZHLWjt2vbmXyajg40AIQniR4k1L88a9qZyT
         57N9S4JQT1P+aZltM80bwVLfrMmzDg0lhkTimKMLvtRAapCjTxG0VsdIAA3catpqO7Hd
         KF4Fat3L+48+EgqD8bdevqRcAalj4/GhXxAl25Nsrqd5GTetreLrD/LAm45d9phqnZdz
         HQeA==
X-Gm-Message-State: AOJu0YwSjrzZ3vjkUn160BEKjS0ei2EqsNsV71EURhNf2pqCCgpHjH2F
	I9spcVMY5LAWf6AAmoEuniUhqiKYuBnaxpzvaJsVYb+4pJ+YEFVbVtYWrerhq2NPw/3P+RDoRKB
	BfGdpGy/9CC+0K30QdJs3tYnALgbdcqCgVG6kpMAbkratOokaQBZZwcL4dIXYeLfo1g==
X-Gm-Gg: ASbGncvvMmP1asGNlQwoL6iIk0Y8EBdhCDs2twEelivjFpobRaI2XoWcx2xBHVWWKJL
	y3bXWhdYqGmvkna7BMVK1grsKLY90Iyc5JW5YNIKlEofT15JeNTqKo3SjZwvMw8RSSM4Ao2KTs/
	x1806H9aFPg3iPazaTx63bfsVxPaMhT/yVllN+c1mNGVaysYdvzCCo2RA+ZhevGWJtGiBM4uJQL
	BjeHOyMgegdr976DBFKhsPAEfzKYfcMdQ5xh8D0hw7odlVek0j40MTgbf8xc3eHC/xCcXIO5K3D
	wiLw9JR401iwj/F3KYBOCwHcgq38PdL2uvzx0d47YmwWVbx1ExrYO3AGNgVnCvom9vDdpe7vqpr
	YSCBMg/HbxmM45mTVZjYlWqzjvYBg8Q36ju2wN31m/hzRlqvw2A==
X-Received: by 2002:a05:6000:2310:b0:3a4:eed9:755d with SMTP id ffacd0b85a97d-3a5723679c2mr776517f8f.3.1749837681555;
        Fri, 13 Jun 2025 11:01:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWRgs9/eOjv6Ni0Z0GgYf1+t6oOJ0Vg7B/D9l25oYMJ7KcIy5VjWpy1ryHHls/6YKXmWWXpA==
X-Received: by 2002:a05:6000:2310:b0:3a4:eed9:755d with SMTP id ffacd0b85a97d-3a5723679c2mr776461f8f.3.1749837681034;
        Fri, 13 Jun 2025 11:01:21 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1a:3700:2982:b5f7:a04e:4cb4? (p200300d82f1a37002982b5f7a04e4cb4.dip0.t-ipconnect.de. [2003:d8:2f1a:3700:2982:b5f7:a04e:4cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b089c2sm3004716f8f.59.2025.06.13.11.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 11:01:20 -0700 (PDT)
Message-ID: <e874aa09-0ab8-4d5e-80ed-515d53d794e1@redhat.com>
Date: Fri, 13 Jun 2025 20:01:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] mm/hugetlb: Remove prepare_hugepage_range()
To: Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
 Nico Pache <npache@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org
References: <20250613134111.469884-1-peterx@redhat.com>
 <20250613134111.469884-3-peterx@redhat.com>
 <050B65EF-6A1E-44A8-87D5-152FA9A60641@nvidia.com> <aExQy6xMDc9Igm5v@x1.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aExQy6xMDc9Igm5v@x1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> 
> But if we want to be super accurate, it's indeed different, in that the old
> hugetlb code was checking stack top with STACK_TOP, which is
> mips_stack_top() for MIPS: it's a value that might be slightly less than
> TASK_SIZE..
> 
> So strictly speaking, there's indeed a trivial difference on the oddity of
> defining stack top, but my guess is nothing will be affected.  I can add
> some explanation into the commit message in that case.

Yeah, that would be good.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

