Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9746A2F37
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747749944; cv=none; b=WJckTbUlwWtEL1NepA7xWgMqbQz9ncOOD4t84a2pDSsPLTPB3StKHJEd7ywahFd6RAjvZ2IazWZGpzzJMirLQ8gyRNJSh23efaGHl2Op7O0rdYY8QWkezv/JNVpw7KSCaMCnn/lD3k9JFwGv918HZnsHrVSdI0mHO5WXM05NjXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747749944; c=relaxed/simple;
	bh=bTnEsWoBwHztplynP+BXCF8MC6lP4FzCT6nMeBC/8V0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PBdc0cimLiGlkgd6HvNOuPPHiXTjYHKaEOX3fGZg4FGKpF8OnQ60OGjMoegXHu8VkL1/FOyhO86frPE7s4K7/gZBxa4I7pLFrDm5KIOReA/5nWA7w/Q8RYRKJncOdcOCLEuXZVPtErQqdyqdqFk6zEb94vMbInBrn2LoC9elzNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b1w3vsKZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b1w3vsKZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747749941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IHNiBRd679H/x3XmB+7ZAL7SeLe1xMzwYdEd1OZL9Sk=;
	b=b1w3vsKZXhVnnWcnBPF51+5MG/CtwkukXNf4PKFkVxqpptrj0MlCtnLvcnKbroj1OvcGGn
	Z0HIv8AcQDz6KgQpd0bGGGI2vbxRX+hP50q0fsF+RJP7lMPSnrocmdu+q7esT89QMLedY3
	h5MNp5Ro+liKh+2AD430PrPKZ6fsNW8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-Jy0EcnOrMLKURSfSLYVvmQ-1; Tue, 20 May 2025 10:05:40 -0400
X-MC-Unique: Jy0EcnOrMLKURSfSLYVvmQ-1
X-Mimecast-MFC-AGG-ID: Jy0EcnOrMLKURSfSLYVvmQ_1747749938
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a3683aa00eso1571897f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 07:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747749938; x=1748354738;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHNiBRd679H/x3XmB+7ZAL7SeLe1xMzwYdEd1OZL9Sk=;
        b=F4OPnhy8nHJX1voA8+XolAuXUMLWnRpnZWfvNrFJea00rH66d1kXWD1EGr48SfTq10
         aqCUT7i/qkPtvRViunOBuiwSQNGX1uiW6LKUmoxu7OhSsyI2fuHTs3hCIUbphhTRF71l
         Xcm9S7X5BUEEep+bmzI8Jx33jiHClswSYfowYAsiXfI3JRxVXclUMCsg2a0tvnp0+ZA7
         myekD4V89AvkkJzWFz7ojGOQfGIjSUjD8F7UX2UwgnJTCUeA7TRqZGGCcxelAGnBCunR
         cB+b9vHepD9YBm11ms79ZpXBqI/CZx6Nh86DrNKgtcPUsLFYmLS7UXmZSEHTG93+cEyj
         10jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOYu+C53OGj8aqYtmURw7EO+4hcnd1KXJ4V2Y/Lg628JP1GwvGHHVN3XdQ91K5qGoP4oJmbaadc1k8Qxo=@vger.kernel.org
X-Gm-Message-State: AOJu0YweVEa74/RimaHu5C7CLUftqMkQbv14dsTWB0L0CiKmwLMPAJ/p
	AItwC71k9iozvgb+2RRo1KJlIvNDA09Ti4Kqzmo7pI15rVAJrAdijtBAlAqqsAlvAuPoA8rLAO9
	ZydcZqlP00sf+ZiWdkx3O2hBpEyndL35W2haxTi2+3f0V5poRo9xGs9uspLCPqKir+w==
X-Gm-Gg: ASbGncuVqRLJWkfG3MUlaDHnHl+n+ubEYnWqJVPfvItBkQ21mMZJUeSpgIKBAHUohFr
	bgJVI4d3ikKKziDgqx2knEC+4ihw3GIRqOZyOhFYNkJX19UQFGGwPGsLGh8LssuN4taW4LgDOyI
	oEgMfr+ZRyHMDVNjWKp0T9z9rh5DgBINHIkENhU1a8EdwlCxFzCfxjh/eM4o6wVD93hb+DOSVWQ
	oklxMSbG+obV3o4VGulBwBcIdaA5oADaOEgzdv2Z+2XADQ5/HSZR6lEOuSMLfmBZnBbLLCVNGT9
	t9lTYCvdTAKcBFetk/FGEhAgUYXcqCcBMAFG5fxGx4bhwD7FFvZNX1q5+P5SYa6aPKTWxPXqNRX
	yfD6fbrqnhXH87XGpH2YL+rM5Sg8xiUYbgwMBMNA=
X-Received: by 2002:a05:6000:2406:b0:3a3:6478:e08 with SMTP id ffacd0b85a97d-3a36478120emr12671041f8f.23.1747749938026;
        Tue, 20 May 2025 07:05:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFO5Bn/S+OX7X5O/4mw82lDX/gfZYjinKCFztT1FUvBrme3Rq8kzPFU36M/aF0yIX0PKXc1BA==
X-Received: by 2002:a05:6000:2406:b0:3a3:6478:e08 with SMTP id ffacd0b85a97d-3a36478120emr12670988f8f.23.1747749937597;
        Tue, 20 May 2025 07:05:37 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f28:7c00:a95e:ac49:f2ad:ab84? (p200300d82f287c00a95eac49f2adab84.dip0.t-ipconnect.de. [2003:d8:2f28:7c00:a95e:ac49:f2ad:ab84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a841sm16793693f8f.34.2025.05.20.07.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 07:05:37 -0700 (PDT)
Message-ID: <ffc5505e-9337-4000-979f-8edcefd91215@redhat.com>
Date: Tue, 20 May 2025 16:05:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] WARNING in folio_large_mapcount
To: Shivank Garg <shivankg@amd.com>,
 syzbot <syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com>,
 Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 baolin.wang@linux.alibaba.com, dev.jain@arm.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 syzkaller-bugs@googlegroups.com, ziy@nvidia.com,
 Matthew Wilcox <willy@infradead.org>
References: <6828470d.a70a0220.38f255.000c.GAE@google.com>
 <5cdc53ff-ff48-4deb-9551-92bd47590a53@redhat.com>
 <7d20b14c-5739-4556-9f6e-d19cc7e3ee9b@amd.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <7d20b14c-5739-4556-9f6e-d19cc7e3ee9b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20.05.25 07:45, Shivank Garg wrote:
> On 5/19/2025 6:56 PM, David Hildenbrand wrote:
>> On 17.05.25 10:21, syzbot wrote:
>>> Hello,
>>>
>>> syzbot found the following issue on:
>>>
>>> HEAD commit:    627277ba7c23 Merge tag 'arm64_cbpf_mitigation_2025_05_08' ..
>>> git tree:       upstream
>>> console output: https://syzkaller.appspot.com/x/log.txt?x=1150f670580000
>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=5929ac65be9baf3c
>>> dashboard link: https://syzkaller.appspot.com/bug?extid=2b99589e33edbe9475ca
>>> compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
>>>
>>> Unfortunately, I don't have any reproducer for this issue yet.
>>>
>>> Downloadable assets:
>>> disk image: https://storage.googleapis.com/syzbot-assets/0a42ae72fe0e/disk-627277ba.raw.xz
>>> vmlinux: https://storage.googleapis.com/syzbot-assets/0be88297bb66/vmlinux-627277ba.xz
>>> kernel image: https://storage.googleapis.com/syzbot-assets/31808a4b1210/bzImage-627277ba.xz
>>>
>>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>>> Reported-by: syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
>>>
>>> ------------[ cut here ]------------
>>> WARNING: CPU: 1 PID: 38 at ./include/linux/mm.h:1335 folio_large_mapcount+0xd0/0x110 include/linux/mm.h:1335
>>
>> This should be
>>
>> VM_WARN_ON_FOLIO(!folio_test_large(folio), folio);
>>
>>> Modules linked in:
>>> CPU: 1 UID: 0 PID: 38 Comm: khugepaged Not tainted 6.15.0-rc6-syzkaller-00025-g627277ba7c23 #0 PREEMPT(full)
>>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
>>> RIP: 0010:folio_large_mapcount+0xd0/0x110 include/linux/mm.h:1335
>>> Code: 04 38 84 c0 75 29 8b 03 ff c0 5b 41 5e 41 5f e9 96 d2 2b 09 cc e8 d0 cb 99 ff 48 89 df 48 c7 c6 20 de 77 8b e8 a1 dc de ff 90 <0f> 0b 90 eb b6 89 d9 80 e1 07 80 c1 03 38 c1 7c cb 48 89 df e8 87
>>> RSP: 0018:ffffc90000af77e0 EFLAGS: 00010246
>>> RAX: e1fcb38c0ff8ce00 RBX: ffffea00014c8000 RCX: e1fcb38c0ff8ce00
>>> RDX: 0000000000000001 RSI: ffffffff8d9226df RDI: ffff88801e2fbc00
>>> RBP: ffffc90000af7b50 R08: ffff8880b8923e93 R09: 1ffff110171247d2
>>> R10: dffffc0000000000 R11: ffffed10171247d3 R12: 1ffffd4000299000
>>> R13: dffffc0000000000 R14: 0000000000000000 R15: dffffc0000000000
>>> FS:  0000000000000000(0000) GS:ffff8881261fb000(0000) knlGS:0000000000000000
>>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> CR2: 00007ffe58f12dc0 CR3: 0000000030e04000 CR4: 00000000003526f0
>>> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>>> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>>> Call Trace:
>>>    <TASK>
>>>    folio_mapcount include/linux/mm.h:1369 [inline]
>>
>> And here we come through
>>
>> if (likely(!folio_test_large(folio))) {
>>      ...
>> }
>> return folio_large_mapcount(folio);
>>
>>
>> So the folio is split concurrently. And I think there is nothing stopping it from getting freed.
>>
>> We do a xas_for_each() under RCU. So yes, this is racy.
>>
>> In  collapse_file(), we re-validate everything.
>>
>> We could
>>
>> (A) Take proper pagecache locks
>>
>> (B) Try grabbing a temporary folio reference
>>
>> (C) Try snapshotting the folio
>>
>> Probably, in this code, (B) might be cleanest for now? Handling it just like other code in mm/filemap.c.
>>
> 
> Hi,

Hi,

> 
> I've implemented your suggestion (B) using folio_try_get().
> Could you please review if my patch looks correct?

You should probably drop both comments, the code merely mimics what 
filemap.c does.

Apart from that, nothing jumped at me.

-- 
Cheers,

David / dhildenb

