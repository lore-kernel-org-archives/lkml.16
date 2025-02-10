Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E9F236431
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 21:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739222019; cv=none; b=FjY8h1xm8aP3rvGzgoMEWrytvy5cGIa5ZlBF4uIQ2G4vKGVJ5gUVpMYfuX+CxYIh5i6A0ar5gacjQdwG+kaMCYGXHUa7cr556Wxi3veO/nZnHznjIiCIkjwUgo9FQYTkoaQ0rdVD2MO/9J/Nj+8N4g7PfDsoZuCwR9GOASkuotY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739222019; c=relaxed/simple;
	bh=LggXwvlj22xrnl/aiZ7k3vau53aF4pGEGDH/hxoE0I0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OgW+/MNOx2WKU3Bisjp83c/RGagGiJ4+cXFQOmDxj0UfX8Rg5yTZhdiswmcvxo7LuFlgpawHy8DtFyJk+bpS6rOlRubQJNcTyx6hQ2vtCpF7MqbrG2OBZ8tf8kOWEiMdEbpRtRWbOsRI8kJY/ENjoXxnk8KX13kHOXzx0xoW2ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=q8QcWR/Z; arc=none smtp.client-ip=209.85.219.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="q8QcWR/Z"
Received: by mail-yb1-f196.google.com with SMTP id 3f1490d57ef6-e5b4d615267so2534666276.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 13:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739222015; x=1739826815; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p9zBoct08/zHBbjHTsszjb3dp9O/ncBq7kxMVjWp9/A=;
        b=q8QcWR/ZLwx1y8krMufn54LdpVw55djYj+5bVx7yHozTMIFxNwujV96slP6o6x8JAX
         R2SVIwC3fo8O5/vv+J7mE2Y5VU4gENO2whEkP011ew+F5vCIC/yeCOhxkcq8EEanYaTk
         Of7PumvwYAnsgx6EeOT8QFn0wFcYaOVbWwrVc/9OHw56C8k5SdQ/nsia/iZxvaiOntKF
         psHfXrzbY9PbAJUYCHgGvkWeQt2x5Mra7O3UNOr+XFAVhlopnLHEZK7pMBOSItgH+38B
         I/+3eVnj/MHwvCbFglQV3dZxgRJpD9f8ZfmLYZAIfZfJ6+YEaPZRFoue/A3Dvnz4g2+E
         eHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739222015; x=1739826815;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p9zBoct08/zHBbjHTsszjb3dp9O/ncBq7kxMVjWp9/A=;
        b=MvqkLuG4N8ut7Sf5p3jx165u6NYqwvMX48cEQE5F53/VtehXQO+xcnvfjL9cMnnY1N
         IXNONoBe5nS8OlRHsybwWrajlqGxjU4l0HtaiJcl5oKm3FN9J3A+IPW0AxEmZdLFh699
         xjtqDVZK7gXnI4rEib5pOx83b3ZNsgvTHss5xnvWGdpdLsyMsRqUOKmh4ycj+ciYysuh
         YL8CY7m4Exho5/YZUonPfTKVpN8bu9AbXv0Rpqo+iiL0D+/XEOb7a0dAX7O5qXUCSJyk
         1Tg1VgFHd7JOoWOvDDuDLrErwm+d2nUGzGEvZHLa7jfOz+8pS/gK8x0jzUG0dihYc8z9
         6zag==
X-Forwarded-Encrypted: i=1; AJvYcCV5S023nPmByXG7H8dsY/dnFTFqmnCKEyZiABzxVVPJlq73beX+y1y8d6h8+l4I1YuRyl/kwND/deqcvgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzghswOHloAvJBHWS6sCZpNHh/A9A4eJ4aP3Jx1fm1Cn0/VeH1
	5BYglep8gxwjLkEL+G/x++/W1HX7dyYCo1Ex1qF4IloX2cbBNZPuQiWEbJ0ypKNMRU06M3PUwjV
	X79rPCpws
X-Gm-Gg: ASbGncsEMb51yayfoeSAioXMfyhrBKJnoB+A/p33SKTwa3FweLkhfkrTUw/fmyY2+cz
	/h6vHnN5uxwPUwjwgpNpVREDw/j9GoJJdglY6lWUQ3+bKaIgCV5xQ1fdLF1T8+lfu9Z5NJyGkow
	HYIItbItBYWr+QbI+2pH2lgErlM7gYcgHV4kn3au2yHxSxhSZrQuhwjHjShHbEldNbx1Ro04x0F
	qnA3wJsQjQjZrzsSfHPlE7cCVv8h78v8GOSv/cHAabaXz28QSQeOkOLqXDcX0+mOg9DopQkzI6Y
	94A=
X-Google-Smtp-Source: AGHT+IHeVwLxgzUTGni4MQz60krtxoZ4J3+b9uU9/F3LHNQd0tBJ5bUOpfHtOBixXZAGyjBE0FlmBg==
X-Received: by 2002:a05:6902:98f:b0:e57:e500:16d with SMTP id 3f1490d57ef6-e5b4629bdc6mr14083846276.39.1739222015377;
        Mon, 10 Feb 2025 13:13:35 -0800 (PST)
Received: from ghost ([50.146.0.9])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b3a205e82sm2796103276.23.2025.02.10.13.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:13:34 -0800 (PST)
Date: Mon, 10 Feb 2025 13:13:33 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	"palmer@dabbelt.com Anup Patel" <apatel@ventanamicro.com>
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
Message-ID: <Z6pr_avwH55y_0Zh@ghost>
References: <20250207161939.46139-18-ajones@ventanamicro.com>
 <Z6ax7B45OsGerjfA@ghost>
 <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
 <c6f98a70-b1c7-4955-bf5d-546e4563cf1c@rivosinc.com>
 <20250210-e6a2dfcd7995ffc8a6d918e4@orel>
 <e1fae51d-3511-4bcf-afbf-4e690905ccda@rivosinc.com>
 <Z6o1bQLJ8aUyjvrQ@ghost>
 <015a8a52-6a49-41b9-95b4-5e8260d45776@rivosinc.com>
 <Z6pnTG7YoiDW_Gkq@ghost>
 <fb67c9e8-0de4-4e11-929a-49d36e81a1a2@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb67c9e8-0de4-4e11-929a-49d36e81a1a2@rivosinc.com>

On Mon, Feb 10, 2025 at 09:57:26PM +0100, Clément Léger wrote:
> 
> 
> On 10/02/2025 21:53, Charlie Jenkins wrote:
> > On Mon, Feb 10, 2025 at 09:42:25PM +0100, Clément Léger wrote:
> >>
> >>
> >> On 10/02/2025 18:20, Charlie Jenkins wrote:
> >>> On Mon, Feb 10, 2025 at 03:20:34PM +0100, Clément Léger wrote:
> >>>>
> >>>>
> >>>> On 10/02/2025 15:06, Andrew Jones wrote:
> >>>>> On Mon, Feb 10, 2025 at 12:07:40PM +0100, Clément Léger wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 10/02/2025 11:16, Anup Patel wrote:
> >>>>>>> On Sat, Feb 8, 2025 at 6:53 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
> >>>>>>>>
> >>>>>>>> On Fri, Feb 07, 2025 at 05:19:47PM +0100, Andrew Jones wrote:
> >>>>>>>>> Probing unaligned accesses on boot is time consuming. Provide a
> >>>>>>>>> function which will be used to look up the access type in a table
> >>>>>>>>> by id registers. Vendors which provide table entries can then skip
> >>>>>>>>> the probing.
> >>>>>>>>
> >>>>>>>> The access checker in my experience is only time consuming on slow
> >>>>>>>> hardware. Hardware that supports fast unaligned accesses isn't really
> >>>>>>>> impacted by this? Avoiding a list of hardware that has slow/fast
> >>>>>>>> unaligned accesses in the kernel was the main reason for dynamically
> >>>>>>>> checking. We did introduce the config option to compile the kernel with
> >>>>>>>> assumed slow/fast accesses, which of course has the downside of
> >>>>>>>> recompiling the kernel and I assume that you already considered that.
> >>>>>>>
> >>>>>>> The kconfig option does not align with the vision of running the same
> >>>>>>> kernel image across platforms.
> >>>>>>
> >>>>>> I'd would be advocating to remove compile time options as well and use
> >>>>>> another way to skip the probe (see below).
> >>>>>>
> >>>>>>>
> >>>>>>>>
> >>>>>>>> Instead of having a table in the kernel, something that would be more
> >>>>>>>> platform agnostic would be to have an extension that signals this
> >>>>>>>> information. That seems like it would accomplish the same goal and
> >>>>>>>> leverage the existing infrastructure in the kernel, albeit with the need
> >>>>>>>> to make a new extension.
> >>>>>>>>
> >>>>>>>
> >>>>>>> IMO, expecting an ISA extension to be defined for all possible
> >>>>>>> microarchitectural choices is not going to scale so it is better
> >>>>>>> to have infrastructure in kernel itself to infer microarchitectural
> >>>>>>> choices based on RISC-V implementation ID.
> >>>>>>
> >>>>>> Since adding an extension seems quite unlikely, and that a device-tree
> >>>>>> property is likely DT centric and not applicable to ACPI as well, was a
> >>>>>> command line argument considered ?
> >>>>>>
> >>>>>
> >>>>> I did consider adding a command line option in addition to the table,
> >>>>> allowing platforms which neither have a table entry [yet] nor want to do
> >>>>> the speed test, to set whatever they like. In the end, I dropped it, since
> >>>>> I don't have a use case at this time. However, if we really don't want a
> >>>>> table, then I can look into the command line option instead.
> >>>>
> >>>> Sorry if I wasn't clear, I wasn't considering this as a replacement for
> >>>> your table but rather as a replacement to Charlie's compile time define
> >>>> to skip misaligned speed probing since it is like "lpj=<x>". You can
> >>>> specify it on command line if you want to skip the loop time detection
> >>>> of loops per jiffies and have faster boot.
> >>>
> >>> Jesse sent out a patch for a kernel parameter to set the access speed to
> >>> whatever is desired [1].
> >>
> >> Hey Charlie,
> >>
> >> Thanks but it seems you forgot to add the link ?
> > 
> > Oops, I frequently do that...
> > 
> > https://lore.kernel.org/linux-riscv/20240805173816.3722002-1-jesse@rivosinc.com/
> > 
> >>
> >> Having configuration option + command line option seems like something
> >> particularly heavy for such feature. The ifdefery/config options
> >> involved in the misaligned probing code is already quite complicated. If
> >> another mean to specify the misaligned speed access is added, I think
> >> all configuration options to set the speed of accesses can then be
> >> removed and just keep the command line. That will certainly simplify the
> >> ifdef/config options.
> > 
> > Yeah that's why it didn't get merged because it felt like overkill. I
> > responded on the thread to Anup as why I would prefer config options. It
> > just comes down to config options being required to enable compiler
> > features. The kernel is only built with rv64gc and usage of all other
> > extensions requires hand written assembly. There are easy performance
> > gains when compiling the kernel with rv64gc_zba_zbb_zbkb etc.
> > Performance focused kernels will need to be recompiled anyway so I am of
> > the opinion that grouping in other performance features as config
> > options like this is the easiest thing to do and reduces the amount of
> > code in the kernel.
> 
> As answered on the other thread, totally agree, except for the
> misaligned accesses probing config options ;).

Oh! I have missed that response, where is that?

> Ultimately, we need
> profiles configuration, either via defconfigs that enables a bunch of
> optimization via ISA extension or configuration options that groups
> these config options.

Why do you agree with profile configs for other things but not for
misaligned access probing?

> 
> Clément
> 
> > 
> > - Charlie
> > 
> >>
> >> Clément
> >>
> >>>
> >>> - Charlie
> >>>
> >>>> -}
> >>>> -#else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
> >>>> -static void __init check_unaligned_access_speed_all_cpus(void)
> >>>> -{
> >>>> -}
> >>>> -#endif
> >>>> -
> >>>>  #ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
> >>>>  static void check_vector_unaligned_access(struct work_struct *work __always_unused)
> >>>>  {
> >>>> @@ -370,6 +380,11 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
> >>>>  }
> >>>>  #endif
> >>>>  
> >>>> +static bool check_vector_unaligned_access_table(void)
> >>>> +{
> >>>> +	return false;
> >>>> +}
> >>>> +
> >>>>  static int riscv_online_cpu_vec(unsigned int cpu)
> >>>>  {
> >>>>  	if (!has_vector()) {
> >>>> @@ -377,6 +392,9 @@ static int riscv_online_cpu_vec(unsigned int cpu)
> >>>>  		return 0;
> >>>>  	}
> >>>>  
> >>>> +	if (check_vector_unaligned_access_table())
> >>>> +		return 0;
> >>>> +
> >>>>  #ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
> >>>>  	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
> >>>>  		return 0;
> >>>> @@ -392,13 +410,15 @@ static int __init check_unaligned_access_all_cpus(void)
> >>>>  {
> >>>>  	int cpu;
> >>>>  
> >>>> -	if (!check_unaligned_access_emulated_all_cpus())
> >>>> +	if (!check_unaligned_access_table() &&
> >>>> +	    !check_unaligned_access_emulated_all_cpus())
> >>>>  		check_unaligned_access_speed_all_cpus();
> >>>>  
> >>>>  	if (!has_vector()) {
> >>>>  		for_each_online_cpu(cpu)
> >>>>  			per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
> >>>> -	} else if (!check_vector_unaligned_access_emulated_all_cpus() &&
> >>>> +	} else if (!check_vector_unaligned_access_table() &&
> >>>> +		   !check_vector_unaligned_access_emulated_all_cpus() &&
> >>>>  		   IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
> >>>>  		kthread_run(vec_check_unaligned_access_speed_all_cpus,
> >>>>  			    NULL, "vec_check_unaligned_access_speed_all_cpus");
> >>>
> >>>>
> >>>> Regarding your table, it feels like a bit going back to old hardcoded
> >>>> platform description ;). I think some kind of auto-detection of speed
> >>>> (not builtin the kernel) for platforms could be good as well to skip
> >>>> probing.
> >>>>
> >>>> A DT property also seems ok to me since the goal is to describe
> >>>> hardware. Would a common DT/ACPI property be appropriate ? The
> >>>> device_property API unified both so if we used some common property to
> >>>> describe the misaligned access speed (both in DT cpu node/ ACPI CPU
> >>>> device package), we could keep a single parsing method. But I'm no ACPI
> >>>> expert so I don't know if that really make sense.
> >>>>
> >>>> Thanks,
> >>>>
> >>>> Clément
> >>>>
> >>>>>
> >>>>> Thanks,
> >>>>> drew
> >>>>
> >>
> 
