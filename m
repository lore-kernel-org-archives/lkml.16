Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0031A83E5
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747661197; cv=none; b=ryope/Y1pugf9AIits+hidqE/38OtZza0c+BUNWWJXQLLEDXzGDJGPxisso0Eg1UNxL993fuZiddVMxokVTE62cCJ1By47ZsnAF2Q5N8MYye/8ZyavJBtnDQ8QrO7ckSlgNPnzfBhCZdcgqyIINDf2KA5sl7pWb5EPzdWBSHqd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747661197; c=relaxed/simple;
	bh=ZgCRMiIgda3NAXNO44IulEx1bSFEdUBJL9MpccDv6qI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aECASAOhrexgFuxJ1ZImJbtxxAg8P9f/BexZiqIrh2IKj6xQ8iTl8tpH81PFA31RMBovSbWs8HKChL/Env1mqD6SrIQ7dmO17G8obDebr0OfGo1BRUJfx80Miif3dmZY7E/umfHydFKcor+4W86joai7cgnWC4KnqovKqXnSF94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SutSFnFw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SutSFnFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747661193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Xtm5wNwtr6k46joGRaOhiivErRLu6YPqbSK9cl5+cds=;
	b=SutSFnFwPCOWVl8MCz9Hi+TQldfT4gN1DkuQ+k8Cf63bp3OcTQx6O5Mw6oEoFTekx781/s
	Bt4XOka+cpi9Y90SMCWG9xd4nodMJ/B7FqfNk6WR5BbMakL3GnOkgXNza+MXffyrtUXPSg
	HRKDs/WJcCMKOGocIdXpDFXbtmtHUh8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-yl79DCN2MNahIcb5mjU0Og-1; Mon, 19 May 2025 09:26:32 -0400
X-MC-Unique: yl79DCN2MNahIcb5mjU0Og-1
X-Mimecast-MFC-AGG-ID: yl79DCN2MNahIcb5mjU0Og_1747661191
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43ea256f039so35656805e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 06:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747661191; x=1748265991;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xtm5wNwtr6k46joGRaOhiivErRLu6YPqbSK9cl5+cds=;
        b=wI92e/zPKV8HFQ4oMKHdd1A6x76cdttOKHcTC72g9xgvbr7cOO3JgXujuWEMeAl3Ma
         KUIREHBMTeNLHYiTXXMVjpSnbPH4BSvLEUfTQGVaPSkVkrUlrvHB2C68loMGcQm30QKQ
         /oxyVe1hV2J8o/JpvvN8prPP/cmD0Ni0vzatYNgsTxG9xseAcrNDcGUZCIkIzhscg48/
         MMrGIXaDB2DKwnBU7NHFZkLQBE72vZPSQTorfRE+XCpZHBIyDrDYleUx/5Sr0GKnGJYx
         63GnyA68rQP+9KwOFJHITILEQUn/TAiV6jo4ulr2j4DQc8o1TB+60z4Sq3XJwCr4XL9v
         3GhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+HrqNQy7veTXv3qMaOa9V0Z2WPFj2RO6Z9BzlL68SvPEFySKIjA8jaPqhE+ARFR40bzRRcTLqjYiQBSM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6iYoRWnHLAgftUKu2eXiViUxfeFhYZhZwXOuVnc2l8Vk8eslX
	C9/pty6/EkXSDUFFoIjRfWazn69/8Zzrf5GDS03SNdGcLhGebQQWYFQdhPLyfRxXWjZZrhOU+49
	NSJyGD9TtFFUpmSiGF0WtvbjQ/79wOxu4odm0W6rUHrse06cIDqwk2OeBU3hpgsjdZw==
X-Gm-Gg: ASbGncuYOyiSVkIx8GaiRL8XiedeN/PFDodnqz4gUCbfqTCvQTO8lger01/DD0DIljW
	iI+RrDoaGbTy8dOksVmOJC60o+fF4ccZrk97gWd/Gv5cb9rpqC9GKYw5BptxlvEyyzCII3WpRpC
	X6x7A5nrs8QzSe0oHi8Rzqqltk2Z2R1GOoLed5oucMyApYGigduZ1LS3ys7FR4EtxjNnwxjQY2K
	z0vqExJSpVDVtdFwe09LPkw8eswfmzELO6QisdlGW0IifmEahmR41us0DUBZS5IdT7m8jRCvmMV
	YPjtevsY3JL8EZ4pHOX/nsWoq4TXjVPcZYFJ1SgUGmhLfAcDv790VuE9eeOFT7DzaVDATKcCSoY
	hNYgY1Ij5VEct/wQRIn+LOOWG/RlDwtERPZqjLOc=
X-Received: by 2002:a05:600c:348f:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-442fd672537mr123058935e9.30.1747661190896;
        Mon, 19 May 2025 06:26:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7S8REGUdkh/TZPBU45s15G0C6TT7r43TbYW13Y4SP8eofu1ICkOLlwWWxFH470se4TrBwSQ==
X-Received: by 2002:a05:600c:348f:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-442fd672537mr123058665e9.30.1747661190477;
        Mon, 19 May 2025 06:26:30 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3c:3a00:5662:26b3:3e5d:438e? (p200300d82f3c3a00566226b33e5d438e.dip0.t-ipconnect.de. [2003:d8:2f3c:3a00:5662:26b3:3e5d:438e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca62910sm13127002f8f.50.2025.05.19.06.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 06:26:30 -0700 (PDT)
Message-ID: <5cdc53ff-ff48-4deb-9551-92bd47590a53@redhat.com>
Date: Mon, 19 May 2025 15:26:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] WARNING in folio_large_mapcount
To: syzbot <syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com>,
 Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 baolin.wang@linux.alibaba.com, dev.jain@arm.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 syzkaller-bugs@googlegroups.com, ziy@nvidia.com,
 Matthew Wilcox <willy@infradead.org>
References: <6828470d.a70a0220.38f255.000c.GAE@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <6828470d.a70a0220.38f255.000c.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.05.25 10:21, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    627277ba7c23 Merge tag 'arm64_cbpf_mitigation_2025_05_08' ..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1150f670580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=5929ac65be9baf3c
> dashboard link: https://syzkaller.appspot.com/bug?extid=2b99589e33edbe9475ca
> compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/0a42ae72fe0e/disk-627277ba.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/0be88297bb66/vmlinux-627277ba.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/31808a4b1210/bzImage-627277ba.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
> 
> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 38 at ./include/linux/mm.h:1335 folio_large_mapcount+0xd0/0x110 include/linux/mm.h:1335

This should be

VM_WARN_ON_FOLIO(!folio_test_large(folio), folio);

> Modules linked in:
> CPU: 1 UID: 0 PID: 38 Comm: khugepaged Not tainted 6.15.0-rc6-syzkaller-00025-g627277ba7c23 #0 PREEMPT(full)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
> RIP: 0010:folio_large_mapcount+0xd0/0x110 include/linux/mm.h:1335
> Code: 04 38 84 c0 75 29 8b 03 ff c0 5b 41 5e 41 5f e9 96 d2 2b 09 cc e8 d0 cb 99 ff 48 89 df 48 c7 c6 20 de 77 8b e8 a1 dc de ff 90 <0f> 0b 90 eb b6 89 d9 80 e1 07 80 c1 03 38 c1 7c cb 48 89 df e8 87
> RSP: 0018:ffffc90000af77e0 EFLAGS: 00010246
> RAX: e1fcb38c0ff8ce00 RBX: ffffea00014c8000 RCX: e1fcb38c0ff8ce00
> RDX: 0000000000000001 RSI: ffffffff8d9226df RDI: ffff88801e2fbc00
> RBP: ffffc90000af7b50 R08: ffff8880b8923e93 R09: 1ffff110171247d2
> R10: dffffc0000000000 R11: ffffed10171247d3 R12: 1ffffd4000299000
> R13: dffffc0000000000 R14: 0000000000000000 R15: dffffc0000000000
> FS:  0000000000000000(0000) GS:ffff8881261fb000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007ffe58f12dc0 CR3: 0000000030e04000 CR4: 00000000003526f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>   <TASK>
>   folio_mapcount include/linux/mm.h:1369 [inline]

And here we come through

if (likely(!folio_test_large(folio))) {
	...
}
return folio_large_mapcount(folio);


So the folio is split concurrently. And I think there is nothing 
stopping it from getting freed.

We do a xas_for_each() under RCU. So yes, this is racy.

In  collapse_file(), we re-validate everything.

We could

(A) Take proper pagecache locks

(B) Try grabbing a temporary folio reference

(C) Try snapshotting the folio

Probably, in this code, (B) might be cleanest for now? Handling it just 
like other code in mm/filemap.c.

>   is_refcount_suitable+0x350/0x430 mm/khugepaged.c:553
>   hpage_collapse_scan_file+0x6d4/0x4200 mm/khugepaged.c:2323
>   khugepaged_scan_mm_slot mm/khugepaged.c:2447 [inline]
>   khugepaged_do_scan mm/khugepaged.c:2548 [inline]
>   khugepaged+0xa2a/0x1690 mm/khugepaged.c:2604
>   kthread+0x70e/0x8a0 kernel/kthread.c:464
>   ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>   </TASK>
-- 
Cheers,

David / dhildenb

