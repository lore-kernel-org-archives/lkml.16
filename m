Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AB317A31F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 20:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744577117; cv=none; b=Ay19edX/FdZKmSq9PwC9lgpZNGEoIAQxzc+Cd/UIMkls7S4QxWWcw4q4CjCepT3t7i2sb6dWy5rQi6TYxEL2nBq62ODl7GHfSOSGsjmI3gxWvbIPBAPOBX11Xnw625SGhHYEt0rONsdfIVJal+PMjQsHVS8DpFBy3kwTuAE8MLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744577117; c=relaxed/simple;
	bh=MbRVMly7VZroUGLq80A7GAV+iUnHGZ07wC/r5o0jyZc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=qfRDf30SlqJ0HnZUslioll11ydF9A8x7Z4gnDl3SYsod3dFRCsn/kWPQmUXKuKGVGZC/yEZAC+wjUXBFYJaEETvvqGrlr/JIUQ5TCiuGhAGQL+iAdbK0dbJIli7RQjJ1a4SbIy4WAwgfTyGHl+vokQ8T/UDX0tE07Y4mCC+/zDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Do5j1I6E; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Do5j1I6E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744577113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nQw8tmrkvQV+tRrqZxDwr12UYoDpHlF6zPIcm6MU1ws=;
	b=Do5j1I6EIIwad3GyF5ij0E5rAyyPFfBrqyItpJUYuIaodCmPPi4bho+3zrd6HPUROxTzwr
	ngzpRlrkGwesIvk8gPlAajKXDQtmMU/AegeXF9uG5O8CJU37VxdIvWQnIfokrsHrWUbw81
	/VL1TUwHn2/qTDnHdihMXANMerFBGMg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-DRv4tgdeNlG7nP7BSy2uKg-1; Sun, 13 Apr 2025 16:45:12 -0400
X-MC-Unique: DRv4tgdeNlG7nP7BSy2uKg-1
X-Mimecast-MFC-AGG-ID: DRv4tgdeNlG7nP7BSy2uKg_1744577111
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d734da1a3so18400825e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 13:45:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744577111; x=1745181911;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQw8tmrkvQV+tRrqZxDwr12UYoDpHlF6zPIcm6MU1ws=;
        b=oDnDTPA4xeeUQ+y31517H+j32sx2h3cAy4jURmhI4CgfD7/bp8nAV7GE+RmgfeCoa3
         U8FmejtVL8dvn+CcuH7I27X8lNp9aSYuYTyuhD5zlzQwQEYT6GGipStpJ9woQYNBzWN4
         PxPIt1rKlOG36peyZOJcTYTCsjPyitjaUUFaEX8mTYUs2I/72RTSfiV7eHDzLOTkjQFn
         bYBrAOnuiVEfTEKwOx4FXIblotLwfh06gpheqgTzt+584RUg6R+8BqUBcbz+4By5f1D3
         PsvD6223S1JCUyiUEONlA9DjRJb5nb5/TXRhD6QM7rPUXDvSsnIri/jvpDQdV4PwZOjh
         MJzg==
X-Forwarded-Encrypted: i=1; AJvYcCW/pG9dDvHn7+u+Kyob8q4dzC9ygx0llbwz8PVgP0RfAZhs+0axkYqV5iNcdn/7scYoLequyVaTrvHdkGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjPTJee6tXAZHihMnyJrigpKs/CIHJZNmnUJO0UTE0ItARJQVr
	8aKkLIlzy6awRNCaiPHpErrohUFAV/USGpJ3Xo1INyniuZibcvskbcphM0gbRY2BpsRcTU2DcOi
	v3w3doyABT0XO4gifcB86Ac1rLHrnESLdYhzNHtkmR/KwrKZY6wYIsDnB1TwbqQ==
X-Gm-Gg: ASbGncsVbRDbecwswYKqE/PQ5otxLHzzPPhHC/tBgFj+CFHYi62k3EXeCM9ei2xbje6
	9tn1/YT5VqIXBbkLCc5SiU6M8qh0droFdzQKrdJq7d5YfrdKXqRJj3450Q/Jer/njUI3hdmErgT
	CjeeRdsGAahy135SwNs22lpIABR/EF9PRpPKTO9lQI3WPbi6dA8PGWulXODDGnK3kU5tKUVyxFE
	RWeXWc3v2X5YXidU15jeiKlmrvKyyVLnHq9s68H7pazaCQ9YRZYXFeiVJLJG03mTaf/fKkpMUIe
	JH2HyOkaiBrFrCRKa3H2wsUYZ0Gww74+EMFLmRQIpYIVvo0QHpe146nCrUnc5BTbIV4Pq8kED2G
	2Vr4eTWLlZZLBTMLDYQabV/u2RMWb1F6d7rS2/uY=
X-Received: by 2002:a05:6000:178e:b0:39a:d336:16 with SMTP id ffacd0b85a97d-39ea5215dc6mr8086418f8f.34.1744577111254;
        Sun, 13 Apr 2025 13:45:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkWUh4pH6gB8nlCnwzlv7RNl231YcGSQR+UEIH7NnX5G3uYWa0SGRz/5+xRmf3fGLTp4uTUA==
X-Received: by 2002:a05:6000:178e:b0:39a:d336:16 with SMTP id ffacd0b85a97d-39ea5215dc6mr8086409f8f.34.1744577110748;
        Sun, 13 Apr 2025 13:45:10 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445454sm8823782f8f.83.2025.04.13.13.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 13:45:10 -0700 (PDT)
Message-ID: <c283ef8d-0816-4e49-849c-296bc32195cf@redhat.com>
Date: Sun, 13 Apr 2025 22:45:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] WARNING in do_wp_page
From: David Hildenbrand <david@redhat.com>
To: syzbot <syzbot+5e8feb543ca8e12e0ede@syzkaller.appspotmail.com>,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 syzkaller-bugs@googlegroups.com
References: <67fab4fe.050a0220.2c5fcf.0011.GAE@google.com>
 <ec2c31e4-f7f2-4ec0-bbfe-e6d6e080429f@redhat.com>
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
In-Reply-To: <ec2c31e4-f7f2-4ec0-bbfe-e6d6e080429f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.04.25 22:20, David Hildenbrand wrote:
> On 12.04.25 20:46, syzbot wrote:
>> Hello,
>>
>> syzbot found the following issue on:
> 
> Related to my recent changes
> 
>>
>> HEAD commit:    0af2f6be1b42 Linux 6.15-rc1
>> git tree:       upstream
>> console output: https://syzkaller.appspot.com/x/log.txt?x=1766323f980000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=f175b153b655dbb3
> 
> CONFIG_ARCH_WANTS_THP_SWAP=y
> CONFIG_MM_ID=y
> CONFIG_TRANSPARENT_HUGEPAGE=y
> # CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
> CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
> # CONFIG_TRANSPARENT_HUGEPAGE_NEVER is not set
> CONFIG_THP_SWAP=y
> CONFIG_READ_ONLY_THP_FOR_FS=y
> # CONFIG_NO_PAGE_MAPCOUNT is not set
> CONFIG_PAGE_MAPCOUNT=y
> 
>> dashboard link: https://syzkaller.appspot.com/bug?extid=5e8feb543ca8e12e0ede
>> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
>>
>> Unfortunately, I don't have any reproducer for this issue yet.
>>
>> Downloadable assets:
>> disk image: https://storage.googleapis.com/syzbot-assets/f1d71d1bf77d/disk-0af2f6be.raw.xz
>> vmlinux: https://storage.googleapis.com/syzbot-assets/7f1638f065da/vmlinux-0af2f6be.xz
>> kernel image: https://storage.googleapis.com/syzbot-assets/9b3e49834705/bzImage-0af2f6be.xz
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+5e8feb543ca8e12e0ede@syzkaller.appspotmail.com
>>
>> ------------[ cut here ]------------
>> WARNING: CPU: 0 PID: 7165 at mm/memory.c:3738 __wp_can_reuse_large_anon_folio mm/memory.c:3738 [inline]
> 
> VM_WARN_ON_ONCE(folio_entire_mapcount(folio));
> 
> Which is rather unexpected. I know we had a scenario (remapping a THP?)
> where we would have a PMD mapping and a PTE mapping of an exclusive anon
> folio for a very short time. But, IIRC locking should make sure that
> that cannot be observed by some other page table walker.
> 

Ah, it likely is a (harless) race, when process A and process B 
cow-share a PMD THP, and process A write-faults on a PTE mapping of the 
THP while process B concurrently unmaps the PMD mapping of the THP.

In __folio_remove_rmap(), for RMAP_LEVEL_PMD in case of 
CONFIG_PAGE_MAPCOUNT=y, we'll do

	folio_dec_large_mapcount(folio, vma);
	last = atomic_add_negative(-1, &folio->_entire_mapcount);

So after decrementing the large mapcount, the folio will be indicated as 
"exclusive" to process A.

Process B, still has to decrement the entire mapcount, but process A 
might already run into the entire_mapcount sanity check.


In do_wp_page(), we'd later fail the "folio_large_mapcount(folio) != 
folio_ref_count(folio)" test until process B is completely done with 
unmapping the folio.

Maybe we should just move these sanity checks after the refcount check, 
or reverse the mapcount decrement order. I'll think about that.

-- 
Cheers,

David / dhildenb

