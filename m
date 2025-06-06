Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2A7EEB5;
	Fri,  6 Jun 2025 15:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224344; cv=none; b=C2d9VjdueZqZz0x41IUr6NJ49bSOwA+PzpLixUZ69kt0WG4LON2YPTkwZY9z9+Ip/RmBE0JYM5qhqPhMS7pYS0DGB4piqd51kp5m9vKmvaz3gPlyhqWKZ9XBobVT/SoDgMpon8ugbC4Fah+9W4qUQKD5cvQ8M6hXrgxX/DX8Xqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224344; c=relaxed/simple;
	bh=RU59iHBqI0534jwkspMLqvob00uxei2xVKtkzhefafQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lyWoSPfq6QYMedZuNmIOA65cA8ljdtVo2EH5Y5bdahLPLQZ7zEHRi2LKMxlaSMclI9a/dtUedQFzW6GuWwDSNa2PwHsrXwcf53OCfE28amU5iKI0f0/y/gF8RFx4NMetlaPWpOV98tW3w7SMuZjBBY948KocE/E5UViiprjxvN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8US8CpF; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8US8CpF"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4508287895dso21633785e9.1;
        Fri, 06 Jun 2025 08:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749224341; x=1749829141; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t6NY6udn4zLxxSCFsYax6o0dwGkH5UV6tkVSlHy2EN0=;
        b=S8US8CpF6MFYkHoDEojVV/gg0qXHlLgzLF6V3NpBqL1LqAJaG53nlgYUA78BASR4XK
         LEvmn1uA2+bD9HClHnJX4fA2C4eqE9F68uwCZRfkXaLaR40nLGOsyZXw1SCt1GpQRgry
         NfdJ7bceORBGKKnfEJ9LZZ1XqioBw+JzpJLc1cqDAVVoCk9it9k6MTKXxCYtTAO5xxrk
         2/TblA3dpkc+na70TVDAHmuIRKnMeQCx+CwcLy+nBNlOfj6xIeExfn3H3/DBA/Z7AGpw
         65bZwgn4XZALVnGByWg0sRhgTx+sJi2lpFxJlFyWi5+48pnGAAZzyOPU+Gg0J28rQPDf
         APQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749224341; x=1749829141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t6NY6udn4zLxxSCFsYax6o0dwGkH5UV6tkVSlHy2EN0=;
        b=hpJXzYRyYVM0M652SRkQXWrbzix4noooInDLERfJRYJAkoVevm7Vjf6hoO+dgTMxGQ
         sWRAqDecc5+bU0ar92xTgxU/lHRDY8iM/gAoUtD4NHcW2g0FURN22wPdGkLUfTBADFxM
         cbcfFDstWfA1LEDr7IWsOCCm1lL74CFF4xFTIpQTB1QqJI2ZPX/+R3Iv64WWImWKU8GR
         gjIBi6tEZMpVrrD0H5a3YlW6h0JLQPFhKdA2pVzTcvnqjwCoPX+D/Umo1aw8hY/HLEKW
         8i4kL5E6xMNGGE2rPyLKV2DbiFgB5V971QhEmzAdVtuznO7CGfbDmhq7tInwM+rdVtNh
         +rjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWu0AE+TQH4hP8hnwio0E6qaA2T0zQN9/9L6v8MBL7sHHwybAe+e+Jci0nMspVMZmn0bReu5mtAq4=@vger.kernel.org, AJvYcCWvK6aC2t95S/bDe4KmfOI6P9zUV1OYvRX37Z5rvGFrHKOyyP/OGmQyw7lk7UzsmkJRqzijYXLcU3+8nloz@vger.kernel.org
X-Gm-Message-State: AOJu0YwLvp4x5+r6K1Q2TtuUs1GxCYLeRYKbxxk1yCgORmRyB7Ibj/IV
	a91FKpAV8z5qdqlubneZJ49rdUAerHZvC7J3ZWF+MbiO+OIck7i3A6CX
X-Gm-Gg: ASbGncvpfQo+misTICtcLqF4kgYJLzRlOBnPOuo1+gSmZtPYXvBuOb3eyJiB4aLAmif
	XvVkhrMwrLmCbRQCAJHXhR5BbEZs83VN7E9XiiJ2rhtcSCS3aoP74VSQmib4ynDn/tatVEWMYDV
	Ffo5RjXPaVkWxiX5rFvQzBLGw1Js2bkaHbLrn48IRSdNQ037y8P25jhaJ2RUCz744Xfs3ufMy8d
	7sRQjwmSjBsv4KT2bQtiGyzFDXyobR9mkGRVdm29fZS1QeeyASMB94KEkYkrbPqEWewlZMrBKlm
	IYOkGBOXh5BUsXgfqUnnZVo41c4Sa8mobSBseOEp2KuveeOkKcDwc1DdgK5bW2MHm1LCtH2fRHN
	qWSk5rmV25NjEDAi97wT+xvGybOhn3BHGFus5t4XqMzXgRIk=
X-Google-Smtp-Source: AGHT+IGhSK2qefvHASJtcgqAzBf89NtW7wxEsbwEa2hrZjYh8Rmd7yqQOgg3ab9Crxdjf/74+VmliQ==
X-Received: by 2002:a05:6000:144e:b0:3a4:ce5c:5e8d with SMTP id ffacd0b85a97d-3a526e0cf3emr7962984f8f.20.1749224340338;
        Fri, 06 Jun 2025 08:39:00 -0700 (PDT)
Received: from ?IPV6:2a02:6b6f:e750:f900:146f:2c4f:d96e:4241? ([2a02:6b6f:e750:f900:146f:2c4f:d96e:4241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324520e7sm2205547f8f.84.2025.06.06.08.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 08:38:59 -0700 (PDT)
Message-ID: <b807deec-99a9-4691-9001-c2f3adf586b9@gmail.com>
Date: Fri, 6 Jun 2025 16:38:59 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
 linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 riel@surriel.com, baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, hughd@google.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com,
 Juan Yescas <jyescas@google.com>, Breno Leitao <leitao@debian.org>
References: <20250606143700.3256414-1-usamaarif642@gmail.com>
 <A409F7B3-A901-40F9-A694-DC3FB00B57FE@nvidia.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <A409F7B3-A901-40F9-A694-DC3FB00B57FE@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06/06/2025 16:18, Zi Yan wrote:
> On 6 Jun 2025, at 10:37, Usama Arif wrote:
> 
>> On arm64 machines with 64K PAGE_SIZE, the min_free_kbytes and hence the
>> watermarks are evaluated to extremely high values, for e.g. a server with
>> 480G of memory, only 2M mTHP hugepage size set to madvise, with the rest
>> of the sizes set to never, the min, low and high watermarks evaluate to
>> 11.2G, 14G and 16.8G respectively.
>> In contrast for 4K PAGE_SIZE of the same machine, with only 2M THP hugepage
>> size set to madvise, the min, low and high watermarks evaluate to 86M, 566M
>> and 1G respectively.
>> This is because set_recommended_min_free_kbytes is designed for PMD
>> hugepages (pageblock_order = min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)).
>> Such high watermark values can cause performance and latency issues in
>> memory bound applications on arm servers that use 64K PAGE_SIZE, eventhough
>> most of them would never actually use a 512M PMD THP.
>>
>> Instead of using HPAGE_PMD_ORDER for pageblock_order use the highest large
>> folio order enabled in set_recommended_min_free_kbytes.
>> With this patch, when only 2M THP hugepage size is set to madvise for the
>> same machine with 64K page size, with the rest of the sizes set to never,
>> the min, low and high watermarks evaluate to 2.08G, 2.6G and 3.1G
>> respectively. When 512M THP hugepage size is set to madvise for the same
>> machine with 64K page size, the min, low and high watermarks evaluate to
>> 11.2G, 14G and 16.8G respectively, the same as without this patch.
> 
> Getting pageblock_order involved here might be confusing. I think you just
> want to adjust min, low and high watermarks to reasonable values.
> Is it OK to rename min_thp_pageblock_nr_pages to min_nr_free_pages_per_zone
> and move MIGRATE_PCPTYPES * MIGRATE_PCPTYPES inside? Otherwise, the changes
> look reasonable to me.

Hi Zi,

Thanks for the review!

I forgot to change it in another place, sorry about that! So can't move
MIGRATE_PCPTYPES * MIGRATE_PCPTYPES into the combined function.
Have added the additional place where min_thp_pageblock_nr_pages() is called
as a fixlet here:
https://lore.kernel.org/all/a179fd65-dc3f-4769-9916-3033497188ba@gmail.com/

I think atleast in this context the orginal name pageblock_nr_pages isn't
correct as its min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER).
The new name min_thp_pageblock_nr_pages is also not really good, so happy
to change it to something appropriate.
> 
> Another concern on tying watermarks to highest THP order is that if
> user enables PMD THP on such systems with 2MB mTHP enabled initially,
> it could trigger unexpected memory reclaim and compaction, right?
> That might surprise user, since they just want to adjust availability
> of THP sizes, but the whole system suddenly begins to be busy.
> Have you experimented with it?
> 

Yes I would imagine it would trigger reclaim and compaction if the system memory
is too low, but that should hopefully be expected? If the user is enabling 512M
THP, they should expect changes by kernel to allow them to give hugepage of
that size.
Also hopefully, no one is enabling PMD THPs when the system is so low on
memory that it triggers reclaim! There would be an OOM after just a few
of those are faulted in.

Thanks!

