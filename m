Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1272DA762
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750153782; cv=none; b=YkfSItkNE+qYeaTgp2Z6nxQXH4W52iqJDILYZInSg0kZM/nMacH1KGivCJCroaqBFfsv7IyO5om+FKyQFd5AXCiqCFKr778WN1xwG2efeqcb6ehxiQEKJ0ExihKlHkEqjSYR97jaBZ71cODnIlTEk+1kWRVVVAJsSj252hy6RB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750153782; c=relaxed/simple;
	bh=GWDev21kMk2PfZZCQNtZQ/tufdRgAISEjZGNO6cmMps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AIsMY7Q0nLO6ybt/WIdzTtjlhEcqaSjROSx+DvmoeM1JXMEVxgtQbmwNM3gjPpRTQgKd/QzCle44KwpJm4DoXLmUMtmJxrxfMB8IjnqjyCley1DkvUc5B75q9vl9H63aWhGZtErTuPGnhRqG2AQrl8v+TQzLH2L3mH0JVBZR9Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UEoIk8Ia; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UEoIk8Ia"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-453426170b6so15828475e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750153779; x=1750758579; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GWDev21kMk2PfZZCQNtZQ/tufdRgAISEjZGNO6cmMps=;
        b=UEoIk8IaMVyqXUJoXExQvZAFuq0Bzk0dnMQBTKAZwHITzOaASrwFmG4VH4MujPbKXY
         QB5hoN9mR7LtKIaFOmAAOs9/+U29dK4811TnAATjn9I6yag4STMQlYfJgvMvGaqDiv1t
         ZoSp63z5tj8qy8yFzS6RmhNwxRO+qTWL+pPaSe6D8HcMorFj2y3gga1nmn+9S7Tplb7a
         3M4rbePaa0TO3W9I/2A8i+h7jvDjHpE+30YRbIM3VSnJvx6xu7/IxteiZY7WR5SOIRAp
         xQ4KsZjlgpE4I64uc1MvVg97UFd3MlrccODGFryWG8oA87FFnpdcqeHUMoH/NW7H+stU
         AOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153779; x=1750758579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWDev21kMk2PfZZCQNtZQ/tufdRgAISEjZGNO6cmMps=;
        b=b3HheMthFMsv5bUFryWg2IOgDIa+QImRoFoWTg7uYMfzdnu+iwtudeM/XG1a0D2hfT
         d2c5Zduu7+vjgIcVjWouw8Fy1o01lUgLR/8ypHEogCQvLXDLEAD5ubD8+4rFYPqR3OMc
         3CVkeDDYLflilHyYUnOllQOsEZRb6rJzbp04DSIokZFNp+w10TJhl7tGhwIAPxylaI0t
         ITf4xtNm7FXYD+/kQcfRi4/VxgVXxp0KsXwgxaynBKPcxL++yCH7EVDLcweqTV4hF95B
         yKYUfywCuGTJXEzEbLa0ITk9T+cLbakavSri5FuGANCRnSyUpBy8p93IU/VU0CCBVeYC
         z9hw==
X-Gm-Message-State: AOJu0YzO6ZI4qsLM8RTbwB2jOuZadbwfM+vGPtvcwcxwLLjSB2DMSyjB
	TkixYilsd3gqqLPR4U+AhwjS8gRYsUtAD3A/ry6SHienmfrQwfOxoy+PQtUmUAiM+gm7fJxyX53
	QjUNJqGU=
X-Gm-Gg: ASbGncuffXTm0RaiEY2TRvkH0YwY/2hjg7qJSoMwB+4LUUUa8Pai6In9QogN4oPRLbn
	CQMSy8IfdGYYN6eIkKPxwdOIfrLsnR/39mYy0YMFB7Mdt7Hzc1wauHzxairN4xgDHA7RCT8OEx6
	v9mg2kvv9vC5Ek/3I3YVvXWGVfaWgklTg3Ytt00TiTHVZLzTFLGqVw/eFBh7aFr6rMTXNOUXSLV
	v4zflKHAldMtCvP+g0o45fvh/qvv2Z3rpdwt2JBo8WTlNpVxfo83Yj7Uj2u4Xvil98m9OF1HFKZ
	LjBoO5qswHVGeHTXEj+2Yp+iqckSozO7qfhelcG5VbFlNC5o2KHvn+I3ysLSIESU
X-Google-Smtp-Source: AGHT+IEOvxWVDOlNZWXip6ImB2ddbE7O2B8u/+uYGYg94jAlO+CMlOLLaVPrqILnw9oEr4gJgo9dxQ==
X-Received: by 2002:a05:6000:2504:b0:3a4:f7ae:77c9 with SMTP id ffacd0b85a97d-3a5723840d3mr10086383f8f.5.1750153778998;
        Tue, 17 Jun 2025 02:49:38 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a57b2bfc69sm7527269f8f.76.2025.06.17.02.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:49:38 -0700 (PDT)
Date: Tue, 17 Jun 2025 11:49:36 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Tiffany Yang <ynaffit@google.com>
Cc: linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	kernel-team@android.com, John Stultz <jstultz@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Chen Ridong <chenridong@huawei.com>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>
Subject: Re: [RFC PATCH] cgroup: Track time in cgroup v2 freezer
Message-ID: <gn6xiuqczaoiepdczg364cj46riiskvqwgvyaawbb3bpaybaw4@5iiohkyscrek>
References: <20250603224304.3198729-3-ynaffit@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dj6i5wtbfqaemcxf"
Content-Disposition: inline
In-Reply-To: <20250603224304.3198729-3-ynaffit@google.com>


--dj6i5wtbfqaemcxf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [RFC PATCH] cgroup: Track time in cgroup v2 freezer
MIME-Version: 1.0

Hello.

On Tue, Jun 03, 2025 at 10:43:05PM +0000, Tiffany Yang <ynaffit@google.com> wrote:
> The cgroup v2 freezer controller allows user processes to be dynamically
> added to and removed from an interruptible frozen state from
> userspace.

Beware of freezing by migration vs freezing by cgroup attribute change.
The latter is primary design of cgroup v2, the former is "only" for
consistency.

> This feature is helpful for application management, as it
> allows background tasks to be frozen to prevent them from being
> scheduled or otherwise contending with foreground tasks for resources.

> Still, applications are usually unaware of their having been placed in
> the freezer cgroup, so any watchdog timers they may have set will fire
> when they exit. To address this problem, I propose tracking the per-task
> frozen time and exposing it to userland via procfs.

But the watchdog fires rightfully when the application does not run,
doesn't it?
It should be responsibility of the "freezing agent" to prepare or notify
the application about expected latencies.

> but the main focus in this initial submission is establishing the
> right UAPI for this accounting information.

/proc/<pid>/cgroup_v2_freezer_time_frozen looks quite extraordinary with
other similar metrics, my first thought would be a field in
/proc/<pid>/stat (or track it per cgroup as Tejun suggests).

Could you please primarily explain why the application itself should
care about the frozen time (and not other causes of delay)?

Thanks,
Michal

--dj6i5wtbfqaemcxf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaFE6LAAKCRB+PQLnlNv4
CI0vAQC5P5WI9MTxhoy5l1ZfngNl+iV61djqa8dUqqxkexlC4QEA+Gqby40dN6Q/
BPa8zfglVJFybFxTO++SbIEs6CQkXQU=
=mtgT
-----END PGP SIGNATURE-----

--dj6i5wtbfqaemcxf--
