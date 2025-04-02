Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFB82356CF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 11:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593800; cv=none; b=H9nEIhB//iKSrvWShlFMkU5TqAYyGz//kkb54Ef9KLepMauhC+V3ntTPF9S5vp82Y6molbDK0Ltv3uE++spbPC4fdIIlZfFRz2rtUVJWmrq37yOuThmRJ7Dlg7A7Nw7WAXgzKSKPWchiYwEt2Ms0HZlcqCKGKYBtEudddc1QvNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593800; c=relaxed/simple;
	bh=x4EOKGhdyVcHhlT8yhCZrMCv+F09AE/plbINE3nwN7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=krlkEJkZJlIUUda1VOo/jEkJEfKjgVoJhsosfhLjR7YP8xtMHrlf5ALBQAhYs9ugh/g0dWgAoozEwwmc28E9OqIdtbjHKvjtojUqpKkGSq5Lx+P7TewXLfHEKdhLhXppVZ+hK14G9BbN4+8OKrE3yqjeLD457Rc5uCqbzw1/Ie8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VZwBNbFT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VZwBNbFT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743593797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xBNlApAyRlMAiXFp+2zqw2/i3aijgmu0HcjJVG0c+94=;
	b=VZwBNbFTp+/Pj+Ju7XO+S5XH9hHJzM0PDDac7tGzaV0yLVSMab/x9+69mvTbdtc+dhSRau
	YocTmI3MYc3vtqvONsJOvktI8qz0QtSEvPP8Nfo1/J/ej2M75KJslbtt1QtenSSVJaZ6VG
	TMdRX/bc1OdZHHI2BsyNLgfXEkmQMcA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-pBkatcc2MBKtcpNWw_pu2w-1; Wed, 02 Apr 2025 07:36:36 -0400
X-MC-Unique: pBkatcc2MBKtcpNWw_pu2w-1
X-Mimecast-MFC-AGG-ID: pBkatcc2MBKtcpNWw_pu2w_1743593795
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43bd0586b86so38981605e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 04:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743593795; x=1744198595;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xBNlApAyRlMAiXFp+2zqw2/i3aijgmu0HcjJVG0c+94=;
        b=SpwlEeyoTBHdOt8CzakV1Ch+zBNLFkD8mFVIAxVxoUtHk0JMc+G0s9mai23t/X3Rci
         76iQw5M4Mr/RJyYMqDDlNn9MopLptcLtcYjcfMmKXjARX4uJjx9s/8tsSKlBAz5U14yA
         8vpedaTMQnZ2+wXcHbUopy4MKGzS8G81oIG1O82LOARW8mjotvkFNJHQAqiKtvEGp9OA
         w7lus1CXZ+2hbBq6no8/dMfV2QLYd5QuvAOCAaNY1AM/YRgyT8/5G9mNKiq86kB13DSz
         0wPFhkEhhRvDoflM8cQDb06iimGZuneccQFfqXL6QaFXLR2rothHsbCp4iFRPO3jiBIY
         vR0w==
X-Gm-Message-State: AOJu0Yyudx6G81Tv4rieoM9OcHcNoPysCQNJtBU+NpLgHnzOEHlwh1i1
	tc+ZCsT+b5ZMtJAN7ShUwW/xiP6Hrw6Kp7xgr4dCDJh6W8akWkmt3tmsOqN0ZZ3mdXPQva2V14f
	JvRhrGVFNiF45ZwLcdkncPMqR4inTNLY5YZGB5P5loPKJJ7zNkO26zKoCHr/L3XVvE2hTTxLzuw
	haUPQd99zPUno/cwFzdBVVOhoxKrBeO3t1gC1m+lp/UAfC
X-Gm-Gg: ASbGncvYHvUH/p3iwjgRqae0aDHjwKAlYkJ2ycj6LxAU+jGW/0Lxu4iGPagm/BXxrw4
	oUQuYKsCLjIx0VkqD4XIBEdxOgC7oa8jDAKaxo4cqtKZqr80iU3SJxqmmLjGekvI3BMriRHrI78
	aH7Xzcd7hUM7e/cnjl+C9EC6zpVghGYZvFoJuFo43TB8qAUxnoQFYNQGKrpZWz4BkFmybmtHiMy
	HDXGJaFVUlr2OMFXJ+XSRtvqMj+bvcUEv1wv/xZOmbNAflZXR9RoBkaOiyRON7ALvi7lb3OpRAz
	1ArTubQD1W93/M8BRvB6pkRGkaU2lnhZl7aO+5eFwj67LYTOXxKyzU9XuMMR85M9UeuvYiHv/gJ
	zwRbg2C4Q4qX6c/6xjRseEM7gghEn9XP4hnnPvLhX
X-Received: by 2002:a05:600c:4206:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-43dd0a0298dmr137557555e9.10.1743593795066;
        Wed, 02 Apr 2025 04:36:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB+djPUeNV26FP69XQGJdNmWrobpzcr7c3KHEu0kDAjvfSHPTsZrDoVlYlKF58R4h90jhUnw==
X-Received: by 2002:a05:600c:4206:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-43dd0a0298dmr137557145e9.10.1743593794588;
        Wed, 02 Apr 2025 04:36:34 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70f:cd00:4066:4674:d08:9535? (p200300cbc70fcd00406646740d089535.dip0.t-ipconnect.de. [2003:cb:c70f:cd00:4066:4674:d08:9535])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c266c132fsm3938883f8f.13.2025.04.02.04.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 04:36:34 -0700 (PDT)
Message-ID: <7b6f57b5-c99f-4be7-b89c-1db06788d2b5@redhat.com>
Date: Wed, 2 Apr 2025 13:36:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in
 copy_page_range()
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, x86@kernel.org, xingwei lee <xrivendell7@gmail.com>,
 yuxin wang <wang1315768607@163.com>,
 Marius Fleischer <fleischermarius@gmail.com>, Ingo Molnar
 <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Rik van Riel <riel@surriel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
References: <20250325191951.471185-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250325191951.471185-1-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.03.25 20:19, David Hildenbrand wrote:
> If track_pfn_copy() fails, we already added the dst VMA to the maple
> tree. As fork() fails, we'll cleanup the maple tree, and stumble over
> the dst VMA for which we neither performed any reservation nor copied
> any page tables.
> 
> Consequently untrack_pfn() will see VM_PAT and try obtaining the
> PAT information from the page table -- which fails because the page
> table was not copied.
> 
> The easiest fix would be to simply clear the VM_PAT flag of the dst VMA
> if track_pfn_copy() fails. However, the whole thing is about "simply"
> clearing the VM_PAT flag is shaky as well: if we passed track_pfn_copy()
> and performed a reservation, but copying the page tables fails, we'll
> simply clear the VM_PAT flag, not properly undoing the reservation ...
> which is also wrong.
> 
> So let's fix it properly: set the VM_PAT flag only if the reservation
> succeeded (leaving it clear initially), and undo the reservation if
> anything goes wrong while copying the page tables: clearing the VM_PAT
> flag after undoing the reservation.
> 
> Note that any copied page table entries will get zapped when the VMA will
> get removed later, after copy_page_range() succeeded; as VM_PAT is not set
> then, we won't try cleaning VM_PAT up once more and untrack_pfn() will be
> happy. Note that leaving these page tables in place without a reservation
> is not a problem, as we are aborting fork(); this process will never run.
> 
> A reproducer can trigger this usually at the first try:
> 
>    https://gitlab.com/davidhildenbrand/scratchspace/-/raw/main/reproducers/pat_fork.c
> 
>    [   45.239440] WARNING: CPU: 26 PID: 11650 at arch/x86/mm/pat/memtype.c:983 get_pat_info+0xf6/0x110
>    [   45.241082] Modules linked in: ...
>    [   45.249119] CPU: 26 UID: 0 PID: 11650 Comm: repro3 Not tainted 6.12.0-rc5+ #92
>    [   45.250598] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-2.fc40 04/01/2014
>    [   45.252181] RIP: 0010:get_pat_info+0xf6/0x110
>    ...
>    [   45.268513] Call Trace:
>    [   45.269003]  <TASK>
>    [   45.269425]  ? __warn.cold+0xb7/0x14d
>    [   45.270131]  ? get_pat_info+0xf6/0x110
>    [   45.270846]  ? report_bug+0xff/0x140
>    [   45.271519]  ? handle_bug+0x58/0x90
>    [   45.272192]  ? exc_invalid_op+0x17/0x70
>    [   45.272935]  ? asm_exc_invalid_op+0x1a/0x20
>    [   45.273717]  ? get_pat_info+0xf6/0x110
>    [   45.274438]  ? get_pat_info+0x71/0x110
>    [   45.275165]  untrack_pfn+0x52/0x110
>    [   45.275835]  unmap_single_vma+0xa6/0xe0
>    [   45.276549]  unmap_vmas+0x105/0x1f0
>    [   45.277256]  exit_mmap+0xf6/0x460
>    [   45.277913]  __mmput+0x4b/0x120
>    [   45.278512]  copy_process+0x1bf6/0x2aa0
>    [   45.279264]  kernel_clone+0xab/0x440
>    [   45.279959]  __do_sys_clone+0x66/0x90
>    [   45.280650]  do_syscall_64+0x95/0x180
> 
> Likely this case was missed in commit d155df53f310 ("x86/mm/pat: clear
> VM_PAT if copy_p4d_range failed")
> 
> ... and instead of undoing the reservation we simply cleared the VM_PAT flag.
> 
> Keep the documentation of these functions in include/linux/pgtable.h,
> one place is more than sufficient -- we should clean that up for the other
> functions like track_pfn_remap/untrack_pfn separately.
> 
> Reported-by: xingwei lee <xrivendell7@gmail.com>
> Reported-by: yuxin wang <wang1315768607@163.com>
> Closes: https://lore.kernel.org/lkml/CABOYnLx_dnqzpCW99G81DmOr+2UzdmZMk=T3uxwNxwz+R1RAwg@mail.gmail.com/
> Reported-by: Marius Fleischer <fleischermarius@gmail.com>
> Closes: https://lore.kernel.org/lkml/CAJg=8jwijTP5fre8woS4JVJQ8iUA6v+iNcsOgtj9Zfpc3obDOQ@mail.gmail.com/
> Fixes: d155df53f310 ("x86/mm/pat: clear VM_PAT if copy_p4d_range failed")
> Fixes: 2ab640379a0a ("x86: PAT: hooks in generic vm code to help archs to track pfnmap regions - v3")
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Rik van Riel <riel@surriel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---

Apparently smatch is not happy about some scenarios. The following might 
make it happy, and make track_pfn_copy() obey the documentation "pfn set 
if rc == 0".

diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index d721cc19addbd..a51d21d2e5198 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -992,8 +992,10 @@ int track_pfn_copy(struct vm_area_struct *dst_vma,
         pgprot_t pgprot;
         int rc;

-       if (!(src_vma->vm_flags & VM_PAT))
+       if (!(src_vma->vm_flags & VM_PAT)) {
+               *pfn = 0;
                 return 0;
+       }

         /*
          * Duplicate the PAT information for the dst VMA based on the src
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 4c107e17c547e..d4b564aacab8f 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1515,6 +1515,7 @@ static inline void track_pfn_insert(struct 
vm_area_struct *vma, pgprot_t *prot,
  static inline int track_pfn_copy(struct vm_area_struct *dst_vma,
                 struct vm_area_struct *src_vma, unsigned long *pfn)
  {
+       *pfn = 0;
         return 0;
  }



-- 
Cheers,

David / dhildenb

