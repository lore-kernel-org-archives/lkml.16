Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BAA1632C8
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748448632; cv=none; b=Uv/3qOkceeMoQoWb04mJL/YhKjT5QmjwcSvsP+ctKBwtmzslfQVBSFQCbx7ZdvSSS+JIqzeUjy+ik/dyozjOai4WnU2O1EsI+rVg0+HOGIGZur83WEI+4IY5x0+ScWguNbVY1zBQJgfG/hr6yXaV0FbQzH03Ti6Nc1ByWn/02Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748448632; c=relaxed/simple;
	bh=H7znW9/UZKH3WDMti+Go2o8l0Paatw1ZPa07jLxTYgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iw7LF4IZgyD4Bt9+hIXHlsgafkBdRDUwxvB3Ehe8ahgTsVo4LsRih6n4N5V5fj9EXca5xUXaVNwr+EfLqoV94VFGPKKQjlMQC9nchhna3rv9PJgO/VwIQ7iz97vzLSR5WMY72TnUnU5eLFZtawRWnnNkpsohKlxHgyXLa1F3lKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dYupGxUE; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dYupGxUE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WpRAs9+OtUV4uljG/ilQ1tHw0nuTmHkby899eBfbPm4=; b=dYupGxUE5GBeoqxatcaiXuVJWm
	ZYZD+wvE3ApzHNbI3F0MulHf894ME+APCAAvbylwjHW9WZCR0/ptR21BNW8EidF+l39XfILCCmmu1
	FUCsH1bX6y45YIlMOUODuXGExNSw2B4v+Z2sdPtWFlff6p7aMKDutG5Yt95zKyr1gWMLZZdc58EZY
	KO2jzjvrN5OUTvXLbDl/BdPyXSyAqX2+9VRCpGdjJ7oFEQ0RfAwA6cNVvlz6s3cU62OHQX8iUpNlI
	tTLckibExc79VYqWgAkMB7gNBGFGDwQqgCeU9qc1brTqKRX8w5rYfJqgSClhQxE7I5R+l0EzR+Nyk
	4z70HvxQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJMD-0000000023o-3oxn;
	Wed, 28 May 2025 16:10:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 13E673005AF; Wed, 28 May 2025 18:10:21 +0200 (CEST)
Date: Wed, 28 May 2025 18:10:20 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Mel Gorman <mgorman@suse.de>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 00/43] sched: Use the SMP scheduler on UP too
Message-ID: <20250528161020.GF39944@noisy.programming.kicks-ass.net>
References: <20250528080924.2273858-1-mingo@kernel.org>
 <20250528085813.GX39944@noisy.programming.kicks-ass.net>
 <20250528100000.0ab0a8b1@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528100000.0ab0a8b1@gandalf.local.home>

On Wed, May 28, 2025 at 10:00:00AM -0400, Steven Rostedt wrote:
> On Wed, 28 May 2025 10:58:13 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > You know about unifdef, right :-)
> 
> I didn't know about that!
> 
> > 
> > $ unifdef -m -DCONFIG_SMP=y kernel/sched/*.[ch] include/linux/sched.h include/linux/sched/*.h
> 
> Cool!
> 
> Although I wish there was better documentation about it.

It has a manpage :-)

