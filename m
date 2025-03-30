Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC4912E7F
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 06:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743317662; cv=none; b=fgsAGabPVyMqziXujT8xf5xsBfgBQLz7SsFLhWzNacLGwsZMmTK0cYU8j0+5VPuK0ZbTIcF15+UG+QUGd1ZJ89LnYaFmlDG+T5YphWHwCJgdEewdk7UYnSDT1FmSEEqlrxyuRmPWmX/gbOpbDpZWlb3WSFsbEaZSOo990QQwUOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743317662; c=relaxed/simple;
	bh=RM5VKr/vhX6+mbd6ORRLLuuy46xKh1rfSK1Y6Gyv+VA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eAao6xsxivisTepgmmvC3OHs/wmLWh0+EfWIjx2wb2j4RNN5l6ZGZ6H2tEdQBqtuPuRKmCGOwW31qNTroc2QuK4v6h73hZ7+78zkGbI3Keod+Pqt3uKC7btSTA8EFSlbDt/NYlRDA2X7wqVbF1KbBjy03cRmmc40D4a6DU4G5uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NW8BF/4B; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NW8BF/4B"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30c44a87b9cso27502351fa.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 23:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743317659; x=1743922459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCqM6S9fcFwdZC01tk9e6BbnR34DNrquAtTO5TK6Sfg=;
        b=NW8BF/4Bkyb6iQC3aK95xK6Iw+H8+wstOKschBAM+Mf+eoK3D9MTXd1mo535oCwfcG
         ADWEbglPus2/cP2Azb6ld9hFHqFL/nI5rS9ES8LvuNcbgo+KXmP+VuGQeqPbtw2s1PNZ
         7A2wL5N8blZSsCfCzM60X4GxTvD7w2gaUgZ1RBt6Ue9DLsFsitGuIpfaKv4UHAwd+hb0
         ClGvZOS7MNYTe+BhVbbrKRqlHW1ETMHivMTOZLhrZYVdN6ZiCMmkxecgXzZzDacMwHDL
         Mo9bSyXnY3YBEii/J18AgEragCjUGW4lsp2ECiN9sKu1aBxvguSMaco7Gp+G3bYYmByZ
         Rsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743317659; x=1743922459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uCqM6S9fcFwdZC01tk9e6BbnR34DNrquAtTO5TK6Sfg=;
        b=VmEr+U8niFqR4PDgW9PJ/jy5kYm1ahREP2GvpQ23XVDJpeDyBcN+GYVw24eU08OQlF
         yjRpo/deOilFfEypwbk5vNaQBdthuDUyJlZDtdsK9hHc4ekmeHgkKUyIzeYiXDnCr3Yv
         eXbI+BlU5OvL1Y130e4tVSqLR4v28LPQz+8FeB1/RIBiNemsS+WziQ3yB0EGZ4KvVAdT
         Xel0m9GsMUvUKcFAwXGNYJccctRKEsLAMBgXY45skr2mpE+PJ+/mfg3sma0uh+5VZjEI
         m2Wrt6ORzjkjr1UFCKuoR2BSU+2sD0a7zH6dtPpts+oBtVgqU8LHoLwDDX5zALIalGxk
         eBuA==
X-Forwarded-Encrypted: i=1; AJvYcCXrDQaSQMPtGnKHZfjzXSb/DHfttCFMN0mOcw4LieiYwbto6XPw/Etmt0HWpnwyz3VHdmPPj+Z/vN4JfrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwV+Dcxxea0g4+toNIlwuZ5t/fgk0r/cY6+tyxmQTOevRltaU3Z
	trr0b2EjIdbMtitI5WqeKS1cpWQ6ZSER3EsulUxfRElwWx4DzT1Q0j8E3ff7RxE7TAV8PIzfzLo
	O7ZrVEsQ03dfEuiBYjdHvpayQkD8=
X-Gm-Gg: ASbGncthdtDD0gopktwTC7DvRj2LKBb3IjyR8EcmAbp/nhujqblNQDmrMoYVNKIjYpO
	BORKzBRdYxBWYLWpV0qmL1B2U4hIQ/VigCWSejjsokp93odLvwuXZha2R6q5RDMae1xzNGUsJB9
	CDUHhpP1JrSh3iHrqCcwe5hvQxZgWVA5bd0TX/
X-Google-Smtp-Source: AGHT+IFibXH+k1L08iAWYqZ2L4GCmxrk77eTnatFSg85QJoKDL3EgBu5C5hlXDOQVxhPj9NixuPBkglKT5AqlrUn9NU=
X-Received: by 2002:a2e:a584:0:b0:30b:f23e:77fb with SMTP id
 38308e7fff4ca-30de0279068mr17493301fa.21.1743317658548; Sat, 29 Mar 2025
 23:54:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325164854.199420-1-ubizjak@gmail.com> <20250325164854.199420-2-ubizjak@gmail.com>
 <Z-Mme_OxuhYfxgzO@gmail.com> <CAFULd4bCnnL-CBFwgAQtN9S+sUE_wikda6E+8k9632J9b62dCg@mail.gmail.com>
 <10FC5E45-98DB-4C34-A0FE-16B2BB588F11@zytor.com>
In-Reply-To: <10FC5E45-98DB-4C34-A0FE-16B2BB588F11@zytor.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 30 Mar 2025 08:54:13 +0200
X-Gm-Features: AQ5f1Jrx4TtAhaAX0S9PUaKXNy4HySWwuHG3zvY-4feUEiciTgIzvvs4y9VUURg
Message-ID: <CAFULd4b=5Gh1YxJtq3bWKZFf_jCRrSFv5TurGDEP3ymCfjpPkQ@mail.gmail.com>
Subject: Re: [PATCH -tip 2/2] x86/hweight: Use POPCNT when available with
 X86_NATIVE_CPU option
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 30, 2025 at 12:10=E2=80=AFAM H. Peter Anvin <hpa@zytor.com> wro=
te:
>
> On March 29, 2025 2:19:37 AM PDT, Uros Bizjak <ubizjak@gmail.com> wrote:
> >
> >The proposed solution builds on the fact that with -march=3Dnative (and
> >also when -mpopcnt is specified on the command line) , the compiler
> >signals the availability of certain ISA by defining the corresponding
> >definition. We can use this definition to relax the constraints to fit
> >the instruction, not the ABI of the fallback function call. On x86, we
> >can also access memory directly, avoiding clobbering a temporary input
> >register.
> >
> >Without the fix for (obsolete) false dependency, the change becomes simp=
ly:
> >
> >#ifdef __POPCNT__
> >     asm ("popcntl %[val], %[cnt]"
> >                 : [cnt] "=3Dr" (res)
> >                 : [val] ASM_INPUT_RM (w));
> >#else
> >
> >and besides the reported savings of 600 bytes in the .text section
> >also allows the register allocator to schedule registers (and input
> >arguments from memory) more optimally, not counting additional 9k
> >saved space in the alternative section.
> >
> >The patch is also an example, how -march=3Dnative enables further
> >optimizations involving additional ISAs.
>
> If you have __POPCNT__ defined, could you not simply use __builtin_popcnt=
()?

We can use it, but then the compiler (at least GCC) will start to emit
false dependency fixups for POPCNT instructions (which we don't want;
TZCNT has the same problem, where we agreed that it is not worth
fixing for 10 years old cpus [1]).

Please note that __builtin functions are not strictly required to be
inlined and can generate a library call [2]. I have been burned by
this fact with __builtin_parity(), so IMO the safest way in case of
POPCNT insn is to use ISA macros only to determine the availability of
ISA.

Also note that optimizations with constant arguments are already
performed elsewhere (c.f. <asm-generic/bitops/const_hweight.h>) and
__arch_hweight() receives only variable arguments, so optimization
opportunities with __builtin function are greatly reduced.

[1] https://lore.kernel.org/lkml/CAFULd4ZzoW+vP_pa1hEF--gvsG8yaPLU8S7oBkJBZ=
LP4Tirepw@mail.gmail.com/
[2] https://lore.kernel.org/linux-mm/CAKbZUD0N7bkuw_Le3Pr9o1V2BjjcY_YiLm8a8=
DPceubTdZ00GQ@mail.gmail.com/

Uros.
