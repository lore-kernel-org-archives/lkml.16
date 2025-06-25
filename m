Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5BE1D63C7
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865573; cv=none; b=gJaFNkOKf54+I80VlucM73d3v3BpWSGgB28DKCVPwy9B1M658FNELeMHRZrBXjHVoedB1HS7Az7nWRuOj16nGor3lkog/VwRhlELfzZgNw1yNCac2L/urdbT3Zia1sGl8QR4dPGFpZh5jXbPYRHOdUu0F3jUqER2n9KuG7d6I/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865573; c=relaxed/simple;
	bh=rxG1Fpa+yn5i/wwFiiv5CEkQzxJmuuBU0suGJvB4zQ8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=T5sJ3SvEXnJiXt0kkpuL/qDhqnN7YaX8w+Llmkod7sCoHpo1cAsCRx1pRkoQek/fWpcMMMyfhKa/ybbJWtzxfh+415sJJKgJE9cApam0q9S+GCpXzDvrnJmbGOnOJ+xpVSW2pZzyiPhHllDyd8Rzi5AE8arMuTaQvYkkYET1JpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fAh4BV5u; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fAh4BV5u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750865570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uOzxKH9ZqEQ7oDloP0t3FhIryvy8z7MUCsI93EXD9io=;
	b=fAh4BV5ullrwVwnfFF9RsesLGFxoYVcgBKIKJoTh6DFEoYuMUh0BXe7/3MZ0rXrCW9GCC2
	uW2TKuME8imWvHVM3OXGTaqSxBObDu2H/Zs6Vgs2yuc226XfmX70hqMo9oerK00U7cwrrH
	vu1CKGYuhtrYoE+rjR+pSJG5J20gxGA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380-wTXI1TovM9COPHKdllJelA-1; Wed, 25 Jun 2025 11:32:49 -0400
X-MC-Unique: wTXI1TovM9COPHKdllJelA-1
X-Mimecast-MFC-AGG-ID: wTXI1TovM9COPHKdllJelA_1750865568
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45311704d1fso43463275e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865568; x=1751470368;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uOzxKH9ZqEQ7oDloP0t3FhIryvy8z7MUCsI93EXD9io=;
        b=dTE0GUPWS1WE3cvP+vBfUlL51mQuDfg8dZt7jeI8VQc2Zb2aNlYpo++7I8kMjfJa5c
         wMU3mm0eXYPFQWUcveJfggRzKiovoSUpwRmVsXCxeM7oAfyZdh/bCu7L1iwKjQSLZYzl
         QVhMTHg3ZHGlhHEEj7Kbz1mitXmZ6i1V/6uacvBkLZ/ektzX7T7kReNTOJmmMensUU4+
         hSncVke4t/SNLN9mRutIMTWBjK0qAvGH+eNXNMIJLWlROWN8eObr5AjUHtCRQOGon2Jk
         jhSvjkX4frTzg/lMydTZyhHzBDoAxyGjs9qqPkuDcygYQENlC25vu1It2+GxoXXZaQXq
         Gvqw==
X-Forwarded-Encrypted: i=1; AJvYcCWGfSQdMN+W5kdR2EoEL5I9Ux72gbCIAur070qHO753yjqECmHu/uD3GTD8m1x+Uv9Uho/woB7YZra4feU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9O2ybDbjsCBLkEww8MdmS6xYHGJHwJnEG65/VRCAkqqQj49HD
	khu9pGCM4qLGq00ml5LM2POCtzkgcc8Hcw1PFD1ke6hyVcVp49MICzmkkq8RgolnJsLnnykA95r
	ewmM3i/V8LGsBtIztJEhcQ36QInztQyB8rengFRLNkumrf86iRPFj2iwFq8xdzFM5Hg==
X-Gm-Gg: ASbGnct/hLnqD8Ky7tZGV13LrBayI3idihTGtafMNm1SNigKPQvkONWoVe8O7n2DNHq
	MECm8bLTnk1Yp++nb44Znxtk6NhaDYMmlOVRCkmMejWbnWoUJeE2tcICD6uCXn6pT9OdbXVUDNH
	BVTvtZvq8Eqtzk2zBIThzGcs9DSt7Wz6N1VAra/6GaMzIsXPpZVVPL2TMl7y3wW0i3z4Ld6R0ZN
	C75mxcp2rLH6+nW8gYqzTchEK5AAWR4Nv9sd/vh9qgWWG9yZs1U91NLSzT/jUOzdUO8K5a4CmTh
	+7hNds3NXz1HLoMjT5TEgqNNF+soFU42rg3D9MbUJIFSCv7tjzhr4PnjqHwHgOJ43twamB2sJ+b
	252GSHw8=
X-Received: by 2002:a05:600c:620b:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-45381aaff81mr39464015e9.3.1750865567832;
        Wed, 25 Jun 2025 08:32:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3NxmZy17uXte6Caxn+L+3Rf3Nho297KIrtG45Gu/BYgznhslbpO6yv1wQ51L4rPgpSs1DsA==
X-Received: by 2002:a05:600c:620b:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-45381aaff81mr39463495e9.3.1750865567446;
        Wed, 25 Jun 2025 08:32:47 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8069467sm4815430f8f.42.2025.06.25.08.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:32:46 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>, Ingo Molnar
 <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 Leon Romanovsky <leon@kernel.org>, linux-kernel@vger.kernel.org
Cc: Steve Wahl <steve.wahl@hpe.com>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben
 Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Madadi Vineeth
 Reddy <vineethr@linux.ibm.com>, K
 Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: [PATCH] sched/topology: Correct "sched_domains_curr_level" in
 topology_span_sane()
In-Reply-To: <20250624041235.1589-1-kprateek.nayak@amd.com>
References: <20250624041235.1589-1-kprateek.nayak@amd.com>
Date: Wed, 25 Jun 2025 17:32:45 +0200
Message-ID: <xhsmhy0tfhm5e.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hey,

First of all, thanks for looking into this!

On 24/06/25 04:12, K Prateek Nayak wrote:
> The updated topology_span_sane() algorithm in commit ce29a7da84cd
> ("sched/topology: Refinement to topology_span_sane speedup") works on
> the "sched_domain_topology_level" hierarchy to detect overlap in
> !SDTL_OVERLAP domains using the tl->mask() as opposed to the
> sched_domain hierarchy (and the sched_domain_span()) in the previous
> approach.
>

The previous approach also used tl->mask() directly, but it happened
to be called *before* the build_sched_domain() loop, so the NODE iteration
happened with sched_domain_curr_level at its default static value of
0... For the first SD build that is, I assume that was then broken for any
subsequent rebuild.

> For NODE domain, the cpumask retunred by tl->mask() depends on the
> "sched_domains_curr_level". Unless the "sched_domains_curr_level" is
> reset during topology_span_sane(), it reflects the "numa_level" of the
> last sched_domain created which is incorrect.
>
> Reset the "sched_domains_curr_level" to the "tl->numa_level" during
> topology_span_sane(). Although setting "topology_span_sane" to 0 in
> topology_span_sane() should be enough since all domains with
> numa_level > 0 currently set SDTL_OVERLAP flag, setting it to
> "tl->numa_level" makes it more explicit and future proof against changes
> in the same area.
>
> Cc: Steve Wahl <steve.wahl@hpe.com>
> Reported-by: Leon Romanovsky <leon@kernel.org>
> Closes: https://lore.kernel.org/lkml/20250610110701.GA256154@unreal/
> Fixes: ce29a7da84cd ("sched/topology: Refinement to topology_span_sane speedup")

Per the above, this could probably be:

Fixes: ccf74128d66c ("sched/topology: Assert non-NUMA topology masks don't (partially) overlap")

> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
> This issue can be reproduced on a setup with the following NUMA topology
> shared by Leon:
>
>     $ sudo numactl -H
>     available: 5 nodes (0-4)
>     node 0 cpus: 0 1
>     node 0 size: 2927 MB
>     node 0 free: 1603 MB
>     node 1 cpus: 2 3
>     node 1 size: 3023 MB
>     node 1 free: 3008 MB
>     node 2 cpus: 4 5
>     node 2 size: 3023 MB
>     node 2 free: 3007 MB
>     node 3 cpus: 6 7
>     node 3 size: 3023 MB
>     node 3 free: 3002 MB
>     node 4 cpus: 8 9
>     node 4 size: 3022 MB
>     node 4 free: 2718 MB
>     node distances:
>     node   0   1   2   3   4
>       0:  10  39  38  37  36
>       1:  39  10  38  37  36
>       2:  38  38  10  37  36
>       3:  37  37  37  10  36
>       4:  36  36  36  36  10
>
>
> This topology can be emulated using QEMU with the following cmdline used
> in my testing:
>
>      sudo ~/dev/qemu/build/qemu-system-x86_64 -enable-kvm \
>      -cpu host \
>      -m 20G -smp cpus=10,sockets=10 -machine q35 \
>      -object memory-backend-ram,size=4G,id=m0 \
>      -object memory-backend-ram,size=4G,id=m1 \
>      -object memory-backend-ram,size=4G,id=m2 \
>      -object memory-backend-ram,size=4G,id=m3 \
>      -object memory-backend-ram,size=4G,id=m4 \
>      -numa node,cpus=0-1,memdev=m0,nodeid=0 \
>      -numa node,cpus=2-3,memdev=m1,nodeid=1 \
>      -numa node,cpus=4-5,memdev=m2,nodeid=2 \
>      -numa node,cpus=6-7,memdev=m3,nodeid=3 \
>      -numa node,cpus=8-9,memdev=m4,nodeid=4 \
>      -numa dist,src=0,dst=1,val=39 \
>      -numa dist,src=0,dst=2,val=38 \
>      -numa dist,src=0,dst=3,val=37 \
>      -numa dist,src=0,dst=4,val=36 \
>      -numa dist,src=1,dst=0,val=39 \
>      -numa dist,src=1,dst=2,val=38 \
>      -numa dist,src=1,dst=3,val=37 \
>      -numa dist,src=1,dst=4,val=36 \
>      -numa dist,src=2,dst=0,val=38 \
>      -numa dist,src=2,dst=1,val=38 \
>      -numa dist,src=2,dst=3,val=37 \
>      -numa dist,src=2,dst=4,val=36 \
>      -numa dist,src=3,dst=0,val=37 \
>      -numa dist,src=3,dst=1,val=37 \
>      -numa dist,src=3,dst=2,val=37 \
>      -numa dist,src=3,dst=4,val=36 \
>      -numa dist,src=4,dst=0,val=36 \
>      -numa dist,src=4,dst=1,val=36 \
>      -numa dist,src=4,dst=2,val=36 \
>      -numa dist,src=4,dst=3,val=36 \
>      ...
>

It's a bit of a mouthful but I would keep that in the changelog itself
given that it's part of reproducing the bug.

>
> Changes are based on tip:sched/urgent at commit 914873bc7df9 ("Merge tag
> 'x86-build-2025-05-25' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip")
> ---
>  kernel/sched/topology.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index a2a38e1b6f18..1d634862c8df 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -2426,6 +2426,15 @@ static bool topology_span_sane(const struct cpumask *cpu_map)
>               cpumask_clear(covered);
>               cpumask_clear(id_seen);
>
> +#ifdef CONFIG_NUMA
> +		/*
> +		 * Reuse the sched_domains_curr_level hack since
> +		 * tl->mask() below can resolve to sd_numa_mask()
> +		 * for the NODE domain.
> +		 */
> +		sched_domains_curr_level = tl->numa_level;
> +#endif
> +

Urgh... Given this is now invoked after the build_sched_domain() loop, what
if we directly used the sched_domain_span(), instead, i.e. use

   sched_domain_mask(per_cpu_ptr(tl->data->sd, cpu))

instead of

   tl->mask(id)

which means no indrect use of sched_domains_curr_level. Note that I'm
currently running out of brain juice so this might be a really stupid idea :-)

>               /*
>                * Non-NUMA levels cannot partially overlap - they must be either
>                * completely equal or completely disjoint. Otherwise we can end up
>
> base-commit: 914873bc7df913db988284876c16257e6ab772c6
> --
> 2.34.1

