Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74E68472
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 05:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746682933; cv=none; b=Rh1xZYgsaTq5C3NroubMVHvR4y7KxxEsN9qVjEeanmqGxFDa7aYUXFrjl1+Ax+KhuUxSJz+sP7zX27RyokBB4JJHpRXoG9xmH3JcMqwxD7eHUxn7cknnAjkojbuedzYoP96MHXNmdcgCgzTUsi4sPukIZMNQGXUoxaeAfgdWELk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746682933; c=relaxed/simple;
	bh=TM/MufJVEDLNCEGKM1aXEkuuApBQkMfumkSR0YPR0qo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fCUwrHY/SkRB036u8vAArwrtNu7wmjpgT0Ootde63PJDKh8527k1B/9ml9V5R7rpcLLM7FTKCXQqUvWiH+ZNLJHc6qYU6/ajjwjK+i8Eikdz/Bv4X1hzeHryiYEJ98Lm5XQCaAiF7vw93nFhPghMA5bmnxOCWNVo3kXlHgZa3kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMWhrzeQ; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMWhrzeQ"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6ecf0e07947so7036746d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 22:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746682930; x=1747287730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TM/MufJVEDLNCEGKM1aXEkuuApBQkMfumkSR0YPR0qo=;
        b=LMWhrzeQI65Pp0dChU2KMZQUXnLk+JP5bAclbUBFE6mPlKDkPTKMbIshoRFDj9rNw6
         81xnWSx6DG3nPutbg6iARM8Dd7fLHxuOqboSh8qC0iyvckG3obBbsRwxZwdflO4btDBj
         2DAY3zynD6UhFMarcwdMTLmuhBmeY1wOzwhZVDPssIIhI6MMWuIj/I1H8fiD3Sb1aOR3
         QQCIg/QLVhdAQmPuTzdkG2LgU+e/obBWmZjwIRlnXjq+i+muSwlQNWCD9fvp7GT66K9l
         i1lEQ/uEkutVaXEbiKb+C/WIhZMGZvKlBE+5C8PkCFAnSfqHssaK0eTxgqDFFNNOKmuT
         VG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746682930; x=1747287730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TM/MufJVEDLNCEGKM1aXEkuuApBQkMfumkSR0YPR0qo=;
        b=ZANJMzNam4IJRex9jw/yS1JkZEp0lheD08xqFpviQLDHaF47X+ZLmlDLjbyhLircog
         Td+Rg7+atvVSBDVjJ6RitjcCrfANlYTRWdvQQUlVc5LgD2ak8p/b5G0HpcOs3v59pe7E
         YUoYGm1zfY2YpLCvKu9/cDG/fUWEBDsO9Sqxd3eIpvzg/4m8I3L+lNRZ2EyGhABpZuCK
         K7I0+LTlbvtoBZ+KIF2WSMcDy+bQDu/Zo6DDKO8JN0TTnVbt6QA7lCyE9NVS8ivgx/+9
         sIrEAVlBMBbizqSAxDScaZ1oUFtbfpFH5GSf3aUyMHmhOm391DaDdck7pS+5SNCLBMti
         cfkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM3JxAagviow3akOO/z68/T8BMIvuc0ZdnpkWpirM/kcw01M1Wxlq81Spea78J42q5cie4OUHw1CxJLz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrCwszzbK1JvW3ViPCEbtpnU6fy/G5Ptbv+92k1QN37lA3XnXY
	wY/zu1xGLQZQXwFaTqsavP2X9oPZpjpBLKOtOOrqBp3u86uKUWV9obLOD6Ssg9RU2+lzCVLXlDN
	yOQvZ1QXEWr2FVP3+uZhqCXiMhQJGRPHFN/Y=
X-Gm-Gg: ASbGncsQ/cL7WkR1vKdr2ih6nWH7YGCWWqfty5NYFhlyBklYpeqrdf9hdvmfxwG91hV
	ttJ9zfKhkuWuNV8Uwxg8iiGaghLFckqTfofgrSFDfew/q0yUdLxyUgf1MSNoGvunudbTiYMNE5d
	wEPe9V4jgK2G1cFo4CheDUGxg=
X-Google-Smtp-Source: AGHT+IH+efhkGKF4AOL+BWpKPJLYuo9dGR16L2HYtzc3mMEwDIKEp9KRP7Kb8YXX6rNvlhFJq3a+0HkejR16Q/nU5as=
X-Received: by 2002:a05:6214:acf:b0:6e2:3761:71b0 with SMTP id
 6a1803df08f44-6f54badec91mr37830986d6.5.1746682930599; Wed, 07 May 2025
 22:42:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507141132.2773275-1-usamaarif642@gmail.com>
 <293530AA-1AB7-4FA0-AF40-3A8464DC0198@nvidia.com> <96eccc48-b632-40b7-9797-1b0780ea59cd@gmail.com>
 <8E3EC5A4-4387-4839-926F-3655188C20F4@nvidia.com> <279d29ad-cbd6-4a0e-b904-0a19326334d1@gmail.com>
In-Reply-To: <279d29ad-cbd6-4a0e-b904-0a19326334d1@gmail.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Thu, 8 May 2025 13:41:34 +0800
X-Gm-Features: ATxdqUHQQfnKfoBp5RkCnMABraZFQ6P20s3QRkwHLezvrdNG_i4a26Ar-vd6Kqs
Message-ID: <CALOAHbCxhL=VM=E5UzNvQYZsrF4zdcQ1-49iEJ1UYvLsurtxCw@mail.gmail.com>
Subject: Re: [PATCH 0/1] prctl: allow overriding system THP policy to always
To: Usama Arif <usamaarif642@gmail.com>
Cc: Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, david@redhat.com, 
	linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev, 
	riel@surriel.com, baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 12:09=E2=80=AFAM Usama Arif <usamaarif642@gmail.com>=
 wrote:
>
>
>
> On 07/05/2025 16:57, Zi Yan wrote:
> > On 7 May 2025, at 11:12, Usama Arif wrote:
> >
> >> On 07/05/2025 15:57, Zi Yan wrote:
> >>> +Yafang, who is also looking at changing THP config at cgroup/contain=
er level.

Thanks

> >>>
> >>> On 7 May 2025, at 10:00, Usama Arif wrote:
> >>>
> >>>> Allowing override of global THP policy per process allows workloads
> >>>> that have shown to benefit from hugepages to do so, without regressi=
ng
> >>>> workloads that wouldn't benefit. This will allow such types of
> >>>> workloads to be run/stacked on the same machine.
> >>>>
> >>>> It also helps in rolling out hugepages in hyperscaler configurations
> >>>> for workloads that benefit from them, where a single THP policy is
> >>>> likely to be used across the entire fleet, and prctl will help overr=
ide it.
> >>>>
> >>>> An advantage of doing it via prctl vs creating a cgroup specific
> >>>> option (like /sys/fs/cgroup/test/memory.transparent_hugepage.enabled=
) is
> >>>> that this will work even when there are no cgroups present, and my
> >>>> understanding is there is a strong preference of cgroups controls be=
ing
> >>>> hierarchical which usually means them having a numerical value.
> >>>
> >>> Hi Usama,
> >>>
> >>> Do you mind giving an example on how to change THP policy for a set o=
f
> >>> processes running in a container (under a cgroup)?
> >>
> >> Hi Zi,
> >>
> >> In our case, we create the processes in the cgroup via systemd. The wa=
y we will enable THP=3Dalways
> >> for processes in a cgroup is in the same way we enable KSM for the cgr=
oup.
> >> The change in systemd would be very similar to the line in [1], where =
we would set prctl PR_SET_THP_ALWAYS
> >> in exec-invoke.
> >> This is at the start of the process, but you would already know at the=
 start of the process
> >> whether you want THP=3Dalways for it or not.
> >>
> >> [1] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4=
ade7c6ab7be29a/src/core/exec-invoke.c#L5045
> >
> > You also need to add a new systemd.directives, e.g., MemoryTHP, to
> > pass the THP enablement or disablement info from a systemd config file.
> > And if you find those processes do not benefit from using THPs,
> > you can just change the new "MemoryTHP" config and restart the processe=
s.
> >
> > Am I getting it? Thanks.
> >
>
> Yes, thats right. They would exactly the same as what we (Meta) do
> for KSM. So have MemoryTHP similar to MemroryKSM [1] and if MemoryTHP is =
set,
> the ExecContext->memory_thp would be set similar to memory_ksm [2], and w=
hen
> that is set, the prctl will be called at exec_invoke of the process [3].
>
> The systemd changes should be quite simple to do.
>
> [1] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4ade=
7c6ab7be29a/man/systemd.exec.xml#L1978
> [2] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4ade=
7c6ab7be29a/src/core/dbus-execute.c#L2151
> [3] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4ade=
7c6ab7be29a/src/core/exec-invoke.c#L5045

This solution carries a risk: since prctl() does not require any
capabilities, the task itself could call it and override your memory
policy. While we could enforce CAP_SYS_RESOURCE to restrict this, that
capability is typically enabled by default in containers, leaving them
still vulnerable.

This approach might work for Kubernetes/container environments, but it
would require substantial code changes to implement securely.

--=20
Regards
Yafang
