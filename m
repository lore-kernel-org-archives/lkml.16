Received: from mail-yw1-f195.google.com (mail-yw1-f195.google.com [209.85.128.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2EA264609
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 20:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739220818; cv=none; b=NfSqQWX9qma57Zx7ljjtZ0KLic/IumBG3mG9izcT2tBbYFnMR+DAITszEYQ0tGqRKn7Rgkrr1ioSKTxgFrBXSzIZ4sGBrIhfYyZt2oOeQkbtm8J5WuVD0aTnYD54WCKaDXTVgHsBHHXYReRo8ZK/bYUY+ydoDc8qIdzqeRbg5b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739220818; c=relaxed/simple;
	bh=vjFb2OcwdbIS0nUDKxfMHrclwkRrjemPrJi/ucR98xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gy1Qdph5JctPGbdE9DJD4JqvtSYC9lMl9wZ4JGHWYdFHCi1dzY/VJOcbA2GYtBRMFiG7OkUhwzS5TjDBdLNjGAGvEzgOC1Ox7lo4vP6IbAGvcASQM3H+6F58Sc+e57UZznprEsXSsJEAnqfAdRKbgLBLg2aTqMAHjTNursEW8TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=SMxzyk1g; arc=none smtp.client-ip=209.85.128.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="SMxzyk1g"
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-6f6ca1a8aa6so27273597b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739220815; x=1739825615; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SLAa1BKEsAml/EQbXgNElXATdgTAKpFsheqm1ORqCrY=;
        b=SMxzyk1gaetqmuAdFjWw8gJ2khIqA4sMDLzV1kOBhvY9As4ZP0xuADojXI31S8XPt7
         FAyL3Yd/UCOeK0pNUaIUU5428EN3TvXOE3HZ0usjHhK1ya1Gy1bhTxNeBeRQA2kSyj7k
         1ExqWjR6+uEga7sT3TvLe5sBdpKNPk+PGXFWXytRieiIhva8uk6hyifTtlEMB3O9p8Gb
         6nBc/fC1D8hQtROijB1Fs0Q4poOqBcEK6lv+P19xQ0LHli4KK1vsj2tHE8FjjJbDz3ZI
         hLlIXZO9jxEk7NP35JipBCir9YolfpT6hDHa5Y8lsIel948Xu3gvuxBvsXvp92owZy75
         8HTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739220815; x=1739825615;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SLAa1BKEsAml/EQbXgNElXATdgTAKpFsheqm1ORqCrY=;
        b=HX8je0h/0D+9Q/QH580NgvG6CltoflSbnfq3xPx2a+z970v/xAMn/jlXkX3WIukJT1
         9L5tUHE1Cum4SsJtVWq1XEdI5aAI1S/RIJIp145CotVtpNo+Hz3J8ntuu3GPJWXRuLBq
         nPrt/i97MydcZWbMSUnDKtiyo5zLnlOEwuxn2LmqMZ3lS8CTT9qdeqrImbEIeCDOx3EW
         r1TaVWAiukC3kaBpt3UEN/Unz3avlN3Kk9OWNdhNsCns218YmdnWFngTC9Qe1FkZDagU
         xCmAbuwMcuyWQdirdrUSbuIHpsc+A8kFqkunkNUt21stFGGmw4CA5bDd2x8fMb8emN5L
         CV/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVeXOCOmgluRyTmx8dWGwNjlssxRPNCFPwZg73CmJDRrVnriBaLP/2gjtSi2XQ9m6E8SbQnu8tdpTYiM6o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvvxs3mjz8RWfjJhDM4pWON/IR0aHAwHvqJhEvyATVjVG8vgAp
	8FYY73rNKGyomFVyOfpc5ElESXl+LzRfUgwQb9gZWm2YvV3XrJgYkyCEtAZHniQ=
X-Gm-Gg: ASbGncubAmdH8+mzNOCgWzxAjkQsT+WkrfHcbSEAKZx5NNQLtgPShomB+yTy43bUJkC
	Wet8rFmGGEtog3mP8R+FUbarDgbqc4c7sxGxy7rBmUq74HhrB8hSpJxTJububO9cbbKWjCYmD6n
	yrfWSyyVrqejvy92DJYkmR2eQ7Z4Uim5XmHTIdfb5IaGU8oMeFPv0/qM8cRrVxXaDifdRzuH6wu
	6fsCPhOyBiYdi1EblBDfxFv8I6ldrxqA6h4MhJ/UTb+Zz8KPU0bXEP+dhZg3SIU3zdUKzZVmZpZ
	oXY=
X-Google-Smtp-Source: AGHT+IH0bbRLBOuosMUk1KWSGgc288AFzfJ4nEB6hFoRhqUOD7HEq12omD4VxMkgi+HrRIX9zaTKoA==
X-Received: by 2002:a05:690c:4801:b0:6f9:8916:3b69 with SMTP id 00721157ae682-6f9b2844150mr129922107b3.5.1739220814933;
        Mon, 10 Feb 2025 12:53:34 -0800 (PST)
Received: from ghost ([50.146.0.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99fd39430sm18231937b3.48.2025.02.10.12.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:53:34 -0800 (PST)
Date: Mon, 10 Feb 2025 12:53:32 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	"palmer@dabbelt.com Anup Patel" <apatel@ventanamicro.com>
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
Message-ID: <Z6pnTG7YoiDW_Gkq@ghost>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com>
 <Z6ax7B45OsGerjfA@ghost>
 <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
 <c6f98a70-b1c7-4955-bf5d-546e4563cf1c@rivosinc.com>
 <20250210-e6a2dfcd7995ffc8a6d918e4@orel>
 <e1fae51d-3511-4bcf-afbf-4e690905ccda@rivosinc.com>
 <Z6o1bQLJ8aUyjvrQ@ghost>
 <015a8a52-6a49-41b9-95b4-5e8260d45776@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <015a8a52-6a49-41b9-95b4-5e8260d45776@rivosinc.com>

On Mon, Feb 10, 2025 at 09:42:25PM +0100, Clément Léger wrote:
> 
> 
> On 10/02/2025 18:20, Charlie Jenkins wrote:
> > On Mon, Feb 10, 2025 at 03:20:34PM +0100, Clément Léger wrote:
> >>
> >>
> >> On 10/02/2025 15:06, Andrew Jones wrote:
> >>> On Mon, Feb 10, 2025 at 12:07:40PM +0100, Clément Léger wrote:
> >>>>
> >>>>
> >>>> On 10/02/2025 11:16, Anup Patel wrote:
> >>>>> On Sat, Feb 8, 2025 at 6:53 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
> >>>>>>
> >>>>>> On Fri, Feb 07, 2025 at 05:19:47PM +0100, Andrew Jones wrote:
> >>>>>>> Probing unaligned accesses on boot is time consuming. Provide a
> >>>>>>> function which will be used to look up the access type in a table
> >>>>>>> by id registers. Vendors which provide table entries can then skip
> >>>>>>> the probing.
> >>>>>>
> >>>>>> The access checker in my experience is only time consuming on slow
> >>>>>> hardware. Hardware that supports fast unaligned accesses isn't really
> >>>>>> impacted by this? Avoiding a list of hardware that has slow/fast
> >>>>>> unaligned accesses in the kernel was the main reason for dynamically
> >>>>>> checking. We did introduce the config option to compile the kernel with
> >>>>>> assumed slow/fast accesses, which of course has the downside of
> >>>>>> recompiling the kernel and I assume that you already considered that.
> >>>>>
> >>>>> The kconfig option does not align with the vision of running the same
> >>>>> kernel image across platforms.
> >>>>
> >>>> I'd would be advocating to remove compile time options as well and use
> >>>> another way to skip the probe (see below).
> >>>>
> >>>>>
> >>>>>>
> >>>>>> Instead of having a table in the kernel, something that would be more
> >>>>>> platform agnostic would be to have an extension that signals this
> >>>>>> information. That seems like it would accomplish the same goal and
> >>>>>> leverage the existing infrastructure in the kernel, albeit with the need
> >>>>>> to make a new extension.
> >>>>>>
> >>>>>
> >>>>> IMO, expecting an ISA extension to be defined for all possible
> >>>>> microarchitectural choices is not going to scale so it is better
> >>>>> to have infrastructure in kernel itself to infer microarchitectural
> >>>>> choices based on RISC-V implementation ID.
> >>>>
> >>>> Since adding an extension seems quite unlikely, and that a device-tree
> >>>> property is likely DT centric and not applicable to ACPI as well, was a
> >>>> command line argument considered ?
> >>>>
> >>>
> >>> I did consider adding a command line option in addition to the table,
> >>> allowing platforms which neither have a table entry [yet] nor want to do
> >>> the speed test, to set whatever they like. In the end, I dropped it, since
> >>> I don't have a use case at this time. However, if we really don't want a
> >>> table, then I can look into the command line option instead.
> >>
> >> Sorry if I wasn't clear, I wasn't considering this as a replacement for
> >> your table but rather as a replacement to Charlie's compile time define
> >> to skip misaligned speed probing since it is like "lpj=<x>". You can
> >> specify it on command line if you want to skip the loop time detection
> >> of loops per jiffies and have faster boot.
> > 
> > Jesse sent out a patch for a kernel parameter to set the access speed to
> > whatever is desired [1].
> 
> Hey Charlie,
> 
> Thanks but it seems you forgot to add the link ?

Oops, I frequently do that...

https://lore.kernel.org/linux-riscv/20240805173816.3722002-1-jesse@rivosinc.com/

> 
> Having configuration option + command line option seems like something
> particularly heavy for such feature. The ifdefery/config options
> involved in the misaligned probing code is already quite complicated. If
> another mean to specify the misaligned speed access is added, I think
> all configuration options to set the speed of accesses can then be
> removed and just keep the command line. That will certainly simplify the
> ifdef/config options.

Yeah that's why it didn't get merged because it felt like overkill. I
responded on the thread to Anup as why I would prefer config options. It
just comes down to config options being required to enable compiler
features. The kernel is only built with rv64gc and usage of all other
extensions requires hand written assembly. There are easy performance
gains when compiling the kernel with rv64gc_zba_zbb_zbkb etc.
Performance focused kernels will need to be recompiled anyway so I am of
the opinion that grouping in other performance features as config
options like this is the easiest thing to do and reduces the amount of
code in the kernel.

- Charlie

> 
> Clément
> 
> > 
> > - Charlie
> > 
> >> -}
> >> -#else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
> >> -static void __init check_unaligned_access_speed_all_cpus(void)
> >> -{
> >> -}
> >> -#endif
> >> -
> >>  #ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
> >>  static void check_vector_unaligned_access(struct work_struct *work __always_unused)
> >>  {
> >> @@ -370,6 +380,11 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
> >>  }
> >>  #endif
> >>  
> >> +static bool check_vector_unaligned_access_table(void)
> >> +{
> >> +	return false;
> >> +}
> >> +
> >>  static int riscv_online_cpu_vec(unsigned int cpu)
> >>  {
> >>  	if (!has_vector()) {
> >> @@ -377,6 +392,9 @@ static int riscv_online_cpu_vec(unsigned int cpu)
> >>  		return 0;
> >>  	}
> >>  
> >> +	if (check_vector_unaligned_access_table())
> >> +		return 0;
> >> +
> >>  #ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
> >>  	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
> >>  		return 0;
> >> @@ -392,13 +410,15 @@ static int __init check_unaligned_access_all_cpus(void)
> >>  {
> >>  	int cpu;
> >>  
> >> -	if (!check_unaligned_access_emulated_all_cpus())
> >> +	if (!check_unaligned_access_table() &&
> >> +	    !check_unaligned_access_emulated_all_cpus())
> >>  		check_unaligned_access_speed_all_cpus();
> >>  
> >>  	if (!has_vector()) {
> >>  		for_each_online_cpu(cpu)
> >>  			per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
> >> -	} else if (!check_vector_unaligned_access_emulated_all_cpus() &&
> >> +	} else if (!check_vector_unaligned_access_table() &&
> >> +		   !check_vector_unaligned_access_emulated_all_cpus() &&
> >>  		   IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
> >>  		kthread_run(vec_check_unaligned_access_speed_all_cpus,
> >>  			    NULL, "vec_check_unaligned_access_speed_all_cpus");
> > 
> >>
> >> Regarding your table, it feels like a bit going back to old hardcoded
> >> platform description ;). I think some kind of auto-detection of speed
> >> (not builtin the kernel) for platforms could be good as well to skip
> >> probing.
> >>
> >> A DT property also seems ok to me since the goal is to describe
> >> hardware. Would a common DT/ACPI property be appropriate ? The
> >> device_property API unified both so if we used some common property to
> >> describe the misaligned access speed (both in DT cpu node/ ACPI CPU
> >> device package), we could keep a single parsing method. But I'm no ACPI
> >> expert so I don't know if that really make sense.
> >>
> >> Thanks,
> >>
> >> Clément
> >>
> >>>
> >>> Thanks,
> >>> drew
> >>
> 
