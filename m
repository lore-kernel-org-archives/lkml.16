Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349D8209F4B
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738597978; cv=none; b=qtmTmbiVU2W93nyRSctIZJCORVApW6Bw5ix517a8JFvEYylXa4ZFkjHEB4Y3URn0+ZWkhZg5Q71O/v9QkDY2mTX8oEPvZaB4KTEJyqI6rBClCoTPTthZlJyS3f3tZuDpyN0xrOpwsa3q+jXUGEJmJQfAUobkD589zXCjzuMWB9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738597978; c=relaxed/simple;
	bh=697lyW4rmmP9ALYCgDK1fJSZtvaklIekgE9OqRwlADE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gNcurijPCPPx4gcLolkLU3BYImBJn9T7axjysLydbIaZ+eXqUz2yE1LSbIZf3UANzLgaSYMmemxOel1aarbn/gUwLrdr9H28JKjz7aaHq8/W84zq2tGyQ4Xc8iH+paymjRQrYeAIv4hELkdQQD0G4+2UGZRQ2mwyTNfMRS07B04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nx0H7gVe; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ix6JnMrZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nx0H7gVe";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ix6JnMrZ"
Date: Mon, 3 Feb 2025 16:52:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738597972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=697lyW4rmmP9ALYCgDK1fJSZtvaklIekgE9OqRwlADE=;
	b=nx0H7gVeLQqkno9ysMJcmL4wX4OM76/blOGGnb5A37Te2tplI+CPn9k1ckHvigGHX9dhA6
	lHvHRa8PLENchd3d8tL5tA8reSwaz/DhPxPbTR+v6wqRwbo0QQNhriW+Dr/YhvS24ysV9H
	rzoN8b94msoSVGEKlFozQzS9B7ml3xMNBSjOdZhhRElw3WlH1AovyW1DfY0RGX1fjFpkQk
	7hdF8YYjH4/ZnISsgTPdVTs2weQWVrYTCw9iJ7vCMfOHukDG27FjWtbjz7/XfwaDELNi+K
	cad+gp3UwUiVG83nEe25jWxZDhJ1zuPpmxv41gLSnNV+NrlqvTzq4/CkzE+bjg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738597972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=697lyW4rmmP9ALYCgDK1fJSZtvaklIekgE9OqRwlADE=;
	b=ix6JnMrZGOeOUCMlgCsZhEK3W+F1XId33u6SAdMu4R962k/GNh7zaiRJHPs5tZZNfE44D2
	LbbfN0Id1e8/b8Ag==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v8 03/15] futex: Add basic infrastructure for local task
 local hash.
Message-ID: <20250203155251.cAKJlgIZ@linutronix.de>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250203135935.440018-4-bigeasy@linutronix.de>
 <20250203144101.GL7145@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203144101.GL7145@noisy.programming.kicks-ass.net>

On 2025-02-03 15:41:01 [+0100], Peter Zijlstra wrote:
> Notably, I'm also still thikning about all that pending FUTEX2_NUMA
> stuff.

With local-hash there is still room for FUTEX2_NUMA?

Sebastian
