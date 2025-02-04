Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C30139CE3
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 08:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738658506; cv=none; b=Si8v450XnMIhZ+mxYRIunp+t8K4PfUcENY/FgZ8akzA9bZXjQa/z/YsFSDunB1eib8lcw5vZEsL4DZRVZ62s/Gm+AhybiFzBEMNafKd3Vl+FwwlLV2SDgoWtpsjkfMd0jPpQYFa13NBCMS7AygzKNPVt0hwVGeVijUhbQcRmKLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738658506; c=relaxed/simple;
	bh=LiJwemWeFSK/z/qBOxZXEPXGhdIz7QJUAwVmZMSKPCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dywwgQBAV6/eY4d7S1H5mYEC8gYS2Dh4pdBLSJGeQbwTHFZuItXn/6KKKjqwhfqvPhuBBxSHhFvaJMe6Ri/uANMzKReNqEuCr3768Jt9JaFGlMDiMjUt2213TYqf0CyPCIfISVu4suY4/uF+8Zb66MBPhwLh6IUa/llohZ0njxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gW9QFeSf; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gW9QFeSf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Vrm2FaukK0uMu4L/47H3OvUOnFLmVRWYNPbfr7Be6ds=; b=gW9QFeSfdXLwuhAXrWsOHx9nYw
	5flsKxj2KPeFmFfq0z905o7A0GZGv+PFq1cafZIQo7iVIc0Tz8fO8Rq5VkKtz3feeEBCy6rbNYvaC
	7y21oiduXAnQJ3XI0HT4jZukxinzu4nkiOi17lr5iRM6jufFBrSQUk9hNz1XjpvNsUq3bREG2EdJd
	CFERQIA5jNc2uLGt/2O47yvX6SqmePKsFD+AHZW6NmdAdASLZheuRgdrP/MrxlTzrHaSsEzEXsoF3
	YQFrAqBbe1oQHcCTzYnFDcCO489nWA/XcRk3mvDNLVeunYFfxrok3D6NOiQCcbzg0QkI5wWnORAqg
	z7j1bz6A==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfEUy-0000000GGzN-2mby;
	Tue, 04 Feb 2025 08:41:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A39D2300599; Tue,  4 Feb 2025 09:41:35 +0100 (CET)
Date: Tue, 4 Feb 2025 09:41:35 +0100
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
Subject: Re: [PATCH v8 03/15] futex: Add basic infrastructure for local task
 local hash.
Message-ID: <20250204084135.GN7145@noisy.programming.kicks-ass.net>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250203135935.440018-4-bigeasy@linutronix.de>
 <20250203144101.GL7145@noisy.programming.kicks-ass.net>
 <20250203155251.cAKJlgIZ@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203155251.cAKJlgIZ@linutronix.de>

On Mon, Feb 03, 2025 at 04:52:51PM +0100, Sebastian Andrzej Siewior wrote:
> On 2025-02-03 15:41:01 [+0100], Peter Zijlstra wrote:
> > Notably, I'm also still thikning about all that pending FUTEX2_NUMA
> > stuff.
> 
> With local-hash there is still room for FUTEX2_NUMA?

Yes, single process can span multiple nodes, and then you still get the
cross node contention issues.
