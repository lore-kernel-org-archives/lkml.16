Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E0928C030
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 15:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748445837; cv=none; b=o5y+M8byGy6z+XiFxX0B7/bhjGL/bOPd4v1nf3ApJMphqMiHAQc4CMA3fRRmdvaSnoSXtTH7235q2FDcQpwjn6JSqkdFKqGNSM7K+HKa3YExAc0HIfrnQkkgBr3JBzz1qHYY6a3VvcuT0DW9z8ub7tIGhvU4lGAiy7nyRDzQtvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748445837; c=relaxed/simple;
	bh=OlIGNsrljXEWvdinSyO4J4xZYqnP3RN9MssjhHD6S0U=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:References:
	 In-Reply-To:Content-Type; b=TH4fw0m9z19YsUYxcl6M9J6vKL3QizBY2t1vr6ezknnaBB8aQ6GM/C401GErfPC/Vj3H0lyBdGqxfWSIiSbA15/lFQOsVm+fqpTUft5p1+eaI8M1pjYj0VABsCqGN1Q6bn6awVb9QSGhjmkc/9sbElMWTCbjMPHtXWjuVOuSwkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rn7UjnIa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rn7UjnIa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748445834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VptaC6vHWAhUvWn27KJmHAqHCa7LDR5CmGrJB91xBRs=;
	b=Rn7UjnIahdMPfZQS+TRSMa79rkqeUMClD7l9VcBlGMT7M89uF4M6uoAhdge33hq+neU18g
	g34+ArW6pwzJnthSi+3r9DD1NJrAATQfMhmQvix1zW/kVMmIYa7EX7XZ2rbpS9ppWl/E1o
	M6OH+LO5AaTHbmVsMk5cQ55TYEOU+IE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-tbqpbgWsNPKYUmwIFr3ACA-1; Wed, 28 May 2025 11:23:53 -0400
X-MC-Unique: tbqpbgWsNPKYUmwIFr3ACA-1
X-Mimecast-MFC-AGG-ID: tbqpbgWsNPKYUmwIFr3ACA_1748445833
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5d608e703so745348585a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748445833; x=1749050633;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VptaC6vHWAhUvWn27KJmHAqHCa7LDR5CmGrJB91xBRs=;
        b=U4HxtaJXwjwwo9ly7Q6yBLc1AnAlhO34AZxIoVPhZbz/TsljDw6WNmmYqkKVrq+unN
         xa9tXcIc0Zuq7Z5mLKw/dPIVol7zSFBkiwSAHFr9Bhne3eFiPcGprYnuHhLcwoPEQqRz
         KJ86TZ6BNhkLx3+dY7RJks7nEt21z9TDKr4dvuuhp0XfXv02rCuwZVFAHautlhWJOV2/
         OojiUT/NOeIJn9HCZDLYgP+e2P7ULDmUf3O9Xoverd1ZurbNFJqRfqHotbi05igoZNHj
         3g91tQwIEc29GuUKoV2kD4OLOuSt7Dv+7jCgSP8JssZPARugRxqO0Vnmgu/8p5SJy5f6
         ouhg==
X-Forwarded-Encrypted: i=1; AJvYcCUZRZN+KE1gIHOK9CWsAz2NoEQFdB/67/8Rmq69FzLtpy8YQGQ5I8wztBz+KcBpmSrZytqWjUVf3ENAMc4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkk6yUuiNbOWml0DAUHWtjtZrAs/Z/tW/KbqGM8aXNPf0PyTyB
	AOPBXBToQ7+yE4LnLf0iNr9gDT5gqtDVrXq7mh1HRFUvZFnqJW0EPgs/kHGjkAZMwYS9x9tqQYB
	bZyCNDT2MMETvFC2GKebfjmNeIDdZetQelSXssJAHITyNkBHTWUlWR+QTCDVdEq8c2Q==
X-Gm-Gg: ASbGncuh06d6X33VvSBONivQ1pN8OhsGNYjK40cJ0i+XaYcVMSHog1jRYBTK1RiFtKq
	IVy2rekH7X0SXIwH6GjRMrE0OB//vm62MNNp1kC90lXz475cEdPvVst5wBUl5m10XLr78fz1e4x
	AuyX8vEKPiS/dPl120Ny56rgKAz733xl3I8Ch3dINxqsmUgrrABmZO8NxMRtWBitcPwnvXwbgrN
	/tafwbNW1wRLKdXFMrXJGsVvBXZvyKsqZPdb23ihnkwUY3CauD9RqJ110qJKxSAVAd8QhuD5bi5
	6s6J2egXDFMG
X-Received: by 2002:a05:620a:424a:b0:7c5:55f9:4bc1 with SMTP id af79cd13be357-7ceecc27054mr2090624185a.42.1748445832840;
        Wed, 28 May 2025 08:23:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnQ/I5pD0hhQow2ppXrZml7+WUDRAt7CMy+wi3zoafLJfGV00yEjXt2imSZol2wlQaaiVzAw==
X-Received: by 2002:a05:620a:424a:b0:7c5:55f9:4bc1 with SMTP id af79cd13be357-7ceecc27054mr2090621085a.42.1748445832382;
        Wed, 28 May 2025 08:23:52 -0700 (PDT)
Received: from [172.20.4.10] ([50.234.147.137])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cfc5d486c8sm81211485a.101.2025.05.28.08.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 08:23:51 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <99be9c8e-a5c4-4378-b03b-2af01608de9f@redhat.com>
Date: Wed, 28 May 2025 11:23:50 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: cgroup: clarify controller enabling
 semantics
To: Vishal Chourasia <vishalc@linux.ibm.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250527085335.256045-2-vishalc@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250527085335.256045-2-vishalc@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/27/25 4:53 AM, Vishal Chourasia wrote:
> The documentation for cgroup controller management has been updated to
> be more consistent regarding following concepts:
>
> What does it mean to have controllers
> 1) available in a cgroup, vs.
> 2) enabled in a cgroup
>
> Which has been clearly defined below in the documentation.
>
> "Enabling a controller in a cgroup indicates that the distribution of
> the target resource across its immediate children will be controlled.
> Consider the following sub-hierarchy"
>
> As an example, consider
>
> /sys/fs/cgroup # cat cgroup.controllers
> cpuset cpu io memory hugetlb pids misc
> /sys/fs/cgroup # cat cgroup.subtree_control # No controllers by default
> /sys/fs/cgroup # echo +cpu +memory > cgroup.subtree_control
> /sys/fs/cgroup # cat cgroup.subtree_control
> cpu memory                   # cpu and memory enabled in /sys/fs/cgroup
> /sys/fs/cgroup # mkdir foo_cgrp
> /sys/fs/cgroup # cd foo_cgrp/
> /sys/fs/cgroup/foo_cgrp # cat cgroup.controllers
> cpu memory                   # cpu and memory available in 'foo_cgrp'
> /sys/fs/cgroup/foo_cgrp # cat cgroup.subtree_control  # empty by default
> /sys/fs/cgroup/foo_cgrp # ls
> cgroup.controllers      cpu.max.burst           memory.numa_stat
> cgroup.events           cpu.pressure            memory.oom.group
> cgroup.freeze           cpu.stat                memory.peak
> cgroup.kill             cpu.stat.local          memory.pressure
> cgroup.max.depth        cpu.weight              memory.reclaim
> cgroup.max.descendants  cpu.weight.nice         memory.stat
> cgroup.pressure         io.pressure             memory.swap.current
> cgroup.procs            memory.current          memory.swap.events
> cgroup.stat             memory.events           memory.swap.high
> cgroup.subtree_control  memory.events.local     memory.swap.max
> cgroup.threads          memory.high             memory.swap.peak
> cgroup.type             memory.low              memory.zswap.current
> cpu.idle                memory.max              memory.zswap.max
> cpu.max                 memory.min              memory.zswap.writeback
>
> Once a controller is available in a cgroup it can be used to resource
> control processes of the cgroup.
>
> Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
> ---
>   Documentation/admin-guide/cgroup-v2.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> index 1a16ce68a4d7..0e1686511c45 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -438,8 +438,8 @@ Controlling Controllers
>   Enabling and Disabling
>   ~~~~~~~~~~~~~~~~~~~~~
>   
> -Each cgroup has a "cgroup.controllers" file which lists all
> -controllers available for the cgroup to enable::
> +Each cgroup has a cgroup.controllers file, which lists all the controllers
> +available for that cgroup and which can be enabled for its children.

I believe breaking the sentence into two separate components is actually 
making it less correct. There are implicit controllers that are always 
enabled and do not show up in cgroup.controllers. Prime examples are 
perf_event and freezer. IOW, only controllers that are available and 
need to be explicitly enabled will show up.

Cheers,
Longman

