Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A49020896E
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 14:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593699; cv=none; b=rte0OKH3bWttUrOYFt4fD6RfXupweVWrtKQbo48C8Cn3lpwvLaEL4MKVEvFNBwnLpTYA82UEwp8ZsGhhkFOqWT5zRZQZ09AUSZz937LgsaM8DXppSaAPIe+amMz8FluqZ69X2fyLbIema1T+xWuKYcgsTbIWdgqvAPGP5DeRlfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593699; c=relaxed/simple;
	bh=ltXea6Dy41zUMHKIcST+02YDrxruNGIjSmO15JdrYJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fk8vw3KGPLwFra70ZuP0EzD5azEKpkfNF0/qSSVf7BZdLJ1o3vl53FD5BPPq8m8ZzRPQzNRTtW7kAPXLv8+2Xt1uGFrOYpb3xHy7oniz7jdoYVL5s6kc7LR1FNGrDZlt3kcvo/au3dvDdrZ2Rj/foOqeybD38pClyOy2kfO9q+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OiI3xyLw; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OiI3xyLw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BS/kTjv7NSk9UrSguL34+8wzxLuFBfKcV8ON445oUNc=; b=OiI3xyLwqSqAXF/L17rvQ4GGVH
	Q1uzNq76OdrZXMXopw4yGVuPc4HmgPkX3/6Gu43TsYNA31du71S2xqKIaG8nJYYbcoWWWnHZtLTMc
	+4SXZt8BuGGewQv94y1aA3c0/cwx4fUDN0s99reT7DFDAaahgsnO++6qfo+OeIN9lm0V9B4Sztep1
	jafbR/Qq/JOQ1xf8iEBq+Lc/yKatYqVI1ds8UMaHxIP6mRWe3y9w0+aSA7QiI1V8ARn0ekin5UZsV
	UxFRBFfPO8U/qN537FUxBDpIrQArBoJ8+zVCOSOiTe4/4iRcpLemCNjXqmedb4YrGUlCfZpDfNN5x
	UvCk4zIw==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1texdl-0000000G6Ex-1q4r;
	Mon, 03 Feb 2025 14:41:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0EF5630050D; Mon,  3 Feb 2025 15:41:33 +0100 (CET)
Date: Mon, 3 Feb 2025 15:41:33 +0100
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
Subject: Re: [PATCH v8 05/15] futex: Hash only the address for private
 futexes.
Message-ID: <20250203144133.GM7145@noisy.programming.kicks-ass.net>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250203135935.440018-6-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203135935.440018-6-bigeasy@linutronix.de>

On Mon, Feb 03, 2025 at 02:59:25PM +0100, Sebastian Andrzej Siewior wrote:
> futex_hash() passes the whole futex_key to jhash2. The first two member
> are passed as the first argument and the offset as the "initial value".
> 
> For private futexes, the mm-part is always the same and it is used only
> within the process. By excluding the mm part from the hash, we reduce
> the length passed to jhash2 from 4 (16 / 4) to 2 (8 / 2). This avoids
> the __jhash_mix() part of jhash.
> 
> The resulting code is smaller and based on testing this variant performs
> as good as the original or slightly better.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  kernel/futex/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/futex/core.c b/kernel/futex/core.c
> index 26328d8072fee..f608cd6ccc032 100644
> --- a/kernel/futex/core.c
> +++ b/kernel/futex/core.c
> @@ -134,8 +134,8 @@ struct futex_hash_bucket *futex_hash(union futex_key *key)
>  	if (fhb && futex_key_is_private(key)) {
>  		u32 hash_mask = current->mm->futex_hash_mask;
>  
> -		hash = jhash2((u32 *)key,
> -			      offsetof(typeof(*key), both.offset) / 4,
> +		hash = jhash2((void *)&key->private.address,
> +			      sizeof(key->private.address) / 4,
>  			      key->both.offset);
>  		return &fhb[hash & hash_mask];
>  	}

Like just replied to that other email, this should probably be moved
earlier and be independent of fhb.
