Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D17719CCFA
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749655491; cv=none; b=j28HLpHCFABvpPX2GT9EJPZRN65FInwROlIgpFRq91TonzxSqQ0+sPBFx2cmbv3JwZHlAk3NhMV3XCohWlREERnAZYoLS1nuR/rcvOTDwBe7HSVUrBMJ95cqbm5u3FtxzDKZXECHp37gW+/o4SOOR6cgKO8CSBfm2yXAAXL2X54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749655491; c=relaxed/simple;
	bh=oRacMQtM2NPT2AZUEHlFJ1X7njDLyMI4YFQZ53xaNdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DijoiNfsqNpeXGvJhVTzFGx/GXKSzS9G0okA/65pPTymbFyXu3u5g4T3QcUq4Ss2z2B9pUM6eNkrEfUoBWn0pgfTw3oavxYb1elFuZ6yVUK1mMy8yK9gsqX+5K1CqFX0eGayl5P+WYWzhQvwru15qirP4NooPor2wQmGvcELvlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kBj4nRBp; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kBj4nRBp"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-47e9fea29easo388581cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 08:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749655486; x=1750260286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCaCBzkui1UDzyO3kyUbEuaCu0ZsnJ9BO/eNavHEABw=;
        b=kBj4nRBpxuVHNxUlY+AUAmYd8XQK/kULXNTMFS9mNytDh1oF1RvpmpLugOSYP89s7a
         nNbZIaEu/ElaHtoGLUX3odifkz2gBQ5A/xVbs5s/1w3NCtFGTlgvXYx6ay8PE+LBvAsG
         8cn2o14YSD6tOlT0prVN7KSKwC/yaFAPAsCBDZa0dtksPmL42vdb/BAatV3zyT6BWmLJ
         FzRRbPBptDs29AXE2Ux6IRNbkj0jLIMEh7ReqlfV/Kg9ngP0UWlrta8zppiGCc4Zqm+y
         5QgoBGpulmNb6ULMKkryADs6/iSNGi+dpZzE1JwN/MnAz3BP3LCgfLjp0BID1djFl9S0
         V0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749655486; x=1750260286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vCaCBzkui1UDzyO3kyUbEuaCu0ZsnJ9BO/eNavHEABw=;
        b=BkdbgvPR8s/XIVNe3kYiugsOGql5Pby59AXlTz9Q2wE66p7DpiM158kN/vTz0KKXrR
         JMddGJhlSKElKY7UVQ6v9mArfkCgzugBa9xDWGTyt5Hd4B8EL8JGImXTjbqu6QosbhEe
         94lJjgTd6YaUb2w47vyNzoGyjWErYnojCRlOtAquEkxIwLoGgDeAQ+B7up0b5vWT2+MY
         n/A/2PxFalPvroYDm6XYpOihFyeQq3XTmNWwCtbDJQ7bvw0HzWYiwJQiXtHjCsrmi9f8
         CdctJCF0ad5cQA78hDV0+1iy0S1OPMmoxRhtTJw9VYtRrhZd3NsGpGyfJ5saTl2tirdb
         IbCA==
X-Forwarded-Encrypted: i=1; AJvYcCXIwa0mETuOOkzGKnGbasxaY6Aphf/+e1xIaNbBGGtgmCXaKNz2cYfXKJU0PlXeoPlV5IK+tob5KEoBalc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyig9u4qIye0UYh9Wxti26jr9pLQRoNWZVa3A2JNlkpT/m5FxRM
	Kl0+miNlhqvNjcJFUf3LoTRB7UCg3+oK/VARxYLgsFn5Hw6f7aaqrQa8LkQ8Q0/eqC7U2EXPLvW
	eetznWrfEvnjzEVPb5MluLQwglYeNfTzM0DI51ipD
X-Gm-Gg: ASbGncvVdJaui+U6v/J6pQbj4ossplPb90gdLggGRnR3qBVECCykoQ8ufivu49c3SpB
	i3Y4RYvTgnzGquBsRNZgQVG1DvBA4kEgb7N0bOkVW6aYocuFo6hmRKqDWtJRKZoDD411AMN1Buw
	kzlq4LIVDcNrc7f2v/EGL48wMhTeKYmHJV9VMZcgBY+mHYl7dPNqBZZdlKr0kCbzeSfXfcj+22g
	g==
X-Google-Smtp-Source: AGHT+IGaALA5HOLF2Qc8q+0m2dcXfrcmFj7afCc+J9p/TZJhNBKTdOqSEIlLEe7fCAwa46Vm7qJA5ZayuJKteVEOWUI=
X-Received: by 2002:ac8:59c6:0:b0:4a6:f525:e35a with SMTP id
 d75a77b69052e-4a71739dc8dmr3158121cf.9.1749655485134; Wed, 11 Jun 2025
 08:24:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529073537.563107-1-hao.ge@linux.dev> <177e1f6b-50f0-4c0a-bb0b-514283e009a2@linux.dev>
 <CAJuCfpE9Y6iMt5sDd+NUuXAeqXiQXaYZOobGDvi7LYRqm=7-KA@mail.gmail.com> <b132dd1f-984b-452e-b19b-18cdecb2842a@linux.dev>
In-Reply-To: <b132dd1f-984b-452e-b19b-18cdecb2842a@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 11 Jun 2025 08:24:33 -0700
X-Gm-Features: AX0GCFthPV7_LeBFMNGhB_8jSOnMn-WFI9CR8rdaYFAYdBGzvtcRNw3_DpDvzmg
Message-ID: <CAJuCfpGueFFKwyhG6Lz44dtJOZbicFoB5S=44GV_oyLUn8oQtA@mail.gmail.com>
Subject: Re: [PATCH] mm/alloc_tag: add the ARCH_NEEDS_WEAK_PER_CPU macro when
 statically defining the percpu variable alloc_tag_counters.
To: Hao Ge <hao.ge@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, Hao Ge <gehao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 10:27=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
>
> On 2025/6/10 00:39, Suren Baghdasaryan wrote:
> > On Sun, Jun 8, 2025 at 11:08=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote=
:
> >>
> >> On 2025/5/29 15:35, Hao Ge wrote:
> >>> From: Hao Ge <gehao@kylinos.cn>
> >>>
> >>> Recently discovered this entry while checking kallsyms on ARM64:
> >>> ffff800083e509c0 D _shared_alloc_tag
> >>>
> >>> If ARCH_NEEDS_WEAK_PER_CPU is not defined,there's no need to statical=
ly
> >>> define the percpu variable alloc_tag_counters.
> >>>
> >>> Therefore,add therelevant macro guards at the appropriate location.
> >>>
> >>> Fixes: 22d407b164ff ("lib: add allocation tagging support for memory =
allocation profiling")
> >>> Signed-off-by: Hao Ge <gehao@kylinos.cn>
> >>> ---
> >>>    lib/alloc_tag.c | 2 ++
> >>>    1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> >>> index c7f602fa7b23..d1dab80b70ad 100644
> >>> --- a/lib/alloc_tag.c
> >>> +++ b/lib/alloc_tag.c
> >>> @@ -24,8 +24,10 @@ static bool mem_profiling_support;
> >>>
> >>>    static struct codetag_type *alloc_tag_cttype;
> >>>
> >>> +#ifdef ARCH_NEEDS_WEAK_PER_CPU
> >>>    DEFINE_PER_CPU(struct alloc_tag_counters, _shared_alloc_tag);
> >>>    EXPORT_SYMBOL(_shared_alloc_tag);
> >>> +#endif /* ARCH_NEEDS_WEAK_PER_CPU */
> >>>
> >>>    DEFINE_STATIC_KEY_MAYBE(CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFA=
ULT,
> >>>                        mem_alloc_profiling_key);
> >> Hi Suren
> >>
> >>
> >> I'm sorry to bother you. As mentioned in my commit message,
> >>
> >> in fact, on the ARM64 architecture, the _shared_alloc_tag percpu
> >> variable is not needed.
> >>
> >> In my understanding, it will create a copy for each CPU.
> >>
> >>    The alloc_tag_counters variable will occupy 16 bytes,
> >>
> >> and as the number of CPUs increases, more and more memory will be wast=
ed
> >> in this segment.
> >>
> >> I realized that this modification was a mistake. It resulted in a buil=
d
> >> error, and the link is as follows:
> >>
> >> https://lore.kernel.org/all/202506080448.KWN8arrX-lkp@intel.com/
> >>
> >> After I studied the comments of DECLARE_PER_CPU_SECTION, I roughly
> >> understood why this is the case.
> >>
> >> But so far, I haven't come up with a good way to solve this problem. D=
o
> >> you have any suggestions?
> > Hi Hao,
> > The problem here is that ARCH_NEEDS_WEAK_PER_CPU is not a Kconfig
> > option, it gets defined only on 2 architectures and only when building
> > modules here https://elixir.bootlin.com/linux/v6.15.1/source/arch/alpha=
/include/asm/percpu.h#L14
> > and here https://elixir.bootlin.com/linux/v6.15.1/source/arch/s390/incl=
ude/asm/percpu.h#L21.
> > A nicer way to deal with that is to make if a Kconfig option which is
> > enabled only for alpha and s390 and then do something like this:
> >
> >   #if defined(MODULE) && defined(ARCH_NEEDS_WEAK_PER_CPU)
> > #define MODULE_NEEDS_WEAK_PER_CPU
> > #endif
> >
> > and change all the usages of ARCH_NEEDS_WEAK_PER_CPU with
> > MODULE_NEEDS_WEAK_PER_CPU.
> > Did I explain the idea clearly?
> > Thanks,
> > Suren.
> >
> Hi Suren

Hi Hao,

>
> Thanks for your guidance.
> I understand this train of thought.
>
> I've been thinking about a problem: I only added the
> ARCH_NEEDS_WEAK_PER_CPU
>
> macro to isolate the definition of _shared_alloc_tag.
>
> Since s390 defines this macro, why did this build error occur?

The problem is that ARCH_NEEDS_WEAK_PER_CPU is not a Kconfig option,
it's just a definition, for s390 it's here:
https://elixir.bootlin.com/linux/v6.15.1/source/arch/s390/include/asm/percp=
u.h#L21
So, even for s390 if you are building core kernel code (not a module),
ARCH_NEEDS_WEAK_PER_CPU will be undefined, however if you are building
a module on s390 then it is defined. So, your change effectively
results in _shared_alloc_tag being compiled out in the core kernel
while it's used when you build a module. Therefore during linking
modules can't link to that symbol in the core kernel. Hope this
explains the issue.

The way I would fix this is by making ARCH_NEEDS_WEAK_PER_CPU a
Kconfig option and enable it for s390 and alpha, would replace old
definitions from
https://elixir.bootlin.com/linux/v6.15.1/source/arch/s390/include/asm/percp=
u.h#L21
and https://elixir.bootlin.com/linux/v6.15.1/source/arch/alpha/include/asm/=
percpu.h#L14
with:

#if defined(MODULE) && defined(ARCH_NEEDS_WEAK_PER_CPU)
#define MODULE_NEEDS_WEAK_PER_CPU
#endif

Then use MODULE_NEEDS_WEAK_PER_CPU instead of ARCH_NEEDS_WEAK_PER_CPU
in all the current places in the kernel code. Lastly, to compile out
_shared_alloc_tag your current patch should work fine because on s390
and alpha ARCH_NEEDS_WEAK_PER_CPU will be defined after all these
changes.
Does that make sense?

>
> Could you please help explain it again?
>
> Thanks
> Best Regards
> Hao
>
> >>
> >> Thanks
> >>
> >> Best Regards
> >>
> >> Hao
> >>
> >>
> >>
> >>
