Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2723621CC6D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 10:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749722945; cv=none; b=gjqKCyl4sZLhwtuAaHudwWQExvchNixv2MuQ6hSONIHGxkcFaehs5dg37HDyzUXzmHAqo4iKCvQVoM6IeCPFHPPaZkWxeSZCUw98GzapgYW4DJHYC2V48pwQMo52+RDFvsaFfq7GoEj/FwgEj4vd4X9Wh/asv6gre8Q0jPVowXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749722945; c=relaxed/simple;
	bh=62F4NJB2BS7u3zfidjfNCmpCwpjdsdZtOmNG51qYGT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fuNfV0J1yQZi9WSTfWTfYJ3MvqlEK87HSuOxX3V2oQLsjDj2iPAmfOb+SMpMdgXRkqhxSNLT2M6OsqllLmfZCvFPugZISXNajdT4Ct0cdbSBNddLu/szXMq0hMjQ/pyaBYelBv7UcaDcEQm8iIQ31cEi0p8cApVPjM3z9emcXFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XUWvKdLC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XUWvKdLC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749722942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FtyzcGGcDbQZcQDEpMvfV5feFpNxVQq4Iu8Jf7s2lq4=;
	b=XUWvKdLCPdycXtaYjLowVwzdH3qYvmc/2YJRBYB8BDjWssQZnuU4QOgfTLnHW9xRr4ZC6T
	tACJ6UluP2yAW4exP73N0gdGKZ5+WQXI9IzzgYvLYAjGqCIF1saCkTuWinXStvv9lQ4/VO
	Q6RLdtgkf9Su9j2F3pkdOKAoH1QTBHs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-honh-nZ9Nt69p0Od1OJxOw-1; Thu, 12 Jun 2025 06:09:00 -0400
X-MC-Unique: honh-nZ9Nt69p0Od1OJxOw-1
X-Mimecast-MFC-AGG-ID: honh-nZ9Nt69p0Od1OJxOw_1749722940
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d244bfabso6130025e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 03:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749722939; x=1750327739;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FtyzcGGcDbQZcQDEpMvfV5feFpNxVQq4Iu8Jf7s2lq4=;
        b=f3z2hJJDQOdgiyYCuE54Vf8TNbikrq/mA7/qb1gVWBAKWMh+JFbS8n+43t/WxRYbRC
         XoJLsoi/mUmQR+u54Y5zAAUbNiNJxwkge5dyk9A6DdEiEpoUUeANJSLXO934YRh7he8/
         Yzb/j0xetkIe1MgEN1yRzJFJsvqtDOJbYQWypVxqD+AgwjDt/M8MKdWs/5LX9O4tqXwL
         hP8O2fKSOGCSXSsqmze2BgELAn3nPgEehCb3CZtY7447ssKJ/s1K5bSiyTNsZMefBBWO
         4aOP6D1cCybm7Ysfd6XViaZCZK0zxn++Ec5V4UQzJJLZOdoIscoyinVBONlY4GWCq8ri
         A04g==
X-Forwarded-Encrypted: i=1; AJvYcCWoORzpjAUDf6C8CbWS41sgUdN/b7OiXjtfO2iFJIvCKy5Fq+ieo6ZGa83evPJSUvmeSrzWtkR7D/idDI4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxadGcpQMk3V7/6URU3kfTUH6tF7AswcDSW/lZZFE0Dms/dxyyW
	pCmwy64mTrEzJU3Y6exlUZ4N+MDEL9iAB5HQZD4HktmU187q/2ISMhRviCH+RqHH7K4OLcz/yHf
	FKNn2tqDnxdzGU+WB6PvLvAGCNxH1YkkYnX9NK4g6yYCxyxGMRMFeL1C2jbfAkow1QQ==
X-Gm-Gg: ASbGncvL//YNOhH/G2rfQTB/cSbhmgYhbff24lZo815RK+a7wEz1btehGmg5dBivo+c
	21phDKg7AnM6qVQWDZcstgBkJcRUsZ3vMytT2434tJnfCEtHKaJYxXEzZkU3dGY+k7sa2lr8M+s
	vwQv+qLjSBi0NltdTj/CqxU5zL8Sa0n/6SLEpBqBhjfMIf86gsFBwCJje60YarRW5jYqvCxM0QU
	kS0L3+/T53MmYmu9N4WYjM0vTBhOivdlol2XTTJq5k4PGvYOlz0yiSfRg+Pd8clZ8BqQdBIn+C2
	1a5NINNFL9zELUv48u+11R55clc2lZmwAihnAVSfV3Nb1cY63I2ILw4e307YxOtIsjuLIlucSof
	0IM7DXd28WPBm3tBIDCyOSlQa+eHFpk3YIDxs42Qq8W8TAxNPNQ==
X-Received: by 2002:a05:600c:8b27:b0:450:cde3:f266 with SMTP id 5b1f17b1804b1-4532d33d836mr18693125e9.22.1749722939557;
        Thu, 12 Jun 2025 03:08:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSsfAJFhAj1LcsO8Jt31ws3dd4bwGEqWAtTOW4HUlzcpub5aRnbZ7DphGMfuDuZaTWtm26Nw==
X-Received: by 2002:a05:600c:8b27:b0:450:cde3:f266 with SMTP id 5b1f17b1804b1-4532d33d836mr18692795e9.22.1749722939148;
        Thu, 12 Jun 2025 03:08:59 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:1e00:1e1e:7a32:e798:6457? (p200300d82f2c1e001e1e7a32e7986457.dip0.t-ipconnect.de. [2003:d8:2f2c:1e00:1e1e:7a32:e798:6457])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561a3c763sm1530124f8f.62.2025.06.12.03.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 03:08:58 -0700 (PDT)
Message-ID: <e06530f6-5c2e-4b6f-b175-c7aaab79aa4e@redhat.com>
Date: Thu, 12 Jun 2025 12:08:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] selftests: khugepaged: fix the shmem collapse failure
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, shuah@kernel.org,
 ziy@nvidia.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <c16d1d452aa876b449324d12df6465677158a711.1749697399.git.baolin.wang@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <c16d1d452aa876b449324d12df6465677158a711.1749697399.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.06.25 05:54, Baolin Wang wrote:
> When running the khugepaged selftest for shmem (./khugepaged all:shmem),

Hmm, this combination is not run automatically through run_tests.sh, 
right? IIUC, it only runs "./khugepaged" which tests anon only ...

Should we add it there? Then I would probably have noticed that myself 
earlier :)

> I encountered the following test failures:
> "
> Run test: collapse_full (khugepaged:shmem)
> Collapse multiple fully populated PTE table.... Fail
> ...
> Run test: collapse_single_pte_entry (khugepaged:shmem)
> Collapse PTE table with single PTE entry present.... Fail
> ...
> Run test: collapse_full_of_compound (khugepaged:shmem)
> Allocate huge page... OK
> Split huge page leaving single PTE page table full of compound pages... OK
> Collapse PTE table full of compound pages.... Fail
> "
> 
> The reason for the failure is that, it will set MADV_NOHUGEPAGE to prevent
> khugepaged from continuing to scan shmem VMA after khugepaged finishes
> scanning in the wait_for_scan() function. Moreover, shmem requires a refault
> to establish PMD mappings.
> 
> However, after commit 2b0f922323cc, PMD mappings are prevented if the VMA is
> set with MADV_NOHUGEPAGE flag, so shmem cannot establish PMD mappings during
> refault.

Right. It's always problematic when we have some contradicting 
information in the VMA vs. pagecache.

> 
> To fix this issue, we can set the MADV_NOHUGEPAGE flag after the shmem refault.
> With this fix, the shmem test case passes.
> 
> Fixes: 2b0f922323cc ("mm: don't install PMD mappings when THPs are disabled by the hw/process/vma")
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>   tools/testing/selftests/mm/khugepaged.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index 8a4d34cce36b..d462f62d8116 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -561,8 +561,6 @@ static bool wait_for_scan(const char *msg, char *p, int nr_hpages,
>   		usleep(TICK);
>   	}
>   
> -	madvise(p, nr_hpages * hpage_pmd_size, MADV_NOHUGEPAGE);
> -
>   	return timeout == -1;
>   }
>   
> @@ -585,6 +583,7 @@ static void khugepaged_collapse(const char *msg, char *p, int nr_hpages,
>   	if (ops != &__anon_ops)
>   		ops->fault(p, 0, nr_hpages * hpage_pmd_size);
>   
> +	madvise(p, nr_hpages * hpage_pmd_size, MADV_NOHUGEPAGE);
>   	if (ops->check_huge(p, expect ? nr_hpages : 0))
>   		success("OK");
>   	else

It's a shame we have this weird interface: there is no way we can clear 
VM_HUGEPAGE without setting VM_NOHUGEPAGE :(

But, do we even care about setting MADV_NOHUGEPAGE at all? IIUC, we'll 
almost immediately later call cleanup_area() where we munmap(), right?

-- 
Cheers,

David / dhildenb

