Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50B521CA16
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746782683; cv=none; b=q86K/p9MMNp+l2fYNuAkPU/eI5LdFYIlbmpcCjYkgSbbCUaIbYvebLPWON8iBAp1XkJE+UoynwyN98tJKpZE58VnfvP9c4p2X9P8pJurBf9F0KAJTZZh5gQ4BIiz5M8g9g0615fUn2Nt8gPQx/SnSiy21TOBvugumrO6Ej9W3Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746782683; c=relaxed/simple;
	bh=f88Ni1YWCE1Kwf0Y9X7NYnpe6pOseQudSV1WP6SYJ90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=assY0OguiZDhHw6JpnE1vet0/oP9EaWGF6d7Y62CtVHuP++YGtSazIPso7gEieuE0B1wVwQQqRio/m26aDRXDrsRWHhISVRm186Gb5J++MMphsqzc+wY1ZfoHxV+89OTbsQUblOlfcdXj4hacT+/tTIeD7+odV9dq2aFDdW4/C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMR7ENYf; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMR7ENYf"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f6e398767eso11871256d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 02:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746782680; x=1747387480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1JN9kv3Dr6G523hbCTrv5AkRnjP42S/5WAMWU2Wf+k=;
        b=YMR7ENYfAyzENBtbnH3rF3xkyzucw0BoBPcHvriFzbZm4tHah8UO7iWEQg5k1muLx0
         ipWOKuHiwEbYyxsq2vkvNPVJqTvwTHnGMNdr7AkbykKmtNSKgqKlXpLtmawKeQLm1FeQ
         y6k9oTzXVUHfvECUhRGiJarbEd5tsy6BCYIeN036MAcJyWThkVliMaGp1QgcbdqLPNxv
         3/x8W3EVrHzLALKD44p327K1Q+eLvCY/zUirK3HO4Z5R8lD+/SHHXD8tDP+VUqTNwNvX
         +TcNFdyo+4G8G++iL+fYoGHhxO7f1x4oXdPr/x7pjmSQ+XdN4OSnhy2nZV1AisXffaw9
         KakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746782680; x=1747387480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1JN9kv3Dr6G523hbCTrv5AkRnjP42S/5WAMWU2Wf+k=;
        b=CjVaRrbI7q68RuNPzyaNd/7LnC17gwnJvGSjfUJcOgAFokbMDI3V+0FpAvOalSrQZ5
         avGIXggjH8iCng2nzFrZZLvPxaXjDo/V7vtJ79NYmUNs+o6GX3XxLkyk+QVl868djJ4P
         batKacS+BkQhXvzRjapuF8r3TuION/AgT6ynU6ZVlcQqwV45kJ4v4GC6rFng2EoMuDIu
         Rx42l1e10ZfkqKI7o+D5soo2pW8jS9X3Dqsx5AH9uBhBzFDo6ogdV3poz4a41V7Btc4X
         OI2Tp4hn1WJh5xwsrhDlsNSDGTkxTo9IL0GvejKCzeIRJr5f9V+Uot091VNsqfdEKNvA
         SiOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj1DKcJ0CIN49r8Bn7NFr4XGMp+aoL/AHZjah0PkbZTz2s/alTCvfQuUelRqnL00X14DbHOHy90P5ZK3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuxsRFY9OgP1fJC7lXxBEfPiNUzEtuXYXwaTCW9J8m7LsetauO
	OkhJ9XVUEpe0+t/TwbhiW6JFd4zebtvuLyPuno5Wirtlz+9Pn5wmwS4nLn3qhjpugJAwG1Yzc5L
	Bx2u68yGYmStIlzbfCKH+Cm4wep4=
X-Gm-Gg: ASbGnctylITqK+LkE4+v/2zXzWv0kIoBJLH0rnwd2IluMBk7LiaLGBtqyoPDevnrIBA
	yiWwxoIwJZBLi7BChUKhpNrNQbvBHuB8+4NDoaS59sEAr1/AtORdYPABR9aXAx4ZwmB4vTM49UA
	TNdLBg+dEsrJ2TfQTHiHXRijz9
X-Google-Smtp-Source: AGHT+IFDdxNRRNQ78luKEuhDny38a5Lke0QoSXyn95d0Mme4CoIAq6vkYA+GqyNNasTLe8Nv/c2dEdZr3iMihy/Iqz0=
X-Received: by 2002:ad4:4687:0:b0:6f6:e6d4:e319 with SMTP id
 6a1803df08f44-6f6e6d4e4aamr13171206d6.8.1746782680438; Fri, 09 May 2025
 02:24:40 -0700 (PDT)
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
 <20250509051328.GF323143@cmpxchg.org>
In-Reply-To: <20250509051328.GF323143@cmpxchg.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 9 May 2025 17:24:04 +0800
X-Gm-Features: AX0GCFvleWYevErqVNftdx90LiLJTg72XKMiSE8RHnj0wZmz1N6lqozx5vLtg80
Message-ID: <CALOAHbA617417UtcwMBJ9Zm_8BbAth57=ngN=tknw8h7nvCwNw@mail.gmail.com>
Subject: Re: [PATCH 0/1] prctl: allow overriding system THP policy to always
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Usama Arif <usamaarif642@gmail.com>, Zi Yan <ziy@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, david@redhat.com, linux-mm@kvack.org, 
	shakeel.butt@linux.dev, riel@surriel.com, baolin.wang@linux.alibaba.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com, 
	ryan.roberts@arm.com, linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 1:13=E2=80=AFPM Johannes Weiner <hannes@cmpxchg.org>=
 wrote:
>
> On Fri, May 09, 2025 at 10:15:08AM +0800, Yafang Shao wrote:
> > On Fri, May 9, 2025 at 12:04=E2=80=AFAM Usama Arif <usamaarif642@gmail.=
com> wrote:
> > >
> > >
> > >
> > > On 08/05/2025 06:41, Yafang Shao wrote:
> > > > On Thu, May 8, 2025 at 12:09=E2=80=AFAM Usama Arif <usamaarif642@gm=
ail.com> wrote:
> > > >>
> > > >>
> > > >>
> > > >> On 07/05/2025 16:57, Zi Yan wrote:
> > > >>> On 7 May 2025, at 11:12, Usama Arif wrote:
> > > >>>
> > > >>>> On 07/05/2025 15:57, Zi Yan wrote:
> > > >>>>> +Yafang, who is also looking at changing THP config at cgroup/c=
ontainer level.
> > > >
> > > > Thanks
> > > >
> > > >>>>>
> > > >>>>> On 7 May 2025, at 10:00, Usama Arif wrote:
> > > >>>>>
> > > >>>>>> Allowing override of global THP policy per process allows work=
loads
> > > >>>>>> that have shown to benefit from hugepages to do so, without re=
gressing
> > > >>>>>> workloads that wouldn't benefit. This will allow such types of
> > > >>>>>> workloads to be run/stacked on the same machine.
> > > >>>>>>
> > > >>>>>> It also helps in rolling out hugepages in hyperscaler configur=
ations
> > > >>>>>> for workloads that benefit from them, where a single THP polic=
y is
> > > >>>>>> likely to be used across the entire fleet, and prctl will help=
 override it.
> > > >>>>>>
> > > >>>>>> An advantage of doing it via prctl vs creating a cgroup specif=
ic
> > > >>>>>> option (like /sys/fs/cgroup/test/memory.transparent_hugepage.e=
nabled) is
> > > >>>>>> that this will work even when there are no cgroups present, an=
d my
> > > >>>>>> understanding is there is a strong preference of cgroups contr=
ols being
> > > >>>>>> hierarchical which usually means them having a numerical value=
.
> > > >>>>>
> > > >>>>> Hi Usama,
> > > >>>>>
> > > >>>>> Do you mind giving an example on how to change THP policy for a=
 set of
> > > >>>>> processes running in a container (under a cgroup)?
> > > >>>>
> > > >>>> Hi Zi,
> > > >>>>
> > > >>>> In our case, we create the processes in the cgroup via systemd. =
The way we will enable THP=3Dalways
> > > >>>> for processes in a cgroup is in the same way we enable KSM for t=
he cgroup.
> > > >>>> The change in systemd would be very similar to the line in [1], =
where we would set prctl PR_SET_THP_ALWAYS
> > > >>>> in exec-invoke.
> > > >>>> This is at the start of the process, but you would already know =
at the start of the process
> > > >>>> whether you want THP=3Dalways for it or not.
> > > >>>>
> > > >>>> [1] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9=
b28dd4ade7c6ab7be29a/src/core/exec-invoke.c#L5045
> > > >>>
> > > >>> You also need to add a new systemd.directives, e.g., MemoryTHP, t=
o
> > > >>> pass the THP enablement or disablement info from a systemd config=
 file.
> > > >>> And if you find those processes do not benefit from using THPs,
> > > >>> you can just change the new "MemoryTHP" config and restart the pr=
ocesses.
> > > >>>
> > > >>> Am I getting it? Thanks.
> > > >>>
> > > >>
> > > >> Yes, thats right. They would exactly the same as what we (Meta) do
> > > >> for KSM. So have MemoryTHP similar to MemroryKSM [1] and if Memory=
THP is set,
> > > >> the ExecContext->memory_thp would be set similar to memory_ksm [2]=
, and when
> > > >> that is set, the prctl will be called at exec_invoke of the proces=
s [3].
> > > >>
> > > >> The systemd changes should be quite simple to do.
> > > >>
> > > >> [1] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b2=
8dd4ade7c6ab7be29a/man/systemd.exec.xml#L1978
> > > >> [2] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b2=
8dd4ade7c6ab7be29a/src/core/dbus-execute.c#L2151
> > > >> [3] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b2=
8dd4ade7c6ab7be29a/src/core/exec-invoke.c#L5045
> > > >
> > > > This solution carries a risk: since prctl() does not require any
> > > > capabilities, the task itself could call it and override your memor=
y
> > > > policy. While we could enforce CAP_SYS_RESOURCE to restrict this, t=
hat
> > > > capability is typically enabled by default in containers, leaving t=
hem
> > > > still vulnerable.
> > > >
> > > > This approach might work for Kubernetes/container environments, but=
 it
> > > > would require substantial code changes to implement securely.
> > > >
> > >
> > > You can already change the memory policy with prctl, for e.g. PR_SET_=
THP_DISABLE
> > > already exists and the someone could use this to slow the process dow=
n. So the
> > > approach this patch takes shouldn't be anymore of a security fix then=
 what is already
> > > exposed by the kernel. I think as you mentioned, if prctl is an issue=
 CAP_SYS_RESOURCE
> > > should be used to restrict this.
> >
> > I believe we should at least require CAP_SYS_RESOURCE to enable THP,
> > since it overrides global system settings. Alternatively,
> > CAP_SYS_ADMIN might be even more appropriate, though I'm not entirely
> > certain.
>
> Hm, could you verbalize a concrete security concern?
>
> I've never really looked at the global settings as a hard policy, more
> as picking a default for the workloads in the system. It's usually
> `madvise' or `always', and MADV_HUGEPAGE and MADV_NOHUGEPAGE have long
> existed to give applications the ability to refine the global choice.
>
> The prctl should probably respect `never' for consistency, but beyond
> that I don't really see the concern, or how this would allow something
> that isn't already possible.

I would interpret the always, madvise, and never options as follows:
- always
  The sysadmin strongly recommends using THP. If a user does not
want to use it, they must explicitly disable it.
- madvise
 The sysadmin gently encourages the use of THP, but it is only
enabled when explicitly requested by the application.
- never
  The sysadmin discourages the use of THP, and "its use is only permitted
with explicit approval" .

>
> > > In terms of security vulnerability of prctl, I feel like there are a =
lot of others
> > > that can be a much much bigger issue? I just had a look and you can c=
hange the
> > > seccomp, reset PAC keys(!) even speculation control(!!), so I dont th=
ink the security
> > > argument would be valid.
> >
> > I was surprised to discover that none of these operations require any
> > capabilities to execute.
>
> seccomp enabling is a one-way street, PR_SPEC_FORCE_DISABLE is as
> well. You can reset PAC keys, but presumably, unless you also switch
> to a new execution context with entirely new PAC/AUT pairs, this would
> just crash the application on the next AUT?

It appears so=E2=80=94thank you for the clarification.


--
Regards

Yafang
