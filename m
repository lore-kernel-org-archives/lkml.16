Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B072E1F03C4
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263030; cv=none; b=U25UWlgC9iNyrmkFrsP0c/T0v+8DScqU51gInMf/ywDxKZHNmnqh7IO7fUIowQzQpC0/FWyt9T/4bX4u/kaAeN42VAgnksxpEbZTL7EAhpT+IL8Bq2u/c1zQhOPy+mUUjRYjN4vlZ5L2713TUweaVY8IkW1Nxj231eGa8GjMzgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263030; c=relaxed/simple;
	bh=TA05eToz2w50Sk2vWhRvbzZGRYsK/Y8WYg8l61Alf0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W0oR6edcBSNFor6NqdSfPEEx3igVUn3sJLTTxYGJoP+vc5dxm4CgC01lmGiR8rL+K8E0V9SHUejv//9RwfxpT6cIofSGQZXt1EQiPMqoGISFOcTG/V4/hUPFcWw4dqRhMQfwIJIGarqSfpV6exMdLaPN6bMslTQh6H0H99HAfEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=2LgTmRvG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="2LgTmRvG"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-439307d83f0so17632505e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739263026; x=1739867826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S99xwu7U8quyanJe/WSaVeVnHSU8YL/si15S0Q1EK8g=;
        b=2LgTmRvGm0zdl84qqgaTyfu0DYx2FEh3sjJcPjEQbbzSTk4d+ZIsrjpQAbGiZIN+F3
         QgMtO47ep6n1NFth0bBjCMRaQgBB5s1O3u2ITODnbGHA8Hk5HhHCuFnVku4gfjp1qE7z
         +uV1Fx4+Ap/c16bXCcvvIOF/oWERaY5bHki2+GEMCzl+4ofj2b2bsUcOobtIeodK37vI
         dmMrbQ3t1TL7jCe3teoeoNPZSwD2embbQrHMl19zkrj+1ZZa+EVvKwGfe0q3Cwl+npeO
         UBSSdOJOMWo22ee+CgemSg0Gqp5XbETX2IQt4iiVe+xkQYeDF+Q+T+Rek+pFKB3psWsx
         kCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739263026; x=1739867826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S99xwu7U8quyanJe/WSaVeVnHSU8YL/si15S0Q1EK8g=;
        b=i4LvLWOQ/jXZMU58Roqh+r288Xgqoem2F+GSkwbVTJn6LFkLjiowXWRO0s9vDWbvQw
         mTX+yKWUpvdo5FrJ7V375c7InrXpcl4phYzUL9sV6WKJg8p8UVvPIgVLV3+KMxk/6KZ/
         SZboM84Agxfnc+1g66MN7sn2W3DvQI7dHXxO7coM90QO5GRrQmP4A8zbAnv2b75vGqBf
         PGYx3YI0BANIqN7D+BI3LeDs0e6WG/uVfAeAzwSZ2PoQEwN6GDtWBSKi9/uqx/pt5PeF
         HkEveDp9g3GuOVBi1SpHCQ6EGuhgsdjgDjBMvvEC3BhcVr+Y80r3y7xI8T1tL/JwM7Oa
         VOTA==
X-Forwarded-Encrypted: i=1; AJvYcCU0FicGxYFgNReVMi4lV0gGuHNbYtRi7V7v0Swe21ZFsFQrejf5OyCV1K55PKnDcGpD/cRa4P51BPoky3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzE1SXp5RgNWVem0Ne5TkBC1qTt9jPfh0YZZIHtFlguAfxHIpy
	8hh/fjhjdUG3WPZ4cQLCkOETBLiFWXGCn6Bu2EL8TnlQay6++VDH4b6joAF1K0A=
X-Gm-Gg: ASbGncuXNtSeeuw2pHkkqL+OfnXPuSNkNoP3ClgiGBjNJjJsdrnPC5EDn2+khrxpNGq
	PJYjfwSfcyI3uyGlgZBM+/0lP//Jshmk11M1cQ4y+H1WjzclHZSdibTSE/xruJwKkaO2kmhNp8U
	NcK9/hkk9OIDhCqyYH0yeo5NSpgIgOdP3E1HTmbHSHSxtIuPd6RkDMTQVgiV/mFWmaQN2MDT43p
	+XpjS/lfFsSqKwJg65scP1pbtbF3KsxaPno2sGVTcxEPeOKQc3Df6uh7HA17EJzcd7oom5SgnDz
	YSNIYGPCyTD4GY+mxuqC19guttpVGKxDhe23CUT7gM6JTefi21UwapMQfoY4
X-Google-Smtp-Source: AGHT+IGmxgvWJ1TFlKw1hH4XVM/4dXafBtEEQvZkpmYGg9DlQhWhAP60JkOui7BzAWFGgsrhQych3g==
X-Received: by 2002:a05:600c:cc8:b0:434:feb1:adcf with SMTP id 5b1f17b1804b1-439249ca918mr108186075e9.25.1739263025848;
        Tue, 11 Feb 2025 00:37:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394df55f51sm12164565e9.0.2025.02.11.00.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 00:37:05 -0800 (PST)
Message-ID: <91bc69ae-0ea4-4ee3-84c0-0e2ffea0da31@rivosinc.com>
Date: Tue, 11 Feb 2025 09:37:04 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
To: Anup Patel <apatel@ventanamicro.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com> <Z6ax7B45OsGerjfA@ghost>
 <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
 <c6f98a70-b1c7-4955-bf5d-546e4563cf1c@rivosinc.com>
 <20250210-e6a2dfcd7995ffc8a6d918e4@orel>
 <e1fae51d-3511-4bcf-afbf-4e690905ccda@rivosinc.com> <Z6o1bQLJ8aUyjvrQ@ghost>
 <015a8a52-6a49-41b9-95b4-5e8260d45776@rivosinc.com> <Z6pnTG7YoiDW_Gkq@ghost>
 <fb67c9e8-0de4-4e11-929a-49d36e81a1a2@rivosinc.com>
 <CAK9=C2VA-fwYwD018iTBvCmgCnX_2+L-eLzc7nLsAMtx_NCCRg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAK9=C2VA-fwYwD018iTBvCmgCnX_2+L-eLzc7nLsAMtx_NCCRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/02/2025 05:26, Anup Patel wrote:
> On Tue, Feb 11, 2025 at 2:27 AM Clément Léger <cleger@rivosinc.com> wrote:
>>
>>
>>
>> On 10/02/2025 21:53, Charlie Jenkins wrote:
>>> On Mon, Feb 10, 2025 at 09:42:25PM +0100, Clément Léger wrote:
>>>>
>>>>
>>>> On 10/02/2025 18:20, Charlie Jenkins wrote:
>>>>> On Mon, Feb 10, 2025 at 03:20:34PM +0100, Clément Léger wrote:
>>>>>>
>>>>>>
>>>>>> On 10/02/2025 15:06, Andrew Jones wrote:
>>>>>>> On Mon, Feb 10, 2025 at 12:07:40PM +0100, Clément Léger wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 10/02/2025 11:16, Anup Patel wrote:
>>>>>>>>> On Sat, Feb 8, 2025 at 6:53 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
>>>>>>>>>>
>>>>>>>>>> On Fri, Feb 07, 2025 at 05:19:47PM +0100, Andrew Jones wrote:
>>>>>>>>>>> Probing unaligned accesses on boot is time consuming. Provide a
>>>>>>>>>>> function which will be used to look up the access type in a table
>>>>>>>>>>> by id registers. Vendors which provide table entries can then skip
>>>>>>>>>>> the probing.
>>>>>>>>>>
>>>>>>>>>> The access checker in my experience is only time consuming on slow
>>>>>>>>>> hardware. Hardware that supports fast unaligned accesses isn't really
>>>>>>>>>> impacted by this? Avoiding a list of hardware that has slow/fast
>>>>>>>>>> unaligned accesses in the kernel was the main reason for dynamically
>>>>>>>>>> checking. We did introduce the config option to compile the kernel with
>>>>>>>>>> assumed slow/fast accesses, which of course has the downside of
>>>>>>>>>> recompiling the kernel and I assume that you already considered that.
>>>>>>>>>
>>>>>>>>> The kconfig option does not align with the vision of running the same
>>>>>>>>> kernel image across platforms.
>>>>>>>>
>>>>>>>> I'd would be advocating to remove compile time options as well and use
>>>>>>>> another way to skip the probe (see below).
>>>>>>>>
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Instead of having a table in the kernel, something that would be more
>>>>>>>>>> platform agnostic would be to have an extension that signals this
>>>>>>>>>> information. That seems like it would accomplish the same goal and
>>>>>>>>>> leverage the existing infrastructure in the kernel, albeit with the need
>>>>>>>>>> to make a new extension.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> IMO, expecting an ISA extension to be defined for all possible
>>>>>>>>> microarchitectural choices is not going to scale so it is better
>>>>>>>>> to have infrastructure in kernel itself to infer microarchitectural
>>>>>>>>> choices based on RISC-V implementation ID.
>>>>>>>>
>>>>>>>> Since adding an extension seems quite unlikely, and that a device-tree
>>>>>>>> property is likely DT centric and not applicable to ACPI as well, was a
>>>>>>>> command line argument considered ?
>>>>>>>>
>>>>>>>
>>>>>>> I did consider adding a command line option in addition to the table,
>>>>>>> allowing platforms which neither have a table entry [yet] nor want to do
>>>>>>> the speed test, to set whatever they like. In the end, I dropped it, since
>>>>>>> I don't have a use case at this time. However, if we really don't want a
>>>>>>> table, then I can look into the command line option instead.
>>>>>>
>>>>>> Sorry if I wasn't clear, I wasn't considering this as a replacement for
>>>>>> your table but rather as a replacement to Charlie's compile time define
>>>>>> to skip misaligned speed probing since it is like "lpj=<x>". You can
>>>>>> specify it on command line if you want to skip the loop time detection
>>>>>> of loops per jiffies and have faster boot.
>>>>>
>>>>> Jesse sent out a patch for a kernel parameter to set the access speed to
>>>>> whatever is desired [1].
>>>>
>>>> Hey Charlie,
>>>>
>>>> Thanks but it seems you forgot to add the link ?
>>>
>>> Oops, I frequently do that...
>>>
>>> https://lore.kernel.org/linux-riscv/20240805173816.3722002-1-jesse@rivosinc.com/
>>>
>>>>
>>>> Having configuration option + command line option seems like something
>>>> particularly heavy for such feature. The ifdefery/config options
>>>> involved in the misaligned probing code is already quite complicated. If
>>>> another mean to specify the misaligned speed access is added, I think
>>>> all configuration options to set the speed of accesses can then be
>>>> removed and just keep the command line. That will certainly simplify the
>>>> ifdef/config options.
>>>
>>> Yeah that's why it didn't get merged because it felt like overkill. I
>>> responded on the thread to Anup as why I would prefer config options. It
>>> just comes down to config options being required to enable compiler
>>> features. The kernel is only built with rv64gc and usage of all other
>>> extensions requires hand written assembly. There are easy performance
>>> gains when compiling the kernel with rv64gc_zba_zbb_zbkb etc.
>>> Performance focused kernels will need to be recompiled anyway so I am of
>>> the opinion that grouping in other performance features as config
>>> options like this is the easiest thing to do and reduces the amount of
>>> code in the kernel.
>>
>> As answered on the other thread, totally agree, except for the
>> misaligned accesses probing config options ;). Ultimately, we need
>> profiles configuration, either via defconfigs that enables a bunch of
>> optimization via ISA extension or configuration options that groups
>> these config options.
> 
> I agree.
> 
> Kconfig options for ISA extensions are fine but not for
> misaligned access. The kernel command-line option to skip
> misaligned access probe is fine as well. I still think RISC-V
> implementation ID based microarchitecture feature discovery
> will be eventually required as well so why not add it now.

As said by Charlie, keeping an internal list of IDs that needs to be
updated/submitted to add new ones is quite a burden to maintain. IMHO,
this would be better to be put in ACPI or DT description since it purely
describe hardware behavior.

But you said it will be "eventually required" so you might have some
specific use-case in mind ?

> 
> For profiles, how about having an incremental rva23.config
> similar to 64-bit.config ? This will minimize the duplication
> by re-using the same base defconfig.

.config or a CONFIG_PROFILE option that allow to select the profile for
to be supported (CONFIG_PROFILE_RVA23). Using profile config options
might be better though since we can have better dependencies/select
between profiles rather than duplicating them in various profile
.config. So I might be in favor of a CONFIG_PROFILE rather than a
.config per profile.

BTW, that's not totally exclusive, if we want to add a rva23.config that
contains CONFIG_PROFILE_RVA23=y, that works as well, although a bit
overkill ;).

Regards,

Clément

> 
> Regards,
> Anup
> 
> 
> 
>>
>> Clément
>>
>>>
>>> - Charlie
>>>
>>>>
>>>> Clément
>>>>
>>>>>
>>>>> - Charlie
>>>>>
>>>>>> -}
>>>>>> -#else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
>>>>>> -static void __init check_unaligned_access_speed_all_cpus(void)
>>>>>> -{
>>>>>> -}
>>>>>> -#endif
>>>>>> -
>>>>>>  #ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
>>>>>>  static void check_vector_unaligned_access(struct work_struct *work __always_unused)
>>>>>>  {
>>>>>> @@ -370,6 +380,11 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
>>>>>>  }
>>>>>>  #endif
>>>>>>
>>>>>> +static bool check_vector_unaligned_access_table(void)
>>>>>> +{
>>>>>> +  return false;
>>>>>> +}
>>>>>> +
>>>>>>  static int riscv_online_cpu_vec(unsigned int cpu)
>>>>>>  {
>>>>>>    if (!has_vector()) {
>>>>>> @@ -377,6 +392,9 @@ static int riscv_online_cpu_vec(unsigned int cpu)
>>>>>>            return 0;
>>>>>>    }
>>>>>>
>>>>>> +  if (check_vector_unaligned_access_table())
>>>>>> +          return 0;
>>>>>> +
>>>>>>  #ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
>>>>>>    if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
>>>>>>            return 0;
>>>>>> @@ -392,13 +410,15 @@ static int __init check_unaligned_access_all_cpus(void)
>>>>>>  {
>>>>>>    int cpu;
>>>>>>
>>>>>> -  if (!check_unaligned_access_emulated_all_cpus())
>>>>>> +  if (!check_unaligned_access_table() &&
>>>>>> +      !check_unaligned_access_emulated_all_cpus())
>>>>>>            check_unaligned_access_speed_all_cpus();
>>>>>>
>>>>>>    if (!has_vector()) {
>>>>>>            for_each_online_cpu(cpu)
>>>>>>                    per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
>>>>>> -  } else if (!check_vector_unaligned_access_emulated_all_cpus() &&
>>>>>> +  } else if (!check_vector_unaligned_access_table() &&
>>>>>> +             !check_vector_unaligned_access_emulated_all_cpus() &&
>>>>>>               IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
>>>>>>            kthread_run(vec_check_unaligned_access_speed_all_cpus,
>>>>>>                        NULL, "vec_check_unaligned_access_speed_all_cpus");
>>>>>
>>>>>>
>>>>>> Regarding your table, it feels like a bit going back to old hardcoded
>>>>>> platform description ;). I think some kind of auto-detection of speed
>>>>>> (not builtin the kernel) for platforms could be good as well to skip
>>>>>> probing.
>>>>>>
>>>>>> A DT property also seems ok to me since the goal is to describe
>>>>>> hardware. Would a common DT/ACPI property be appropriate ? The
>>>>>> device_property API unified both so if we used some common property to
>>>>>> describe the misaligned access speed (both in DT cpu node/ ACPI CPU
>>>>>> device package), we could keep a single parsing method. But I'm no ACPI
>>>>>> expert so I don't know if that really make sense.
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>> Clément
>>>>>>
>>>>>>>
>>>>>>> Thanks,
>>>>>>> drew
>>>>>>
>>>>
>>

