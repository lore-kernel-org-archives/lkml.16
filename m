Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58069207DF6
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 10:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738664516; cv=none; b=PnOBghn/qjw04di1fjs6LffthQEOt4oSHemaPlDGgvveRie0it0D1PKurxREtzGA1o47qKengubwS7SrjUba479qNUsbV7Nnkdp/Yk5dPvIHPICFC7vjY3ol5eGMArGaqBqpZrAcDBdfLZEEMlT662juslD0+HKx8e4+9RY7pJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738664516; c=relaxed/simple;
	bh=qyI3vrifarulcFHM37n4RJFrOBtxdeW2iqd7Rto2UOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDlr8q6dt+jMw1cBlzYtRApzXKb5cU1wmTt1wlNmPrvXbv0R1c/Cg6kdnCYpaAK1IKKjhkou4hJdDWaZZkHF+buzax8gIcAcrcGH6RL00CfFYxO3f2k4OsIxfURJWr4d3ygDNKUgmduYGb4dq877tHI7DPMWg4onOzO+bjsX8JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=joISANmO; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="joISANmO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fz9yhlaeOJe8kDvxr+8xVVhpa0M0sP+lsx1wAkcgDao=; b=joISANmOklWBaBtdwcHTcdwHHO
	2BvX/z9Xko2knSkkSMrt/rS6qFnAfpZg8T9QVTnqQOXdZTXLNZKtBiYpunoWxGVJe/Ks8aEMXeMIA
	T6vtFgazWnumrg8oUi/qkQxvaeFioK5uSkFknqcNr4lfbM0Ja4eBAHqV3QZBEO5AlIe7aNmQXY+7b
	emehu1KrxqhFuuP5e2N5jldNFoDHMW7jmgFv4crt9+likmdbMEFAR9rt4nSYmt524afGlztiCcWbv
	WNXRknTGr4FYnPtoqMJEirGQUpFKYFLGtoK6sttpk+DvzMdSSWzNIp+a6p6aC2NK5HpMzgKa4wsvr
	B4GVEHtw==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfG3v-00000002YBR-0xH2;
	Tue, 04 Feb 2025 10:21:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 51111300599; Tue,  4 Feb 2025 11:21:46 +0100 (CET)
Date: Tue, 4 Feb 2025 11:21:46 +0100
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
Subject: Re: [PATCH v8 13/15] futex: Resize local futex hash table based on
 number of threads.
Message-ID: <20250204102146.GT7145@noisy.programming.kicks-ass.net>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250203135935.440018-14-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203135935.440018-14-bigeasy@linutronix.de>

On Mon, Feb 03, 2025 at 02:59:33PM +0100, Sebastian Andrzej Siewior wrote:
> Automatically size the local hash based on the number of threads. The
> logic tries to allocate between 16 and futex_hashsize (the default for
> the system wide hash bucket) and uses 4 * number-of-threads.
> On CONFIG_BASE_SMALL configs the suggested size is always 2.

> +	scoped_guard(rcu) {
> +		threads = get_nr_threads(current);

How about something like:

		threads = min(get_nr_threads(), num_online_cpus())

?

> +		hb_p = rcu_dereference(current->mm->futex_phash);
> +		if (hb_p)
> +			current_buckets = hb_p->hash_mask + 1;
> +	}
> +
> +	if (IS_ENABLED(CONFIG_BASE_SMALL)) {
> +		buckets = 2;
> +

Or... you just disable the local thing entirely for BASE_SMALL and have
it fall back to the global hash.

> +	} else {
> +		/*
> +		 * The default allocation will remain within
> +		 *   16 <= threads * 4 <= global hash size
> +		 */
> +		buckets = roundup_pow_of_two(4 * threads);
> +		buckets = max(buckets, 16);
> +		buckets = min(buckets, futex_hashsize);
> +	}
> +	if (current_buckets >= buckets)
> +		return 0;
> +
> +	return futex_hash_allocate(buckets);
>  }
>  
>  static int futex_hash_get_slots(void)
> -- 
> 2.47.2
> 
