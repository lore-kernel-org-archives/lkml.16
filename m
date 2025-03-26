Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B82749659
	for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 21:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743023499; cv=none; b=gx0XlzoPZ9aU1nYBv/hbXfou2TmWfLG5XL/K0M8MCsSVmvA545qtx2dKvk/ml6Y81lvvFqR2mKZfy4ZSXWU3x3SYe7DtI7DuyVajFraj7FUBFU4MgESr1nbrLl4fW1ucIZuaREnvUXMSHOUZYNNhva/ykMx/KD+E+QYNWUU4uTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743023499; c=relaxed/simple;
	bh=DZXrdqc+VEpRE2lIne3ziRcrT+tDB7NoQbmTHhMMVwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F15FaVjGR89ss2Wu2qZJRwFkLOqcEVRQFC3CI8SzThBaou8QZf1+i1PF/SAp8bBCWR9r+a2DRiFAE6Om/PrT8NxXG/lntaXxm4IC+r5bEcU0uxSyvMC7tGYZHe0sut22V2Oy2jPje2pxbhmNhRX+i7ubX1TXXcbYVWLepv5uHa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwqtnQ3U; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwqtnQ3U"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so2681405e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 14:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743023496; x=1743628296; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ADWf6svSkXJlABZrsXSNaYONnC7bUNNzGtHknmI+bTw=;
        b=QwqtnQ3U9MvRBjwJlwy1IOf0ky1Of/k+rvqy0cs4pRYKA2sb3uksCdcQ022GVO6zLF
         6nB6bPhehuvQlVb0nfTO1gqTW4MLVLQTXbwJu2L9tx3sP5vQ3VPFv/tPBMiKJjTKxUge
         I7NgUihisQXwC1B8D4JGuFw7MYDwGiH+7iLFsMEygZUFAW5Q2H6rYXFZy9wBI/4Oyte7
         323AXOojJokfuE2c7d0jZiH+sZFfK6INVGqDvNF8JjVqJWfuqw3wrKDBP7Dnpo9b4M3t
         Q91pChmMGTLdoALGnuluFKT/knpiF2yVnS0c5gYYc16Yw8n71IF6RKoUNQHk6SexCDbT
         59oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743023496; x=1743628296;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ADWf6svSkXJlABZrsXSNaYONnC7bUNNzGtHknmI+bTw=;
        b=MUTsDPc1sxd54Op6Dg2dk9VrkV0XUcoC1P2GQPENBCJ/pV/cMoWtYMuz1mg25mpDyC
         wPi69/ZY+Umnf/aSVOPSqw0VqotBbyyI4FajuLRKniDfJoJq6Wh3wiFVJKPD1Agg7kh/
         XMik+13FkZHjlvy9qPCSjVHTGgSZKQMf0KEQmXi+YDwIUP+kogVJ38sygR00gzns8ZZ8
         GHQnQSfQDNbwKU/2n3nbPQKMMA8c0n8gZ/bCvR/epbfv8/Hu6tfRtnK/SmytJytBBfhp
         sJ6SP2sgAo1EjR53BHIFd9BdeUMtJndVZzOUE7hdiATAiWCKNBqyIf2QfX2ZCgkE/nvF
         QZQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+wyKpJG6JxQsqqGNsYu4fQk99NpeNclbjjCsXk4nd3+rVCLxuoy9WmEEDRXAv05+eNBlK8cqubYUVvsc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm3QJ92j0tpHV8ZCd873OhltvdMPCZzR2BDzcuu+VJCsW01/Vh
	7MyRtgj4IhcfwzllMV0TEaGPFJ47g7zbXhVtAmRhGI/v0HZ/v24fFam+TA==
X-Gm-Gg: ASbGnctXfePUuU7UApafbMUntBVbgHj3ZOhKzFc12n01561qQbrpKbBI7PZBFtYYlrv
	xpVRbTmdX8KsQ8gk2E84L8JaC2vLjJ/xVI4O8bJoBkvyDryoWoRO+V9qY4gVFenS4UF4l5RGEi/
	wcHQc9UL1jmD1ibIrQRphWVdoR9cuuFgCqPNYzR9z4ezuIFU6Bi7qN+lRSAhfD/gyHgeyiSzKsA
	aIU9MXxFOkqvJr7HOimBdOLNHxlPUTIPP0ImpOooECDaiup+oHyowA63RGTM+QXJ487+YKcDXi+
	MNVjZdz+myQoN5HgJikpX6cI/2r/HIa8K1/4A+1w+529MtajMvDolh1g7SGO
X-Google-Smtp-Source: AGHT+IGkUCkr1x6x9IgRq8UbgNXMDAJO1+RXsn6Pk+rx1bb+mTleAvrVTcY/EHJLBdEflDljB3MD/g==
X-Received: by 2002:a05:600c:190b:b0:43c:f81d:f with SMTP id 5b1f17b1804b1-43d84f94cbemr8231035e9.8.1743023495136;
        Wed, 26 Mar 2025 14:11:35 -0700 (PDT)
Received: from f (cst-prg-80-192.cust.vodafone.cz. [46.135.80.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b25c9sm17676643f8f.42.2025.03.26.14.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 14:11:34 -0700 (PDT)
Date: Wed, 26 Mar 2025 22:11:23 +0100
From: Mateusz Guzik <mjguzik@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Eric Dumazet <edumazet@google.com>, Benjamin Segall <bsegall@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>
Subject: Re: [tip:timers/core] [posix]  1535cb8028:
 stress-ng.epoll.ops_per_sec 36.2% regression
Message-ID: <6sn76aya225pqikijue5uv5h3lyqk262hc6ru3vemn7xofdftd@sw7gith52xh7>
References: <202503241406.5c9cb80a-lkp@intel.com>
 <87pli4z02w.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pli4z02w.ffs@tglx>

On Wed, Mar 26, 2025 at 09:07:51AM +0100, Thomas Gleixner wrote:
> On Mon, Mar 24 2025 at 14:39, kernel test robot wrote:
> > kernel test robot noticed a 36.2% regression of stress-ng.epoll.ops_per_sec on:
> >
> > commit: 1535cb80286e6fbc834f075039f85274538543c7 ("posix-timers: Improve hash table performance")
> > https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git timers/core
> >
[snip]
> > | testcase: change | stress-ng: stress-ng.epoll.ops_per_sec 124.9% improvement                       |
> 
> How on earth can this commit result in both a 36% regression and a 25%
> improvement with the same test?
> 
> Unfortunately I can't reproduce any of it. I checked the epoll test
> source and it uses a posix timer, but that commit makes the hash less
> contended so there is zero explanation.
> 

The short summary is:
1. your change is fine
2. stress-ng is doing seriously weird stuff here resulting in the above
3. there may or may not be something the scheduler can do to help

for the regression stats are saying:
feb864ee99a2d8a2 1535cb80286e6fbc834f075039f
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
      5.97 ± 56%     +35.8       41.74 ± 24%  mpstat.cpu.all.idle%
      0.86 ±  3%      -0.3        0.51 ± 11%  mpstat.cpu.all.irq%
      0.10 ±  3%      +2.0        2.11 ± 13%  mpstat.cpu.all.soft%
     92.01 ±  3%     -37.7       54.27 ± 18%  mpstat.cpu.all.sys%
      1.06 ±  3%      +0.3        1.37 ±  8%  mpstat.cpu.all.usr%
     27.83 ± 38%     -84.4%       4.33 ± 31%  mpstat.max_utilization.seconds

As in system time went down and idle went up.

Your patch must have a side effect where it messes with some of the
timings between workers.

However, there is a possibility the scheduler may be doing something
better here -- the testcase spawned as is has wildly unstable
performance, literally orders of magnitude difference between runs and
tons of idle and it stabilizes if I use a taskset.

In an attempt to narrow it down I tried with few workers:
taskset --cpu-list 1,2 stress-ng --timeout 10 --times --verify --metrics --no-rand-seed --epoll 1

--epoll 1 spawns two worker threads and both are bound to only execute
on cores 1 and 2.

With this I consistently see high CPU usage and total executed ops
hanging around 190k.  Sample time output:
1.31s user 18.67s system 199% cpu 10.02s (10.023) total

If I whack the taskset or extend it to 1,2,3,4:
taskset --cpu-list 1,2,3,4 stress-ng --timeout 10 --times --verify --metrics --no-rand-seed --epoll 1

... I'm back to non-nensical perf, all the way down to 18k ops/s on the
lower end and over 200k on the higher one.

Sample time outputs in consecutive runs:
0.02s user 0.38s system 3% cpu 10.06s (10.060) total
0.34s user 4.59s system 48% cpu 10.13s (10.132) total

As in during the first run this spent almost the entire time off CPU.
During the second one it only used about a quarter of CPU time it could.

The testcase is doing a lot of weird stuff, including calling yield()
for every loop iteration. On top of that if the other worker does not
win the race there is also a sleep of 0.1s thrown in. I commented these
suckers out and weird anomalies persisted.

All that said, I'm not going to further look into it. Was curious wtf
though hence the write up.
