Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF93CEEBA;
	Fri, 16 May 2025 19:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747424087; cv=none; b=VCcgmjCAHm2s0iRziZDeZjUW2V4JaQExHnRYQIfME1mcc3t3/QNaQZAbC88VmHuATAl5ro36ucOJMSd+1lDsHIiAIy3+/HiDmeMymGAIgZUUtTMM1dS5OSnnyo7Quy5Ik3AQ7EnaykNjt7H9MpmTi/kmpzSOhGEiv1PBBDwn6IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747424087; c=relaxed/simple;
	bh=59jwOFWFiww24f1wjYDgLGp7EWoGZDUfuscplERmPwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eBZJph386mfZyfRnc5hmBmp/SRRQfG5NicB0FAhHppgHtFLtvfiH+/O28tkDRpZjbg5uKtFFmUCDhHXtLvYSgPZGbTvRgmWC+hrGfP9d8d4HTzhdh+ft495oTVOygsOrh5VJ1hXb6VQBC9sB1WoBqUNrb71cQE6st78isxeWe6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlK9WOEz; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlK9WOEz"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edb40f357so18630955e9.0;
        Fri, 16 May 2025 12:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747424083; x=1748028883; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y5UCjZdd/L4ntXQjcelhSVW2VxzlzWQL5/uwQiYYvQM=;
        b=MlK9WOEzDVoHY13nEu+j3PnKiCOELdIkLyTBm+xe8QYoq3lMWRUe9qgduI/QQqBqVH
         J/05Sl1S6MKhkmvwth/iZq3GMdFSXyvHwxpf/aU3qJ8DQaA+0kxxsYILuGYMEMszea/j
         XV+/S9YJLcfU/C3UtTe+qCx+liaH0JnPGk4I9AQMIx6lPLeaNXErYbG50g/I4dq+3ULM
         oqT7Iqm2QfdbyTgiFLE/bRcMvXNwE9tlqc/+EEi1XTfoCCPUpvpkQhmLV/ULV0tpFFoa
         zn0MEU255Izcxh7Cvv5TeaG29AOAfDusge2vGKkGw9ynypADuIwJnHkICN1PHpSeUP0n
         oeyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747424083; x=1748028883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y5UCjZdd/L4ntXQjcelhSVW2VxzlzWQL5/uwQiYYvQM=;
        b=alHI1Uh8Ao88ktbDLdAw6aWDB+icfmqz+t7FgCNd2M8+pJTpWsjMQzAGZAsOcfxgue
         TIRaJ6dtg+8l2TWEhCEDQZQSGB3tXiBr6fRl8uqnHf4t/1qK40o3alB7+ERcWVPKh30L
         E/QGwij3qsnQ0h7DnmjHDucFSowAVMWDBz2uwN+rhXBMUlv6uSm26B+KEBk5FOktrgqL
         TjWNBud2TNhFdAoknB+iGUkQJS4pLMZgWxJKr8XdUZu6w6C50mubatg7sPG3j99LV+B5
         4qJ6iaANmKkz+WKyoE0xr+61xcugTz+qNB9K7/2FlwfTdsN8j1ms8BMsL+dmi2vFHn+I
         bpVg==
X-Forwarded-Encrypted: i=1; AJvYcCVrZPnW9Geiwjg62hbLqD0vFhL3hW7DW/Wvk8BYJYutmiLwPDBmgLts+ktI6o+79y0gk9SUa7vJhs4=@vger.kernel.org, AJvYcCXO3Sk65OyiLkslE2MLs/XJNJu/QfeCRYH4i92H3fgO32jQBnhf/w6vGJjay15oKwholCADPS1ZWgIvFkGl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5q2NyuDB85gDfdoCGCEsHW1Q3X1xJv46s0KlXIGigWgj3ebtJ
	O+l/jC4ITQqXHq+sKH8NcRiDnwSBHQ6jDH6tJFrKF3FINhc7iXXuKkcM
X-Gm-Gg: ASbGnctAvOhg6bslTaXvJ2iw797QRCgXQv6H+R+k74QowExZ52TIFkOcDIVsbkY6esv
	3zup3vFtLl+qbuUdnrAxXDC69Ix02PXDT9XTXhqWpEpGNJdYMT+O6EKosx3PW9SNtA0bWeW7tde
	L6PGQQZhkS94YE0f3PEobnJ9mOtIgV6JUytKFJqhOqyjcORCk71LBK2NefCmZO6Z87lYASTiCtR
	rAc5su5Z5FOHybSTSKy5/dtDNCS0g+HpoUwbc4X9S45+Yl4FPwrjHHWL47WMyKHyKsP0JYw3Tb3
	ke+Tr53k6kMOgfhcAOuNOsQBQADe6eqr/m8DRC/Cz1yWXfKax246ltSvWHns6Xc/DGRlxYq7bJY
	d8cTPBBTFmDXiNzkMNUYWW2tbjUwJtx3fRSBhxa7G9oP5hZsRBXB1
X-Google-Smtp-Source: AGHT+IGMMew/P4grUPMijNKCeqG07T3FLJhV8rVwa2rdvFVBleB7jD0hBbVVtt/xgrnABAViL4hDig==
X-Received: by 2002:a05:600c:4f42:b0:442:dc75:5625 with SMTP id 5b1f17b1804b1-442fd60cb7bmr46002265e9.5.1747424082638;
        Fri, 16 May 2025 12:34:42 -0700 (PDT)
Received: from ?IPV6:2a02:6b6f:e750:f900:146f:2c4f:d96e:4241? ([2a02:6b6f:e750:f900:146f:2c4f:d96e:4241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd4fdcccsm46620695e9.6.2025.05.16.12.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 12:34:42 -0700 (PDT)
Message-ID: <d968c1fb-f0e3-417c-9e5a-f3b0aaa41299@gmail.com>
Date: Fri, 16 May 2025 20:34:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
 npache@redhat.com, ryan.roberts@arm.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com
References: <02ead03b-339b-45c8-b252-d31a66501c39@lucifer.local>
 <3a2a329d-2592-4e31-a763-d87dcd925966@redhat.com>
 <8ea288f2-5196-41f9-bd65-e29f22bb29e8@lucifer.local>
 <5f77366d-e100-46bb-ac85-aa4b216eb2cf@redhat.com>
 <cbc95f9b-1c13-45ec-8d34-38544d3f2dd3@lucifer.local>
 <8f0a22c2-3176-4942-994d-58d940901ecf@redhat.com>
 <1a175a2c-8afa-4995-9dec-e3e7cf1efc72@lucifer.local>
 <d8a7644b-6ec5-48bd-9789-cb5017075690@redhat.com>
 <c390dd7e-0770-4d29-bb0e-f410ff6678e3@lucifer.local>
 <3284ec20-2c3f-46d0-a599-2f322b2883c8@gmail.com>
 <df1f49a2-6796-45fe-a58b-2ea7290c3712@lucifer.local>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <df1f49a2-6796-45fe-a58b-2ea7290c3712@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16/05/2025 18:51, Lorenzo Stoakes wrote:
> On Fri, May 16, 2025 at 06:19:32PM +0100, Usama Arif wrote:
>>
>>
>> On 16/05/2025 13:57, Lorenzo Stoakes wrote:
>>> On Fri, May 16, 2025 at 01:24:18PM +0200, David Hildenbrand wrote:
>>>> Looking forward to hearing what your magic thinking cap can do! :)
>>>
>>> OK so just to say at the outset, this is purely playing around with a
>>> theoretical idea here, so if it's crazy just let me know :))
>>>
>>> Right now madvise() has limited utility because:
>>>
>>> - You have little control over how the operation is done
>>> - You get little feedback about what's actually succeeded or not
>>> - While you can perform multiple operations at once via process_madvise(),
>>>   even to the current process (after my changes to extend it), it's limited
>>>   to a single advice over 8 ranges.
>>> - You can't say 'ignore errors just try'
>>> - You get the weird gap behaviour.
>>>
>>> So the concept is - make everything explicit and add a new syscall that
>>> wraps the existing madvise() stuff and addresses all the above issues.
>>>
>>> Specifically pertinent to the case at hand - also add a 'set_default'
>>> boolean (you'll see shortly exactly where) to also tell madvise() to make
>>> all future VMAs default to the specified advice. We'll whitelist what we're
>>> allowed to use here and should be able to use mm->def_flags.
>>>
>>> So the idea is we'll use a helper struct-configured function (hey, it's me,
>>> I <3 helper structs so of course) like:
>>>
>>> int madvise_ranges(struct madvise_range_control *ctl);
>>>
>>> With the data structures as follows (untested, etc. etc.):
>>>
>>> enum madvise_range_type {
>>> 	MADVISE_RANGE_SINGLE,
>>> 	MADVISE_RANGE_MULTI,
>>> 	MADVISE_RANGE_ALL,
>>> };
>>>
>>> struct madvise_range {
>>> 	const void *addr;
>>> 	size_t size;
>>> 	int advice;
>>> };
>>>
>>> struct madvise_ranges {
>>> 	const struct madvise_range *arr;
>>> 	size_t count;
>>> };
>>>
>>> struct madvise_range_stats {
>>> 	struct madvise_range range;
>>> 	bool success;
>>> 	bool partial;
>>> };
>>>
>>> struct madvise_ranges_stats {
>>> 	unsigned long nr_mappings_advised;
>>> 	unsigned long nr_mappings_skipped;
>>> 	unsigned long nr_pages_advised;
>>> 	unsigned long nr_pages_skipped;
>>> 	unsigned long nr_gaps;
>>>
>>> 	/*
>>> 	 * Useful for madvise_range_control->ignore_errors:
>>> 	 *
>>> 	 * If non-NULL, points to an array of size equal to the number of ranges
>>> 	 * specified. Indiciates the specified range, whether it succeeded, and
>>> 	 * whether that success was partial (that is, the range specified
>>> 	 * multiple mappings, only some of which had advice applied
>>> 	 * successfully).
>>> 	 *
>>> 	 * Not valid for MADVISE_RANGE_ALL.
>>> 	 */
>>>  	struct madvise_range_stats *per_range_stats;
>>>
>>> 	/* Error details. */
>>> 	int err;
>>> 	unsigned long failed_address;
>>> 	size_t offset; /* If multi, at which offset did this occur? */
>>> };
>>>
>>> struct madvise_ranges_control {
>>> 	int version; /* Allow future updates to API. */
>>>
>>> 	enum madvise_range_type type;
>>>
>>> 	union {
>>> 		struct madvise_range range; /* MADVISE_RANGE_SINGLE */
>>> 		struct madvise_ranges ranges; /* MADVISE_RANGE_MULTI */
>>> 		struct all { /* MADVISE_RANGE_ALL */
>>> 			int advice;
>>> 			/*
>>> 			 * If set, also have all future mappings have this applied by default.
>>> 			 *
>>> 			 * Only whitelisted advice may set this, otherwise -EINVAL will be returned.
>>> 			 */
>>> 			bool set_default;
>>> 		};
>>> 	};
>>> 	struct madvise_ranges_stats *stats; /* If non-NULL, report information about operation. */
>>>
>>> 	int pidfd; /* If is_remote set, the remote process. */
>>>
>>> 	/* Options. */
>>> 	bool is_remote :1; /* Target remote process as specified by pidfd. */
>>> 	bool ignore_errors :1; /* If error occurs applying advice, carry on to next VMA. */
>>> 	bool single_mapping_only :1; /* Error out if any range is not a single VMA. */
>>> 	bool stop_on_gap :1; /* Stop operation if input range includes unmapped memory. */
>>> };
>>>
>>> So the user can specify whether to apply advice to a single range,
>>> multiple, or the whole address space, with real control over how the operation proceeds.
>>>
>>
>> For single range, we have madvise, for multiple ranges we have process_madvise,
>> we can have a very very simple solution for whole address space with prctl.
> 
> With respect, I suggest you read through my justifications a little more
> carefully :)
> 
> What happens for a single range when you want to ignore errors? You just can't
> do it.  What happens if you want to actually determine if an error arose or
> whether a gap appeared (-ENOMEM happens on gaps, regardless of whether any
> operation failed or not)? You can't.
> 
> process_madvise(), a function I personally expanded very significantly and
> actually made it possible to be used in this way, is limited in:
> 
> 1. It only allows single advice to be applied to each range.
> 2. It's limited to 8 operations at a time.
> 
> Also neither allow you to sensibly apply something to the _entire address
> space_, ignoring errors.
> 
> Also neither allow you to 'set default' in the all casae.
> 
> Not to mention the ability to actually determine if gaps occurred, more details
> about errors, etc.
> 
> I'm essentially talking about a fixed madvise().
> 
>>
>> IMHO, above is really not be needed (but I might be wrong :)), this will introduce a
>> lot of code to solve something that can be done in a very very simple way and it will introduce
>> another syscall when prctl is designed for this, I understand that you don't like prctl,
>> but it is there.
> 
> By this argument we don't need any system calls relating to processes and
> instead should use prctl()... I mean mmap() could be a prctl() right? munmap()?
> mremap()? The list goes on...
> 
> So no, I don't think prctl() is 'designed for this' at all. I think it's a bad
> generic interface used to brush stuff under the carpet at we don't want to put
> anywhere else.
> 
> However in the case of the problem you're trying to solve, we might perhaps
> decide prctl() is the only sensible (if yucky) place for it.
> 
> But with my proposal above, we can actually have two wins - we both enable your
> use case and provide a general means of doing 'madvise by default' and 'mass
> madvise'.
> 
> At any rate I'm not saying it's right, or sane, but what I am saying is I feel
> you have not refuted this as a concept :)
> 
>>
>> I have added below what patch 1 of 6 would look like after incorporating all your feedback.
>> (Thanks for all the feedback, really appreciate it!!)
>> Main difference from the current revisions:
>> - no more flags2.
>> - no more MMF2_...
>> - renamed policy to PR_DEFAULT_MADV_HUGEPAGE
>> - mmap_write_lock_killable acquired in PR_GET_THP_POLICY
>> - mmap_write lock fixed in PR_SET_THP_POLICY
>> - check if hugepage_global_enabled is enabled in the call and account for s390
>> - set mm->def_flags VM_HUGEPAGE and VM_NOHUGEPAGE according to the policy in the way
>>   done by madvise(). I believe VM merge will not be broken in this way, please let me know
>>   otherwise.
>> - process_default_madv_hugepage function that does for_each_vma and calls hugepage_madvise.
>>   (I can move it to vma.c or any other file you prefer).
> 
> Thanks for taking on board the review, it's much appreciated and I hope you can
> agree this is a big improvement :>)
> 
>>
>> Please let me know if this looks acceptable and I can send this as RFC v3 for all the
>> 6 patches (the rest are done in a similar way to below)
> 
> I think it will be useful to see this as an RFC notwithstanding my idea above (I
> was saying to David previously it'd be useful to just see how it is now with
> these changes).
> 
> Then that gives us the basis for further conversation. Thanks for helping us
> iterate towards a solution here!
> 
> I've commented inline below though you need to address the duplication issue.
> 
> Thanks!
> 

Ack on all the points you mentioned above.

Also agree on the review below, I made it as draft to check if it would work
properly but need to fix the duplication, abstraction, break and the assert
(I went through all the comments while writing below but missed the assert
one, sorry about that!).

Let me clean up the whole thing with a much better cover letter and send a RFC v3
on Monday.

Thanks again for the quick and really valuable feedback, its looking a lot better
than the current version!

Thanks,
Usama

>>
>>
>>
>>
>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>> index 2f190c90192d..a8c3ce15a504 100644
>> --- a/include/linux/huge_mm.h
>> +++ b/include/linux/huge_mm.h
>> @@ -260,6 +260,8 @@ static inline unsigned long thp_vma_suitable_orders(struct vm_area_struct *vma,
>>         return orders;
>>  }
>>
>> +void process_default_madv_hugepage(struct mm_struct *mm, int advice);
>> +
>>  unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>>                                          unsigned long vm_flags,
>>                                          unsigned long tva_flags,
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 43748c8f3454..436f4588bce8 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -466,7 +466,7 @@ extern unsigned int kobjsize(const void *objp);
>>  #define VM_NO_KHUGEPAGED (VM_SPECIAL | VM_HUGETLB)
>>
>>  /* This mask defines which mm->def_flags a process can inherit its parent */
>> -#define VM_INIT_DEF_MASK       VM_NOHUGEPAGE
>> +#define VM_INIT_DEF_MASK       (VM_HUGEPAGE | VM_NOHUGEPAGE)
>>
>>  /* This mask represents all the VMA flag bits used by mlock */
>>  #define VM_LOCKED_MASK (VM_LOCKED | VM_LOCKONFAULT)
>> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
>> index e76bade9ebb1..f1836b7c5704 100644
>> --- a/include/linux/mm_types.h
>> +++ b/include/linux/mm_types.h
>> @@ -1703,6 +1703,7 @@ enum {
>>                                         /* leave room for more dump flags */
>>  #define MMF_VM_MERGEABLE       16      /* KSM may merge identical pages */
>>  #define MMF_VM_HUGEPAGE                17      /* set when mm is available for khugepaged */
>> +#define MMF_VM_HUGEPAGE_MASK   (1 << MMF_VM_HUGEPAGE)
>>
>>  /*
>>   * This one-shot flag is dropped due to necessity of changing exe once again
>> @@ -1742,7 +1743,8 @@ enum {
>>
>>  #define MMF_INIT_MASK          (MMF_DUMPABLE_MASK | MMF_DUMP_FILTER_MASK |\
>>                                  MMF_DISABLE_THP_MASK | MMF_HAS_MDWE_MASK |\
>> -                                MMF_VM_MERGE_ANY_MASK | MMF_TOPDOWN_MASK)
>> +                                MMF_VM_MERGE_ANY_MASK | MMF_TOPDOWN_MASK |\
>> +                                MMF_VM_HUGEPAGE_MASK)
>>
>>  static inline unsigned long mmf_init_flags(unsigned long flags)
>>  {
>> diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
>> index 15c18ef4eb11..15aaa4db5ff8 100644
>> --- a/include/uapi/linux/prctl.h
>> +++ b/include/uapi/linux/prctl.h
>> @@ -364,4 +364,8 @@ struct prctl_mm_map {
>>  # define PR_TIMER_CREATE_RESTORE_IDS_ON                1
>>  # define PR_TIMER_CREATE_RESTORE_IDS_GET       2
>>
>> +#define PR_SET_THP_POLICY              78
>> +#define PR_GET_THP_POLICY              79
>> +#define PR_DEFAULT_MADV_HUGEPAGE       0
>> +
>>  #endif /* _LINUX_PRCTL_H */
>> diff --git a/kernel/sys.c b/kernel/sys.c
>> index c434968e9f5d..4fe860b0ff25 100644
>> --- a/kernel/sys.c
>> +++ b/kernel/sys.c
>> @@ -2658,6 +2658,44 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
>>                         clear_bit(MMF_DISABLE_THP, &me->mm->flags);
>>                 mmap_write_unlock(me->mm);
>>                 break;
>> +       case PR_GET_THP_POLICY:
>> +               if (arg2 || arg3 || arg4 || arg5)
>> +                       return -EINVAL;
>> +               if (mmap_write_lock_killable(me->mm))
>> +                       return -EINTR;
>> +               if (me->mm->def_flags & VM_HUGEPAGE)
>> +                       error = PR_DEFAULT_MADV_HUGEPAGE;
>> +               mmap_write_unlock(me->mm);
>> +               break;
>> +       case PR_SET_THP_POLICY:
>> +               if (arg3 || arg4 || arg5)
>> +                       return -EINVAL;
>> +               if (mmap_write_lock_killable(me->mm))
>> +                       return -EINTR;
>> +               switch (arg2) {
>> +               case PR_DEFAULT_MADV_HUGEPAGE:
>> +                       if (!hugepage_global_enabled())
>> +                               error = -EPERM;
>> +#ifdef CONFIG_S390
>> +                       /*
>> +                       * qemu blindly sets MADV_HUGEPAGE on all allocations, but s390
>> +                       * can't handle this properly after s390_enable_sie, so we simply
>> +                       * ignore the madvise to prevent qemu from causing a SIGSEGV.
>> +                       */
>> +                       else if (mm_has_pgste(vma->vm_mm))
>> +                               error = -EPERM;
>> +#endif
> 
> No, we definitely don't want to duplicate this. You need to share this code with
> madvise(). This is classic duplication, and loathesome specialisation anyway
> that we want to limit to one place _only_.
> 
>> +                       else {
>> +                               me->mm->def_flags &= ~VM_NOHUGEPAGE;
>> +                               me->mm->def_flags |= VM_HUGEPAGE;
>> +                               process_default_madv_hugepage(me->mm, MADV_HUGEPAGE);
> 
> Nit, but let's at least abstract out the mm here.
> 
>> +                       }
>> +                       break;
>> +               default:
>> +                       error = -EINVAL;
> 
> Thanks for fixing this! But technically you should have a break here too.
> 
>> +               }
>> +               mmap_write_unlock(me->mm);
>> +               break;
>>         case PR_MPX_ENABLE_MANAGEMENT:
>>         case PR_MPX_DISABLE_MANAGEMENT:
>>                 /* No longer implemented: */
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 2780a12b25f0..2b9a3e280ae4 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -98,6 +98,18 @@ static inline bool file_thp_enabled(struct vm_area_struct *vma)
>>         return !inode_is_open_for_write(inode) && S_ISREG(inode->i_mode);
>>  }
>>
>> +void process_default_madv_hugepage(struct mm_struct *mm, int advice)
>> +{
>> +       struct vm_area_struct *vma;
>> +       unsigned long vm_flags;
>> +
> 
> Please add the discussed assert for the mmap lock :)
> 
>> +       VMA_ITERATOR(vmi, mm, 0);
>> +       for_each_vma(vmi, vma) {
>> +               vm_flags = vma->vm_flags;
>> +               hugepage_madvise(vma, &vm_flags, advice);
>> +       }
>> +}
>> +
>>  unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>>                                          unsigned long vm_flags,
>>                                          unsigned long tva_flags,
>>
>>
>>
>>
>>> This basically solves the problem this series tries to address while also
>>> providing an improved madvise() API at the same time.
>>>
>>> Thoughts? Have I finally completely lost my mind?
>>
>>

