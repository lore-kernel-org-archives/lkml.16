Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F013CEEDE
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.95.49.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751043600; cv=none; b=LQfi9Rd6oeWaBezCGrFAvNtvy16SLC6OpMu4a9Vb5STZmgcNiggIIlCbrbWOWrTXRbrbDJ3alsx1/B30CtCEZRrUp1EZvIchzaQ/me0JVsGA7sOZ7y2s88UF7AjwJ3xOvxw/KruDO2BOrps6pjzMRJdx98Jxzla8nM47RAWCev4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751043600; c=relaxed/simple;
	bh=Sf0/J7ime8jduwa4zLeB1bYgADQTtLjRDpqDM1HP2AU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=g+jM2ASN3Rj/DQ/bTWD65EkT2at5vU1nfMPVyr42+Q4S3GF36+CEAfk24piURFhlnsfkWbm7dv/PQHUa5ztu/h4P8F6iTtHpkXBq/F/KKgx2Q79pqCYGioBlaUkUkV6VwGrUKvGbMi+Yb8uKqJr/RVAPnqyxXD6kijSjklLOZhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.uk; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=b6imORFe; arc=none smtp.client-ip=52.95.49.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="b6imORFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1751043598; x=1782579598;
  h=message-id:date:mime-version:reply-to:subject:to:cc:
   references:from:in-reply-to:content-transfer-encoding;
  bh=loxh3gErpmWwgEV+wOnWTqYnTjCtznpMXlmt/r4IIOY=;
  b=b6imORFe1h1dYTQ1CwjJ0MzHOESlg2mtLSREFgi23XSaapStQst1Hnxh
   aD7yXry9dX6ldnQ07QJeFY8cu7exOZj6QOeFj37Ug9Ozs6dv69sf45G9W
   2jp3t8v6B5J3VEC+lAVqAldI9z084GCZobBXLHBm78HQjk+ALxVWx+xXx
   cvPXy10Ztonk3NynV08xSD0esq33gFYd9DU+yeVarhQaGb6SZsXbJCcnr
   g6ds7K9TP2UKfChgNDve4cp9+NHaYvCuE44X5EEx/DZZRj/ZfYgV15cNl
   X5Z/DzpSQE4get+l+ltCLWzZG2E2Qi+wpkBsrKpIuMBCs6AWSDu4n0tb3
   Q==;
X-IronPort-AV: E=Sophos;i="6.16,270,1744070400"; 
   d="scan'208";a="513937960"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-6002.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 16:59:55 +0000
Received: from EX19MTAEUA001.ant.amazon.com [10.0.43.254:55795]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.29.91:2525] with esmtp (Farcaster)
 id 0f8325c1-478e-4378-9322-fa5a4f55c457; Fri, 27 Jun 2025 16:59:54 +0000 (UTC)
X-Farcaster-Flow-ID: 0f8325c1-478e-4378-9322-fa5a4f55c457
Received: from EX19D022EUC002.ant.amazon.com (10.252.51.137) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 27 Jun 2025 16:59:54 +0000
Received: from [192.168.20.178] (10.106.83.15) by
 EX19D022EUC002.ant.amazon.com (10.252.51.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 27 Jun 2025 16:59:53 +0000
Message-ID: <7455220c-e35b-4509-b7c3-a78fde5b12d5@amazon.com>
Date: Fri, 27 Jun 2025 17:59:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <kalyazin@amazon.com>
Subject: Re: [PATCH 0/4] mm/userfaultfd: modulize memory types
To: Peter Xu <peterx@redhat.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Hugh Dickins
	<hughd@google.com>, Oscar Salvador <osalvador@suse.de>, Michal Hocko
	<mhocko@suse.com>, David Hildenbrand <david@redhat.com>, Muchun Song
	<muchun.song@linux.dev>, Andrea Arcangeli <aarcange@redhat.com>, Ujwal Kundur
	<ujwal.kundur@gmail.com>, Suren Baghdasaryan <surenb@google.com>, "Andrew
 Morton" <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, "Liam
 R . Howlett" <Liam.Howlett@oracle.com>, James Houghton
	<jthoughton@google.com>, Mike Rapoport <rppt@kernel.org>, Lorenzo Stoakes
	<lorenzo.stoakes@oracle.com>, Axel Rasmussen <axelrasmussen@google.com>
References: <20250620190342.1780170-1-peterx@redhat.com>
 <114133f5-0282-463d-9d65-3143aa658806@amazon.com> <aFxZUHcQh3hSraqe@x1.local>
 <7666ee96-6f09-4dc1-8cb2-002a2d2a29cf@amazon.com> <aF6h7rYVnVTMtJ0S@x1.local>
Content-Language: en-US
From: Nikita Kalyazin <kalyazin@amazon.com>
Autocrypt: addr=kalyazin@amazon.com; keydata=
 xjMEY+ZIvRYJKwYBBAHaRw8BAQdA9FwYskD/5BFmiiTgktstviS9svHeszG2JfIkUqjxf+/N
 JU5pa2l0YSBLYWx5YXppbiA8a2FseWF6aW5AYW1hem9uLmNvbT7CjwQTFggANxYhBGhhGDEy
 BjLQwD9FsK+SyiCpmmTzBQJnrNfABQkFps9DAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQr5LK
 IKmaZPOpfgD/exazh4C2Z8fNEz54YLJ6tuFEgQrVQPX6nQ/PfQi2+dwBAMGTpZcj9Z9NvSe1
 CmmKYnYjhzGxzjBs8itSUvWIcMsFzjgEY+ZIvRIKKwYBBAGXVQEFAQEHQCqd7/nb2tb36vZt
 ubg1iBLCSDctMlKHsQTp7wCnEc4RAwEIB8J+BBgWCAAmFiEEaGEYMTIGMtDAP0Wwr5LKIKma
 ZPMFAmes18AFCQWmz0MCGwwACgkQr5LKIKmaZPNTlQEA+q+rGFn7273rOAg+rxPty0M8lJbT
 i2kGo8RmPPLu650A/1kWgz1AnenQUYzTAFnZrKSsXAw5WoHaDLBz9kiO5pAK
In-Reply-To: <aF6h7rYVnVTMtJ0S@x1.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EX19D004EUC004.ant.amazon.com (10.252.51.191) To
 EX19D022EUC002.ant.amazon.com (10.252.51.137)



On 27/06/2025 14:51, Peter Xu wrote:
> On Thu, Jun 26, 2025 at 05:09:47PM +0100, Nikita Kalyazin wrote:
>>
>>
>> On 25/06/2025 21:17, Peter Xu wrote:
>>> On Wed, Jun 25, 2025 at 05:56:23PM +0100, Nikita Kalyazin wrote:
>>>>
>>>>
>>>> On 20/06/2025 20:03, Peter Xu wrote:
>>>>> [based on akpm/mm-new]
>>>>>
>>>>> This series is an alternative proposal of what Nikita proposed here on the
>>>>> initial three patches:
>>>>>
>>>>>      https://lore.kernel.org/r/20250404154352.23078-1-kalyazin@amazon.com
>>>>>
>>>>> This is not yet relevant to any guest-memfd support, but paving way for it.
>>>>
>>>> Hi Peter,
>>>
>>> Hi, Nikita,
>>>
>>>>
>>>> Thanks for posting this.  I confirmed that minor fault handling was working
>>>> for guest_memfd based on this series and looked simple (a draft based on
>>>> mmap support in guest_memfd v7 [1]):
>>>
>>> Thanks for the quick spin, glad to know it works. Some trivial things to
>>> mention below..
>>
>> Following up, I drafted UFFDIO_COPY support for guest_memfd to confirm it
>> works as well:
> 
> Appreciated.
> 
> Since at it, I'll comment quickly below.
> 
>>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index 8c44e4b9f5f8..b5458a22fff4 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -349,12 +349,19 @@ static bool kvm_gmem_offset_is_shared(struct file
>> *file, pgoff_t index)
>>
>>   static vm_fault_t kvm_gmem_fault(struct vm_fault *vmf)
>>   {
>> +     struct vm_area_struct *vma = vmf ? vmf->vma : NULL;
>>        struct inode *inode = file_inode(vmf->vma->vm_file);
>>        struct folio *folio;
>>        vm_fault_t ret = VM_FAULT_LOCKED;
>>
>>        filemap_invalidate_lock_shared(inode->i_mapping);
>>
>> +     folio = filemap_get_entry(inode->i_mapping, vmf->pgoff);
>> +     if (!folio && vma && userfaultfd_missing(vma)) {
>> +             filemap_invalidate_unlock_shared(inode->i_mapping);
>> +             return handle_userfault(vmf, VM_UFFD_MISSING);
>> +     }
> 
> Likely a possible refcount leak when folio != NULL here.

Thank you.  I was only aiming to cover the happy case for know.  I will 
keep it in mind for the future.
>> +
>>        folio = kvm_gmem_get_folio(inode, vmf->pgoff);
>>        if (IS_ERR(folio)) {
>>                int err = PTR_ERR(folio);
>> @@ -438,10 +445,57 @@ static int kvm_gmem_uffd_get_folio(struct inode
>> *inode, pgoff_t pgoff,
>>        return 0;
>>   }
>>
>> +static int kvm_gmem_mfill_atomic_pte(pmd_t *dst_pmd,
>> +                        struct vm_area_struct *dst_vma,
>> +                        unsigned long dst_addr,
>> +                        unsigned long src_addr,
>> +                        uffd_flags_t flags,
>> +                        struct folio **foliop)
>> +{
>> +     struct inode *inode = file_inode(dst_vma->vm_file);
>> +     pgoff_t pgoff = linear_page_index(dst_vma, dst_addr);
>> +     struct folio *folio;
>> +     int ret;
>> +
>> +     folio = kvm_gmem_get_folio(inode, pgoff);
>> +     if (IS_ERR(folio)) {
>> +             ret = PTR_ERR(folio);
>> +             goto out;
>> +     }
>> +
>> +     folio_unlock(folio);
>> +
>> +     if (uffd_flags_mode_is(flags, MFILL_ATOMIC_COPY)) {
>> +             void *vaddr = kmap_local_folio(folio, 0);
>> +             ret = copy_from_user(vaddr, (const void __user *)src_addr, PAGE_SIZE);
>> +             kunmap_local(vaddr);
>> +             if (unlikely(ret)) {
>> +                     *foliop = folio;
>> +                     ret = -ENOENT;
>> +                     goto out;
>> +             }
>> +     } else {                /* ZEROPAGE */
>> +             clear_user_highpage(&folio->page, dst_addr);
>> +     }
>> +
>> +     kvm_gmem_mark_prepared(folio);
> 
> Since Faud's series hasn't yet landed, so I'm almost looking at the current
> code base with an imagination of what might happen.
> 
> In general, missing trapping for guest-memfd could start to be slightly
> trickier.  So far IIUC guest-memfd cache pool needs to be populated only by
> a prior fallocate() syscall, not during fault.  So I suppose we will need
> to use uptodate bit to mark folio ready, like what's done here.

I don't think I'm familiar with the fallocate() requirement in 
guest_memfd.  Fuad's v12 [1] (although I think it has been like that 
from the beginning) calls kvm_gmem_get_folio() that populates pagecache 
in the fault handler (kvm_gmem_fault_shared()).  SEV [2] and TDX [3] 
seem to use kvm_gmem_populate() for both allocation and preparation.

[1] 
https://lore.kernel.org/kvm/20250611133330.1514028-1-tabba@google.com/T/#m15b53a741e4f328e61f995a01afb9c4682ffe611
[2] 
https://elixir.bootlin.com/linux/v6.16-rc3/source/arch/x86/kvm/svm/sev.c#L2331
[3] 
https://elixir.bootlin.com/linux/v6.16-rc3/source/arch/x86/kvm/vmx/tdx.c#L3236

> 
> If so, we may want to make sure in fault path any !uptodate fault will get
> trapped for missing too, even if it sounds not strictly a "cache miss"
> ... so slightly confusing but sounds necessary.
> 
> Meanwhile, I'm not 100% sure how it goes especially if taking CoCo into
> account, because CoCo needs to prepare the pages, so mark uptodate may not
> be enough?  I don't know well on the CoCo side to tell.  Otherwise we'll at
> least need to restrict MISSING traps to only happen on fully shared
> guest-memfds.

I am not fluent in CoCo either, but I thought CoCo needed to do 
preparation for private pages only, while UFFD shouldn't be dealing with 
them so issuing MISSING only on shared looks sensible to me.
> OTOH, MINOR should be much easier to be done for guest-memfd, not only
> because the code to support that would be very minimum which is definitely
> lovely, but also because it's still pretty common idea to monitor pgtable
> entries, and it should logically even apply to CoCo: in a fault(), we need
> to check whether the guest-memfd folio is "shared" and/or "faultable"
> first; it should already fail the fault() if it's a private folio.  Then if
> it's visible (aka, "faultable") to HVA namespace, then it's legal to trap a
> MINOR too.  For !CoCo it'll always trap as it's always faultable. > MINOR also makes more sense to be used in the future with 1G postcopy
> support on top of gmem, because that's almost the only way to go.  Looks
> like we've made up our mind to reuse Hugetlb pages for gmem which sounds
> good, then Hugetlb pages are in 1G granule in allocations, and we can't
> easily do 4K miss trapping on one 1G huge page.  MINOR is simpler but
> actually more powerful from that POV.
> 
> To summarize, I think after this we can do MINOR before MISSING for
> guest-memfd if MINOR already works for you.  We can leave MISSING until we
> know how we would use it.

Starting with MINOR sounds good to me.

> 
> Thanks,
> 
>> +
>> +     ret = mfill_atomic_install_pte(dst_pmd, dst_vma, dst_addr,
>> +                                    &folio->page, true, flags);
>> +
>> +     if (ret)
>> +             folio_put(folio);
>> +out:
>> +     return ret;
>> +}
>> +
>>   static const vm_uffd_ops kvm_gmem_uffd_ops = {
>> -     .uffd_features  =       VM_UFFD_MINOR,
>> -     .uffd_ioctls    =       BIT(_UFFDIO_CONTINUE),
>> +     .uffd_features  =       VM_UFFD_MISSING | VM_UFFD_MINOR,
>> +     .uffd_ioctls    =       BIT(_UFFDIO_COPY) |
>> +                             BIT(_UFFDIO_ZEROPAGE) |
>> +                             BIT(_UFFDIO_CONTINUE),
>>        .uffd_get_folio =       kvm_gmem_uffd_get_folio,
>> +     .uffd_copy      =       kvm_gmem_mfill_atomic_pte,
>>   };
>>   #endif
>>
>>>
>>>>
>>>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>>>> index 5abb6d52a375..6ddc73419724 100644
>>>> --- a/virt/kvm/guest_memfd.c
>>>> +++ b/virt/kvm/guest_memfd.c
>>>> @@ -5,6 +5,9 @@
>>>>    #include <linux/pagemap.h>
>>>>    #include <linux/anon_inodes.h>
>>>>    #include <linux/set_memory.h>
>>>> +#ifdef CONFIG_USERFAULTFD
>>>
>>> This ifdef not needed, userfaultfd_k.h has taken care of all cases.
>>
>> Good to know, thanks.
>>
>>>> +#include <linux/userfaultfd_k.h>
>>>> +#endif
>>>>
>>>>    #include "kvm_mm.h"
>>>>
>>>> @@ -396,6 +399,14 @@ static vm_fault_t kvm_gmem_fault(struct vm_fault *vmf)
>>>>                 kvm_gmem_mark_prepared(folio);
>>>>         }
>>>>
>>>> +#ifdef CONFIG_USERFAULTFD
>>>
>>> Same here.  userfaultfd_minor() is always defined.
>>
>> Thank you.
>>
>>> I'll wait for a few more days for reviewers, and likely send v2 before next
>>> week.
>>>
>>> Thanks,
>>>
>>> --
>>> Peter Xu
>>>
>>
> 
> --
> Peter Xu
> 

