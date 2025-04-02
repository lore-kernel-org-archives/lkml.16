Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6613E1E89C;
	Wed,  2 Apr 2025 12:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743597678; cv=none; b=kdY+ZVFzDp4ax4JPD9kx8WuwzzWbPd0Ol7CobmbLVOZQjcIooaROFPAFkv0rjQutD/GjwqJNziZhhpHL/W9oEqTZUg9H7L7rZy+ZgdrP8VOumjWJpEGw8eZZtHPvtn/y7hADcUTWyUowsusURoL9pWTLrA4XhloXitDSZywwkzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743597678; c=relaxed/simple;
	bh=K+pA9riwTokV067qj4gLWgQ6VGXYi1BsprMYvEgyoho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJf9Sdkp9cc3GeYSprgo5gb2JN9EpNBgaLgYFU3VyKOi5Ir56HfG7fWqS/qGg9HUT853kfX82hI8MrKu7Scwq9+e4aEB0obW1jGsILKYOVrWX/BF7Y2HK+qUSUZnGp2P/nePhZ9HNuk50UkrAWC/q7Wo+59SQlDxMP7cN4Tf204=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MSQv8t4Y; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MSQv8t4Y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AvZnwWfvGX4KUr61uG1JJ2mitfym29xGsa5/bsrubeE=; b=MSQv8t4YgU2GNHT5iZMtKa5yIn
	R7T3NiS4oH64EjHzVLlak7QOvWdVKUB8E2j5xNtFYl7MtF1C4RXfpP8PPViYWSShdU7YmYT8hztZP
	hkdAtIR4IEG5Kr90deBLGJtcFGVEoGaWurxvqL0cp4mNpGGMh9OkcZKfoJYkHAyGyYUN+NTgNcwt9
	hHz8tfhE48LzHYwwYZBDAVuEVY6hmGYUlQulfuWvbIQRxrx5G4jMzpWs+/91CKxTD63TdKCc0avrj
	U4g7U9/Qo957n5DuF56Ew1WDDhTsb67wslaZ4mZYfP07IAWDNkGVIIc3j0uCCIBeKFwhLE0ry6eWG
	xdjqfzVw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxP8-000000071Cn-2unj;
	Wed, 02 Apr 2025 12:41:15 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3FB3030057C; Wed,  2 Apr 2025 14:41:14 +0200 (CEST)
Date: Wed, 2 Apr 2025 14:41:14 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org
Subject: Re: [peterz-queue:sched/hrtick] [entry,hrtimer,x86] c07c4e0c01:
 BUG:soft_lockup-CPU##stuck_for#s![schbench:#]
Message-ID: <20250402124114.GW5880@noisy.programming.kicks-ass.net>
References: <202503280925.27fefb28-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503280925.27fefb28-lkp@intel.com>

On Fri, Mar 28, 2025 at 09:24:05AM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "BUG:soft_lockup-CPU##stuck_for#s![schbench:#]" on:
> 
> commit: c07c4e0c013dc11dd466fa63a4af12ef8282b27b ("entry,hrtimer,x86: Push reprogramming timers into the interrupt return path")
> https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git sched/hrtick
> 
> in testcase: schbench
> version: schbench-x86_64-48aed1d-1_20241103
> with following parameters:
> 
> 	iterations: 3x
> 	message_threads: 10%
> 	worker_threads: 128
> 	runtime: 300s
> 	cpufreq_governor: performance
> 
> 
> 
> config: x86_64-rhel-9.4
> compiler: gcc-12
> test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory
> 

Thanks, I can reproduce. I'll poke at it some.
