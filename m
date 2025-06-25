Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9119E2DFA25
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.95.48.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750870594; cv=none; b=RxMaApZ0atV4YkAFQyYCc1xglmGJ1zyNsHKaQO0q4Zzvuj7XRzP/RCF/rV4SKrmdZHD1LV1/JysTb00eyYdlxeb3ICjGkO7v/ClgSgjlk3dCnaJ4XGpjS6sF1lsE1q4552BqmBeekwt3cpSkM4FhyTLZUxw6VKPyKNhD7PVpf+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750870594; c=relaxed/simple;
	bh=2U5NIwJp6EnKwB3fC3OMfl4PQkRbda5cT4H5ZWcobBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=I/bZaZa43Zsu2o8EhdvYb2g/o5ieSHZXRyXRoYkDr3cbYH21UFuvbQxddxbh61qSA6C9PKzC8s/skE6nUJPfYdKWGRuzm0NfM3yYHOKFP0a50FSfDednVHwAz7/MWs52369SwWb47SOqQDd0R4Stvd3g7/DKMVzmhOPeUtSC79k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.uk; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=YX7DqT+t; arc=none smtp.client-ip=52.95.48.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="YX7DqT+t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1750870593; x=1782406593;
  h=message-id:date:mime-version:reply-to:subject:to:cc:
   references:from:in-reply-to:content-transfer-encoding;
  bh=+vRtrz9MOOBe4jJ74zhcMAZfEe7FJhBMbwgUuOpN8Bs=;
  b=YX7DqT+tiAYyWEddsl/Bb9bIMKIudqxOx9m+5CYtCALIFl8tbHbM6WiM
   gccEN9PY/bnnr77XTNZJvVbp6BocLvaSy5v5MiNP0wDP9BD/BYoyC4u2X
   xGdVrcSW0xKtmiFBUjT455xG6op6C4sjEpzYFHfkyBXpy9g1pHwEKD8i9
   wcLHxYmUWHjAbs5SJcxVvUmF0ySaw++HFCXorgmtGczVQGjgViq9O0VeA
   q/gs0Zps0wxN80syV7KqGw+gcPQkza9joIwl2FtVeHimYIP74635a6lhZ
   za5t/TdFDoQ+eC4MSYiuda2878Oppa2lYnA43pJ/4ooEb7MP2QPtZe+oz
   A==;
X-IronPort-AV: E=Sophos;i="6.16,265,1744070400"; 
   d="scan'208";a="505638031"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.2])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 16:56:29 +0000
Received: from EX19MTAEUC002.ant.amazon.com [10.0.43.254:7530]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.42.139:2525] with esmtp (Farcaster)
 id aa7a323b-7e78-456a-8a40-2f2234ef4242; Wed, 25 Jun 2025 16:56:27 +0000 (UTC)
X-Farcaster-Flow-ID: aa7a323b-7e78-456a-8a40-2f2234ef4242
Received: from EX19D022EUC002.ant.amazon.com (10.252.51.137) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 25 Jun 2025 16:56:26 +0000
Received: from [192.168.16.20] (10.106.83.26) by EX19D022EUC002.ant.amazon.com
 (10.252.51.137) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14; Wed, 25 Jun 2025
 16:56:25 +0000
Message-ID: <114133f5-0282-463d-9d65-3143aa658806@amazon.com>
Date: Wed, 25 Jun 2025 17:56:23 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <kalyazin@amazon.com>
Subject: Re: [PATCH 0/4] mm/userfaultfd: modulize memory types
To: Peter Xu <peterx@redhat.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>
CC: Hugh Dickins <hughd@google.com>, Oscar Salvador <osalvador@suse.de>,
	Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, "Muchun
 Song" <muchun.song@linux.dev>, Andrea Arcangeli <aarcange@redhat.com>, "Ujwal
 Kundur" <ujwal.kundur@gmail.com>, Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, James Houghton
	<jthoughton@google.com>, Mike Rapoport <rppt@kernel.org>, Lorenzo Stoakes
	<lorenzo.stoakes@oracle.com>, Axel Rasmussen <axelrasmussen@google.com>
References: <20250620190342.1780170-1-peterx@redhat.com>
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
In-Reply-To: <20250620190342.1780170-1-peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EX19D003EUB001.ant.amazon.com (10.252.51.97) To
 EX19D022EUC002.ant.amazon.com (10.252.51.137)



On 20/06/2025 20:03, Peter Xu wrote:
> [based on akpm/mm-new]
> 
> This series is an alternative proposal of what Nikita proposed here on the
> initial three patches:
> 
>    https://lore.kernel.org/r/20250404154352.23078-1-kalyazin@amazon.com
> 
> This is not yet relevant to any guest-memfd support, but paving way for it.

Hi Peter,

Thanks for posting this.  I confirmed that minor fault handling was 
working for guest_memfd based on this series and looked simple (a draft 
based on mmap support in guest_memfd v7 [1]):

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 5abb6d52a375..6ddc73419724 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -5,6 +5,9 @@
  #include <linux/pagemap.h>
  #include <linux/anon_inodes.h>
  #include <linux/set_memory.h>
+#ifdef CONFIG_USERFAULTFD
+#include <linux/userfaultfd_k.h>
+#endif

  #include "kvm_mm.h"

@@ -396,6 +399,14 @@ static vm_fault_t kvm_gmem_fault(struct vm_fault *vmf)
  		kvm_gmem_mark_prepared(folio);
  	}

+#ifdef CONFIG_USERFAULTFD
+	if (userfaultfd_minor(vmf->vma)) {
+		folio_unlock(folio);
+		filemap_invalidate_unlock_shared(inode->i_mapping);
+		return handle_userfault(vmf, VM_UFFD_MINOR);
+	}
+#endif
+
  	vmf->page = folio_file_page(folio, vmf->pgoff);

  out_folio:
@@ -410,8 +421,39 @@ static vm_fault_t kvm_gmem_fault(struct vm_fault *vmf)
  	return ret;
  }

+#ifdef CONFIG_USERFAULTFD
+static int kvm_gmem_uffd_get_folio(struct inode *inode, pgoff_t pgoff,
+				struct folio **foliop)
+{
+	struct folio *folio;
+	folio = kvm_gmem_get_folio(inode, pgoff);
+
+	if (IS_ERR(folio)) {
+		*foliop = NULL;
+		return PTR_ERR(folio);
+	}
+
+	if (!folio_test_uptodate(folio)) {
+		clear_highpage(folio_page(folio, 0));
+		kvm_gmem_mark_prepared(folio);
+	}
+
+	*foliop = folio;
+	return 0;
+}
+
+static const vm_uffd_ops kvm_gmem_uffd_ops = {
+	.uffd_features	= 	VM_UFFD_MINOR,
+	.uffd_ioctls	= 	BIT(_UFFDIO_CONTINUE),
+	.uffd_get_folio	=	kvm_gmem_uffd_get_folio,
+};
+#endif
+
  static const struct vm_operations_struct kvm_gmem_vm_ops = {
  	.fault = kvm_gmem_fault,
+#ifdef CONFIG_USERFAULTFD
+	.userfaultfd_ops = &kvm_gmem_uffd_ops,
+#endif
  };

  static int kvm_gmem_mmap(struct file *file, struct vm_area_struct *vma)

[1]: https://lore.kernel.org/kvm/20250318161823.4005529-1-tabba@google.com/

> Here, the major goal is to make kernel modules be able to opt-in with any
> form of userfaultfd supports, like guest-memfd.  This alternative option
> should hopefully be cleaner, and avoid leaking userfault details into
> vm_ops.fault().
> 
> It also means this series does not depend on anything.  It's a pure
> refactoring of userfaultfd internals to provide a generic API, so that
> other types of files, especially RAM based, can support userfaultfd without
> touching mm/ at all.
> 
> To achieve it, this series introduced a file operation called vm_uffd_ops.
> The ops needs to be provided when a file type supports any of userfaultfd.
> 
> With that, I moved both hugetlbfs and shmem over.
> 
> Hugetlbfs is still very special that it will only use partial of the
> vm_uffd_ops API, due to similar reason why hugetlb_vm_op_fault() has a
> BUG() and so far hard-coded into core mm.  But this should still be better,
> because at least hugetlbfs is still always involved in feature probing
> (e.g. where it used to not support ZEROPAGE and we have a hard-coded line
> to fail that, and some more).  Meanwhile after this series, shmem will be
> completely converted to the new vm_uffd_ops API; the final vm_uffd_ops for
> shmem looks like this:
> 
> static const vm_uffd_ops shmem_uffd_ops = {
>          .uffd_features  =       __VM_UFFD_FLAGS,
>          .uffd_ioctls    =       BIT(_UFFDIO_COPY) |
>                                  BIT(_UFFDIO_ZEROPAGE) |
>                                  BIT(_UFFDIO_WRITEPROTECT) |
>                                  BIT(_UFFDIO_CONTINUE) |
>                                  BIT(_UFFDIO_POISON),
>          .uffd_get_folio =       shmem_uffd_get_folio,
>          .uffd_copy      =       shmem_mfill_atomic_pte,
> };
> 
> As I mentioned in one of my reply to Nikita, I don't like the current
> interface of uffd_copy(), but this will be the minimum change version of
> such API to support complete extrenal-module-ready userfaultfd.  Here, very
> minimal change will be needed from shmem side to support that.
> 
> Meanwhile, the vm_uffd_ops is also not the only place one will need to
> provide to support userfaultfd.  Normally vm_ops.fault() will also need to
> be updated, but that's a generic function and it'll play together with the
> new vm_uffd_ops to make everything fly.
> 
> No functional change expected at all after the whole series applied.  There
> might be some slightly stricter check on uffd ops here and there in the
> last patch, but that really shouldn't stand out anywhere to anyone.
> 
> For testing: besides the cross-compilation tests, I did also try with
> uffd-stress in a VM to measure any perf difference before/after the change;
> The static call becomes a pointer now.  I really cannot measure anything
> different, which is more or less expected.
> 
> Comments welcomed, thanks.
> 
> Peter Xu (4):
>    mm: Introduce vm_uffd_ops API
>    mm/shmem: Support vm_uffd_ops API
>    mm/hugetlb: Support vm_uffd_ops API
>    mm: Apply vm_uffd_ops API to core mm
> 
>   include/linux/mm.h            |  71 +++++++++++++++++++++
>   include/linux/shmem_fs.h      |  14 -----
>   include/linux/userfaultfd_k.h |  58 ++++-------------
>   mm/hugetlb.c                  |  19 ++++++
>   mm/shmem.c                    |  28 ++++++++-
>   mm/userfaultfd.c              | 115 +++++++++++++++++++++++++---------
>   6 files changed, 217 insertions(+), 88 deletions(-)
> 
> --
> 2.49.0
> 

