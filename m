Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452382566
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 10:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748256779; cv=none; b=ZfT0v7a053ISP7oI/Pw2/8xDsXWGuzIBi/W4R0gkZFcvHJX4ciQ1cKPjsNzPgorn0Ut3xfWLNEkRIX9uN0hbZJ5uvitxTwQ0GkUyYYGTmo0MXSlJticFseMgz0Nn623/YfpFoo1ZlfPjU3qKLOsea8Ztd+fxrnJ2GfW8N02nv3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748256779; c=relaxed/simple;
	bh=SsDD9GNfO3awfKnPp6c9SqOpx1+vrvgPsHP5DWickgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JusqMXjC6FoFi4eXdlu4GK6YTvBoDIuzqKEZJHMzyjYvbyY94e4prWaYTQmXVJQ+7dOCBZmwC0FtsQnuy7bi2Xo4NKZ6fj7iYIytEJm5X2j1Jz7e8t1BE11Soz3BA01ogDH+GNRKszNxdBQHSJ3UFeMubZ2158tnI8yXpCGDbh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FBCeqofT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FBCeqofT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748256776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=agl5zqHCXKOj8oh7bu4iPZZu24/EX+Ffoc+ax5t+pSs=;
	b=FBCeqofTOWyXdBZRnX/k3/qFMBcqbKylCBySvGge8PIXT/FrrIMzbSIOhbG8VkAl50fXQQ
	Axt20icoC8eALlzifFIc7i+X+DV1w0BdBpGZmNWfgzxBkqH7BVPt5p/B7X2DJqIOhKa6ug
	HX+jXLROciH7o8EtrIH1rGL17VFCMFE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-5n_t68aEMM-MZvm1MYzIhQ-1; Mon, 26 May 2025 06:52:52 -0400
X-MC-Unique: 5n_t68aEMM-MZvm1MYzIhQ-1
X-Mimecast-MFC-AGG-ID: 5n_t68aEMM-MZvm1MYzIhQ_1748256772
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a35ec8845cso717153f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 03:52:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748256772; x=1748861572;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agl5zqHCXKOj8oh7bu4iPZZu24/EX+Ffoc+ax5t+pSs=;
        b=Gpyu7inmCxFUIbKW3nHYQJ+PdjJuseDA345ncNdpKoCJgKAC08jIXgGOcAerhsgRwy
         DP+8P2pPCCNSwxrMO69R49O1SzLEHy4cYc3f4HM+idGNwiDOJgUTouXDtcG8sPZ14FXQ
         xgRYUm7+rsOo3CHpvX41fccobecOtnvsF56C9NN0xLp7vOOYHb2vZhb72qa1WViEoGg/
         e3iPLdiCaiFKETZshsi89sNmkuU2bFU7VNHWQdEzgjG/li7tWg1G351oru0QAEiz/J0r
         y6Q3MZCSsjw0xtaZZgzDtGbzC7ERPkAVcHQAfuG1lZOVaNNtRrsOWJeylkp5SiPzSEeP
         G/Yg==
X-Forwarded-Encrypted: i=1; AJvYcCXmPnEl69vmsJoS7P/IPT+cMT9CL8DuyiyjpUe0zC+HWygekwUfWL6thDc05WQz7OisRYMec//cvk8mdzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD1zE5wgUMkhq/e1P5g7BrFO6pjrMAsJvzDxWdBPah3EZ1qpBO
	k8e/e10z9rvXNPQ1nBqIpVhPA+fNXBWzTx5JfkuEUaKGDpxiUxGJ5EXfunfq3zVQG0YYF4DbVHc
	FLHxcW2A5xlUdpf9jMhkDz1BzVf43HIolcVYavO/9wXRDNs+uU5k2yvABoXVR8gGwTQ==
X-Gm-Gg: ASbGncu/pyKAyOReSOsQjz7bgykenBdfiZi6yTiT4Nin3+yrfTj8MbN9mPWZfboZyt0
	NQcwTws4bBMx+A4Kr9DRitKGejcFD47ml7wAu9n4ndWjvZZYKD9fc0ddgBEvMMzRZCzxABko/kv
	04/faGqPGjmlSPGixosvx5d8lqey6DY+XgqGEHFwhUa4tasg8eR41ZJhB2ZLIrzScLnJclkBjO/
	wJX7wpSWozl93puvliZqxGRYQRtIlbjglUR0fGC9mMvCF5QoblSdRdMVWJXTkyX4KtjJSqVGH6P
	x9LNeDZHmi8C2ZEnfdBs2eM8r7DdLiZus//zsf7aaZVDE2l/3jrmFUuYMwz9PiOR//YoTghqE1l
	W3djsHFX8L74K0zXKLi5j6aw42mslJcHPawW1JUc=
X-Received: by 2002:a05:6000:40ce:b0:3a4:dd00:9af3 with SMTP id ffacd0b85a97d-3a4dd009bb9mr1281211f8f.56.1748256771458;
        Mon, 26 May 2025 03:52:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExXILYndsRrSrKzcxeSiLBx/II1KAjyFY35fIgZ6xpvR2sbcywUWMgqozeQzX8glf19HtSRg==
X-Received: by 2002:a05:6000:40ce:b0:3a4:dd00:9af3 with SMTP id ffacd0b85a97d-3a4dd009bb9mr1281184f8f.56.1748256770982;
        Mon, 26 May 2025 03:52:50 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:6500:e1c1:8216:4c25:efe4? (p200300d82f196500e1c182164c25efe4.dip0.t-ipconnect.de. [2003:d8:2f19:6500:e1c1:8216:4c25:efe4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef035csm228692955e9.11.2025.05.26.03.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 03:52:50 -0700 (PDT)
Message-ID: <1d7eb1b8-c28e-47b1-866b-8a125b12afbc@redhat.com>
Date: Mon, 26 May 2025 12:52:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] WARNING in folio_add_file_rmap_ptes
To: syzbot <syzbot+18bba5153739c29b88c5@syzkaller.appspotmail.com>,
 Liam.Howlett@oracle.com, akpm@linux-foundation.org, harry.yoo@oracle.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, riel@surriel.com,
 syzkaller-bugs@googlegroups.com, vbabka@suse.cz
References: <68343875.a70a0220.253bc2.0094.GAE@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <68343875.a70a0220.253bc2.0094.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.05.25 11:46, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    187899f4124a Merge branch 'for-next/core' into for-kernelci
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=12f7f9f4580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=89c13de706fbf07a
> dashboard link: https://syzkaller.appspot.com/bug?extid=18bba5153739c29b88c5
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> userspace arch: arm64
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/ab8c5d5c6c34/disk-187899f4.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/d67a1d9c9f04/vmlinux-187899f4.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/074a891b2686/Image-187899f4.gz.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+18bba5153739c29b88c5@syzkaller.appspotmail.com
> 
> page dumped because: VM_WARN_ON_FOLIO((_Generic((page), const struct page *: (const struct folio *)_compound_head(page), struct page *: (struct folio *)_compound_head(page))) != folio)
> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 10255 at ./include/linux/rmap.h:426 __folio_rmap_sanity_checks include/linux/rmap.h:426 [inline]
> WARNING: CPU: 1 PID: 10255 at ./include/linux/rmap.h:426 __folio_add_rmap mm/rmap.c:1252 [inline]
> WARNING: CPU: 1 PID: 10255 at ./include/linux/rmap.h:426 __folio_add_file_rmap mm/rmap.c:1620 [inline]
> WARNING: CPU: 1 PID: 10255 at ./include/linux/rmap.h:426 folio_add_file_rmap_ptes+0x864/0xa80 mm/rmap.c:1642
> Modules linked in:
> CPU: 1 UID: 0 PID: 10255 Comm: syz.0.668 Not tainted 6.15.0-rc7-syzkaller-g187899f4124a #0 PREEMPT
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
> pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : __folio_rmap_sanity_checks include/linux/rmap.h:426 [inline]
> pc : __folio_add_rmap mm/rmap.c:1252 [inline]
> pc : __folio_add_file_rmap mm/rmap.c:1620 [inline]
> pc : folio_add_file_rmap_ptes+0x864/0xa80 mm/rmap.c:1642
> lr : __folio_rmap_sanity_checks include/linux/rmap.h:426 [inline]
> lr : __folio_add_rmap mm/rmap.c:1252 [inline]
> lr : __folio_add_file_rmap mm/rmap.c:1620 [inline]
> lr : folio_add_file_rmap_ptes+0x864/0xa80 mm/rmap.c:1642
> sp : ffff80009ea777f0
> x29: ffff80009ea77830 x28: ffff0000d89a43c0 x27: 0000000020010000
> x26: 002000013aaf4bc3 x25: 00000000000001f0 x24: fffffdffc3eaba30
> x23: fffffdffc3eabd00 x22: dfff800000000000 x21: 000000000020b68f
> x20: fffffdffc3eabd48 x19: fffffdffc3eaba00 x18: 00000000ffffffff
> x17: 0000000000000000 x16: ffff80008ad27e48 x15: ffff700011e740c0
> x14: 1ffff00011e740c0 x13: 0000000000000004 x12: ffffffffffffffff
> x11: 0000000000080000 x10: 000000000000b6d5 x9 : c4bcfe0a46a0cd00
> x8 : c4bcfe0a46a0cd00 x7 : 0000000000000001 x6 : 0000000000000001
> x5 : ffff80009ea76ef8 x4 : ffff80008f415ba0 x3 : ffff800080548ef0
> x2 : 0000000000000000 x1 : 0000000000000001 x0 : 00000000000000b8
> Call trace:
>   __folio_rmap_sanity_checks include/linux/rmap.h:426 [inline] (P)
>   __folio_add_rmap mm/rmap.c:1252 [inline] (P)
>   __folio_add_file_rmap mm/rmap.c:1620 [inline] (P)
>   folio_add_file_rmap_ptes+0x864/0xa80 mm/rmap.c:1642 (P)
>   set_pte_range+0x28c/0x434 mm/memory.c:5256
>   filemap_map_folio_range mm/filemap.c:3631 [inline]
>   filemap_map_pages+0xb50/0x1558 mm/filemap.c:3740
>   do_fault_around mm/memory.c:5476 [inline]
>   do_read_fault mm/memory.c:5509 [inline]
>   do_fault mm/memory.c:5652 [inline]
>   do_pte_missing mm/memory.c:4160 [inline]
>   handle_pte_fault mm/memory.c:5997 [inline]
>   __handle_mm_fault mm/memory.c:6140 [inline]
>   handle_mm_fault+0x2b84/0x4d18 mm/memory.c:6309
>   do_page_fault+0x428/0x1554 arch/arm64/mm/fault.c:647
>   do_translation_fault+0xc4/0x114 arch/arm64/mm/fault.c:783
>   do_mem_abort+0x70/0x194 arch/arm64/mm/fault.c:919
>   el0_da+0x64/0x160 arch/arm64/kernel/entry-common.c:627
>   el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:789
>   el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> irq event stamp: 292
> hardirqs last  enabled at (291): [<ffff80008055041c>] __up_console_sem kernel/printk/printk.c:344 [inline]
> hardirqs last  enabled at (291): [<ffff80008055041c>] __console_unlock+0x70/0xc4 kernel/printk/printk.c:2885
> hardirqs last disabled at (292): [<ffff80008adb9eb8>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:511
> softirqs last  enabled at (8): [<ffff8000801fbf10>] local_bh_enable+0x10/0x34 include/linux/bottom_half.h:32
> softirqs last disabled at (6): [<ffff8000801fbedc>] local_bh_disable+0x10/0x34 include/linux/bottom_half.h:19
> ---[ end trace 0000000000000000 ]---
> page: refcount:10 mapcount:1 mapping:00000000dc26ff10 index:0x4 pfn:0x13aae8
> head: order:2 mapcount:4 entire_mapcount:0 nr_pages_mapped:4 pincount:0
> memcg:ffff0000d4838000
> aops:bch_address_space_operations ino:1002 dentry name(?):"file1"
> flags: 0x5ffc0000000516d(locked|referenced|uptodate|lru|active|arch_1|private|head|node=0|zone=2|lastcpupid=0x7ff)
> raw: 05ffc0000000516d fffffdffc3e1bf08 fffffdffc3d17508 ffff0000f1fd18e8
> raw: 0000000000000004 ffff0000d4c1f300 0000000a00000000 ffff0000d4838000
> head: 05ffc0000000516d fffffdffc3e1bf08 fffffdffc3d17508 ffff0000f1fd18e8
> head: 0000000000000004 ffff0000d4c1f300 0000000a00000000 ffff0000d4838000
> head: 05ffc00000000202 fffffdffc3eaba01 0000000400000003 00000000ffffffff
> head: ffffffff00000003 000000000000003d 0000000000000000 0000000000000004
> page dumped because: VM_WARN_ON_FOLIO((_Generic((page + nr_pages - 1), const struct page *: (const struct folio *)_compound_head(page + nr_pages - 1), struct page *: (struct folio *)_compound_head(page + nr_pages - 1))) != folio)
> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 10255 at ./include/linux/rmap.h:427 __folio_rmap_sanity_checks include/linux/rmap.h:427 [inline]
> WARNING: CPU: 1 PID: 10255 at ./include/linux/rmap.h:427 __folio_add_rmap mm/rmap.c:1252 [inline]
> WARNING: CPU: 1 PID: 10255 at ./include/linux/rmap.h:427 __folio_add_file_rmap mm/rmap.c:1620 [inline]
> WARNING: CPU: 1 PID: 10255 at ./include/linux/rmap.h:427 folio_add_file_rmap_ptes+0x890/0xa80 mm/rmap.c:1642
> Modules linked in:
> CPU: 1 UID: 0 PID: 10255 Comm: syz.0.668 Tainted: G        W           6.15.0-rc7-syzkaller-g187899f4124a #0 PREEMPT
> Tainted: [W]=WARN
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
> pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : __folio_rmap_sanity_checks include/linux/rmap.h:427 [inline]
> pc : __folio_add_rmap mm/rmap.c:1252 [inline]
> pc : __folio_add_file_rmap mm/rmap.c:1620 [inline]
> pc : folio_add_file_rmap_ptes+0x890/0xa80 mm/rmap.c:1642
> lr : __folio_rmap_sanity_checks include/linux/rmap.h:427 [inline]
> lr : __folio_add_rmap mm/rmap.c:1252 [inline]
> lr : __folio_add_file_rmap mm/rmap.c:1620 [inline]
> lr : folio_add_file_rmap_ptes+0x890/0xa80 mm/rmap.c:1642
> sp : ffff80009ea777f0
> x29: ffff80009ea77830 x28: ffff0000d89a43c0 x27: 0000000020010000
> x26: 002000013aaf4bc3 x25: 00000000000001f0 x24: fffffdffc3eaba30
> x23: fffffdffc3eabd00 x22: dfff800000000000 x21: fffffdffc3eb3900
> x20: fffffdffc3eb3801 x19: fffffdffc3eaba00 x18: 00000000ffffffff
> x17: 0000000000000000 x16: ffff80008ad27e48 x15: ffff700011e740c0
> x14: 1ffff00011e740c0 x13: 0000000000000004 x12: ffffffffffffffff
> x11: 0000000000080000 x10: 000000000002ce5f x9 : c4bcfe0a46a0cd00
> x8 : c4bcfe0a46a0cd00 x7 : 0000000000000001 x6 : 0000000000000001
> x5 : ffff80009ea76ef8 x4 : ffff80008f415ba0 x3 : ffff800080548ef0
> x2 : 0000000000000000 x1 : 0000000000000001 x0 : 00000000000000e5
> Call trace:
>   __folio_rmap_sanity_checks include/linux/rmap.h:427 [inline] (P)
>   __folio_add_rmap mm/rmap.c:1252 [inline] (P)
>   __folio_add_file_rmap mm/rmap.c:1620 [inline] (P)
>   folio_add_file_rmap_ptes+0x890/0xa80 mm/rmap.c:1642 (P)
>   set_pte_range+0x28c/0x434 mm/memory.c:5256
>   filemap_map_folio_range mm/filemap.c:3631 [inline]
>   filemap_map_pages+0xb50/0x1558 mm/filemap.c:3740
>   do_fault_around mm/memory.c:5476 [inline]
>   do_read_fault mm/memory.c:5509 [inline]
>   do_fault mm/memory.c:5652 [inline]
>   do_pte_missing mm/memory.c:4160 [inline]
>   handle_pte_fault mm/memory.c:5997 [inline]
>   __handle_mm_fault mm/memory.c:6140 [inline]
>   handle_mm_fault+0x2b84/0x4d18 mm/memory.c:6309
>   do_page_fault+0x428/0x1554 arch/arm64/mm/fault.c:647
>   do_translation_fault+0xc4/0x114 arch/arm64/mm/fault.c:783
>   do_mem_abort+0x70/0x194 arch/arm64/mm/fault.c:919
>   el0_da+0x64/0x160 arch/arm64/kernel/entry-common.c:627
>   el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:789
>   el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> irq event stamp: 928
> hardirqs last  enabled at (927): [<ffff80008055041c>] __up_console_sem kernel/printk/printk.c:344 [inline]
> hardirqs last  enabled at (927): [<ffff80008055041c>] __console_unlock+0x70/0xc4 kernel/printk/printk.c:2885
> hardirqs last disabled at (928): [<ffff80008adb9eb8>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:511
> softirqs last  enabled at (830): [<ffff8000803cf71c>] softirq_handle_end kernel/softirq.c:425 [inline]
> softirqs last  enabled at (830): [<ffff8000803cf71c>] handle_softirqs+0xaf8/0xc88 kernel/softirq.c:607
> softirqs last disabled at (727): [<ffff800080020efc>] __do_softirq+0x14/0x20 kernel/softirq.c:613
> ---[ end trace 0000000000000000 ]---
> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 10255 at ./include/linux/rmap.h:214 __folio_large_mapcount_sanity_checks+0x3d4/0x5dc include/linux/rmap.h:214
> Modules linked in:
> CPU: 1 UID: 0 PID: 10255 Comm: syz.0.668 Tainted: G        W           6.15.0-rc7-syzkaller-g187899f4124a #0 PREEMPT
> Tainted: [W]=WARN
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
> pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : __folio_large_mapcount_sanity_checks+0x3d4/0x5dc include/linux/rmap.h:214
> lr : __folio_large_mapcount_sanity_checks+0x3d4/0x5dc include/linux/rmap.h:214
> sp : ffff80009ea77790
> x29: ffff80009ea77790 x28: 0000000080000000 x27: 1fffffbff87d574f
> x26: 1fffffbff87d5740 x25: 1fffffbff87d5741 x24: dfff800000000000
> x23: 00000000000001f0 x22: fffffdffc3eaba78 x21: 0000000000000004
> x20: fffffdffc3eaba08 x19: fffffdffc3eaba00 x18: 00000000ffffffff
> x17: 0000000000000000 x16: ffff80008ad27e48 x15: 0000000000000001
> x14: 1fffffbff87d574d x13: 0000000000000000 x12: 0000000000000000
> x11: 0000000000080000 x10: 0000000000049002 x9 : ffff8000aa342000
> x8 : 0000000000049003 x7 : 0000000000000001 x6 : 0000000000000001
> x5 : ffff80009ea76ef8 x4 : ffff80008f415ba0 x3 : ffff800080b2596c
> x2 : 000000000000003d x1 : 00000000000001f0 x0 : 0000000000000004
> Call trace:
>   __folio_large_mapcount_sanity_checks+0x3d4/0x5dc include/linux/rmap.h:214 (P)
>   folio_add_return_large_mapcount include/linux/rmap.h:250 [inline]
>   __folio_add_rmap mm/rmap.c:1279 [inline]
>   __folio_add_file_rmap mm/rmap.c:1620 [inline]
>   folio_add_file_rmap_ptes+0x47c/0xa80 mm/rmap.c:1642
>   set_pte_range+0x28c/0x434 mm/memory.c:5256
>   filemap_map_folio_range mm/filemap.c:3631 [inline]
>   filemap_map_pages+0xb50/0x1558 mm/filemap.c:3740
>   do_fault_around mm/memory.c:5476 [inline]
>   do_read_fault mm/memory.c:5509 [inline]
>   do_fault mm/memory.c:5652 [inline]
>   do_pte_missing mm/memory.c:4160 [inline]
>   handle_pte_fault mm/memory.c:5997 [inline]
>   __handle_mm_fault mm/memory.c:6140 [inline]
>   handle_mm_fault+0x2b84/0x4d18 mm/memory.c:6309
>   do_page_fault+0x428/0x1554 arch/arm64/mm/fault.c:647
>   do_translation_fault+0xc4/0x114 arch/arm64/mm/fault.c:783
>   do_mem_abort+0x70/0x194 arch/arm64/mm/fault.c:919
>   el0_da+0x64/0x160 arch/arm64/kernel/entry-common.c:627
>   el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:789
>   el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> irq event stamp: 1044
> hardirqs last  enabled at (1043): [<ffff80008adbc380>] __exit_to_kernel_mode arch/arm64/kernel/entry-common.c:85 [inline]
> hardirqs last  enabled at (1043): [<ffff80008adbc380>] exit_to_kernel_mode+0xc0/0xf0 arch/arm64/kernel/entry-common.c:95
> hardirqs last disabled at (1044): [<ffff80008adb9eb8>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:511
> softirqs last  enabled at (1042): [<ffff8000803cf71c>] softirq_handle_end kernel/softirq.c:425 [inline]
> softirqs last  enabled at (1042): [<ffff8000803cf71c>] handle_softirqs+0xaf8/0xc88 kernel/softirq.c:607
> softirqs last disabled at (933): [<ffff800080020efc>] __do_softirq+0x14/0x20 kernel/softirq.c:613
> ---[ end trace 0000000000000000 ]---
> ------------[ cut here ]------------
> kernel BUG at mm/page_table_check.c:120!
> Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
> Modules linked in:
> CPU: 1 UID: 0 PID: 10255 Comm: syz.0.668 Tainted: G        W           6.15.0-rc7-syzkaller-g187899f4124a #0 PREEMPT
> Tainted: [W]=WARN
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
> pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : page_table_check_set+0x56c/0x590 mm/page_table_check.c:120
> lr : page_table_check_set+0x56c/0x590 mm/page_table_check.c:120
> sp : ffff80009ea776a0
> x29: ffff80009ea776b0 x28: ffff80008f63c000 x27: 0000000000000001
> x26: ffff0000c08158c8 x25: 0000000000000006 x24: 0000000000000001
> x23: ffff0000c08158c8 x22: 000000000013ab14 x21: 0000000000000000
> x20: 0000000000000010 x19: 1ffff00012dfca50 x18: 00000000ffffffff
> x17: 0000000000000000 x16: ffff80008051c10c x15: 0000000000000001
> x14: 1fffe00018102b19 x13: 0000000000000000 x12: 0000000000000000
> x11: 0000000000080000 x10: 00000000000632c3 x9 : ffff8000aa342000
> x8 : 00000000000632c4 x7 : ffff800080cd13e4 x6 : 0000000000000000
> x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff800080cd0928
> x2 : 0000000000000000 x1 : 0000000000000001 x0 : 0000000000000000
> Call trace:
>   page_table_check_set+0x56c/0x590 mm/page_table_check.c:120 (P)
>   __page_table_check_ptes_set+0x2a8/0x2e0 mm/page_table_check.c:209
>   page_table_check_ptes_set include/linux/page_table_check.h:76 [inline]
>   __set_ptes_anysz arch/arm64/include/asm/pgtable.h:724 [inline]
>   __set_ptes+0x4a0/0x504 arch/arm64/include/asm/pgtable.h:756
>   contpte_set_ptes+0x120/0x188 arch/arm64/mm/contpte.c:273
>   set_ptes arch/arm64/include/asm/pgtable.h:1807 [inline]
>   set_pte_range+0x39c/0x434 mm/memory.c:5258
>   filemap_map_folio_range mm/filemap.c:3631 [inline]
>   filemap_map_pages+0xb50/0x1558 mm/filemap.c:3740
>   do_fault_around mm/memory.c:5476 [inline]
>   do_read_fault mm/memory.c:5509 [inline]
>   do_fault mm/memory.c:5652 [inline]
>   do_pte_missing mm/memory.c:4160 [inline]
>   handle_pte_fault mm/memory.c:5997 [inline]
>   __handle_mm_fault mm/memory.c:6140 [inline]
>   handle_mm_fault+0x2b84/0x4d18 mm/memory.c:6309
>   do_page_fault+0x428/0x1554 arch/arm64/mm/fault.c:647
>   do_translation_fault+0xc4/0x114 arch/arm64/mm/fault.c:783
>   do_mem_abort+0x70/0x194 arch/arm64/mm/fault.c:919
>   el0_da+0x64/0x160 arch/arm64/kernel/entry-common.c:627
>   el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:789
>   el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> Code: aa1603e0 97fd6781 17fffee6 97e91fd8 (d4210000)
> ---[ end trace 0000000000000000 ]---
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup
> 

I'm afraid this is a duplicate of

https://syzkaller.appspot.com/bug?extid=c0673e1f1f054fac28c2

#syz dup: WARNING in __folio_rmap_sanity_checks (2)

Again, no reproducer :(

-- 
Cheers,

David / dhildenb

