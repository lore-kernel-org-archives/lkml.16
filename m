Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86483C30
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 02:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746756957; cv=none; b=QlWtjr55FRIwN7dX1+ZmnCP0/cIYlwtfu9aJI/QDXr/Ol3retH8cQHlwM/zs0liewDIrO3Zfd/+Sp41GOQkEdZzh/li8I0uUXReyBEOWqgsFZMoYaO1byGT0/UfwBYDPPHQ2At3D8YrNjA3gxuv0SaOoRXisl6vp0lZu1nO3Flk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746756957; c=relaxed/simple;
	bh=OUZzF1GMc7pPrd91LkBIIsb0Tc+00pKXpIBgeZ8sEe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X8WCvYRnPRxRMtybxfHn5COqltvPHA3qBZO9WSloUV9Njf8Y41rUXvTJEQXOIVIIJO/ks8myPE93v5KMHKztqkJuC97oKcyi6Nf38nVlv4fMm3qLcTm37TjS7zLRbKlDRKEFoIBbRD6oa8YssVXY4zTnX/495l9GK9DmBdtAdyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9L4kgY7; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9L4kgY7"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6f0c30a1cf8so31487566d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 19:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746756955; x=1747361755; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUZzF1GMc7pPrd91LkBIIsb0Tc+00pKXpIBgeZ8sEe0=;
        b=T9L4kgY7ebU/RHW1lF2ef3wint9VZIhQx/qpoayZEWqoXE2UB284POjFrsXZu1em8I
         8wiN8VylBxEwsdtfceSrAqjWBuDH2MKbz8+vCcOLfQTL1nOQEeKZ0+PEVq6FTOcM57rI
         nGZUrzVUyNddGlvib+XkloXr2hgluJyRWDhTQX/ATLEFk0IerGlHlfv4dtIaO8F1IdCs
         2cRCEAiLJtiu6fyuOvxeF0S+TRSEKPWBVIRV+j8R/KiO8/BF1KZbVVicZcjTP3n2u+9s
         5HrykykSHZry81D37L7eGrxc9cqRpty57tm4hcbwPPMp4igFh3LK5TkQmEHoAzQWEe+m
         QxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746756955; x=1747361755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OUZzF1GMc7pPrd91LkBIIsb0Tc+00pKXpIBgeZ8sEe0=;
        b=ZaaYF2rTiOpsz2DtZy0X3nwI80QwPdXAM/M4SYyF0+xlX9JnKcnmJ1vzwUtSJgGv3s
         E8cg20xThXWbrk7ue2vNWiUi6Xtw9TxYxgUagig+ouq2T0mv+uEmMytU2cF+uBZn8Uf0
         vJ7Y3P0uXAO8iUmxg1gxUK4rIHSn3bZ85uSxk7RnFf4tEAdgJJ6iUXgyRvX5Ncw8BYHJ
         QBc+4+D6RFNsbksitEPkkpcZyBCsQwNEC71BbEDB1ZWt3zumlBDWRD/NtZf/U1Fcb29E
         bfswa9ddN/L0UIrwnAp0G9vzYqHNDSRUWWWdTUh6g0dUHt7GfASlppJgcvu9SIEc4+Bf
         b63Q==
X-Forwarded-Encrypted: i=1; AJvYcCWaa6W+6kv3yTbtJ3B68zucEWRtin4SkzVSx1bylNAVB1ENqGOiX4gCk5JUfOAa2g/KnPznAbK4Y1zbiNg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkRF7fL5h2S7hfmTwCQX/knAu7sHRHX2KrAdioHa4720wBk9zS
	e4sxR1XfvC4VcLCAGEACkvrdqnpUWHUz55301PBtAY5/3TFoY4Kjp+kY3A2FOB6yyikI2NjTg+3
	C+9PIuLZTMo5W3mnOGXKw7KColWt4KRpLGrA=
X-Gm-Gg: ASbGncu3CQefecWJSrAQgP/J82vsN8lOpkwyYa1WbiiMI6tgCA3JfEIyC0Ns6Vu+1lr
	DI6fwTjhtIbj7Sb/mOZQRvp9jjzOjRIgduW8qI1CgKS/G+4FiF3rgZ+xTMy8mLXJgRcFmdmiJA7
	MSIhfJrgjwAZHTh+Gax5ijhLk=
X-Google-Smtp-Source: AGHT+IGVTRp4pCU6b4pOnJGKOvcrK5tsM/hmu5yadLe4Xoc6rkOBSiYHgUq51P6Nj4Te4xvaRZFDJla5klVmaEyKrxE=
X-Received: by 2002:a05:6214:300e:b0:6cb:ee08:c1e8 with SMTP id
 6a1803df08f44-6f6e47fa918mr27085726d6.23.1746756944581; Thu, 08 May 2025
 19:15:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507141132.2773275-1-usamaarif642@gmail.com>
 <293530AA-1AB7-4FA0-AF40-3A8464DC0198@nvidia.com> <96eccc48-b632-40b7-9797-1b0780ea59cd@gmail.com>
 <8E3EC5A4-4387-4839-926F-3655188C20F4@nvidia.com> <279d29ad-cbd6-4a0e-b904-0a19326334d1@gmail.com>
 <CALOAHbCxhL=VM=E5UzNvQYZsrF4zdcQ1-49iEJ1UYvLsurtxCw@mail.gmail.com> <ebfca8f2-40e5-485a-a060-621aa3a22376@gmail.com>
In-Reply-To: <ebfca8f2-40e5-485a-a060-621aa3a22376@gmail.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 9 May 2025 10:15:08 +0800
X-Gm-Features: AX0GCFtM1_z184WFg9l7GMhprKo3jxyNYmE2HFC1s-2rlbQQJ4PB6bv2Ytrs_Rw
Message-ID: <CALOAHbDesDGyokKFSSr3hA1_WnFciQPXe_nboPq9v8OUPLv47g@mail.gmail.com>
Subject: Re: [PATCH 0/1] prctl: allow overriding system THP policy to always
To: Usama Arif <usamaarif642@gmail.com>
Cc: Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, david@redhat.com, 
	linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev, 
	riel@surriel.com, baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 12:04=E2=80=AFAM Usama Arif <usamaarif642@gmail.com>=
 wrote:
>
>
>
> On 08/05/2025 06:41, Yafang Shao wrote:
> > On Thu, May 8, 2025 at 12:09=E2=80=AFAM Usama Arif <usamaarif642@gmail.=
com> wrote:
> >>
> >>
> >>
> >> On 07/05/2025 16:57, Zi Yan wrote:
> >>> On 7 May 2025, at 11:12, Usama Arif wrote:
> >>>
> >>>> On 07/05/2025 15:57, Zi Yan wrote:
> >>>>> +Yafang, who is also looking at changing THP config at cgroup/conta=
iner level.
> >
> > Thanks
> >
> >>>>>
> >>>>> On 7 May 2025, at 10:00, Usama Arif wrote:
> >>>>>
> >>>>>> Allowing override of global THP policy per process allows workload=
s
> >>>>>> that have shown to benefit from hugepages to do so, without regres=
sing
> >>>>>> workloads that wouldn't benefit. This will allow such types of
> >>>>>> workloads to be run/stacked on the same machine.
> >>>>>>
> >>>>>> It also helps in rolling out hugepages in hyperscaler configuratio=
ns
> >>>>>> for workloads that benefit from them, where a single THP policy is
> >>>>>> likely to be used across the entire fleet, and prctl will help ove=
rride it.
> >>>>>>
> >>>>>> An advantage of doing it via prctl vs creating a cgroup specific
> >>>>>> option (like /sys/fs/cgroup/test/memory.transparent_hugepage.enabl=
ed) is
> >>>>>> that this will work even when there are no cgroups present, and my
> >>>>>> understanding is there is a strong preference of cgroups controls =
being
> >>>>>> hierarchical which usually means them having a numerical value.
> >>>>>
> >>>>> Hi Usama,
> >>>>>
> >>>>> Do you mind giving an example on how to change THP policy for a set=
 of
> >>>>> processes running in a container (under a cgroup)?
> >>>>
> >>>> Hi Zi,
> >>>>
> >>>> In our case, we create the processes in the cgroup via systemd. The =
way we will enable THP=3Dalways
> >>>> for processes in a cgroup is in the same way we enable KSM for the c=
group.
> >>>> The change in systemd would be very similar to the line in [1], wher=
e we would set prctl PR_SET_THP_ALWAYS
> >>>> in exec-invoke.
> >>>> This is at the start of the process, but you would already know at t=
he start of the process
> >>>> whether you want THP=3Dalways for it or not.
> >>>>
> >>>> [1] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28d=
d4ade7c6ab7be29a/src/core/exec-invoke.c#L5045
> >>>
> >>> You also need to add a new systemd.directives, e.g., MemoryTHP, to
> >>> pass the THP enablement or disablement info from a systemd config fil=
e.
> >>> And if you find those processes do not benefit from using THPs,
> >>> you can just change the new "MemoryTHP" config and restart the proces=
ses.
> >>>
> >>> Am I getting it? Thanks.
> >>>
> >>
> >> Yes, thats right. They would exactly the same as what we (Meta) do
> >> for KSM. So have MemoryTHP similar to MemroryKSM [1] and if MemoryTHP =
is set,
> >> the ExecContext->memory_thp would be set similar to memory_ksm [2], an=
d when
> >> that is set, the prctl will be called at exec_invoke of the process [3=
].
> >>
> >> The systemd changes should be quite simple to do.
> >>
> >> [1] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4=
ade7c6ab7be29a/man/systemd.exec.xml#L1978
> >> [2] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4=
ade7c6ab7be29a/src/core/dbus-execute.c#L2151
> >> [3] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4=
ade7c6ab7be29a/src/core/exec-invoke.c#L5045
> >
> > This solution carries a risk: since prctl() does not require any
> > capabilities, the task itself could call it and override your memory
> > policy. While we could enforce CAP_SYS_RESOURCE to restrict this, that
> > capability is typically enabled by default in containers, leaving them
> > still vulnerable.
> >
> > This approach might work for Kubernetes/container environments, but it
> > would require substantial code changes to implement securely.
> >
>
> You can already change the memory policy with prctl, for e.g. PR_SET_THP_=
DISABLE
> already exists and the someone could use this to slow the process down. S=
o the
> approach this patch takes shouldn't be anymore of a security fix then wha=
t is already
> exposed by the kernel. I think as you mentioned, if prctl is an issue CAP=
_SYS_RESOURCE
> should be used to restrict this.

I believe we should at least require CAP_SYS_RESOURCE to enable THP,
since it overrides global system settings. Alternatively,
CAP_SYS_ADMIN might be even more appropriate, though I'm not entirely
certain.

>
> In terms of security vulnerability of prctl, I feel like there are a lot =
of others
> that can be a much much bigger issue? I just had a look and you can chang=
e the
> seccomp, reset PAC keys(!) even speculation control(!!), so I dont think =
the security
> argument would be valid.

I was surprised to discover that none of these operations require any
capabilities to execute.

--=20
Regards
Yafang
