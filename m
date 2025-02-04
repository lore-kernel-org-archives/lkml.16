Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0AA16B3A1
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 11:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738667142; cv=none; b=ifvXmZUxMhnIHSJvYalnVO3L8UnBWjbIjmFAwjmYbXVUpckqX8eToBgVdyNjHgJ/LNmFbM/aEPJ0TvaD1TGMlDNp4Kao4eXncVT78EsZrXBudEGBCvJckzUhNA/HWXl9DXUPaaTux/tsOApfuAuIOU2ckqqdrS3CdB7ygb6d01Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738667142; c=relaxed/simple;
	bh=3qXpIHe2FUO3VzFPMDPMhe0pi9QRcNfP3+OtVQgoVdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RhyQiqQ5ETH5E1VV2SFNAM/zx6r2DQi8ytiI938QcIorwY0KrWHbCLZ3d+fWtvfoJyOXbD9ms+6uLGZwQZeW7mIix681uu7WF0LrTPWZTMmwrlBcgdV1xJ9SPxlNSyIvvMbS2A7vmZQWeCwl7nhIsXfa8yAYUwqkhb1xomjLOYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ipxGXTf5; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ipxGXTf5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Z2+Su9oTeSIEt1i+r+ymimR1EZQNGH/y41ZsPG4SZpY=; b=ipxGXTf50Fl6P42XKJntsbHSqQ
	4hOG9KHKTAzqDofLVhEaWujyDSAn1J2Sey3GjXA+e/tNTI4AylsbRO8I1sEcEqZTcEaMEieRmr/xZ
	kMDsn1hZgyLMx3T9vGu+WVxyhYRFUiHlRpmf74vhmN3p3aMWKwnBv1FAWWRx7B89sMfXjVINCOhU1
	33bX4NafGDn514u+VZbwdv/GiGhCGU3GHFwCj0RId3woHjF/o7JmWbY1rufXDesdtUwtn7o/AF4y9
	2hGdUquaCQapBaz9D3eG1D58rVAOoGJRwtF+J+DlcSPqXehrDVeEnJVfeDIaF2pVqd+PjXFX0Fm94
	qmqGUhSQ==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfGkI-00000002bRU-2NkQ;
	Tue, 04 Feb 2025 11:05:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 992E13002CE; Tue,  4 Feb 2025 12:05:33 +0100 (CET)
Date: Tue, 4 Feb 2025 12:05:33 +0100
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
Subject: Re: [PATCH v8 12/15] futex: Allow to re-allocate the private local
 hash.
Message-ID: <20250204110533.GV7145@noisy.programming.kicks-ass.net>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250203135935.440018-13-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203135935.440018-13-bigeasy@linutronix.de>

On Mon, Feb 03, 2025 at 02:59:32PM +0100, Sebastian Andrzej Siewior wrote:

> @@ -159,11 +281,25 @@ struct futex_hash_bucket *futex_hash(union futex_key *key)
>  
>  bool futex_put_private_hash(struct futex_private_hash *hb_p)
>  {
> -	return false;
> +	bool released;
> +
> +	guard(preempt)();
> +	released = rcuref_put_rcusafe(&hb_p->users);
> +	if (released)
> +		WRITE_ONCE(hb_p->released, true);
> +	return released;
>  }
>  
>  void futex_hash_put(struct futex_hash_bucket *hb)
>  {
> +	struct futex_private_hash *hb_p;
> +
> +	if (hb->hb_slot == 0)
> +		return;
> +	hb_p = container_of(hb, struct futex_private_hash,
> +			    queues[hb->hb_slot - 1]);
> +
> +	futex_put_private_hash(hb_p);
>  }
>  
>  /**
> @@ -175,6 +311,14 @@ void futex_hash_put(struct futex_hash_bucket *hb)
>   */
>  void futex_hash_get(struct futex_hash_bucket *hb)
>  {
> +	struct futex_private_hash *hb_p;
> +
> +	if (hb->hb_slot == 0)
> +		return;
> +	hb_p = container_of(hb, struct futex_private_hash,
> +			    queues[hb->hb_slot - 1]);
> +
> +	WARN_ON_ONCE(!rcuref_get(&hb_p->users));
>  }

> --- a/kernel/futex/futex.h
> +++ b/kernel/futex/futex.h
> @@ -115,6 +115,7 @@ static inline bool should_fail_futex(bool fshared)
>   */
>  struct futex_hash_bucket {
>  	atomic_t waiters;
> +	unsigned int hb_slot;
>  	spinlock_t lock;
>  	struct plist_head chain;
>  } ____cacheline_aligned_in_smp;

*groan*

Just sticking a pointer in was too complicated?

void futex_hash_put(struct futex_hash_bucket *hb)
{
	struct futex_private_hash *ph = hb->private;
	if (!ph)
		return;

	futex_put_private_hash(ph);
}


