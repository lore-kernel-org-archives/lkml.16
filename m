Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5869B1EDA0E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 15:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738855467; cv=none; b=OByJrNezQn0mF6c9K+w3MMsECK6ZqdmYu+3+1QfaHDw3yqHAt75Ndv8cdescnMYIYQbr8/+Wwp4ySSxiHBYCrZmw9o9enOEc/n0jnnErr0m1LySxwRsa9AocQz0zqVXO/tUVGMrseZ2QKucfH9Nl9pEJBH3jnGvA/m8xnroQoUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738855467; c=relaxed/simple;
	bh=YPphV5G62CFL8KuQxZ3yO1XWPORZFgSc7KgvCiPN2mM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cetPVcGUgY7qRCXbTkqG7trgwgflFmulPW2UZH1SR6jEbDXmgJYFYhKUOokwBdvrVr59djGTjTTFO4+5CmS20kr319ZTkQeyFCdR6dj7Ym8qV52vvwO4J6xE8s0waMAunWQjkBzDFEFPhp/e71TRQ1HV3rsaGB8Ea6GMfcKODiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MFkn4ghC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MFkn4ghC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738855464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nsSy0hAlezuKAgobid2coWCPgueOf9jZ3at11uhkyPc=;
	b=MFkn4ghCYo46XKoaJuWC5KubVLr6kKkH3rUL4IJPmnLpde9yXBQOrUL7UIdo/K9J2apUdC
	Yam3gxAc1ppJXZcRaHuRoQvXSLemG7josx2ZcODnwf3F27adPk3ptKDJbMz6jzL9jHk6Kx
	w4iRvrissDM3xKAxcSwvHGEcu0Ikl3I=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-Wjlj6R2LOcyyzEwh97svxQ-1; Thu, 06 Feb 2025 10:24:23 -0500
X-MC-Unique: Wjlj6R2LOcyyzEwh97svxQ-1
X-Mimecast-MFC-AGG-ID: Wjlj6R2LOcyyzEwh97svxQ
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6dd43b16631so10693946d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 07:24:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738855462; x=1739460262;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nsSy0hAlezuKAgobid2coWCPgueOf9jZ3at11uhkyPc=;
        b=cv4Byw6UZR719WtL/L0uMEpu+C1AiVemuE2UHiOdsMmAFEWFzdPNyYTvQI15ewq57S
         DwaqNSmWtsfMaUHE8I+Z4y3TA/5P8YPTnMXaXIr4STGZfuSqGrBYh/y8oiGJEyAYRfJB
         qOirVWq8Ew93pXnvD2rqP9rV+Xc/t4EZKCv1EIVxfmPjLs96SHMzU+LXjv1TsQkVO4xT
         RwmYNCpNDgDY6DL+RVUByrKw3Ehs8FnL9HzwyoWX56YIRVzD5o2nFfbAIaht6PadNp7E
         76HSKbfjUyZ4HO6KunNMgy50efMbKwVYMRWm0P803YK3ck+vUYRuDdN8L3mLXJi7b6Gt
         GsBw==
X-Forwarded-Encrypted: i=1; AJvYcCUfCdbtBDqq36NCNGxL5rL8dyd63nx1NvXPFw7xFMt2mDMPDc+DmBiwX3e2dK5S5IulCt+bQ/4Ji6Ngmcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEvmIFtSRCTa6okZsKIZbnXZjJecGlFCz6CBfwnKwvVUmWhS55
	YAT1bm2ZgnPMyBKoM4MMTZp64TPSULo3QouwUphJ6ae39zbx11f0ttRL2HcmGu/UBVMzR637jmX
	ec455PKNYCfziObgzjmDZc84yftCyN/qRlmOXQo9+JSlIILkm2aQqlJrkKuomiw==
X-Gm-Gg: ASbGnctUs1YLqFlQSzr1RDn0x1xwfUqKMRYiaqPrNjjoZCtQXag4UXg7OE/qLcTr7ib
	j8ogIRPF9jFZlnYSUl2enkhD0B3JecPM1A4RQoxyBwE4uTWa6hrK6vleSLunaPPuNp5I3+sYntC
	urJI7vn+2qA9RHvwdS18Em3CSrA3rLv8LxtvkJXrmZd6abxJc10hDCWOZYQgevmV2v/mfII3SVb
	4g5Q6YTSz/AX1RmRWemWIOe6+gFzOu49zi3g8A7J+O8itWTT3RkC6V9b+fs/0x9+wi0fVMBfDf7
	U4sdHG7iWK7c90PrPMUJYsw8J/pLcLi29Lzbpw6oCnRa/cqEd0iZqguiqWqB8oQ09g==
X-Received: by 2002:a0c:fd87:0:b0:6e4:3478:b55a with SMTP id 6a1803df08f44-6e43478b75bmr57603306d6.35.1738855462427;
        Thu, 06 Feb 2025 07:24:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAzIP3FPchsTGksDad8A1HROFqTYUizQO7jsonTZtU1t1mZ2sva4db+JAsMgyMPkDZ4m50qA==
X-Received: by 2002:a0c:fd87:0:b0:6e4:3478:b55a with SMTP id 6a1803df08f44-6e43478b75bmr57603066d6.35.1738855462057;
        Thu, 06 Feb 2025 07:24:22 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43baacac6sm6602286d6.87.2025.02.06.07.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 07:24:20 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>, Peter Zijlstra
 <peterz@infradead.org>
Cc: Naman Jain <namjain@linux.microsoft.com>, Ingo Molnar
 <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Steve Wahl <steve.wahl@hpe.com>, Saurabh
 Singh Sengar <ssengar@linux.microsoft.com>, srivatsa@csail.mit.edu,
 Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v3] sched/topology: Enable topology_span_sane check only
 for debug builds
In-Reply-To: <e0774ea1-27ac-4aa1-9a96-5e27aa8328e6@amd.com>
References: <20250203114738.3109-1-namjain@linux.microsoft.com>
 <f6bf04e8-3007-4a44-86d8-2cc671c85247@amd.com>
 <20250205095506.GB7145@noisy.programming.kicks-ass.net>
 <0835864f-6dc5-430d-91c0-b5605007d9d2@amd.com>
 <20250205101600.GC7145@noisy.programming.kicks-ass.net>
 <e0774ea1-27ac-4aa1-9a96-5e27aa8328e6@amd.com>
Date: Thu, 06 Feb 2025 16:24:17 +0100
Message-ID: <xhsmhed0bjdum.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 06/02/25 14:40, K Prateek Nayak wrote:
> What topology_span_sane() does is, it iterates over all the CPUs at a
> given topology level and makes sure that the cpumask for a CPU at
> that domain is same as the cpumask of every other CPU set on that mask
> for that topology level.
>
> If two CPUs are set on a mask, they should have the same mask. If CPUs
> are not set on each other's mask, the masks should be disjoint.
>
> On x86, the way set_cpu_sibling_map() works, CPUs are set on each other's
> shared masks iff match_*() returns true:
>
> o For SMT, this means:
>
>    - If X86_FEATURE_TOPOEXT is set:
>      - pkg_id must match.
>      - die_id must match.
>      - amd_node_id must match.
>      - llc_id must match.
>      - Either core_id or cu_id must match. (*)
>      - NUMA nodes must match.
>
>    - If !X86_FEATURE_TOPOEXT:
>      - pkg_id must match.
>      - die_id must match.
>      - core_id must match.
>      - NUMA nodes must match.
>
> o For CLUSTER this means:
>
>    - If l2c_id is not populated (== BAD_APICID)
>      - Same conditions as SMT.
>
>    - If l2c_id is populated (!= BAD_APICID)
>      - l2c_id must match.
>      - NUMA nodes must match.
>
> o For MC it means:
>
>    - llc_id must be populated (!= BAD_APICID) and must match.
>    - If INTEL_SNC: pkg_id must match.
>    - If !INTEL_SNC: NUMA nodes must match.
>
> o For PKG domain:
>
>    - Inserted only if !x86_has_numa_in_package.
>    - CPUs should be in same NUMA node.
>
> All in all, other that the one (*) decision point, everything else has
> to strictly match for CPUs to be set in each other's CPU mask. And if
> they match with one CPU, they should match will all other CPUs in mask
> and it they mismatch with one, they should mismatch with all leading
> to link_mask() never being called.
>

Nice summary, thanks for that - I'm not that familiar with the x86 topology
faff.


> This is why I think that the topology_span_sane() check is redundant
> when the x86 bits have already ensured masks cannot overlap in all
> cases except for potentially in the (*) case.
>
> So circling back to my original question around "SDTL_ARCH_VERIFIED",
> would folks be okay to an early bailout from topology_span_sane() on:
>
>      if (!sched_debug() && (tl->flags & SDTL_ARCH_VERIFIED))
>       return;
>
> and more importantly, do folks care enough about topology_span_sane()
> to have it run on other architectures and not just have it guarded
> behind just "sched_debug()" which starts off as false by default?
>

If/when possible I prefer to have sanity checks run unconditionally, as
long as they don't noticeably impact runtime. Unfortunately this does show
up in the boot time, though Steve had a promising improvement for that.

Anyway, if someone gets one of those hangs on a

  do { } while (group != sd->groups)

they'll quickly turn on sched_verbose (or be told to) and the sanity check
will holler at them, so I'm not entirely against it.

> (Sorry for the long answer explaining my thought process.)
>
>>
>> That I can't remember, sorry :/
>
> --
> Thanks and Regards,
> Prateek

