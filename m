Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7884523AD;
	Tue,  8 Apr 2025 04:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744087534; cv=none; b=t5T9zbGbYxOKhdGSjer6ApGupmOefmJLwbNq+uSOngTKl6dpozM6p0ZENC0n42sus7gVxN5UHn28tIB6Z+NzfwJuPRxmN9sLsHO2yOmMN9TJ33I4uRx067m1OWAsSK2nIE315XAec9rnQ6FEGg1+SeMGL5yCT0x66yjFUcPG8rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744087534; c=relaxed/simple;
	bh=F2PYI+L2dgk/3pQsr9DP7jaG9Mjpx4ZaXFpuiOfJOrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t7z0oRVH7iBRqGmU4y0YJXtFOUrRx9Yhydp96xbLgyij8OOdthx/optvwhClQW7YELzJHPnzEzLgf8IcxyxRwJyhr6vuGWtCdL2tHnPfs9Q0sPSzOroOknoeJyIC3OIiTXB1Gl249B4JFy8u33LpDWArITcM8cqmdpNI0fNg5CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=RB/UMYRl; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="RB/UMYRl"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E064F281552;
	Tue,  8 Apr 2025 06:39:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1744087189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W6lum0tK8iDSD3O1/w0NV8phRZIGe2yefEV3A1OTASE=;
	b=RB/UMYRl3akr6Y8arx8VoiIh7JJFg6O6efnTlECPY+Udx14ewLdibMHM4h+aPmr6TQgVFg
	3tYc4etb248jCyDvlQc0dCcAjw7AbJXeXjuUldroGOw8W5iNu9Uy5tEzKBvge3JX4ZukoK
	vRI0hqTtDyE9prVsl/NwsYvmKc9dDeyu81GiPPKzezA9ustLKrXTGolSkiVHnPHD/0m2zo
	ovuXnS2VnLE4nF8yO+rGNNR/95LTY3PR9OMIlzxPzIY6SQg6z6JFi3B5p/uCWJOIYE/lAZ
	c3LgcrefqLIKK39ez7Wg1WNTgzSDeGmUZ0YUMVyfD0vxuq7OX7vBFgojsYsPpg==
Message-ID: <40182b31-95ad-4825-9c0c-0127be1734a6@cachyos.org>
Date: Tue, 8 Apr 2025 12:39:25 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/17] mm: uninline the main body of vma_start_write()
To: Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 akpm@linux-foundation.org
Cc: peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com,
 lorenzo.stoakes@oracle.com, mhocko@suse.com, hannes@cmpxchg.org,
 mjguzik@gmail.com, oliver.sang@intel.com, mgorman@techsingularity.net,
 david@redhat.com, peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net,
 paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com,
 hdanton@sina.com, hughd@google.com, lokeshgidra@google.com,
 minchan@google.com, jannh@google.com, shakeel.butt@linux.dev,
 souravpanda@google.com, pasha.tatashin@soleen.com, klarasmodin@gmail.com,
 corbet@lwn.net, linux-doc@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@android.com
References: <20241226170710.1159679-1-surenb@google.com>
 <20241226170710.1159679-11-surenb@google.com>
 <0d36fd53-b817-4bbd-ae38-af094bd301df@suse.cz>
Content-Language: en-US
From: Eric Naim <dnaim@cachyos.org>
In-Reply-To: <0d36fd53-b817-4bbd-ae38-af094bd301df@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 1/8/25 01:35, Vlastimil Babka wrote:
> On 12/26/24 18:07, Suren Baghdasaryan wrote:
>> vma_start_write() is used in many places and will grow in size very soon.
>> It is not used in performance critical paths and uninlining it should
>> limit the future code size growth.
>> No functional changes.
>>
>> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> 
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> 
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -6328,6 +6328,20 @@ struct vm_area_struct *lock_mm_and_find_vma(struct mm_struct *mm,
>>  #endif
>>  
>>  #ifdef CONFIG_PER_VMA_LOCK
>> +void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq)
>> +{
>> +	down_write(&vma->vm_lock.lock);
>> +	/*
>> +	 * We should use WRITE_ONCE() here because we can have concurrent reads
>> +	 * from the early lockless pessimistic check in vma_start_read().
>> +	 * We don't really care about the correctness of that early check, but
>> +	 * we should use WRITE_ONCE() for cleanliness and to keep KCSAN happy.
>> +	 */
>> +	WRITE_ONCE(vma->vm_lock_seq, mm_lock_seq);
>> +	up_write(&vma->vm_lock.lock);
>> +}
>> +EXPORT_SYMBOL_GPL(__vma_start_write);
> 
> Do any modules need it? If not we shouldn't export.

Hi Vlastimil, Suren

The out-of-tree NVIDIA modules seem to rely on this symbol, is it possible to use EXPORT_SYMBOL() here instead of EXPORT_SYMBOL_GPL(), below is the modpost error:

	MODPOST Module.symvers
	WARNING: modpost: missing MODULE_DESCRIPTION() in nvidia.o
	WARNING: modpost: missing MODULE_DESCRIPTION() in nvidia-uvm.o
	WARNING: modpost: missing MODULE_DESCRIPTION() in nvidia-modeset.o
	WARNING: modpost: missing MODULE_DESCRIPTION() in nvidia-drm.o
	ERROR: modpost: GPL-incompatible module nvidia.ko uses GPL-only symbol '__vma_start_write'
	ERROR: modpost: GPL-incompatible module nvidia-drm.ko uses GPL-only symbol '__vma_start_write'
	make[4]: *** [/tmp/makepkg/linux-cachyos-rc-nc/src/linux-6.15-rc1/scripts/Makefile.modpost:147: Module.symvers] Error 1
	make[3]: *** [/tmp/makepkg/linux-cachyos-rc-nc/src/linux-6.15-rc1/Makefile:1964: modpost] Error 2

If it's possible I can send a patch that changes that.

> 
>>  /*
>>   * Lookup and lock a VMA under RCU protection. Returned VMA is guaranteed to be
>>   * stable and not isolated. If the VMA is not found or is being modified the
> 
-- 
Regards,
Eric
