Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BBE22689C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 18:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751394973; cv=none; b=EMj144YUVdtFU4bImD4QI4XKyTaPxUmirp9kVT/MovwFOfIrGbIXXMHzyGiyBm6jtWATy4Lkvwx5jyAzeFd94zgWwiXTkavUrmlk6quVUi/yK8z7nrzU8wHX75fmtDcfyseOW1E2uGBCtd9jr5LU3Ru9M9y3qXEq8eDtYl08LrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751394973; c=relaxed/simple;
	bh=x7GcAoJPRdMsR+ex9RsZI7X2acq7lofSoPMyqsdvxjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m/EpGr5G7YqT7fMaAbHOovFsARk0PTlxhU3uiLyjMb2MnNmqM+q2HIkWubfCGkK75DKJ8jJOpgccPaT2+8btwrMoP9/5Qw3BU5qTLQCvfBMuobkRgZddGfi00YaX+DqzjhsGBTlLvjHw1jvGVgykEESxQo7SZUy4Xw7HgkOWj4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W8qBhTHb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W8qBhTHb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751394969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dhVGjOkmOPRPgcmsyr8oYIDE276nQvrlH9Sr7S9N+Hk=;
	b=W8qBhTHbpfu/Ue8aiv3y8TkZHDakGvbA9hhj2hnMZPMmyDzmW9OLtddWlvRnJOrwMTHMvg
	qE+1a0CkEyjhqHobW8V/aCSRyG+CCo43RefGSZDdVljIqmGWX5ypZ4Z8FgkzUhb7tmSPRZ
	0i/dAFry2MrVJ87MEA4PTusdBWOIMb0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-hqJ17D6mPY-G7dWYgybbXw-1; Tue, 01 Jul 2025 14:36:08 -0400
X-MC-Unique: hqJ17D6mPY-G7dWYgybbXw-1
X-Mimecast-MFC-AGG-ID: hqJ17D6mPY-G7dWYgybbXw_1751394967
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451d30992bcso23004855e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 11:36:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751394967; x=1751999767;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dhVGjOkmOPRPgcmsyr8oYIDE276nQvrlH9Sr7S9N+Hk=;
        b=UIjUgWN4y5joVOiKPUf5V0zRwy0ERV08fg6GGqhEmpOaFA2AzvrRkh8MA73hiUT6x7
         hNWj1tJ0CahHuiFskF0jvx4qNR1Q7bFTGLRHlw0o5CUOUXPmo52J1GcCjyKXXLp/KlKq
         RrYiI47XGf2wbucUEAwEM+s6mJjdsJUdFHAx1TN0mPSDuHy8UiYJ3aFXnSzgdpUO9hpu
         Lx6MPh7DEImOabIOxUwT4hOWwgbKsN6hzLOrt2fDogeTzkF2wd1sfQ/dQDq+GaBwQbSQ
         rDE4J3AIc/w+0+wjXqH7Vu2fVd6R3K8FJUo51GtlN6W6YOmkXIeClgmMaqFj797XVZQ8
         KoNA==
X-Forwarded-Encrypted: i=1; AJvYcCXzPqd6jok0Wp2snC2XnxOyzoc/q99Lh5WfRc3vCnVQIJ3Xv12RXKMIyILmxMBOOBLVmNEp9mfsHOzWhVE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuoeLFPw+Al2HNO/4o0QJ7O5s0QUTCPMziBOPTGYjb4ou+Lx3m
	krb0n95/FyhMZBAW/qAupTo2qzDTsSpv4JFoN0dO/mpPPmykA44YsTjPtem0RfOZDR61Nfyl2pk
	HPVl+kNj5UEB7sLLwIy+t2oZ+TpzJDIpCGTxyt7zcBS5wf9idXzIVVNTRazXBHb/pyA==
X-Gm-Gg: ASbGncs+aqtTCbSB+T0+F8mTL9J63BvuwpoM5YCZOlpMtACWgfRdLcHohsm0Xivtnur
	6bLbzXbKi52BKysTIxMA1CV7KMTl765pTji3BqqOkMYX9tVGvm6w8Z2KXmEUTD4G+2j5lXAzh5Q
	CPYweUhv6jBirF1pkVAF+K6g8MhvokREBWge4Yitvzkd5p/XWHsaM/KVZy1GD+d3RKq4gl2K4oy
	QirFSUGJe7tppl8yeJTR9U4wz0VE7L3GcsjyQ7mUXwceNcm5qeAe61SMUx6ZJ7f5gP0u4uCeCg7
	y01VSkYaBh/0/0TTrHALvCJ5n+Pkkl1wt/jxo/+NXUl1uEkf+Nzxrb38Yoa9He4m8nvMN4Uz9Cz
	4HiOMEwqmiBiYehq2+F1ZhWOJjxgTBquWh2OBqS6k34L6ZqhSow==
X-Received: by 2002:a05:600c:4e8b:b0:443:48:66d2 with SMTP id 5b1f17b1804b1-454a3704fc7mr2402475e9.16.1751394967162;
        Tue, 01 Jul 2025 11:36:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGweoxOqJvsWBDPpmJzDMfaIs2u/h7i6A7kFoLC39xYkBIhhlsd6P2BFyYAc299k7eU7wUrIw==
X-Received: by 2002:a05:600c:4e8b:b0:443:48:66d2 with SMTP id 5b1f17b1804b1-454a3704fc7mr2402145e9.16.1751394966647;
        Tue, 01 Jul 2025 11:36:06 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:7500:202e:b0f1:76d6:f9af? (p200300d82f187500202eb0f176d6f9af.dip0.t-ipconnect.de. [2003:d8:2f18:7500:202e:b0f1:76d6:f9af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a4215dbsm172390825e9.35.2025.07.01.11.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 11:36:06 -0700 (PDT)
Message-ID: <b63563f0-5008-4900-b3df-c194435c0f1f@redhat.com>
Date: Tue, 1 Jul 2025 20:36:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] proc: kpagecount: use snapshot_page()
To: Luiz Capitulino <luizcap@redhat.com>, willy@infradead.org
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, lcapitulino@gmail.com, shivankg@amd.com
References: <cover.1750961812.git.luizcap@redhat.com>
 <5e94d287b6174098938ddd9959cf3c0619fb610a.1750961812.git.luizcap@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <5e94d287b6174098938ddd9959cf3c0619fb610a.1750961812.git.luizcap@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.06.25 20:16, Luiz Capitulino wrote:
> Currently, the call to folio_precise_page_mapcount() from kpage_read()
> can race with a folio split. When the race happens we trigger a
> VM_BUG_ON_FOLIO() in folio_entire_mapcount() (see splat below).
> 
> This commit fixes this race by using snapshot_page() so that we
> retreive the folio mapcount using a folio snapshot.
> 
> Splat:
> 
> [ 2356.558576] page: refcount:1 mapcount:1 mapping:0000000000000000 index:0xffff85200 pfn:0x6f7c00
> [ 2356.558748] memcg:ffff000651775780
> [ 2356.558763] anon flags: 0xafffff60020838(uptodate|dirty|lru|owner_2|swapbacked|node=1|zone=2|lastcpupid=0xfffff)
> [ 2356.558796] raw: 00afffff60020838 fffffdffdb5d0048 fffffdffdadf7fc8 ffff00064c1629c1
> [ 2356.558817] raw: 0000000ffff85200 0000000000000000 0000000100000000 ffff000651775780
> [ 2356.558839] page dumped because: VM_BUG_ON_FOLIO(!folio_test_large(folio))
> [ 2356.558882] ------------[ cut here ]------------
> [ 2356.558897] kernel BUG at ./include/linux/mm.h:1103!
> [ 2356.558982] Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
> [ 2356.564729] CPU: 8 UID: 0 PID: 1864 Comm: folio-split-rac Tainted: G S      W           6.15.0+ #3 PREEMPT(voluntary)
> [ 2356.566196] Tainted: [S]=CPU_OUT_OF_SPEC, [W]=WARN
> [ 2356.566814] Hardware name: Red Hat KVM, BIOS edk2-20241117-3.el9 11/17/2024
> [ 2356.567684] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [ 2356.568563] pc : kpage_read.constprop.0+0x26c/0x290
> [ 2356.569605] lr : kpage_read.constprop.0+0x26c/0x290
> [ 2356.569992] sp : ffff80008fb739b0
> [ 2356.570263] x29: ffff80008fb739b0 x28: ffff00064aa69580 x27: 00000000ff000000
> [ 2356.570842] x26: 0000fffffffffff8 x25: ffff00064aa69580 x24: ffff80008fb73ae0
> [ 2356.571411] x23: 0000000000000001 x22: 0000ffff86c6e8b8 x21: 0000000000000008
> [ 2356.571978] x20: 00000000006f7c00 x19: 0000ffff86c6e8b8 x18: 0000000000000000
> [ 2356.572581] x17: 3630303066666666 x16: 0000000000000003 x15: 0000000000001000
> [ 2356.573217] x14: 00000000ffffffff x13: 0000000000000004 x12: 00aaaaaa00aaaaaa
> [ 2356.577674] x11: 0000000000000000 x10: 00aaaaaa00aaaaaa x9 : ffffbf3afca6c300
> [ 2356.578332] x8 : 0000000000000002 x7 : 0000000000000001 x6 : 0000000000000001
> [ 2356.578984] x5 : ffff000c79812408 x4 : 0000000000000000 x3 : 0000000000000000
> [ 2356.579635] x2 : 0000000000000000 x1 : ffff00064aa69580 x0 : 000000000000003e
> [ 2356.580286] Call trace:
> [ 2356.580524]  kpage_read.constprop.0+0x26c/0x290 (P)
> [ 2356.580982]  kpagecount_read+0x28/0x40
> [ 2356.581336]  proc_reg_read+0x38/0x100
> [ 2356.581681]  vfs_read+0xcc/0x320
> [ 2356.581992]  ksys_read+0x74/0x118
> [ 2356.582306]  __arm64_sys_read+0x24/0x38
> [ 2356.582668]  invoke_syscall+0x70/0x100
> [ 2356.583022]  el0_svc_common.constprop.0+0x48/0xf8
> [ 2356.583456]  do_el0_svc+0x28/0x40
> [ 2356.583930]  el0_svc+0x38/0x118
> [ 2356.584328]  el0t_64_sync_handler+0x144/0x168
> [ 2356.584883]  el0t_64_sync+0x19c/0x1a0
> [ 2356.585350] Code: aa0103e0 9003a541 91082021 97f813fc (d4210000)
> [ 2356.586130] ---[ end trace 0000000000000000 ]---
> [ 2356.587377] note: folio-split-rac[1864] exited with irqs disabled
> [ 2356.588050] note: folio-split-rac[1864] exited with preempt_count 1
> 
> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
> ---
>   fs/proc/page.c | 21 +++++++++++++++++----
>   1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/proc/page.c b/fs/proc/page.c
> index 999af26c7298..936f8bbe5a6f 100644
> --- a/fs/proc/page.c
> +++ b/fs/proc/page.c
> @@ -43,6 +43,22 @@ static inline unsigned long get_max_dump_pfn(void)
>   #endif
>   }
>   
> +static u64 get_kpage_count(const struct page *page)
> +{
> +	struct page_snapshot ps;
> +	u64 ret;
> +
> +	snapshot_page(&ps, page);
> +
> +	if (IS_ENABLED(CONFIG_PAGE_MAPCOUNT))
> +		ret = folio_precise_page_mapcount(&ps.folio_snapshot,
> +						  &ps.page_snapshot);
> +	else
> +		ret = folio_average_page_mapcount(&ps.folio_snapshot);
> +
> +	return ret;
> +}
> +
>   static ssize_t kpage_read(struct file *file, char __user *buf,
>   		size_t count, loff_t *ppos,
>   		enum kpage_operation op)
> @@ -75,10 +91,7 @@ static ssize_t kpage_read(struct file *file, char __user *buf,
>   				info = stable_page_flags(page);
>   				break;
>   			case KPAGE_COUNT:
> -				if (IS_ENABLED(CONFIG_PAGE_MAPCOUNT))
> -					info = folio_precise_page_mapcount(page_folio(page), page);
> -				else
> -					info = folio_average_page_mapcount(page_folio(page));
> +				info = get_kpage_count(page);
>   				break;
>   			case KPAGE_CGROUP:
>   				info = page_cgroup_ino(page);

Yes, that should work

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

