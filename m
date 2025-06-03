Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C7F1474B8
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 20:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748983616; cv=none; b=uCjIh4DxBu1KMDIW5UM4R/Pqf50W36yUK1RqT90ONEscmTW4ciQv2ra0a5WggmXUhbyxtNd46DRxvtGnsIeGi/ZfErvn2YaDaBJE3BrZHfFySa/LC3AJLKD75kUqmdlyFpL/Od0PTnCEoHzyjyuUPA7iymyvTuMTwEKVvNJoyDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748983616; c=relaxed/simple;
	bh=Pto7Ex7MR39t+J+noGFpZS+t6E3LUCD7bLEQwBGFzHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q6llRUneFKtI3UkOpxkiv6VgzLdStvco1HZ33ZoA+2jNvDa7NQqoA6T+97qhmjKrfZc495RvwQABuJMvw1EQdl8fX0Pm2HhchZu9lI/ou+lPEhuujaW9DPWgfC89Z7CnI3sSMnr6/S8nSq5ATyuY0Vsr42AWR0uxcDwG3LXYcRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b+Huc6e0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b+Huc6e0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748983611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MFG6AiOfDMBfUZfbmLw7cgYxS3Spnjf6XMCgeqbJ01c=;
	b=b+Huc6e0OMubYtv7ttaGtFP3vRH47Q5MUDBzktZJB1y3ngR80j8mr2wYK2XI5wGv+YQg7/
	/g0vPmmoQSZfgxsz71zw/VFj2odL1DTbSYx3dIJb5mTl8JM0CFpeB75YC+R2lkcrrYTSjT
	IGzdl4ViX7yoOV/RLRjSgrr6XaQQ4d8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-OvM5ugwiObyC2VpXmZbnCQ-1; Tue, 03 Jun 2025 16:46:49 -0400
X-MC-Unique: OvM5ugwiObyC2VpXmZbnCQ-1
X-Mimecast-MFC-AGG-ID: OvM5ugwiObyC2VpXmZbnCQ_1748983606
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4517abcba41so22235365e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 13:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748983606; x=1749588406;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MFG6AiOfDMBfUZfbmLw7cgYxS3Spnjf6XMCgeqbJ01c=;
        b=S2lmA32POU8wc7ZEurmKG/MQEcJ1N9gm1bTsEhm3hJaMUc9pldJXhzjBLbsBRZmkKC
         lPotl7PubMGPBZxH6R+1697oVtX2vXd8BupLcMpKWEft7dBd7RDchy/FV/6PaMYNzCGg
         ANnKHi0+mrMwn0+SojKyCc6tCopGP8pGSh4z9uz/QhqPRYUV+0DZ5JaRa/L0hKom2ZTU
         Bq+b+S/00e7gb+P5tSadRbg29LHlM4XCHOxjlA+vNmj6DTvhlCZMTN/oOeV/UsRAOIof
         8+guQo7cEG/FqRFbcb5l0yztX+qgoknFerC8/Pzv27hON8vfjmB/yJHp4r60INKbQbIH
         ZIKA==
X-Forwarded-Encrypted: i=1; AJvYcCXm9SK37k459UJ0cmbt30x/11qBIgMRw4MI4fK4T+WdXBKdrBXFaXe8/sZlz31gI5JizIRPJ0R9iTC8WI4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBPdDzRByXCpxarbxBVg3rNqgB3jvD5PgAvHEmEww+FUAxrqTK
	RBvyPHpGNaY/iOJr92W5ZI9zaOlBjapxIOtug/Ig4FTR/5Oem09t1Tp5f6jW97mrB2tlGS1mqvu
	oIJn84NefA+84hap2Xu2Fs6x8qdlSxEcnSohKval3ibf+kN80jymySt2d+TazBGSveQ==
X-Gm-Gg: ASbGncvL6+fni/+6KCyNR06SJYCmdPNOZu00YigAysrELlhUb/LfzoKvXsVmBXOwr+s
	afTYffnRGajL5MEbPhAMD/4m1D/p1Kvw2Jnm/WdSrhlQWfS6zYwB7QXYYjy7DgjgRv7AtDR5hb7
	IZCGqFOaUQHeG8GykYd9nF3zP5MbMWE54fX9u9fpPqsWoShXs56jrXojK4enE2IucqNN97WuncY
	zb9yHdwNtS0KWLxYeAEbZRud3ylnrZ1tKZtwaAffvB4mXk/ruiyqrJyhJUTppvWScihXg3YxkhJ
	4ouQFOR688BALGmvCBVekG2eZslXRn3f/xK8JT38C1/WYYk0BdewFv741C7tJNtlARh2vQpMK8H
	yJau0fA0O72APAa83TwMhA0V0XDrziEYX/PTklFUYKF224y6FFg==
X-Received: by 2002:a05:6000:400d:b0:3a4:db94:2cfc with SMTP id ffacd0b85a97d-3a51d97b8c9mr147512f8f.43.1748983606117;
        Tue, 03 Jun 2025 13:46:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9dkeKKkdVmnhb3LqB7cbja+9T41Y+BBa6azUhn0O1gaXOTLkXI4D6qHHIf4ZLxs9WKeuXew==
X-Received: by 2002:a05:6000:400d:b0:3a4:db94:2cfc with SMTP id ffacd0b85a97d-3a51d97b8c9mr147494f8f.43.1748983605767;
        Tue, 03 Jun 2025 13:46:45 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0d:f000:eec9:2b8d:4913:f32a? (p200300d82f0df000eec92b8d4913f32a.dip0.t-ipconnect.de. [2003:d8:2f0d:f000:eec9:2b8d:4913:f32a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7facf9dsm168909815e9.17.2025.06.03.13.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 13:46:45 -0700 (PDT)
Message-ID: <826ef817-0b54-4f84-bb32-929e4c8dc57b@redhat.com>
Date: Tue, 3 Jun 2025 22:46:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: rename CONFIG_PAGE_BLOCK_ORDER to
 CONFIG_PAGE_BLOCK_ORDER_CEIL.
To: Zi Yan <ziy@nvidia.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 isaacmanjarres@google.com, jyescas@google.com, kaleshsingh@google.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, masahiroy@kernel.org, mhocko@suse.com,
 minchan@kernel.org, rppt@kernel.org, surenb@google.com,
 tjmercier@google.com, vbabka@suse.cz
References: <20250603154843.1565239-1-ziy@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250603154843.1565239-1-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.06.25 17:48, Zi Yan wrote:
> The config is in fact an additional upper limit of pageblock_order, so
> rename it to avoid confusion.
> 
> Fixes: e13e7922d034 ("mm: add CONFIG_PAGE_BLOCK_ORDER to select page block order")
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

