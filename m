Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837D62FB2
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 04:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746763534; cv=none; b=LaH68TkRKnU4OFCWQhYHzjQocs0WxXOQWIuJUVlkAWQAa1pvhn2nsd7cxoJiigbhJokXDiQvAMB8OERUR/jJ1slJN7kZr28idn248++VbF36SiWQJpRKYQt9HN4j2Hz5oB5PWmmJIB1Tjx8aohS2Es7f7zqTWnMQXSh2nhvhkOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746763534; c=relaxed/simple;
	bh=0DajdWIxqX04cEFHsZa2aIbEGn7OafUX6QvMVLBLWSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDjIQwMv3j+PLRCrdExrb0xTx0U0BbpNY07/52QY49GlFM3A26tb4cH0FSTqyjQxqPJEPVYZMnDJOURydTju65PjBGziFIWdHQesUdO5pKhkqdtPMbijcXUfOA9FvWtpO5xLyZKafvC23o+/MH8plVZsgR6TXxLFmUtRIW0qQtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dZUMEKFE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dZUMEKFE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746763531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J+SYrIQbnbnk5O/f1zspa8NoKFzZ95VWEpF6PHlNOTo=;
	b=dZUMEKFENZaaSwenXLb9MGRLqHYTLfh5U0lVc+NgxmD7+a5AlNsTz0dA8OjMROFBnl93Gh
	mBUj00OWbR59YRRYgoq3Dg23HE/6atuITZZnI3wy3SxICdPZvQ6kfyJKLjvhbriBkVOXwB
	5TiX+xo02SmiWlL/hETeRvcESjOMfg0=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-K3sEc1bRMCWqd1BMcXoMpg-1; Fri, 09 May 2025 00:05:30 -0400
X-MC-Unique: K3sEc1bRMCWqd1BMcXoMpg-1
X-Mimecast-MFC-AGG-ID: K3sEc1bRMCWqd1BMcXoMpg_1746763528
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-72f3b4c0305so2013313b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 21:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746763528; x=1747368328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+SYrIQbnbnk5O/f1zspa8NoKFzZ95VWEpF6PHlNOTo=;
        b=Qsw9YdzgFRfLowP/gLaN10D3WjDJE72MPZJ897RF90Goxk1H5fboWc8qqorBQlT7Vv
         yJTHlgvw9PZEQEP6i+6Psqf3Pe9bHdVDut6ulZw57J/C2cZkYL8xkS8go+HGsWBj/HaY
         PpWN1InHAwJykWGM+0kPxvjsnWmEG4xNxBDyXqm9m8cUjIEa4KeI+h9ns50UWKNjS2t3
         56k4WhYRXbZq8VH52CKhAc3Zpe4t+N/8no1Qi+GSgSCmCMsbArTjsoq/bGpjk7dA5LjD
         fIj/9nCm+KLLRlIMIk7+NYO6mwqpMTu5PzHn/aUdvUmtRDdy3wVUNvAjXawNzmAxZXZR
         iXkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuQp3TI8o6Ra0jWBxKynb/iez1zOkwS9UT3BEG23HkIxsoO1ANZdGkvTo0lOFiLxHEb0q7rRfVDGKj8PI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEoX8X7aVcSPMj/5pMjzG0ynG7/zjRT0lHXfZWdteW/wYIxKUT
	z5wyaKDsNgHa1X8cRJdBHfjHHTzUbkpifHPtX8x2gZysEEBMU9NWUlBd0GT7JT3JNlW1/7DNOQM
	Puoa/GQ4djwFnrqKiDEr5htvbszPRQvW3Qq0qcwVovMrR3NO4U4jGXiKmLe27pA==
X-Gm-Gg: ASbGncsApK7XxnptEI0feTPbVPWklHSo+NrsfmlU2nLSyxN+2+p+n35vzi7jAdyLN8O
	N2WCaiDPQPVoZB8NQG+pEBTekLhKOq4nUR39LyzJTnEYwvjwWROYhWqCyAqgnWW8I9SxVLBSUOo
	nIMguFpNaJZULGcoDyMf9R/qs8sfQn+eMjvHpnIDL8ZfTHEY+v/REGM1uKo+w1F9AizMQ1/V+os
	ds3YbQbhSKxIi+ACF8JB6BR9NRul2rMAGGlnFj3J5WRrdRVMnQUT8gOyH9E9OYRBJcwybp6rDMW
	Yvg=
X-Received: by 2002:a05:6a00:2e24:b0:73e:30dc:bb9b with SMTP id d2e1a72fcca58-7423ba88b38mr2682904b3a.2.1746763528164;
        Thu, 08 May 2025 21:05:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE77As/UwDFJ+dP/ELWVq0LFZcNGkVTWSBLh/OwCUft42xY+m4lFdYftfZTKsV2tbDZ8ZSfVg==
X-Received: by 2002:a05:6a00:2e24:b0:73e:30dc:bb9b with SMTP id d2e1a72fcca58-7423ba88b38mr2682870b3a.2.1746763527716;
        Thu, 08 May 2025 21:05:27 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237705123sm882603b3a.16.2025.05.08.21.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 21:05:27 -0700 (PDT)
Date: Fri, 9 May 2025 12:04:36 +0800
From: Coiby Xu <coxu@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan He <bhe@redhat.com>, fuqiang wang <fuqiang.wang@easystack.cn>, 
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v4] x86/kexec: fix potential cmem->ranges out of bounds
Message-ID: <2754f4evjfumjqome63bc3inqb7ozepemejn2lcl57ryio2t6k@35l3tnn73gei>
References: <20240108130720.228478-1-fuqiang.wang@easystack.cn>
 <ZZzBhy5bLj0JuZZw@MiWiFi-R3L-srv>
 <4de3c2onosr7negqnfhekm4cpbklzmsimgdfv33c52dktqpza5@z5pb34ghz4at>
 <20250507225959.174dd1eed6b0b1354c95a0fd@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250507225959.174dd1eed6b0b1354c95a0fd@linux-foundation.org>

On Wed, May 07, 2025 at 10:59:59PM -0700, Andrew Morton wrote:
>On Thu, 8 May 2025 12:25:15 +0800 Coiby Xu <coxu@redhat.com> wrote:
>
>> >
>> >Acked-by: Baoquan He <bhe@redhat.com>
>>
>> Hi Andrew,
>>
>> It seems this patch was missed.
>
>January 2024.  Yes, it's fair to assume that it was missed ;)
>
>> Will you pick it up?
>
>Sure.

Thanks for quickly processing this patch! Sorry I didn't reply yesterday
as I was trying to reproduce the UBSAN warning and truly understand the
it.

>
>> Without this patch,
>> kdump kernel will fail to be loaded by the kexec_file_load,

As already pointed out by Baoquan, a manual test shows kexec_file_load
actually works despite the UBSAN warning. Sorry I misinterpreted the
UBSAN warning and the automated test result failure (somehow sysrq
wasn't be triggered and vmcore wasn't saved either).


>>
>>   [  139.736948] UBSAN: array-index-out-of-bounds in arch/x86/kernel/crash.c:350:25
>>   [  139.742360] index 0 is out of range for type 'range [*]'
[...]
>>
>
>Do we know why this has appeared at such a late date?  The reporter
>must be doing something rare.

The UBSAN warning happens because flexible array members annotated with
__counted_by are accessed without assigning an array element count i.e.
crash_mem->ranges[0] is accessed without setting max_nr_ranges after
vzalloc,

     // include/linux/crash_core.h
     struct crash_mem {
     	unsigned int max_nr_ranges;
     	unsigned int nr_ranges;
     	struct range ranges[] __counted_by(max_nr_ranges);
     };

The bad commit was introduced in 2021 but only recent gcc-15 supports
__counted_by. That's why we don't see this UBSAN warning until this
year. And although this UBSAN warning is scary enough, fortunately it
doesn't cause a real problem. 

>
>Baoquan, please re-review this?
>
>A -stable backport is clearly required.  A Fixes: would be nice, but I
>assume this goes back a long time so it isn't worth spending a lot of
>time working out when this was introduced.

So I believe the correct fix should be as follows,

--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -301,6 +301,7 @@ int crash_setup_memmap_entries(struct kimage *image, struct boot_params *params)
         cmem = vzalloc(struct_size(cmem, ranges, 1));
         if (!cmem)
                 return -ENOMEM;
+       cmem->max_nr_ranges = 1;
  
         memset(&cmd, 0, sizeof(struct crash_memmap_data));
         cmd.params = params;


And a Fixes tag should be dedicated to commit
5849cdf8c120 ("x86/crash: Fix crash_setup_memmap_entries() out-of-bounds access")
which forgot to set cmem->max_nr_ranges=1.

>
>The patch needed a bit of work to apply to current code.  I did the
>below.  It compiles.
>
>--- a/arch/x86/kernel/crash.c~x86-kexec-fix-potential-cmem-ranges-out-of-bounds
>+++ a/arch/x86/kernel/crash.c
>@@ -165,8 +165,18 @@ static struct crash_mem *fill_up_crash_e
> 	/*
> 	 * Exclusion of crash region and/or crashk_low_res may cause
> 	 * another range split. So add extra two slots here.
>+	 *
>+	 * Exclusion of low 1M may not cause another range split, because the
>+	 * range of exclude is [0, 1M] and the condition for splitting a new
>+	 * region is that the start, end parameters are both in a certain
>+	 * existing region in cmem and cannot be equal to existing region's
>+	 * start or end. Obviously, the start of [0, 1M] cannot meet this
>+	 * condition.
>+	 *
>+	 * But in order to lest the low 1M could be changed in the future,
>+	 * (e.g. [stare, 1M]), add a extra slot.
> 	 */
>-	nr_ranges += 2;
>+	nr_ranges += 3;
> 	cmem = vzalloc(struct_size(cmem, ranges, nr_ranges));
> 	if (!cmem)
> 		return NULL;
>@@ -317,9 +327,16 @@ int crash_setup_memmap_entries(struct ki
> 	 * split. So use two slots here.
> 	 */
> 	nr_ranges = 2;
>-	cmem = vzalloc(struct_size(cmem, ranges, nr_ranges));
>+	/*
>+	 * In the current x86 architecture code, the elfheader is always
>+	 * allocated at crashk_res.start. But it depends on the allocation
>+	 * position of elfheader in crashk_res. To avoid potential out of
>+	 * bounds in future, add a extra slot.
>+	 */
>+	cmem = vzalloc(struct_size(cmem, ranges, 2));
> 	if (!cmem)
> 		return -ENOMEM;
>+	cmem->max_nr_ranges = 2;

Thanks for coming up with the above patch! I think the goal of this
patch is addressing a different issue but it also fixes the UBSAN
warning because cmem->max_nr_ranges is now set.

>
> 	cmem->max_nr_ranges = nr_ranges;
> 	cmem->nr_ranges = 0;
>_


-- 
Best regards,
Coiby

