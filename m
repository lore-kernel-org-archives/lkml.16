Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9B426A0F4
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748351513; cv=none; b=nr9eYoaDXWy13HDoJUvmYSPUJVCR2SHYIqH9/GNIhz23eENkXEgRoy0a7knOaRbdgEZAFItCpiQzOQIc7dv/VEDFpYwSErfkUDRe5IE4pkbPnGKraU9tEaf4lCW2usaYjSPV3kG04aothFMo/0yW+4EPBK0UyhXahiNR4NQnMn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748351513; c=relaxed/simple;
	bh=SiMzsb1VfHm5J4WodUT7EnpYMmNCsCwdyj3bk/ztlDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BjL4SiJau6/gQO6O/yhyL2sLJ3l+qdHYljl4NeooG/WuVq+ZRuzz1WyjD35kmipdAUVhi9J7qpcs5OZDrQ+GZdP7lIG4bW4FHMmGZzBiT6hL4biGjZsKoCBE54m9Jso8BAZte2NOOVB4LlsGJayjGj7eXBnjNw0dnekHu71Nzxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MVviRJxl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MVviRJxl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748351510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BzTHRlzQzEXlYnuCuknzHPGDh3G3DQ1P973u+hYfSqw=;
	b=MVviRJxlKVS+z3YV31BTK+fXcvZSHxRhGo8uzWYB8O/9h73x9kjqJEjQHO2Wy5e8M8gJCT
	IWme3GFgogS1/V7RjNAGQ9OyHZHDES8qtATOKbTNnYn5SNdBnLfRU4g9u9DIPBBsdTl4rQ
	MPTGFAKXhzDswtNRq6laHoGeiryhhUs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-eB8TPnLyNLGZCybrafh7dQ-1; Tue, 27 May 2025 09:11:49 -0400
X-MC-Unique: eB8TPnLyNLGZCybrafh7dQ-1
X-Mimecast-MFC-AGG-ID: eB8TPnLyNLGZCybrafh7dQ_1748351508
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4d81f7adeso1487339f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748351508; x=1748956308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzTHRlzQzEXlYnuCuknzHPGDh3G3DQ1P973u+hYfSqw=;
        b=fs0TqFOrwtFYbObZGRRvsE4ey5QBP2MngCSqqSg/6TR7PaStQN3wu3bvYh84dIZqgS
         F3YSFSvf9XPZngP8DIZd3oT2kxDj0AgtMIauYnl19C9B5cJu6Mqa8ZEQOPEC3KTp3QNs
         D4dUG4ZgZX47Qzr02g2Jcf+TOJPEfq9qcBctsBsBsrHVvTAML3TOvDp0LYT5JNhl9FrG
         03DiJTw9gVFBuQMVHJmmS9eYHLNcfRXhlrSa3UFAel+MlgOrbABl/5xffSEri25Ox8Uk
         wlgOb8lfTmgOro9iJXztlT3JjSkKLdpP4IxT5QTcYYBIgaAVWq2rvKLJ1Y1k+8kzcKrc
         16+g==
X-Forwarded-Encrypted: i=1; AJvYcCVsvpsMNabuR02wmglybDR01pn4z3kusaucRekaip7BFExriw89Ia5jY4Wnch0lRddcLGBdnt2zExGsUDA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBx7dEKjChA9qVdWGF2QrbcMwq/4xHkf9kQlKmhRniVDnP3Ao8
	3aUiTOklU/TWjhNPxy2vbt7L45iKBVFKaNQavoQx5OG2KsVR2m2I0rIsuoosjnMGZvC/0DeEOin
	Sam3XrJUjAbZ1wjq1Rwbc1/vqRxfXw4aL2dlfXoRhRGJcfFxaFhnX0p3dsEsl7p5brA==
X-Gm-Gg: ASbGncv7gOdU6I7475ZhTws18JR7FNr8JQkL3opiJoMksg3c9BrevD4jwox3iad8X0I
	eJqgfKQBdeuQqOH/FXzmZLxuFJ/yoiQTNV0Ox6TGYYbw5xZLP1WA7GnUHWlsWWaXRQf15gNckuT
	jQK/mmQfVOHyOAhtGww7acrDRyw0w95F3ZXvmE5TuCYydVFvzVgj5F8d4laWR1f0uDYIWDd76dX
	UDJlu6CmRFgH5MrIe29T8OXNhAgKxyYOOByODdF6y2NJ+082HCFDk1+CXO/uQSIIBCpLm8ukMcI
	Sn4K5i/Grp0glbhNaoXmBMDDEDf3n4O4qvvK8V1vFA==
X-Received: by 2002:a5d:5846:0:b0:3a4:dd63:4ad8 with SMTP id ffacd0b85a97d-3a4dd634d63mr5309801f8f.20.1748351508248;
        Tue, 27 May 2025 06:11:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGwzfscWQod+IIooOxsiygxTezSJ1KyM1UcawxlKgs8fMFxR+Ub74ZW0DStChnY332ZRPPxQ==
X-Received: by 2002:a5d:5846:0:b0:3a4:dd63:4ad8 with SMTP id ffacd0b85a97d-3a4dd634d63mr5309755f8f.20.1748351507735;
        Tue, 27 May 2025 06:11:47 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.57.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4e57da10csm507739f8f.22.2025.05.27.06.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 06:11:46 -0700 (PDT)
Date: Tue, 27 May 2025 15:11:45 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shinya Takumi <shinya.takumi@sony.com>
Subject: Re: [PATCH] sched_deadline, docs: add affinity setting with cgroup2
 cpuset controller
Message-ID: <aDW6EckuCFTZfPZ8@jlelli-thinkpadt14gen4.remote.csb>
References: <20250522-sched-deadline-cpu-affinity-v1-1-2172c683acac@sony.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522-sched-deadline-cpu-affinity-v1-1-2172c683acac@sony.com>

Hello!

On 22/05/25 17:06, Shashank Balaji wrote:
> Setting the cpu affinity mask of a SCHED_DEADLINE process using the cgroup v1
> cpuset controller is already detailed. Add similar information for cgroup v2's
> cpuset controller.

Thanks a lot for working on this. Really appreaciated.

> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> ---
>  Documentation/scheduler/sched-deadline.rst | 29 +++++++++++++++++++++++------
>  1 file changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/scheduler/sched-deadline.rst b/Documentation/scheduler/sched-deadline.rst
> index a727827b8dd52710f880c2b92d3a8224c259873c..e3d7968ff6c3c43f87e249dbcb309619dbd616bf 100644
> --- a/Documentation/scheduler/sched-deadline.rst
> +++ b/Documentation/scheduler/sched-deadline.rst
> @@ -20,7 +20,8 @@ Deadline Task Scheduling
>        4.3 Default behavior
>        4.4 Behavior of sched_yield()
>      5. Tasks CPU affinity
> -      5.1 SCHED_DEADLINE and cpusets HOWTO
> +      5.1 Using cgroup v1 cpuset controller
> +      5.2 Using cgroup v2 cpuset controller
>      6. Future plans
>      A. Test suite
>      B. Minimal main()
> @@ -671,12 +672,15 @@ Deadline Task Scheduling
>  5. Tasks CPU affinity
>  =====================
>  
> - -deadline tasks cannot have an affinity mask smaller that the entire
> - root_domain they are created on. However, affinities can be specified
> - through the cpuset facility (Documentation/admin-guide/cgroup-v1/cpusets.rst).
> + Deadline tasks cannot have a cpu affinity mask smaller than the root domain they
> + are created on. So, using ``sched_setaffinity(2)`` won't work. Instead, the
> + the deadline task should be created in a restricted root domain. This can be
> + done using the cpuset controller of either cgroup v1 (deprecated) or cgroup v2.
> + See :ref:`Documentation/admin-guide/cgroup-v1/cpusets.rst <cpusets>` and
> + :ref:`Documentation/admin-guide/cgroup-v2.rst <cgroup-v2>` for more information.
>  
> -5.1 SCHED_DEADLINE and cpusets HOWTO
> -------------------------------------
> +5.1 Using cgroup v1 cpuset controller
> +-------------------------------------
>  
>   An example of a simple configuration (pin a -deadline task to CPU0)
>   follows (rt-app is used to create a -deadline task)::
> @@ -695,6 +699,19 @@ Deadline Task Scheduling
>     rt-app -t 100000:10000:d:0 -D5 # it is now actually superfluous to specify
>  				  # task affinity
>  
> +5.2 Using cgroup v2 cpuset controller
> +-------------------------------------
> +
> + Assuming the cgroup v2 root is mounted at ``/sys/fs/cgroup``.
> +
> +   cd /sys/fs/cgroup
> +   echo '+cpuset' > cgroup.subtree_control
> +   mkdir deadline_group
> +   echo 0 > deadline_group/cpuset.cpus
> +   echo 'root' > deadline_group/cpuset.cpus.partition
> +   echo $$ > deadline_group/cgroup.procs
> +   rt-app -t 100000:10000:d:0 -D5

Sadly, the example with cgroup v1 was made at a time when rt-app still
supported command line parameters like the above. I believe nowadays
that is not the case anymore and one needs to create a json file
describing the task to run it with rt-app.

I would say we should update both examples to use something a little
more generic, e.g.,

# chrt --deadline --sched-runtime 10000000 --sched-period 100000000 0 yes >/dev/null &

What do you think?

Best,
Juri

