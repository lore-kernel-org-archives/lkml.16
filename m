Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFBD215175
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746809224; cv=none; b=PDIT/detH+BFsLZSpMj8Zu3mFMOfKPF15AayDKsxyYEAqa++mjPY88xxN3OnMH46zyL6uj1g5dvPvaOB4LN2mRM3dmioLXeW5bl/D3Xnsf1XVJYQz/gbCHdkwHKXqZlM8uuh2vOMzo0+2m039flc4ahjFQahEBTJ3G542cw1qAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746809224; c=relaxed/simple;
	bh=giiZN+mVKetIh5SKr9dtrrxfK7dP3p10Ge0rsM86OUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XMgvgNlUihacmzhCXBeckzBnEG6VqFphtqGGSHZA192WamNZ6l0EMJwjMjzxFZFOY7JQZ6HynRibzHc15XqoJR4rqnYadO0pGNVzxME/aAAIE9EYGJ6/B01jT+AB/iIxNvYhr64KdfzT7yYLyITQrBfdKoFidzctZThqmi1NoRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=n9Xbbpie; arc=none smtp.client-ip=209.85.160.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="n9Xbbpie"
Received: by mail-qt1-f194.google.com with SMTP id d75a77b69052e-4774d68c670so38671121cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 09:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1746809220; x=1747414020; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8o3V3hA+0uC3cTtT6cKiLx8lEd07VbDkB9KnvndMZ7A=;
        b=n9Xbbpien/NXzxd6PjSVRTlGzoWe9xOIkwwYoBP+0kTTUMoNyxFsdIjJMHxBiP/3ip
         0Snzt+x3trs8oZdkXHnxzT5ZqAr0EY7evolxS1/UeYi6PDy+NqxYChChSSStbxN+U+5Y
         H4/R97aieIfUdi1Y4YZU1cN41pRkcgCRNFy4mFw5IgMiTK4dghqrTYTMxtxPtAiaBvAN
         5wvVMgmGrbSQTDwmsM4q5aYimNYdguK+RopubUdY4+uBS7v1U+afBANGeTTW4Db8k9Ye
         Fpon/fx0MRT2l7McJ5Xi4GFSuxge7INznzpM36V/U8iF3+WdEN8GVE4Vq7u2TteMW79j
         dP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746809220; x=1747414020;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8o3V3hA+0uC3cTtT6cKiLx8lEd07VbDkB9KnvndMZ7A=;
        b=gPazQ/rgVhQmVbQ3hoJ1D3S4oFTpgEfZ4l6Y90tJhmqsUBV54kjjr5fgQmDCTrS8Df
         bE+CoNHWMQJvj51B31qLqMZ24sOKIj2t09f99ADnHgqzfvH3Y6HZ4tOIXSHZ+gXDnmiX
         FGfDiKQSZqUvolgFTlE0JhLSiIHkImfMcOFgOj/oTlehF3j6uKtnWnNnTL5UpWEDpUOo
         jKTTxzvUdZgeNfe/oD9iwzh4U8+hR1kqkmgaSHeLHXCVl6xYgBVUXwKiC4QYYh6e0ApI
         r9CYFeZuGYZ+YwjsMIXurAYL6Vqt40YPWhl00H7Ra8Evv6GdUCCKz8JzAdwtV7x1qq4c
         BA5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVR3GqdNFEpBpeaAnTO1DP9Xm4kxYg+a7KOsbTVf7wNN+KbkO06SFmIak9Z6dHnW7CEXgtG+M/s18vG2M8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+yPYbJI8DSCrPCcQATGcypuYq6I6VXmcXaOn8ko3UTWMCIy6n
	QDwTlRRz1wYRbqPY50ICr3Kp4/FqgiURO2dGkNhYx2Qxg/iAZiQvSAaewGCCwNw=
X-Gm-Gg: ASbGncsg0IPhjJhvZ31mniXff6S1Ntk93dQM/9BB8c+muUTSPUn0PehH9wqnKKcZUKr
	O7y2nGFoxjNb/THk5oqXKeoWD+E/VxeBCs+UVnQ9Sskdr/BLts+624v4PqNlNJOeecGc281Dn9M
	64osHVWwUHhwjUmpCJ2qNXYwDjSIOffopdtRQ5c/BhNSV8bfaroEcagsvjYFwbwvlZikj+bxZkx
	mZqE1oCJIVy+3xseVyI6QkUjb6EtlwcY4JkSmcEmJWWAqCOC7Pi6ODh7QMVZMRX6VdGBLGCetFt
	wO1BCcxYD9FKn/4qonqDd8GUNtIyJDdZkGjHL4s=
X-Google-Smtp-Source: AGHT+IEShoPP3YD6z2W+O0/vPyKF1Y0yxuBYn94naG7pDaYCKG//+YoFJl7jSG0i9ESCvq2AxsMDDg==
X-Received: by 2002:a05:622a:22a5:b0:477:6f28:8c16 with SMTP id d75a77b69052e-49452706cbfmr62292191cf.6.1746809219530;
        Fri, 09 May 2025 09:46:59 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4945259e456sm14597701cf.67.2025.05.09.09.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 09:46:58 -0700 (PDT)
Date: Fri, 9 May 2025 12:46:54 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: David Hildenbrand <david@redhat.com>,
	Usama Arif <usamaarif642@gmail.com>, Zi Yan <ziy@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	shakeel.butt@linux.dev, riel@surriel.com,
	baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 0/1] prctl: allow overriding system THP policy to always
Message-ID: <20250509164654.GA608090@cmpxchg.org>
References: <96eccc48-b632-40b7-9797-1b0780ea59cd@gmail.com>
 <8E3EC5A4-4387-4839-926F-3655188C20F4@nvidia.com>
 <279d29ad-cbd6-4a0e-b904-0a19326334d1@gmail.com>
 <CALOAHbCxhL=VM=E5UzNvQYZsrF4zdcQ1-49iEJ1UYvLsurtxCw@mail.gmail.com>
 <ebfca8f2-40e5-485a-a060-621aa3a22376@gmail.com>
 <CALOAHbDesDGyokKFSSr3hA1_WnFciQPXe_nboPq9v8OUPLv47g@mail.gmail.com>
 <20250509051328.GF323143@cmpxchg.org>
 <CALOAHbA617417UtcwMBJ9Zm_8BbAth57=ngN=tknw8h7nvCwNw@mail.gmail.com>
 <41e60fa0-2943-4b3f-ba92-9f02838c881b@redhat.com>
 <CALOAHbAvQDee2=5vsDqj77g5gAGdGpXFBbsC7tpKnCYEDZS3vw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALOAHbAvQDee2=5vsDqj77g5gAGdGpXFBbsC7tpKnCYEDZS3vw@mail.gmail.com>

On Fri, May 09, 2025 at 05:43:10PM +0800, Yafang Shao wrote:
> On Fri, May 9, 2025 at 5:31 PM David Hildenbrand <david@redhat.com> wrote:
> >
> > On 09.05.25 11:24, Yafang Shao wrote:
> > > On Fri, May 9, 2025 at 1:13 PM Johannes Weiner <hannes@cmpxchg.org> wrote:
> > >>
> > >> On Fri, May 09, 2025 at 10:15:08AM +0800, Yafang Shao wrote:
> > >>> On Fri, May 9, 2025 at 12:04 AM Usama Arif <usamaarif642@gmail.com> wrote:
> > >>>>
> > >>>>
> > >>>>
> > >>>> On 08/05/2025 06:41, Yafang Shao wrote:
> > >>>>> On Thu, May 8, 2025 at 12:09 AM Usama Arif <usamaarif642@gmail.com> wrote:
> > >>>>>>
> > >>>>>>
> > >>>>>>
> > >>>>>> On 07/05/2025 16:57, Zi Yan wrote:
> > >>>>>>> On 7 May 2025, at 11:12, Usama Arif wrote:
> > >>>>>>>
> > >>>>>>>> On 07/05/2025 15:57, Zi Yan wrote:
> > >>>>>>>>> +Yafang, who is also looking at changing THP config at cgroup/container level.
> > >>>>>
> > >>>>> Thanks
> > >>>>>
> > >>>>>>>>>
> > >>>>>>>>> On 7 May 2025, at 10:00, Usama Arif wrote:
> > >>>>>>>>>
> > >>>>>>>>>> Allowing override of global THP policy per process allows workloads
> > >>>>>>>>>> that have shown to benefit from hugepages to do so, without regressing
> > >>>>>>>>>> workloads that wouldn't benefit. This will allow such types of
> > >>>>>>>>>> workloads to be run/stacked on the same machine.
> > >>>>>>>>>>
> > >>>>>>>>>> It also helps in rolling out hugepages in hyperscaler configurations
> > >>>>>>>>>> for workloads that benefit from them, where a single THP policy is
> > >>>>>>>>>> likely to be used across the entire fleet, and prctl will help override it.
> > >>>>>>>>>>
> > >>>>>>>>>> An advantage of doing it via prctl vs creating a cgroup specific
> > >>>>>>>>>> option (like /sys/fs/cgroup/test/memory.transparent_hugepage.enabled) is
> > >>>>>>>>>> that this will work even when there are no cgroups present, and my
> > >>>>>>>>>> understanding is there is a strong preference of cgroups controls being
> > >>>>>>>>>> hierarchical which usually means them having a numerical value.
> > >>>>>>>>>
> > >>>>>>>>> Hi Usama,
> > >>>>>>>>>
> > >>>>>>>>> Do you mind giving an example on how to change THP policy for a set of
> > >>>>>>>>> processes running in a container (under a cgroup)?
> > >>>>>>>>
> > >>>>>>>> Hi Zi,
> > >>>>>>>>
> > >>>>>>>> In our case, we create the processes in the cgroup via systemd. The way we will enable THP=always
> > >>>>>>>> for processes in a cgroup is in the same way we enable KSM for the cgroup.
> > >>>>>>>> The change in systemd would be very similar to the line in [1], where we would set prctl PR_SET_THP_ALWAYS
> > >>>>>>>> in exec-invoke.
> > >>>>>>>> This is at the start of the process, but you would already know at the start of the process
> > >>>>>>>> whether you want THP=always for it or not.
> > >>>>>>>>
> > >>>>>>>> [1] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4ade7c6ab7be29a/src/core/exec-invoke.c#L5045
> > >>>>>>>
> > >>>>>>> You also need to add a new systemd.directives, e.g., MemoryTHP, to
> > >>>>>>> pass the THP enablement or disablement info from a systemd config file.
> > >>>>>>> And if you find those processes do not benefit from using THPs,
> > >>>>>>> you can just change the new "MemoryTHP" config and restart the processes.
> > >>>>>>>
> > >>>>>>> Am I getting it? Thanks.
> > >>>>>>>
> > >>>>>>
> > >>>>>> Yes, thats right. They would exactly the same as what we (Meta) do
> > >>>>>> for KSM. So have MemoryTHP similar to MemroryKSM [1] and if MemoryTHP is set,
> > >>>>>> the ExecContext->memory_thp would be set similar to memory_ksm [2], and when
> > >>>>>> that is set, the prctl will be called at exec_invoke of the process [3].
> > >>>>>>
> > >>>>>> The systemd changes should be quite simple to do.
> > >>>>>>
> > >>>>>> [1] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4ade7c6ab7be29a/man/systemd.exec.xml#L1978
> > >>>>>> [2] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4ade7c6ab7be29a/src/core/dbus-execute.c#L2151
> > >>>>>> [3] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4ade7c6ab7be29a/src/core/exec-invoke.c#L5045
> > >>>>>
> > >>>>> This solution carries a risk: since prctl() does not require any
> > >>>>> capabilities, the task itself could call it and override your memory
> > >>>>> policy. While we could enforce CAP_SYS_RESOURCE to restrict this, that
> > >>>>> capability is typically enabled by default in containers, leaving them
> > >>>>> still vulnerable.
> > >>>>>
> > >>>>> This approach might work for Kubernetes/container environments, but it
> > >>>>> would require substantial code changes to implement securely.
> > >>>>>
> > >>>>
> > >>>> You can already change the memory policy with prctl, for e.g. PR_SET_THP_DISABLE
> > >>>> already exists and the someone could use this to slow the process down. So the
> > >>>> approach this patch takes shouldn't be anymore of a security fix then what is already
> > >>>> exposed by the kernel. I think as you mentioned, if prctl is an issue CAP_SYS_RESOURCE
> > >>>> should be used to restrict this.
> > >>>
> > >>> I believe we should at least require CAP_SYS_RESOURCE to enable THP,
> > >>> since it overrides global system settings. Alternatively,
> > >>> CAP_SYS_ADMIN might be even more appropriate, though I'm not entirely
> > >>> certain.
> > >>
> > >> Hm, could you verbalize a concrete security concern?
> > >>
> > >> I've never really looked at the global settings as a hard policy, more
> > >> as picking a default for the workloads in the system. It's usually
> > >> `madvise' or `always', and MADV_HUGEPAGE and MADV_NOHUGEPAGE have long
> > >> existed to give applications the ability to refine the global choice.
> > >>
> > >> The prctl should probably respect `never' for consistency, but beyond
> > >> that I don't really see the concern, or how this would allow something
> > >> that isn't already possible.
> > >
> > > I would interpret the always, madvise, and never options as follows:
> > > - always
> > >    The sysadmin strongly recommends using THP. If a user does not
> > > want to use it, they must explicitly disable it.

I would call this "kernel mode" or "auto mode", where userspace should
*generally* not have to worry about huge pages, but with an option for
declaring the odd exceptional case.

Both madvise() and unprivileged prctl() currently work, and IMO should
continue to work, for declaring exceptions.

> > > - madvise
> > >   The sysadmin gently encourages the use of THP, but it is only
> > > enabled when explicitly requested by the application.

And this "user mode" or "manual mode", where applications self-manage
which parts of userspace they want to enroll.

Both madvise() and unprivileged prctl() should work here as well,
IMO. There is no policy or security difference between them, it's just
about granularity and usability.

> > > - never
> > >    The sysadmin discourages the use of THP, and "its use is only permitted
> > > with explicit approval" .

This one I don't quite agree with, and IMO conflicts with what David
is saying as well.

> > "never" so far means "no thps, no exceptions". We've had serious THP
> > issues in the past, where our workaround until we sorted out the issue
> > for affected customers was to force-disable THPs on that system during boot.
> 
> Right, that reflects the current behavior. What we aim to enhance is
> by adding the requirement that "its use is only permitted with
> explicit approval."

I think you're conflating a safety issue with a security issue.

David is saying there can be cases where the kernel is broken, and
"never" is a production escape hatch to disable the feature until a
kernel upgrade for the fix is possible. In such a case, it doesn't
make sense to override this decision based on any sort of workload
policy, privileged or not.

The way I understand you is that you want enrollment (and/or
self-management) only for blessed applications. Because you don't
generally trust workloads in the wild enough to switch the global
default away from "never", given the semantics of always/madvise.

To me this sounds like you'd need a different mode, call it "blessed";
with a privileged interface to control which applications are allowed
to madvise/prctl-enable.
