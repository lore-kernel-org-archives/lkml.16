Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C05120298C
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 04:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746678391; cv=none; b=czJxBGAS1kJAywYsmHMA5gh0Mu4PokBsy8LkVoMY0WlbtWGKThi8T9IspHWnIyDhPzZ0sPhG9wPC5+clwQbSIeasT/a1gjquJQfvXqIRjGHZ/XidIZGtFvwmKhQzS5hMmRphgfG5QWR/WjNPyztH/p7NJPW/+nD5/4kUqSaJ1EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746678391; c=relaxed/simple;
	bh=Zly6rLC3OIUfk3XiAKmzp4ixSyBOKFTF3sQbWXiAers=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7Ni7VQdNXVHFATrTWpCI2Nbo93VXxKzXS6VxDZJEBfTvEMN6paK/P/9iJrXrpc7xF7fqBowzKREUc3ztT9joWfk/gFmGw5+SqJFYprwE6L3zebSWa0zjC+N2A6Zzh1h1A0fnmu5RGAzOqFBkhusuIZIIb9ksy+a59kIL/dj4/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KgDGVfCD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KgDGVfCD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746678387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GLAUCa9/J6OHKEUzuX+nr9ajJWmHw/KD5J8lJAPWSNo=;
	b=KgDGVfCD32KTSj+42we1/YhRygO3tDx1GqHsGAhv2Yg5GHWrAa6v367veWxA9R+Qgoj0El
	OO6J2OKbP8oXWFSdcSZ4iaoVpQDMhr49wJQ5B8IkIqnkyqBso2RKpELkI9bHyZ6CYTRf3X
	jq46RLRa14jgMv951PERacjoGGPBqE8=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-fBRX-Ev5MkCNwUETG7UDeA-1; Thu, 08 May 2025 00:26:26 -0400
X-MC-Unique: fBRX-Ev5MkCNwUETG7UDeA-1
X-Mimecast-MFC-AGG-ID: fBRX-Ev5MkCNwUETG7UDeA_1746678385
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22e50d4f49bso8293025ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 21:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746678385; x=1747283185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLAUCa9/J6OHKEUzuX+nr9ajJWmHw/KD5J8lJAPWSNo=;
        b=m+dt3mTePVI3tTXHkVXU9Knitku417LP/Sp1sNV78UXtKVT6mSR3aQqTVCVkeEq/CB
         ATS0XCJQTV7O/cVl5KjEUWddYz+/1J169U732shbVpUHVsh7Hpubd10P11zzMNubW9ps
         PpGMNDXNus7s/hkR3rzhbjtmrVjpHsJrjD0WTM03NO+bTJ8I6w0KB8smOaH/on6Ss2cs
         P+FvgcJj0H1epHSOcG0g28dhs6jbLOeS43bs2H0UUni1c+akhMgYETuks7h0lD6JkfWb
         NeokecodbZUDNRKU/vahimlxoao4RQyxjYfU4TTc37N4QRODOwlv1DKJqOhv/nDS9cD+
         OWug==
X-Forwarded-Encrypted: i=1; AJvYcCVHvxIN5ZeqZUXhmMdm8dN7Bj/dEZ0tzfDcaSlrBwKRplb2UynvyVNC4owsngJjjLrf8/Q7Bd2K1XcuSgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDd/cIhASNPkTU9I/8cG0yOnhm6xtzfr8cgtmaGJQHWhjrZ8bR
	KKTNsc9RYidoi6ruK7xfCol9u76hJjKRvKSNDZOZduXj6kfSOfcTL4Wravh/GEgrDeB90UALkiB
	Dtd0h2gkYANY4VIWiaQSG/hx640rjikFNXmm2WY3yxIrw79NmZtWmFUgBlkaLPw==
X-Gm-Gg: ASbGncukxGDYxOqGRh4WHXzxlmaW/cBOeAjLFfbpx/9sp2KJpc5PipYVxMwykuB3LwG
	csRMihwjxB53InVsJo7qTmvbOtuwckVWfzgXa9zDVr6fps+0oMHWj7UhJEy9ibwW7C37frRGSKW
	Ccssb5czvpBC7blCxiMQbxK8nTbfWrjwcduio434A/WNDTAoJsrnTvCPD5f4b8O956eosYi93zO
	/VyHxUeJjyi6AR9+4SA0+l1LzBu7I6i/T5WTCZYo/6sJ08+6NzAQiREoc1ixVxFnmtfRqOVrkTO
	Ttg=
X-Received: by 2002:a17:903:32c1:b0:223:90ec:80f0 with SMTP id d9443c01a7336-22e5ea7b7acmr103098535ad.22.1746678384815;
        Wed, 07 May 2025 21:26:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFQJmTOFP6CcLmvwuaAgLBrGYws4/2eAlX7bBXjQnhZUyoMlhf/Nvdm6+O1CKjSazsfFSbRQ==
X-Received: by 2002:a17:903:32c1:b0:223:90ec:80f0 with SMTP id d9443c01a7336-22e5ea7b7acmr103098275ad.22.1746678384406;
        Wed, 07 May 2025 21:26:24 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fa41f4387sm3334235ad.91.2025.05.07.21.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 21:26:24 -0700 (PDT)
Date: Thu, 8 May 2025 12:25:15 +0800
From: Coiby Xu <coxu@redhat.com>
To: Baoquan He <bhe@redhat.com>, akpm@linux-foundation.org
Cc: fuqiang wang <fuqiang.wang@easystack.cn>, 
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] x86/kexec: fix potential cmem->ranges out of bounds
Message-ID: <4de3c2onosr7negqnfhekm4cpbklzmsimgdfv33c52dktqpza5@z5pb34ghz4at>
References: <20240108130720.228478-1-fuqiang.wang@easystack.cn>
 <ZZzBhy5bLj0JuZZw@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ZZzBhy5bLj0JuZZw@MiWiFi-R3L-srv>

On Tue, Jan 09, 2024 at 11:46:15AM +0800, Baoquan He wrote:
>On 01/08/24 at 09:06pm, fuqiang wang wrote:
>> In memmap_exclude_ranges(), elfheader will be excluded from crashk_res.
>> In the current x86 architecture code, the elfheader is always allocated
>> at crashk_res.start. It seems that there won't be a new split range.
>> But it depends on the allocation position of elfheader in crashk_res. To
>> avoid potential out of bounds in future, add a extra slot.
>>
>> The similar issue also exists in fill_up_crash_elf_data(). The range to
>> be excluded is [0, 1M], start (0) is special and will not appear in the
>> middle of existing cmem->ranges[]. But in cast the low 1M could be
>> changed in the future, add a extra slot too.
>>
>> Previously discussed link:
>> [1] https://lore.kernel.org/kexec/ZXk2oBf%2FT1Ul6o0c@MiWiFi-R3L-srv/
>> [2] https://lore.kernel.org/kexec/273284e8-7680-4f5f-8065-c5d780987e59@easystack.cn/
>> [3] https://lore.kernel.org/kexec/ZYQ6O%2F57sHAPxTHm@MiWiFi-R3L-srv/
>>
>> Signed-off-by: fuqiang wang <fuqiang.wang@easystack.cn>
>> ---
>>  arch/x86/kernel/crash.c | 21 +++++++++++++++++++--
>>  1 file changed, 19 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
>> index b6b044356f1b..d21592ad8952 100644
>> --- a/arch/x86/kernel/crash.c
>> +++ b/arch/x86/kernel/crash.c
>> @@ -149,8 +149,18 @@ static struct crash_mem *fill_up_crash_elf_data(void)
>>  	/*
>>  	 * Exclusion of crash region and/or crashk_low_res may cause
>>  	 * another range split. So add extra two slots here.
>> +	 *
>> +	 * Exclusion of low 1M may not cause another range split, because the
>> +	 * range of exclude is [0, 1M] and the condition for splitting a new
>> +	 * region is that the start, end parameters are both in a certain
>> +	 * existing region in cmem and cannot be equal to existing region's
>> +	 * start or end. Obviously, the start of [0, 1M] cannot meet this
>> +	 * condition.
>> +	 *
>> +	 * But in order to lest the low 1M could be changed in the future,
>> +	 * (e.g. [stare, 1M]), add a extra slot.
>>  	 */
>> -	nr_ranges += 2;
>> +	nr_ranges += 3;
>>  	cmem = vzalloc(struct_size(cmem, ranges, nr_ranges));
>>  	if (!cmem)
>>  		return NULL;
>> @@ -282,9 +292,16 @@ int crash_setup_memmap_entries(struct kimage *image, struct boot_params *params)
>>  	struct crash_memmap_data cmd;
>>  	struct crash_mem *cmem;
>>
>> -	cmem = vzalloc(struct_size(cmem, ranges, 1));
>> +	/*
>> +	 * In the current x86 architecture code, the elfheader is always
>> +	 * allocated at crashk_res.start. But it depends on the allocation
>> +	 * position of elfheader in crashk_res. To avoid potential out of
>> +	 * bounds in future, add a extra slot.
>> +	 */
>> +	cmem = vzalloc(struct_size(cmem, ranges, 2));
>>  	if (!cmem)
>>  		return -ENOMEM;
>> +	cmem->max_nr_ranges = 2;
>
>LGTM, thx
>
>Acked-by: Baoquan He <bhe@redhat.com>

Hi Andrew,

It seems this patch was missed. Will you pick it up? Without this patch,
kdump kernel will fail to be loaded by the kexec_file_load,

  [  139.736948] UBSAN: array-index-out-of-bounds in arch/x86/kernel/crash.c:350:25
  [  139.742360] index 0 is out of range for type 'range [*]'
  [  139.745695] CPU: 0 UID: 0 PID: 5778 Comm: kexec Not tainted 6.15.0-0.rc3.20250425git02ddfb981de8.32.fc43.x86_64 #1 PREEMPT(lazy) 
  [  139.745698] Hardware name: Amazon EC2 c5.large/, BIOS 1.0 10/16/2017
  [  139.745699] Call Trace:
  [  139.745700]  <TASK>
  [  139.745701]  dump_stack_lvl+0x5d/0x80
  [  139.745706]  ubsan_epilogue+0x5/0x2b
  [  139.745709]  __ubsan_handle_out_of_bounds.cold+0x54/0x59
  [  139.745711]  crash_setup_memmap_entries+0x2d9/0x330
  [  139.745716]  setup_boot_parameters+0xf8/0x6a0
  [  139.745720]  bzImage64_load+0x41b/0x4e0
  [  139.745722]  ? find_next_iomem_res+0x109/0x140
  [  139.745727]  ? locate_mem_hole_callback+0x109/0x170
  [  139.745737]  kimage_file_alloc_init+0x1ef/0x3e0
  [  139.745740]  __do_sys_kexec_file_load+0x180/0x2f0
  [  139.745742]  do_syscall_64+0x7b/0x160
  [  139.745745]  ? do_user_addr_fault+0x21a/0x690
  [  139.745747]  ? exc_page_fault+0x7e/0x1a0
  [  139.745749]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
  [  139.745751] RIP: 0033:0x7f7712c84e4d

Thanks!

-- 
Best regards,
Coiby

