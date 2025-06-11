Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAED917597
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749657334; cv=none; b=FGevJk5t11dLugqwl67Vu7QDhdWF3ChHa2hawyLUWKcyyO65b5vywaZ+cLhs0YI/+2oQwswp7Wd5+oYw8aLvjwLJz0P9d90pE5Jkzu9XZk9gqq78d4sNZVgYFjODpoSX9JOBKO1OWgO8RssAP2S4b4WAJVKuJBJ1I6ComdPokRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749657334; c=relaxed/simple;
	bh=ACbN0QILZBlFGuW/IFRbsga1V1LNaj4zDEIxcHwPp8k=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=WX6f2Cf41jUuVA6/ltOdMtjC9mlqSUbYd0spauIy4awww3sz9u7HYgdgNkRXpcUvFyqVvb3ptWf6Vu9Rxv/BENpz4HDk0lLs+gfQRQ3jfBfasl+SwpRc3JKRXZCAzvS1K4ZzbfxL8blv8UPmNcGyU6mTPAnD8p3wjMBhfwrG+1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C2W051hR; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C2W051hR"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-74858256d38so16772b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 08:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749657332; x=1750262132; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lSHrt/i6wLABx1er1hnXEBvZs0NVfsIyOw7SJ0gM/Bk=;
        b=C2W051hRx2jFRM5QqCVKtOPnyD64inpqwyVb31jgZErcXfHflOqN0Bnv2Le1uMQr3l
         Z9HLZkS71+z2yeG0dd+rAkHk5PhdhqibPqOc8x5SuhvBBCD0ngMSRxDMoDOWbKP0rKFj
         t//EMzwut8Go4RKrlWBwVNTRDByrFaaPzA3/VZTbE0NkZnCbP5pn8zoR8ilWn2O9Hd06
         +2gE9uiJdZ77HSEk5YcRDnIZa9n0tDcDVKOVyE8LNJNNO4xOllNhWsbIM0uhlsRXW5tn
         dlDA3QITymjMoLh0bWScy/EZrzoonvHVy/6AzsHuhQ9DTBvlmR8phrRGu+NGqoItP3P3
         RWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749657332; x=1750262132;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lSHrt/i6wLABx1er1hnXEBvZs0NVfsIyOw7SJ0gM/Bk=;
        b=S7TWyKDU4N8CwAjgPFWdCbOfrPr0pdq1e/GV5W/UT+0qF3bsJFerJ70Lhbk4ZEA98g
         S7VPAfDRfaONAQQ2FHn8lHlUepUlMA4cZY4xAq323RFYAHmtLC2BIcAf/cc1Sxj9qMGR
         C/cAoGribrzxG9Lw69DJLh539ogK/C/HKw6M75agIKMWOtHGG69eJgFJjWAXASE50JaF
         ZXaifxdlPW2wanUo4KpIJX9uqwbR6zI0/ITbXGkfqeVAo/WEgC4qELjr/OSg6LcG6cNF
         oLMUlefRb5ewpAsnGsae+oeT7jd+6fsDQQFfn3cHtZDmNFGTDzKoLBlYrWMaEcJGy82D
         HrXw==
X-Forwarded-Encrypted: i=1; AJvYcCV0ZNbQsnJ/VSeiWOIoktHcMAPga3B4h8koGMVK3ut5PHIkKWkurb3AjXkA5zjc1gXHj6eKeuG290s81pA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJlVXA85yDkxH2AGwMKw9UnQ3n5pM412NnVFAXvId59EIueTIF
	yKGiXhs8BO2qgGf0jSwnhsB0Csy4LBE9JYLJhLfk2wKYpZx2YeGr67qVNUtCD39szv1DY5ZbOrx
	IJD86QacVzZcD0HvhYWyW07pRbA==
X-Google-Smtp-Source: AGHT+IEY4oCyU3yFtqDBjFDM7vUkTml3YSkKFK6W7uDhWYJIgAEtSGbPrJc16QJ/SV8yz/kab2qK4p4U1L3q4y+HBA==
X-Received: from pfnx17.prod.google.com ([2002:aa7:84d1:0:b0:746:27ff:87f8])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3998:b0:732:2923:b70f with SMTP id d2e1a72fcca58-7486ce36093mr5293682b3a.11.1749657331997;
 Wed, 11 Jun 2025 08:55:31 -0700 (PDT)
Date: Wed, 11 Jun 2025 08:55:30 -0700
In-Reply-To: <20250331212343.66780-1-joshua.hahnjy@gmail.com> (message from
 Joshua Hahn on Mon, 31 Mar 2025 14:23:41 -0700)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <diqz7c1iw9vx.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [RFC PATCH] mm: hugetlb: Fix incorrect fallback for subpool
From: Ackerley Tng <ackerleytng@google.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: mawupeng1@huawei.com, akpm@linux-foundation.org, mike.kravetz@oracle.com, 
	david@redhat.com, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

Joshua Hahn <joshua.hahnjy@gmail.com> writes:

> On Tue, 25 Mar 2025 14:16:34 +0800 Wupeng Ma <mawupeng1@huawei.com> wrote:
>
>> During our testing with hugetlb subpool enabled, we observe that
>> hstate->resv_huge_pages may underflow into negative values. Root cause
>> analysis reveals a race condition in subpool reservation fallback handling
>> as follow:
>> 
>> hugetlb_reserve_pages()
>>     /* Attempt subpool reservation */
>>     gbl_reserve = hugepage_subpool_get_pages(spool, chg);
>> 
>>     /* Global reservation may fail after subpool allocation */
>>     if (hugetlb_acct_memory(h, gbl_reserve) < 0)
>>         goto out_put_pages;
>> 
>> out_put_pages:
>>     /* This incorrectly restores reservation to subpool */
>>     hugepage_subpool_put_pages(spool, chg);
>> 
>> When hugetlb_acct_memory() fails after subpool allocation, the current
>> implementation over-commits subpool reservations by returning the full
>> 'chg' value instead of the actual allocated 'gbl_reserve' amount. This
>> discrepancy propagates to global reservations during subsequent releases,
>> eventually causing resv_huge_pages underflow.
>> 
>> This problem can be trigger easily with the following steps:
>> 1. reverse hugepage for hugeltb allocation
>> 2. mount hugetlbfs with min_size to enable hugetlb subpool
>> 3. alloc hugepages with two task(make sure the second will fail due to
>>    insufficient amount of hugepages)
>> 4. with for a few seconds and repeat step 3 which will make
>>    hstate->resv_huge_pages to go below zero.
>> 
>> To fix this problem, return corrent amount of pages to subpool during the
>> fallback after hugepage_subpool_get_pages is called.
>> 
>> Fixes: 1c5ecae3a93f ("hugetlbfs: add minimum size accounting to subpools")
>> Signed-off-by: Wupeng Ma <mawupeng1@huawei.com>
>
> Hi Wupeng,
> Thank you for the fix! This is a problem that we've also seen happen in
> our fleet at Meta. I was able to recreate the issue that you mentioned -- to
> explicitly lay down the steps I used:
>
> 1. echo 1 > /proc/sys/vm/nr_hugepages
> 2. mkdir /mnt/hugetlb-pool
> 3.mount -t hugetlbfs -o min_size=2M none /mnt/hugetlb-pool
> 4. (./get_hugepage &) && (./get_hugepage &)
>     # get_hugepage just opens a file in /mnt/hugetlb-pool and mmaps 2M into it.

Hi Joshua,

Would you be able to share the source for ./get_hugepage? I'm trying to
reproduce this too.

Does ./get_hugepage just mmap and then spin in an infinite loop?

Do you have to somehow limit allocation of surplus HugeTLB pages from
the buddy allocator?

Thanks!

> 5. sleep 3
> 6. (./get_hugepage &) && (./get_hugepage &)
> 7. cat /proc/meminfo | grep HugePages_Rsvd
>
> ... and (6) shows that HugePages_Rsvd has indeed underflowed to U64_MAX!
>
> I've also verified that applying your fix and then re-running the reproducer
> shows no underflow.
>
> Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> Tested-by: Joshua Hahn <joshua.hahnjy@gmail.com>
>
> Sent using hkml (https://github.com/sjp38/hackermail)
