Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9488B2E3386
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691164; cv=none; b=M+4JygwNsoYy52dleSCQ0YBL/FdJiQMLVk6A47tjXj8gBp6gAG/6zVXvGzKqBRWWD1tBtT2Uph5aYz5imEiUdnbtddLEstO0DJpmck4VgU/3BOX3UpyqthwvFfFhyHuMWbF2GJGqGrmurXWQpAOIxypcm/I8v0XqGJlbzehFXhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691164; c=relaxed/simple;
	bh=1+CVJyPolg/HkeE1N9jZqboIyWDRnOxeMyrxfbjCZU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ER2u04GZvMnawoQGRXabExeOhv7iCIZJEOJL5HKt3lwxuHzBTylyupAIF19WL2/duhl6tGCPmgeF/6qSVagA8Z+E8gaTWEYOIHE+TavvIYVYk8430zl38KO7kU1MFdkAd+wB7bYtq4jpAXRTT8Dd3Y2D/d2c29mr2TjkZpMtiZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NSEiueri; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NSEiueri"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so6759175e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 07:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743691161; x=1744295961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rl3+XYEt97n5m7GHT74FzI9q0aNI5a78n1yW3rrYoOo=;
        b=NSEiueri+ie+EfWNWhdpiAdg+Ubxk0DdilUP/VIw4rr2f0jjteU5Qk8ixXjZBVJORJ
         W3fRQ6s5v3VJVVf0TxA0XVS/innvYYA8K/V2hwg+IT2HusRzxOj+r4tY/dNAB7FMf23q
         t8hY2AuOiegTBdht4RGvLqLMshiEnE4FDE5QlP1rS2hGKa9p1xB1CeBhIfPO6u38nRcW
         6og8dVAn4qsPfVbGXnA4KCKV5vtjfYx+i2Aki9/emfFxTp71u/SQqgjNw1AoZvvlFvZ5
         4xXgZJuvtg2hQ84UL3cEUPsqFr8I3hTPnKxXhnbY7ayDSQxDGf1+dPFm/NgEqvDRGAoA
         NZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743691161; x=1744295961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rl3+XYEt97n5m7GHT74FzI9q0aNI5a78n1yW3rrYoOo=;
        b=YI37wUheJRfQZX3ACaqKiBg+q3ITZHxFUfD2GnY4S9DnhmfH2q5rXwMvB3wlWGROkt
         LzZvepI86gz5ziKHOXkkBDlTqvtxTNpfIyLyin7OmHjVEa4tEB1YUrkEM3cYAP3s1BH7
         yAltu+FzsD8AINYs80t1QyTT4OYP5jlyKb1WWwBXtsr5BzjLif9m53H2PfVSplC8ME70
         uv0+bU5o1ZY6gPN1GZm04FIdbc1y1kLi6kJhsv23dvHDufcWporKCou4yV36jR+h2AYP
         A97MB4TDgyXrruCA/3Bcqi5jL7nNu9ImR+Kp33cszkz1uQoQXIACrwh/PP5PliYhLAFF
         0+ag==
X-Gm-Message-State: AOJu0YyZHfp7Ee/gLUI9rcwp601dL++ss3nCfl5X3VGgcAsBdw68tZ/F
	ZB3/Z/pbTskyGfF2jd6CNkU/qyANqwuI1rdsIEMbyFTHWHYCLzA78sWMh0EYid0=
X-Gm-Gg: ASbGncvWoG7x2f7Mz8Lo1cliJuu3ZyCmV4IXc651oLZhW/dkUydR5Q8A/4feoxwXZQ5
	XkTVRko4O5zQnklnZLFrq8q7AnVAMzHc5l8UyAHY4sIEM1aEmYubmCJNaNheymf/mjZ0CLR4CvS
	mWQey7m5RuZxVnTtB5OWOzoZgegyv/jMwxxqDE/8CjQwt471OX4NWyIBaJvSbHMum1OvM4ko6tn
	++V+XcABHMAXns4UUDjOBh0hYp7ZjiQP2XUpKJ+1k/fntpbmkNRVCvLZGVzx5JACAaxbrZuQW4o
	lYlQLem8K7YXkD8m7wJDIAqa6880m3l2OBcR/yH06bzvYACtrqElrb0uwc4n
X-Google-Smtp-Source: AGHT+IH3Qpv0DzeTUQ2Kk2Ur5SAltLgBhLy9a4dFt5da09/M5184HqY3H/S3J4d0u4ema/cKSfsbiA==
X-Received: by 2002:a05:600c:1384:b0:43c:f616:f08 with SMTP id 5b1f17b1804b1-43ec429ea3amr25621635e9.8.1743691160757;
        Thu, 03 Apr 2025 07:39:20 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16ba978sm23616965e9.23.2025.04.03.07.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 07:39:20 -0700 (PDT)
Message-ID: <b0b87bd7-e104-4c9b-b9e2-0682dfef28e9@suse.com>
Date: Thu, 3 Apr 2025 17:39:18 +0300
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
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20250328132704.1901674-1-mingo@kernel.org>
 <20250328132704.1901674-38-mingo@kernel.org>
 <65e8ed9d-0fff-4f70-b095-8df52493ebec@suse.com> <Z-6PWWyopb86UC6y@gmail.com>
 <a64bc000-4226-4d5c-8486-a230f4ff5065@suse.com> <Z-6XkEpiXg4stqLY@gmail.com>
Content-Language: en-US
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <Z-6XkEpiXg4stqLY@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 3.04.25 г. 17:13 ч., Ingo Molnar wrote:
> 
> * Nikolay Borisov <nik.borisov@suse.com> wrote:
> 
>>
>>
>> On 3.04.25 г. 16:38 ч., Ingo Molnar wrote:
>>>
>>> * Nikolay Borisov <nik.borisov@suse.com> wrote:
>>>
>>>>
>>>>
>>>> On 28.03.25 г. 15:26 ч., Ingo Molnar wrote:
>>>>> Simplifies the code and improves code generation a bit:
>>>>>
>>>>>       text	   data	    bss	    dec	    hex	filename
>>>>>      14769	   1017	   4112	  19898	   4dba	alternative.o.before
>>>>>      14742	   1017	   4112	  19871	   4d9f	alternative.o.after
>>>>>
>>>>> Signed-off-by: Ingo Molnar <mingo@kernel.org>
>>>>> ---
>>>>>     arch/x86/kernel/alternative.c | 11 +++++------
>>>>>     1 file changed, 5 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
>>>>> index 1df8fac6740d..5293929488f0 100644
>>>>> --- a/arch/x86/kernel/alternative.c
>>>>> +++ b/arch/x86/kernel/alternative.c
>>>>> @@ -2750,6 +2750,9 @@ static void smp_text_poke_batch_process(void)
>>>>>     		if (unlikely(!atomic_dec_and_test(refs)))
>>>>>     			atomic_cond_read_acquire(refs, !VAL);
>>>>>     	}
>>>>> +
>>>>> +	/* They are all completed: */
>>>>> +	text_poke_array.nr_entries = 0;
>>>>>     }
>>>>>     static void __smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, const void *emulate)
>>>>> @@ -2857,20 +2860,16 @@ static bool text_poke_addr_ordered(void *addr)
>>>>>     void smp_text_poke_batch_finish(void)
>>>>>     {
>>>>> -	if (text_poke_array.nr_entries) {
>>>>> +	if (text_poke_array.nr_entries)
>>>>>     		smp_text_poke_batch_process();
>>>>> -		text_poke_array.nr_entries = 0;
>>>>> -	}
>>>>>     }
>>>>
>>>> This function becomes trivial, why not simply move the check into
>>>> smp_text_poke_batch_process and rename it to smp_text_poke_batch_finish ?
>>>
>>> Yeah, that's pretty much what happens in patch #47:
>>>
>>>     x86/alternatives: Remove 'smp_text_poke_batch_flush()'
>>
>> Well, that patch removes poke_batch_flush but still retains
>> poke_batch_finish + poke_batch_process. My suggestion is to eliminate
>> poke_batch_process name and turn it into poke_batch_finish by moving the
>> check from poke_batch_finish into poke_batch_process.
> 
> So, in the context of the full tree at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/alternatives
> 
> Standalone smp_text_poke_batch_process() is still needed, because
> smp_text_poke_batch_add() uses it to drive the whole 'batching'
> machinery.
> 
> If smp_text_poke_batch_process() finishes for each call, if I
> understand your suggestion correctly, that reduces the amount of
> batching done, which is a disadvantage.
> 
> Note how right now it's possible to do something like this:
> 
> 	smp_text_poke_batch_add(1);
> 	smp_text_poke_batch_add(1);
> 	smp_text_poke_batch_add(1);
> 	smp_text_poke_batch_add(1);
> 	smp_text_poke_batch_finish();
> 
> This results in a single call to smp_text_poke_batch_process(), with 4
> entries, a single 4-entry flush in essence.

I meant doing this:

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 5b1a6252a4b9..b6a781b9de26 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2587,12 +2587,16 @@ noinstr int 
smp_text_poke_int3_trap_handler(struct pt_regs *regs)
   *               replacing opcode
   *     - SMP sync all CPUs
   */
-static void smp_text_poke_batch_process(void)
+void smp_text_poke_batch_finish(void)
  {
         unsigned char int3 = INT3_INSN_OPCODE;
         unsigned int i;
         int do_sync;

+
+       if (!text_poke_array.nr_entries)
+               return;
+
         lockdep_assert_held(&text_mutex);

         /*
@@ -2832,12 +2836,6 @@ static bool text_poke_addr_ordered(void *addr)
         return true;
  }

-void smp_text_poke_batch_finish(void)
-{
-       if (text_poke_array.nr_entries)
-               smp_text_poke_batch_process();
-}
-
  /**
   * smp_text_poke_batch_add() -- update instruction on live kernel on 
SMP, batched
   * @addr:      address to patch
@@ -2854,7 +2852,7 @@ void smp_text_poke_batch_finish(void)
  void __ref smp_text_poke_batch_add(void *addr, const void *opcode, 
size_t len, const void *emulate)
  {
         if (text_poke_array.nr_entries == TEXT_POKE_ARRAY_MAX || 
!text_poke_addr_ordered(addr))
-               smp_text_poke_batch_process();
+               smp_text_poke_batch_finish();
         __smp_text_poke_batch_add(addr, opcode, len, emulate);
  }


AFAICS this doesn't change the semantics. I.e smp_text_poke_batch_add 
will call poke_batch_finish iff the address to be added violates the 
sorted order of text_poke_array. The net effect is we have 1 less 
function name to care about.

> 
> Thanks,
> 
> 	Ingo

