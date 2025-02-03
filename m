Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72160208995
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 14:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593667; cv=none; b=nQFJw5nsau6K2s89uSl5XyavbmFpuSLcevWy2vh5D9hId8A6N867u3QFzZ27EfgznZ9HnpzYT2qmitdov6Z8kOcfpydG1MXjQBDsrzvwGuDR9Y9WJzEIFTrvEmyV7lN9keSp+5t3mCCW8f2ZWRso4O42zp4SyLS28Ho5oWbyZIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593667; c=relaxed/simple;
	bh=0oxO+ggHVEKAMCM5heMYLDNY2WE75Q2SPbfFi2Ns3m4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDMM5/YZ/Co8HBrXly+ErjqKZKN1tZngIRYnSOgQpctp5VFcmnxrs2Mx5tqLC4haIrtkVGLTpz64Qik/TI+7lM5LzrAxBtdvKutY6JkDKl8jKgQGsKyz7vSq5BHK9zumKxY9aR5/J09j6tWZyIWjFMES22vFF12roakUcODdegM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=L9xNesoi; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="L9xNesoi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Prful+QMKKgbUWXsO4GhVfqjgbD/R50XLJMF+5tpIWs=; b=L9xNesoiTA90mkEBcKbtoVKai7
	WsGCV7rwIAVpJVhdEPsC8MU3EGsNEyjL/MhqchkMR6CBonDy7I5YPdIfiVXWUMD+oDskyfPaeWnzp
	5z8Mz3ZxI1QaA5mIPcbm4qcLxZZiVT0hUM3ENhsAZumFny+Ol7mTLzr/j8jHdaneGU5YzdQPdDRfZ
	zkw2IUfA84qcfWrBOxl9IyTyM0I/l1ZghCzua4CS6jU6dtIBnQnZiJozl4AlTGZboPdPz2yvC24jX
	byM9K1UBUGc5uDhDXWxuEDDbUk8mpOkydAEIjq7AmtSeiulaHwcpVkk2CE4oPSFL0WckjkpBlO83c
	IjUdWaZg==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1texdG-0000000G6Ea-1sqs;
	Mon, 03 Feb 2025 14:41:02 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 03671300310; Mon,  3 Feb 2025 15:41:02 +0100 (CET)
Date: Mon, 3 Feb 2025 15:41:01 +0100
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
Message-ID: <20250203144101.GL7145@noisy.programming.kicks-ass.net>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250203135935.440018-4-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203135935.440018-4-bigeasy@linutronix.de>

On Mon, Feb 03, 2025 at 02:59:23PM +0100, Sebastian Andrzej Siewior wrote:

>  struct futex_hash_bucket *futex_hash(union futex_key *key)
>  {
> -	u32 hash = jhash2((u32 *)key, offsetof(typeof(*key), both.offset) / 4,
> -			  key->both.offset);
> +	struct futex_hash_bucket *fhb;
> +	u32 hash;
>  
> +	fhb = current->mm->futex_hash_bucket;
> +	if (fhb && futex_key_is_private(key)) {
> +		u32 hash_mask = current->mm->futex_hash_mask;
> +
> +		hash = jhash2((u32 *)key,
> +			      offsetof(typeof(*key), both.offset) / 4,
> +			      key->both.offset);
> +		return &fhb[hash & hash_mask];
> +	}
> +	hash = jhash2((u32 *)key,
> +		      offsetof(typeof(*key), both.offset) / 4,
> +		      key->both.offset);
>  	return &futex_queues[hash & (futex_hashsize - 1)];
>  }

Having read this later patch, I would still prefer this to look like:

struct futex_hash_bucker *futex_hash(union futex_key *key)
{
	struct futex_hash_bucket *fhb = current->mm->futex_hash_bucket;
	u32 hash;

	if (futex_key_is_private) {
		// shorter jhash invocation;
	} else {
		hash = jhash2((u32 *)key,
				offsetof(typeof(*key), both.offset) / 4,
				key->both.offset);
	}

	if (fhb)
		return fhb[hash & current->mm->futex_hash_mask];

	return &futex_queues[hash & (futex_hashsize - 1)];
}

Because the shorter hash invocation only cares about being private, not
about having fhb.

Notably, I'm also still thikning about all that pending FUTEX2_NUMA
stuff.
