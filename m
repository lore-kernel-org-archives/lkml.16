Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB83C24BC14;
	Tue, 20 May 2025 15:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754014; cv=none; b=jYOTUkYqELKXatEPbacggMd04V/jTynT45gd4bYxv4dMPRCIAP6LWuiCk7gBUwb41ApWAuyp9zXrN8D5naqEYcmLAfjP1gZ8pJ8KSKib/SddiHxDT5Ra2fIuncWKWF6Jh7i3w6dK4aQ3olmZTY7gOrE7JnSXLmdC5rZpYBZY44Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754014; c=relaxed/simple;
	bh=XZVUTLkG/ObslUlfANgG2bXu08U58e9rgT22fA2Hmio=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=czKjKK7cup1i0xk4sRALrs+3pSft9MHzY2185gHGP4b4xgHRcImQBNZJro++Wfo18IptYPurId6hPznGO/ZOYXc4x2FBm1YrIlcA14NJljck9EKIqfvk8PgUr0fIb8IwgVM3mS9yfD8oMPhUlyFMney35p9O8PmZhfGMxaNTzN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yr9z2D8g; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yr9z2D8g"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad545e74f60so612701666b.2;
        Tue, 20 May 2025 08:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747754010; x=1748358810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rdG88EyH1p1bv7urRlmEwlCsfHqAXi2Gaf0ElWBrJv4=;
        b=Yr9z2D8g1WRflCPdufOMvvp+VXbAvXhlT5qWYf4utlHHD9upksqhvDLX+fbt7PE+mi
         ZT7vTowGrPZh1pxudAH9UJeenkglH7033e+C7CEHe4M0muvHRWRnbwmYeTnJg2bbA9x3
         y7K9+eEl1+HHxufSE75+4sqT9P7vpEH8+Aywj+VRKl1BY5RDaCcuYV4Yn3HORKyx/5F9
         cJAwUq1Roh60pU3T8m+ZaSPD/17E8Dz3ACo/VXb9Oq1H5zzftpz1QgL0AFC0cWWMnP+l
         Nm8w45MFp9SXeDBoTJIe1tRc5TgbVWtP/YiSdeLjD9LnYOWE1Fly6ePW11COIMzBU5px
         Iiug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747754010; x=1748358810;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rdG88EyH1p1bv7urRlmEwlCsfHqAXi2Gaf0ElWBrJv4=;
        b=qmv43FOtxDJuoXnUS7PEoKJU3q3hs+MqQcDPDVBT8aTrWec76UKWbj2XT2QxqOM9FH
         tvSF6o5l1AJE33zVtl/hzvibdCw6a0Z7qjhp6FNM6OIEPMPOBUuYgtg2cJm++1YaVNR8
         5hPiUY9zp+mRCKsUPUWpZ/v8xStPvqKW92CBEYkacfXM4DWfZaNg4SROEwmGLN2YEfQZ
         wuSj3B61PnjFe5N0Eyw9rhWOkGcWzlZbiAEqhvi9vj2/hrqjHi8wPSjqlqZtwkbjR6qf
         Mel96W+RItCarXg69G4jwSJT011ytu/1h7NBI0yaHgqbcdKlTCxZuwuPoB13nMcDYU9f
         wS1w==
X-Forwarded-Encrypted: i=1; AJvYcCWhOlLOId9I/mwzKv9Y/V2d9KB7HqEO4rddkR3SYchU9aiXcfjXnuMZ5TSrmR2qUlo6W0IJBCXTNFftcwZt@vger.kernel.org, AJvYcCXFHKkEpuzSVBcg1/iHNyvXv6QSC65FjbNkEaD/giEz2J+4k69v9fRAGWZKuWvq2MB304oljmWojBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqihdOTXd3Tux9+BP9IwQ44inP/RW60jN6LnGtdeMHEOj/FCxQ
	3dF7LtQyiBIzo6NAa5pnprAmLqAv6rvz7kMsXF5QdjAuXCJlQDaKZfNa
X-Gm-Gg: ASbGncvFOKuZc2Tg+2fFEcJuwlUaOWPs21tkQtX7F0ojJbdtNqSdk/S2pPWBCKSMCn8
	6gmMnBcBZ0B5FoTqmKvYSsnWdcknzPqEpVUmX4e+7+BrNJUbxc0t7gumQvneheQ1ZmwuqOOj6TJ
	MTyYrDDusUcBvOWMwIicY5qWQUImc3QmLFVDWL6rMuUyztiTJiwwyTK7RU543k3shJuqlXmCAxF
	cWqTzQEr5MjaZnHYBxgekON+h9dkV0+5DkOkh9ijQ7T8nkH8DhpPVuK/FwE/u3jU0jE8+nncCEB
	OuD2lNxU0C8ohqmawqnUeiTQRW4J4jMebg4raHbLs8Bf27v3fBktmXLRnX2bB0sOInMqqCr8kf2
	P6UNexKykTr+IyG9xFiEPtjAQ
X-Google-Smtp-Source: AGHT+IFjxjE0lFrgnZ6Cd5pIihlAuD5A4JBqDhUNb3mBicJJ6xu5WRDVze1nKilGnsM3t+wKrfqVtA==
X-Received: by 2002:a17:906:f595:b0:ac3:4139:9346 with SMTP id a640c23a62f3a-ad52d42bf33mr1289432366b.9.1747754009527;
        Tue, 20 May 2025 08:13:29 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:1c0a:f3ac:4087:51c8? ([2620:10d:c092:500::7:66a9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d438384sm752078966b.106.2025.05.20.08.13.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 08:13:28 -0700 (PDT)
Message-ID: <fbff5bdb-989f-471a-9793-934aef4f8c71@gmail.com>
Date: Tue, 20 May 2025 16:13:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] mm: khugepaged: extract vm flag setting outside of
 hugepage_madvise
From: Usama Arif <usamaarif642@gmail.com>
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
 <ad5b93bf-24e6-4b15-9c0d-5c501c74de86@gmail.com>
Content-Language: en-US
In-Reply-To: <ad5b93bf-24e6-4b15-9c0d-5c501c74de86@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 20/05/2025 15:57, Usama Arif wrote:
> 
> 
> On 20/05/2025 15:43, Lorenzo Stoakes wrote:
>> This commit message is really poor. You're also not mentioning that you're
>> changing s390 behaviour?
>>
>> On Mon, May 19, 2025 at 11:29:53PM +0100, Usama Arif wrote:
>>> This is so that flag setting can be resused later in other functions,
>>
>> Typo.
>>
>>> to reduce code duplication (including the s390 exception).
>>>
>>> No functional change intended with this patch.
>>
>> I'm pretty sure somebody reviewed that this should just be merged with whatever
>> uses this? I'm not sure this is all that valuable as you're not really changing
>> this structurally very much.
>>
> 

So I unfortunately never tested s390 build which the kernel bot is complaining.

So If I want to reuse hugepage_set_vmflags in patch 2 and 3 for the prctls,
the fix over here would be at the end.

If you don't like the approach of trying to abstract the flag setting away
and reusing it in prctl in this patch I can change it to the way in previous
revision and just do something like below. Happy with either approach and
can drop patch 1 if you prefer.


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




Thanks!

diff for fixing this patch:

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index b24a2e0ae642..e5176afaaffe 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -432,7 +432,7 @@ change_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
        }  while (0)
 
 void process_default_madv_hugepage(struct mm_struct *mm, int advice);
-int hugepage_set_vmflags(unsigned long *vm_flags, int advice);
+int hugepage_set_vmflags(struct mm_struct* mm, unsigned long *vm_flags, int advice);
 int hugepage_madvise(struct vm_area_struct *vma, unsigned long *vm_flags,
                     int advice);
 int madvise_collapse(struct vm_area_struct *vma,
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index ab3427c87422..b6c9ed6bb442 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -346,7 +346,7 @@ struct attribute_group khugepaged_attr_group = {
 };
 #endif /* CONFIG_SYSFS */
 
-int hugepage_set_vmflags(unsigned long *vm_flags, int advice)
+int hugepage_set_vmflags(struct mm_struct * mm, unsigned long *vm_flags, int advice)
 {
        switch (advice) {
        case MADV_HUGEPAGE:
@@ -356,8 +356,8 @@ int hugepage_set_vmflags(unsigned long *vm_flags, int advice)
                 * can't handle this properly after s390_enable_sie, so we simply
                 * ignore the madvise to prevent qemu from causing a SIGSEGV.
                 */
-               if (mm_has_pgste(vma->vm_mm))
-                       return -EPERM;
+               if (mm_has_pgste(mm))
+                       return 0;
 #endif
                *vm_flags &= ~VM_NOHUGEPAGE;
                *vm_flags |= VM_HUGEPAGE;
@@ -373,13 +373,14 @@ int hugepage_set_vmflags(unsigned long *vm_flags, int advice)
                break;
        }
 
-       return 0;
+       return 1;
 }
 
 int hugepage_madvise(struct vm_area_struct *vma,
                     unsigned long *vm_flags, int advice)
 {
-       if (advice == MADV_HUGEPAGE && !hugepage_set_vmflags(vm_flags, advice)) {
+       if (hugepage_set_vmflags(vma->vm_mm, vm_flags, advice)
+           && advice == MADV_HUGEPAGE) {
                /*
                 * If the vma become good for khugepaged to scan,
                 * register it here without waiting a page fault that

