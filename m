Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B6B1E1E04
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 12:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743769263; cv=none; b=YQW/1BbVW/fId25A/n7j6jI9WBpjmCkGx1y54dG/vtSRtuR7l+bNM+v8Sv21dBPdCW8pr5E2jexXqvU309WPG/VSKmIEdp9K6HHqtzrXlbpTk0Nvb4/LqhDnLtc1e4BVT2ppEEEj785c3jChbipLLAz4UUQNvXo9CwrK8Qhv/Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743769263; c=relaxed/simple;
	bh=ALnNmdCEbY92eNfnBFg426mUkeeRgyu+A9JRnKWfamU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VxMBuD5l+7GwAXxyks7hOZaAZyzz73+4pbpmV0hfIc/pwjzOfAy1VvrUK+BVIzGdHrxyczpC+UmYpIkTKpuuSEMvW3Vfn7tmOir6vehSZHvwNjshdJtWu0le+Ht2CTdhnqfkJsbC17VZbMN4NevSXygCANKJoNSzFxernoN1lUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZFl3b783; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZFl3b783"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743769258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VIhuCyeDrsmnPnB8pGt8PLSgdLaa+nCdx1GzcqoTy0s=;
	b=ZFl3b783MGsztyb/RpjO8O0+rdLborbaakN0tfuhXFnl0qNn2QuI14tqqQesiFOElppw0n
	RYkfmEblCpBclQGtZwMp69qYI86mVVTF6N1ZzFjFF53yLebHxld2OUUbiTc+oShxX+fgI6
	oNdXPLme5nQd93ivBPXKe0AWpzhk0Gk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-6thRkqWIO82AfIs-6RXMAA-1; Fri, 04 Apr 2025 08:20:57 -0400
X-MC-Unique: 6thRkqWIO82AfIs-6RXMAA-1
X-Mimecast-MFC-AGG-ID: 6thRkqWIO82AfIs-6RXMAA_1743769256
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39ac9b0cb6aso1422439f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 05:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743769256; x=1744374056;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VIhuCyeDrsmnPnB8pGt8PLSgdLaa+nCdx1GzcqoTy0s=;
        b=RsLNYJLPl7u/Z82I5sl9owr7AvVJiGmvSBxgGEVnl/l2er8Pv2ZyHgpoLBoektPjcY
         Wxed9zSqgjmQhFG+3S6hV3qOLdC37uImuhKECbWtChAgIw4x49vX1IBsS7MgURkVkInR
         snuzAaQXnAihXxUyZMDj0ixkcOJfdROHU7cx9XtSMAL4A59OJo+dwmyvW1vTAu+/DPpr
         VWqmBnWUP7ohIzK7yn/XYkweH1W0Y3L8s0G+oOaGYT/nPS5XYHvXB3t4euZAId4p7CJ4
         Ns5f37+RqLQZDEh2mI7DiLLU25HES/f89WguBu9aaG1nqLF9tP4GURG4oQBC/X5Mtn0h
         9sTA==
X-Forwarded-Encrypted: i=1; AJvYcCWIuCyBP06B459dK14ILcrpB25Xi9y35wVnNS+cdX7RhTZLqYvJmtZcXnFazjjU49DDuGG/1+6vejD97zw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMj+Gp05239pHLdMmWNbBd7WakWNZQ8zmZADFHi1rUVimPJLgR
	EVVvTuVTp3wk3q0WMPN9tzZk+7zQrctA5jrq5YkmvUBBhT8WFsNk++9M4yUEmOe4OzTGCeZiaGQ
	L9u8TPl1kI9soVYr72w9+cX2h0mvMS0q97IKpznZbcFdKU7S2UVWMgiX/SIw8mg==
X-Gm-Gg: ASbGnctcTfiAk3fT4yWgpxqwfwHdNoOKEKR77ZaItYpbOr8TaFCa2NbJqMk62VMGHxl
	zkmApoU/wX9vegaTS1eriSn8k5YjLvF+v9VwU7kgdakl0uaf4UTo5aJ02PR6gGAVNgSF/y1WwtI
	nnGf4pIoNTd961pHdaZHm4U06nT9C440Xhp24tSw0z6Jb5Fe88tYPzX1tehfD+/Lq2m6XQppHtG
	ZR71kp7vdSyR9CE4c4PTyQZzIVmZhCsrNzO9PgU5itc+us7rSKsItVxYWsZrjN80zFVQVyRx0ia
	Roct2i/mPjwpIT/+nnf6410TaS5yp/SyOCydhDJuCagb8WrLAADmGKVh6ZaGU2NeNW+IZsD6yy/
	q7tv5moqk9tmW3GCyeWdFgKG2qq2z0FeD2nSgAyhlN44=
X-Received: by 2002:a05:6000:22c6:b0:39c:1efc:1c1c with SMTP id ffacd0b85a97d-39cb35b38b6mr2772412f8f.34.1743769256224;
        Fri, 04 Apr 2025 05:20:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxAz0EVhDE9pl7+g3KgrnsgGbNPVPUInVovmdboQhXyfEyTXXaCK1I1dauswN4Z0E48Gi3bg==
X-Received: by 2002:a05:6000:22c6:b0:39c:1efc:1c1c with SMTP id ffacd0b85a97d-39cb35b38b6mr2772377f8f.34.1743769255749;
        Fri, 04 Apr 2025 05:20:55 -0700 (PDT)
Received: from ?IPV6:2003:cb:c71b:7900:8752:fae3:f9c9:a07e? (p200300cbc71b79008752fae3f9c9a07e.dip0.t-ipconnect.de. [2003:cb:c71b:7900:8752:fae3:f9c9:a07e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a6796sm4297167f8f.31.2025.04.04.05.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 05:20:55 -0700 (PDT)
Message-ID: <92c40df4-2e93-40ca-929e-a0b50ab2b631@redhat.com>
Date: Fri, 4 Apr 2025 14:20:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in
 copy_page_range()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 kernel test robot <lkp@intel.com>, oe-kbuild@lists.linux.dev,
 Dan Carpenter <error27@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 x86@kernel.org
References: <g5vxcrmdjjsvrjeo5k6uzwypctv2mvbteoommwwpv6sfjpbcyd@lackqksyahfs>
 <94c35e89-f915-4122-b1a0-436893201373@stanley.mountain>
 <a33df3aa-7f37-4d1b-bde8-642115dd1441@redhat.com>
 <e75ca8d9-0386-4de6-bee9-e6044b001a30@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <e75ca8d9-0386-4de6-bee9-e6044b001a30@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.04.25 13:52, Lorenzo Stoakes wrote:
> On Thu, Apr 03, 2025 at 10:59:12PM +0200, David Hildenbrand wrote:
>> On 03.04.25 17:14, Dan Carpenter wrote:
>>> Sorry, I've been having trouble with my email recently...  I replied
>>> earlier but my email got eaten on the way out.
>>>
>>> What happened here is that the zero day bot emails go to me first and
>>> then I review them or forward them depending on if they're a real
>>> issue or not.
>>>
>>> Here it's a false postive because it's set and used if the
>>> (src_vma->vm_flags & VM_PFNMAP) flag is set.  Smatch doesn't parse
>>> this correctly.  I've been meaning to fix this in Smatch for a
>>> while.
>>
>> There is a slight complication (on top of the VM_PFNMAP checks):
>>
>> If "src_vma->vm_flags & VM_PAT" we
>> * set pfn
>> * set dst_vma->vm_flags |= VM_PFNMAP
>>
>> Then, we only consume the pfn if "dst_vma->vm_flags & VM_PFNMAP"
>>
>> While we won't be using the uninitialized pfn (good), we'd still pass an
>> uninitialized pfn, which IIRC is UB; likely nothing happens on GCC clang,
>> but we better handle it.
>>
>> So that should better be changed; I'll send a fix.
> 
> Maybe just worth setting pfn = 0 _as well_ in the caller, belts + braces maybe?

I'm planning on doing the following, just didn't get to testing it:


 From d340fac886c4a15d39d8e963aa8c647b19589413 Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Tue, 29 Oct 2024 22:03:31 +0100
Subject: [PATCH] x86/mm/pat: (un)track_pfn_copy() fix + improvements

We got a late smatch warning and some additional review feedback.

	smatch warnings:
	mm/memory.c:1428 copy_page_range() error: uninitialized symbol 'pfn'.

We actually use the pfn only when it is properly initialized; however,
we may pass an uninitialized value to a function -- although it will not
use it that likely still is UB in C.

Fix it by always initializing pfn when track_pfn_copy() returns 0 --
just as documented.

While at it, clarify the doc of untrack_pfn_copy(), that internal checks
make sure if we actually have to untrack anything.

Fixes: dc84bc2aba85 ("x86/mm/pat: Fix VM_PAT handling when fork() fails in copy_page_range()")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202503270941.IFILyNCX-lkp@intel.com/
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Rik van Riel <riel@surriel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
  arch/x86/mm/pat/memtype.c | 4 +++-
  include/linux/pgtable.h   | 5 ++++-
  2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index 72d8cbc611583..9ad3e5b055d8a 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -992,8 +992,10 @@ int track_pfn_copy(struct vm_area_struct *dst_vma,
  	pgprot_t pgprot;
  	int rc;
  
-	if (!(src_vma->vm_flags & VM_PAT))
+	if (!(src_vma->vm_flags & VM_PAT)) {
+		*pfn = 0;
  		return 0;
+	}
  
  	/*
  	 * Duplicate the PAT information for the dst VMA based on the src
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index e2b705c149454..9457064292141 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1517,12 +1517,15 @@ static inline void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
  static inline int track_pfn_copy(struct vm_area_struct *dst_vma,
  		struct vm_area_struct *src_vma, unsigned long *pfn)
  {
+	*pfn = 0;
  	return 0;
  }
  
  /*
   * untrack_pfn_copy is called when a VM_PFNMAP VMA failed to copy during
- * copy_page_range(), but after track_pfn_copy() was already called.
+ * copy_page_range(), but after track_pfn_copy() was already called. Can
+ * be called even if track_pfn_copy() did not actually track anything:
+ * handled internally.
   */
  static inline void untrack_pfn_copy(struct vm_area_struct *dst_vma,
  		unsigned long pfn)
-- 
2.48.1


> 
> I mean the patch is already upstream at dc84bc2aba85. So I guess these fixes are
> intended for rc generally?

Yes.

-- 
Cheers,

David / dhildenb

