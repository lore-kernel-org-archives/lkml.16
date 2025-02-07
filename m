Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A1C194091
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 22:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738968257; cv=none; b=ALtyyaPPLIUIRbkLJEO4z1eCVD9dBmBO7chsSkl1kcRBfagnsMomRBCYzjaukxrsVV+Gju9BG9eNVNnEHSr/daX9t4QDfoq5wvw46kvkyESMekAMxpeJVPPpeVa+gCpcSoO5JhijqbrDx9bEXKMmimmMaW0wOlKFi8vdtU+DF3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738968257; c=relaxed/simple;
	bh=BKd51xQGZZ4Gqq3HzT1bsS3JNQF+dVtvOyP2185nGbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AiUC2TseE5IE4eN6lbL+0HebZ/RMTocquSJZfHGg8jC7rOWO2x/eBcZqhisA/wi8y0ieHRMuzJyR2GjEaDQuwoGYs8LCM+1CwPnLpKhFxVNg0NmprnDHoiLaRagxJ2/YZSrsEOv90bVCxP4idF56AqTgCNHeeC35Q+iVe3Rxdzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=jHhTxFEx; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="jHhTxFEx"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2fa3e20952fso1007882a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 14:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738968255; x=1739573055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o2ipDsFh+4Wi6+DfKBkgvbX5MRHqphXmotwjlbhmRh4=;
        b=jHhTxFExduXYPEeCSR1AkECffBNHSVsANRuMsv3hdU8pw1TP4r7tdhVLWaJ7kFx0tw
         fbuBeLTrIIhHIAfVXwnMmFfy2+Bw653qkelq8YHFzcHxRkz7A05mm96ugf+84flI0HfL
         7njB9tFx3VEq0OLqeNiaCcp6tgKrZejvz9i6KVlLc566FO6u6C9E5OAoyaFUCnTxU3n0
         +SbDnf62y3EzGZ34x5RckTxXbWo+lZE9caW0awgOkFYtquNHT5Zfp8jHYhv9+22phEHr
         46cP5acHZAsBdNTPhyuIulMiHfFgkZJ5bUUilQCpW9ESxZX+ccUTGE3XCFnSO0mLhaPn
         s0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738968255; x=1739573055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2ipDsFh+4Wi6+DfKBkgvbX5MRHqphXmotwjlbhmRh4=;
        b=ldULyosm4zAiXwwcFnjeHTU1uoev93M8dxJTRfHs7hAEI3HdmOKbZ+m2klbPBfFpvM
         l0fiRh3uZBSsAL6Qk1gRK4Zlvd7sfgcnmsW08IyKA8KGFYmhT9rW2u4dSdrDO8m742MR
         38H2z+OxE4EqfRYHAkMLSnInkdUZrz5nk7B89knfkACtzy0w09QGmcVJKWLXm0jntTYf
         WoluVkKFwJ2wtNq8Hs0uaMKfagmkpC82lgk54u3iapjqmveGoxl1pi3BNjh0+4peE6Ui
         QMNBxPXJVgEgeJspAlNM15JpG7hfg4Z5T7f2YObI8Gt+ap1vr9ePseyLt27mju1iZTj6
         +YYg==
X-Forwarded-Encrypted: i=1; AJvYcCVrLZGQ2B8kJW+58cDKR45XVbGJZP5bW4UHpnFMf8KMSJuoShHLMAoFKzfcfBRHilaJ+GsJDkuS2bltryI=@vger.kernel.org
X-Gm-Message-State: AOJu0YylKc9wlJnKRgv5d+4xSa2UY4R+n6xBSYsjktrU3II/eEycNXct
	KIZP89WBcYyPaaKvp7DuS50h0ygJd4NNlkkBOukZ7Q9EcwwZbJdxlNF5UUOl3RU=
X-Gm-Gg: ASbGncs0TN+ITyM54Jyl17DKWirqXXvy77l/aslL4/60kOqiGB0/8dl0DEIBQfnNPcz
	DUwvLQrh+tyv8KFEj2kv6uati+tR9RSw2C/04/4ydrNazmy2FnHjwJjEhNpfCNeu6MJs7jynnXI
	TIgugnSa+yKVl4XR9v5EV1gIC3NH3p6GZUmF2582GytxV3kf6DWGWf4WktaZbT8nfg00gSf1eM0
	HWdJa7F2e7v7jX63bK3QZtfqv4qPAORqAuWMH05aWyGxS5r3HnWVApvXfNzl7Zitd/ajl8QPQEW
	SG8tIg5LNkJGe0DH/1gmbP+gAg==
X-Google-Smtp-Source: AGHT+IH0ObGSX9Z5Li4uWD9lYbrpJL6WiQ/fR0RPEu4WFLYzu4KaceG7QOyaNMgDiAsQ/fdeHHOGVA==
X-Received: by 2002:a17:90b:19d8:b0:2ee:6d04:9dac with SMTP id 98e67ed59e1d1-2fa243f02dcmr6699334a91.32.1738968254644;
        Fri, 07 Feb 2025 14:44:14 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f9bf6f268fsm5069384a91.0.2025.02.07.14.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 14:44:14 -0800 (PST)
Date: Fri, 7 Feb 2025 14:44:10 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: Re: [PATCH v9 01/26] mm: helper `is_shadow_stack_vma` to check
 shadow stack vma
Message-ID: <Z6aMuuXMQAu7Tcvm@debug.ba.rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
 <20250204-v5_user_cfi_series-v9-1-b37a49c5205c@rivosinc.com>
 <6543c6b6-da86-4c10-9b8c-e5fe6f6f7da9@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <6543c6b6-da86-4c10-9b8c-e5fe6f6f7da9@suse.cz>

On Fri, Feb 07, 2025 at 10:27:10AM +0100, Vlastimil Babka wrote:
>On 2/5/25 02:21, Deepak Gupta wrote:
>> VM_SHADOW_STACK (alias to VM_HIGH_ARCH_5) is used to encode shadow stack
>
>I see that arm GCS uses VM_HIGH_ARCH_6.

Stale commit message. I thought I had fixed it.
Sorry about that, will fix it.

>
>> VMA on three architectures (x86 shadow stack, arm GCS and RISC-V shadow
>
>And RISC-V doesn't define it at all, not even in this patchset, or did I
>miss it somewhere?
>
>> stack). In case architecture doesn't implement shadow stack, it's VM_NONE
>> Introducing a helper `is_shadow_stack_vma` to determine shadow stack vma
>> or not.
>
>This looks like an unfinished sentence. As if it was to continue with "...
>will allow us to ..." what?
>
>I'm not against a helper but this changelog is rather confusing and also
>code in arch/x86 and arch/arm64 isn't converted to the helper but testing
>VM_SHADOW_STACK still.

Yes I didn't pay attention during rebase, will update the commit message.
>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> Reviewed-by: Mark Brown <broonie@kernel.org>
>> ---
>>  mm/gup.c  |  2 +-
>>  mm/mmap.c |  2 +-
>>  mm/vma.h  | 10 +++++++---
>>  3 files changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/mm/gup.c b/mm/gup.c
>> index 3883b307780e..8c64f3ff34ab 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -1291,7 +1291,7 @@ static int check_vma_flags(struct vm_area_struct *vma, unsigned long gup_flags)
>>  		    !writable_file_mapping_allowed(vma, gup_flags))
>>  			return -EFAULT;
>>
>> -		if (!(vm_flags & VM_WRITE) || (vm_flags & VM_SHADOW_STACK)) {
>> +		if (!(vm_flags & VM_WRITE) || is_shadow_stack_vma(vm_flags)) {
>>  			if (!(gup_flags & FOLL_FORCE))
>>  				return -EFAULT;
>>  			/*
>> diff --git a/mm/mmap.c b/mm/mmap.c
>> index cda01071c7b1..7b6be4eec35d 100644
>> --- a/mm/mmap.c
>> +++ b/mm/mmap.c
>> @@ -648,7 +648,7 @@ SYSCALL_DEFINE1(old_mmap, struct mmap_arg_struct __user *, arg)
>>   */
>>  static inline unsigned long stack_guard_placement(vm_flags_t vm_flags)
>>  {
>> -	if (vm_flags & VM_SHADOW_STACK)
>> +	if (is_shadow_stack_vma(vm_flags))
>>  		return PAGE_SIZE;
>>
>>  	return 0;
>> diff --git a/mm/vma.h b/mm/vma.h
>> index a2e8710b8c47..47482a25f5c3 100644
>> --- a/mm/vma.h
>> +++ b/mm/vma.h
>> @@ -278,7 +278,7 @@ static inline struct vm_area_struct *vma_prev_limit(struct vma_iterator *vmi,
>>  }
>>
>>  /*
>> - * These three helpers classifies VMAs for virtual memory accounting.
>> + * These four helpers classifies VMAs for virtual memory accounting.
>>   */
>>
>>  /*
>> @@ -289,6 +289,11 @@ static inline bool is_exec_mapping(vm_flags_t flags)
>>  	return (flags & (VM_EXEC | VM_WRITE | VM_STACK)) == VM_EXEC;
>>  }
>>
>> +static inline bool is_shadow_stack_vma(vm_flags_t vm_flags)
>> +{
>> +	return !!(vm_flags & VM_SHADOW_STACK);
>> +}
>> +
>>  /*
>>   * Stack area (including shadow stacks)
>>   *
>> @@ -297,7 +302,7 @@ static inline bool is_exec_mapping(vm_flags_t flags)
>>   */
>>  static inline bool is_stack_mapping(vm_flags_t flags)
>>  {
>> -	return ((flags & VM_STACK) == VM_STACK) || (flags & VM_SHADOW_STACK);
>> +	return ((flags & VM_STACK) == VM_STACK) || is_shadow_stack_vma(flags);
>>  }
>>
>>  /*
>> @@ -308,7 +313,6 @@ static inline bool is_data_mapping(vm_flags_t flags)
>>  	return (flags & (VM_WRITE | VM_SHARED | VM_STACK)) == VM_WRITE;
>>  }
>>
>> -
>>  static inline void vma_iter_config(struct vma_iterator *vmi,
>>  		unsigned long index, unsigned long last)
>>  {
>>
>
