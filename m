Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDA71E3780
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 18:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739297401; cv=none; b=Fgu5m/LQDrgdOq4HzvnEV6HRyFak+8NXiKYoaveN19J3wMRXa9VT4edznc3++fBPZvkEsjMlXNyYqgO3p0VaZ2lLRD9wmlxLlFTHg6MTziwnBfRmKPpmjbAtic73/VrePbbjUXcIlPMDHbHjGeMnlRwFnY2/vX81TtDtR0Lb8Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739297401; c=relaxed/simple;
	bh=fO1vbl5kkES+oKyOo5RhDVtnn3O3tXlDsIzC25nSDsA=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=ON+p+cwkTLnbgBlm7q28dn3s7u13+NTMQFfviV5w68OR9TxMjHcfZV3jyZYS4gWctp46dEm49IdRZHzgr7+lK9+xucbQV3H2qTEq7I8FA5CKWAAw1mmJ7tXA5JIsWNHl37ReF1hd/t6BoSJ3NcDGwTCAYcrFOJ+JaAUZA6qKeYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=VJwnm5YY; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="VJwnm5YY"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2fa0c039d47so8679166a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1739297398; x=1739902198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+B1FJFOZ8AgRe7T1Q8eKuIPf08noVIc4Mid2mSvqfc=;
        b=VJwnm5YYYo5BcvYfglC8X1RBps09SGR57OThQN+uw2cRu4DqwBpBGUgkRbGmmxik5Y
         UjlEGDTBKN7tsSp5zQ+gtAU9pZcxJH67SYAUDveaP6XhwvQcpUm3dR7fAo5qGfN0E+cC
         up5ay3kokZgpGaQdjbcT9loRJ4T6Jg1i/nYci3xYwmTj0ARmEUXBrqGUaCKCP6wV9jDB
         yK+vlMM9olC+GVIvcgb4thUOgCgv39sdG0ZClgyGPHAY6KhR0g85UZx14ooy1/6rUNVa
         OrwWtuxYSIq2CYjMk5OCV3EKDAvlY6XwSCY0v8ay3ThiMsoMMLb/uGu89j4gTVp8ySmI
         R7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739297398; x=1739902198;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+B1FJFOZ8AgRe7T1Q8eKuIPf08noVIc4Mid2mSvqfc=;
        b=q333HihQKNfeOY+V0mOQDYOrY3zbZzNlKQrKybviTDfCoqNS99OfiDvdWFuZst8ysv
         5mspmubKoQIsb2ToHp44ft91FBV63Fi5NnvXxczqTtWyT+h7p98LOJn5Fi0pfGnKPV5r
         PwUH2WVOYNB5g+l2NvlxHc7t9CaH/wm1W8GEnrb7AGOdnDxSlhuJpzpQzLMWNb2JsreH
         xyHDeN9Etj9gHdiNmzROD4FyIwIHri2g9XntKozOvB13h86C6rIvMysLvHNGMvLbC3yV
         IcQjA2vTy2MNfjcMHz3tZ8eKtw6DCbvNKkoCO8pRWPnKFaBkXOKG3z2L5Avub61ea4jH
         gRuA==
X-Forwarded-Encrypted: i=1; AJvYcCXx1zmgMXuHzNAA2vLXj94g6FlHmN5T/aNLQlq30GRMQb/8M7G3D1IxeKU/iyDlhuJBsTrGDxUO/QEeWNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqefbjbpNIN1a197MIGVdrvHqAj+kG5DY+cyKewYnjJyeRna9l
	8r4r+Gq6ICDD9MXD8va+7rJu1rqtDv3mpl/mVSWIyCeM08rcjOUVmIjIvNji3ik=
X-Gm-Gg: ASbGncuZCr1lPeQhlM51OULKKFEpk5qhYgH1+6gBNxrk3QCM4fP0cXryQO6o/gJUF33
	j6I69kivUr4cqg9VU6Rqmkut8w71S53Kp++2/ZyL9L0qC2iFmxeih7cyNLey4htFjqOPlmEWE18
	dQb81CNAqRZZwvB3EndoliuPMDP2bYYkscW7/l1j0lJVwJ28bO2YtsiEMU2AM9IJmaayvN9kayM
	asko5S+uvof2QbNY59CH+DS24IGyaZAdQ3dpAjxnWn+oL+joPqR7myat1bnO4yn9K5ueIN6b8AL
	OtDVEWFYvM8p
X-Google-Smtp-Source: AGHT+IGQDv0jnZktc3DKEVKFkYqmh89sujiIpX6/Iij8a9b8AkJGGU7TeMfPz6KtF6N1e/w3RBT00w==
X-Received: by 2002:a17:90b:2e41:b0:2f5:63a:449c with SMTP id 98e67ed59e1d1-2fbf5c58329mr8615a91.28.1739297398270;
        Tue, 11 Feb 2025 10:09:58 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687e675sm99119515ad.179.2025.02.11.10.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 10:09:57 -0800 (PST)
Date: Tue, 11 Feb 2025 10:09:57 -0800 (PST)
X-Google-Original-Date: Tue, 11 Feb 2025 10:09:48 PST (-0800)
Subject:     Re: [PATCH 7/9] riscv: Prepare for unaligned access type table lookups
In-Reply-To: <CAK9=C2VA-fwYwD018iTBvCmgCnX_2+L-eLzc7nLsAMtx_NCCRg@mail.gmail.com>
CC: cleger@rivosinc.com, Charlie Jenkins <charlie@rivosinc.com>,
  ajones@ventanamicro.com, anup@brainfault.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: apatel@ventanamicro.com, Conor Dooley <conor@kernel.org>
Message-ID: <mhng-2db9f262-50f6-4ed0-91a8-1268796bb331@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Mon, 10 Feb 2025 20:26:32 PST (-0800), apatel@ventanamicro.com wrote:
> On Tue, Feb 11, 2025 at 2:27 AM Clément Léger <cleger@rivosinc.com> wrote:
>>
>>
>>
>> On 10/02/2025 21:53, Charlie Jenkins wrote:
>> > On Mon, Feb 10, 2025 at 09:42:25PM +0100, Clément Léger wrote:
>> >>
>> >>
>> >> On 10/02/2025 18:20, Charlie Jenkins wrote:
>> >>> On Mon, Feb 10, 2025 at 03:20:34PM +0100, Clément Léger wrote:
>> >>>>
>> >>>>
>> >>>> On 10/02/2025 15:06, Andrew Jones wrote:
>> >>>>> On Mon, Feb 10, 2025 at 12:07:40PM +0100, Clément Léger wrote:
>> >>>>>>
>> >>>>>>
>> >>>>>> On 10/02/2025 11:16, Anup Patel wrote:
>> >>>>>>> On Sat, Feb 8, 2025 at 6:53 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
>> >>>>>>>>
>> >>>>>>>> On Fri, Feb 07, 2025 at 05:19:47PM +0100, Andrew Jones wrote:
>> >>>>>>>>> Probing unaligned accesses on boot is time consuming. Provide a
>> >>>>>>>>> function which will be used to look up the access type in a table
>> >>>>>>>>> by id registers. Vendors which provide table entries can then skip
>> >>>>>>>>> the probing.
>> >>>>>>>>
>> >>>>>>>> The access checker in my experience is only time consuming on slow
>> >>>>>>>> hardware. Hardware that supports fast unaligned accesses isn't really
>> >>>>>>>> impacted by this? Avoiding a list of hardware that has slow/fast
>> >>>>>>>> unaligned accesses in the kernel was the main reason for dynamically
>> >>>>>>>> checking. We did introduce the config option to compile the kernel with
>> >>>>>>>> assumed slow/fast accesses, which of course has the downside of
>> >>>>>>>> recompiling the kernel and I assume that you already considered that.
>> >>>>>>>
>> >>>>>>> The kconfig option does not align with the vision of running the same
>> >>>>>>> kernel image across platforms.
>> >>>>>>
>> >>>>>> I'd would be advocating to remove compile time options as well and use
>> >>>>>> another way to skip the probe (see below).
>> >>>>>>
>> >>>>>>>
>> >>>>>>>>
>> >>>>>>>> Instead of having a table in the kernel, something that would be more
>> >>>>>>>> platform agnostic would be to have an extension that signals this
>> >>>>>>>> information. That seems like it would accomplish the same goal and
>> >>>>>>>> leverage the existing infrastructure in the kernel, albeit with the need
>> >>>>>>>> to make a new extension.
>> >>>>>>>>
>> >>>>>>>
>> >>>>>>> IMO, expecting an ISA extension to be defined for all possible
>> >>>>>>> microarchitectural choices is not going to scale so it is better
>> >>>>>>> to have infrastructure in kernel itself to infer microarchitectural
>> >>>>>>> choices based on RISC-V implementation ID.
>> >>>>>>
>> >>>>>> Since adding an extension seems quite unlikely, and that a device-tree
>> >>>>>> property is likely DT centric and not applicable to ACPI as well, was a
>> >>>>>> command line argument considered ?
>> >>>>>>
>> >>>>>
>> >>>>> I did consider adding a command line option in addition to the table,
>> >>>>> allowing platforms which neither have a table entry [yet] nor want to do
>> >>>>> the speed test, to set whatever they like. In the end, I dropped it, since
>> >>>>> I don't have a use case at this time. However, if we really don't want a
>> >>>>> table, then I can look into the command line option instead.
>> >>>>
>> >>>> Sorry if I wasn't clear, I wasn't considering this as a replacement for
>> >>>> your table but rather as a replacement to Charlie's compile time define
>> >>>> to skip misaligned speed probing since it is like "lpj=<x>". You can
>> >>>> specify it on command line if you want to skip the loop time detection
>> >>>> of loops per jiffies and have faster boot.
>> >>>
>> >>> Jesse sent out a patch for a kernel parameter to set the access speed to
>> >>> whatever is desired [1].
>> >>
>> >> Hey Charlie,
>> >>
>> >> Thanks but it seems you forgot to add the link ?
>> >
>> > Oops, I frequently do that...
>> >
>> > https://lore.kernel.org/linux-riscv/20240805173816.3722002-1-jesse@rivosinc.com/
>> >
>> >>
>> >> Having configuration option + command line option seems like something
>> >> particularly heavy for such feature. The ifdefery/config options
>> >> involved in the misaligned probing code is already quite complicated. If
>> >> another mean to specify the misaligned speed access is added, I think
>> >> all configuration options to set the speed of accesses can then be
>> >> removed and just keep the command line. That will certainly simplify the
>> >> ifdef/config options.
>> >
>> > Yeah that's why it didn't get merged because it felt like overkill. I
>> > responded on the thread to Anup as why I would prefer config options. It
>> > just comes down to config options being required to enable compiler
>> > features. The kernel is only built with rv64gc and usage of all other
>> > extensions requires hand written assembly. There are easy performance
>> > gains when compiling the kernel with rv64gc_zba_zbb_zbkb etc.
>> > Performance focused kernels will need to be recompiled anyway so I am of
>> > the opinion that grouping in other performance features as config
>> > options like this is the easiest thing to do and reduces the amount of
>> > code in the kernel.
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
> misaligned access probe is fine as well.

IMO it's reasonable to have a Kconfig option that does something like 
"build a kernel that assumes misaligned accesses are fast and 
supported".  We've got a bunch of other platform-level opt ins along 
those lines (drivers, extensions, etrrata, memory stuff, etc).  It would 
almost certainly be a measurable performance boost to enable misaligned 
accesses when building Linux, it is for every other big codebase.

> I still think RISC-V
> implementation ID based microarchitecture feature discovery
> will be eventually required as well so why not add it now.

Ya, the probing loops are nasty.  We originally tried adding this to the 
DT so we didn't have to probe for it, but that got shot down.  IMO it's 
way cleaner than having tables of vendor IDs in the kernel, maybe if 
that's the backup option it'll convince the DT people to change their 
minds?

> For profiles, how about having an incremental rva23.config
> similar to 64-bit.config ? This will minimize the duplication
> by re-using the same base defconfig.

The profiles don't really tell us anything, though.  They're really just 
marketing material, vendors just ignore the actually requirements and 
stamp whatever they ship as compliant.  If we start adding configs we 
should just go with some sort of "support what shipped in 2024" type 
definitions, that'd let us Kconfig-off some cruft for supporting old 
systems while still being able to actually target something concrete.

>
> Regards,
> Anup
>
>
>
>>
>> Clément
>>
>> >
>> > - Charlie
>> >
>> >>
>> >> Clément
>> >>
>> >>>
>> >>> - Charlie
>> >>>
>> >>>> -}
>> >>>> -#else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
>> >>>> -static void __init check_unaligned_access_speed_all_cpus(void)
>> >>>> -{
>> >>>> -}
>> >>>> -#endif
>> >>>> -
>> >>>>  #ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
>> >>>>  static void check_vector_unaligned_access(struct work_struct *work __always_unused)
>> >>>>  {
>> >>>> @@ -370,6 +380,11 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
>> >>>>  }
>> >>>>  #endif
>> >>>>
>> >>>> +static bool check_vector_unaligned_access_table(void)
>> >>>> +{
>> >>>> +  return false;
>> >>>> +}
>> >>>> +
>> >>>>  static int riscv_online_cpu_vec(unsigned int cpu)
>> >>>>  {
>> >>>>    if (!has_vector()) {
>> >>>> @@ -377,6 +392,9 @@ static int riscv_online_cpu_vec(unsigned int cpu)
>> >>>>            return 0;
>> >>>>    }
>> >>>>
>> >>>> +  if (check_vector_unaligned_access_table())
>> >>>> +          return 0;
>> >>>> +
>> >>>>  #ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
>> >>>>    if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
>> >>>>            return 0;
>> >>>> @@ -392,13 +410,15 @@ static int __init check_unaligned_access_all_cpus(void)
>> >>>>  {
>> >>>>    int cpu;
>> >>>>
>> >>>> -  if (!check_unaligned_access_emulated_all_cpus())
>> >>>> +  if (!check_unaligned_access_table() &&
>> >>>> +      !check_unaligned_access_emulated_all_cpus())
>> >>>>            check_unaligned_access_speed_all_cpus();
>> >>>>
>> >>>>    if (!has_vector()) {
>> >>>>            for_each_online_cpu(cpu)
>> >>>>                    per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
>> >>>> -  } else if (!check_vector_unaligned_access_emulated_all_cpus() &&
>> >>>> +  } else if (!check_vector_unaligned_access_table() &&
>> >>>> +             !check_vector_unaligned_access_emulated_all_cpus() &&
>> >>>>               IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
>> >>>>            kthread_run(vec_check_unaligned_access_speed_all_cpus,
>> >>>>                        NULL, "vec_check_unaligned_access_speed_all_cpus");
>> >>>
>> >>>>
>> >>>> Regarding your table, it feels like a bit going back to old hardcoded
>> >>>> platform description ;). I think some kind of auto-detection of speed
>> >>>> (not builtin the kernel) for platforms could be good as well to skip
>> >>>> probing.
>> >>>>
>> >>>> A DT property also seems ok to me since the goal is to describe
>> >>>> hardware. Would a common DT/ACPI property be appropriate ? The
>> >>>> device_property API unified both so if we used some common property to
>> >>>> describe the misaligned access speed (both in DT cpu node/ ACPI CPU
>> >>>> device package), we could keep a single parsing method. But I'm no ACPI
>> >>>> expert so I don't know if that really make sense.
>> >>>>
>> >>>> Thanks,
>> >>>>
>> >>>> Clément
>> >>>>
>> >>>>>
>> >>>>> Thanks,
>> >>>>> drew
>> >>>>
>> >>
>>
