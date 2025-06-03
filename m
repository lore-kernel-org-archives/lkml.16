Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5409B23371F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 15:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748965917; cv=none; b=pZQBHNzXUHVqDrDrsfsgaSehghjbjaeq1VMVz4eBx9gDsQFqA39J++M2AWVBMseld3xKpoOcT56CNW+tr7GE3kxxPlKebfDhg+srAickbwasSFaaTegXzmKA5j0uPhsxHzV8+zqE5QX9gLLxbvvFVhXBMF6XHjfeEoyXPHaiW8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748965917; c=relaxed/simple;
	bh=DZdqBhRj0/gOriotZXB6ZP8e4jo3TJAncRLGWxLdw9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=POzRvERQ3W/IvMjcmDqj+xFK+TMK+SOmyovOhxonhNCd4VAvSlh91WVML5vOLEUvozxq+c07kX9GVJuufxXpqNoMATAcm7f6GMZPLTAe8NSIVeDvs36hH+L+QQqjq+/bvCmtX1POVPtWzROy/v2Z9TbJ+cPcx55TDVR6Ab4yuFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PJmmHRDb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qurIiuHy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PJmmHRDb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qurIiuHy"
Date: Tue, 3 Jun 2025 17:51:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748965914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=18jG+YqBJCAq7E6tV4htbdv078n7QtztAtwdbLPugJ8=;
	b=PJmmHRDbZ8T3FUSXtOIjjqYrzHyu3dMJrdgLfHXAxY6GQBVFYusYpRVuCoxpLsNlxTEGVM
	D/RTa3xFqDKgCSgL+jVf1piOs4TLKQWcqL8Zl+3C0ZTZ9MQAbVXtJTSILBxvz9sNSA1oMr
	oYv+Yh5HFbb2+syen/4kGTl0GjPtZgi6kOvz45wgvrBLOu61Y1sc6umyXcS/hokHm8F58i
	cKIgXi8/Qe7JULFSmlHotmKngOjZUaDPtVtbZAEjA5I15ITNcnE6myLUq9xyyIzRvvCT+y
	FcYbR/+ShED6jGTZDbmY66njX1RIj7fIr4NCnZA9xCn76sFpGk2BfOf9IN9pNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748965914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=18jG+YqBJCAq7E6tV4htbdv078n7QtztAtwdbLPugJ8=;
	b=qurIiuHy53aRapJ1MZscn26oQYcSIgJg7LI1JbEdKY6fb/XuqJet1VWG6pr6lxAjpeJgdZ
	UtmayrQwKHMqPiCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [linus:master] [futex]  7c4f75a21f: will-it-scale.per_thread_ops
 98.3% regression
Message-ID: <20250603155152.WGVMzZhN@linutronix.de>
References: <202505291011.9fe37568-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202505291011.9fe37568-lkp@intel.com>

On 2025-05-29 12:50:44 [+0800], kernel test robot wrote:
> 
> 
> Hello,
Hi,

> kernel test robot noticed a 98.3% regression of will-it-scale.per_thread_ops on:
> commit: 7c4f75a21f636486d2969d9b6680403ea8483539 ("futex: Allow automatic allocation of process wide futex hash")

there are several reports about a regressions and improvements regarding
the futex per-process series. The regression reports outweigh
improvements. The percentages vary also the offending commit does.

The test uses "random" memory allocations and locking so we get what we
get. We could use the prctl() function to set it back to the global hash
and let it behave as it did before.

I'm not exactly sure what causes this. It could be "less" hash buckets
and therefore higher hash collision or the atomic-inc/ dec on the hash
bucket. The commit referenced in the report creates only a private hash
of 16 buckets. A few commits later this is change to auto-scale. So it
would get better if the smaller hash is the problem.

Sebastian
