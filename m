Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76414264609
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 20:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739221051; cv=none; b=UVY4RBzJsqDfoKbnhQTBQSRkyb+vRvxOqJr4rx40ymqZ4cJThkWwpBTpHSGPN50Xbl4pUTIr79y7FDBGELBDfQ1A5gou8k0sE6AGaFRrqTrzmDWUQB5KRe8cKG88wmrmmybCXYnuHgSU2Ew5JlTLUQ0EqAu1m+x7vndQLxklWV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739221051; c=relaxed/simple;
	bh=zoj9FUN+Ruz7IGVBAtjhdNK05pwL5EjgzLFVNHv/xag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tYrmnlh/W8vnVYF7uKxX4AJoZWTknNzfN6vibcZWPGDq7Qf1FlD3k9GpZ06cO5pL5viDMJaSNJVnhAndX/D5HxCkipuCIcstp5pK44/G+pS60fxW1Q2xL6M5KbcmMSMwL3x2o6UWRYLrEE1EzQ/al2cIqzNmqtPjv+oKlFx+zvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=vmXnOpU3; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="vmXnOpU3"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38dd935a267so1623916f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739221048; x=1739825848; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JDpSBUEru1GjuW8rBX7StgLUADCWp/1IiJrzvyyQuCY=;
        b=vmXnOpU363IkvJ+lE9OdBFVvDQBVTl6QXb1qUBCZiSRqK/B/EYmhxCnWQXTCcRqC5B
         +AU0Vo2LRJtiI7ojWOfKy15egXiJl3HQZrFDazPDOY37ockp7x6iz3bifFp5bmtKG095
         /k889A4UpWt0mXJTsqf4UndHxFAuYv2VMCn6sbjLl8oLhmcaaspVaTv15kKZq69DJOll
         JwE1LV+7BAM1ppfg3sdQEDQ7AKGWcb+Fg2NZnb8h6epNJ1Roy4yOdxSeXCuSdH7hcmo8
         lVOnm5TOLaWp9v9VDkqgS47KmL7b3R7aXsAVXKdRowY8LUaahThHLunqiviAfCLKJHyD
         YmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739221048; x=1739825848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JDpSBUEru1GjuW8rBX7StgLUADCWp/1IiJrzvyyQuCY=;
        b=dp9m77O+jv3hYn+e3aXiH499TKX13hOlb6sC3oVrVw4F48Ubj+Z+J8+X6pkcd2sYf4
         syR8tM4HLZnDhvM1SfFRCykIrGbD7mYMnJXjdnGb5krvxWtKq3k78LHOth0vEB6QdPWE
         TToqn1GZdT7HrcgrYr63aqaweLSDSKTLaAzzX+pmFzYnZ1O1J9zRBZtMY++m1zox5iWF
         nSonBLbREyVJG9kykMP28wY+YQBlMEElsBjSnVSNJRBhIlXyzdYwn9Zql77SGsaCe1or
         aMALJ0NCM3jxf92f0af7yZkb8zVb0xZOp/Z+/FrHb6bHojRSo4SHJFTjexZDELv/NwBz
         39Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVFbGWKXgKc1iL8Fr5NegN5u+adEmRE68DXmRZYuOEndd5oSlNzkrCtmwCQag/MxqOGhfUxRS/DM880u3g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4lN0NeyCKSxuevEbERrsXsCYWqEfP+2JKZt4cepOU7tfSq8lB
	eT2eZDWR2VnqHrrxy7FXHDcdG/shgp5k5sd6ANLNBe5gwx6FGd7MAizv/s3SNA/R/oHFioKwGyx
	gYQY=
X-Gm-Gg: ASbGncvmqazVjr73npxIO+Dx1urwvLVt8pE5ECDMX66rXSbw9ivGZHGJ8l3Lo1v3/w5
	6UascEe7Km5trIHLfieh9+PymtinQWyrVyQA12b1UcGpl0x3YY/qDvTZjaPe2w/hGPQsPksE/ew
	cPP4Dfm+/DZDA2XOMf7SJy1KTEeVAwNFSxkzuuvLFq9YmxJVTDozIWIdjcQqE9X4/G/Z0+wXy+G
	o6h0n8ESAn3IctubHI1UGqHHlxf+6z+1n4OF//P+lRIeu104jw8DigI3SuIPlqHKA6mCNtma8Xy
	Kk51BSutW8q2PNQj/cDlUk77fHJeGz4uQfNyLfzz2PyK6SK86fxDWDPlYiyV
X-Google-Smtp-Source: AGHT+IE9FXp0xRj66yJcpzXhagu6NIdiDdGVBmnYp/nyc2iynWuLkOdUocKBJA2QhB9wdY+yGkYUeQ==
X-Received: by 2002:adf:e90e:0:b0:38a:41a3:ac4 with SMTP id ffacd0b85a97d-38dc937334bmr9237507f8f.45.1739221047634;
        Mon, 10 Feb 2025 12:57:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43941ddc8e9sm50907695e9.26.2025.02.10.12.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 12:57:26 -0800 (PST)
Message-ID: <fb67c9e8-0de4-4e11-929a-49d36e81a1a2@rivosinc.com>
Date: Mon, 10 Feb 2025 21:57:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com,
 "palmer@dabbelt.com Anup Patel" <apatel@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com> <Z6ax7B45OsGerjfA@ghost>
 <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
 <c6f98a70-b1c7-4955-bf5d-546e4563cf1c@rivosinc.com>
 <20250210-e6a2dfcd7995ffc8a6d918e4@orel>
 <e1fae51d-3511-4bcf-afbf-4e690905ccda@rivosinc.com> <Z6o1bQLJ8aUyjvrQ@ghost>
 <015a8a52-6a49-41b9-95b4-5e8260d45776@rivosinc.com> <Z6pnTG7YoiDW_Gkq@ghost>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <Z6pnTG7YoiDW_Gkq@ghost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/02/2025 21:53, Charlie Jenkins wrote:
> On Mon, Feb 10, 2025 at 09:42:25PM +0100, Clément Léger wrote:
>>
>>
>> On 10/02/2025 18:20, Charlie Jenkins wrote:
>>> On Mon, Feb 10, 2025 at 03:20:34PM +0100, Clément Léger wrote:
>>>>
>>>>
>>>> On 10/02/2025 15:06, Andrew Jones wrote:
>>>>> On Mon, Feb 10, 2025 at 12:07:40PM +0100, Clément Léger wrote:
>>>>>>
>>>>>>
>>>>>> On 10/02/2025 11:16, Anup Patel wrote:
>>>>>>> On Sat, Feb 8, 2025 at 6:53 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
>>>>>>>>
>>>>>>>> On Fri, Feb 07, 2025 at 05:19:47PM +0100, Andrew Jones wrote:
>>>>>>>>> Probing unaligned accesses on boot is time consuming. Provide a
>>>>>>>>> function which will be used to look up the access type in a table
>>>>>>>>> by id registers. Vendors which provide table entries can then skip
>>>>>>>>> the probing.
>>>>>>>>
>>>>>>>> The access checker in my experience is only time consuming on slow
>>>>>>>> hardware. Hardware that supports fast unaligned accesses isn't really
>>>>>>>> impacted by this? Avoiding a list of hardware that has slow/fast
>>>>>>>> unaligned accesses in the kernel was the main reason for dynamically
>>>>>>>> checking. We did introduce the config option to compile the kernel with
>>>>>>>> assumed slow/fast accesses, which of course has the downside of
>>>>>>>> recompiling the kernel and I assume that you already considered that.
>>>>>>>
>>>>>>> The kconfig option does not align with the vision of running the same
>>>>>>> kernel image across platforms.
>>>>>>
>>>>>> I'd would be advocating to remove compile time options as well and use
>>>>>> another way to skip the probe (see below).
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> Instead of having a table in the kernel, something that would be more
>>>>>>>> platform agnostic would be to have an extension that signals this
>>>>>>>> information. That seems like it would accomplish the same goal and
>>>>>>>> leverage the existing infrastructure in the kernel, albeit with the need
>>>>>>>> to make a new extension.
>>>>>>>>
>>>>>>>
>>>>>>> IMO, expecting an ISA extension to be defined for all possible
>>>>>>> microarchitectural choices is not going to scale so it is better
>>>>>>> to have infrastructure in kernel itself to infer microarchitectural
>>>>>>> choices based on RISC-V implementation ID.
>>>>>>
>>>>>> Since adding an extension seems quite unlikely, and that a device-tree
>>>>>> property is likely DT centric and not applicable to ACPI as well, was a
>>>>>> command line argument considered ?
>>>>>>
>>>>>
>>>>> I did consider adding a command line option in addition to the table,
>>>>> allowing platforms which neither have a table entry [yet] nor want to do
>>>>> the speed test, to set whatever they like. In the end, I dropped it, since
>>>>> I don't have a use case at this time. However, if we really don't want a
>>>>> table, then I can look into the command line option instead.
>>>>
>>>> Sorry if I wasn't clear, I wasn't considering this as a replacement for
>>>> your table but rather as a replacement to Charlie's compile time define
>>>> to skip misaligned speed probing since it is like "lpj=<x>". You can
>>>> specify it on command line if you want to skip the loop time detection
>>>> of loops per jiffies and have faster boot.
>>>
>>> Jesse sent out a patch for a kernel parameter to set the access speed to
>>> whatever is desired [1].
>>
>> Hey Charlie,
>>
>> Thanks but it seems you forgot to add the link ?
> 
> Oops, I frequently do that...
> 
> https://lore.kernel.org/linux-riscv/20240805173816.3722002-1-jesse@rivosinc.com/
> 
>>
>> Having configuration option + command line option seems like something
>> particularly heavy for such feature. The ifdefery/config options
>> involved in the misaligned probing code is already quite complicated. If
>> another mean to specify the misaligned speed access is added, I think
>> all configuration options to set the speed of accesses can then be
>> removed and just keep the command line. That will certainly simplify the
>> ifdef/config options.
> 
> Yeah that's why it didn't get merged because it felt like overkill. I
> responded on the thread to Anup as why I would prefer config options. It
> just comes down to config options being required to enable compiler
> features. The kernel is only built with rv64gc and usage of all other
> extensions requires hand written assembly. There are easy performance
> gains when compiling the kernel with rv64gc_zba_zbb_zbkb etc.
> Performance focused kernels will need to be recompiled anyway so I am of
> the opinion that grouping in other performance features as config
> options like this is the easiest thing to do and reduces the amount of
> code in the kernel.

As answered on the other thread, totally agree, except for the
misaligned accesses probing config options ;). Ultimately, we need
profiles configuration, either via defconfigs that enables a bunch of
optimization via ISA extension or configuration options that groups
these config options.

Clément

> 
> - Charlie
> 
>>
>> Clément
>>
>>>
>>> - Charlie
>>>
>>>> -}
>>>> -#else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
>>>> -static void __init check_unaligned_access_speed_all_cpus(void)
>>>> -{
>>>> -}
>>>> -#endif
>>>> -
>>>>  #ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
>>>>  static void check_vector_unaligned_access(struct work_struct *work __always_unused)
>>>>  {
>>>> @@ -370,6 +380,11 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
>>>>  }
>>>>  #endif
>>>>  
>>>> +static bool check_vector_unaligned_access_table(void)
>>>> +{
>>>> +	return false;
>>>> +}
>>>> +
>>>>  static int riscv_online_cpu_vec(unsigned int cpu)
>>>>  {
>>>>  	if (!has_vector()) {
>>>> @@ -377,6 +392,9 @@ static int riscv_online_cpu_vec(unsigned int cpu)
>>>>  		return 0;
>>>>  	}
>>>>  
>>>> +	if (check_vector_unaligned_access_table())
>>>> +		return 0;
>>>> +
>>>>  #ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
>>>>  	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
>>>>  		return 0;
>>>> @@ -392,13 +410,15 @@ static int __init check_unaligned_access_all_cpus(void)
>>>>  {
>>>>  	int cpu;
>>>>  
>>>> -	if (!check_unaligned_access_emulated_all_cpus())
>>>> +	if (!check_unaligned_access_table() &&
>>>> +	    !check_unaligned_access_emulated_all_cpus())
>>>>  		check_unaligned_access_speed_all_cpus();
>>>>  
>>>>  	if (!has_vector()) {
>>>>  		for_each_online_cpu(cpu)
>>>>  			per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
>>>> -	} else if (!check_vector_unaligned_access_emulated_all_cpus() &&
>>>> +	} else if (!check_vector_unaligned_access_table() &&
>>>> +		   !check_vector_unaligned_access_emulated_all_cpus() &&
>>>>  		   IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
>>>>  		kthread_run(vec_check_unaligned_access_speed_all_cpus,
>>>>  			    NULL, "vec_check_unaligned_access_speed_all_cpus");
>>>
>>>>
>>>> Regarding your table, it feels like a bit going back to old hardcoded
>>>> platform description ;). I think some kind of auto-detection of speed
>>>> (not builtin the kernel) for platforms could be good as well to skip
>>>> probing.
>>>>
>>>> A DT property also seems ok to me since the goal is to describe
>>>> hardware. Would a common DT/ACPI property be appropriate ? The
>>>> device_property API unified both so if we used some common property to
>>>> describe the misaligned access speed (both in DT cpu node/ ACPI CPU
>>>> device package), we could keep a single parsing method. But I'm no ACPI
>>>> expert so I don't know if that really make sense.
>>>>
>>>> Thanks,
>>>>
>>>> Clément
>>>>
>>>>>
>>>>> Thanks,
>>>>> drew
>>>>
>>

