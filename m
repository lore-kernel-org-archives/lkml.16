Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D729824E004
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743685726; cv=none; b=AzPowiE2xGUrDpQSj5rvpECorePHjDaEOa12KlSD5K4JnKZHXBf9ZDrsxI2jEEiKVc5VspJvuyo12vrxQkMQjJrkh/fCKmwFFqvfGsGCLDut2+9EPcXamaRZXdHsgggj2J0L6HxgP1Rre9e/JMxVZwTYKVSKz9xVPSf5SzUQpgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743685726; c=relaxed/simple;
	bh=xEBJyV37nSwXsOHoIeUxiUuc7xpc9TsFeyieCyoZ0z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q4qjCu+Pf19Uzwcb+wnQxFQRmRW5x9gAIwlgqeukx63tfBbSBlbUPE562bdMgsv3KBoDSMH4Ig+sQJlXeoyE3GjZk3hpvhrqe4wp2ouYzojlZ8dJXEU1OmNUHTQS5s+qNlooBEDYJdlI+To5NBA92jLPN2VDzrR/n4oJ7/Tvzrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AegCKZ3z; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AegCKZ3z"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfe574976so5530005e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 06:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743685721; x=1744290521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ULnWG45e/TYfTMus9aCnh7fBjSBagnA+Pj5idmvpJEY=;
        b=AegCKZ3zvn8TcjOXK05no/3F0EltBHqWyj/RyhTBUMkeUycmwEvTGlYbU4MZaEoCB/
         GbHRxqXaVTeWW7ttq3MSy5WH5GR+XH5tFwagWIdZNXpcV1VlkFxd5FLkYKKpW9nyJ8fq
         rU3WdBs+BWRnqY7CeQMdd0rxxe+leOrtO58EYpNok9OAZhtvLA7bLrLaBTscoqk+Cp2E
         zxAua2D4Ya7YQdrwN2HMHyrye9MLctEwWTEFRUAqNOwldxv+VKRAVRVnkWk4IfRmlh6G
         e89ssPEp4zpZqe0Kfq76XUywZVI701pZ/qPFekReAibZSDSUDL9jeXkIXr0O700qDg4q
         kEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743685721; x=1744290521;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ULnWG45e/TYfTMus9aCnh7fBjSBagnA+Pj5idmvpJEY=;
        b=jlprApzqf43hqkV8gMxJ9fJGnzL2EcYyuu2w/cQ2ppUPr4XJ72uZg6c/d53SgGhESO
         E38ceLq05vc8BFI/adlxfZCrudT+GSlb1LNtqMzg8vdSH5zCM3HRDtbjYqgb82Jwsklo
         rNFSRFS0/7klaEgMx6k635ZnXwpX1MKFBOh5nTCIUs3j/nz+MmPetN1yScbVXji/Jek8
         JKxZ0hituN1ZuMjzg4jsRliKWCIsuZwfuVOB9Ve6UgLWQFly42PvX3YOaMSq8o55d8uk
         NVPIqOj0FTNHWOQAs84jhczhA5db8VU5OX2a0Q59KZ7vYk+XAjvz+pUq+RglNRdYfKLF
         JnEA==
X-Forwarded-Encrypted: i=1; AJvYcCXFKaqKqJxyFPu2KIVccgtBEmq4NMGzrhpc6fu8QG9n9x+ztLmqNS2hklDhFTOJ3OPaE3rSm7Buk14R9Wk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2G4LV++gN+y+qZdZaNCH7sHQDRQPklL/WwcvugVT7sJnWT0aA
	KZdIwYq7RCgQ8FBREEcC5Cv/p0fsXfOEFhtfHZ9pcY7A4cbE9wwlCb/4+NsVL28=
X-Gm-Gg: ASbGncvPJS6rLH7slcAGjhz1VhTlvm8OaTpTo+6yTuEwvUj0yT6M7cR0UCHOGAJF69T
	zm7KcQFp3hch7aG1M6rlxGZ/R8hN8SCldRHztHl4EZE4HAujEzWP/8v3rI6FVwXBRrRT//lV4n9
	w0iup4LL8j7pZkkUOhvnoj0NiX/IzMXhLkNP1lUYwJ4HFfNu14CGuUqZUW+xiR5WrW0kC8jJeUv
	wADxcRylBTLr0b0N/vqWJyvwNMf0Cp7geBtV8/tGOo33Dotwie+KqDl/hrqIUKbMt9Hoi99o6++
	ZnuIyto/OADFlH5ax0fCfChINR9NdY6NoKqe3sjBAaAzRTBxZoL7DQJZaT8y
X-Google-Smtp-Source: AGHT+IGigCVSmsc+Wt4wxJJ3lJQ2+U843VCsw04+k/H+FKYACxCl1ltGgB1aAUzMQw/dURmCwDHihg==
X-Received: by 2002:a05:600c:5117:b0:43c:e9f7:d6a3 with SMTP id 5b1f17b1804b1-43ec42a00b0mr25867745e9.13.1743685721033;
        Thu, 03 Apr 2025 06:08:41 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16f1a73sm21487385e9.24.2025.04.03.06.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 06:08:40 -0700 (PDT)
Message-ID: <65e8ed9d-0fff-4f70-b095-8df52493ebec@suse.com>
Date: Thu, 3 Apr 2025 16:08:39 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 37/49] x86/alternatives: Move text_poke_array completion
 from smp_text_poke_batch_finish() and smp_text_poke_batch_flush() to
 smp_text_poke_batch_process()
To: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, "H . Peter Anvin" <hpa@zytor.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20250328132704.1901674-1-mingo@kernel.org>
 <20250328132704.1901674-38-mingo@kernel.org>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <20250328132704.1901674-38-mingo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 28.03.25 г. 15:26 ч., Ingo Molnar wrote:
> Simplifies the code and improves code generation a bit:
> 
>     text	   data	    bss	    dec	    hex	filename
>    14769	   1017	   4112	  19898	   4dba	alternative.o.before
>    14742	   1017	   4112	  19871	   4d9f	alternative.o.after
> 
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> ---
>   arch/x86/kernel/alternative.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> index 1df8fac6740d..5293929488f0 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -2750,6 +2750,9 @@ static void smp_text_poke_batch_process(void)
>   		if (unlikely(!atomic_dec_and_test(refs)))
>   			atomic_cond_read_acquire(refs, !VAL);
>   	}
> +
> +	/* They are all completed: */
> +	text_poke_array.nr_entries = 0;
>   }
>   
>   static void __smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, const void *emulate)
> @@ -2857,20 +2860,16 @@ static bool text_poke_addr_ordered(void *addr)
>   
>   void smp_text_poke_batch_finish(void)
>   {
> -	if (text_poke_array.nr_entries) {
> +	if (text_poke_array.nr_entries)
>   		smp_text_poke_batch_process();
> -		text_poke_array.nr_entries = 0;
> -	}
>   }

This function becomes trivial, why not simply move the check into 
smp_text_poke_batch_process and rename it to smp_text_poke_batch_finish ?

>   
>   static void smp_text_poke_batch_flush(void *addr)
>   {
>   	lockdep_assert_held(&text_mutex);
>   
> -	if (text_poke_array.nr_entries == TP_ARRAY_NR_ENTRIES_MAX || !text_poke_addr_ordered(addr)) {
> +	if (text_poke_array.nr_entries == TP_ARRAY_NR_ENTRIES_MAX || !text_poke_addr_ordered(addr))
>   		smp_text_poke_batch_process();
> -		text_poke_array.nr_entries = 0;
> -	}
>   }
>   
>   /**

