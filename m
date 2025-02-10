Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD90924BD0B
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208050; cv=none; b=YmNmuw+NSdHbsCGpGQeNonEUxhCoOIUXjrB0+7hWi4KYNvh8nimPDcaJEadwtEc0nhHAPIekQI4FEDqn1fWo/7OTWJWoIW9tgHJYSiVT1ikV1Eu7a1nRYX8cNBG5pZUJK9H3aQuPrHbndWpUUzPRfUpED0VVwGADgdTn887j/Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208050; c=relaxed/simple;
	bh=wPdKUfk+AZGGR2P5WsOrbWsk3LjIPajzChd1r/oEa/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvVSSqrHy2+9Z6H+qV5PeYHylNHNG0iCHNtEaMiWkKuBtnL9w8djac9VTExU6lr1AcIgqAGT36juxznrzXOXHCXEKP7VOQmobiTgJ2n7xhKA5fGVWCyvKezz0qThjnuacO7TNarRQqgJdb2cBvHb2hPkmKLz4bxxYCEbboIw7g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=1TeU/N2l; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="1TeU/N2l"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6f77b9e0a34so34201067b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739208048; x=1739812848; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HbtMLH5OLMKwvn1q9NuTvtcLAqw/hlAV54xRMPXY6fA=;
        b=1TeU/N2ldCpV8evIf+FH9dD+I1fS53uUoBh4Z1Fx6zoNvJyFtyyKNFxhr+gxMdN/Pm
         RkGJ5iwtHdTW7+GWqM5fgbkOsJM0hRl9kP/xAtsZ5mxo0diSeXJMOlgEDkOWByFodBYd
         HzVcFFwhFx7rGKX/HcMPBigi+MidFzHJRBfrF3t5DnN5j8ZSAL7tT6HQ+Xc/zxYiNI5+
         0KwDANaYimFTvgXhMyNSiKU/aK2AUtHERVcKSK9NyANEKEVplaRorUSylkArJ3+/4Tpi
         zbhkILMiXqFSUE3PTc8oRmfAzA/ZqbZUKyY0G6U5iYcn0DjojFN+I3aQZwH6ifHPh+fr
         NP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739208048; x=1739812848;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HbtMLH5OLMKwvn1q9NuTvtcLAqw/hlAV54xRMPXY6fA=;
        b=DeIKO9R0rkOo2N18lu539uAkUXSxDf3FCDil72PBwP5s0zLF19mHl41mwPclrVYMxf
         uC7m+tG3eq0wwlcev3GwPBfSsoM7vsLrfm40/2JMzcHnDgqf6Lsk8OHrzejg/LYOMYv2
         DY7//mdPjd9wKT0t96jh0nIBuBneTfkiRO4XX61izJRce6CW73gQtfpqhdiQ5Fc/GzPU
         g8I/wea4H9QvsxLJxi9p89qHdQ/FkMlJ1LoglG0pxypuLvbIMl87h6b/ewUwvqNd9uZ4
         49VepsqpSFBvJaZWXLOQyR3+mKSFfiS59vVyHrvwV86K4s9f7S6y3hH3UbOfwVOYAJv2
         hjAg==
X-Forwarded-Encrypted: i=1; AJvYcCVXyeYlu78Of9qJevtcR/fchcQs6I01rwHdb55GW9xuZqigRnw7yjxElb/iuilDVGgDKDzqYmQf8LWETgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSJDJqfDIFNxvtC6LpoxsAyXD0hmrkccYIxAr6QGCBImTerR6W
	dJk9Qek9HiMLXv6nb3nN5OD4YHuDHkTSVM11JEin08LJAsSFPdY4uAQJiUKhQJw=
X-Gm-Gg: ASbGncsxKC4MCXUBbvH/64CTDzJ7Exeg8MncFp21Vms0UkIhzms8C69R2kWFmEf9H6E
	ErPMxueIm3Q4Hs8J6tmp4bwno0JDKOp0wbg/UwczbMVHJ31ePNFoc9JOOvWGXP/QlES9qyB4XSt
	9mgCDUM0AfeTcWT9ZF14AL/PqmoI6WYQtL47Vj4QHF1pkpZEum2Q2iJ4EEd/fj3k8xtM0cHqGpf
	xdcwjxSgotJV0xp8B6Bp3dmx/+fUyXAoBhoAwHHtSfDjvfchDrLAJNgex0VOcqNeiQhgmUaAmqI
	Bi8=
X-Google-Smtp-Source: AGHT+IEDYD05GxVjmwIcftFZauU3DCUX+vNDL2TNZSmEhsr/OEQNK0fGsG0OHwHGPsxGkLD7MqJBiw==
X-Received: by 2002:a05:690c:61c8:b0:6f9:447d:d1a2 with SMTP id 00721157ae682-6f9b29e62dfmr146923517b3.29.1739208047611;
        Mon, 10 Feb 2025 09:20:47 -0800 (PST)
Received: from ghost ([50.146.0.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99fce1fdfsm17551877b3.11.2025.02.10.09.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 09:20:47 -0800 (PST)
Date: Mon, 10 Feb 2025 09:20:45 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
Message-ID: <Z6o1bQLJ8aUyjvrQ@ghost>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com>
 <Z6ax7B45OsGerjfA@ghost>
 <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
 <c6f98a70-b1c7-4955-bf5d-546e4563cf1c@rivosinc.com>
 <20250210-e6a2dfcd7995ffc8a6d918e4@orel>
 <e1fae51d-3511-4bcf-afbf-4e690905ccda@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1fae51d-3511-4bcf-afbf-4e690905ccda@rivosinc.com>

On Mon, Feb 10, 2025 at 03:20:34PM +0100, Clément Léger wrote:
> 
> 
> On 10/02/2025 15:06, Andrew Jones wrote:
> > On Mon, Feb 10, 2025 at 12:07:40PM +0100, Clément Léger wrote:
> >>
> >>
> >> On 10/02/2025 11:16, Anup Patel wrote:
> >>> On Sat, Feb 8, 2025 at 6:53 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
> >>>>
> >>>> On Fri, Feb 07, 2025 at 05:19:47PM +0100, Andrew Jones wrote:
> >>>>> Probing unaligned accesses on boot is time consuming. Provide a
> >>>>> function which will be used to look up the access type in a table
> >>>>> by id registers. Vendors which provide table entries can then skip
> >>>>> the probing.
> >>>>
> >>>> The access checker in my experience is only time consuming on slow
> >>>> hardware. Hardware that supports fast unaligned accesses isn't really
> >>>> impacted by this? Avoiding a list of hardware that has slow/fast
> >>>> unaligned accesses in the kernel was the main reason for dynamically
> >>>> checking. We did introduce the config option to compile the kernel with
> >>>> assumed slow/fast accesses, which of course has the downside of
> >>>> recompiling the kernel and I assume that you already considered that.
> >>>
> >>> The kconfig option does not align with the vision of running the same
> >>> kernel image across platforms.
> >>
> >> I'd would be advocating to remove compile time options as well and use
> >> another way to skip the probe (see below).
> >>
> >>>
> >>>>
> >>>> Instead of having a table in the kernel, something that would be more
> >>>> platform agnostic would be to have an extension that signals this
> >>>> information. That seems like it would accomplish the same goal and
> >>>> leverage the existing infrastructure in the kernel, albeit with the need
> >>>> to make a new extension.
> >>>>
> >>>
> >>> IMO, expecting an ISA extension to be defined for all possible
> >>> microarchitectural choices is not going to scale so it is better
> >>> to have infrastructure in kernel itself to infer microarchitectural
> >>> choices based on RISC-V implementation ID.
> >>
> >> Since adding an extension seems quite unlikely, and that a device-tree
> >> property is likely DT centric and not applicable to ACPI as well, was a
> >> command line argument considered ?
> >>
> > 
> > I did consider adding a command line option in addition to the table,
> > allowing platforms which neither have a table entry [yet] nor want to do
> > the speed test, to set whatever they like. In the end, I dropped it, since
> > I don't have a use case at this time. However, if we really don't want a
> > table, then I can look into the command line option instead.
> 
> Sorry if I wasn't clear, I wasn't considering this as a replacement for
> your table but rather as a replacement to Charlie's compile time define
> to skip misaligned speed probing since it is like "lpj=<x>". You can
> specify it on command line if you want to skip the loop time detection
> of loops per jiffies and have faster boot.

Jesse sent out a patch for a kernel parameter to set the access speed to
whatever is desired [1].

- Charlie

> -}
> -#else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
> -static void __init check_unaligned_access_speed_all_cpus(void)
> -{
> -}
> -#endif
> -
>  #ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
>  static void check_vector_unaligned_access(struct work_struct *work __always_unused)
>  {
> @@ -370,6 +380,11 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
>  }
>  #endif
>  
> +static bool check_vector_unaligned_access_table(void)
> +{
> +	return false;
> +}
> +
>  static int riscv_online_cpu_vec(unsigned int cpu)
>  {
>  	if (!has_vector()) {
> @@ -377,6 +392,9 @@ static int riscv_online_cpu_vec(unsigned int cpu)
>  		return 0;
>  	}
>  
> +	if (check_vector_unaligned_access_table())
> +		return 0;
> +
>  #ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
>  	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
>  		return 0;
> @@ -392,13 +410,15 @@ static int __init check_unaligned_access_all_cpus(void)
>  {
>  	int cpu;
>  
> -	if (!check_unaligned_access_emulated_all_cpus())
> +	if (!check_unaligned_access_table() &&
> +	    !check_unaligned_access_emulated_all_cpus())
>  		check_unaligned_access_speed_all_cpus();
>  
>  	if (!has_vector()) {
>  		for_each_online_cpu(cpu)
>  			per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
> -	} else if (!check_vector_unaligned_access_emulated_all_cpus() &&
> +	} else if (!check_vector_unaligned_access_table() &&
> +		   !check_vector_unaligned_access_emulated_all_cpus() &&
>  		   IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
>  		kthread_run(vec_check_unaligned_access_speed_all_cpus,
>  			    NULL, "vec_check_unaligned_access_speed_all_cpus");

> 
> Regarding your table, it feels like a bit going back to old hardcoded
> platform description ;). I think some kind of auto-detection of speed
> (not builtin the kernel) for platforms could be good as well to skip
> probing.
> 
> A DT property also seems ok to me since the goal is to describe
> hardware. Would a common DT/ACPI property be appropriate ? The
> device_property API unified both so if we used some common property to
> describe the misaligned access speed (both in DT cpu node/ ACPI CPU
> device package), we could keep a single parsing method. But I'm no ACPI
> expert so I don't know if that really make sense.
> 
> Thanks,
> 
> Clément
> 
> > 
> > Thanks,
> > drew
> 
