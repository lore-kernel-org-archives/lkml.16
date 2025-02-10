Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6BB26460B
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 20:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739220151; cv=none; b=u2brF1n6hZLbfC2svVVEdzsshds9OP47qlaSEhLyxGGm5G+u5js7DDnapAc8MxhIS9dxorc6Axmjd7KUTuetQ4NBKYCZJJW4wU6pEJoull16PPv0wLsnHizQi3PGe5zG3qTW3R/h0qeFg3aV3058Tqoc2haRvBZrtiZhvX5xpwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739220151; c=relaxed/simple;
	bh=+h+v4sb8bfKW3Mp5PA7hzg6+26KDKamZrTZaF+H4C/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jMPwhDVlpcZv8J+qgqQj333pA6UoCPSBdTFe7xYXiMjYzARLVc9+oq7zw8Rcufd1J+IV4916XZbQdpwMN4JIE7doHXCVTorNYAzfF4X55gh8CK8PIGR9NYvPourzinpef5El5qP4fHWVCJFJFiMtlkKXe34rNQ7Rd2/TomlnE2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=aM5VPYws; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="aM5VPYws"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso48280795e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739220147; x=1739824947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ngk+2o11cwbjEOvuqJJSSg9EaVmpQRDEI1AAFOBfzJ8=;
        b=aM5VPYwsP02folu9h9EtnrHdx19Ww/5zuiX3qQNOwEy7yuMU00ofd4DbDdB7b+/SkZ
         9y/paLf3j544YW4uocd9MRPSHO7lzoxRW/Qkc1l7QyB4hbhUQJlJNSEB9pnYsNwSYTv9
         xyFHGwrcpEsNorhXdlLXN3QI3wquzPH5aerhFjVtrg/9Mu8+MhR7WPK/8oOF5DNC/WLx
         NJBg1vxRbrxaH00hAn9CDOLz0eqHAKocpYqJbZhUzETPwXFqncgJX3vP3ZBoQfGj86dG
         lOMjFKWciHnaqh11nq7g+Qx34qJlYIkZ+rc52Cn9Ss61NB/EMpzCkoaWFwkSNgRpgwyP
         38YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739220147; x=1739824947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ngk+2o11cwbjEOvuqJJSSg9EaVmpQRDEI1AAFOBfzJ8=;
        b=GwHpKSpMeV2Ho4zX4y07QA7dGvB01xfTgBSqhoQ66IUhf9xFm230OL7UWU6IOQD3Gt
         /19hdo/7vgo85Yc1IzFOwFhU1p0Wb6LDhv69smoYZnwDTmziewoVWEHt1SGA/iy5C4Qb
         vVuq9D7YfbwPCCLNTBl56CO7lQKjeDpCTOu8E6D11IraAc7DhgSujv3wJeiSSjCtWdSI
         84oCx9YYiHdHBiwhFwswEBF6x12QR5GwFjahIFHzAyn+xvqpQz9M2FKu0K3nLyF7xAtn
         mJzGBRLz1DIXGSNvrcikYx9cIqtkBiII6FcYru/YBTQSPC/LCSQIhjABLOGGCyVOLbOH
         ZeFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1ptJ8cGO1mrTXeqIKmWD2KrC+uYnYkH+gGRMPKb4ZNCPl8rZWTYIG8Ukk6TlbsixQUvlsffJJN9QL1qI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI91CEfU9hwhLt6sE5K0Xab125b0fmOSE6e/TmGQTtz4ZQXGfo
	yucMbdZkvQ7Ej58k2+3Bprgr8roFZ390FMEabC6JZ5omx4/4V+iRZbeEi1kOUTU=
X-Gm-Gg: ASbGncv3tDUM7cGC6mPf9fA5ogoekzFCpq34sTEsHUrblCkdu6RalLbFD9SJ/b2oIXy
	dyjzHFXM5g+QiR+71qSztG7T46pJk/9waikpW8HEu9wD3Lvds9ewzOIZs0HV5ucvMab1hvZfBTc
	SXjl/0VEvJ5InXx+NuSpEkbL1UTsc+f9hMzGRU1vjs8zSWkBtuEptwx0Yz5ASQhwz1HSpKw72mf
	JOnHBl3TJNogqeELPau5tqAKmctxYbBnhDhnO7yCZo+mKsZqUqRjmQTBR8FZGwpOVC9/iYoK7mS
	gCwBfd9CiDDXccF4adar6lyz2Dm1aY9qx9zCMxC06CXT5Z5wYMPjpqHW0Tfi
X-Google-Smtp-Source: AGHT+IGf4kCwuAGcajiCoiFPLziEZ6q6Y8ZmC1h98VuSEnA8m72g4JwD12AEMH0pnvNSvi/JJXV1Pw==
X-Received: by 2002:a05:600c:3c84:b0:435:32e:8270 with SMTP id 5b1f17b1804b1-43924991e0cmr125873475e9.14.1739220147395;
        Mon, 10 Feb 2025 12:42:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4393963c84esm77234155e9.27.2025.02.10.12.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 12:42:26 -0800 (PST)
Message-ID: <015a8a52-6a49-41b9-95b4-5e8260d45776@rivosinc.com>
Date: Mon, 10 Feb 2025 21:42:25 +0100
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
 paul.walmsley@sifive.com, palmer@dabbelt.com, jesse@rivosinc.com,
 Anup Patel <apatel@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com> <Z6ax7B45OsGerjfA@ghost>
 <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
 <c6f98a70-b1c7-4955-bf5d-546e4563cf1c@rivosinc.com>
 <20250210-e6a2dfcd7995ffc8a6d918e4@orel>
 <e1fae51d-3511-4bcf-afbf-4e690905ccda@rivosinc.com> <Z6o1bQLJ8aUyjvrQ@ghost>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <Z6o1bQLJ8aUyjvrQ@ghost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/02/2025 18:20, Charlie Jenkins wrote:
> On Mon, Feb 10, 2025 at 03:20:34PM +0100, Clément Léger wrote:
>>
>>
>> On 10/02/2025 15:06, Andrew Jones wrote:
>>> On Mon, Feb 10, 2025 at 12:07:40PM +0100, Clément Léger wrote:
>>>>
>>>>
>>>> On 10/02/2025 11:16, Anup Patel wrote:
>>>>> On Sat, Feb 8, 2025 at 6:53 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
>>>>>>
>>>>>> On Fri, Feb 07, 2025 at 05:19:47PM +0100, Andrew Jones wrote:
>>>>>>> Probing unaligned accesses on boot is time consuming. Provide a
>>>>>>> function which will be used to look up the access type in a table
>>>>>>> by id registers. Vendors which provide table entries can then skip
>>>>>>> the probing.
>>>>>>
>>>>>> The access checker in my experience is only time consuming on slow
>>>>>> hardware. Hardware that supports fast unaligned accesses isn't really
>>>>>> impacted by this? Avoiding a list of hardware that has slow/fast
>>>>>> unaligned accesses in the kernel was the main reason for dynamically
>>>>>> checking. We did introduce the config option to compile the kernel with
>>>>>> assumed slow/fast accesses, which of course has the downside of
>>>>>> recompiling the kernel and I assume that you already considered that.
>>>>>
>>>>> The kconfig option does not align with the vision of running the same
>>>>> kernel image across platforms.
>>>>
>>>> I'd would be advocating to remove compile time options as well and use
>>>> another way to skip the probe (see below).
>>>>
>>>>>
>>>>>>
>>>>>> Instead of having a table in the kernel, something that would be more
>>>>>> platform agnostic would be to have an extension that signals this
>>>>>> information. That seems like it would accomplish the same goal and
>>>>>> leverage the existing infrastructure in the kernel, albeit with the need
>>>>>> to make a new extension.
>>>>>>
>>>>>
>>>>> IMO, expecting an ISA extension to be defined for all possible
>>>>> microarchitectural choices is not going to scale so it is better
>>>>> to have infrastructure in kernel itself to infer microarchitectural
>>>>> choices based on RISC-V implementation ID.
>>>>
>>>> Since adding an extension seems quite unlikely, and that a device-tree
>>>> property is likely DT centric and not applicable to ACPI as well, was a
>>>> command line argument considered ?
>>>>
>>>
>>> I did consider adding a command line option in addition to the table,
>>> allowing platforms which neither have a table entry [yet] nor want to do
>>> the speed test, to set whatever they like. In the end, I dropped it, since
>>> I don't have a use case at this time. However, if we really don't want a
>>> table, then I can look into the command line option instead.
>>
>> Sorry if I wasn't clear, I wasn't considering this as a replacement for
>> your table but rather as a replacement to Charlie's compile time define
>> to skip misaligned speed probing since it is like "lpj=<x>". You can
>> specify it on command line if you want to skip the loop time detection
>> of loops per jiffies and have faster boot.
> 
> Jesse sent out a patch for a kernel parameter to set the access speed to
> whatever is desired [1].

Hey Charlie,

Thanks but it seems you forgot to add the link ?

Having configuration option + command line option seems like something
particularly heavy for such feature. The ifdefery/config options
involved in the misaligned probing code is already quite complicated. If
another mean to specify the misaligned speed access is added, I think
all configuration options to set the speed of accesses can then be
removed and just keep the command line. That will certainly simplify the
ifdef/config options.

Clément

> 
> - Charlie
> 
>> -}
>> -#else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
>> -static void __init check_unaligned_access_speed_all_cpus(void)
>> -{
>> -}
>> -#endif
>> -
>>  #ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
>>  static void check_vector_unaligned_access(struct work_struct *work __always_unused)
>>  {
>> @@ -370,6 +380,11 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
>>  }
>>  #endif
>>  
>> +static bool check_vector_unaligned_access_table(void)
>> +{
>> +	return false;
>> +}
>> +
>>  static int riscv_online_cpu_vec(unsigned int cpu)
>>  {
>>  	if (!has_vector()) {
>> @@ -377,6 +392,9 @@ static int riscv_online_cpu_vec(unsigned int cpu)
>>  		return 0;
>>  	}
>>  
>> +	if (check_vector_unaligned_access_table())
>> +		return 0;
>> +
>>  #ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
>>  	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
>>  		return 0;
>> @@ -392,13 +410,15 @@ static int __init check_unaligned_access_all_cpus(void)
>>  {
>>  	int cpu;
>>  
>> -	if (!check_unaligned_access_emulated_all_cpus())
>> +	if (!check_unaligned_access_table() &&
>> +	    !check_unaligned_access_emulated_all_cpus())
>>  		check_unaligned_access_speed_all_cpus();
>>  
>>  	if (!has_vector()) {
>>  		for_each_online_cpu(cpu)
>>  			per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
>> -	} else if (!check_vector_unaligned_access_emulated_all_cpus() &&
>> +	} else if (!check_vector_unaligned_access_table() &&
>> +		   !check_vector_unaligned_access_emulated_all_cpus() &&
>>  		   IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
>>  		kthread_run(vec_check_unaligned_access_speed_all_cpus,
>>  			    NULL, "vec_check_unaligned_access_speed_all_cpus");
> 
>>
>> Regarding your table, it feels like a bit going back to old hardcoded
>> platform description ;). I think some kind of auto-detection of speed
>> (not builtin the kernel) for platforms could be good as well to skip
>> probing.
>>
>> A DT property also seems ok to me since the goal is to describe
>> hardware. Would a common DT/ACPI property be appropriate ? The
>> device_property API unified both so if we used some common property to
>> describe the misaligned access speed (both in DT cpu node/ ACPI CPU
>> device package), we could keep a single parsing method. But I'm no ACPI
>> expert so I don't know if that really make sense.
>>
>> Thanks,
>>
>> Clément
>>
>>>
>>> Thanks,
>>> drew
>>

