Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EA11CAA85
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744794985; cv=none; b=bNA6OoQ2c5B9Va58wCHs/TSYfjy5pP05495DdVAhZmCIfFW6JJaU0iZVomAMgos1GBUrJ21X6pX8UqRiawjBzsGWjF9+ejhLzJaRAmhPbuvuRY89RQvjGGYnn6Fw0DnVo9crhzNBxsfEsTw9rhK2tVHmyBQWzOAQ3i7DR9q9PTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744794985; c=relaxed/simple;
	bh=4OvW5Xdv6DZ99XmqNGBMzZycQh7BEX81ZTrHFVUwFsY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=M8u6HcbBAK7I4i8rD3w5fU5tPxS1m98d2yVyU+sOyEVyGeFLhHpiLHhuQCtSt9UjhJ+mf+26HwiO7ZLeZTN55Ca7aMTv2vXlL4fy/drGBAdqDKl/QnKlN/gWkdweRaSRpBqlLoptYRHKgYLKYeCwongARsNYBpu36MzchcLh7nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IFSI5lq5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IFSI5lq5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744794983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=EMUZhQ9QAhlk/r94TC7Q0CbNvTRVJ8hvWfj5OUBsi/8=;
	b=IFSI5lq5NrsIQFgn5Hc+cTRcQf39s+DtgVQtb7CBkghIODu7DHHq4p1jDnglFMgvbILXS4
	6r4fqd2XFXAdZ2nXakHWhb8Z48UOhw/0p1a5lZr/V0M48yXRIW8HZBXbLuFLWkfeUYKw+q
	+yQ8oAvKpKdDM1sPuNGbAGhLuJNYmYo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-yrVtUTTmOqeXpKNYBWUiPw-1; Wed, 16 Apr 2025 05:16:19 -0400
X-MC-Unique: yrVtUTTmOqeXpKNYBWUiPw-1
X-Mimecast-MFC-AGG-ID: yrVtUTTmOqeXpKNYBWUiPw_1744794978
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39d917b105bso3664914f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744794978; x=1745399778;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EMUZhQ9QAhlk/r94TC7Q0CbNvTRVJ8hvWfj5OUBsi/8=;
        b=KIBHUJcSQunld9OUEWgz3vFXt1SqR63xB9XuRgfOxNpHo69YCcFQjWnT7Zvq43R+Gr
         wgPMvAvS0UPg/vGRUsVnfhKJ35c6yuhC5j8kcaYOR9XPp1c74wac88cIU0ZYJ2ZVHava
         a9vxD6VTlku5pbtEz5IwkUCG7dpBsU87fk595cwShc/NUxB3qIiWR7Pm94w4Io2tfcnm
         oFD72xRR5w8pxRCzlpIsC7aZIk6hf5gFY9a18IamLecDF4BB5HGTGcW8cUdv9m8grg08
         yHh7/W/yQ1ft7IrOFZO//yTqPhWiU9f1V1X5L/YFNOIxKF5ND2+Bespe7WYWAOdQa46s
         WisQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhHDWgzuGA1XBLpycO3iyiLDm0ubAtGNEMrTyQOJAdzz7fUx9vCoJDRhEV4vBh5DBhk/77uzc80OGNT4g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1cTGSrTLqIA4Bbq43PCeSb8cNTye2/H7oqoaZGIYB/yquqjBv
	2TKPEFUeKf3sGYqrzUISJ3msLXYYXDR8fnnF2+SytzF/T2h/slNk5GlqtPNDd063Py3D+6ffpkR
	jmu1ztusw5avIZ73ovPvmPMsiXTGjMJeAXuUVpJzVgGLNB1YOQ4T3kIhbC1vD8A==
X-Gm-Gg: ASbGncsT4hDb+Q6dvO7MuenQ+iV/6Gr/OtIdevR+xripPJwf73tz/m/qVNnL8b3gs/0
	/8KclsSTbaLwTzZqS5KyuCK7neycjqqxGdtE13KMbxbsqhNtIdIuLFERfpBPfyHeigRfcrFrVPY
	28l5Icg+V9MYoKSOMJCRKMBiSB4DdKs6hVdm/Uztpyc2WupOZZi8Vha4/sx63fZoOB8oSl3A2xt
	kjkWLiUjUJEJ2la/nTodsGDDsCL6jN9NwLvQZJmClm2f/KlT38XrbCNmBOVzmr3BobY5oIl1kig
	uAxfboMza1ZZc/A2vilfk6jS03JCQUtkVzp0fcli2LCHA7Z4CGFHTC/M+bppJRrfZDSWGTN93Qq
	Vnp2qx8/DHdDJvKec6YpjRGF/EFGem0WSnjBtXg==
X-Received: by 2002:a05:6000:178a:b0:39e:dbec:aaee with SMTP id ffacd0b85a97d-39ee5bae0a7mr893344f8f.58.1744794978125;
        Wed, 16 Apr 2025 02:16:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNVcBSTpKF71EbevjHp6bKH3OD5oMA8Zw/+1w3XMdbbPwsTjJbadp+H227A/BRO7GI58jLxg==
X-Received: by 2002:a05:6000:178a:b0:39e:dbec:aaee with SMTP id ffacd0b85a97d-39ee5bae0a7mr893321f8f.58.1744794977685;
        Wed, 16 Apr 2025 02:16:17 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963f62sm16315453f8f.5.2025.04.16.02.16.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 02:16:17 -0700 (PDT)
Message-ID: <50a55a42-6d79-4e3c-992c-26a96dc12d81@redhat.com>
Date: Wed, 16 Apr 2025 11:16:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [mm/rmap] 6af8cb80d3: vm-scalability.throughput
 7.8% regression
From: David Hildenbrand <david@redhat.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Lutomirks^H^Hski <luto@kernel.org>, Borislav Betkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Lance Yang <ioworker0@gmail.com>, Liam Howlett <liam.howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Wilcow <willy@infradead.org>, Michal Koutn <mkoutny@suse.com>,
 Muchun Song <muchun.song@linux.dev>, tejun heo <tj@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Zefan Li <lizefan.x@bytedance.com>, linux-mm@kvack.org
References: <202504152235.188dcce9-lkp@intel.com>
 <b7d2f1dd-d181-4821-ac05-b000818daf91@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <b7d2f1dd-d181-4821-ac05-b000818daf91@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.04.25 10:07, David Hildenbrand wrote:
> On 16.04.25 09:01, kernel test robot wrote:
>>
>>
>> Hello,
>>
>> kernel test robot noticed a 7.8% regression of vm-scalability.throughput on:
>>
>>
>> commit: 6af8cb80d3a9a6bbd521d8a7c949b4eafb7dba5d ("mm/rmap: basic MM owner tracking for large folios (!hugetlb)")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>>
>> testcase: vm-scalability
>> config: x86_64-rhel-9.4
>> compiler: gcc-12
>> test machine: 256 threads 2 sockets GENUINE INTEL(R) XEON(R) (Sierra Forest) with 128G memory
>> parameters:
>>
>> 	runtime: 300s
>> 	size: 8T
>> 	test: anon-cow-seq
>> 	cpufreq_governor: performance
>>
> 
> This should be the scenario with THP enabled. At first, I thought the
> problem would be contention on the per-folio spinlock, but what makes me
> scratch my head is the following:
> 
>        13401           -16.5%      11190        proc-vmstat.thp_fault_alloc
> ...   3430623           -16.5%    2864565        proc-vmstat.thp_split_pmd
> 
> 
> If we allocate less THP, performance of the benchmark will obviously be
> worse with less THPs.
> 
> We allocated 2211 less THPs and had 566058 less THP PMD->PTE remappings.
> 
> 566058 / 2211 =  256, which is exactly the number of threads ->
> vm-scalability fork'ed child processes.
> 
> So it was in fact the benchmark that was effectively using 16.5% less THPs.
> 
> I don't see how this patch would affect the allocation of THPs in any
> way (and I don't think it does).

Thinking about this some more: Assuming both runs execute the same test 
executions, we would expect the number of allocated THPs to not change 
(unless we really have fragmentation that results in less THP getting 
allocated).

Assuming we run into a timeout after 300s and abort the test earlier, we 
could end up with a difference in executions and, therefore THP allocations.

I recall that usually we try to have the same benchmark executions and 
not run into the timeout (otherwise some of these stats, like THP 
allocations are completely unreliable).

Maybe

  7.968e+09           -16.5%  6.652e+09        vm-scalability.workload

indicates that we ended up with less executions? At least the 
"repro-script" seems to indicate that we always execute a fixed number 
of executions, but maybe the repo-script is aborted by the benchmark 
framework.

-- 
Cheers,

David / dhildenb

