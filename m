Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AB12AF12
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 06:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746427886; cv=none; b=GmL2SH6ks14uxekK4n0vB7DP/jhu5LoKC/IRuvB170Bvvz+Un4hlXXfUYlPr4xRzVV0btum0mqJn52XJNzhWHnZoBaIrK3+Txet950FKTAhgZPCWYIqh5qWFgVqVLw9k/GgR9RKXC33/kY+fE7MaL93tro2kyEZrWyESPIgze1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746427886; c=relaxed/simple;
	bh=WKDi2DBz0EFGyyFCivU5y4nA3If+67zahzg+SFe/hdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJxJMQffBAk2FsaEEZpeCWbJQs+cbmf74CMbw2K5pvhka9qpSBiusQJREdpYnmPXuSuarenQ8VVvmKFOlXkEnMZi1Gow71ip1Gm35YUOxKirZ2ryw/3RpPInMBnAcGTpYaO9e2j1qr+8o1l4GYyldYOT59xVdL9joBtWW3AjVQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CDo0OFgU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Q4j08Nv3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CDo0OFgU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Q4j08Nv3"
Date: Mon, 5 May 2025 08:51:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746427882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n8dRSHz638lFsCJTjfEBQgKBLIYyCMVYRNOfCqmzPbY=;
	b=CDo0OFgUBsX8ntaKiFI/T6BIETmnHgzvNFbEQWVqbsxDiElstZ8R3NyFjJZSFear9ww1uG
	GQJt2jP+WCc0ZgY+BstNfHehZO3J6z+zwxH6YUzQHFYIrC8f0TNlabSzqgfQdbzDy952dw
	tPY8k2w3vSyAqt1EEBgY09XFIyD9QZogS6uAbWsJVVqMykTK01oPcobkEqlnXwYn5Tw4UW
	dUksXrzzohNxwlEwrgWmhU9+9nFTMnFj5r+euEkLVM3V77n0Dkzu0rbT09aJn01mtN3XCo
	2SAo6Rz5rlSC+QNo+eVF3RW1Js1pJguh1aQZD7qqVH8x4I4XmIRbnYp3jViwPg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746427882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n8dRSHz638lFsCJTjfEBQgKBLIYyCMVYRNOfCqmzPbY=;
	b=Q4j08Nv3Lmy1ZTE0hQmKcs/kYjiDrb+mzzaZAXjg4iJrPBgfhzBisPDi7Gi18Yt2bvaPEd
	cHh6YO+4H/bvabBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>
Subject: Re: [PATCH 0/4] Workqueue: rename system workqueue and add WQ_PERCPU
Message-ID: <20250505065121.dlEw6_SC@linutronix.de>
References: <20250503082834.49413-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250503082834.49413-1-marco.crivellari@suse.com>

On 2025-05-03 10:28:30 [+0200], Marco Crivellari wrote:
> Hi!
Hi,

> This series is the follow up of the discussion from:
> 	"workqueue: Always use wq_select_unbound_cpu() for WORK_CPU_UNBOUND."
> 	https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
> 
> 1)  [P 1-2] system workqueue rename:
>  
> 	system_wq is a per-CPU workqueue, but his name is not clear.
> 	system_unbound_wq is to be used when locality is not required.
> 	
> 	system_wq renamed in system_percpu_wq, while system_unbound_wq
> 	became system_dfl_wq.
> 
> 2)  [P 3] Introduction of WQ_PERCPU.
> 
> 	This patch adds a new WQ_PERCPU flag to explicitly request the legacy
> 	per-CPU behavior. WQ_UNBOUND will be removed once the migration is
> 	complete.
> 
> 	Every alloc_workqueue() caller should use one among WQ_PERCPU or
> 	WQ_UNBOUND. This is actually enforced warning if both or none of them
> 	are present at the same time.
> 
> 3)  [P 4] alloc_workqueue() callee should pass explicitly WQ_PERCPU.
> 
> 	This patch ensures that every caller that needs per-cpu workqueue
> 	will explicitly require it, using the WQ_PERCPU flag.

Sounds like a plan.
I assume the huge patches were made with coccinelle?

Sebastian
