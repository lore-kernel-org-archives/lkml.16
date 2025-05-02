Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E2F33F7
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 18:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746211559; cv=none; b=P3kXCquKtx4I7He4reC9qpVLQ/ePTRezBRguNHp50cGZoxJqlXN9AAjNI7ToOt/W+qFbVljCLgKnh4St6IU5LtY+OqGFIGuc6wDgxUSKQcHO/jM6B0iQbe6vT2U2CvfxqqPxE7UHh7l37e2xl0/l2tgVFUEYEdDAjJVIcv0aues=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746211559; c=relaxed/simple;
	bh=8K2wL0bwrZWhyubztD2lMnhOlAKndx04TjfEHNfPYeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GM+lkAEa99HWHKmhg3DHdDb54jxh8OyA4Tdk6V+nQAbFrvnB2fPjJGKYgBgKdJV1JTZUIR2IDaYRGb4Vfqyy9JUvU5LGvNiYz9qonD5xzL13fSACn6reuqfpyTFgLibmvw0JDgZ8P9U0a3JuQGY1pmnLL0pAbHW3yIrIMhgAGp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=THTkcNZ7; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="THTkcNZ7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wb49Lo4Qm/tATeMu2F2wGI5tWau97QokSxryy/dHfj4=; b=THTkcNZ7qHR7yOwbbThpdonyIB
	3ZMvXsVzuQCmm7+sQSMWoBFByhilfTlGzx8/5N9lxbwjZSGiRtMjvvNL0W8+WXRxsaE4TeV2yyDaG
	LGcGtJROrRZ00rp7BxPNRJYJdqIqiIylrkkfNWfJ3miY9f/TjmWgWQJpt5qKA+m6LbQPuFhVllz5B
	7aM8v4U0v6ILOPtrGOD1LjuyvzOIorw4cnfeRE5nfi1yhuSOsR9NltFjwjDZGymxF5QRp9lcT7R60
	KUczuGZlIH5SgRg3YwjZiUsm7BMq3SipD4UH+2FGNbENug/iHEtvCqDPuT99c/tnrLBxIs+55sU/a
	UsBV9v8Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uAvOK-0000000F5Ol-3Dpi;
	Fri, 02 May 2025 18:45:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4EC9130057C; Fri,  2 May 2025 20:45:42 +0200 (CEST)
Date: Fri, 2 May 2025 20:45:42 +0200
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
Subject: Re: [PATCH v12 17/21] futex: Implement FUTEX2_MPOL
Message-ID: <20250502184542.GA24078@noisy.programming.kicks-ass.net>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-18-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416162921.513656-18-bigeasy@linutronix.de>

On Wed, Apr 16, 2025 at 06:29:17PM +0200, Sebastian Andrzej Siewior wrote:
> @@ -342,18 +411,20 @@ struct futex_hash_bucket *futex_hash(union futex_key *key)
>  static struct futex_hash_bucket *
>  __futex_hash(union futex_key *key, struct futex_private_hash *fph)
>  {
> -	struct futex_hash_bucket *hb;
> +	int node = key->both.node;
>  	u32 hash;
> -	int node;
>  
> -	hb = __futex_hash_private(key, fph);
> -	if (hb)
> -		return hb;
> +	if (node == FUTEX_NO_NODE) {
> +		struct futex_hash_bucket *hb;
> +
> +		hb = __futex_hash_private(key, fph);
> +		if (hb)
> +			return hb;
> +	}
>  
>  	hash = jhash2((u32 *)key,
>  		      offsetof(typeof(*key), both.offset) / sizeof(u32),
>  		      key->both.offset);
> -	node = key->both.node;
>  
>  	if (node == FUTEX_NO_NODE) {
>  		/*

I *think* this hunk should've been in the previous patch; because it
changes the behaviour of FUTEX2_NUMA (to the better).

Anyway, nevermind, just wanted to point it out.
