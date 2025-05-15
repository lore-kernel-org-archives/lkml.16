Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45D82153E1;
	Thu, 15 May 2025 15:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747322937; cv=none; b=g25JqiDwDlZ43u5+eqohTjZcreDlMyU8+bnFsoUVpdKHQYBBeEmXtkTbSptnpqTuPmcNByMrpP1DQ80+mBcShl30HgsoFrK2FsJf74UryVEG7PZ/30q8LqtLvORbS1mz1LAU3vGfvK6dSmWkzEpbtFebWi3G1ReHyRZVdGR+ZkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747322937; c=relaxed/simple;
	bh=h6Wl5IuSa47/C9/SH7TFfsIPXIqa88Ii3G8oV5HUTnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j4Q2WvG78Vip2WPZtdp4F1vq9FUXVauUP1kL35n51PUeEivoJB/dx/wG/Ph6oVuik6ynkRIbJ94hXeBlU7MJjpQPw/AUQYGOHYcezF4KERiQSoKNv7scPDv7GZStr/FOn0O2rCFHA9upKn9W0DZnOGB797LhaPa7q+UFVlu/198=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXGiLDNd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXGiLDNd"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-442ea95f738so8239835e9.3;
        Thu, 15 May 2025 08:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747322933; x=1747927733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D7AAD3LdsvKo5tA4lpWbxFHUp+Gt+Z7ZzZD2NXLS1po=;
        b=JXGiLDNdgqR7ohah2x0J6GckfGVdOmKR1gQZclkVzZa+QVXFvcttfjHAm5+rfngWju
         TocGUvSmuTd1sSsMVOR/YR1v3eTCgUsM6aWcFvaV+V+CJNIFS3yPuh9d7hJvHxYD1S8h
         HLrlyb4MqK8XvXFIyh9PTrJqVE/1YMC5dTYUm2u+UAq0VVDslhyd4pnCK8hu+Nj7JVdp
         fRw0Y3L6GqzCk5SBqrutADLkjHAZMqgMLZFCO9tWqfHG/vTlaz4dWWQxAoOgMg5tAT12
         x2v0piCtxSRJTlaSlnDwRRYREZcYS8rA8h2nq4e1whr+ky1ar0hRfhtWzDwdYtqCk/ne
         cGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747322933; x=1747927733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D7AAD3LdsvKo5tA4lpWbxFHUp+Gt+Z7ZzZD2NXLS1po=;
        b=w0B7CwyMtGeXfl8axRSvZ+9/JoCR4UUpUCyjZimO+ztmYWWWAVQ+W5R5l2+MDN64Aj
         VNxr/Y0OCto5BRjkakOBsuRInxVDuYFTwBRTeE23UmiIw7wQfmNggAXuhjbKnCq/mQ0/
         TEJ+xs01E41+gkiqaCQv8A2+Zc8urhs/Y/CkvbZudGI1WrFMjmXVGng6InZtaeXz5RiK
         dj/nMg3J7xhJLgijV8GMKSXZ5NGBrNwZhGEaH4oQVyoq69Vz1tEFDxWQLOuUcspVyL1i
         1qqxTBX/SJFE7wMKzy5KZBDJRblG6+uL4IOXo4WZiZpqqA0fyyJJUzkF2mhRlnYYI4V3
         375A==
X-Forwarded-Encrypted: i=1; AJvYcCVdrK+M4jmnEyMPmRsErGAe+lX0aHsCyesyaEkbDQiCbU99vpoc35zq74NwGc9ax4sCfFTCM6zUZA3/1GXe@vger.kernel.org, AJvYcCXc6VMIU7VYQgklw6oZ6mUvAxZ9sSmEmqxZsnBveUJl/R1QphRAg01UTEFJH3wpGU7jY79fihJmEI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyprVL7fT84eTssv+4+Gs+5NPUvbFEwyb29v6jmx9s6bGEVusbH
	yZ8Hv6w+/xHOGymyDWSpcEej63Uwm3keJ/zZRlLxe4IC4ZY+lKUL
X-Gm-Gg: ASbGncv7tHip7DJfu6LvcNod6fqWM/pgU0zgLLLsOkiJJkS8P10gQy/BXrf8d6ZG6HI
	UVwdD2ubze3OyDGaiKFM7KWIVayzkSpP2U7Vt0NxK2S/gjf87SIpUPPmNU17o7bUrxG93Th2wMw
	plgteXgzIA/QOor+yd5DYzYV/HbVUh9g9l00M7JS9i8IgKBa8iFjdPBkh+NJvxP6WWCMhBTS5Gw
	FRAjeqrDis7PeYFmXZIUVPfEU67J7RyiPj7HKSkRzDzU431xBXO/48j9bSoNAO3Tf1l0aU6laTa
	SJ19I+I/UQJpk5U5QjoYJEOcnQxnGmv5os6wGkptqcEULdUuCxFGQiXrGqXy/VYNVgHDMKfznxG
	ugN9FncDzK28hLTZMGisPypiQJO0btOzJ/fcZlY8QLT5dNierkqFPJgGAhA==
X-Google-Smtp-Source: AGHT+IGyhRJm6hIscXI54RRLFX6yhkPE2B+310LzxI3caTo7gC5vMA58aEy8uRRlbA4OmO7DFKD9QQ==
X-Received: by 2002:a05:600c:1385:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-442f20b9725mr70211705e9.7.1747322932687;
        Thu, 15 May 2025 08:28:52 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:b211:ad00:1096:2c00:b223:9747? ([2a01:4b00:b211:ad00:1096:2c00:b223:9747])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd50ee03sm379325e9.14.2025.05.15.08.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:28:52 -0700 (PDT)
Message-ID: <ddc0dd46-8541-4d4a-ac59-287e11e1d3ff@gmail.com>
Date: Thu, 15 May 2025 16:28:51 +0100
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
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
 linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 riel@surriel.com, ziy@nvidia.com, laoar.shao@gmail.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <20250515133519.2779639-2-usamaarif642@gmail.com>
 <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 15/05/2025 15:40, Lorenzo Stoakes wrote:
> Overall I feel this series should _DEFINITELY_ be an RFC. This is pretty
> outlandish stuff and needs discussion.
> 

There was a lot of discussion in the
original patch (https://lore.kernel.org/linux-mm/20250507141132.2773275-1-usamaarif642@gmail.com/).
And there was a conclusion to go with Davids suggestion (https://lore.kernel.org/all/13b68fa0-8755-43d8-8504-d181c2d46134@gmail.com/)
and the following reply (https://lore.kernel.org/all/97702ff0-fc50-4779-bfa8-83dc42352db1@redhat.com/)


> You're basically making it so /sys/kernel/mm/transparent_hugepage/enabled =
> never is completely ignored and overridden. Which I am emphatically not
> comfortable with. And you're not saying that you're doing this,
> anywhere. Which is wrong.

No I am not.

hugepage_global_always and hugepage_global_enabled will evaluate to false
and you will not get a hugepage.

> 
> Also, this patch is quite broken.
> 
> I'm hugely not a fan of adding mm_struct->flags2, and I'm even more not a
> fan of you not mentioning such a completely fundamental change in the
> commit mesage.

This was also discussed in the original series.

If there is a very serious issue with going with flags2, I can try and just
reuse mm->flags bit 18, but it will mean that only MMF2_THP_VMA_DEFAULT_HUGE
can be implemented and not MMF2_THP_VMA_DEFAULT_NOHUGE

We have run out of bits in mm->flags.
If there is something new that we are developing that needs another bit,
we either need to add flags2 (I don't care about the name, can be anything),
or we need to limit it to 64 bit machines only.

If the maintainers have an issue with flags2. I can limit this to 64 bits,
it will probably mean ifdefs everywhere...

> 
> This patch also breaks VMA merging and the VMA tests...
> 

Its doing the same as KSM as suggested by David. Does KSM break these tests?
Is there some specific test you can point to that I can run that is breaking
with this patch and not without it?


> I really feel this series needs to be an RFC until we can get some
> consensus on how to approach this.

There was consensus in https://lore.kernel.org/all/97702ff0-fc50-4779-bfa8-83dc42352db1@redhat.com/

> 
> On Thu, May 15, 2025 at 02:33:30PM +0100, Usama Arif wrote:
>> This is set via the new PR_SET_THP_POLICY prctl.
> 
> What is?
> 
> You're making very major changes here, including adding a new flag to
> mm_struct (!!) and the explanation/justification for this is missing.
> 

I have added the justification in your reply to the coverletter.

>> This will set the MMF2_THP_VMA_DEFAULT_HUGE process flag
>> which changes the default of new VMAs to be VM_HUGEPAGE. The
>> call also modifies all existing VMAs that are not VM_NOHUGEPAGE
>> to be VM_HUGEPAGE. The policy is inherited during fork+exec.
> 
> So you can only set this flag?
> 

?? 

>>
>> This allows systems where the global policy is set to "madvise"
>> to effectively have THPs always for the process. In an environment
>> where different types of workloads are stacked on the same machine,
>> this will allow workloads that benefit from always having hugepages
>> to do so, without regressing those that don't.
> 
> Again, this explanation really makes no sense at all to me, I don't really
> know what you mean, you're not going into what you're doing in this change,
> this is just a very unclear commit message.
> 

I hope this is answered in my reply to your coverletter.
 
>>
>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>> ---
>>  include/linux/huge_mm.h                       |  3 ++
>>  include/linux/mm_types.h                      | 11 +++++++
>>  include/uapi/linux/prctl.h                    |  4 +++
>>  kernel/fork.c                                 |  1 +
>>  kernel/sys.c                                  | 21 ++++++++++++
>>  mm/huge_memory.c                              | 32 +++++++++++++++++++
>>  mm/vma.c                                      |  2 ++
>>  tools/include/uapi/linux/prctl.h              |  4 +++
>>  .../trace/beauty/include/uapi/linux/prctl.h   |  4 +++
>>  9 files changed, 82 insertions(+)
>>
>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>> index 2f190c90192d..e652ad9ddbbd 100644
>> --- a/include/linux/huge_mm.h
>> +++ b/include/linux/huge_mm.h
>> @@ -260,6 +260,9 @@ static inline unsigned long thp_vma_suitable_orders(struct vm_area_struct *vma,
>>  	return orders;
>>  }
>>
>> +void vma_set_thp_policy(struct vm_area_struct *vma);
> 
> This is a VMA-specific function but you're putting it in huge_mm.h? Why
> can't 
this be in vma.h or vma.c?
> 

Sure can move it there.

>> +void process_vmas_thp_default_huge(struct mm_struct *mm);
> 
> 'vmas' is redundant here.
> 

Sure.
>> +
>>  unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>>  					 unsigned long vm_flags,
>>  					 unsigned long tva_flags,
>> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
>> index e76bade9ebb1..2fe93965e761 100644
>> --- a/include/linux/mm_types.h
>> +++ b/include/linux/mm_types.h
>> @@ -1066,6 +1066,7 @@ struct mm_struct {
>>  		mm_context_t context;
>>
>>  		unsigned long flags; /* Must use atomic bitops to access */
>> +		unsigned long flags2;
> 
> 
> Ugh, god really??
> 
> I really am not a fan of adding flags2 just to add a prctl() feature like
> this. This is crazy.
> 
> Also this is a TERRIBLE name. I mean, no please PLEASE no.
> 
> Do we really have absolutely no choice but to add a new flags field here?
> 
> It again doesn't help that you don't mention nor even try to justify this
> in the commit message or cover letter.
> 

And again, I hope my reply to your email has given you the justification.

> If this is a 32-bit kernel vs. 64-bit kernel thing so we 'ran out of bits',
> let's just go make this flags field 64-bit on 32-bit kernels.
> 
> I mean - I'm kind of insisting we do that to be honest. Because I really
> don't like this.


If the maintainers want this, I will make it a 64 bit only feature. We
are only using it for 64 bit servers. But it will probably mean ifdef
config 64 bit in a lot of places.

> 
> Also if we _HAVE_ to have this, shouldn't we duplicate that comment about
> atomic bitops?...
> 

Sure

>>
>>  #ifdef CONFIG_AIO
>>  		spinlock_t			ioctx_lock;
>> @@ -1744,6 +1745,11 @@ enum {
>>  				 MMF_DISABLE_THP_MASK | MMF_HAS_MDWE_MASK |\
>>  				 MMF_VM_MERGE_ANY_MASK | MMF_TOPDOWN_MASK)
>>
>> +#define MMF2_THP_VMA_DEFAULT_HUGE		0
> 
> I thought the whole idea was to move away from explicitly refrencing 'THP'
> in a future where large folios are implicit and now we're saying 'THP'.
> 
> Anyway the 'VMA' is totally redundant here.
> 

Sure, I can remove VMA.
I see THP everywhere in the kernel code.
Its mentioned 108 times in transhuge.rst alone :)
If you have any suggestion to rename this flag, happy to take it :)

>> +#define MMF2_THP_VMA_DEFAULT_HUGE_MASK		(1 << MMF2_THP_VMA_DEFAULT_HUGE)
> 
> Do we really need explicit trivial mask declarations like this?
> 

I have followed the convention that has existed in this file, please see below
links :)
https://elixir.bootlin.com/linux/v6.14.6/source/include/linux/mm_types.h#L1645
https://elixir.bootlin.com/linux/v6.14.6/source/include/linux/mm_types.h#L1623
https://elixir.bootlin.com/linux/v6.14.6/source/include/linux/mm_types.h#L1603
https://elixir.bootlin.com/linux/v6.14.6/source/include/linux/mm_types.h#L1582

 
>> +
>> +#define MMF2_INIT_MASK		(MMF2_THP_VMA_DEFAULT_HUGE_MASK)
> 
>> +
>>  static inline unsigned long mmf_init_flags(unsigned long flags)
>>  {
>>  	if (flags & (1UL << MMF_HAS_MDWE_NO_INHERIT))
>> @@ -1752,4 +1758,9 @@ static inline unsigned long mmf_init_flags(unsigned long flags)
>>  	return flags & MMF_INIT_MASK;
>>  }
>>
>> +static inline unsigned long mmf2_init_flags(unsigned long flags)
>> +{
>> +	return flags & MMF2_INIT_MASK;
>> +}
>> +
>>  #endif /* _LINUX_MM_TYPES_H */
>> diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
>> index 15c18ef4eb11..325c72f40a93 100644
>> --- a/include/uapi/linux/prctl.h
>> +++ b/include/uapi/linux/prctl.h
>> @@ -364,4 +364,8 @@ struct prctl_mm_map {
>>  # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
>>  # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
>>
>> +#define PR_SET_THP_POLICY		78
>> +#define PR_GET_THP_POLICY		79
>> +#define PR_THP_POLICY_DEFAULT_HUGE	0
>> +
>>  #endif /* _LINUX_PRCTL_H */
>> diff --git a/kernel/fork.c b/kernel/fork.c
>> index 9e4616dacd82..6e5f4a8869dc 100644
>> --- a/kernel/fork.c
>> +++ b/kernel/fork.c
>> @@ -1054,6 +1054,7 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
>>
>>  	if (current->mm) {
>>  		mm->flags = mmf_init_flags(current->mm->flags);
>> +		mm->flags2 = mmf2_init_flags(current->mm->flags2);
>>  		mm->def_flags = current->mm->def_flags & VM_INIT_DEF_MASK;
>>  	} else {
>>  		mm->flags = default_dump_filter;
>> diff --git a/kernel/sys.c b/kernel/sys.c
>> index c434968e9f5d..1115f258f253 100644
>> --- a/kernel/sys.c
>> +++ b/kernel/sys.c
>> @@ -2658,6 +2658,27 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
>>  			clear_bit(MMF_DISABLE_THP, &me->mm->flags);
>>  		mmap_write_unlock(me->mm);
>>  		break;
>> +	case PR_GET_THP_POLICY:
>> +		if (arg2 || arg3 || arg4 || arg5)
>> +			return -EINVAL;
>> +		if (!!test_bit(MMF2_THP_VMA_DEFAULT_HUGE, &me->mm->flags2))
> 
> I really don't think we need the !!? Do we?

I have followed the convention that has existed in this file already,
please see:
https://elixir.bootlin.com/linux/v6.14.6/source/kernel/sys.c#L2644

> 
> Shouldn't we lock the mm when we do this no? Can't somebody change this?
> 

It wasn't locked in PR_GET_THP_DISABLE
https://elixir.bootlin.com/linux/v6.14.6/source/kernel/sys.c#L2644

I can acquire do mmap_write_lock_killable the same as PR_SET_THP_POLICY
in the next series.

I can also add the lock in PR_GET_THP_DISABLE.

>> +			error = PR_THP_POLICY_DEFAULT_HUGE;
>> +		break;
>> +	case PR_SET_THP_POLICY:
>> +		if (arg3 || arg4 || arg5)
>> +			return -EINVAL;
>> +		if (mmap_write_lock_killable(me->mm))
>> +			return -EINTR;
>> +		switch (arg2) {
>> +		case PR_THP_POLICY_DEFAULT_HUGE:
>> +			set_bit(MMF2_THP_VMA_DEFAULT_HUGE, &me->mm->flags2);
>> +			process_vmas_thp_default_huge(me->mm);
>> +			break;
>> +		default:
>> +			return -EINVAL;
>> +		}
>> +		mmap_write_unlock(me->mm);
>> +		break;
>>  	case PR_MPX_ENABLE_MANAGEMENT:
>>  	case PR_MPX_DISABLE_MANAGEMENT:
>>  		/* No longer implemented: */
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 2780a12b25f0..64f66d5295e8 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -98,6 +98,38 @@ static inline bool file_thp_enabled(struct vm_area_struct *vma)
>>  	return !inode_is_open_for_write(inode) && S_ISREG(inode->i_mode);
>>  }
>>
>> +void vma_set_thp_policy(struct vm_area_struct *vma)
>> +{
>> +	struct mm_struct *mm = vma->vm_mm;
>> +
>> +	if (test_bit(MMF2_THP_VMA_DEFAULT_HUGE, &mm->flags2))
>> +		vm_flags_set(vma, VM_HUGEPAGE);
>> +}
>> +
>> +static void vmas_thp_default_huge(struct mm_struct *mm)
>> +{
>> +	struct vm_area_struct *vma;
>> +	unsigned long vm_flags;
>> +
>> +	VMA_ITERATOR(vmi, mm, 0);
> 
> This is a declaration, it should be grouped with declarations...
> 

Sure, will make the change in next version.

Unfortunately checkpatch didn't complain.

>> +	for_each_vma(vmi, vma) {
>> +		vm_flags = vma->vm_flags;
>> +		if (vm_flags & VM_NOHUGEPAGE)
>> +			continue;
> 
> Literally no point in you putting vm_flags as a separate variable here.
> 

Sure, will make the change in next version.

> So if you're not overriding VM_NOHUGEPAGE, the whole point of this exercise
> is to override global 'never'?
> 

Again, I am not overriding never. 

hugepage_global_always and hugepage_global_enabled will evaluate to false
and you will not get a hugepage.


> I'm really concerned about this.
> 
>> +		vm_flags_set(vma, VM_HUGEPAGE);
>> +	}
>> +}
> 
> Do we have an mmap write lock established here? Can you confirm that? Also
> you should add an assert for that here.
> 

Yes I do, its only called in PR_SET_THP_POLICY where mmap_write lock was taken.
I can add an assert if it helps.

>> +
>> +void process_vmas_thp_default_huge(struct mm_struct *mm)
>> +{
>> +	if (test_bit(MMF2_THP_VMA_DEFAULT_HUGE, &mm->flags2))
>> +		return;
>> +
>> +	set_bit(MMF2_THP_VMA_DEFAULT_HUGE, &mm->flags2);
>> +	vmas_thp_default_huge(mm);
>> +}
>> +
>> +
>>  unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>>  					 unsigned long vm_flags,
>>  					 unsigned long tva_flags,
>> diff --git a/mm/vma.c b/mm/vma.c
>> index 1f2634b29568..101b19c96803 100644
>> --- a/mm/vma.c
>> +++ b/mm/vma.c
>> @@ -2476,6 +2476,7 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
>>  	if (!vma_is_anonymous(vma))
>>  		khugepaged_enter_vma(vma, map->flags);
>>  	ksm_add_vma(vma);
>> +	vma_set_thp_policy(vma);
> 
> You're breaking VMA merging completely by doing this here...
> 
> Now I can map one VMA with this policy set, then map another immediately
> next to it and - oops - no merge, ever, because the VM_HUGEPAGE flag is not
> set in the new VMA on merge attempt.
> 
> I realise KSM is just as broken (grr) but this doesn't justify us
> completely breaking VMA merging here.

I think this answers it. Its doing the same as KSM.

> 
> You need to set earlier than this. Then of course a driver might decide to
> override this, so maybe then we need to override that.
> 
> But then we're getting into realms of changing fundamental VMA code _just
> for this feature_.
> 
> Again I'm iffy about this. Very.
> 
> Also you've broken the VMA userland tests here:
> 
> $ cd tools/testing/vma
> $ make
> ...
> In file included from vma.c:33:
> ../../../mm/vma.c: In function ‘__mmap_new_vma’:
> ../../../mm/vma.c:2486:9: error: implicit declaration of function ‘vma_set_thp_policy’; did you mean ‘vma_dup_policy’? [-Wimplicit-function-declaration]
>  2486 |         vma_set_thp_policy(vma);
>       |         ^~~~~~~~~~~~~~~~~~
>       |         vma_dup_policy
> make: *** [<builtin>: vma.o] Error 1
> 
> You need to create stubs accordingly.
> 

Thanks will do.

>>  	*vmap = vma;
>>  	return 0;
>>
>> @@ -2705,6 +2706,7 @@ int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *vma,
>>  	mm->map_count++;
>>  	validate_mm(mm);
>>  	ksm_add_vma(vma);
>> +	vma_set_thp_policy(vma);
> 
> You're breaking merging again... This is quite a bad case too as now you'll
> have totally fragmented brk VMAs no?
> 

Again doing it the same as KSM.

> We can't have it implemented this way.
> 
>>  out:
>>  	perf_event_mmap(vma);
>>  	mm->total_vm += len >> PAGE_SHIFT;
>> diff --git a/tools/include/uapi/linux/prctl.h b/tools/include/uapi/linux/prctl.h
>> index 35791791a879..f5945ebfe3f2 100644
>> --- a/tools/include/uapi/linux/prctl.h
>> +++ b/tools/include/uapi/linux/prctl.h
>> @@ -328,4 +328,8 @@ struct prctl_mm_map {
>>  # define PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC	0x10 /* Clear the aspect on exec */
>>  # define PR_PPC_DEXCR_CTRL_MASK		0x1f
>>
>> +#define PR_SET_THP_POLICY		78
>> +#define PR_GET_THP_POLICY		79
>> +#define PR_THP_POLICY_DEFAULT_HUGE	0
>> +
>>  #endif /* _LINUX_PRCTL_H */
>> diff --git a/tools/perf/trace/beauty/include/uapi/linux/prctl.h b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
>> index 15c18ef4eb11..325c72f40a93 100644
>> --- a/tools/perf/trace/beauty/include/uapi/linux/prctl.h
>> +++ b/tools/perf/trace/beauty/include/uapi/linux/prctl.h
>> @@ -364,4 +364,8 @@ struct prctl_mm_map {
>>  # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
>>  # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
>>
>> +#define PR_SET_THP_POLICY		78
>> +#define PR_GET_THP_POLICY		79
>> +#define PR_THP_POLICY_DEFAULT_HUGE	0
>> +
>>  #endif /* _LINUX_PRCTL_H */
>> --
>> 2.47.1
>>

