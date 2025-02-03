Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E855A20AF9C
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 14:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738592970; cv=none; b=I2ji8H6qeQSEAjplVI1zZ1syzCySVGt9z80glIhDDa+6FgMzgJL+vzLYi3PQiew2Yp/7T+KgAV75xDIu7ygL2aXfUiiSx69SHX6VeSC0zl8EMSoJE+aPn7VrD8aObfgc/s/VSnnHtAMqrq/TLgsLXB7kPFM3oi6J0hgwpAXfweA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738592970; c=relaxed/simple;
	bh=09m973yEc3VJ4Dr8LCpfizi+F0ljsaa/SxrXZ+pPDA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyqtT8OO+b7LGgH2lRMmjPmD92a7EsbWI5GFvhssqjNjcNHNitW5lltQmTzblIAWbQ1LAVVEm/mIyJruDOatXVvA6c+BLRzSlTdCAxXslW6HDlVwwWYBNCfDNE/xQd/OVDqCnaWv+ZXNR5Cq24UFuJ+KlcOlnbL9OxyUiUBsEhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RFGPsOgC; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RFGPsOgC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tEnVkrUjPb0A6ehJ3DypdYLDyUCfsbMf/ZEGqCu26Hc=; b=RFGPsOgCNkROSs8Q661UstNQxx
	W9kUmwvBjXkr/FCOIyFZchOX1ibrulYzHPqWwmuRchdxyq521+TrTJWrFq73jaqJhnZy64dK3QNMW
	IajYrj7Mg7vmvEb7y+dQbjhzY7LrZw3ENUE6CWK2mn9sl7vKfEs28AHl0pNhSPvUfpgYyCpffMqKT
	CVoyqVTWx1pD5GOwV3iUNIqgnMECNo5l+BQ9I6j/V4e9AaVVG5/+LG+PvPzceePzQhq8Pbw6afl0y
	i+yQnv1WOEJ30s5poX3Bl3M7CuPJ2/ZI5ahC3NsLBxdXkM1nFo6qKYk6jZmsxuHEk6AdPo2Yk93BN
	qRddGgFA==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1texS0-00000001BXb-1jcm;
	Mon, 03 Feb 2025 14:29:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8A13B30035F; Mon,  3 Feb 2025 15:29:23 +0100 (CET)
Date: Mon, 3 Feb 2025 15:29:23 +0100
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
Message-ID: <20250203142923.GJ7145@noisy.programming.kicks-ass.net>
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
> +static int futex_hash_allocate(unsigned int hash_slots)
> +{
> +	struct futex_hash_bucket *fhb;
> +	int i;
> +
> +	if (current->mm->futex_hash_bucket)
> +		return -EALREADY;
> +
> +	if (!thread_group_leader(current))
> +		return -EINVAL;
> +
> +	if (hash_slots == 0)
> +		hash_slots = 16;
> +	if (hash_slots < 2)
> +		hash_slots = 2;
> +	if (hash_slots > 131072)
> +		hash_slots = 131072;
> +	if (!is_power_of_2(hash_slots))
> +		hash_slots = rounddown_pow_of_two(hash_slots);

Why not require the argument is 2^n and fail otherwise?
