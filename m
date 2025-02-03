Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED106205512
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738589652; cv=none; b=qHje5FeCclL305EuA+seCrWxs59nwBgYOOEuKpzIgeDtuPKfsudtoUdIS3VD70NqIi1dXl0w/hQ//O1qukLfRduia5MzLmHpTgYxxgZF1hA9pQ+lbl6QjuZDbwXudJ/2d9yvlAgkIZtAwmDFfPMPNn9czzMGYf9FSejnk/I7Cbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738589652; c=relaxed/simple;
	bh=SBAP7dlc99j0DyzT9aoZZutLvi/Q59UcHXrJjLJeW6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHTbT7IZhaou3jzvhaAMb8P5T8hjqaLTlLkOBpA3nFGMftOJcEX1wXu83hpLUZ95NQzI1aE0SlstlAM+wBJIHfj5aAeCTzcVT+3fsaOCTRJ/bHmdJ+ltc/luaw0LiIq6fAAkwCzLYW9Qcf3oZgG3frAqi7nGhtwuv8wlWwQ+SNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=O1zqFuYH; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="O1zqFuYH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3wsy/3xWZiujZqIzL+rRTP1a5xI/VjXN2EAJ2pwWp28=; b=O1zqFuYH36xXnWtDezh+v3g7rk
	ui2t2ZUHnA3sX3+tn4AXB/wKn4D0sMcYHNthGi2vtZZ4MOZFbSdOp9xfvod3t6noCp6fjfhy9Sfab
	aY/yEvnzoYwK6HirKZ3iTDvxVMWWKwdWcypDGiXigTqckImamRoHpfwJXGGQIx8fka3QahgpRDsbV
	CyXEXNVQnUcCmWUmryDlNrC7ai0VhjW39l3Bdu5JWK3hhn2zt5NsoiGF51oZXkGgrwhYxfEz1Fq94
	hdy/bYBptA6WF3/YxpuDbhtPELnuujLY4NIGNzqo5hzrrkr4Rk4Qv14sYuf1UhdPCFzLYX3yrE55T
	4D8dHL3Q==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tewaR-0000000G5rK-0JBn;
	Mon, 03 Feb 2025 13:34:03 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F04F930035F; Mon,  3 Feb 2025 14:34:01 +0100 (CET)
Date: Mon, 3 Feb 2025 14:34:01 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Florian Weimer <fweimer@redhat.com>
Cc: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
	Vinicius Peixoto <vpeixoto@lkcamp.dev>
Subject: Re: [PATCH v2 0/4] futex: Drop ROBUST_LIST_LIMIT
Message-ID: <20250203133401.GF14028@noisy.programming.kicks-ass.net>
References: <20250127202608.223864-1-andrealmeid@igalia.com>
 <875xlzl6lq.fsf@oldenburg.str.redhat.com>
 <df74a144-c925-410b-804c-c223793d08cf@igalia.com>
 <874j1iismp.fsf@oldenburg.str.redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874j1iismp.fsf@oldenburg.str.redhat.com>

On Tue, Jan 28, 2025 at 09:35:26PM +0100, Florian Weimer wrote:

> >> Doesn't this turn a robust mutex overwrite or a TCB overwrite into a
> >> write-anything-anywhere primitive?
> >
> > The robust list is meant to be a private resource, per-process, and
> > this patch only rewrites it after the process exits, so I believe that
> > any changes done in this memory should be safe given that the process
> > will soon disappear anyway, right?
> 
> At least in the glibc implementation, we let the kernel handle robust
> mutex notification on thread exit, and that's observable.
> 
> Beyond that, process-shared robust mutexes exist, too, and those updates
> will be observable, too.

AFAICT we don't allow writing anywhere we couldn't already. The process
shared things should be in shared memory, something we can already write
to.

Notably, the kernel doesn't change address space while walking the
robust list (the robust list doesn't even contain enough information to
do this, even if we wanted to), it can only write to things the dying
task could already write to.

So I don't think there is a security angle here. Yes userspace can shoot
itself in the foot with this, but what else is new.
