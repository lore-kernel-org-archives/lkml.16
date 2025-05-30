Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3567927E7EB
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 19:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748634122; cv=none; b=HLtgjGVhQQzyNsaA9JryVSgQTPvG8DsylmP/G69prwvN0OgLnuKUmA9sfmn/S5ZxfwDv/fOZ/tBwiEdu/KgxOe4CE0pDIP8NxF1DZEu6HYw42b70K9tbdtuEc4nL5hae5EuQJar+2l9JTiDzQ4ciSElRWqY7d7LuojeyHcDRB38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748634122; c=relaxed/simple;
	bh=TSYUgyNZiwIqnhdET5dB/Sl1/gQN1eO5LBSTJHVC8J0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W00+YFhP8BXzHfTkfmB2fTL9oEkRGjX0RNn4udhXr3BhnT/JIZwPupO8NB4uppqfgxJE0DEP7Z4HQQfRg1bxUifgQ+kHFvf/VpmRka+Q0HaWY0yb5umYeBV7RqExrwGSprLn/ymraRSApDXDsidbOR1PKf9vtj520hQKLaIBG7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IiRr9q37; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IiRr9q37"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748634118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oUpD71AnfzoUHKaPSGfSgaT4hcoDhWgnCxMsIGg+/j8=;
	b=IiRr9q37BcwIi9epSZdczfqZ0GSdR0cvLbhEnYr8SKUGBiGrnPRvTbaqluK9LqWTFOhbNV
	IzKmehMbvCfB5LTM7AVQixerSiYx4OGg8dEgyV3WjBXBtralUAAgcZVHNLoPx4trFJdruW
	5N7iLeC4XuAEDSLiQYBn2rlxTClMeQM=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-kACltvaUOti35O3F6vGXsA-1; Fri, 30 May 2025 15:41:55 -0400
X-MC-Unique: kACltvaUOti35O3F6vGXsA-1
X-Mimecast-MFC-AGG-ID: kACltvaUOti35O3F6vGXsA_1748634114
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-32a71048a07so11621291fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 12:41:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748634114; x=1749238914;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oUpD71AnfzoUHKaPSGfSgaT4hcoDhWgnCxMsIGg+/j8=;
        b=T7DL/EMHSx0wqQ94iP9d11P/t+keFX7AXh05JKPYX3QCTiYJAbzaaEyOSFWfJK/COe
         dierW4I8xBkt4zFhrgbbMAKYMK+IdVTOecdxahYbyB6uAXO8yC6vuwiO8XCCkXc46hnK
         xgXx0r8TQQRKxKV52T9LbqkdrZt9StHRv+kxRtcYLkpVkhn0VAwghDrQnEMrQb/jqNr/
         UquNBLCy4sHnxQKdtjPuEi8neT2d37py7ToyWPEQYzfQGmme2sAEPW4bUccfM3ISy6ZJ
         6nsBiSZcgGsptdckbGMVMKcR8NMydJt1dI0eIWECanRRewJK/QbAI34r0gwNVZ/wUXq6
         mkFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdiYeLbBhdI2KWkmd+q88MZaS/+RJEMq0GM97g2UMv6VLrEmZaZUTjcldxH991khE0e7UeNTW7vF9mjLU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs+MHEfiUJVY2Wd/2v/l7TvXyrkhVIIwJrCggV519caf0eFHpx
	Ni8p/gOBcTeVz/YIOqG42oFfXPoafzbop4ednY3AoLB7Aj4HQpKbGAJUzh+D39gH9dzf5U2+hSU
	6oKSg15KQmkj8a7WbGvLK4PRxkAXvu7TXg/XOp9mndpFKNXCOfXaq5wuO23ZBq0dGjUEgIZlIKO
	q8
X-Gm-Gg: ASbGncvGIX+9rKM2PA1FD5n+C1csDDefGbpGId+dgCWBbl1zzFHFZ/kjUoz3yXQxQzO
	/6DLPKhyU2CjWO6szySd0UQQVxQsfEEPv0Ox88chHBPQGTiqQukpDtUI99DmQdctEOVI1RQRktk
	xWf/RFjxIqVDWUY50IZJkWdDGzNeThx9LBb5mZkKd8K4XsA3+gr4FxkFY+Hv5tLeyLnN1+eCeYX
	xvhH2FgPnZobRkQY4BIdwuwaR/thhF2QFDpotMKmr6GxnVt3L+OUcD9ExC+vjDB/hblGC2npWJj
	ek/A0NLJOkKqNpzQhF5tHl4uvBfy4Gqz9N5KdVh3RWI3IPuIMewHOGpGhq2fhKdoOycH6DE0RgZ
	CZVz8+eQDph1L2gxfiTq7TSWnExEliBGqoj3Qu9s=
X-Received: by 2002:a05:651c:30d6:b0:32a:8146:5061 with SMTP id 38308e7fff4ca-32a8cd4877emr16336971fa.15.1748634114003;
        Fri, 30 May 2025 12:41:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3Xp4iZu9LQY58TIQ0CdbrdO0DDNQ1KfpFwY2bbg20xru0F4UVX5xUIushUzedSCWhyNRbOw==
X-Received: by 2002:a05:600c:474e:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-450d64e01d8mr57841945e9.10.1748634103227;
        Fri, 30 May 2025 12:41:43 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f03:5b00:f549:a879:b2d3:73ee? (p200300d82f035b00f549a879b2d373ee.dip0.t-ipconnect.de. [2003:d8:2f03:5b00:f549:a879:b2d3:73ee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8ed32sm26125025e9.1.2025.05.30.12.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 12:41:42 -0700 (PDT)
Message-ID: <55d0cdf4-3b80-49cf-a05f-3918ef595184@redhat.com>
Date: Fri, 30 May 2025 21:41:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] mm/page_isolation: make page isolation a
 standalone bit.
To: Zi Yan <ziy@nvidia.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang
 <richardycc@google.com>, linux-kernel@vger.kernel.org
References: <20250530162227.715551-1-ziy@nvidia.com>
 <20250530162227.715551-3-ziy@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250530162227.715551-3-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.05.25 18:22, Zi Yan wrote:
> During page isolation, the original migratetype is overwritten, since
> MIGRATE_* are enums and stored in pageblock bitmaps. Change
> MIGRATE_ISOLATE to be stored a standalone bit, PB_migrate_isolate, like
> PB_compact_skip, so that migratetype is not lost during pageblock
> isolation.
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

