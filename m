Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF93426BD92
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 04:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739248009; cv=none; b=cl8nFmSrSXQVapQB0t4XcWleG6Rj8jfKU0eSRjYgv3v1oc4ISCXl/zvxtSHC5BfgI5Vq8GpYNUuqMGBTPhYL9V2P1nmHXPw0kdPfNAYnLlWqYArNQap4U1x1K3sgVllD0Xov/IXpDvy+PJFg2nnf3dyNiR+OvwsZfoQO/N4oR84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739248009; c=relaxed/simple;
	bh=i4cQp1EBbGfD7WP8R6H9end6ijtUk3UzCkgcHkCf364=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uburqga+N4ZIQfB5+WLPq8vbHMIayMxqzKvcO/6x6tYUUGBXRkPGSe3coFdhSiDUkOh7QQGH6PaaNG3xog9v1YrkWHaVArkud8rCt0h1fShEE9u6hEj0AE7b5b70Xs97wP4WodbPWR7IM8fzfYiEMeSsZQrT7XMIyWr4fG0e5uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=hXV4vnTl; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="hXV4vnTl"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54298ec925bso6417458e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 20:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739248005; x=1739852805; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJBh9fdeWyAFz73+AAjOKrZPv8X8svLxRaCEi/KYX2U=;
        b=hXV4vnTlYFE1Ebb6bA/4uk0vQ5jhg1nAHrONxht7MNESh1Kc93NRInmSp8AVXNFvIC
         wJG4uMMwlGRoPBSc4Y9ybv/A5g+xrWYhQ085fzqogq2wuZcIPPt1xD49ekqoa2RVFwB2
         VM+Cu9LGbsgtJmm25dTmuw8uyJlNeA81Y09LJIkLgGmNNxSavV/098myRu074PX+dV0j
         wP27Rz//81aMlhUMFGQAiSFdMMcGnG8rDD0UgnFuX/HKbydPFdGn6OntrKM8/m8wf1kN
         FOS5IYFXL5v3F3kmA/+RaA/BZouMQY3+z4a1InrYWL8ZpNitTXGXRBXXIhyRLG5Rk9ft
         I70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739248005; x=1739852805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJBh9fdeWyAFz73+AAjOKrZPv8X8svLxRaCEi/KYX2U=;
        b=I8lu4q5mjwvfpD9d9mAFlhqp/g870oTlkeJZtWtisZRw8OsmlIIE0HMvEMoWxkGPCU
         rDQWX/4VdF8gTKnCsC3sU1XBCOVY0SrEPPHmBCY+RmurKWQ8NV61qK5MMFBGNZLf8zAE
         RvhyRgBGfxLukTKvZ/nosHm9HyIsq4l5LYyLMmN2KxYtDzebjA0OXNOHJvcMGe1Ausu3
         aQ5xc7PbSL4zg9OLd0kvgT4yTAPnF+9lzbeMoZV+YohP5zEdCkB895y4gBbOKhOdpFWU
         ggFxeBj/K0MbGFDBwAe3x7uWD0UsCUXFLm+UR6UFn+UMFxhQY3G+VojoffJageMyz1IR
         0l/A==
X-Forwarded-Encrypted: i=1; AJvYcCUdUJsOpaOqp70tmLpbQWd8GlSsmbx8fmTE+ocvSjm8uuuneSbOq6fN/VjJVo+PPdW+GX0WlbvGGx4cDxE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyTzeVH5Chf1DR94YZzLMJzdUf86+dZXib10DOgwy6efFYN6Ka
	cb+rO47GlZgUH0zfNqsxyGCAo9WrlpBSWDma4aud4q9I0+JwJe6c7WC8YjnVO6dIxvkGaJ+pn+L
	GOslWSLfKNk04z1m5jJY4HV6bQu0tKKNYDOd6dA==
X-Gm-Gg: ASbGncv9KHNtTSjD+gnoVfqEw1QfQKyG+app0Qgp1SPnlmeo7pQRYA76TVrCRdnA36O
	4OGAnR1XWl/0y7NXqjPHc9x+7+uTif7mFtDv0t17D7PjFN8iDfF2xl3SY4WhW2SRmxGjwVOIx
X-Google-Smtp-Source: AGHT+IEvysNS6RkGmuuzJxngvkBIqfCXPngNuobbBlL2+M9OjCkU9bWZC1b6ZuqeVUMBeqzQuxhWPtUgLJtjb8/Htp0=
X-Received: by 2002:a05:6512:3f5:b0:540:1b07:e033 with SMTP id
 2adb3069b0e04-54414b0b972mr4546353e87.45.1739248004691; Mon, 10 Feb 2025
 20:26:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com> <Z6ax7B45OsGerjfA@ghost>
 <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
 <c6f98a70-b1c7-4955-bf5d-546e4563cf1c@rivosinc.com> <20250210-e6a2dfcd7995ffc8a6d918e4@orel>
 <e1fae51d-3511-4bcf-afbf-4e690905ccda@rivosinc.com> <Z6o1bQLJ8aUyjvrQ@ghost>
 <015a8a52-6a49-41b9-95b4-5e8260d45776@rivosinc.com> <Z6pnTG7YoiDW_Gkq@ghost> <fb67c9e8-0de4-4e11-929a-49d36e81a1a2@rivosinc.com>
In-Reply-To: <fb67c9e8-0de4-4e11-929a-49d36e81a1a2@rivosinc.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 11 Feb 2025 09:56:32 +0530
X-Gm-Features: AWEUYZllrOP2AjMXaTFQEzF4ZkdfQdtcJSppkq6n6kvKBVptt8mEi6N8BjuZtP8
Message-ID: <CAK9=C2VA-fwYwD018iTBvCmgCnX_2+L-eLzc7nLsAMtx_NCCRg@mail.gmail.com>
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table lookups
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 2:27=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
>
>
> On 10/02/2025 21:53, Charlie Jenkins wrote:
> > On Mon, Feb 10, 2025 at 09:42:25PM +0100, Cl=C3=A9ment L=C3=A9ger wrote=
:
> >>
> >>
> >> On 10/02/2025 18:20, Charlie Jenkins wrote:
> >>> On Mon, Feb 10, 2025 at 03:20:34PM +0100, Cl=C3=A9ment L=C3=A9ger wro=
te:
> >>>>
> >>>>
> >>>> On 10/02/2025 15:06, Andrew Jones wrote:
> >>>>> On Mon, Feb 10, 2025 at 12:07:40PM +0100, Cl=C3=A9ment L=C3=A9ger w=
rote:
> >>>>>>
> >>>>>>
> >>>>>> On 10/02/2025 11:16, Anup Patel wrote:
> >>>>>>> On Sat, Feb 8, 2025 at 6:53=E2=80=AFAM Charlie Jenkins <charlie@r=
ivosinc.com> wrote:
> >>>>>>>>
> >>>>>>>> On Fri, Feb 07, 2025 at 05:19:47PM +0100, Andrew Jones wrote:
> >>>>>>>>> Probing unaligned accesses on boot is time consuming. Provide a
> >>>>>>>>> function which will be used to look up the access type in a tab=
le
> >>>>>>>>> by id registers. Vendors which provide table entries can then s=
kip
> >>>>>>>>> the probing.
> >>>>>>>>
> >>>>>>>> The access checker in my experience is only time consuming on sl=
ow
> >>>>>>>> hardware. Hardware that supports fast unaligned accesses isn't r=
eally
> >>>>>>>> impacted by this? Avoiding a list of hardware that has slow/fast
> >>>>>>>> unaligned accesses in the kernel was the main reason for dynamic=
ally
> >>>>>>>> checking. We did introduce the config option to compile the kern=
el with
> >>>>>>>> assumed slow/fast accesses, which of course has the downside of
> >>>>>>>> recompiling the kernel and I assume that you already considered =
that.
> >>>>>>>
> >>>>>>> The kconfig option does not align with the vision of running the =
same
> >>>>>>> kernel image across platforms.
> >>>>>>
> >>>>>> I'd would be advocating to remove compile time options as well and=
 use
> >>>>>> another way to skip the probe (see below).
> >>>>>>
> >>>>>>>
> >>>>>>>>
> >>>>>>>> Instead of having a table in the kernel, something that would be=
 more
> >>>>>>>> platform agnostic would be to have an extension that signals thi=
s
> >>>>>>>> information. That seems like it would accomplish the same goal a=
nd
> >>>>>>>> leverage the existing infrastructure in the kernel, albeit with =
the need
> >>>>>>>> to make a new extension.
> >>>>>>>>
> >>>>>>>
> >>>>>>> IMO, expecting an ISA extension to be defined for all possible
> >>>>>>> microarchitectural choices is not going to scale so it is better
> >>>>>>> to have infrastructure in kernel itself to infer microarchitectur=
al
> >>>>>>> choices based on RISC-V implementation ID.
> >>>>>>
> >>>>>> Since adding an extension seems quite unlikely, and that a device-=
tree
> >>>>>> property is likely DT centric and not applicable to ACPI as well, =
was a
> >>>>>> command line argument considered ?
> >>>>>>
> >>>>>
> >>>>> I did consider adding a command line option in addition to the tabl=
e,
> >>>>> allowing platforms which neither have a table entry [yet] nor want =
to do
> >>>>> the speed test, to set whatever they like. In the end, I dropped it=
, since
> >>>>> I don't have a use case at this time. However, if we really don't w=
ant a
> >>>>> table, then I can look into the command line option instead.
> >>>>
> >>>> Sorry if I wasn't clear, I wasn't considering this as a replacement =
for
> >>>> your table but rather as a replacement to Charlie's compile time def=
ine
> >>>> to skip misaligned speed probing since it is like "lpj=3D<x>". You c=
an
> >>>> specify it on command line if you want to skip the loop time detecti=
on
> >>>> of loops per jiffies and have faster boot.
> >>>
> >>> Jesse sent out a patch for a kernel parameter to set the access speed=
 to
> >>> whatever is desired [1].
> >>
> >> Hey Charlie,
> >>
> >> Thanks but it seems you forgot to add the link ?
> >
> > Oops, I frequently do that...
> >
> > https://lore.kernel.org/linux-riscv/20240805173816.3722002-1-jesse@rivo=
sinc.com/
> >
> >>
> >> Having configuration option + command line option seems like something
> >> particularly heavy for such feature. The ifdefery/config options
> >> involved in the misaligned probing code is already quite complicated. =
If
> >> another mean to specify the misaligned speed access is added, I think
> >> all configuration options to set the speed of accesses can then be
> >> removed and just keep the command line. That will certainly simplify t=
he
> >> ifdef/config options.
> >
> > Yeah that's why it didn't get merged because it felt like overkill. I
> > responded on the thread to Anup as why I would prefer config options. I=
t
> > just comes down to config options being required to enable compiler
> > features. The kernel is only built with rv64gc and usage of all other
> > extensions requires hand written assembly. There are easy performance
> > gains when compiling the kernel with rv64gc_zba_zbb_zbkb etc.
> > Performance focused kernels will need to be recompiled anyway so I am o=
f
> > the opinion that grouping in other performance features as config
> > options like this is the easiest thing to do and reduces the amount of
> > code in the kernel.
>
> As answered on the other thread, totally agree, except for the
> misaligned accesses probing config options ;). Ultimately, we need
> profiles configuration, either via defconfigs that enables a bunch of
> optimization via ISA extension or configuration options that groups
> these config options.

I agree.

Kconfig options for ISA extensions are fine but not for
misaligned access. The kernel command-line option to skip
misaligned access probe is fine as well. I still think RISC-V
implementation ID based microarchitecture feature discovery
will be eventually required as well so why not add it now.

For profiles, how about having an incremental rva23.config
similar to 64-bit.config ? This will minimize the duplication
by re-using the same base defconfig.

Regards,
Anup



>
> Cl=C3=A9ment
>
> >
> > - Charlie
> >
> >>
> >> Cl=C3=A9ment
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
> >>>>  static void check_vector_unaligned_access(struct work_struct *work =
__always_unused)
> >>>>  {
> >>>> @@ -370,6 +380,11 @@ static int __init vec_check_unaligned_access_sp=
eed_all_cpus(void *unused __alway
> >>>>  }
> >>>>  #endif
> >>>>
> >>>> +static bool check_vector_unaligned_access_table(void)
> >>>> +{
> >>>> +  return false;
> >>>> +}
> >>>> +
> >>>>  static int riscv_online_cpu_vec(unsigned int cpu)
> >>>>  {
> >>>>    if (!has_vector()) {
> >>>> @@ -377,6 +392,9 @@ static int riscv_online_cpu_vec(unsigned int cpu=
)
> >>>>            return 0;
> >>>>    }
> >>>>
> >>>> +  if (check_vector_unaligned_access_table())
> >>>> +          return 0;
> >>>> +
> >>>>  #ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
> >>>>    if (per_cpu(vector_misaligned_access, cpu) !=3D RISCV_HWPROBE_MIS=
ALIGNED_VECTOR_UNKNOWN)
> >>>>            return 0;
> >>>> @@ -392,13 +410,15 @@ static int __init check_unaligned_access_all_c=
pus(void)
> >>>>  {
> >>>>    int cpu;
> >>>>
> >>>> -  if (!check_unaligned_access_emulated_all_cpus())
> >>>> +  if (!check_unaligned_access_table() &&
> >>>> +      !check_unaligned_access_emulated_all_cpus())
> >>>>            check_unaligned_access_speed_all_cpus();
> >>>>
> >>>>    if (!has_vector()) {
> >>>>            for_each_online_cpu(cpu)
> >>>>                    per_cpu(vector_misaligned_access, cpu) =3D RISCV_=
HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
> >>>> -  } else if (!check_vector_unaligned_access_emulated_all_cpus() &&
> >>>> +  } else if (!check_vector_unaligned_access_table() &&
> >>>> +             !check_vector_unaligned_access_emulated_all_cpus() &&
> >>>>               IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)=
) {
> >>>>            kthread_run(vec_check_unaligned_access_speed_all_cpus,
> >>>>                        NULL, "vec_check_unaligned_access_speed_all_c=
pus");
> >>>
> >>>>
> >>>> Regarding your table, it feels like a bit going back to old hardcode=
d
> >>>> platform description ;). I think some kind of auto-detection of spee=
d
> >>>> (not builtin the kernel) for platforms could be good as well to skip
> >>>> probing.
> >>>>
> >>>> A DT property also seems ok to me since the goal is to describe
> >>>> hardware. Would a common DT/ACPI property be appropriate ? The
> >>>> device_property API unified both so if we used some common property =
to
> >>>> describe the misaligned access speed (both in DT cpu node/ ACPI CPU
> >>>> device package), we could keep a single parsing method. But I'm no A=
CPI
> >>>> expert so I don't know if that really make sense.
> >>>>
> >>>> Thanks,
> >>>>
> >>>> Cl=C3=A9ment
> >>>>
> >>>>>
> >>>>> Thanks,
> >>>>> drew
> >>>>
> >>
>
