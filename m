Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEC71F61C
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 02:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746929325; cv=none; b=r0w7Ao4xIZjsfrNlZ42nb2GC/OQilmgV7LKKlzkOndIWxHCUi7MEirprtmbYNeLTyc5GDH/hMQtqzkxJJHniog0jTij0sdCn6goi59l4s1fDdPJAcilSlvMRU3FE5/kVZzryY4Ji8zQue4MGbvc8dURcllkHiVF+157UbRyvPhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746929325; c=relaxed/simple;
	bh=+hP6ZKRaI92mfj/xB9qLtMPQYpDTOyntlDNDZJGNd+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=syY9JKnp1cCcpWixh4n2cHm9fKe/wub/OlCvfpqKvKolROITM11Dpb6HXOn4qLJ/VyiSCYwnaYlDst2uZ9TQxye+SWs2ZsQAypyXWmWGxBsqRlRjFXJvWcosEYpz39gCldFgrmgy6kYqSnxr9G5PH7l4sVLkhvfyP2GFPQRxyVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muMRmfRv; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muMRmfRv"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6f5499c21bbso70459736d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 19:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746929322; x=1747534122; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClOyMhlucZgqqcgXQFq1OGdn3FnzyenLIIB/AbOlZeQ=;
        b=muMRmfRv7bxusPY20jAYjzkWDmpht2mKBB7B4yObIpkTp5TXgK0OSOMnZGGGzeIjWG
         5C9Czyl/K96aPSDYPPuIj6iHc7VkSueTk/8rSLPSLLIR43FXcSbdb2DP7GDEblBh5vMN
         H7S6I+xa46MGwga6BTMxyjqc9lQ714nr6rOL0+En/r33e0w1OjqIFZF/g7jBsur3WThS
         YXz/NkGXozRrb9wZo4L9ot0BuIRI/NETWwT2+9gZFGeVc+hq2juHKTazyXU2QFfC944s
         i9QG/IvScFybEyljoOuXTNLlv5Htjceq7itRzw5jYgxkIT+xa9fdz31wHZouAVTe1JKU
         K/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746929322; x=1747534122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ClOyMhlucZgqqcgXQFq1OGdn3FnzyenLIIB/AbOlZeQ=;
        b=KQztYmX156CKdYOSSMLtNanbtDmscWxdYG++/3QyK1Hib2ddDaNcUw/N7FwoYJCLc3
         Job4/aoltFLdzLbrzQm9RY1cIkADxmtTUv/P3hh4z3skZi/dB4ga6JN2qXbKV8zduANL
         c5TgKOJ2XQVB0yTTZsRXxDRuLf7t28990RdZB5VwQIcMJkoAvOCDpH+/5icWFmklUtjz
         2taGriTaG3783++Q6rsMzdtr2zxaJIYSiTYpnAHRHHYzqTVmnQmOjc2PoPAT1D8P+24t
         0YC8I9BAMcvAkDRA3nKpmSpmq5uWj0aZ/t1jDoR9/USER7bV9N0i6W0zeOz2EP5gwRz0
         xt1g==
X-Forwarded-Encrypted: i=1; AJvYcCXIRN3fIJCkhlfs1ZZx0Xs/9CvSPHAMdbcZnETsGG7THf7cdDIxOjcfywhOOgVqmfN0zHtlwjZCaRSxLuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YytupBwPH3m48mtWy9LEewfGVS9cU/KGN0bbErJUU5uKDLpw2GV
	awKaQAVY1w3N7bfkhXHqPSW8sqfrX/HPqRrFNN3kpJbLt8rFkRg8qouQPQl2S9uWCrveMm0GVtf
	vz7EwkMv99LXfQ4U5uRqknA8Z2lU=
X-Gm-Gg: ASbGncuJWhGV38ajyf/TrFxINUlL4h2CjAomO3ruLUns7AO3FFBEkTDAdnOF5fcZfKq
	RMxR3zqtKsM/NS0mvMc3im10tlihT/aQ6cXA+aBE/rt4Sfzxa1MD2Ok6BuxZTUY3XRgwWtVveND
	89kZZ/VqiHBciPHYW47LsB4n40VJqmk6XIRM3F9neTXQ7E
X-Google-Smtp-Source: AGHT+IF2PhzGd7mOgX0tWj7Z6vinwLYVjeU213A/ddZfEGxSK+Qd5So3trvKUv6fSx63wtK9zaZnFKkdfgqOOiT6+NI=
X-Received: by 2002:a05:6214:2509:b0:6e8:f99c:7939 with SMTP id
 6a1803df08f44-6f6e4858dbamr111203756d6.44.1746929321591; Sat, 10 May 2025
 19:08:41 -0700 (PDT)
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
 <20250509164654.GA608090@cmpxchg.org>
In-Reply-To: <20250509164654.GA608090@cmpxchg.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 11 May 2025 10:08:05 +0800
X-Gm-Features: AX0GCFuXx6aNt3iX3iyRdugZGlhnQTK3V6QST_mQcFhXTae8aR1F8hga1SaSN90
Message-ID: <CALOAHbBAVELx-fwyoQUH_ypFvT_Zd5ZLjSkAPXxShgCua8ifpA@mail.gmail.com>
Subject: Re: [PATCH 0/1] prctl: allow overriding system THP policy to always
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: David Hildenbrand <david@redhat.com>, Usama Arif <usamaarif642@gmail.com>, Zi Yan <ziy@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, shakeel.butt@linux.dev, 
	riel@surriel.com, baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 10, 2025 at 12:47=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.or=
g> wrote:
>
> On Fri, May 09, 2025 at 05:43:10PM +0800, Yafang Shao wrote:
> > On Fri, May 9, 2025 at 5:31=E2=80=AFPM David Hildenbrand <david@redhat.=
com> wrote:
> > >
> > > On 09.05.25 11:24, Yafang Shao wrote:
> > > > On Fri, May 9, 2025 at 1:13=E2=80=AFPM Johannes Weiner <hannes@cmpx=
chg.org> wrote:
> > > >>
> > > >> On Fri, May 09, 2025 at 10:15:08AM +0800, Yafang Shao wrote:
> > > >>> On Fri, May 9, 2025 at 12:04=E2=80=AFAM Usama Arif <usamaarif642@=
gmail.com> wrote:
> > > >>>>
> > > >>>>
> > > >>>>
> > > >>>> On 08/05/2025 06:41, Yafang Shao wrote:
> > > >>>>> On Thu, May 8, 2025 at 12:09=E2=80=AFAM Usama Arif <usamaarif64=
2@gmail.com> wrote:
> > > >>>>>>
> > > >>>>>>
> > > >>>>>>
> > > >>>>>> On 07/05/2025 16:57, Zi Yan wrote:
> > > >>>>>>> On 7 May 2025, at 11:12, Usama Arif wrote:
> > > >>>>>>>
> > > >>>>>>>> On 07/05/2025 15:57, Zi Yan wrote:
> > > >>>>>>>>> +Yafang, who is also looking at changing THP config at cgro=
up/container level.
> > > >>>>>
> > > >>>>> Thanks
> > > >>>>>
> > > >>>>>>>>>
> > > >>>>>>>>> On 7 May 2025, at 10:00, Usama Arif wrote:
> > > >>>>>>>>>
> > > >>>>>>>>>> Allowing override of global THP policy per process allows =
workloads
> > > >>>>>>>>>> that have shown to benefit from hugepages to do so, withou=
t regressing
> > > >>>>>>>>>> workloads that wouldn't benefit. This will allow such type=
s of
> > > >>>>>>>>>> workloads to be run/stacked on the same machine.
> > > >>>>>>>>>>
> > > >>>>>>>>>> It also helps in rolling out hugepages in hyperscaler conf=
igurations
> > > >>>>>>>>>> for workloads that benefit from them, where a single THP p=
olicy is
> > > >>>>>>>>>> likely to be used across the entire fleet, and prctl will =
help override it.
> > > >>>>>>>>>>
> > > >>>>>>>>>> An advantage of doing it via prctl vs creating a cgroup sp=
ecific
> > > >>>>>>>>>> option (like /sys/fs/cgroup/test/memory.transparent_hugepa=
ge.enabled) is
> > > >>>>>>>>>> that this will work even when there are no cgroups present=
, and my
> > > >>>>>>>>>> understanding is there is a strong preference of cgroups c=
ontrols being
> > > >>>>>>>>>> hierarchical which usually means them having a numerical v=
alue.
> > > >>>>>>>>>
> > > >>>>>>>>> Hi Usama,
> > > >>>>>>>>>
> > > >>>>>>>>> Do you mind giving an example on how to change THP policy f=
or a set of
> > > >>>>>>>>> processes running in a container (under a cgroup)?
> > > >>>>>>>>
> > > >>>>>>>> Hi Zi,
> > > >>>>>>>>
> > > >>>>>>>> In our case, we create the processes in the cgroup via syste=
md. The way we will enable THP=3Dalways
> > > >>>>>>>> for processes in a cgroup is in the same way we enable KSM f=
or the cgroup.
> > > >>>>>>>> The change in systemd would be very similar to the line in [=
1], where we would set prctl PR_SET_THP_ALWAYS
> > > >>>>>>>> in exec-invoke.
> > > >>>>>>>> This is at the start of the process, but you would already k=
now at the start of the process
> > > >>>>>>>> whether you want THP=3Dalways for it or not.
> > > >>>>>>>>
> > > >>>>>>>> [1] https://github.com/systemd/systemd/blob/2e72d3efafa88c1c=
b4d9b28dd4ade7c6ab7be29a/src/core/exec-invoke.c#L5045
> > > >>>>>>>
> > > >>>>>>> You also need to add a new systemd.directives, e.g., MemoryTH=
P, to
> > > >>>>>>> pass the THP enablement or disablement info from a systemd co=
nfig file.
> > > >>>>>>> And if you find those processes do not benefit from using THP=
s,
> > > >>>>>>> you can just change the new "MemoryTHP" config and restart th=
e processes.
> > > >>>>>>>
> > > >>>>>>> Am I getting it? Thanks.
> > > >>>>>>>
> > > >>>>>>
> > > >>>>>> Yes, thats right. They would exactly the same as what we (Meta=
) do
> > > >>>>>> for KSM. So have MemoryTHP similar to MemroryKSM [1] and if Me=
moryTHP is set,
> > > >>>>>> the ExecContext->memory_thp would be set similar to memory_ksm=
 [2], and when
> > > >>>>>> that is set, the prctl will be called at exec_invoke of the pr=
ocess [3].
> > > >>>>>>
> > > >>>>>> The systemd changes should be quite simple to do.
> > > >>>>>>
> > > >>>>>> [1] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4=
d9b28dd4ade7c6ab7be29a/man/systemd.exec.xml#L1978
> > > >>>>>> [2] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4=
d9b28dd4ade7c6ab7be29a/src/core/dbus-execute.c#L2151
> > > >>>>>> [3] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4=
d9b28dd4ade7c6ab7be29a/src/core/exec-invoke.c#L5045
> > > >>>>>
> > > >>>>> This solution carries a risk: since prctl() does not require an=
y
> > > >>>>> capabilities, the task itself could call it and override your m=
emory
> > > >>>>> policy. While we could enforce CAP_SYS_RESOURCE to restrict thi=
s, that
> > > >>>>> capability is typically enabled by default in containers, leavi=
ng them
> > > >>>>> still vulnerable.
> > > >>>>>
> > > >>>>> This approach might work for Kubernetes/container environments,=
 but it
> > > >>>>> would require substantial code changes to implement securely.
> > > >>>>>
> > > >>>>
> > > >>>> You can already change the memory policy with prctl, for e.g. PR=
_SET_THP_DISABLE
> > > >>>> already exists and the someone could use this to slow the proces=
s down. So the
> > > >>>> approach this patch takes shouldn't be anymore of a security fix=
 then what is already
> > > >>>> exposed by the kernel. I think as you mentioned, if prctl is an =
issue CAP_SYS_RESOURCE
> > > >>>> should be used to restrict this.
> > > >>>
> > > >>> I believe we should at least require CAP_SYS_RESOURCE to enable T=
HP,
> > > >>> since it overrides global system settings. Alternatively,
> > > >>> CAP_SYS_ADMIN might be even more appropriate, though I'm not enti=
rely
> > > >>> certain.
> > > >>
> > > >> Hm, could you verbalize a concrete security concern?
> > > >>
> > > >> I've never really looked at the global settings as a hard policy, =
more
> > > >> as picking a default for the workloads in the system. It's usually
> > > >> `madvise' or `always', and MADV_HUGEPAGE and MADV_NOHUGEPAGE have =
long
> > > >> existed to give applications the ability to refine the global choi=
ce.
> > > >>
> > > >> The prctl should probably respect `never' for consistency, but bey=
ond
> > > >> that I don't really see the concern, or how this would allow somet=
hing
> > > >> that isn't already possible.
> > > >
> > > > I would interpret the always, madvise, and never options as follows=
:
> > > > - always
> > > >    The sysadmin strongly recommends using THP. If a user does not
> > > > want to use it, they must explicitly disable it.
>
> I would call this "kernel mode" or "auto mode", where userspace should
> *generally* not have to worry about huge pages, but with an option for
> declaring the odd exceptional case.
>
> Both madvise() and unprivileged prctl() currently work, and IMO should
> continue to work, for declaring exceptions.
>
> > > > - madvise
> > > >   The sysadmin gently encourages the use of THP, but it is only
> > > > enabled when explicitly requested by the application.
>
> And this "user mode" or "manual mode", where applications self-manage
> which parts of userspace they want to enroll.
>
> Both madvise() and unprivileged prctl() should work here as well,
> IMO. There is no policy or security difference between them, it's just
> about granularity and usability.
>
> > > > - never
> > > >    The sysadmin discourages the use of THP, and "its use is only pe=
rmitted
> > > > with explicit approval" .
>
> This one I don't quite agree with, and IMO conflicts with what David
> is saying as well.
>
> > > "never" so far means "no thps, no exceptions". We've had serious THP
> > > issues in the past, where our workaround until we sorted out the issu=
e
> > > for affected customers was to force-disable THPs on that system durin=
g boot.
> >
> > Right, that reflects the current behavior. What we aim to enhance is
> > by adding the requirement that "its use is only permitted with
> > explicit approval."
>
> I think you're conflating a safety issue with a security issue.

I appreciate the corrections. English isn't my first language, so I
occasionally don't use words as precisely as I'd like.

>
> David is saying there can be cases where the kernel is broken, and
> "never" is a production escape hatch to disable the feature until a
> kernel upgrade for the fix is possible. In such a case, it doesn't
> make sense to override this decision based on any sort of workload
> policy, privileged or not.
>
> The way I understand you is that you want enrollment (and/or
> self-management) only for blessed applications.

Right.

> Because you don't
> generally trust workloads in the wild enough to switch the global
> default away from "never", given the semantics of always/madvise.

Historically, we have always set it to 'never.' Due to concerns
stemming from past incidents, the sysadmins have been hesitant to
switch it to 'madvise.' However, we=E2=80=99ve now discovered that AI servi=
ces
can gain significant performance benefits from it. As a solution, we
propose enabling THP exclusively for AI services while maintaining the
global setting as 'never.'

>
> To me this sounds like you'd need a different mode, call it "blessed";
> with a privileged interface to control which applications are allowed
> to madvise/prctl-enable.

This appears to be a viable solution.

--=20
Regards
Yafang
