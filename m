Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB7386348
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 07:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746516982; cv=none; b=drWzSlsWpGP50o/nCeu/TErbtXuQ31fLKxfGGdqwb+i7NpzehP/EluX19FK1V6ShTm+1/sNIVMMHDjKAmitik8KMKrPGW9JIiQFgxVnhpKKKVtBP9dweR6enhiOM6L0fV9a06qjrf18LDW3F450tFHi8Y9/ctjjO3dnrWIQCtWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746516982; c=relaxed/simple;
	bh=FIGxv3Nl1qoX+HHto5vOpS4BavolNZCrwovwQ56Wm24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDRQQWVoxF9Ks9IKmDQQ1baV4biBj8/gSLX/UHuEhV/oA+TxcU7LlPVUj7hEbxrU03/Imx8hv+5TzwiXOZBqZ5yjoUUzwKA3+lOl/UoGpjpGy7vq9X0rQZBq0wfsm0XyP2j+fsbAFvPv5nss9EgAKKY+4WNDfGvQiMXoBUTxrjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cfUJ/MV/; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cfUJ/MV/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=slDuu3UwzS1T40il7HNohQSp3mAaqyfTPZpK0mxQMvQ=; b=cfUJ/MV/CS0qCPkTlTNFNJJl4r
	UxOn+S3xF1+WIOxkE72UuA5Tl50mgxIKmJjbykPECMsqYIMSE7ciNb6OoupQVPdLzot/DkdE1dJ1r
	QdO1WjTm1Nv9XtZ3ypvJC6xEr9zr9LjMM1zsud630RlMYkpTp75FrDxSWXan7v25BCPsw2saMvN2d
	tihzOW465VwlWt+ztcQtuMwL9ccx7wPIWM4/NYQmBANta5PHPjXZ+TxHEJ/gAXx+xp3UznmmGXhp1
	wMc2f/O53ngL2/oxBiRQph99jiW5KWM49CC1qz9jIOuBHriJ7EdPHCyG2GcyQnJzHu7P9FCkgC5Ot
	E/bYRtbw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uCCqZ-0000000FbzI-2SUZ;
	Tue, 06 May 2025 07:36:13 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 20524300321; Tue,  6 May 2025 09:36:11 +0200 (CEST)
Date: Tue, 6 May 2025 09:36:11 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v12 00/21] futex: Add support task local hash maps,
 FUTEX2_NUMA and FUTEX2_MPOL
Message-ID: <20250506073611.GH4198@noisy.programming.kicks-ass.net>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416163142.aKBzQeqK@linutronix.de>
 <20250502194807.GD24078@noisy.programming.kicks-ass.net>
 <20250503100905.GG4356@noisy.programming.kicks-ass.net>
 <20250505073036.ikHE6K4T@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250505073036.ikHE6K4T@linutronix.de>

On Mon, May 05, 2025 at 09:30:36AM +0200, Sebastian Andrzej Siewior wrote:
> On 2025-05-03 12:09:05 [+0200], Peter Zijlstra wrote:
> > On Fri, May 02, 2025 at 09:48:07PM +0200, Peter Zijlstra wrote:
> > > On Wed, Apr 16, 2025 at 06:31:42PM +0200, Sebastian Andrzej Siewior wrote:
> > > > On 2025-04-16 18:29:00 [+0200], To linux-kernel@vger.kernel.org wrote:
> > > > > v11…v12: https://lore.kernel.org/all/20250407155742.968816-1-bigeasy@linutronix.de
> > > 
> > > I made a few changes (mostly the stuff I mailed about) and pushed out to
> > > queue/locking/futex.
> > 
> > And again, with hopefully less build errors included :-)
> 
> Okay. I guess the NUMA part where the nodeid is written back to userland
> if 0 was supplied is not an issue. I was worried that if you fire
> multiple threads which end up in the sys_futex_wait() at the same time,
> waiting on the same addr on two nodes and the "current" nodeid is used
> then the variable might be written back twice with two node ids. The
> mpol interface should report always the same one.

Well, if you do stupid things, you get to keep the pieces or something
along those lines. Same as when userspace goes scribble the node value
while another thread is waiting and all that.

Even with the unconditional write back you're going to have a problem
with concurrent wait on the same futex.
