Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A451D26771F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 11:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745840373; cv=none; b=h6LIFXhmLmPY0EGHJt5IuAXlJh2ijCXcNCRzlVoTFzpZvFqb6VLTgMbyPsAR3FCEzr6LqtAIJaXpLm2LWRYgotF9Eu/Sixx9i9J4crX+Mm7mXjt6i9HQiBBsrDNPr21cv/yTbfMeWSiMEtxPTFvqGaymnPywtgb0SctaNVuQAcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745840373; c=relaxed/simple;
	bh=ENEKgl+JgiGAbDXe+7bdxOTLgmzldsIZNqPFsPpBShs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=otudCNMCXQ9sD0zxquYflVmXjGaDQOtWvVxM+hcDUmk/ahuESJPtP8ohZWwC236RJj9FiXkFsnqY8gBH9yjSySdLhwZrblMFNQ6goT1kpTojdUCANBt2Mmro+SHzNjXKne3+4fhitWtGeYMiIwTGpIUNHKcwK5Wg5huP6GsvS7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 760141516;
	Mon, 28 Apr 2025 04:39:23 -0700 (PDT)
Received: from [10.163.50.165] (unknown [10.163.50.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9AA83F673;
	Mon, 28 Apr 2025 04:39:27 -0700 (PDT)
Message-ID: <4c49a45c-d904-4fd5-8af7-cf9051665ac3@arm.com>
Date: Mon, 28 Apr 2025 17:09:23 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/memory: fix mapcount / refcount sanity check for mTHP
 reuse
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20250425074325.61833-1-ryncsn@gmail.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250425074325.61833-1-ryncsn@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/25/25 13:13, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> The following WARNING was triggered during swap stress test with
> mTHP enabled:
> 
> [ 6609.335758] ------------[ cut here ]------------
> [ 6609.337758] WARNING: CPU: 82 PID: 755116 at mm/memory.c:3794 do_wp_page+0x1084/0x10e0
> [ 6609.340922] Modules linked in: zram virtiofs
> [ 6609.342699] CPU: 82 UID: 0 PID: 755116 Comm: sh Kdump: loaded Not tainted 6.15.0-rc1+ #1429 PREEMPT(voluntary)
> [ 6609.347620] Hardware name: Red Hat KVM/RHEL-AV, BIOS 0.0.0 02/06/2015
> [ 6609.349909] RIP: 0010:do_wp_page+0x1084/0x10e0
> [ 6609.351532] Code: ff ff 48 c7 c6 80 ba 49 82 4c 89 ef e8 95 fd fe ff 0f 0b bd f5 ff ff ff e9 43 fb ff ff 41 83 a9 bc 12 00 00 01 e9 5c fb ff ff <0f> 0b e9 a6 fc ff ff 65 ff 00 f0 48 0f b
> a 6d 00 1f 0f 83 82 fc ff
> [ 6609.357959] RSP: 0000:ffffc90002273d40 EFLAGS: 00010287
> [ 6609.359915] RAX: 000000000000000f RBX: 0000000000000000 RCX: 000fffffffe00000
> [ 6609.362606] RDX: 0000000000000010 RSI: 000055a119ac1000 RDI: ffffea000ae6ec00
> [ 6609.365143] RBP: ffffea000ae6ec68 R08: 84000002b9bb1025 R09: 000055a119ab6000
> [ 6609.367569] R10: ffff8881caa2ad80 R11: 0000000000000000 R12: ffff8881caa2ad80
> [ 6609.370255] R13: ffffea000ae6ec00 R14: 000055a119ac1c9c R15: ffffc90002273dd8
> [ 6609.373007] FS:  00007f08e467f740(0000) GS:ffff88a07c214000(0000) knlGS:0000000000000000
> [ 6609.375999] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 6609.377946] CR2: 000055a119ac1c9c CR3: 00000001adfd6005 CR4: 0000000000770eb0
> [ 6609.380376] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [ 6609.382853] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [ 6609.385216] PKRU: 55555554
> [ 6609.386141] Call Trace:
> [ 6609.387017]  <TASK>
> [ 6609.387718]  ? ___pte_offset_map+0x1b/0x110
> [ 6609.389056]  __handle_mm_fault+0xa51/0xf00
> [ 6609.390363]  ? exc_page_fault+0x6a/0x140
> [ 6609.391629]  handle_mm_fault+0x13d/0x360
> [ 6609.392856]  do_user_addr_fault+0x2f2/0x7f0
> [ 6609.394160]  ? sigprocmask+0x77/0xa0
> [ 6609.395375]  exc_page_fault+0x6a/0x140
> [ 6609.396735]  asm_exc_page_fault+0x26/0x30
> [ 6609.398224] RIP: 0033:0x55a1050bc18b
> [ 6609.399567] Code: 8b 3f 4d 85 ff 74 40 41 39 5f 18 75 f2 49 8b 7f 08 44 38 27 75 e9 4c 89 c6 4c 89 45 c8 e8 bd 83 fa ff 4c 8b 45 c8 85 c0 75 d5 <41> 83 47 1c 01 48 83 c4 28 4c 89 f8 5b 4
> 1 5c 41 5d 41 5e 41 5f 5d
> [ 6609.405971] RSP: 002b:00007ffcf5f37d90 EFLAGS: 00010246
> [ 6609.407737] RAX: 0000000000000000 RBX: 00000000182768fa RCX: 0000000000000000
> [ 6609.410151] RDX: 00000000000000fa RSI: 000055a105175c7b RDI: 000055a119ac1c60
> [ 6609.412606] RBP: 00007ffcf5f37de0 R08: 000055a105175c7b R09: 0000000000000000
> [ 6609.414998] R10: 000000004d2dfb5a R11: 0000000000000246 R12: 0000000000000050
> [ 6609.417193] R13: 00000000000000fa R14: 000055a119abaf60 R15: 000055a119ac1c80
> [ 6609.419268]  </TASK>
> [ 6609.419928] ---[ end trace 0000000000000000 ]---
> 
> The WARN_ON here is simply incorrect. The refcount here must be at least
> the mapcount, not the opposite. Each mapcount must have a corresponding
> refcount, but the refcount may increase if other components grab the
> folio, which is acceptable. Meanwhile, having a mapcount larger than
> refcount is a real problem.

Agreed.

> 
> So fix the WARN_ON condition.
> 
> Fixes: 1da190f4d0a6 ("mm: Copy-on-Write (COW) reuse support for PTE-mapped THP")
> Reported-by: Kairui Song <kasong@tencent.com>
> Closes: https://lore.kernel.org/all/CAMgjq7D+ea3eg9gRCVvRnto3Sv3_H3WVhupX4e=k8T5QAfBHbw@mail.gmail.com/
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  mm/memory.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 424420349bd3..f18266b5a0a9 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3789,7 +3789,7 @@ static bool __wp_can_reuse_large_anon_folio(struct folio *folio,
>  
>  	/* Stabilize the mapcount vs. refcount and recheck. */
>  	folio_lock_large_mapcount(folio);
> -	VM_WARN_ON_ONCE(folio_large_mapcount(folio) < folio_ref_count(folio));
> +	VM_WARN_ON_ONCE_FOLIO(folio_large_mapcount(folio) > folio_ref_count(folio), folio);

Changing this to VM_WARN_ON_ONCE_FOLIO() is better.

>  
>  	if (folio_test_large_maybe_mapped_shared(folio))
>  		goto unlock;

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
