Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EA533062
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 12:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745410570; cv=none; b=r4TYRDDxACvZZb1HMi2RcI/d5uI0LWJqfaxByA4nwWABUr38aVW2AZKkpaZtDJjcCOSANzd2tyIcJzpPrCp82PfR5AtijJIjrRP7/DcMHm/iH7KrHvNQ/toKQHe6O92pMZbHVue1epKMEWKZa9XGLRmCQ2GP9giA3L9dmMtwF0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745410570; c=relaxed/simple;
	bh=qRoCsAChPe7q/2eN3nI2BTBi5wqWI0Ci+iYd84NLMGw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kJbweuiPEenyKchs9mMK4e63jRz6GWZ8a8hYd4dEDFjpOPjzzy8tLxfpmwNiZlyJEQzU1NtthCr3UkIgJY5yBBZyyn0FBeGSRvX2Pi/oB9rlGKI1BOYyoZeFzt/y1BE4SFpzm+FwHK+CZmn21SWsJj3L5sOTSJGFCAGqBB+3/S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=florian.bezdeka@siemens.com header.b=AFPe3gzP; arc=none smtp.client-ip=185.136.65.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=florian.bezdeka@siemens.com header.b="AFPe3gzP"
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202504231215564751507c6a6c06f386
        for <linux-kernel@vger.kernel.org>;
        Wed, 23 Apr 2025 14:15:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=qRoCsAChPe7q/2eN3nI2BTBi5wqWI0Ci+iYd84NLMGw=;
 b=AFPe3gzPUeVMxVrZY9NuCBerTQj6tJ8byfbP9+nxdm6DiHPcG4pTr1uADB3a+yQMNy+nDq
 F9r4X11DlyG9mUHpyCWI6dFa0fkkANxWxSNumInawegfCMl6QM56AebY/6J3D+58d6qFtXuI
 xRG0gAT0knqhjrMruprSUIOnEotxRE03Eg+3D1XSRAK1NMRY9Nkz762CZsKOZ/3nO18SMOCj
 YMO/Hk0uGdWawZgr8wj8GiHVf1HUYZ/M1IyEAGGoPN0wkOfsGjo8qqBZH15kbxIGWfGHAENA
 /i/ZxOP0FCvB9WM4uwji+7qk2EqZFuwzqzl2WhjC1BFVJpQPISSj8M1A==;
Message-ID: <d2f72ac5650f740835ab09a562f24bf68ea581cd.camel@siemens.com>
Subject: Re: [RFC PATCH v2 7/7] sched/fair: alternative way of accounting
 throttle time
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: Aaron Lu <ziqianlu@bytedance.com>
Cc: Valentin Schneider <vschneid@redhat.com>, Ben Segall
 <bsegall@google.com>,  K Prateek Nayak <kprateek.nayak@amd.com>, Peter
 Zijlstra <peterz@infradead.org>, Josh Don <joshdon@google.com>,  Ingo
 Molnar <mingo@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Xi
 Wang <xii@google.com>, 	linux-kernel@vger.kernel.org, Juri Lelli
 <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman	 <mgorman@suse.de>,
 Chengming Zhou <chengming.zhou@linux.dev>, Chuyi Zhou	
 <zhouchuyi@bytedance.com>, Jan Kiszka <jan.kiszka@siemens.com>
Date: Wed, 23 Apr 2025 14:15:55 +0200
In-Reply-To: <20250423112651.GA437160@bytedance>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
	 <20250409120746.635476-8-ziqianlu@bytedance.com>
	 <099db50ce28f8b4bde37b051485de62a8f452cc2.camel@siemens.com>
	 <20250418031550.GA1516180@bytedance>
	 <87776d335eec8fe02b29d96818fd5c2dde5ed7af.camel@siemens.com>
	 <20250423112651.GA437160@bytedance>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer

On Wed, 2025-04-23 at 19:26 +0800, Aaron Lu wrote:
> On Tue, Apr 22, 2025 at 05:03:19PM +0200, Florian Bezdeka wrote:
> ... ...
>=20
> > Right, I should have mentioned that crucial detail. Sorry.
> >=20
> > I ported your series to 6.14.2 because we did/do not trust anything
> > newer yet for testing. The problematic workload was not available in
> > our lab at that time, so we had to be very carefully about deployed
> > kernel versions.
> >=20
> > I'm attaching the backported patches now, so you can compare / review
> > if you like. Spoiler: The only differences are line numbers ;-)
>=20
> I didn't notice any problem regarding backport after a quick look.
>=20
> May I know what kind of workload triggered this warning? I haven't been
> able to trigger it, I'll have to stare harder at the code.

There are a couple of containers running. Nothing special as far as I
can tell. Network, IO, at least one container heavily using the epoll
interface.

The system is still operating fine though...

Once again: PREEMPT_RT enabled, so maybe handling an IRQ over the
accounting code could happen? Looking at the warning again it looks
like unthrottle_cfs_rq() is called from IRQ context. Is that expected?

Best regards,
Florian
