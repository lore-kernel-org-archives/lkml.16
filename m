Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151BA82488
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 22:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739140477; cv=none; b=OEYO33Z1vc7krfX6KZM2/bvdD3HRgrtDw6rTPX1Rz/b5UYUm8zdyS9Fd6lnTMCErWGoppCj8T4bsrRb6U2t6tNe/jVqf3B9qX22/1n96DaoWaMjOjrGTfYtmaZaG+YxPL3EaiKoGOzhcRDzf3aZP9pRHmGGKE8h3Kl9YwtnTKvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739140477; c=relaxed/simple;
	bh=OZ6XhT05wj0HtVAfQr2aHu+yKa9kgIqUxOt58CUHgbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msPHK+KwPRPpaSS3DPyVYbKNa8iv4ibRa++VyJ/1ukiyb890t91v24BmDtuaT0y2s4uYEpi5BA7/iv1C9Xi7gZWxe2MFXrAU8SN+P8E51n7L5nZa9SgfCUAf0Zr6aOsF66bjbbm6F1rIP5bMGLaNroO5YKYjJjNvkniLb5Yuh2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io; spf=pass smtp.mailfrom=layalina.io; dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b=usu+PO98; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b="usu+PO98"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso1866861f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 14:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20230601.gappssmtp.com; s=20230601; t=1739140474; x=1739745274; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6VqhA8OJ2B/T8LcGnvokM/21lxU4fJgLMXRUipbc15E=;
        b=usu+PO98CemKvbMYzf1+9Ygr30JjL/GOX3hnICp0L2tpbu8TqrKGsBSzsIKPHfmZJd
         Lw8IR8l4q5S33z5FHbiJQVDhAPIJKLIaVfQD99WjgOX2fpT4gjMff0DrIgCJaO6toG/n
         TBCbDUw/dSZ3ze4J9BziSwaZHbnz0LYmuU3MYr699DBcyOCOLGJ8jxA1+la1+rztRk5z
         rANeD5AKTkFKLXmQmPfG1cQOvx8ASYnP1hkNX8vCg/RqqjdhACylbnEMDQq+AOyPf9a0
         rphrCekKOlh21EgGDD6ZhKz9tbNhqG/AA+r/9TW+1R4pR72O4DNx/e7awVincwz0n7c9
         DQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739140474; x=1739745274;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6VqhA8OJ2B/T8LcGnvokM/21lxU4fJgLMXRUipbc15E=;
        b=azqhHkJhzik9EKkuzRqRVK5/q3PleDvCzIyGxRE63GlmD/17H2dmN76VkZshmRtrNJ
         1EaaSCjh12nsLl5ICG/Y1RC+5AmWiNpjPvXX/45xERgM2Wji5zi2suIokqGk64UcXkYa
         2xQbgLid/CYDHS2M4B4+2Qma005wRWFDHeVHGp5D0NKy1NJPTpNKinoNhl+R2xawef6g
         f2iScyMhfKhjEc98dgPVeScsenORlKDXFPL/r8IOfcvLUiAsdagnmbSLQ4suVl+A+mtn
         XVB6tBhX76vfLF+nVp50ybzAsAR12CUKHZ7u4Mtlt5c8ay2G3lzAePnd0R8ny8xZ+Mnx
         dsSw==
X-Forwarded-Encrypted: i=1; AJvYcCVYiaxPuyw0FdmcWQc3XRFeBvGmTeOAl46VCymqLUSJjZcPIDRT8bRLTFGhRvYKyUSZkrs5BqxmHVm23fE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU10tSn7LqId+X8ZHHi6vxS/3TTaYH1x5tZbM80ns+Cq2+5EIA
	2fE5jyzvugI94Q5831gLTqrFdQoFkOSuH940XjLruGezbk2bqzVygzHJICThtw8=
X-Gm-Gg: ASbGncsEEYkNxI6qcRmaBNnwg5R3rOpv1cOSxlxo8z3hJKP1XEBToli7G3P1chxSVSF
	k4ki5a5F723P+XzIYR6nCF8EGDxUU64G1rWmaeB5hbBfU217TNqHwbY+uO6g3idmFYl35dCdTxn
	nzUwuVVTSsx1eAJplewYTre4DTA/QFsVOnrc2dQB2nh8tbpKWijqY4OylMgQU6cIhkPgjMGmp6R
	AolbjbAv4+IZYxBFRvslPRsbSQt/VZAzE46KDpReEHj/FznvqHZAko1i5kfYlJhwqJPZBvWk2Ut
	jYC1fQjmWE3aVxyqlYSLk2J6JVBhszUffSa1cL9P+rRJrTtCDW2ihvl8fDmPjn7mKtjp
X-Google-Smtp-Source: AGHT+IHYmQpg+MN1qA0nug7LeoGLzcXDskmffzXoPho8X3ciY2KFjA6cPoU5YmUL849kQYDu9L1IYg==
X-Received: by 2002:a5d:6d0b:0:b0:38b:ed88:f045 with SMTP id ffacd0b85a97d-38dc90f0daemr8186759f8f.33.1739140474424;
        Sun, 09 Feb 2025 14:34:34 -0800 (PST)
Received: from airbuntu (host109-154-33-115.range109-154.btcentralplus.com. [109.154.33.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dce18d6f9sm7071108f8f.29.2025.02.09.14.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 14:34:34 -0800 (PST)
Date: Sun, 9 Feb 2025 22:34:33 +0000
From: Qais Yousef <qyousef@layalina.io>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Christian Loehle <christian.loehle@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Hongyan Xia <hongyan.xia2@arm.com>,
	John Stultz <jstultz@google.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] sched: Consolidate cpufreq updates
Message-ID: <20250209223433.symtjwbkcbwvhlc7@airbuntu>
References: <20240728184551.42133-1-qyousef@layalina.io>
 <6e4a4605-f6c5-4948-ac38-c4ddf4990754@arm.com>
 <CAJZ5v0ieB4hppC8fHnjhNNpfFZzEL4Y96irSTmCmavXCid2xtA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0ieB4hppC8fHnjhNNpfFZzEL4Y96irSTmCmavXCid2xtA@mail.gmail.com>

On 09/12/24 13:33, Rafael J. Wysocki wrote:
> On Wed, Sep 11, 2024 at 10:34 PM Christian Loehle
> <christian.loehle@arm.com> wrote:
> >
> > On 7/28/24 19:45, Qais Yousef wrote:
> > > Improve the interaction with cpufreq governors by making the
> > > cpufreq_update_util() calls more intentional.
> > >
> > > At the moment we send them when load is updated for CFS, bandwidth for
> > > DL and at enqueue/dequeue for RT. But this can lead to too many updates
> > > sent in a short period of time and potentially be ignored at a critical
> > > moment due to the rate_limit_us in schedutil.
> > >
> > > For example, simultaneous task enqueue on the CPU where 2nd task is
> > > bigger and requires higher freq. The trigger to cpufreq_update_util() by
> > > the first task will lead to dropping the 2nd request until tick. Or
> > > another CPU in the same policy triggers a freq update shortly after.
> > >
> > > Updates at enqueue for RT are not strictly required. Though they do help
> > > to reduce the delay for switching the frequency and the potential
> > > observation of lower frequency during this delay. But current logic
> > > doesn't intentionally (at least to my understanding) try to speed up the
> > > request.
> > >
> > > To help reduce the amount of cpufreq updates and make them more
> > > purposeful, consolidate them into these locations:
> > >
> > > 1. context_switch()
> > > 2. task_tick_fair()
> > > 3. sched_balance_update_blocked_averages()
> > > 4. on sched_setscheduler() syscall that changes policy or uclamp values
> > > 5. on check_preempt_wakeup_fair() if wakeup preemption failed
> > > 6. on __add_running_bw() to guarantee DL bandwidth requirements.
> > >
> >
> > Actually now reading that code again reminded me, there is another
> > iowait boost change for intel_pstate.
> > intel_pstate has either intel_pstate_update_util() or
> > intel_pstate_update_util_hwp().
> > Both have
> >         if (smp_processor_id() != cpu->cpu)
> >                 return;
> > Now since we move that update from enqueue to context_switch() that will
> > always be false.
> > I don't think that was deliberate but rather to simplify intel_pstate
> > synchronization, although !mcq device IO won't be boosted which you
> > could argue is good.
> > Just wanted to mention that, doesn't have to be a bad, but surely some
> > behavior change.
> 
> This particular change shouldn't be problematic.

Thanks for checking and sorry for delayed response. Life got in the way and
couldn't get back to this sooner.

Cheers

--
Qais Yousef
