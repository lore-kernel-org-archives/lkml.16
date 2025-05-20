Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FBA24E4A4;
	Tue, 20 May 2025 14:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747753061; cv=none; b=Fh/Ny+3w8vpYB02oYXYkFxqQ4qxPrUk2BtpgVEzl212bknAykg+Nkjov8YnujuGw87soTs+anEwWTO6lpPM7r0/hdToq0VjE9/fD57Ri672z3LfaAlfFoxWG12cd9Jh6nyeUWA7JSw0/N4Hr2NO4vqvgUa1BD0dtlsQ5RwXPLlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747753061; c=relaxed/simple;
	bh=cij4uuiDuZVZQTPbEd/ZprWqMclxmm1xVHu26/6GCjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QOWl6e5FPcd9ERH6Er+UEnV0tt0QNHUG1guCOn3+a4NCL9dIBfOZFMBJKg4M/+jy6QuUifShzGvOUuM7buTgwkj0TiAUZh1KDvVkArA1C96xX6f4nRFstgQB+tHfHeWgU5DMIUYUccI5v3tDWIhydONUT3KzQDkapEioEnoii7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZcQdLI1r; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZcQdLI1r"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad572ba1347so295934566b.1;
        Tue, 20 May 2025 07:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747753057; x=1748357857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IajgCekFJONzao3c/Mri5HJ7aoxC+foi/7AqMFd+OWU=;
        b=ZcQdLI1rgxIxnVcGeRfaGZcUVzFWnVjBwbS8AUNdS6pLbCntT30GqtjOnWuriGzKXV
         1bM9YOOdOPsrYj03g8XqWO76UUw0k94eqdytmv4R80hPfMiVOvcqYnbqCeJKLnHUtzIb
         2te/Rn41CjDkNR8rfYEFilwYCcV+HcudsJpbCbjb8HH6zoCVaDZWkgqHXMbbeyMgj8XA
         M8+8ObfNhLOFjgxm/AcE1BZiYnOrfnmGxu1XoKBHsiNuhqsnyal8JxjLn807P5aO7ECQ
         9VcIFjjC0FBIGGd63sQ6HBBpma/GVCfNQVITFrAouNK/c/Gjhgut0B0YHIrliOm/QJ70
         dEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747753057; x=1748357857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IajgCekFJONzao3c/Mri5HJ7aoxC+foi/7AqMFd+OWU=;
        b=KheFYesMA/GUiJi2AGaMfjexniKggsh0H7Sn4+vR4uzMMRyHbbhsSXtV9VaFt9bJXH
         ZTHd7CJCpVuUcOqdRgEZATsMTf9JwObY3i9TkfvaQJy5eQpM2CjnIySKn2TyPXtBRBC6
         gWyBJl6ZmfbP8HHBb2X9zkgM0WauJZJ6Q275f+cpfBVoXMhQfYZcUD1VT8FPwre/KElV
         t3Bbk8RuuMgZ6bktEHpHWjdhSK64uG2OcbtUpQJKhIyR43ko1u6DE6EtAeIBiu5aW+Se
         nnyjh1Vit/CK0UPNGv2bFx15w137SgyTN3nwBI2xs+wA1hbKoVISEoy6qEeYz5a/yq/1
         Qppg==
X-Forwarded-Encrypted: i=1; AJvYcCUVJuWGLd5dH0r6mocbeDsyXyLOzlJHD5F1GDFz2TtY+iOGNZsyK59dRN/Li8UjBVoIIiyVLc/+sh4=@vger.kernel.org, AJvYcCXpfO91ogiWozSl9CDO+8tmSUnJICyAfJD6n5lsMiPj+1k2RtSHlbTnvwz9hsY5/F24HCHjJWOqyFOTzvDO@vger.kernel.org
X-Gm-Message-State: AOJu0YyEuzcZLVJlJhVcCpzTaJCNUziO2WEFA+MCGYYnHSFP6JjEiQlH
	UVR80Dr0PJOk3yaqv5MryN0s/O4OJFaU/K5cHFpGhY/Dkr26tj8bsG8E
X-Gm-Gg: ASbGncuIyhD1qHZ3Ztew0MZzbW4skfp7AX4Z2x64apLg5+rHx3VmEY4c7X289qOtXmX
	Dy5VoZ7J9C/A2MhI7XSQQZSdWiypctFiiV2/uqqi4NoYm2VWxK/IZkIg9acyLr91ooZW/ClKphB
	Q+eMFVLLEgPDJN90HdSjgp7Qu6Jg209VngTsyQG0bmbDyG9RcNdE3051388TqDag3C0/P4MMTo8
	2UROoASr2jm/TuT+EmVY9rY2czipDe7SW87I7Ol7ghGvKTf9EBILlqp58ACk8yh9kGKL3A8FqfS
	8VaNxAy57Zn8LHIn6ja0/HAICEIF0oiy2QAQAXiY0JKswff5tteL2UUuJ/wgj8HRHDZxDXk/K2K
	K/ci6X9vRBBnhfr93HkSwl/3g
X-Google-Smtp-Source: AGHT+IFUKv/+NdaIlzfh/ttE9lZCb6A245ofH9pugxyKdQVM+d5CP7HrC+FNTyOKq0BC3a57Lx+N+w==
X-Received: by 2002:a17:907:7294:b0:ad5:6337:ba42 with SMTP id a640c23a62f3a-ad56337c96dmr941030966b.46.1747753057000;
        Tue, 20 May 2025 07:57:37 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:1c0a:f3ac:4087:51c8? ([2620:10d:c092:500::7:66a9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d438c3csm735693066b.88.2025.05.20.07.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 07:57:36 -0700 (PDT)
Message-ID: <ad5b93bf-24e6-4b15-9c0d-5c501c74de86@gmail.com>
Date: Tue, 20 May 2025 15:57:35 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] mm: khugepaged: extract vm flag setting outside of
 hugepage_madvise
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
 linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 riel@surriel.com, ziy@nvidia.com, laoar.shao@gmail.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, vbabka@suse.cz, jannh@google.com,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250519223307.3601786-1-usamaarif642@gmail.com>
 <20250519223307.3601786-2-usamaarif642@gmail.com>
 <18be636f-d6a7-4270-b324-22750b3a358c@lucifer.local>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <18be636f-d6a7-4270-b324-22750b3a358c@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 20/05/2025 15:43, Lorenzo Stoakes wrote:
> This commit message is really poor. You're also not mentioning that you're
> changing s390 behaviour?
> 
> On Mon, May 19, 2025 at 11:29:53PM +0100, Usama Arif wrote:
>> This is so that flag setting can be resused later in other functions,
> 
> Typo.
> 
>> to reduce code duplication (including the s390 exception).
>>
>> No functional change intended with this patch.
> 
> I'm pretty sure somebody reviewed that this should just be merged with whatever
> uses this? I'm not sure this is all that valuable as you're not really changing
> this structurally very much.
> 

Please see patch 2 where hugepage_set_vmflags is reused.
I was just trying to follow your feedback from previous revision that the flag
setting and s390 code part is duplicate code and should be common in the prctl
and madvise function.

I realize I messed up the arg not having vma and the order of the if statement.

>>
>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> 
> Yeah I'm not a fan of this patch, it's buggy and really unclear what the
> purpose is here.

No functional change was intended (I realized the order below broke it but can be fixed).

In the previous revision it was:
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
...

Now with this hugepage_set_vmflags, it would be 

+       case PR_SET_THP_POLICY:
+               if (arg3 || arg4 || arg5)
+                       return -EINVAL;
+               if (mmap_write_lock_killable(mm))
+                       return -EINTR;
+               switch (arg2) {
+               case PR_DEFAULT_MADV_HUGEPAGE:
+                       if (!hugepage_global_enabled())
+                               error = -EPERM;
+                       error = hugepage_set_vmflags(&mm->def_flags, MADV_HUGEPAGE);
+                       if (!error)
+                               process_default_madv_hugepage(mm, MADV_HUGEPAGE);
+                       break;


I am happy to go with either of the methods above, but was just trying to
incorporate your feedback :)

Would you like the method from previous version?

> 
>> ---
>>  include/linux/huge_mm.h |  1 +
>>  mm/khugepaged.c         | 26 +++++++++++++++++---------
>>  2 files changed, 18 insertions(+), 9 deletions(-)
>>
>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>> index 2f190c90192d..23580a43787c 100644
>> --- a/include/linux/huge_mm.h
>> +++ b/include/linux/huge_mm.h
>> @@ -431,6 +431,7 @@ change_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
>>  			__split_huge_pud(__vma, __pud, __address);	\
>>  	}  while (0)
>>
>> +int hugepage_set_vmflags(unsigned long *vm_flags, int advice);
>>  int hugepage_madvise(struct vm_area_struct *vma, unsigned long *vm_flags,
>>  		     int advice);
>>  int madvise_collapse(struct vm_area_struct *vma,
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index b04b6a770afe..ab3427c87422 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -346,8 +346,7 @@ struct attribute_group khugepaged_attr_group = {
>>  };
>>  #endif /* CONFIG_SYSFS */
>>
>> -int hugepage_madvise(struct vm_area_struct *vma,
>> -		     unsigned long *vm_flags, int advice)
>> +int hugepage_set_vmflags(unsigned long *vm_flags, int advice)
> 
> 
>>  {
>>  	switch (advice) {
>>  	case MADV_HUGEPAGE:
>> @@ -358,16 +357,10 @@ int hugepage_madvise(struct vm_area_struct *vma,
>>  		 * ignore the madvise to prevent qemu from causing a SIGSEGV.
>>  		 */
>>  		if (mm_has_pgste(vma->vm_mm))
> 
> This is broken, you refer to vma which doesn't exist.
> 
> As the kernel bots are telling you...
> 
>> -			return 0;
>> +			return -EPERM;
> 
> Why are you now returning an error?
> 
> This seems like a super broken way of making the caller return 0. Just make this
> whole thing a bool return if you're going to treat it like a boolean function.
> 
>>  #endif
>>  		*vm_flags &= ~VM_NOHUGEPAGE;
>>  		*vm_flags |= VM_HUGEPAGE;
>> -		/*
>> -		 * If the vma become good for khugepaged to scan,
>> -		 * register it here without waiting a page fault that
>> -		 * may not happen any time soon.
>> -		 */
>> -		khugepaged_enter_vma(vma, *vm_flags);
>>  		break;
>>  	case MADV_NOHUGEPAGE:
>>  		*vm_flags &= ~VM_HUGEPAGE;
>> @@ -383,6 +376,21 @@ int hugepage_madvise(struct vm_area_struct *vma,
>>  	return 0;
>>  }
>>
>> +int hugepage_madvise(struct vm_area_struct *vma,
>> +		     unsigned long *vm_flags, int advice)
>> +{
>> +	if (advice == MADV_HUGEPAGE && !hugepage_set_vmflags(vm_flags, advice)) {
> 
> So now you've completely broken MADV_NOHUGEPAGE haven't you?
> 

Yeah order needs to be reversed.

>> +		/*
>> +		 * If the vma become good for khugepaged to scan,
>> +		 * register it here without waiting a page fault that
>> +		 * may not happen any time soon.
>> +		 */
>> +		khugepaged_enter_vma(vma, *vm_flags);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  int __init khugepaged_init(void)
>>  {
>>  	mm_slot_cache = KMEM_CACHE(khugepaged_mm_slot, 0);
>> --
>> 2.47.1
>>

