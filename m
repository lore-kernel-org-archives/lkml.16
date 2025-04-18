Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948BA26FD90
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744968522; cv=none; b=ENQuSdc3lNv4ZZj4v+JENi8P16oOTAXjrzF6jbtAjCuCn4K+MPbtLCZ7Pa1D02ybfliWp7S2kG5/kEjjrF8v/pDhJQjZdZTG5P7qd8mA1nLFPEmZAh5o1ecg75MZi64c1HeT7PY2FX8w/T/ANGfVP1OhZYy3RRCGXhbeiLzdAEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744968522; c=relaxed/simple;
	bh=Gp3r1z6vzJFXzd4Izq1esbyMLj0N4jrlRSOe7D1Ul+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ku/JQ7rEEct2XVgkaTDWQMolBaF/yLgnkn1MqLx7yMGUwcb7lHEyLunn6jc1i290Ia0U9z2Swpvb2gfYHMKiDzyTFceJyTWPzPwSkKBOOUhL7ZH+Os+6aGP9RRvdQClsA8PHoDb38E1voKLLE6Y6QDoqjJ69gR6Z37wvmAcbldw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JKYRTrlH; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JKYRTrlH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2GUcvokVODCjJWnjbqFvYQPcSYQC8S0An9DQBMQP4mY=; b=JKYRTrlHdqJkKhm/eGSE3CD5b1
	UItKgvrHIPsFObNsx3iCaojVpRt1XWCLZxyOb1M5GLxVbpkgBVdpObEWIVmvfzHqKwpJB7csgmVrE
	qlPIvO+31YTy2X67ErXKRirw/n+P/bRIzNvN+emrRdy+OSKv5jxUh/AQNZKDHQvtor6GuLZfWUNLK
	V3YGKHJt5fylpfgdHn8/kouXRfbt4Gt9YQTYQbVZue1M92haGB12amwTQZpBqZQRKEqNi8T2qxy7f
	X6aFHzCZgdeQIJ5mxM18Er55xbPbVJ0p8WaVpMKogOy+SaLiRE5619l7vjqDK8Q5rxd3etIpnP4zZ
	ixyt34TQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5i1N-0000000CcQr-28Mw;
	Fri, 18 Apr 2025 09:28:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CB637300619; Fri, 18 Apr 2025 11:28:28 +0200 (CEST)
Date: Fri, 18 Apr 2025 11:28:28 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	"Chen, Yu C" <yu.c.chen@intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Ingo Molnar <mingo@kernel.org>, Doug Nelson <doug.nelson@intel.com>,
	Mohini Narkhede <mohini.narkhede@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched: Skip useless sched_balance_running acquisition if
 load balance is not due
Message-ID: <20250418092828.GP38216@noisy.programming.kicks-ass.net>
References: <20250416035823.1846307-1-tim.c.chen@linux.intel.com>
 <fbe29b49-92af-4b8c-b7c8-3c15405e5f15@linux.ibm.com>
 <667f2076-fbcd-4da7-8e4b-a8190a673355@intel.com>
 <5e191de4-f580-462d-8f93-707addafb9a2@linux.ibm.com>
 <517b6aac-7fbb-4c28-a0c4-086797f5c2eb@linux.ibm.com>
 <CAKfTPtBF353mFXrqdm9_QbfhDJKsvOpjvER+p+X61XEeAd=URA@mail.gmail.com>
 <7a5a5f1f-0bbc-4a63-b2aa-67bc6c724b2d@amd.com>
 <20250417120130.GE17910@noisy.programming.kicks-ass.net>
 <87728994-b928-45b3-a6a0-258af6e81294@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87728994-b928-45b3-a6a0-258af6e81294@amd.com>

On Fri, Apr 18, 2025 at 10:56:04AM +0530, K Prateek Nayak wrote:
> Hello Peter,
> 
> On 4/17/2025 5:31 PM, Peter Zijlstra wrote:
> > > o Since this is a single flag across the entire system, it also implies
> > >    CPUs cannon concurrently do load balancing across different NUMA
> > >    domains which seems reasonable since a load balance at lower NUMA
> > >    domain can potentially change the "nr_numa_running" and
> > >    "nr_preferred_running" stats for the higher domain but if this is the
> > >    case, a newidle balance at lower NUMA domain can interfere with a
> > >    concurrent busy / newidle load balancing at higher NUMA domain.
> > >    Is this expected? Should newidle balance be serialized too?
> > 
> > Serializing new-idle might create too much idle time.
> 
> In the context of busy and idle balancing, What are your thoughts on a
> per sd "serialize' flag?

My sekret hope is that this push stuff can rid us all the idle balance
bits. But yeah, early days on that.

Other than that, I don't quite see why we should split that, busy
balancing is the one that runs more often and is the one that should be
serialized to avoid too much cross node traffic and all that, no?

The idle thing is less often, why not limit that?
