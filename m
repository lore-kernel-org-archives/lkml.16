Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C402017B425
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 20:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744575624; cv=none; b=BI3MLNlFinHRZi2YZzl1xExulD6g6PTG8PeoVlG1Wpf5x9HRLjfBFUQpCnn3Lj0ZBz+c+CTcYiDnTY0Cy2+XtE5P/d6vyihO067v0UXCE34+bPogvExm+gwj3v/WrqJ4cVFFRromwIpC+tsGI2pzvb2Ndx+qaO8rKmktvrzSdlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744575624; c=relaxed/simple;
	bh=k6mT6cN+XIAjCLdm5SrGHRzq4mRU5aV0D8co4vOt5P0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BdWqisVU8KJe33TZLlpKa0gjQRGHWtNTE07sO/AAfAG4YES0Fc8jfw19eTg57GS96a73ev3wDV0ZNBqftcGmUOG3JkfSCMtM9sHVxGM35uu1EERGhm6KSWRLUX9DIMNcZARlhkyYHgiUC/q8R5t4N+tWqYkJLx25gwVPNF8kTT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T7xcqW0i; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T7xcqW0i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744575621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0co4iS1FTstjHk6lJy6IDvVtmBh/1r3x+AlyXOIUSGY=;
	b=T7xcqW0ix9M13Bf5VgsoRTAAGNYMGqA/+Q5GZOOIDJLykObYXK0J3nOvIKFp6RqBI5BR1M
	BH1NiJ+nX/AiQWg6LMQHAW0aO/+YgKSJLdXAjRcfCEjfp0kkSgegRk9oj+64XOPngE7qDp
	I5gSuPiZGEYenfLi5o/gda4QVkzg6dE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-hCLNN1UZP5OnPNrbT3kb7w-1; Sun, 13 Apr 2025 16:20:20 -0400
X-MC-Unique: hCLNN1UZP5OnPNrbT3kb7w-1
X-Mimecast-MFC-AGG-ID: hCLNN1UZP5OnPNrbT3kb7w_1744575619
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d733063cdso30121075e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 13:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744575619; x=1745180419;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0co4iS1FTstjHk6lJy6IDvVtmBh/1r3x+AlyXOIUSGY=;
        b=vpkNQqY0UxM2c0MN5P+9rtZAV4y20TVhnjRddgzOckw1jlME8bPO41Vmn8uopnUiXp
         eYdoL3w6px3Hs+2OIqXsG8ImWiOSCgmNqA6Axc8c1JCED4pGLV1BVjE3umQWMC73eLe0
         EHchoxIhdTWdRAqhbqNKsGpsfyfwZzOGCLlj4+nJtPgM7cYQIaXUSuiq5+E4C2q3ouAF
         2gfFRjrJaU3ORjIcAVBWFX2g5jpKKYu1oyjWM5+EH3EMrkxK6rluRffc22fly5g/pW6X
         D/wtYv8QlaDejV/Z0UbamOFZtY0jTX5573GpzrAMFqgSiD22Vs+GOGgzX6WKHcguWJnf
         g/dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRbL1TZrmD3pXqXAO5LTE2iFBIEQf/ui4dRhHTkc82glLexdU2ATiTsEFjWh775L3fQheAWplTMR4trdU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh/SF07pIYHJCGvDZlHBhTtPnKz1uKvrk66p7tixQxVbApe3bH
	9kscW7vcp29rwIpYfjHNkVbVyk98P3bq/Po6suZGwofwC/A+fPhu8QVaotcoD4gvoCzLZuMKnPF
	PSJff76xaprvAUWf882s3sZE0TFDY7Igz7vSl7vrBdu54vvcTAhfniAtWXIbcVE55nLTBtJVKcO
	M=
X-Gm-Gg: ASbGncsyDRqHjXnDBryBc+4W6CwB7MQxLAtuyZY88ny6FPCDZwK/to3Hcpg2V/qN62S
	q0pl0CSaQt9ZRCk/jtdfbVx1wNFmIwByOKYV9vbQfTUArha4TpD1ag4DYfuOThaE9cuLTsXHb3M
	wY8VsPsrfD5NGbZsHBGEAFwqetK8Cnt31Dx+uawWbORVcdSxuaPVHZKzHuyBLDMZRq0NDQYiYkf
	MRPEAKZCW2zcfAYbVDu963zZAzyeEA3oVpmkTcR1ibb9vezc4K4p9+SddVM4ab42JTWcFIJtYam
	Y2+t0GakLj6WIUa9IfxN/WIxPDgtasGQBGVGQMW0pl7/LBVMB5ZfvRP9ZymzilmB5TIZl/p5uAo
	JMJn4WyWcJLIv1wWZYURZ/PF0YncOM0sZo/2WN/A=
X-Received: by 2002:a05:600c:1d83:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-43f3a9aed73mr103726355e9.31.1744575618879;
        Sun, 13 Apr 2025 13:20:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY5sCopFzMEfPoLnFxTMfbFhDn7XBbd5nfLeA4Joa5cRUrvz8UvQ9hZT7epeQAQaGESU5MAg==
X-Received: by 2002:a05:600c:1d83:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-43f3a9aed73mr103726265e9.31.1744575618457;
        Sun, 13 Apr 2025 13:20:18 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572c4esm156784745e9.26.2025.04.13.13.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 13:20:18 -0700 (PDT)
Message-ID: <ec2c31e4-f7f2-4ec0-bbfe-e6d6e080429f@redhat.com>
Date: Sun, 13 Apr 2025 22:20:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] WARNING in do_wp_page
To: syzbot <syzbot+5e8feb543ca8e12e0ede@syzkaller.appspotmail.com>,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 syzkaller-bugs@googlegroups.com
References: <67fab4fe.050a0220.2c5fcf.0011.GAE@google.com>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <67fab4fe.050a0220.2c5fcf.0011.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.04.25 20:46, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:

Related to my recent changes

> 
> HEAD commit:    0af2f6be1b42 Linux 6.15-rc1
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1766323f980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=f175b153b655dbb3

CONFIG_ARCH_WANTS_THP_SWAP=y
CONFIG_MM_ID=y
CONFIG_TRANSPARENT_HUGEPAGE=y
# CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
# CONFIG_TRANSPARENT_HUGEPAGE_NEVER is not set
CONFIG_THP_SWAP=y
CONFIG_READ_ONLY_THP_FOR_FS=y
# CONFIG_NO_PAGE_MAPCOUNT is not set
CONFIG_PAGE_MAPCOUNT=y

> dashboard link: https://syzkaller.appspot.com/bug?extid=5e8feb543ca8e12e0ede
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/f1d71d1bf77d/disk-0af2f6be.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/7f1638f065da/vmlinux-0af2f6be.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/9b3e49834705/bzImage-0af2f6be.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+5e8feb543ca8e12e0ede@syzkaller.appspotmail.com
> 
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 7165 at mm/memory.c:3738 __wp_can_reuse_large_anon_folio mm/memory.c:3738 [inline]

VM_WARN_ON_ONCE(folio_entire_mapcount(folio));

Which is rather unexpected. I know we had a scenario (remapping a THP?) 
where we would have a PMD mapping and a PTE mapping of an exclusive anon 
folio for a very short time. But, IIRC locking should make sure that 
that cannot be observed by some other page table walker.

Unfortunately o reproducer. I'll do some digging ...


> WARNING: CPU: 0 PID: 7165 at mm/memory.c:3738 wp_can_reuse_anon_folio mm/memory.c:3788 [inline]
> WARNING: CPU: 0 PID: 7165 at mm/memory.c:3738 do_wp_page+0x4c62/0x59f0 mm/memory.c:3918
> Modules linked in:
> CPU: 0 UID: 0 PID: 7165 Comm: syz.3.280 Not tainted 6.15.0-rc1-syzkaller #0 PREEMPT(full)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
> RIP: 0010:__wp_can_reuse_large_anon_folio mm/memory.c:3738 [inline]
> RIP: 0010:wp_can_reuse_anon_folio mm/memory.c:3788 [inline]
> RIP: 0010:do_wp_page+0x4c62/0x59f0 mm/memory.c:3918
> Code: 48 89 ef e8 50 c3 ea ff e9 62 b8 ff ff e8 c6 e0 b4 ff 48 c7 c6 20 43 9b 8b 4c 89 e7 e8 f7 a0 fc ff 90 0f 0b e8 af e0 b4 ff 90 <0f> 0b 90 e9 df ed ff ff e8 a1 e0 b4 ff 48 c7 c6 60 46 9b 8b 48 89
> RSP: 0018:ffffc900039f77e0 EFLAGS: 00010287
> RAX: 0000000000041ec0 RBX: ffffc900039f7a00 RCX: ffffc9000d0c6000
> RDX: 0000000000080000 RSI: ffffffff82065c61 RDI: 0000000000000005
> RBP: ffffea0001320000 R08: 0000000000000005 R09: 00000000ffffffff
> R10: 0000000000000000 R11: 0000000000000000 R12: ffff888012935dc0
> R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000001
> FS:  00007f57215806c0(0000) GS:ffff8881249b9000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000020000001e000 CR3: 000000006cd88000 CR4: 0000000000350ef0
> Call Trace:
>   <TASK>
>   handle_pte_fault mm/memory.c:6013 [inline]
>   __handle_mm_fault+0x1ada/0x2a40 mm/memory.c:6140
>   handle_mm_fault+0x3fe/0xad0 mm/memory.c:6309
>   faultin_page mm/gup.c:1193 [inline]
>   __get_user_pages+0x771/0x36f0 mm/gup.c:1491
>   populate_vma_page_range+0x278/0x3a0 mm/gup.c:1929
>   __mm_populate+0x1d8/0x380 mm/gup.c:2032
>   do_mlock+0x448/0x810 mm/mlock.c:655

During do_mlock() we should be holding the mmap lock in write mode I 
assume once we reach do_wp_page.

-- 
Cheers,

David / dhildenb

