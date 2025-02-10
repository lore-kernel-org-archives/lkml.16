Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9551F4629
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739207355; cv=none; b=N05ZF1ia7tYXR2rYmBPqUO2Eq0uxXBqxsaC44h1m1kxVCkHL2zIZA9rbgEbpi8geDG0sWJ9G23wzwbsGR3F6Xm4/FprwcNfPgqFypkbCZCmFxjETXW1I5iUNIxiX7GbKE/qyUzMS/wDxkorBnf94/YJ7f6E4NKQJRnNZsNqvxss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739207355; c=relaxed/simple;
	bh=HOuWt82jq7ygkKCFtxmgpdL6DwPRgmClVPVz8aUf/uA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yy08d6OsXSVfVmP2UXBMjeHzNx85cbgEi3ZVnfyn73ywZtV1cAFwAC6oJjOdhB/LXBQqMjrqYrTywBV55uj/uBys9HPwT5zAb9UUamgjHRDGphrybvi+Jnj8Lk1bZ63X2Y7POf2WFZvQIxMWSobkGEthUC2keVMOACrdZZHkZ64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F72pYrAW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F72pYrAW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739207352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=75DhKP5p4pHL8SboeTssQDPO6tHFPAizpkaf2emg0Pc=;
	b=F72pYrAW2GlBme0J0YKuphTSgv/JhneMtkqwiUOBGnN1XnqKEWJ+jY7oKLfqIf0DmTBuO1
	iKepXOaOa3CGXDNhupQNRTPCI5UfNVPOG/wd6+Ss/rPnXH7pvx421Iy8osYe5vJyEStP0Y
	ACed3VmKk09JA42pS9jul0vcpXITUXw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-x90iQ2tIMi-NarcQoAqFrQ-1; Mon, 10 Feb 2025 12:09:10 -0500
X-MC-Unique: x90iQ2tIMi-NarcQoAqFrQ-1
X-Mimecast-MFC-AGG-ID: x90iQ2tIMi-NarcQoAqFrQ
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38dc56ef418so1631465f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:09:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739207350; x=1739812150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75DhKP5p4pHL8SboeTssQDPO6tHFPAizpkaf2emg0Pc=;
        b=p7752W4x6DrjK4ALnaMcNvU3+CAR53gqfyBGQem0fMZBoui/gE4C1iINrq3PmBcK0v
         whA9Um4DfUcBdR+ACQV818dWvveKsIKtJA66Gd+XttsNmyU+M1A+20Bd9f5PAngL0Euh
         LvDr/Amd1mq6GmnoO+uX/tGGUHVIF3KhWpYkGA3kXE4Uc8c4//OInNUkZJ7S6AUEtTfe
         t+5tCqVZNZrBbocs2gK8J/ozV1lSKvXbO6U5YF+aLWuikONE32ehJvCnBjwClZIMl/JV
         u5YoC5D9FwpGn8IJ9w9GrP47n9ArQ9U8s2q7FJoV4irB/tQt1fCXi0NM06Nxd6n3DPs4
         yDCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXa76vrajlNYyd38njux7ms8tyFQy6yKCl/nrQ51mUqVvxJK4wiAAmy8yuB/9dzBuanAgSzkhlO0exXSjU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9nlppraHalBcHPqSpLs+NPcJ0R5rofPgmKqZK+iYpEfGIhqVE
	VcR3aKG+t1PNfnZVnYlBGDzuK5zv+EPsz7fAyAH0ukEqxYhbfwM1qx/qOfNhdRzIy67DZ0iJCVG
	gB1IQYEKqsVxMIgKG5i0uR3gcE2NRdtXAkow828hfawMJjwBf6SNf4RWX1I8ZnA==
X-Gm-Gg: ASbGncsL40A+X2QCKedNlEuo5zfYKRnMLfAxd6S9mEO+On1clSvPxCRm7WpmrqumCYz
	FISh8BbNLKN5UxvSGu2u0GOLPMa6+X5fEomKHfodFYOrvhVnDiEuTT4crtOra8VG/1CFaMkiMel
	4acMhSyTeL05UIKQ4mWATgvxY3IkdmokGnpf+gQCOqDorV2bbq0NLKbcLgtCi/i4E2+pj/wWMpd
	tprBQ6zoJiWSG8Q+/pZhAYYjXJ79xKxkTiuwTyIEcKTsx0MzwZ03GzXMvVN2JL+sNL7xeRFWw6M
	QJ0FlljDKXdqgxjJ33+/jiJWCjtHqO4+XQ==
X-Received: by 2002:a05:6000:1847:b0:38d:d18e:8811 with SMTP id ffacd0b85a97d-38dd18e88ccmr8244811f8f.25.1739207349742;
        Mon, 10 Feb 2025 09:09:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4iWM6+kcMn/xG5VIs8/39JBzO5XwyaWmPrE9jrgtQyQ7EiaBt4luvYYTOSu7zPwW07wtZug==
X-Received: by 2002:a05:6000:1847:b0:38d:d18e:8811 with SMTP id ffacd0b85a97d-38dd18e88ccmr8244771f8f.25.1739207349294;
        Mon, 10 Feb 2025 09:09:09 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.34.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d964c7csm185123115e9.17.2025.02.10.09.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 09:09:08 -0800 (PST)
Date: Mon, 10 Feb 2025 18:09:05 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Thierry Reding <treding@nvidia.com>,
	Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Koutny <mkoutny@suse.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Phil Auld <pauld@redhat.com>, Qais Yousef <qyousef@layalina.io>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"Joel Fernandes (Google)" <joel@joelfernandes.org>,
	Suleiman Souhlal <suleiman@google.com>,
	Aashish Sharma <shraash@google.com>,
	Shin Kawamura <kawasin@google.com>,
	Vineeth Remanan Pillai <vineeth@bitbyteword.org>,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2 3/2] sched/deadline: Check bandwidth overflow earlier
 for hotplug
Message-ID: <Z6oysfyRKM_eUHlj@jlelli-thinkpadt14gen4.remote.csb>
References: <Z4kr7xq7tysrKGoR@jlelli-thinkpadt14gen4.remote.csb>
 <cfcea236-5b4c-4037-a6f5-267c4c04ad3c@nvidia.com>
 <Z6MLAX_TKowbmdS1@jlelli-thinkpadt14gen4.remote.csb>
 <Z6M5fQB9P1_bDF7A@jlelli-thinkpadt14gen4.remote.csb>
 <8572b3bc-46ec-4180-ba55-aa6b9ab7502b@nvidia.com>
 <Z6SA-1Eyr1zDTZDZ@jlelli-thinkpadt14gen4.remote.csb>
 <a305f53d-44d4-4d7a-8909-6a63ec18a04b@nvidia.com>
 <5a36a2e8-bd78-4875-9b9e-814468ca6692@arm.com>
 <db800694-84f7-443c-979f-3097caaa1982@nvidia.com>
 <8ff19556-a656-4f11-a10c-6f9b92ec9cea@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ff19556-a656-4f11-a10c-6f9b92ec9cea@arm.com>

Hi Christian,

Thanks for taking a look as well.

On 07/02/25 15:55, Christian Loehle wrote:
> On 2/7/25 14:04, Jon Hunter wrote:
> > 
> > 
> > On 07/02/2025 13:38, Dietmar Eggemann wrote:
> >> On 07/02/2025 11:38, Jon Hunter wrote:
> >>>
> >>> On 06/02/2025 09:29, Juri Lelli wrote:
> >>>> On 05/02/25 16:56, Jon Hunter wrote:
> >>>>
> >>>> ...
> >>>>
> >>>>> Thanks! That did make it easier :-)
> >>>>>
> >>>>> Here is what I see ...
> >>>>
> >>>> Thanks!
> >>>>
> >>>> Still different from what I can repro over here, so, unfortunately, I
> >>>> had to add additional debug printks. Pushed to the same branch/repo.
> >>>>
> >>>> Could I ask for another run with it? Please also share the complete
> >>>> dmesg from boot, as I would need to check debug output when CPUs are
> >>>> first onlined.
> >>
> >> So you have a system with 2 big and 4 LITTLE CPUs (Denver0 Denver1 A57_0
> >> A57_1 A57_2 A57_3) in one MC sched domain and (Denver1 and A57_0) are
> >> isol CPUs?
> > 
> > I believe that 1-2 are the denvers (even thought they are listed as 0-1 in device-tree).
> 
> Interesting, I have yet to reproduce this with equal capacities in isolcpus.
> Maybe I didn't try hard enough yet.
> 
> > 
> >> This should be easy to set up for me on my Juno-r0 [A53 A57 A57 A53 A53 A53]
> > 
> > Yes I think it is similar to this.
> > 
> > Thanks!
> > Jon
> > 
> 
> I could reproduce that on a different LLLLbb with isolcpus=3,4 (Lb) and
> the offlining order:
> echo 0 > /sys/devices/system/cpu/cpu5/online
> echo 0 > /sys/devices/system/cpu/cpu1/online
> echo 0 > /sys/devices/system/cpu/cpu3/online
> echo 0 > /sys/devices/system/cpu/cpu2/online
> echo 0 > /sys/devices/system/cpu/cpu4/online
> 
> while the following offlining order succeeds:
> echo 0 > /sys/devices/system/cpu/cpu5/online
> echo 0 > /sys/devices/system/cpu/cpu4/online
> echo 0 > /sys/devices/system/cpu/cpu1/online
> echo 0 > /sys/devices/system/cpu/cpu2/online
> echo 0 > /sys/devices/system/cpu/cpu3/online
> (Both offline an isolcpus last, both have CPU0 online)
> 
> The issue only triggers with sugov DL threads (I guess that's obvious, but
> just to mention it).

It wasn't obvious to me at first :). So thanks for confirming.

> I'll investigate some more later but wanted to share for now.

So, problem actually is that I am not yet sure what we should do with
sugovs' bandwidth wrt root domain accounting. W/o isolation it's all
good, as it gets accounted for correctly on the dynamic domains sugov
tasks can run on. But with isolation and sugov affected_cpus that cross
isolation domains (e.g., one BIG one little), we can get into troubles
not knowing if sugov contribution should fall on the DEF or DYN domain.

Hummm, need to think more about it.

Thanks,
Juri

