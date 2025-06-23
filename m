Received: from mail44.out.titan.email (mail44.out.titan.email [3.69.224.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBCC35975
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=3.69.224.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750724244; cv=none; b=F4M+rokbZaND0qADoAVaZM549pkJbEj7KkjRdLDPwYS1MNBliJeqxqnE1MUlkoDJelub/un4uw1O5ltM6K4cNfbQRjgV8TEGTtmsh+RpBZGWCbliP5JHhdA+lt8398Ty05t0YO4Dciy90LTFLETWhyXIM3OC42VrCXWGPUohU9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750724244; c=relaxed/simple;
	bh=Oftf5W4I/EXc8/dE5Uq8cLi3ZFqVSS5q7VTSqVAxhMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bN508BLnoICI3vqCmRhCN6jrwvwh3TMaeF3ZWEGleuMZHgPAwPXf6INI6hnL+0GRlYTRJs3sV4tfcjpeXcAqc7ICbQxmdsw9Xyz4wJ0W059HU5/jYS6l+E6u5lLRRgs6W7rr/VDdRyYQemQHAvYxbCFHD9WDBCLlCV8ldjEVFjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=techsingularity.net; spf=pass smtp.mailfrom=techsingularity.net; dkim=pass (1024-bit key) header.d=techsingularity.net header.i=@techsingularity.net header.b=ZjhYus94; arc=none smtp.client-ip=3.69.224.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=techsingularity.net header.i=@techsingularity.net header.b="ZjhYus94"
Received: from localhost (localhost [127.0.0.1])
	by smtp-out0101.titan.email (Postfix) with ESMTP id 1C55E10004E;
	Mon, 23 Jun 2025 21:50:12 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=l/nFCx/0llluEb4kDd+YLQaTel4IbFwefVMIpPfZ3f4=;
	c=relaxed/relaxed; d=techsingularity.net;
	h=from:cc:references:mime-version:to:in-reply-to:subject:date:message-id:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1750715411; v=1;
	b=ZjhYus9479AB8zlDfn3DU4pPwYEGLllIXdh+Oej2Tb58/rckUt+jTTFGgs5lnYDntb/q/rR2
	Wu/JvUCP3OhOnqy/6E+3njgsWI5Gb1y2Vy+qmfixaSpMqc9wx61Ya3OZyeRKpBJzs4HChP6DO21
	1PJqCB+S6rszasxk6bf05MxE=
Received: from mail.blacknight.com (ip-84-203-196-90.broadband.digiweb.ie [84.203.196.90])
	by smtp-out0101.titan.email (Postfix) with ESMTPA id C41E0100008;
	Mon, 23 Jun 2025 21:50:10 +0000 (UTC)
Date: Mon, 23 Jun 2025 22:49:59 +0100
Feedback-ID: :mgorman@techsingularity.net:techsingularity.net:flockmailId
From: Mel Gorman <mgorman@techsingularity.net>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Aaron Tomlin <atomlin@atomlin.com>, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, hpa@zytor.com, oleg@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] sched: idle: Introduce CPU-specific idle=poll
Message-ID: <7n6zmi3aaxrwfpvkzbugt3e3274zw3qb2kci4yyq2q6gojb3ku@zh3g4rvnyqzi>
References: <20250621235745.3994-1-atomlin@atomlin.com>
 <20250623102334.GP1613200@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <20250623102334.GP1613200@noisy.programming.kicks-ass.net>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1750715411915101861.2117.3965428696989907295@prod-euc1-smtp-out1001.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=HKo5Fptv c=1 sm=1 tr=0 ts=6859cc13
	a=+XWPlUOTt03IZrtNKHUAqA==:117 a=+XWPlUOTt03IZrtNKHUAqA==:17
	a=Q9fys5e9bTEA:10 a=CEWIc4RMnpUA:10 a=lX01bCWNPQCBdb-pIg4A:9
	a=PUjeQqilurYA:10

On Mon, Jun 23, 2025 at 12:23:34PM +0200, Peter Zijlstra wrote:
> On Sat, Jun 21, 2025 at 07:57:45PM -0400, Aaron Tomlin wrote:
> > Currently, the idle=poll kernel boot parameter applies globally, forcing
> > all CPUs into a shallow polling idle state to ensure ultra-low latency
> > responsiveness. While this is beneficial for extremely latency-sensitive
> > workloads, this global application lacks flexibility and can lead to
> > significant power inefficiency. This is particularly evident in systems
> > with a high CPU count, such as those utilising the
> > Full Dynticks/Adaptive Tick feature (i.e., nohz_full). In such
> > environments, only a subset of CPUs might genuinely require
> > sub-microsecond responsiveness, while others, though active, could
> > benefit from entering deeper idle states to conserve power.
> 
> Can't we already do this at runtime with pmqos? If you set your latency
> demand very low, it should end up picking the poll state, no? And you
> can do this per-cpu.

Yes, we can. idle=poll can be hazardous in weird ways and it's not like
pmqos is hard to use. For example, lets say you had a RT application with
latency constraints running on isolated CPUs while leaving housekeeping
CPUs alone then it's simply a case of;

        for CPU in $ISOLATED_CPUS; do
                SYSFS_PARAM="/sys/devices/system/cpu/cpu$CPU/power/pm_qos_resume_latency_us"
                if [ ! -e $SYSFS_PARAM ]; then
                        echo "WARNING: Unable to set PM QOS max latency for CPU $CPU\n"
                        continue
                fi
                echo $MAX_EXIT_LATENCY > $SYSFS_PARAM
                echo "Set PM QOS maximum resume latency on CPU $CPU to ${MAX_EXIT_LATENCY}us"
        done
 

In too many cases I've seen idle=poll being used when the user didn't know
PM QOS existed. The most common response I've received is that the latency
requirements were unknown resulting in much headbanging off the table.
Don't get me started on the hazards of limiting c-states by index without
checking that the c-states are or splitting isolated/housekeeping across
SMT siblings.

-- 
Mel Gorman
SUSE Labs
