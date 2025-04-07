Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DEE227BAD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010594; cv=none; b=Teqr7sAxOdAFv4UNL0z6pMBcBZ5tFkCIyPIRB2ztqDVF8jQRUtICdYM8Iw8hwLd1Ai/6y5To0inRLCmdMU5oCYu7jx9ZPKlsfyaWTEKNoBhdHM38hptsfRrvvA5FB0XX97zH0GGHo2K8svLOa0spOT9yeyMN+mb7PDDGkwNX72c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010594; c=relaxed/simple;
	bh=upyhCOYZ+EYKRXyq5a0qgVqW7CLAlo5jRW5LwQsIBho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bdi3AUpXBIj1dlXJjCUJzTtNw3rYBoCg/p44/kYHzAwi2hoBvLw4tOc5hZX+4ECJH5pHoC6gToh4651xt0EKkI9exf69W0lKFIRfNMuhyLLg3ewzC/k8g8V5cH8gGMLIM9zqb9ZZLhnjvLgmu0DTkpSSsVOAtWRrFnKTN72DW+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OnmGa2ML; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OnmGa2ML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744010591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=B1r1HdCpUvaOVezHtcC5BkAJFkP4kose+uh9bQkuCLw=;
	b=OnmGa2MLlPoN1P9EtE3YuQyJDF35Uek+vLxwDQe/ilTtckO2mo/wZkTBEnphcEoGr4g0gK
	GW5d1BxYRHhOhyYc1C+hbP3DGi5JswEJEL54jLVLFhvNL5JEAKfOeKGcaf72Ct/FokwuXj
	JQ1sgYwKL5gja5XC6KxPK3bMjay+1KA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-GZG6sgu6MAOElte-UAt6QA-1; Mon, 07 Apr 2025 03:23:10 -0400
X-MC-Unique: GZG6sgu6MAOElte-UAt6QA-1
X-Mimecast-MFC-AGG-ID: GZG6sgu6MAOElte-UAt6QA_1744010589
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39143311936so1612434f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010589; x=1744615389;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B1r1HdCpUvaOVezHtcC5BkAJFkP4kose+uh9bQkuCLw=;
        b=pMyOcc/PBXwgIYD4nMIsQOco4AXHETh5xUJPeqNAjqBME3BYtCos0PkT/S0wsyLgjp
         GQg5Ng3f0E6M+2OirWGuYlZxlFo2aKheGcpDe86E1kQUPXKD6c7r9Zqc+KheHye+rHML
         WT+UA2uPIpoiL9FHPfL/a52gYlysfb0iWZMsQ5QU0zTDumV3sZLSpBqIzNq/1zzc7dy4
         RGU47IppkLt50FkJdE9qN3jW1nNj40ebnyHkTsT2uHx9SQUXvvu0OsF+Boq3F9U36OQ8
         FDoaqQZyi2G123LyUsKSKv6x5MSG87sC2rmBQ3/LorDEkM6+p4OQ4HT7hoKstQEyms+z
         BroA==
X-Gm-Message-State: AOJu0YznSWSHz3PCRFESTGu421zFoQ3Z0s2PaZ05ojWIfgEPLvaoprA8
	uPiPtViRjc97FW3wfu4LqVREFpu4ODgeWhxWayXFgdePMwSz8XsM1YDY6HaZ1OQGmUybU9HYKj0
	jdZzRbysU6TBYeCRJSjTaPsu4tjWTSQKTs3jqeKJIrIY4G+cV6z5nS5T69h3lNw==
X-Gm-Gg: ASbGncs/80IcRkZpkjow0nVcKDkk5xPCYckESr8sY6W96ITshozw3KiV58UuV32iTAE
	xt9ASqKGHoKe1MerngpzAklNYhgnIqKJ/OmklbJNxx/MzAf45Jl5v9qJdVdpyVD/2hBqMsKRcmO
	jIAVHXnXvhOrnC0+cWU2DynDQmRBoQsQdroCt9Nhci1bx1cC4WCvJZRpvRNhWHHNOvCS7qQjCud
	y238SGzQOtVirGhtJdqVnMmxiGosnh2l0XBEZuemtD3jCdtyuP/a20WqsgfgBQ/daizZEkGEoLE
	Z+u5w2yV4Z0JA51hQa0+H3R4g/Gp/VJ/y1+QCMQHbb/I
X-Received: by 2002:a5d:584a:0:b0:399:737f:4de3 with SMTP id ffacd0b85a97d-39cba932615mr10061503f8f.29.1744010588688;
        Mon, 07 Apr 2025 00:23:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG93YWXHmFqAA3JO4w4gCfmqvjlqC2Zq7r66rDIM3d2tH7YV1GTDfICSd4EgnjSn0QEymmjfw==
X-Received: by 2002:a5d:584a:0:b0:399:737f:4de3 with SMTP id ffacd0b85a97d-39cba932615mr10061479f8f.29.1744010588280;
        Mon, 07 Apr 2025 00:23:08 -0700 (PDT)
Received: from [192.168.3.141] (p5b0c6a16.dip0.t-ipconnect.de. [91.12.106.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b69c4sm11093637f8f.43.2025.04.07.00.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 00:23:07 -0700 (PDT)
Message-ID: <630caa8e-2ee2-4895-9e4e-8bf2fa079100@redhat.com>
Date: Mon, 7 Apr 2025 09:23:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86/mm/pat: (un)track_pfn_copy() fix + improvements
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Rik van Riel <riel@surriel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20250404124931.2255618-1-david@redhat.com>
 <Z_K5uW2eu7GInRxs@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z_K5uW2eu7GInRxs@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.04.25 19:28, Ingo Molnar wrote:
> 
> * David Hildenbrand <david@redhat.com> wrote:
> 
>> We got a late smatch warning and some additional review feedback.
>>
>> 	smatch warnings:
>> 	mm/memory.c:1428 copy_page_range() error: uninitialized symbol 'pfn'.
> 
>> -	if (!(src_vma->vm_flags & VM_PAT))
>> +	if (!(src_vma->vm_flags & VM_PAT)) {
>> +		*pfn = 0;
>>   		return 0;
>> +	}
> 
>>   static inline int track_pfn_copy(struct vm_area_struct *dst_vma,
>>   		struct vm_area_struct *src_vma, unsigned long *pfn)
>>   {
>> +	*pfn = 0;
>>   	return 0;
>>   }
> 
> That's way too ugly. There's nothing wrong with not touching 'pfn' in
> the error path: in fact it's pretty standard API where output pointers
> may not get set on errors.

We're not concerned about the error path, though.

> 
> If Smatch has a problem with it, Smatch should be fixed, or the false
> positive warning should be worked around by initializing 'pfn' in the
> callers.

We could adjust the documentation of track_pfn_copy, to end up with the
following:

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index e2b705c149454..b50447ef1c921 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1511,8 +1511,9 @@ static inline void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
  
  /*
   * track_pfn_copy is called when a VM_PFNMAP VMA is about to get the page
- * tables copied during copy_page_range(). On success, stores the pfn to be
- * passed to untrack_pfn_copy().
+ * tables copied during copy_page_range(). Will store the pfn to be
+ * passed to untrack_pfn_copy() only if there is something to be untracked.
+ * Callers should initialize the pfn to 0.
   */
  static inline int track_pfn_copy(struct vm_area_struct *dst_vma,
                 struct vm_area_struct *src_vma, unsigned long *pfn)
@@ -1522,7 +1523,9 @@ static inline int track_pfn_copy(struct vm_area_struct *dst_vma,
  
  /*
   * untrack_pfn_copy is called when a VM_PFNMAP VMA failed to copy during
- * copy_page_range(), but after track_pfn_copy() was already called.
+ * copy_page_range(), but after track_pfn_copy() was already called. Can
+ * be called even if track_pfn_copy() did not actually track anything:
+ * handled internally.
   */
  static inline void untrack_pfn_copy(struct vm_area_struct *dst_vma,
                 unsigned long pfn)
diff --git a/mm/memory.c b/mm/memory.c
index 2d8c265fc7d60..1a35165622e1c 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1361,7 +1361,7 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
         struct mm_struct *dst_mm = dst_vma->vm_mm;
         struct mm_struct *src_mm = src_vma->vm_mm;
         struct mmu_notifier_range range;
-       unsigned long next, pfn;
+       unsigned long next, pfn = 0;
         bool is_cow;
         int ret;


-- 
Cheers,

David / dhildenb

