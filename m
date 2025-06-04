Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052F820E03C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 19:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749065973; cv=none; b=J5zKs3WpJhfunsWbjc8qi4M+Iz24Z7pRGjX7vgl/un204p5UFHVwqGydhzqiJZkEWZDN0HFZ/BEsT8qWpBfjMErpyYZ8m2dUi1dm1MQ+LJ9DJftjAzc0zdoqWNyzjWojDk0w0UmWk/lj6eCVkAyRJciL1McwCrSiqftghFip8Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749065973; c=relaxed/simple;
	bh=uqrrh5XKhj0JhJlvb7JWbUd5mMKx4NAS1ZTa4avFBd8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NPwKP62j80iX34P2uswSuo1PuI5tZ+qVWseV+2bmyH1JT7SLJlVe1mscbb/HluLBHyTAMdA6Ju6hbWoRMfWDLiU1ImLxDs43RdpV5V1mVMHs3JJeH8+dr4hphWNkJr5+1Qc26lhHqb0McArWWVFn9alnc5sdPMIT6xDUEZeTu/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W5RvQoip; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W5RvQoip"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-747fc77bb2aso250687b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 12:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749065971; x=1749670771; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WSxWqox5bdiWzZ5tn/4s8/4uvycqiAbImkblkNnSipg=;
        b=W5RvQoipny5k8mRsT1J6bTVWx1MFL8QGoOk0sehkgeBzzAty+hy+//w+g9R30otO0H
         7r44Y5FqsyLzz8ixUYh0I6KEc+NH7eXP5jKrlHGv0E1TjKVow+NHJtxEk6ijN2u6jMFm
         nMU6Jbw5hPKxopJmjjoBUmTzh1y1IpGAqiGvFeYOLdDUJ8Zpt8BCO1voaoqn1d2KGnjw
         taHHoPmCX5+MKWj9Ipshl4u9MvcY41XyqiM+XWdzHApm/NIzc747ZjT/eVMujojHQ4nV
         Wb8CjC2VY/sfLcg/t5Dg65lNrzVCRzoKKruW77XNzYoRQHTTVldQsG9NLqCEIUKlat3b
         KWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749065971; x=1749670771;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSxWqox5bdiWzZ5tn/4s8/4uvycqiAbImkblkNnSipg=;
        b=ON7V3cUqdV5mNh1Uz4eFzg9vhxYqReLEn2g8zOjajubD5VcpLOqPWZJLXJlo6psxOQ
         4Od/ATCCulw+1mn+RY0mY0oSk2TsifoQKHG1XxGcmpw0Op1Xuprj2D78SefWcbQa9Uw2
         Wt26qB1NcwGTjtMvu7KELXdyi7O/khC2NM9B2TKVaKwlbvQxdUj8rY0BIC9X15fM0uel
         vGrML4Wh3uPKQGVgg1tdVTdrTEGfBrpID/I+XcDAbX6K1DY7hFuQ96c4rf6O61XMZ1n3
         UreyM13PCq6Ag7zArzkrLEUFIHi75T6r73iGoB0LpeW5rixmqo/RRvsBvDQdKvoKIt1h
         56LQ==
X-Gm-Message-State: AOJu0Yz01BZOLTiFoekPqaZY9n+I/NAdk4AG3InLYMobK+Ps7Bu2BVOa
	MlW/F1Y+tG8xGxUxbeh+wdAOG+zBilATY+2Wuv07qFUbnDUwZT90+BwjKCUOT9e8rg==
X-Gm-Gg: ASbGnctTJljJ9u67s4mBO7jX35p+MrNrmXogeQj1Xmhv3p7xwOlarwBEsqj0vm1KOUh
	zFQoirzHWIA32Bm2fyBPBJTlEJuEM0GpolQSGna7i+Wah4tFkV7uwtYqJRsVI3zIuqkUp6TOLx/
	6v+vK37SX3oVcFLMPAHp5AH7pJyN1sgHi7Dg0JoqTfm1ghasAPnK6d81HaOzXK5VY7+BeCiJJ3/
	J8xANZpLnF7Jp0fMFNO1vZ1ejALXAblxm6Ajlnb3f8/6701MgAqNtaWfsJv8reMiU/2nWc8sTat
	Eeo5qnAbuEOmwHS+g4wK09HdtiCY1xaH9N6WRPoy1NQx8MI8VtRvNTylX7o5ru3VnEMn3Ro6ZTr
	jwMToLyt28/XLNt2RtPHMj9h+4zkdpDA14/cKQytdLMPR1QOau57M7JvrR4M=
X-Google-Smtp-Source: AGHT+IEUUgzAKKhwwQ9XugqEZgLxNnWmGOGv4hdFCRqrrqKmlL/qaqsBWbsCyy4gSxXaS0EWkVrpPg==
X-Received: by 2002:a05:6a00:4fc2:b0:736:34a2:8a20 with SMTP id d2e1a72fcca58-7480b46113bmr5411347b3a.21.1749065970983;
        Wed, 04 Jun 2025 12:39:30 -0700 (PDT)
Received: from ynaffit-andsys.c.googlers.com (163.192.16.34.bc.googleusercontent.com. [34.16.192.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab4acsm11479575b3a.43.2025.06.04.12.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 12:39:30 -0700 (PDT)
From: Tiffany Yang <ynaffit@google.com>
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org,  cgroups@vger.kernel.org,
  kernel-team@android.com,  John Stultz <jstultz@google.com>,  Thomas
 Gleixner <tglx@linutronix.de>,  Stephen Boyd <sboyd@kernel.org>,
  Anna-Maria Behnsen <anna-maria@linutronix.de>,  Frederic Weisbecker
 <frederic@kernel.org>,  Johannes Weiner <hannes@cmpxchg.org>,  Michal
 =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,  "Rafael J. Wysocki"
 <rafael@kernel.org>,
  Pavel Machek <pavel@kernel.org>,  Roman Gushchin
 <roman.gushchin@linux.dev>,  Chen Ridong <chenridong@huawei.com>,  Ingo
 Molnar <mingo@redhat.com>,  Peter Zijlstra <peterz@infradead.org>,  Juri
 Lelli <juri.lelli@redhat.com>,  Vincent Guittot
 <vincent.guittot@linaro.org>,  Dietmar Eggemann
 <dietmar.eggemann@arm.com>,  Steven Rostedt <rostedt@goodmis.org>,  Ben
 Segall <bsegall@google.com>,  Mel Gorman <mgorman@suse.de>,  Valentin
 Schneider <vschneid@redhat.com>
Subject: Re: [RFC PATCH] cgroup: Track time in cgroup v2 freezer
In-Reply-To: <aD9_V1rSqqESFekK@slm.duckdns.org> (Tejun Heo's message of "Tue,
	3 Jun 2025 13:03:51 -1000")
References: <20250603224304.3198729-3-ynaffit@google.com>
	<aD9_V1rSqqESFekK@slm.duckdns.org>
User-Agent: mu4e 1.12.8; emacs 30.1
Date: Wed, 04 Jun 2025 19:39:29 +0000
Message-ID: <dbx8y0u7i9e6.fsf@ynaffit-andsys.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Tejun Heo <tj@kernel.org> writes:

> On Tue, Jun 03, 2025 at 10:43:05PM +0000, Tiffany Yang wrote:
>> The cgroup v2 freezer controller allows user processes to be dynamically
>> added to and removed from an interruptible frozen state from
>> userspace. This feature is helpful for application management, as it
>> allows background tasks to be frozen to prevent them from being
>> scheduled or otherwise contending with foreground tasks for resources.
>> Still, applications are usually unaware of their having been placed in
>> the freezer cgroup, so any watchdog timers they may have set will fire
>> when they exit. To address this problem, I propose tracking the per-task
>> frozen time and exposing it to userland via procfs.
>
> Just on a glance, it feels rather odd to be tracking this per task given
> that the state is per cgroup. Can you account this per cgroup?
>
> Thanks.

Hi Tejun!

Thanks for taking a look! In this case, I would argue that the value we
are accounting for (time that a task has not been able to run because it
is in the cgroup v2 frozen state) is task-specific and distinct from the
time that the cgroup it belongs to has been frozen.

A cgroup is not considered frozen until all of its members are frozen,
and if one task then leaves the frozen state, the entire cgroup is
considered no longer frozen, even if its other members stay in the
frozen state. Similarly, even if a task is migrated from one frozen
cgroup (A) to another frozen cgroup (B), the time cgroup B has been
frozen would not be representative of that task even though it is a
member.

There is also latency between when each task in a cgroup is marked as
to-be-frozen/unfrozen and when it actually enters the frozen state, so
each descendant task has a different frozen time. For watchdogs that
elapse on a per-task basis, a per-cgroup time-in-frozen value would
underreport the actual time each task spent unable to run. Tasks that
miss a deadline might incorrectly be considered misbehaving when the
time they spent suspended was not correctly accounted for.

Please let me know if that answers your question or if there's something
I'm missing. I agree that it would be cleaner/preferable to keep this
accounting under a cgroup-specific umbrella, so I hope there is some way
to get around these issues, but it doesn't look like cgroup fs has a
good way to keep task-specific stats at the moment.

-- 
Tiffany Y. Yang
