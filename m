Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545671DACB1
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 18:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750702367; cv=none; b=nMqKg4KQ1tE1N/B79g4KGrQNR49gCJqdbHUkm/TJ9YncYPNhqNZsWxSko37A8bOJWQH8EVUDd33SZ5BtuTNxnriMf/Jf4yhTW+aTc3w0H2PlbDLHXF1MZtj33LjSAVoUjQ9b0xF/AKKmrs9z6g98eBCFyEON5Fau2YjRcde415k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750702367; c=relaxed/simple;
	bh=ZhXES0ZbSeNJ1gyds2iF0Qt0L9e6b4laYLr8B95hYoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVxWXQI+78/By5Mz9pyZGDQZ4kMKN+X7ebntsLLOMfR77OHE/qYT5kNqCVITakFBcAs/njATmYI8GFgLZCJKdAtC14zqEYoyh9jdJwsy6qUjumTUg/4PjCVs200gdMoftXJ9xMpMHyzlKifpQlkbj0ljuSlZ0Dy4CuWhxz+NmN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dqPwdO6R; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dqPwdO6R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750702361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Iav4YsZh0lX7sUJ5ofhiLBwN9GmAGN5M/lgmtGwU0kw=;
	b=dqPwdO6RgoXNENwtjBmYSlleDe1x2YVRFMqyTYsfiH2MAyJvqBZrDfsgtS8lmOcghDdhNw
	GyXDAeoDmKIX8bW+r0dLJe8+zfhh6p8uC/t7DtgrrEV2koHYBwJULJoZyVt9UXRpu80RrO
	pxEa71rVaLqDqlaXm3REJRMAbbWhHiE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-ZOd13lPbPIO56wJOMz9pMg-1; Mon, 23 Jun 2025 14:12:39 -0400
X-MC-Unique: ZOd13lPbPIO56wJOMz9pMg-1
X-Mimecast-MFC-AGG-ID: ZOd13lPbPIO56wJOMz9pMg_1750702359
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3dcac892bso697796385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750702359; x=1751307159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iav4YsZh0lX7sUJ5ofhiLBwN9GmAGN5M/lgmtGwU0kw=;
        b=WhSB/C1cU/ZobuAX2ZqU7Kiv9TNmvu5IigMuMPz1SF2aa+8fW+b921KgHukp8WIw5r
         6SB2e6TNHaDrKpShCWiKtMskvYknDEegMttiNVMz8uUTQm0a+YOib9dBGabZhxs1WGuM
         eX8DKM0QGchuzsUrKKuD41iUDXQeqe73ztw3M2fQ0O3f9hWe7LiAIcyYpe/zAC3qce9Q
         mQftwjQl+2laHLAJ+q9YxmejJ9A7xeMi594/VNNZj5tsJg5/2sOyxdjDjtoZsx6JruTL
         BNy+G6Fl7+kOIoHwP3I7LIvfvXBwG8sGS7OzT6shRUTmC83w2PW016Zi2O4EK/8or1h5
         +FDw==
X-Forwarded-Encrypted: i=1; AJvYcCVRmkBiVsdwTuT9NYPXWTiz9BpJRiypiR7Zzb7DjnlfRcUNynwwkoCBhgmGCe8QTXSy3N/dX3L84nThWtU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDc+nlSFdPwiS12pGkp8P6OthhcbRzn/rCjhexkhMmdoN7Ii5e
	mfYR+FKNZ1ohpfLfPAUXe2nwxQY4LRb2SOQe/QJljnyCpYKDpFEq8StL4ulFTxeKO6w16oTmCwu
	xJqcqGNIz5nbdpMXxHbytVcIF8ukz6VMjNa47zOLwdvgnULE4YZBZxy+FfE0hNlf90Q==
X-Gm-Gg: ASbGncu2VbTIsT/LaIh0uulBkGdSsOMV0UHcLahQJ10fKBbFz6qJmiwJPoe/MBiH+L0
	ylest1KZHUYBE3UubckYPpjQD6Hntlc0Bk7JKQfjPlGuzudEYr0Er07QdUOUoz7uMIiDjzMeS31
	dI+ZeK2Iv/JgHOMnkhkJZidgFefJjKSRIo/IFDyZP17T8dcDvVGGhK1asaecVDyNoAPuNvJv7cX
	671on/GZLfo/IuSZMOA98FHFlMdPFkXAqkoPY0n+XyVC1ZRlkmtWxhty+k1Kz/JAauB+zQEwiYg
	aPakm8hAXIX2Gg==
X-Received: by 2002:a05:620a:838a:b0:7d3:910e:4a76 with SMTP id af79cd13be357-7d41ec19ed4mr68830785a.7.1750702359204;
        Mon, 23 Jun 2025 11:12:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgT47ZCKXFLELEORYNnyqp2jHGSbfohR2YiK4ItxepExn16fOZExu87ZTR5++yYdLc7Raq8w==
X-Received: by 2002:a05:620a:838a:b0:7d3:910e:4a76 with SMTP id af79cd13be357-7d41ec19ed4mr68825685a.7.1750702358681;
        Mon, 23 Jun 2025 11:12:38 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f99efa3esm415953685a.75.2025.06.23.11.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 11:12:38 -0700 (PDT)
Date: Mon, 23 Jun 2025 14:12:34 -0400
From: Peter Xu <peterx@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Hugh Dickins <hughd@google.com>, Oscar Salvador <osalvador@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	James Houghton <jthoughton@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH 4/4] mm: Apply vm_uffd_ops API to core mm
Message-ID: <aFmZEtZWtnFCj3gm@x1.local>
References: <20250620190342.1780170-5-peterx@redhat.com>
 <202506230216.JVgQj2Si-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202506230216.JVgQj2Si-lkp@intel.com>

On Mon, Jun 23, 2025 at 03:09:13AM +0800, kernel test robot wrote:
> Hi Peter,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on next-20250620]
> [cannot apply to akpm-mm/mm-everything linus/master v6.16-rc2 v6.16-rc1 v6.15 v6.16-rc2]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Xu/mm-Introduce-vm_uffd_ops-API/20250621-030557
> base:   next-20250620
> patch link:    https://lore.kernel.org/r/20250620190342.1780170-5-peterx%40redhat.com
> patch subject: [PATCH 4/4] mm: Apply vm_uffd_ops API to core mm
> config: i386-randconfig-061-20250622 (https://download.01.org/0day-ci/archive/20250623/202506230216.JVgQj2Si-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506230216.JVgQj2Si-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506230216.JVgQj2Si-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>    mm/shmem.c: note: in included file (through include/linux/shmem_fs.h):
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> --
>    mm/hugetlb.c:669:12: sparse: sparse: context imbalance in 'allocate_file_region_entries' - wrong count at exit
>    mm/hugetlb.c:740:13: sparse: sparse: context imbalance in 'region_add' - wrong count at exit
>    mm/hugetlb.c:807:13: sparse: sparse: context imbalance in 'region_chg' - wrong count at exit
>    mm/hugetlb.c:5798:20: sparse: sparse: context imbalance in 'move_huge_pte' - different lock contexts for basic block
>    mm/hugetlb.c: note: in included file:
>    include/linux/mm.h:1391:22: sparse: sparse: context imbalance in 'hugetlb_wp' - unexpected unlock
>    mm/hugetlb.c: note: in included file (through include/linux/hugetlb.h, include/linux/migrate.h):
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> --
>    mm/userfaultfd.c:270:9: sparse: sparse: context imbalance in 'mfill_atomic_install_pte' - different lock contexts for basic block
>    mm/userfaultfd.c:412:9: sparse: sparse: context imbalance in 'mfill_atomic_pte_zeropage' - different lock contexts for basic block
>    mm/userfaultfd.c:498:9: sparse: sparse: context imbalance in 'mfill_atomic_pte_poison' - different lock contexts for basic block
>    mm/userfaultfd.c: note: in included file:
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
>    mm/userfaultfd.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
>    include/linux/rcupdate.h:871:25: sparse: sparse: context imbalance in 'move_pages_pte' - unexpected unlock
> 
> vim +90 include/linux/userfaultfd_k.h
> 
>     87	
>     88	static inline enum mfill_atomic_mode uffd_flags_get_mode(uffd_flags_t flags)
>     89	{
>   > 90		return (enum mfill_atomic_mode)(flags & MFILL_ATOMIC_MODE_MASK);
>     91	}
>     92	

Sigh.. I thought the cast would helped to tell sparse on this.  Looks like
I need __force..

I'll squash below change when repost:

diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.h
index 6064f9542d5b..6c5ca68204dd 100644
--- a/include/linux/userfaultfd_k.h
+++ b/include/linux/userfaultfd_k.h
@@ -87,7 +87,7 @@ extern vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason);

 static inline enum mfill_atomic_mode uffd_flags_get_mode(uffd_flags_t flags)
 {
-       return (enum mfill_atomic_mode)(flags & MFILL_ATOMIC_MODE_MASK);
+       return (__force enum mfill_atomic_mode)(flags & MFILL_ATOMIC_MODE_MASK);
 }

 static inline bool uffd_flags_mode_is(uffd_flags_t flags, enum mfill_atomic_mode expected)

-- 
Peter Xu

