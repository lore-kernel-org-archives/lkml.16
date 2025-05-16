Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D921D5174;
	Fri, 16 May 2025 17:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747415978; cv=none; b=BzwhJa7fZAnxzoK3Pem/vpu37VZZHRz3P9IAMnLB0VKq276/9vSj762dRuE45N/mUoExU4xUfWh2Wj8wAQo7BZwcvOu4N6heLASV890v3Tlti1jQMAPqY9NwpdENnuMUzpb40yn+cwbl59cEFxtub1geaMqiDXKcN2B7wJgvQUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747415978; c=relaxed/simple;
	bh=oU/upza6fHD2xQ5TLfC2wgPPp/ppsw0/de/y+5bcXOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HhVCkwMEksB/CXXHIfxFv7tsi0Tfg5w9+TlrDWyAB//Kz2BwmF691352eFLMP0QEmy+L14Hl05M3VwgvA9tbsTwoMSvil3iDyLZjW3l1qHBnthxpTvUH6vIKyli8wRU764okayhTlV0fhcv48esEGVJo3Fie8FBP5L43AxmRqDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ecgyck1S; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ecgyck1S"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a1d8c0966fso1665637f8f.1;
        Fri, 16 May 2025 10:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747415974; x=1748020774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=scp30wX9S3En5NLP8zYpz0v3AMQnTSxhNtpujWPSkWo=;
        b=ecgyck1SO2082mMSag/sGrjRldUqirRjem5OdOTuqsvQYJp8bvQazGjGsnmoRBOs1g
         WoUiCrgKARlWfQQjATuH0ylL3cozZOo3Rnd/tzfM6HgDqJPVeeDhpx5sMMPde7BKs5yf
         dUvEhavAi2PREDFD6NprojRukfY8RUnguPeO0djjQ8oRoAEz1Ih/y73Di9Z7GYLCmLrO
         qm92rYQuCBeCA4G7YUXk44YJuWLun9KpoOwtIqhmlSIhctDOGYpZFIVBpYKvMkjByh3I
         gYjYrqX45J6kYAGT32rdpMbYPUKFpZO5BqHH3bAuwHQ+lPjbWMCi/kgH4h+tyuy66c06
         fGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747415974; x=1748020774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=scp30wX9S3En5NLP8zYpz0v3AMQnTSxhNtpujWPSkWo=;
        b=nIkBJ3i5r8K2syLl+ZMK1oX4vu03NbumY1KinV6qz07CPo8o8USVAMNUD2qDR89IQl
         rfITfrGRRB8yX/DeRiysg7kjSpUfHqY17mcs1YTmBXiN38xltidPrzrPG9cwBxV0yphw
         aRUPM1FtIzFN4eVtJ+GMDP7NsZwWXLU0pGp/yBDy1Ebm3PG1q4i2fPMLcktNSHvCUAfI
         wL5zj3g1uEXmU5IUbAHk1MOplzSzRbP6UZUgPLQQYigaWLV+ESfdH1oyomz5EDEMayjo
         U0wju2PnegtMUDMEjzX2uAa5Pq2RQPGMXmVNxLwjFE0GAVdyr3Jc3zXbRl/r6RDJS3Qo
         u3KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJuY0Mm29VMcomHBg1Fb2xjl/S9xW3hc/WSms/0nRnalj37bOLCYs2wVeAhqpavZgJk87ZJNGRpT8=@vger.kernel.org, AJvYcCXzFyms4pxWprPW9BSl/wZZ7R62FOdeuJctyQmob7GP4HidQOSKExkMssEEuDZ6De8paWJ+GmI0nVim2HV6@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn2NfDrZa26Te+mwwve+WXrUsdnroku5PHcZeDQEv6ae1ZMNVz
	dyaWO0WYxMuxIjIOxOAzMKmB6WcH1u/EWa1wkX+kRuekm+PLq/24xbT1
X-Gm-Gg: ASbGncvvLmS9TJUuCXUrEAYjjAdx9eu9+alEh7Tl1rctqG87pamzppSvsapqOTB2/aX
	Vrl3BsVzhnjOycXA5K0BCc2MhohNqvtZFhlETgRVSgYJrEdTjlKiS3mJKVOmaWFOP3hpYtyVaxU
	uU/o8BfnsfFBJ2R661yneIwEXhOdtSJj4wz7d4OjCo5vfvmXwXozt5djZZz83rvd76LEgI5dT+l
	sQR3LeBwsg9RCEpFwCUcIkeF0ePBzNE4ISow0i9jOd+aG2E0mYDjo0aL2vgPCHifYqRvxe+N1pR
	h0Ty6UVxEQ7iXR7202ZYqtLTp+99G49iMDMYc0Fjc2Yvx+GG1W3nqSlYVIrmJUpBLwJtUOHJoqY
	0QrNEx5dIHRIhSmDWhVxvY5dW6k8BREx0D8YMkf45ZLYTwOCOMKIXoEr/RQ==
X-Google-Smtp-Source: AGHT+IEzy01Mr4eOjhKk/daIdILUsRnMi+mICtkNBZwJf2oVbEFvg6chOyHRDPdQXEo31nfb/2V3og==
X-Received: by 2002:a05:6000:2a5:b0:3a0:b817:2d7a with SMTP id ffacd0b85a97d-3a351222edemr7573219f8f.29.1747415973931;
        Fri, 16 May 2025 10:19:33 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:b211:ad00:1096:2c00:b223:9747? ([2a01:4b00:b211:ad00:1096:2c00:b223:9747])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd50ee03sm40122895e9.14.2025.05.16.10.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 10:19:33 -0700 (PDT)
Message-ID: <3284ec20-2c3f-46d0-a599-2f322b2883c8@gmail.com>
Date: Fri, 16 May 2025 18:19:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-team@meta.com
References: <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
 <ddc0dd46-8541-4d4a-ac59-287e11e1d3ff@gmail.com>
 <02ead03b-339b-45c8-b252-d31a66501c39@lucifer.local>
 <3a2a329d-2592-4e31-a763-d87dcd925966@redhat.com>
 <8ea288f2-5196-41f9-bd65-e29f22bb29e8@lucifer.local>
 <5f77366d-e100-46bb-ac85-aa4b216eb2cf@redhat.com>
 <cbc95f9b-1c13-45ec-8d34-38544d3f2dd3@lucifer.local>
 <8f0a22c2-3176-4942-994d-58d940901ecf@redhat.com>
 <1a175a2c-8afa-4995-9dec-e3e7cf1efc72@lucifer.local>
 <d8a7644b-6ec5-48bd-9789-cb5017075690@redhat.com>
 <c390dd7e-0770-4d29-bb0e-f410ff6678e3@lucifer.local>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <c390dd7e-0770-4d29-bb0e-f410ff6678e3@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16/05/2025 13:57, Lorenzo Stoakes wrote:
> On Fri, May 16, 2025 at 01:24:18PM +0200, David Hildenbrand wrote:
>> Looking forward to hearing what your magic thinking cap can do! :)
> 
> OK so just to say at the outset, this is purely playing around with a
> theoretical idea here, so if it's crazy just let me know :))
> 
> Right now madvise() has limited utility because:
> 
> - You have little control over how the operation is done
> - You get little feedback about what's actually succeeded or not
> - While you can perform multiple operations at once via process_madvise(),
>   even to the current process (after my changes to extend it), it's limited
>   to a single advice over 8 ranges.
> - You can't say 'ignore errors just try'
> - You get the weird gap behaviour.
> 
> So the concept is - make everything explicit and add a new syscall that
> wraps the existing madvise() stuff and addresses all the above issues.
> 
> Specifically pertinent to the case at hand - also add a 'set_default'
> boolean (you'll see shortly exactly where) to also tell madvise() to make
> all future VMAs default to the specified advice. We'll whitelist what we're
> allowed to use here and should be able to use mm->def_flags.
> 
> So the idea is we'll use a helper struct-configured function (hey, it's me,
> I <3 helper structs so of course) like:
> 
> int madvise_ranges(struct madvise_range_control *ctl);
> 
> With the data structures as follows (untested, etc. etc.):
> 
> enum madvise_range_type {
> 	MADVISE_RANGE_SINGLE,
> 	MADVISE_RANGE_MULTI,
> 	MADVISE_RANGE_ALL,
> };
> 
> struct madvise_range {
> 	const void *addr;
> 	size_t size;
> 	int advice;
> };
> 
> struct madvise_ranges {
> 	const struct madvise_range *arr;
> 	size_t count;
> };
> 
> struct madvise_range_stats {
> 	struct madvise_range range;
> 	bool success;
> 	bool partial;
> };
> 
> struct madvise_ranges_stats {
> 	unsigned long nr_mappings_advised;
> 	unsigned long nr_mappings_skipped;
> 	unsigned long nr_pages_advised;
> 	unsigned long nr_pages_skipped;
> 	unsigned long nr_gaps;
> 
> 	/*
> 	 * Useful for madvise_range_control->ignore_errors:
> 	 *
> 	 * If non-NULL, points to an array of size equal to the number of ranges
> 	 * specified. Indiciates the specified range, whether it succeeded, and
> 	 * whether that success was partial (that is, the range specified
> 	 * multiple mappings, only some of which had advice applied
> 	 * successfully).
> 	 *
> 	 * Not valid for MADVISE_RANGE_ALL.
> 	 */
>  	struct madvise_range_stats *per_range_stats;
> 
> 	/* Error details. */
> 	int err;
> 	unsigned long failed_address;
> 	size_t offset; /* If multi, at which offset did this occur? */
> };
> 
> struct madvise_ranges_control {
> 	int version; /* Allow future updates to API. */
> 
> 	enum madvise_range_type type;
> 
> 	union {
> 		struct madvise_range range; /* MADVISE_RANGE_SINGLE */
> 		struct madvise_ranges ranges; /* MADVISE_RANGE_MULTI */
> 		struct all { /* MADVISE_RANGE_ALL */
> 			int advice;
> 			/*
> 			 * If set, also have all future mappings have this applied by default.
> 			 *
> 			 * Only whitelisted advice may set this, otherwise -EINVAL will be returned.
> 			 */
> 			bool set_default;
> 		};
> 	};
> 	struct madvise_ranges_stats *stats; /* If non-NULL, report information about operation. */
> 
> 	int pidfd; /* If is_remote set, the remote process. */
> 
> 	/* Options. */
> 	bool is_remote :1; /* Target remote process as specified by pidfd. */
> 	bool ignore_errors :1; /* If error occurs applying advice, carry on to next VMA. */
> 	bool single_mapping_only :1; /* Error out if any range is not a single VMA. */
> 	bool stop_on_gap :1; /* Stop operation if input range includes unmapped memory. */
> };
> 
> So the user can specify whether to apply advice to a single range,
> multiple, or the whole address space, with real control over how the operation proceeds.
> 

For single range, we have madvise, for multiple ranges we have process_madvise,
we can have a very very simple solution for whole address space with prctl.

IMHO, above is really not be needed (but I might be wrong :)), this will introduce a
lot of code to solve something that can be done in a very very simple way and it will introduce
another syscall when prctl is designed for this, I understand that you don't like prctl,
but it is there.

I have added below what patch 1 of 6 would look like after incorporating all your feedback.
(Thanks for all the feedback, really appreciate it!!)
Main difference from the current revisions:
- no more flags2.
- no more MMF2_...
- renamed policy to PR_DEFAULT_MADV_HUGEPAGE
- mmap_write_lock_killable acquired in PR_GET_THP_POLICY
- mmap_write lock fixed in PR_SET_THP_POLICY
- check if hugepage_global_enabled is enabled in the call and account for s390
- set mm->def_flags VM_HUGEPAGE and VM_NOHUGEPAGE according to the policy in the way
  done by madvise(). I believe VM merge will not be broken in this way, please let me know
  otherwise.
- process_default_madv_hugepage function that does for_each_vma and calls hugepage_madvise.
  (I can move it to vma.c or any other file you prefer).

Please let me know if this looks acceptable and I can send this as RFC v3 for all the
6 patches (the rest are done in a similar way to below)




diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 2f190c90192d..a8c3ce15a504 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -260,6 +260,8 @@ static inline unsigned long thp_vma_suitable_orders(struct vm_area_struct *vma,
        return orders;
 }
 
+void process_default_madv_hugepage(struct mm_struct *mm, int advice);
+
 unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
                                         unsigned long vm_flags,
                                         unsigned long tva_flags,
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 43748c8f3454..436f4588bce8 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -466,7 +466,7 @@ extern unsigned int kobjsize(const void *objp);
 #define VM_NO_KHUGEPAGED (VM_SPECIAL | VM_HUGETLB)
 
 /* This mask defines which mm->def_flags a process can inherit its parent */
-#define VM_INIT_DEF_MASK       VM_NOHUGEPAGE
+#define VM_INIT_DEF_MASK       (VM_HUGEPAGE | VM_NOHUGEPAGE)
 
 /* This mask represents all the VMA flag bits used by mlock */
 #define VM_LOCKED_MASK (VM_LOCKED | VM_LOCKONFAULT)
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index e76bade9ebb1..f1836b7c5704 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1703,6 +1703,7 @@ enum {
                                        /* leave room for more dump flags */
 #define MMF_VM_MERGEABLE       16      /* KSM may merge identical pages */
 #define MMF_VM_HUGEPAGE                17      /* set when mm is available for khugepaged */
+#define MMF_VM_HUGEPAGE_MASK   (1 << MMF_VM_HUGEPAGE)
 
 /*
  * This one-shot flag is dropped due to necessity of changing exe once again
@@ -1742,7 +1743,8 @@ enum {
 
 #define MMF_INIT_MASK          (MMF_DUMPABLE_MASK | MMF_DUMP_FILTER_MASK |\
                                 MMF_DISABLE_THP_MASK | MMF_HAS_MDWE_MASK |\
-                                MMF_VM_MERGE_ANY_MASK | MMF_TOPDOWN_MASK)
+                                MMF_VM_MERGE_ANY_MASK | MMF_TOPDOWN_MASK |\
+                                MMF_VM_HUGEPAGE_MASK)
 
 static inline unsigned long mmf_init_flags(unsigned long flags)
 {
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 15c18ef4eb11..15aaa4db5ff8 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -364,4 +364,8 @@ struct prctl_mm_map {
 # define PR_TIMER_CREATE_RESTORE_IDS_ON                1
 # define PR_TIMER_CREATE_RESTORE_IDS_GET       2
 
+#define PR_SET_THP_POLICY              78
+#define PR_GET_THP_POLICY              79
+#define PR_DEFAULT_MADV_HUGEPAGE       0
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index c434968e9f5d..4fe860b0ff25 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2658,6 +2658,44 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
                        clear_bit(MMF_DISABLE_THP, &me->mm->flags);
                mmap_write_unlock(me->mm);
                break;
+       case PR_GET_THP_POLICY:
+               if (arg2 || arg3 || arg4 || arg5)
+                       return -EINVAL;
+               if (mmap_write_lock_killable(me->mm))
+                       return -EINTR;
+               if (me->mm->def_flags & VM_HUGEPAGE)
+                       error = PR_DEFAULT_MADV_HUGEPAGE;
+               mmap_write_unlock(me->mm);
+               break;
+       case PR_SET_THP_POLICY:
+               if (arg3 || arg4 || arg5)
+                       return -EINVAL;
+               if (mmap_write_lock_killable(me->mm))
+                       return -EINTR;
+               switch (arg2) {
+               case PR_DEFAULT_MADV_HUGEPAGE:
+                       if (!hugepage_global_enabled())
+                               error = -EPERM;
+#ifdef CONFIG_S390
+                       /*
+                       * qemu blindly sets MADV_HUGEPAGE on all allocations, but s390
+                       * can't handle this properly after s390_enable_sie, so we simply
+                       * ignore the madvise to prevent qemu from causing a SIGSEGV.
+                       */
+                       else if (mm_has_pgste(vma->vm_mm))
+                               error = -EPERM;
+#endif
+                       else {
+                               me->mm->def_flags &= ~VM_NOHUGEPAGE;
+                               me->mm->def_flags |= VM_HUGEPAGE;
+                               process_default_madv_hugepage(me->mm, MADV_HUGEPAGE);
+                       }
+                       break;
+               default:
+                       error = -EINVAL;
+               }
+               mmap_write_unlock(me->mm);
+               break;
        case PR_MPX_ENABLE_MANAGEMENT:
        case PR_MPX_DISABLE_MANAGEMENT:
                /* No longer implemented: */
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 2780a12b25f0..2b9a3e280ae4 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -98,6 +98,18 @@ static inline bool file_thp_enabled(struct vm_area_struct *vma)
        return !inode_is_open_for_write(inode) && S_ISREG(inode->i_mode);
 }
 
+void process_default_madv_hugepage(struct mm_struct *mm, int advice)
+{
+       struct vm_area_struct *vma;
+       unsigned long vm_flags;
+
+       VMA_ITERATOR(vmi, mm, 0);
+       for_each_vma(vmi, vma) {
+               vm_flags = vma->vm_flags;
+               hugepage_madvise(vma, &vm_flags, advice);
+       }
+}
+
 unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
                                         unsigned long vm_flags,
                                         unsigned long tva_flags,




> This basically solves the problem this series tries to address while also
> providing an improved madvise() API at the same time.
> 
> Thoughts? Have I finally completely lost my mind?


