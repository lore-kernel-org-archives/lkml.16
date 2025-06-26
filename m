Received: from smtp-fw-52004.amazon.com (smtp-fw-52004.amazon.com [52.119.213.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60BE1EF36B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.119.213.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750954196; cv=none; b=SU7lDa1TWyQkqol0iC1ayFg+cWfhUSiWYcVwrXlMi2CWFrPbH19K0mgSbK0U4iGRXk5WJcE8MKHsD5amzxNvEChY1Vp+DKr64PDpXXhEptBa4cWKsugU40IP7UXaZ6YYsrGlUiFIrmwhTx0H+3qVXQ9YJWN1cpVNJgSxR+9mCNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750954196; c=relaxed/simple;
	bh=ytGi2CI81yYquxhb2ptqmJdqYDkJAscsvZjaIhReO/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XeHOhe8pSZQzVhI/Mb6+TWPzdQgHISDhKpnrH5jkZGWMJPc/nRrEh3HM9lhDdgT0KADdKB5HcXnxYs3I0J02qNvWo8dEZWWDYtBepFFnebJ1TXMFupt2P8hEuuI62sssphswsezECnJ1Z/CxvGgv8sBFhCOoszF/6SzGU7Qz/q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.uk; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=mx6hBOGa; arc=none smtp.client-ip=52.119.213.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="mx6hBOGa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1750954195; x=1782490195;
  h=message-id:date:mime-version:reply-to:subject:to:cc:
   references:from:in-reply-to:content-transfer-encoding;
  bh=g3xFeXZI3QqRMs02H2fge/YdYUqqiszTKp89blpgsUg=;
  b=mx6hBOGaQ56EAUDX51Xr2de2hpVy+vBY0gqYSQep+mZhR0j58GR/J4aV
   ifvhnh5qlRMkmWLUmx/M8eRix+3XusjezgHQzsl4SqB2TGBbiMMyaEg/m
   jXMJk+R8cW2Zt+V9AQ4mkcFFqgf2/HGfcZDnvvAnsQcNFtEfPHIpboWgu
   ipOl09HpmhzQKyggHxCcDJno7S/nmxjuKST/XJd4GqKV3NSuZ22IUqsw/
   G0DAwYwsYdZPzFlsAsI8QVzdMZjC8RtL7HyJDLULmCCG4+uZz1Wv2VjvM
   OLpLsOxk5sIpyM3sXmb0Qi9VU62Ro9qe98j6oNafEcJPgvkmajYHEFtSr
   w==;
X-IronPort-AV: E=Sophos;i="6.16,268,1744070400"; 
   d="scan'208";a="312994400"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.2])
  by smtp-border-fw-52004.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 16:09:51 +0000
Received: from EX19MTAEUA001.ant.amazon.com [10.0.17.79:13317]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.47.53:2525] with esmtp (Farcaster)
 id 5ba97137-2dfa-4eb8-9ed5-afeceeeb58e6; Thu, 26 Jun 2025 16:09:49 +0000 (UTC)
X-Farcaster-Flow-ID: 5ba97137-2dfa-4eb8-9ed5-afeceeeb58e6
Received: from EX19D022EUC002.ant.amazon.com (10.252.51.137) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Thu, 26 Jun 2025 16:09:49 +0000
Received: from [192.168.30.146] (10.106.83.33) by
 EX19D022EUC002.ant.amazon.com (10.252.51.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Thu, 26 Jun 2025 16:09:48 +0000
Message-ID: <7666ee96-6f09-4dc1-8cb2-002a2d2a29cf@amazon.com>
Date: Thu, 26 Jun 2025 17:09:47 +0100
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
In-Reply-To: <aFxZUHcQh3hSraqe@x1.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EX19D003EUB001.ant.amazon.com (10.252.51.97) To
 EX19D022EUC002.ant.amazon.com (10.252.51.137)



On 25/06/2025 21:17, Peter Xu wrote:
> On Wed, Jun 25, 2025 at 05:56:23PM +0100, Nikita Kalyazin wrote:
>>
>>
>> On 20/06/2025 20:03, Peter Xu wrote:
>>> [based on akpm/mm-new]
>>>
>>> This series is an alternative proposal of what Nikita proposed here on the
>>> initial three patches:
>>>
>>>     https://lore.kernel.org/r/20250404154352.23078-1-kalyazin@amazon.com
>>>
>>> This is not yet relevant to any guest-memfd support, but paving way for it.
>>
>> Hi Peter,
> 
> Hi, Nikita,
> 
>>
>> Thanks for posting this.  I confirmed that minor fault handling was working
>> for guest_memfd based on this series and looked simple (a draft based on
>> mmap support in guest_memfd v7 [1]):
> 
> Thanks for the quick spin, glad to know it works. Some trivial things to
> mention below..

Following up, I drafted UFFDIO_COPY support for guest_memfd to confirm 
it works as well:

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 8c44e4b9f5f8..b5458a22fff4 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -349,12 +349,19 @@ static bool kvm_gmem_offset_is_shared(struct file 
*file, pgoff_t index)

  static vm_fault_t kvm_gmem_fault(struct vm_fault *vmf)
  {
+	struct vm_area_struct *vma = vmf ? vmf->vma : NULL;
  	struct inode *inode = file_inode(vmf->vma->vm_file);
  	struct folio *folio;
  	vm_fault_t ret = VM_FAULT_LOCKED;

  	filemap_invalidate_lock_shared(inode->i_mapping);

+	folio = filemap_get_entry(inode->i_mapping, vmf->pgoff);
+	if (!folio && vma && userfaultfd_missing(vma)) {
+		filemap_invalidate_unlock_shared(inode->i_mapping);
+		return handle_userfault(vmf, VM_UFFD_MISSING);
+	}
+
  	folio = kvm_gmem_get_folio(inode, vmf->pgoff);
  	if (IS_ERR(folio)) {
  		int err = PTR_ERR(folio);
@@ -438,10 +445,57 @@ static int kvm_gmem_uffd_get_folio(struct inode 
*inode, pgoff_t pgoff,
  	return 0;
  }

+static int kvm_gmem_mfill_atomic_pte(pmd_t *dst_pmd,
+			   struct vm_area_struct *dst_vma,
+			   unsigned long dst_addr,
+			   unsigned long src_addr,
+			   uffd_flags_t flags,
+			   struct folio **foliop)
+{
+	struct inode *inode = file_inode(dst_vma->vm_file);
+	pgoff_t pgoff = linear_page_index(dst_vma, dst_addr);
+	struct folio *folio;
+	int ret;
+
+	folio = kvm_gmem_get_folio(inode, pgoff);
+	if (IS_ERR(folio)) {
+		ret = PTR_ERR(folio);
+		goto out;
+	}
+
+	folio_unlock(folio);
+
+	if (uffd_flags_mode_is(flags, MFILL_ATOMIC_COPY)) {
+		void *vaddr = kmap_local_folio(folio, 0);
+		ret = copy_from_user(vaddr, (const void __user *)src_addr, PAGE_SIZE);
+		kunmap_local(vaddr);
+		if (unlikely(ret)) {
+			*foliop = folio;
+			ret = -ENOENT;
+			goto out;
+		}
+	} else {		/* ZEROPAGE */
+		clear_user_highpage(&folio->page, dst_addr);
+	}
+
+	kvm_gmem_mark_prepared(folio);
+
+	ret = mfill_atomic_install_pte(dst_pmd, dst_vma, dst_addr,
+				       &folio->page, true, flags);
+
+	if (ret)
+		folio_put(folio);
+out:
+	return ret;
+}
+
  static const vm_uffd_ops kvm_gmem_uffd_ops = {
-	.uffd_features	= 	VM_UFFD_MINOR,
-	.uffd_ioctls	= 	BIT(_UFFDIO_CONTINUE),
+	.uffd_features	= 	VM_UFFD_MISSING | VM_UFFD_MINOR,
+	.uffd_ioctls	= 	BIT(_UFFDIO_COPY) |
+				BIT(_UFFDIO_ZEROPAGE) |
+				BIT(_UFFDIO_CONTINUE),
  	.uffd_get_folio	=	kvm_gmem_uffd_get_folio,
+	.uffd_copy	=	kvm_gmem_mfill_atomic_pte,
  };
  #endif

> 
>>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index 5abb6d52a375..6ddc73419724 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -5,6 +5,9 @@
>>   #include <linux/pagemap.h>
>>   #include <linux/anon_inodes.h>
>>   #include <linux/set_memory.h>
>> +#ifdef CONFIG_USERFAULTFD
> 
> This ifdef not needed, userfaultfd_k.h has taken care of all cases.

Good to know, thanks.

>> +#include <linux/userfaultfd_k.h>
>> +#endif
>>
>>   #include "kvm_mm.h"
>>
>> @@ -396,6 +399,14 @@ static vm_fault_t kvm_gmem_fault(struct vm_fault *vmf)
>>                kvm_gmem_mark_prepared(folio);
>>        }
>>
>> +#ifdef CONFIG_USERFAULTFD
> 
> Same here.  userfaultfd_minor() is always defined.

Thank you.

> I'll wait for a few more days for reviewers, and likely send v2 before next
> week.
> 
> Thanks,
> 
> --
> Peter Xu
> 

