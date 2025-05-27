Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7282798E6
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748360859; cv=none; b=CmKOoGApBc9QvZNmXL/KDfNToJmSUfBDfW2akGtmHt75GW2Y5Lt+H6zCZau33CVlV0Hr1w7kEG9HwuLKIWQNTD4vF8JcHYPSxErh8w3Nm53sVIBb6tM/GnYxARr1JlDddcurGLmsv9lxUzDobz7VCpe3lRvo33+PVb6DXXOa7sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748360859; c=relaxed/simple;
	bh=fahTupJYCgYuxYUPs+FyITf1Up7TsMqeiauXjHxmIJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lsjsGPRw2joC6iU17/txjvLcaIAneT3EkGTHL0wZ0dKIBxauiXRaAkdEwN03x/f58y54wtAuAc2umPQt0OWFiYlREuSpKAQtd/e2vNYMFGeNlGEIAvfV0Lt5bRj92zVTrRosUTzwxGSAoon0vqd0aoateDHcBDTJfnvTYybUiWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAHT3qKO; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAHT3qKO"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7376e311086so3306234b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748360857; x=1748965657; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5HJ+G4f3UGDUSs05RV4nd6Vun8C+JN7MZzygPkSv0I4=;
        b=nAHT3qKOPvwBRJT0QgR/OvloJnk1okXGP9g89zGWBmWbFmzlEoER4j8WRW6hD4Brez
         hfbemdGaiE4BQqOqESOHSmGoSKNHC5kOGDmR9RW12KcAI4g4QJ17y42rGqQtAtIFRYk/
         GqOlw9o/VwX1KPDPkUT2MqnGVhrB8YbXGeCAeC0Gp4giwJHf91wKadQc5YOaoIr3q4Mh
         10SPOOwqlMecjBUZpDm0VZkTYPRqF22FctkNHVFzPJTYY+gcSvvpM/eXReMzAgL3iyYb
         jvx1tNm5s/NFDprNYIjFkYhW10TBvuRQIjprxmQxK70dNPssliNq5IBLx9tOOlbdouVU
         wg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748360857; x=1748965657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HJ+G4f3UGDUSs05RV4nd6Vun8C+JN7MZzygPkSv0I4=;
        b=lTX9JmuFF1Sk0bGt8i0N4weWujiDzafG3lOqgmNAQ9zDNei4htT5UvbEE96cMTFp4Q
         dCkbNYW+rW53NhY0KmmfuKmTu8I4FLogy4eNUYsBK+Jg/5ZRTicC7xgF5Vtq1PTXjwyP
         DHII6gktwB1ZEJqSaSKBqGNuceDyFsrUSmroOjrX7JPzxKQPrNdaJlnkhukoRL0jZvnw
         OVrYCZuQ3JmrrwDPpbGVhB1un2MAn8aFkELwn12aqySJIfzqY1P7cgnBM+5in92kzzSd
         PcB5MJF7sCTZAk+ppi9+Z4Du/7LzzED2i/7bB+nmZn+vx5mFR1VoGxtar1u37d4OD3dP
         7oQw==
X-Forwarded-Encrypted: i=1; AJvYcCWs6MNsNzhmyA8xUN1I4ZzkLCYacz6rNFUVbEGBBYyaPTnkyfygwYMFKA9zjhnGAHt4ozHLsRTl+/qJZww=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuJiygX1kMSZrV+aUEC+58x5R+2mLMCHfwePaykGw9agVJWOQN
	6xsodxhjdzKogDWdtTVehrru1cuPO+4d0sY89j4jfKdyJNtWCRJhW23v
X-Gm-Gg: ASbGncty1ynbhjf6GQfhIAFEUfoDF7FsGVkPRnTs7Yrt6skWPFO/Ul0hlZaaVvDe3AM
	EawARIForbeeeEc3xKiWf5nKrk8jv7sWZ71VrS/sJ8dXSQL1wC/9j9yKsg0WbinTrMvWzhUBbjh
	oW/uCXibSjI8csM8F4duhk8cBxLaorRX7GBZjTFZjrlCBxpxpsiBOA8sCo3BeC+wgEzjth2mGdy
	8r5Z6Bj0mpo1Jmn6B8joOZSYqmhhbuPILFNvpql5Lk/Fp/NC/UC+yzP4IafdSZiSB7w+dKIWV0b
	jgz4I7rlLGlOOzi77irAxtKC/3Hx7AyNs/Hc8Qam7+KpMqRlM7++F1Rf5fnThw==
X-Google-Smtp-Source: AGHT+IFof6u37ajHJRminVcIav224Mknf5nKiVqYH/LMS0EN2R3bddSei8ryn1cvxPPvxwDMFnZqPg==
X-Received: by 2002:a05:6a00:acb:b0:740:5927:bb8b with SMTP id d2e1a72fcca58-745fdac66f8mr19817158b3a.0.1748360857307;
        Tue, 27 May 2025 08:47:37 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26ecfc85e9sm18602758a12.11.2025.05.27.08.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 08:47:36 -0700 (PDT)
Date: Tue, 27 May 2025 11:47:34 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>, mingo@redhat.com,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	tglx@linutronix.de, maddy@linux.ibm.com, vschneid@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, jstultz@google.com,
	kprateek.nayak@amd.com, huschle@linux.ibm.com, srikar@linux.ibm.com,
	linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk
Subject: Re: [RFC PATCH 0/5] sched: cpu parked and push current task mechanism
Message-ID: <aDXelhCbIvKjZyqG@yury>
References: <20250523181448.3777233-1-sshegde@linux.ibm.com>
 <20250527151020.GV24938@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527151020.GV24938@noisy.programming.kicks-ass.net>

On Tue, May 27, 2025 at 05:10:20PM +0200, Peter Zijlstra wrote:
> On Fri, May 23, 2025 at 11:44:43PM +0530, Shrikanth Hegde wrote:
> > In a para-virtualised environment, there could be multiple
> > overcommitted VMs. i.e sum of virtual CPUs(vCPU) > physical CPU(pCPU). 
> > When all such VMs request for cpu cycles at the same, it is not possible
> > to serve all of them. This leads to VM level preemptions and hence the
> > steal time. 
> > 
> > Bring the notion of CPU parked state which implies underlying pCPU may
> > not be available for use at this time. This means it is better to avoid
> > this vCPU. So when a CPU is marked as parked, one should vacate it as
> > soon as it can. So it is going to dynamic at runtime and can change
> > often.
> 
> You've lost me here already. Why would pCPU not be available? Simply
> because it is running another vCPU? I would say this means the pCPU is
> available, its just doing something else.
> 
> Not available to me means it is going offline or something like that.
> 
> > In general, task level preemption(driven by VM) is less expensive than VM
> > level preemption(driven by hypervisor). So pack to less CPUs helps to
> > improve the overall workload throughput/latency. 
> 
> This seems to suggest you're 'parking' vCPUs, while above you seemed to
> suggest pCPU. More confusion.
> 
> > cpu parking and need for cpu parking has been explained here as well [1]. Much
> > of the context explained in the cover letter there applies to this
> > problem context as well. 
> > [1]: https://lore.kernel.org/all/20250512115325.30022-1-huschle@linux.ibm.com/
> 
> Yeah, totally not following any of that either :/
> 
> 
> Mostly I have only confusion and no idea what you're actually wanting to
> do.

My wild guess is that the idea is to not preempt the pCPU while running
a particular vCPU workload. But I agree, this should all be reworded and
explained better. I didn't understand this, either.

Thanks,
YUry
