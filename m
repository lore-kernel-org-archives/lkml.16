Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE268460;
	Fri,  6 Jun 2025 15:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222096; cv=none; b=OAKWORWs3tZcfsmqtxGfc3oupn5biXfytz+dMmHRX+CaMQUq0TZP2r1/5ysIEQMFTprJm9npaezrtih5gHDL3S8zlJRwldpryXFeeuyz3/HroygqiQrNFpBLD9MZ3L4pOTTL63bKHPKdjeDBcWh2X4S1hSZvw6W+9M3Ltzmb4GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222096; c=relaxed/simple;
	bh=yUUhB1V4P3vMF52b0JssHYCOLC3ksdnfcLgsPK4tb8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VQBu3KfD3iQAshKYQoLGSy4sIZIqmrcyNxcxYdEVPbLosYLbJSGKU626N4RmfLEpttYQ4w/poKOk9X/YoXkNgsFWbd6tJF3+iWU1O59z8Sw20aelqkDwkZvLq7WGEz7tfrxrhFri09PDMRDWflHyUsJKFDUEbVZODGoentJG2i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cgL4adfy; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cgL4adfy"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so25484705e9.1;
        Fri, 06 Jun 2025 08:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749222092; x=1749826892; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XhE/4kgP6Fj+Sk1yGpIDfKiYEXxDvnVhFRdNE9ODL7c=;
        b=cgL4adfyWXgCRWpv68FR8aNVux6r7CeKCFyXaCIi73oWOCNhBHFGbJzDM5bl8yxRED
         B5gjXwz6ORzE3tha/oGb5Y+I3AmbM0k9/P0CRLCVdArqoou69pNcO3xTszZhOGnmn3vT
         qC1VJyCGLoMruTFOB/AVpYhV73IQsbT2J7bdOr9l8LnBpPzTM59aoDsLE1RSufgI2Wh6
         MMq5esi+mDm7GpKVuqLXh0B3hOBXwiJe0eSex4EhIAAuGcMsz9w3OQ71bJ4jF6DbVpT1
         5QgOQ+tqt3D2e1GdQiJ126G+23bnKzDhd21P738HihJc8ZOsyHwJ1RkmP7gh5bvXXYiW
         ipww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222092; x=1749826892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XhE/4kgP6Fj+Sk1yGpIDfKiYEXxDvnVhFRdNE9ODL7c=;
        b=UFjpDOWHlWDFrJF25yV2FCQWfMWhIuxN3WFg5SP/NhdXMa6X8PyPDvQWRXi0WLJuW/
         OtdyTxbfM9hqY05EB2yeSkB6piIyEFi8ys3BUUGBhyCsYxFZ2Fcsqd0WOI/ITkBWr4AX
         e2P5oO3WLccZcZ+9zaIb364EeqeX5lGJLzqo32+69v/wqV+KYe3RYAbGmg8kAfe0v7+6
         2+Mcztf7k7A2wT71+cocGGhtv+DJzJ/U2rDsd0WINER2u0FbyS9FZ228VWxafdg5/lKj
         HAo0UBs2lwHBoAxAr+mgfkELtND/JksQ7/YI6N6wDytcEYByGRnlT8O++xzl5e9LA88K
         Txqg==
X-Forwarded-Encrypted: i=1; AJvYcCUskQacVXBxdrdEyWFxrq9ooqaspplMZbpAEsQLSy7v9rQH86qZopogmUT01Su0EPh3JroXuZRR8/s=@vger.kernel.org, AJvYcCXfW9ys3BMtrCJDfXf+SFZOoos8+O8sCgOFdd1VFGmAaTjCiT8W6Z39kKq+5uemgMJ9Cxy/eJZNYY2CPeBI@vger.kernel.org
X-Gm-Message-State: AOJu0YzFt5jdQpRWTIZVVOEiMvE3osO+maEfIPRjh7oyvedaVkpDgQuF
	NysuFMJCoBs8UiXyF9nuessOcAkAO68IfQxHlLbRpY1cEOPwmOrv7ZWe
X-Gm-Gg: ASbGncvYJDsmV/vkkYS/Aggwfj044tZq75qRkSIa1BYV1QSQ13+zoM2i5P5X+r7pMAx
	IrzWPdw6hIQQ/DOM4BR/miwBCLHhNUVyjvi0tdQBy4b2HwbL+JHUdRWP3fjmWLNAUqgJtBNKgAq
	AU9evENSklh8bt9grM1FFUMZxzrQKMpKTL+hULYO+xtMrDXQyZu1Sa/ncn8lKkkfSjBmU+qNmSB
	pjLsDI4xAbCv9dNVE1ppBaITr4jBSNi5WxcBkcnA7n821VuuPiBTwtYTYUBtg3YknXPtbHE7/yR
	hxL3nn5/hiIH9w35u9m70JMHQF1J3wet9Z2RoFmtmRWdndfyGOwF0+NEa8OTe8HHzTBeNyrOLHr
	LbjX+PSJHvSSegY4WlWC6rphaUmeZwludcTpvitgnIDHiihg=
X-Google-Smtp-Source: AGHT+IGht4L4AYrqtRi/DYoLhXywqrxJl5BXrMudsXr/8v6ZxPuIrlGuqilGoY0sNyJ/JMif5N4S6g==
X-Received: by 2002:a05:600c:1ca9:b0:43c:fbbf:7bf1 with SMTP id 5b1f17b1804b1-452013fb5d4mr44245585e9.30.1749222090165;
        Fri, 06 Jun 2025 08:01:30 -0700 (PDT)
Received: from ?IPV6:2a02:6b6f:e750:f900:146f:2c4f:d96e:4241? ([2a02:6b6f:e750:f900:146f:2c4f:d96e:4241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45203e6e424sm27286955e9.0.2025.06.06.08.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 08:01:29 -0700 (PDT)
Message-ID: <a179fd65-dc3f-4769-9916-3033497188ba@gmail.com>
Date: Fri, 6 Jun 2025 16:01:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
To: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
 linux-mm@kvack.org
Cc: hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 ziy@nvidia.com, baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, hughd@google.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com,
 Breno Leitao <leitao@debian.org>
References: <20250606143700.3256414-1-usamaarif642@gmail.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <20250606143700.3256414-1-usamaarif642@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06/06/2025 15:37, Usama Arif wrote:
> On arm64 machines with 64K PAGE_SIZE, the min_free_kbytes and hence the
> watermarks are evaluated to extremely high values, for e.g. a server with
> 480G of memory, only 2M mTHP hugepage size set to madvise, with the rest
> of the sizes set to never, the min, low and high watermarks evaluate to
> 11.2G, 14G and 16.8G respectively.
> In contrast for 4K PAGE_SIZE of the same machine, with only 2M THP hugepage
> size set to madvise, the min, low and high watermarks evaluate to 86M, 566M
> and 1G respectively.
> This is because set_recommended_min_free_kbytes is designed for PMD
> hugepages (pageblock_order = min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)).
> Such high watermark values can cause performance and latency issues in
> memory bound applications on arm servers that use 64K PAGE_SIZE, eventhough
> most of them would never actually use a 512M PMD THP.
> 
> Instead of using HPAGE_PMD_ORDER for pageblock_order use the highest large
> folio order enabled in set_recommended_min_free_kbytes.
> With this patch, when only 2M THP hugepage size is set to madvise for the
> same machine with 64K page size, with the rest of the sizes set to never,
> the min, low and high watermarks evaluate to 2.08G, 2.6G and 3.1G

I forgot to change the other pageblock_nr_pages instance, the patch
will need the below fixlet as well. The watermark numbers will then be
the same as when 4K PAGE_SIZE is used.

commit 0c6bb4e5b3aa078949d712ab9c35e7b2a33cd8a4 (HEAD)
Author: Usama Arif <usamaarif642@gmail.com>
Date:   Fri Jun 6 15:43:25 2025 +0100

    [fixlet] mm: khugepaged: replace all instances of pageblock_nr_pages
    
    This will change the 64K page size, 2M THP hugepage madvise  min, low
    and high watermarks to 87M, 575M and 1G.
    
    Signed-off-by: Usama Arif <usamaarif642@gmail.com>

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index e64cba74eb2a..1c643f13135e 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2650,7 +2650,7 @@ static void set_recommended_min_free_kbytes(void)
        }
 
        /* Ensure 2 pageblocks are free to assist fragmentation avoidance */
-       recommended_min = pageblock_nr_pages * nr_zones * 2;
+       recommended_min = min_thp_pageblock_nr_pages() * nr_zones * 2;
 
        /*
         * Make sure that on average at least two pageblocks are almost free
