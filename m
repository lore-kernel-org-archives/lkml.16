Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122022AF1C
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747136665; cv=none; b=iKwQF5BP3F7QVUyqaErY2Gm0dWYDEfQ3reQVDaXAbEF6qu3w0ionVwxuiK/SRELwGnuzsolinKx/qtkzOPWadl92IHlJ9oPAJOM0bwyfZn1oRxo63SuBgBFxXexbLszfL30dZFiO79+0hF9gBR+mQsbZLvRcea9Z7qPyVMuIpZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747136665; c=relaxed/simple;
	bh=VC14k84pFR6nXBV72INcxwmAY8e6x8FUnbFrr1FpdMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PlIoSu9duKv1rTHIbEBUbJK2skMBP5D2X70Rj+sOhaMt2PLcIIq71yc9e1NTEhdMBdU2y9B0LKseR4ZgFWW4DF1/U4jIGBd3MPBlEGJf2YICumZZ+vLq2VQJgCfc/Al93ph9BArx9KzsVCigPLYD/ezWcg3QYBZHsBlCWQHppiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JX+hH7DH; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JX+hH7DH"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f891e93e97so6933566d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747136663; x=1747741463; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jC7TEuWklRTXBAYZG2fvSOa9sOcDdZ2vgzw2hj2FjQ4=;
        b=JX+hH7DHecDYBTh6W7+DFH8XQ99tluvzIr5EHPfoGBCn4XsHw57rxXbwCf5ql4EG8t
         DUQ85mzCBuYQOsSxFbnw3HNSsq9+I5lFufJ0cA557VU8euje7Wfi7Gj5nBYjvRsOFQFh
         tcnzH0tHvVN8izxTYSmzy0GIArWiytXtSxR30HZxKPeKkqRtrBLSJ0DTmyckdO783rO/
         JVHJtLpy2mK9SrxDMs7SnObjx/9d3BsdRypWuAmJJQPTW/HaOv0AizA1fjBHEQdwPtC3
         NxzGlTOcXNdM9b+ngpP+A/zSUHWQfyLcVK/F5XzGb27bbjRh6PrAATiK/Bk652qgwpu5
         xYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747136663; x=1747741463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jC7TEuWklRTXBAYZG2fvSOa9sOcDdZ2vgzw2hj2FjQ4=;
        b=MpuyJE8uwIIc8S5A3UhPXAPKxL/6fYx4UUu74KsF+Z9jIJlzUF41urmS55r+3iSJda
         y3+MWSC2GQ7WS2pKalgR81AS6+GXRuln37thi6PLxic/TZjOsM94VsdPyGBjGBuotydI
         phemi71Sbs96iCfWP37/dvoYAPvJZdUMkHURw4+0ikxlFhrFHvKyd2uYIIoUTqJ1AxsB
         e6fQrjZzLBddg1VUs8FNmAqmhLddFDJ9I8HY108BjjBnbhnUhnV0F7wI2U2kvu9VxDf+
         qaKp605mf/sIrdOYwsgK6hxs+9ojlixNgqMIr+n0ii+pmxFlR1dMF5Ssb1gNcBZXVxPz
         1IAg==
X-Forwarded-Encrypted: i=1; AJvYcCUy1ERKqGYLkELK/gd+ghIi0guOgMWcguk89uqZ90/p1U09p/sKnPl7F/kdfZpX7C+mR+voYOpWhTtwL+w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0HeVdArB6s8W/TsqWY9Gv89AIToX9QnPoAgP4u9BI2Vld8cmp
	YtoW/Fq39ztPWqwqHMFk/kChQkzPPAh9y9Z4Y/0Iwvqo3MLDyobBwFcyHPC95BPAoh5tnUV7lwk
	i9Zy1TRXab1EXXS74yFUd6TCap+s=
X-Gm-Gg: ASbGncvZ7roVP0JVjYMznUtLpaNqisVqLFKbYnqmBnoyvdLO3kQGM4yktaI4r6wTRaW
	JskhGZQkUET+Bs1JA3LTqi9CjY7cA36TyUHBwBUWH6akk+PXT5aERximzNCf3GJ2an3FyiRfesC
	jY9okv3V1KhnIc/Xxc46OWVRABtimxkLgVyw==
X-Google-Smtp-Source: AGHT+IGIWw7kGW3HI3/WPmJVUXsuDAoFJmjiEhA4YYojwfVZK4Zc4fWOqql33Qk8RjAafMheO64TGaNRxXlg7k6moQs=
X-Received: by 2002:a05:6214:262d:b0:6e4:4484:f35b with SMTP id
 6a1803df08f44-6f6e481482emr224858976d6.30.1747136662714; Tue, 13 May 2025
 04:44:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <96eccc48-b632-40b7-9797-1b0780ea59cd@gmail.com>
 <8E3EC5A4-4387-4839-926F-3655188C20F4@nvidia.com> <279d29ad-cbd6-4a0e-b904-0a19326334d1@gmail.com>
 <CALOAHbCxhL=VM=E5UzNvQYZsrF4zdcQ1-49iEJ1UYvLsurtxCw@mail.gmail.com>
 <ebfca8f2-40e5-485a-a060-621aa3a22376@gmail.com> <CALOAHbDesDGyokKFSSr3hA1_WnFciQPXe_nboPq9v8OUPLv47g@mail.gmail.com>
 <20250509051328.GF323143@cmpxchg.org> <CALOAHbA617417UtcwMBJ9Zm_8BbAth57=ngN=tknw8h7nvCwNw@mail.gmail.com>
 <41e60fa0-2943-4b3f-ba92-9f02838c881b@redhat.com> <CALOAHbAvQDee2=5vsDqj77g5gAGdGpXFBbsC7tpKnCYEDZS3vw@mail.gmail.com>
 <20250509164654.GA608090@cmpxchg.org> <f691d2e0-5919-4581-8a24-1b543d798ae4@redhat.com>
 <8A18FB29-CC41-456F-A80E-807984691F0F@nvidia.com> <913bdc9b-a3c2-401c-99d0-18799850db9e@redhat.com>
 <13b68fa0-8755-43d8-8504-d181c2d46134@gmail.com>
In-Reply-To: <13b68fa0-8755-43d8-8504-d181c2d46134@gmail.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 13 May 2025 19:43:46 +0800
X-Gm-Features: AX0GCFu4_oj4vmd6JVy6rgxsnCt-9EEvGCBGDNRUX6ZCWd7kFDohTmUXZwbH4No
Message-ID: <CALOAHbAZ8rkeuJ_0Litax4FeyZjNbviURr6njuvuA93W66ZGcg@mail.gmail.com>
Subject: Re: [PATCH 0/1] prctl: allow overriding system THP policy to always
To: Usama Arif <usamaarif642@gmail.com>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	shakeel.butt@linux.dev, riel@surriel.com, baolin.wang@linux.alibaba.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com, 
	ryan.roberts@arm.com, linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 11, 2025 at 10:08=E2=80=AFPM Usama Arif <usamaarif642@gmail.com=
> wrote:
>
>
>
> On 11/05/2025 09:15, David Hildenbrand wrote:
> > On 10.05.25 01:34, Zi Yan wrote:
> >> On 9 May 2025, at 18:42, David Hildenbrand wrote:
> >>
> >>>>>>> - madvise
> >>>>>>>     The sysadmin gently encourages the use of THP, but it is only
> >>>>>>> enabled when explicitly requested by the application.
> >>>>
> >>>> And this "user mode" or "manual mode", where applications self-manag=
e
> >>>> which parts of userspace they want to enroll.
> >>>>
> >>>> Both madvise() and unprivileged prctl() should work here as well,
> >>>> IMO. There is no policy or security difference between them, it's ju=
st
> >>>> about granularity and usability.
> >>>>
> >>>>>>> - never
> >>>>>>>      The sysadmin discourages the use of THP, and "its use is onl=
y permitted
> >>>>>>> with explicit approval" .
> >>>>
> >>>> This one I don't quite agree with, and IMO conflicts with what David
> >>>> is saying as well.
> >>>
> >>> Yeah ... "never" does not mean "sometimes" in my reality :)
> >>>
> >>>>
> >>>>>> "never" so far means "no thps, no exceptions". We've had serious T=
HP
> >>>>>> issues in the past, where our workaround until we sorted out the i=
ssue
> >>>>>> for affected customers was to force-disable THPs on that system du=
ring boot.
> >>>>>
> >>>>> Right, that reflects the current behavior. What we aim to enhance i=
s
> >>>>> by adding the requirement that "its use is only permitted with
> >>>>> explicit approval."
> >>>>
> >>>> I think you're conflating a safety issue with a security issue.
> >>>>
> >>>> David is saying there can be cases where the kernel is broken, and
> >>>> "never" is a production escape hatch to disable the feature until a
> >>>> kernel upgrade for the fix is possible. In such a case, it doesn't
> >>>> make sense to override this decision based on any sort of workload
> >>>> policy, privileged or not.
> >>>>
> >>>> The way I understand you is that you want enrollment (and/or
> >>>> self-management) only for blessed applications. Because you don't
> >>>> generally trust workloads in the wild enough to switch the global
> >>>> default away from "never", given the semantics of always/madvise.
> >>>
> >>> Assuming "never" means "never" and "always" means "always" ( crazy, r=
ight? :) ), could be make use of "madvise" mode, which essentially means "V=
M_HUGEPAGE" takes control?
> >>>
> >>> We'd need
> >>>
> >>> a) A way to enable THP for a process. Changing the default/vma settin=
gs to VM_HUGEPAGE as discussed using a prctl could work.
> >>>
> >>> b) A way to ignore VM_HUGEPAGE for processes. Maybe the existing prct=
l to force-disable THPs could work?
> >>
> >> This means process level control overrides VMA level control, which
> >> overrides global control, right?
> >>
> >> Intuitively, it should be that VMA level control overrides process lev=
el
> >> control, which overrides global control, namely finer granularly contr=
ol
> >> precedes coarse one. But some apps might not use VMA level control
> >> (e.g., madvise) carefully, we want to override that. Maybe ignoring VM=
A
> >> level control is what we want?
> >
> > Let's take a step back:
> >
> > Current behavior is
> >
> > 1) If anybody (global / process / VM) says "never" (never/PR_SET_THP_DI=
SABLE/VM_NOHUGEPAGE), the behavior is "never".
>
> Just to add here to the current behavior for completeness, if we have the=
 global system setting set to never,
> but the global hugepage level setting set to madvise, we do still get a T=
HP, i.e. if I have:
>
> [root@vm4 vmuser]# cat /sys/kernel/mm/transparent_hugepage/enabled
> always madvise [never]
> [root@vm4 vmuser]# cat /sys/kernel/mm/transparent_hugepage/hugepages-2048=
kB/enabled
> always inherit [madvise] never
>
> And then MADV_HUGEPAGE some region, it still gives me a THP.
>
> >
> > 2) In "madvise" mode, only "VM_HUGEPAGE" gets THP unless PR_SET_THP_DIS=
ABLE is set. So per-process overrides per-VMA.
> >
> > 3) In "always" mode, everything gets THP unless per-VMA (VM_NOHUGEPAGE)=
 or per-process (PR_SET_THP_DISABLE) disables it.
> >
> >
> > Interestingly, PR_SET_THP_DISABLE used to mimic exactly what I proposed=
 for the other direction (change default of VM_HUGEPAGE), except that it wo=
uldn't modify already existing mappings. Worth looking at 1860033237d4. Not=
 sure if that commit was the right call, but it's the semantics we have tod=
ay.
> >
> > That commit notes:
> >
> > "It should be noted, that the new implementation makes PR_SET_THP_DISAB=
LE master override to any per-VMA setting, which was not the case previousl=
y."
> >
> >
> > Whatever we do, we have to be careful to not create more mess or incons=
istency.
> >
> > Especially, if anybody sets VM_NOHUGEPAGE or PR_SET_THP_DISABLE, we mus=
t not use THPs, ever.
> >
>
>
> I thought I will also summarize what the real world usecases are that we =
want to solve:
>
> 1) global system policy=3Dmadvise, process wants "always" policy for itse=
lf: We can have different types of workloads stacked on the same host, some=
 of them benefit from always having THPs,
> others will incur a regression (either its a performance regression or th=
ey are completely memory bound and even a very slight increase in memory wi=
ll cause them to OOM).
> So we want to selectively have "always" set for just those workloads (pro=
cesses). (This is how workloads are deployed in our (Metas) fleet at this m=
oment.)
>
> 2) global system policy=3Dalways, process wants "madvise" policy for itse=
lf: Same reasoning as 1, just that the host has a different default policy =
and we don't want the workloads (processes) that regress with always gettin=
g THPs to do so.
> (We hope this is us (meta) in the future, if a majority of workloads show=
 that they benefit from always, we flip the default host setting to "always=
" and workloads that regress can opt-out and be "madvise".
> New services developed will then be tested with always by default. Always=
 is also the default defconfig option upstream, so I would imagine this is =
faced by others as well.)
>
> 3) global system policy=3Dnever, process wants "madvise" policy for itsel=
f: This is what Yafang mentioned in [1]. sysadmins dont want to switch the =
global policy to madvise, but are willing to accept certain processes to ma=
dvise.
> But David mentioned in [2] that never means no thps, no exceptions and th=
e only way to solve some issues in the past has been to disable THPs comple=
tely.

The interpretation of never as "disable THPs completely" makes sense
to me, as sysadmins need a guaranteed way to disable THP. If
applications could still allocate THPs in never mode, it would
frustrate sysadmins.

For case 3), I agree with Johannes that introducing a new mode (e.g.,
"blessed" or "bpf") would be ideal. This mode would allow per-task THP
policy adjustments via BPF programs, defaulting to never when no BPF
program is attached.

[0]. https://lore.kernel.org/linux-mm/20250509164654.GA608090@cmpxchg.org/

--=20
Regards
Yafang
