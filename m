Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C372673B7
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 05:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746767631; cv=none; b=f/S388kxP+xpflR95joNKXRXBhstalMr27K3VSRWw9LKub1J2kgG4eqjJCcmdpspR3TND4JWjj8FrwHCgRinHOAj1KQ4bh0+irbmi5sl5MhPNFivCUpVTYVUAS7x0hwAX0WE/wENQKelmhZyOCIzDf067bD6zLc6qJgPBSRqipg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746767631; c=relaxed/simple;
	bh=gQc8BzthBGgLdgAtXCEOSjxzdssYGxym7knQO70E01I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FcO6c/vlbi7GcKTC/6/GdtyT8QOWV0kblbdGw9VFQar0WMQ5s32i4JBZuEK7nyNPbATzE2ienpMC6chHoOBZV/yBUGo0wOZ5j++sIT4TGtZyEHMTTXwsUQ/kIJUK4CT1EAej0kLJM/IF42SY3nN48drMiMYiBgq2lR8glryxXDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=oVTTMLyp; arc=none smtp.client-ip=209.85.167.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="oVTTMLyp"
Received: by mail-oi1-f196.google.com with SMTP id 5614622812f47-3f6eaa017d0so1593385b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 22:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1746767626; x=1747372426; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PUpmkKUfw9A5OMg6fQ75gqALv1X0Kk+J6ZX5ClmsX/I=;
        b=oVTTMLypR5TmNNjwuQ8/4apGZpMb9j3yHDV0m8wr2qHyoLn/8ZEyVZ7JSiYVCTs0Td
         JZHGZFmk0uWuwFH6A08LSXeYX+xKvF02NPBgYDxbPg3YdIC9Y0IA/kMDsA36MlRVsWT9
         zPackmpXIdSeir8Q/OmXYnKlwAixUgbsdElaD4t/wUPxrPmSPE2VeL1yGD6vLQQb2bWF
         4R7rpBgbIoh3hScXEqPuCO0bPjwIa69Q6xnZzjy+YkcznT/psMQQj9NzH7SjlEgLX9om
         QV4jadXlRbU/FufaMcPe62TKWt6raMaZ9dEry0PJ+BfGSGigMleS8fy+kZW2CCNi5JxJ
         EdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746767626; x=1747372426;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PUpmkKUfw9A5OMg6fQ75gqALv1X0Kk+J6ZX5ClmsX/I=;
        b=RfPX9cAr7IcZMtVabzEKsFYpDiDwN+aSSrI5Kc924WMW9oVcbCm/AU31lcyrfCVHUy
         B1d+HNj04IPB3g3UwywmjNIe3HoBrPh1MBKwSfRnITDs/t1OdzNg2Sc0vGiiu1P6mSJU
         wckgQtZRMydjUy8WXSqi5EobVJc0Zm1X6OpFxPUmM08kKAedlI4Px7SD5OGPdHR/7rB1
         L8boA0z9SGJN6TVSVTxbUsqhgJjHWEhQ2Kxu38V8tfIHQ/V+SYSwMtqM/gjEqn+bKMfP
         ybembr4GxVewgRknvnOy4SlwlBx0HJPhY1orWucaBRmmuI2+PB+9KtuNHEakIkRLbWki
         y1wg==
X-Forwarded-Encrypted: i=1; AJvYcCVb3J784vOF3D4UmO1+pbxzrnPpJIK3aLrFr5Z+M0/4noRZZ25KoG8jnyAHes46yDBW+Oq0c9dd6pFe5fw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNG6vRhlq+pjXkfGA8pD0RKh+RfZ30eKVxRo/UhL77OxvpEr+i
	PPoqdUPTXpy1NAneKCG2C8mSzGY9PG6yOaH+25agqLqOU76GyErT8p6uLsfCtViLHGupWUliler
	1h9+cCg==
X-Gm-Gg: ASbGncuqnjnjDIGOtVWtS2Ug8XBrXZ74di0OL2PXF/r8gymUskcl/NoR3VlOEvT1k1k
	2aZ+fq5ZIyhFISDHqK4T/DW1pt6RHB8h3fHYaqdIht17frCDnM3t2ISsWUcCARSjGzXLy7vmBn/
	QVNm7rNumbudWMNJi+/FboL3JJKQIeDsIi742oo4UW7p22CLUYdPz0aWqtpNp33AxmXre7vO49N
	uV5LDWGmK2qAB6QaUGOtFWpPb0Zjw/+pnP7bcHgR+OjK0R9vBdom/tshM68XdLtaEDJwj52UWbX
	pol+QWRYVWo25OhrpHutmGMS0DHrUo/AgI2DQX0=
X-Google-Smtp-Source: AGHT+IGIlTCYJ/dQFP9OrgQ9K4cwO9xpxO0fTpb/OJNjBaP5lJTQLuU0TrrBpJ0zonzaPmRihikvng==
X-Received: by 2002:a05:620a:2551:b0:7c9:2612:32d6 with SMTP id af79cd13be357-7cd0115c77amr334970385a.48.1746767614945;
        Thu, 08 May 2025 22:13:34 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00fdc494sm89758285a.69.2025.05.08.22.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 22:13:33 -0700 (PDT)
Date: Fri, 9 May 2025 01:13:28 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: Usama Arif <usamaarif642@gmail.com>, Zi Yan <ziy@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
	linux-mm@kvack.org, shakeel.butt@linux.dev, riel@surriel.com,
	baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 0/1] prctl: allow overriding system THP policy to always
Message-ID: <20250509051328.GF323143@cmpxchg.org>
References: <20250507141132.2773275-1-usamaarif642@gmail.com>
 <293530AA-1AB7-4FA0-AF40-3A8464DC0198@nvidia.com>
 <96eccc48-b632-40b7-9797-1b0780ea59cd@gmail.com>
 <8E3EC5A4-4387-4839-926F-3655188C20F4@nvidia.com>
 <279d29ad-cbd6-4a0e-b904-0a19326334d1@gmail.com>
 <CALOAHbCxhL=VM=E5UzNvQYZsrF4zdcQ1-49iEJ1UYvLsurtxCw@mail.gmail.com>
 <ebfca8f2-40e5-485a-a060-621aa3a22376@gmail.com>
 <CALOAHbDesDGyokKFSSr3hA1_WnFciQPXe_nboPq9v8OUPLv47g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALOAHbDesDGyokKFSSr3hA1_WnFciQPXe_nboPq9v8OUPLv47g@mail.gmail.com>

On Fri, May 09, 2025 at 10:15:08AM +0800, Yafang Shao wrote:
> On Fri, May 9, 2025 at 12:04 AM Usama Arif <usamaarif642@gmail.com> wrote:
> >
> >
> >
> > On 08/05/2025 06:41, Yafang Shao wrote:
> > > On Thu, May 8, 2025 at 12:09 AM Usama Arif <usamaarif642@gmail.com> wrote:
> > >>
> > >>
> > >>
> > >> On 07/05/2025 16:57, Zi Yan wrote:
> > >>> On 7 May 2025, at 11:12, Usama Arif wrote:
> > >>>
> > >>>> On 07/05/2025 15:57, Zi Yan wrote:
> > >>>>> +Yafang, who is also looking at changing THP config at cgroup/container level.
> > >
> > > Thanks
> > >
> > >>>>>
> > >>>>> On 7 May 2025, at 10:00, Usama Arif wrote:
> > >>>>>
> > >>>>>> Allowing override of global THP policy per process allows workloads
> > >>>>>> that have shown to benefit from hugepages to do so, without regressing
> > >>>>>> workloads that wouldn't benefit. This will allow such types of
> > >>>>>> workloads to be run/stacked on the same machine.
> > >>>>>>
> > >>>>>> It also helps in rolling out hugepages in hyperscaler configurations
> > >>>>>> for workloads that benefit from them, where a single THP policy is
> > >>>>>> likely to be used across the entire fleet, and prctl will help override it.
> > >>>>>>
> > >>>>>> An advantage of doing it via prctl vs creating a cgroup specific
> > >>>>>> option (like /sys/fs/cgroup/test/memory.transparent_hugepage.enabled) is
> > >>>>>> that this will work even when there are no cgroups present, and my
> > >>>>>> understanding is there is a strong preference of cgroups controls being
> > >>>>>> hierarchical which usually means them having a numerical value.
> > >>>>>
> > >>>>> Hi Usama,
> > >>>>>
> > >>>>> Do you mind giving an example on how to change THP policy for a set of
> > >>>>> processes running in a container (under a cgroup)?
> > >>>>
> > >>>> Hi Zi,
> > >>>>
> > >>>> In our case, we create the processes in the cgroup via systemd. The way we will enable THP=always
> > >>>> for processes in a cgroup is in the same way we enable KSM for the cgroup.
> > >>>> The change in systemd would be very similar to the line in [1], where we would set prctl PR_SET_THP_ALWAYS
> > >>>> in exec-invoke.
> > >>>> This is at the start of the process, but you would already know at the start of the process
> > >>>> whether you want THP=always for it or not.
> > >>>>
> > >>>> [1] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4ade7c6ab7be29a/src/core/exec-invoke.c#L5045
> > >>>
> > >>> You also need to add a new systemd.directives, e.g., MemoryTHP, to
> > >>> pass the THP enablement or disablement info from a systemd config file.
> > >>> And if you find those processes do not benefit from using THPs,
> > >>> you can just change the new "MemoryTHP" config and restart the processes.
> > >>>
> > >>> Am I getting it? Thanks.
> > >>>
> > >>
> > >> Yes, thats right. They would exactly the same as what we (Meta) do
> > >> for KSM. So have MemoryTHP similar to MemroryKSM [1] and if MemoryTHP is set,
> > >> the ExecContext->memory_thp would be set similar to memory_ksm [2], and when
> > >> that is set, the prctl will be called at exec_invoke of the process [3].
> > >>
> > >> The systemd changes should be quite simple to do.
> > >>
> > >> [1] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4ade7c6ab7be29a/man/systemd.exec.xml#L1978
> > >> [2] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4ade7c6ab7be29a/src/core/dbus-execute.c#L2151
> > >> [3] https://github.com/systemd/systemd/blob/2e72d3efafa88c1cb4d9b28dd4ade7c6ab7be29a/src/core/exec-invoke.c#L5045
> > >
> > > This solution carries a risk: since prctl() does not require any
> > > capabilities, the task itself could call it and override your memory
> > > policy. While we could enforce CAP_SYS_RESOURCE to restrict this, that
> > > capability is typically enabled by default in containers, leaving them
> > > still vulnerable.
> > >
> > > This approach might work for Kubernetes/container environments, but it
> > > would require substantial code changes to implement securely.
> > >
> >
> > You can already change the memory policy with prctl, for e.g. PR_SET_THP_DISABLE
> > already exists and the someone could use this to slow the process down. So the
> > approach this patch takes shouldn't be anymore of a security fix then what is already
> > exposed by the kernel. I think as you mentioned, if prctl is an issue CAP_SYS_RESOURCE
> > should be used to restrict this.
> 
> I believe we should at least require CAP_SYS_RESOURCE to enable THP,
> since it overrides global system settings. Alternatively,
> CAP_SYS_ADMIN might be even more appropriate, though I'm not entirely
> certain.

Hm, could you verbalize a concrete security concern?

I've never really looked at the global settings as a hard policy, more
as picking a default for the workloads in the system. It's usually
`madvise' or `always', and MADV_HUGEPAGE and MADV_NOHUGEPAGE have long
existed to give applications the ability to refine the global choice.

The prctl should probably respect `never' for consistency, but beyond
that I don't really see the concern, or how this would allow something
that isn't already possible.

> > In terms of security vulnerability of prctl, I feel like there are a lot of others
> > that can be a much much bigger issue? I just had a look and you can change the
> > seccomp, reset PAC keys(!) even speculation control(!!), so I dont think the security
> > argument would be valid.
> 
> I was surprised to discover that none of these operations require any
> capabilities to execute.

seccomp enabling is a one-way street, PR_SPEC_FORCE_DISABLE is as
well. You can reset PAC keys, but presumably, unless you also switch
to a new execution context with entirely new PAC/AUT pairs, this would
just crash the application on the next AUT?
