Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC0428D8E9
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746783829; cv=none; b=s18u1bMnnounByze11BsyyRndRresOdesmvm/iG8FXFXY1DH0FM0xBtPA2Y5c7gvrL5AnCkZlEc91ZJm4Abuitc6WItudmiVtfDW7BSiwSdNR4+ZyxS5EcJvdYW9dG+2eeq+MtVzPCSNa9BqPiSNlklf8Ll1rvvAiiOMpkEIZa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746783829; c=relaxed/simple;
	bh=ZYcQ/y+hOPkmLKQifSieSLa9dxFfIV8lTeiXdqaWtP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WsJqJgHALdhRFRjgCroeGDhZSFQjOCq9Z6RMHfuczOtP/CyEOFv5xIHmEOt0U20AXTmK93MaPORgf78DVNHT+Xdm00ssxgJvMK+cGtoBNtJRWGZR00h0ADJ3kp8k02iESTeGP9Cz3xpLLlvo54lM76cmmcHCX7c4Ac31V1MRdfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKEf6YFF; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKEf6YFF"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6f5440fcf81so35248216d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 02:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746783827; x=1747388627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhR1gWtezcRXQ67/UgHQ8+jPhWMCevIttvhiLDz9DMQ=;
        b=IKEf6YFFcG0EbtF+V9rKTJpqu/NoOp0eOmrfwX610allchRD6RYmBzulB9QPC0ABUN
         iPRZj2+cziJJ8o/Pgja8WtlZ4BimCWd35vcsyn/gg7sjya6LsZcJDrvmdGaaKjQH5D7n
         0hXkfmL1JN7HzFeSKiyXz/XfMH8xipOqdWXMj8qpT0+DlPbmb+8YX2KnVZ2QfTJ4aJvY
         OdQVRTv4YpaMMZUc/caaqGKaijuDBKoPUplkotY9sTjq+9Yt+VGechfYFFXPPWejB0NV
         iuvuNGtcXn2JFpzcmhyjkGuVn7AXDI9W6KQxogRSYRprlKF3ZNe8tKv429uKttAteNJZ
         l3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746783827; x=1747388627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhR1gWtezcRXQ67/UgHQ8+jPhWMCevIttvhiLDz9DMQ=;
        b=KNSMLEScDJaivmsR5n2/pwbrYpjR7q/RYmMJUs6+X0cfDL63Q1mPQ6CbuUZEwgRU/p
         vwA5AJYl5Gs7KI6aQ3UYkeKkGw5CBSR1Bcwcc1xx3lcHXgaNFmFMlVXjKSrKo3Puqndb
         oq6BdGQsU5k+QEv5yzZRyHKH4kj3DcGCoYp9n0gDdZSNaw3J6uHQlbhpKd7Gh9ax8JSr
         ROGljQATWR0u7wET4QAojGIfsg9qHx7lC2DNMNc5lns1VgcXGX8KXp0CTLpXRtguD86C
         ZbxLoem0ntDM3EB+v3fMTW5dB2AeYIM5hZxRhxtvP404S7bbpJcaQkkRweOkhzOSNkZX
         TVqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5d3k2BhKlL6+/YB9gf4YGqeKfKsekC84l+sm+iKaCt9HVBDO+KNxPJdGqxkt5uCLF+wp59tED0Axu8Z0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE75VxyQYRZFL+7tOC57sHcx07dMBL+CSA8eFIxyzEtjOHb2u3
	lqOevmHdbAMIgiCp0OYI3MeUy8RtZg+ghnT1yYLoeWli9Ya0KCcbiwJxs5DdJMYMaAgLaQ1Ay/A
	GCpxbr4r6jbm2gpIVl2tJ2lQtRek=
X-Gm-Gg: ASbGncuFM0kCR9YeZj29sJKW8/G2sNMHEwQ/n1Rh4tv01cgKs9jGBi7weZNIOI7tENe
	lWpJJfhC1r4R87ypJXdTT2qs2FkVyeOjGdc7/Th/qbUK4AVEPJ0HjQlSL2W1Aqic0CvLfopUcFa
	9QMERQ/t25sSzYVsTsfb93oeo3
X-Google-Smtp-Source: AGHT+IGOYnEodI+v54u3RasqyHl740kv3Qi26c4ZSH1WOFdI0ZY7fakIuJayT5Adqarq3k8DzU8EnF7o8Tto78b2/FY=
X-Received: by 2002:a0c:fa85:0:b0:6f6:e7ba:83dc with SMTP id
 6a1803df08f44-6f6e7ba8454mr9568596d6.32.1746783826848; Fri, 09 May 2025
 02:43:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507141132.2773275-1-usamaarif642@gmail.com>
 <293530AA-1AB7-4FA0-AF40-3A8464DC0198@nvidia.com> <96eccc48-b632-40b7-9797-1b0780ea59cd@gmail.com>
 <8E3EC5A4-4387-4839-926F-3655188C20F4@nvidia.com> <279d29ad-cbd6-4a0e-b904-0a19326334d1@gmail.com>
 <CALOAHbCxhL=VM=E5UzNvQYZsrF4zdcQ1-49iEJ1UYvLsurtxCw@mail.gmail.com>
 <ebfca8f2-40e5-485a-a060-621aa3a22376@gmail.com> <CALOAHbDesDGyokKFSSr3hA1_WnFciQPXe_nboPq9v8OUPLv47g@mail.gmail.com>
 <20250509051328.GF323143@cmpxchg.org> <CALOAHbA617417UtcwMBJ9Zm_8BbAth57=ngN=tknw8h7nvCwNw@mail.gmail.com>
 <41e60fa0-2943-4b3f-ba92-9f02838c881b@redhat.com>
In-Reply-To: <41e60fa0-2943-4b3f-ba92-9f02838c881b@redhat.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 9 May 2025 17:43:10 +0800
X-Gm-Features: AX0GCFt3U8aR4WC3vUVIRMoJX_yTrJnx4LvtJmPJmxo-vRyVig87H26GZeEDOwI
Message-ID: <CALOAHbAvQDee2=5vsDqj77g5gAGdGpXFBbsC7tpKnCYEDZS3vw@mail.gmail.com>
Subject: Re: [PATCH 0/1] prctl: allow overriding system THP policy to always
To: David Hildenbrand <david@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Usama Arif <usamaarif642@gmail.com>, Zi Yan <ziy@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, shakeel.butt@linux.dev, 
	riel@surriel.com, baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 5:31=E2=80=AFPM David Hildenbrand <david@redhat.com>=
 wrote:
>
> On 09.05.25 11:24, Yafang Shao wrote:
> > On Fri, May 9, 2025 at 1:13=E2=80=AFPM Johannes Weiner <hannes@cmpxchg.=
org> wrote:
> >>
> >> On Fri, May 09, 2025 at 10:15:08AM +0800, Yafang Shao wrote:
> >>> On Fri, May 9, 2025 at 12:04=E2=80=AFAM Usama Arif <usamaarif642@gmai=
l.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 08/05/2025 06:41, Yafang Shao wrote:
> >>>>> On Thu, May 8, 2025 at 12:09=E2=80=AFAM Usama Arif <usamaarif642@gm=
ail.com> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 07/05/2025 16:57, Zi Yan wrote:
> >>>>>>> On 7 May 2025, at 11:12, Usama Arif wrote:
> >>>>>>>
> >>>>>>>> On 07/05/2025 15:57, Zi Yan wrote:
> >>>>>>>>> +Yafang, who is also looking at changing THP config at cgroup/c=
ontainer level.
> >>>>>
> >>>>> Thanks
> >>>>>
> >>>>>>>>>
> >>>>>>>>> On 7 May 2025, at 10:00, Usama Arif wrote:
> >>>>>>>>>
> >>>>>>>>>> Allowing override of global THP policy per process allows work=
loads
> >>>>>>>>>> that have shown to benefit from hugepages to do so, without re=
gressing
> >>>>>>>>>> workloads that wouldn't benefit. This will allow such types of
> >>>>>>>>>> workloads to be run/stacked on the same machine.
> >>>>>>>>>>
> >>>>>>>>>> It also helps in rolling out hugepages in hyperscaler configur=
ations
> >>>>>>>>>> for workloads that benefit from them, where a single THP polic=
y is
> >>>>>>>>>> likely to be used across the entire fleet, and prctl will help=
 override it.
> >>>>>>>>>>
> >>>>>>>>>> An advantage of doing it via prctl vs creating a cgroup specif=
ic
> >>>>>>>>>> option (like /sys/fs/cgroup/test/memory.transparent_hugepage.e=
nabled) is
> >>>>>>>>>> that this will work even when there are no cgroups present, an=
d my
> >>>>>>>>>> understanding is there is a strong preference of cgroups contr=
ols being
> >>>>>>>>>> hierarchical which usually means them having a numerical value=
.
> >>>>>>>>>
> >>>>>>>>> Hi Usama,
> >>>>>>>>>
> >>>>>>>>> Do you mind giving an example on how to change THP policy for a=
 set of
> >>>>>>>>> processes running in a container (under a cgroup)?
> >>>>>>>>
> >>>>>>>> Hi Zi,
> >>>>>>>>
> >>>>>>>> In our case, we create the processes in the cgroup via systemd. =
The way we will enable THP=3Dalways
> >>>>>>>> for processes in a cgroup is in the same way we enable KSM for t=
he cgroup.
> >>>>>>>> The change in systemd would be very similar to the line in [1], =
where we would set prctl PR_SET_THP_ALWAYS
> >>>>>>>> in exec-invoke.
> >>>>>>>> This is at the start of the process, but you would already know =
at the start of the process
> >>>>>>>> whether you want THP=3Dalways for it or not.
> >>>>>>>>
> >>>>>>>> [1] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9=
b28dd4ade7c6ab7be29a/src/core/exec-invoke.c#L5045
> >>>>>>>
> >>>>>>> You also need to add a new systemd.directives, e.g., MemoryTHP, t=
o
> >>>>>>> pass the THP enablement or disablement info from a systemd config=
 file.
> >>>>>>> And if you find those processes do not benefit from using THPs,
> >>>>>>> you can just change the new "MemoryTHP" config and restart the pr=
ocesses.
> >>>>>>>
> >>>>>>> Am I getting it? Thanks.
> >>>>>>>
> >>>>>>
> >>>>>> Yes, thats right. They would exactly the same as what we (Meta) do
> >>>>>> for KSM. So have MemoryTHP similar to MemroryKSM [1] and if Memory=
THP is set,
> >>>>>> the ExecContext->memory_thp would be set similar to memory_ksm [2]=
, and when
> >>>>>> that is set, the prctl will be called at exec_invoke of the proces=
s [3].
> >>>>>>
> >>>>>> The systemd changes should be quite simple to do.
> >>>>>>
> >>>>>> [1] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b2=
8dd4ade7c6ab7be29a/man/systemd.exec.xml#L1978
> >>>>>> [2] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b2=
8dd4ade7c6ab7be29a/src/core/dbus-execute.c#L2151
> >>>>>> [3] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b2=
8dd4ade7c6ab7be29a/src/core/exec-invoke.c#L5045
> >>>>>
> >>>>> This solution carries a risk: since prctl() does not require any
> >>>>> capabilities, the task itself could call it and override your memor=
y
> >>>>> policy. While we could enforce CAP_SYS_RESOURCE to restrict this, t=
hat
> >>>>> capability is typically enabled by default in containers, leaving t=
hem
> >>>>> still vulnerable.
> >>>>>
> >>>>> This approach might work for Kubernetes/container environments, but=
 it
> >>>>> would require substantial code changes to implement securely.
> >>>>>
> >>>>
> >>>> You can already change the memory policy with prctl, for e.g. PR_SET=
_THP_DISABLE
> >>>> already exists and the someone could use this to slow the process do=
wn. So the
> >>>> approach this patch takes shouldn't be anymore of a security fix the=
n what is already
> >>>> exposed by the kernel. I think as you mentioned, if prctl is an issu=
e CAP_SYS_RESOURCE
> >>>> should be used to restrict this.
> >>>
> >>> I believe we should at least require CAP_SYS_RESOURCE to enable THP,
> >>> since it overrides global system settings. Alternatively,
> >>> CAP_SYS_ADMIN might be even more appropriate, though I'm not entirely
> >>> certain.
> >>
> >> Hm, could you verbalize a concrete security concern?
> >>
> >> I've never really looked at the global settings as a hard policy, more
> >> as picking a default for the workloads in the system. It's usually
> >> `madvise' or `always', and MADV_HUGEPAGE and MADV_NOHUGEPAGE have long
> >> existed to give applications the ability to refine the global choice.
> >>
> >> The prctl should probably respect `never' for consistency, but beyond
> >> that I don't really see the concern, or how this would allow something
> >> that isn't already possible.
> >
> > I would interpret the always, madvise, and never options as follows:
> > - always
> >    The sysadmin strongly recommends using THP. If a user does not
> > want to use it, they must explicitly disable it.
> > - madvise
> >   The sysadmin gently encourages the use of THP, but it is only
> > enabled when explicitly requested by the application.
> > - never
> >    The sysadmin discourages the use of THP, and "its use is only permit=
ted
> > with explicit approval" .
>
> "never" so far means "no thps, no exceptions". We've had serious THP
> issues in the past, where our workaround until we sorted out the issue
> for affected customers was to force-disable THPs on that system during bo=
ot.

Right, that reflects the current behavior. What we aim to enhance is
by adding the requirement that "its use is only permitted with
explicit approval."

This would be a small but meaningful step toward making THP truly
usable in a transparent way in production environments.

--=20
Regards
Yafang
