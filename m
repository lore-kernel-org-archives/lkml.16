Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180EA28AB07
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 19:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746732904; cv=none; b=Ni5gvwZSE7fkLczjX9dsfcQu2+MAnHNFN3TLXfOArADRWfyy/QKFUDSfzlNX8vtNoI4pcSV1XoxzKP16c3L010sDebVrKp0HujALNn+h2N6xPi2C/H0nFs+5J3ahQwN4K8TUzlDD6eh/7ohr6xQWnInEgJcVK8EaOryXRz/Dpe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746732904; c=relaxed/simple;
	bh=VzLB/GExdxNme2u/M2TKv9ScNhEMbkIEp4+dcTvn5Ec=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oWbERj+R9Q6yiBp2avZFY+CgaEs/7wgAkRaqD0sG3q2FSBcXTmP50S/ZeSR4VOxrZ7+GaTAs4mrfPX9KX/bTSKUTKgA5J+08/h+N9RnQjCJ1BldfDh+RndDYjlHFC/udjesqyh4rBNG7oVave4xxtREckb3w26SmhApXY2II0L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WbxRoMUl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WbxRoMUl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746732901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3YwEcBVK3vv4ZwSSNkAmuZNRhaTnJeEktKDr5BfOOfE=;
	b=WbxRoMUllxkrA7Gu6byXpz/HPYUPKlsvZPIQRoPGfsNzF76i6OaON8PAUrwjB4O428EvuI
	8yEtr0fm8ML/W7sDgnU/cyTeRq8yjINpzFleuWfM/GtwuPoUFCCa/OOO8tKMYrbXsZXaet
	PvXEGN6bdDW6FQnknkwuVG0+zSDypMA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-BgV4FE0DOoCdv1lYhETCpQ-1; Thu, 08 May 2025 15:34:59 -0400
X-MC-Unique: BgV4FE0DOoCdv1lYhETCpQ-1
X-Mimecast-MFC-AGG-ID: BgV4FE0DOoCdv1lYhETCpQ_1746732899
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f53d9cf004so24367466d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 12:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746732899; x=1747337699;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3YwEcBVK3vv4ZwSSNkAmuZNRhaTnJeEktKDr5BfOOfE=;
        b=fA6g50xoAGVnWP0PbIuYQwbI6cGOJ7kkOWjp+1lRSkCM1BeSNG3fn+Dy5biVCDhIfv
         +sGe4I5lPskRb/6QggDPaiV1z1BXekg96Kdbu6wqRXwuKH347zrbhcZFeAc9Zu471wIr
         Z2YbIwupeURfOjMYBFwqlxW57hoVyGJ1jGxTJgwSuX8fLaEKBLGousPJk4c8r/4OIF9I
         L4GMZdnPaR4+Mnj9lYkbjceMqFJERXATTdfN9v/skpwf1+4bKNK9n4XuheLNIVGliyV1
         0ZNuejyGOhA02mj//jGQ22rBizHhlzhwiOcOiHPSPaSTe3KiIVL9Fj9s06+eaxg0SNrE
         R+Bg==
X-Forwarded-Encrypted: i=1; AJvYcCVDW1Ui5Wt0BbBwo6vOGQr56feVNnSThRpz5oozBbiBweT4p5hNx/OSD1U5X2RJMkTJsJz1rHqd/ZrTbHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR/X8+mKCOJ8tRm5HVG5J6wVGSNPYw1BjbEFYReJwDlYI0z5SZ
	2y4FFoPXjSyJkRNNYKFakHFp0inuQCq6Wg9ubB/eFUYKRp314UsXD98t7Isgh7/SHAWaewMYG46
	jAOVxoJk+X+HW6WZmd/Dl+wo8tV0liR6ut839TWUctP5bgCskv7oQKs3yp4K6jg==
X-Gm-Gg: ASbGncu0G2TCJZrHHBk/Ch0+g84ThEInhgr70Ug7+JOC5hkfspPui6OIq1SfOpZ8585
	H1Du/2ojjkoZXz4I/h988mkqo20vnix9xHIwFB+VSHFd+Rg9WPPJlRiXKWD3EI9t6M7phaRxA4x
	oppIn1iiikBbdD0FIqHDJpuqBaP9bQ3yIGs8lY46h4VQilMIvH915hmdpAH8Mj7Tp5nNF6ehQe3
	yRxpK+qNXPpCVraJKNop6QknRnw2nJ+Jabj4L1EqaBB9QVm8pMLOT3Xr+u0Ewu0uwabOWaj+6au
	mH81Ih4dsUZIBvAYGBas8u0XlS8qXq6C4nsLb7MX/9Gn+HIhCHrfxP4A1g==
X-Received: by 2002:a05:6214:acf:b0:6f5:3e38:612b with SMTP id 6a1803df08f44-6f6e480eb13mr7365636d6.41.1746732898565;
        Thu, 08 May 2025 12:34:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfgnQKNt/xIX+0BJNn1+fbM2SZK1Vg/S9yo7o+l7fcYitVl8JKLyEQF09Q4tOEErio2hQ1DA==
X-Received: by 2002:a05:6214:acf:b0:6f5:3e38:612b with SMTP id 6a1803df08f44-6f6e480eb13mr7365246d6.41.1746732898256;
        Thu, 08 May 2025 12:34:58 -0700 (PDT)
Received: from ?IPV6:2601:188:c102:9c40:1f42:eb97:44d3:6e9a? ([2601:188:c102:9c40:1f42:eb97:44d3:6e9a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e3a538c5sm3343566d6.108.2025.05.08.12.34.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 12:34:57 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <b7aa4b10-1afb-476f-ac5d-d8db7151d866@redhat.com>
Date: Thu, 8 May 2025 15:34:56 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC/PATCH] sched: Support moving kthreads into cpuset cgroups
To: Xi Wang <xii@google.com>, Frederic Weisbecker <frederic@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org,
 cgroups@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 David Rientjes <rientjes@google.com>, Mel Gorman <mgorman@suse.de>,
 Valentin Schneider <vschneid@redhat.com>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Vlastimil Babka <vbabka@suse.cz>,
 Dan Carpenter <dan.carpenter@linaro.org>, Chen Yu <yu.c.chen@intel.com>,
 Kees Cook <kees@kernel.org>, Yu-Chun Lin <eleanor15x@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?=
 <mic@digikod.net>, jiangshanlai@gmail.com
References: <20250506183533.1917459-1-xii@google.com>
 <aBqmmtST-_9oM9rF@slm.duckdns.org>
 <CAOBoifh4BY1f4B3EfDvqWCxNSV8zwmJPNoR3bLOA7YO11uGBCQ@mail.gmail.com>
 <aBtp98E9q37FLeMv@localhost.localdomain>
 <CAOBoifgp=oEC9SSgFC+4_fYgDgSH_Z_TMgwhOxxaNZmyD-ijig@mail.gmail.com>
 <aBuaN-xtOMs17ers@slm.duckdns.org>
 <CAOBoifiv2GCeeDjax8Famu7atgkGNV0ZxxG-cfgvC857-dniqA@mail.gmail.com>
 <aBv2AG-VbZ4gcWpi@pavilion.home>
 <CAOBoifhWNi-j6jbP6B9CofTrT+Kr6TCSYYPMv7SQdbY5s930og@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAOBoifhWNi-j6jbP6B9CofTrT+Kr6TCSYYPMv7SQdbY5s930og@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/8/25 1:51 PM, Xi Wang wrote:
> I think our problem spaces are different. Perhaps your problems are closer to
> hard real-time systems but our problems are about improving latency of existing
> systems while maintaining efficiency (max supported cpu util).
>
> For hard real-time systems we sometimes throw cores at the problem and run no
> more than one thread per cpu. But if we want efficiency we have to share cpus
> with scheduling policies. Disconnecting the cpu scheduler with isolcpus results
> in losing too much of the machine capacity. CPU scheduling is needed for both
> kernel and userspace threads.
>
> For our use case we need to move kernel threads away from certain vcpu threads,
> but other vcpu threads can share cpus with kernel threads. The ratio changes
> from time to time. Permanently putting aside a few cpus results in a reduction
> in machine capacity.
>
> The PF_NO_SETAFFINTIY case is already handled by the patch. These threads will
> run in root cgroup with affinities just like before.
>
> The original justifications for the cpuset feature is here and the reasons are
> still applicable:
>
> "The management of large computer systems, with many processors (CPUs), complex
> memory cache hierarchies and multiple Memory Nodes having non-uniform access
> times (NUMA) presents additional challenges for the efficient scheduling and
> memory placement of processes."
>
> "But larger systems, which benefit more from careful processor and memory
> placement to reduce memory access times and contention.."
>
> "These subsets, or “soft partitions” must be able to be dynamically adjusted, as
> the job mix changes, without impacting other concurrently executing jobs."
>
> https://docs.kernel.org/admin-guide/cgroup-v1/cpusets.html
>
> -Xi
>
If you create a cpuset root partition, we are pushing some kthreads 
aways from CPUs dedicated to the newly created partition which has its 
own scheduling domain separate from the cgroup root. I do realize that 
the current way of excluding only per cpu kthreads isn't quite right. So 
I send out a new patch to extend to all the PF_NO_SETAFFINITY kthreads.

So instead of putting kthreads into the dedicated cpuset, we still keep 
them in the root cgroup. Instead we can create a separate cpuset 
partition to run the workload without interference from the background 
kthreads. Will that functionality suit your current need?

Cheers,
Longman

