Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1469435979
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 12:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744894665; cv=none; b=SmyOSPtJv97EtOb6AwKxqMf0eWzebz5myn4soG7dPBZUn3MuubofDWD8KHHh108bnfUXgR/BE4Fjmo0f3BtylYuNKOhEgxdNP4UZlDHK+h2HwqxL1bX5y/Bkuag9FwWTFdlnJyQUnkzgdFEwElZMBOyySb9fbTHu6hoO2nnYFiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744894665; c=relaxed/simple;
	bh=j40MC1IRFipvXP2iTh3veqgGOlxOwSObMJodG1sCghA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oCrokQ3JICfOEtvTvBUD6jEnD96tMlie7GhN2UJoVmdrYZe0SiBvRbkxNHU7c0Q369Z6kIMWp4KG8RytzYKnOO2BNjB/NvlvQErMjN6QM4c+1Ii1oUqsPi1gXUKuJk09OkG8XjSzk4NMA5yX1N+rDS8ruQ4jqOXGZu1z1ZyW6AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YivGESnD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YivGESnD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744894662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AWVn7l1qCNosboH6p23Qk6I8+GCdGtMM64KWAgWkDwA=;
	b=YivGESnD+M3+vMrtfXcSGMAKVMVy1jP+VpSD1E0n+uEimBamLzWbm3e6i8pXW4gRuEqyIR
	S3E4R8kfUU9CRRcd7DDT+rlxui+n7/FSlssPyE1RcL9SKl8t7scJkIDwcsZ86AE69kqrRt
	YHxHlBezx9keOF0jwtzqjXJVBkbaeic=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-1bUQ30ZiMxuwsdxS_gel0w-1; Thu, 17 Apr 2025 08:57:40 -0400
X-MC-Unique: 1bUQ30ZiMxuwsdxS_gel0w-1
X-Mimecast-MFC-AGG-ID: 1bUQ30ZiMxuwsdxS_gel0w_1744894659
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39135d31ca4so364046f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 05:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744894659; x=1745499459;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWVn7l1qCNosboH6p23Qk6I8+GCdGtMM64KWAgWkDwA=;
        b=P4umrcV7xybZuQSghYd2LDNzIufm7qj4YgTuknOOo52uH1UdrgtGb0gGVAzd01JH7c
         OnTF2/L0EWhiHEtle3uTwYvYzSTLBtS7uWH6jpSZjAJ8pBXJGk50Qpc4Rd96LNaF5PCl
         nA3dK4TqMtqGCqaI54PXwNBTGg1Y+MV3GArPEdhMCEkpUCdEak54rt/mzL9JnEnn2r8w
         Jj/WeY8CI09DT7UaLbIe9nEDJCpt/jDrW28RdDbBUZ4GhnuGBOirijChS+wtEyBLDW1+
         4ygdKQCD/GU4LB7qvETpZxQNprURpN39svYqBp14BvF6/pky5YOxOg5+I3WcXujsckY7
         8W1g==
X-Forwarded-Encrypted: i=1; AJvYcCXwDtftBWGvMr9/iMt2xo2r88/z+yK6OLyNUbhDyt85mh7U+1abejzEPFIRqmV/Jk8hOukoZkc9RvaJw1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaTTKeA2etkfvBdndU0CAc3zFu0JtWL/hsFtDdPZ6lgbHI9WT4
	20csNY+2ZFpgCRC1TFe4zX8N5zqAGHAswp6EZpTz5M1uofd+TNIz7XlZ7Nz/jKp2A8PeySu/jN3
	pSynmPck9qCvYhsBQqgfwSogsfhpproxxB7C7J/eFr0q4TeEjhaZ+4KH9LEh24g==
X-Gm-Gg: ASbGncsuoUAf191OmEUZTYEYnk9PbrimIClmR4VUZvsXFFJT81Dp7usR0FW+VqQBLJi
	MhRgYdhCjCty8Q1XSCTgsqEBB1pHB3zNhjrL5ojF7hRfhntkj/931tpGnEBVSd50cW/EBlaNquX
	grPqY+/XMLcRfa1YUxrVA9JAPiOI0h8f3S4YKqkorKzce+5ELbnoOIlvk03K6pSSbyWNsefIoB7
	ZuIig9r8PH/CMl6UmT1fELR9gu3IJsvr6DUGuyFVlICyazVpwynF/zuft6QS/6Lt2rcRXWtT5xE
	6EKNWbpn5ijjHnllVH5XP891Fl2yGES59mtkPNBSLqxPozQCSoN8PBgb6+PX73zSk6KSjcIZNxp
	dqncldv5uYo4nNZD9s1E59GdanEPNvZ2C7OBU8GI=
X-Received: by 2002:a5d:64a5:0:b0:39e:e3c5:ee7b with SMTP id ffacd0b85a97d-39eea09ea40mr2138052f8f.5.1744894659549;
        Thu, 17 Apr 2025 05:57:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvVMOVbjaKAiQzCvaCj/WiZZyjaqHAQ7cGAYU1hFI9aOYC9D9g8jCTJnA4I+PUlb/7z9VgLA==
X-Received: by 2002:a5d:64a5:0:b0:39e:e3c5:ee7b with SMTP id ffacd0b85a97d-39eea09ea40mr2138037f8f.5.1744894659223;
        Thu, 17 Apr 2025 05:57:39 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:2700:abf9:4eac:588c:adab? (p200300cbc7062700abf94eac588cadab.dip0.t-ipconnect.de. [2003:cb:c706:2700:abf9:4eac:588c:adab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44043529fdbsm50334475e9.1.2025.04.17.05.57.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 05:57:38 -0700 (PDT)
Message-ID: <3b665ef9-d773-476c-826c-8729056c611c@redhat.com>
Date: Thu, 17 Apr 2025 14:57:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm: don't promote exclusive file folios of dying
 processes
To: Johannes Weiner <hannes@cmpxchg.org>, Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthew Wilcox <willy@infradead.org>, Oscar Salvador <osalvador@suse.de>,
 Ryan Roberts <ryan.roberts@arm.com>, Zi Yan <ziy@nvidia.com>
References: <CAGsJ_4yUUK8LoejaUrXWscpPSQevq8jB4eFwpd6+Gw3T5JxdNg@mail.gmail.com>
 <6259cc1d-93a8-4293-9009-a6119166f023@redhat.com>
 <CAGsJ_4wnqyaZntmtOvtTZRq2XuKsKRTokwf1GeX91FpfqW_nzw@mail.gmail.com>
 <d5cd2055-62ea-4534-b5e2-c6a5bfa9b1c4@redhat.com>
 <20250416141531.GD741145@cmpxchg.org>
 <239cfe47-9826-402b-8008-de707faa160e@redhat.com>
 <20250416181835.GA779666@cmpxchg.org>
 <CAGsJ_4zt2Yuornri1bO=3o7myey1Q2dmvtjn2baD0ahxOyoNjw@mail.gmail.com>
 <20250416235849.GA780688@cmpxchg.org>
 <CAGsJ_4wfWLbDC5SruF5TtH-VXE08OWxan12qNYSV3vGzBfe5Bg@mail.gmail.com>
 <20250417121755.GB780688@cmpxchg.org>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250417121755.GB780688@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

>> We actually took a more aggressive approach by implementing a hook to demote
>> exclusive folios of dying apps, which yielded good results—reducing kswapd
>> overhead, refaults, and thrashing. Of course, it is even much more controversial
>> than this patch.
> 
> That doesn't sound wrong to me for Android apps.
> 
> How about a prctl() to request the behavior for those specific app
> processes where you have clear usage signal?

I was thinking about the same, so likely that might be a viable solution.

-- 
Cheers,

David / dhildenb

