Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8346207DEA
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 09:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738661651; cv=none; b=efRSaK46ehaYgb6K564oR2Mq2UNTYtXfb33tODvM0Y0EJi7fXBsyH4UxMYcYMZ9KI5oI6v91YKUN9lhac6exQPrLSw4G4njfZZeDLmYMCzSrWqyjHTNJbwMCdH+HtBiOaymyAOAyddnloJVx3285uac8+OY208Fu/PSYjyvuH/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738661651; c=relaxed/simple;
	bh=MCyAbV4y5NLnd55sJGM62e5OITZ5LpHrseaLk09/0P4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sxIRgPidKk1p629PBBP49dC9jJvgDkA98mX7pJSiwthUPYV4C2hzozavIs6oNFGbs5TAR7+Lwzq+wHHuwTKrl+q3BZbNP+aPppvxhEMaKbrufqEbQkoUtr3GN6M3Gla2V1D6S+YXxyjnHLNPTL8j8UnTFhuptLetvswrywfjK+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Qf9e7Yn6; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Qf9e7Yn6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OxCHpWd+zIyfsGnvl5RE71IMkGdJ+lhAIa/m0GzPnTU=; b=Qf9e7Yn6DX6+9Hnmb3IHS0cBD3
	eq8zkEArs1yeaVflJ+uB3//lJ1NrJKM8CT4fgDwqy+C+D9URLY6RCcpLMC+L83hy0V2Fi25n+AERs
	tzVgwtY/Zxk4N3IguHFqxdlpdrUk5iJJV3IuUhpu0+349ERlTtVR1eQFDpznwaFoG8gEMot7QyBW+
	EeLq051m9v7U5rV0COy9rCq76E3yRg61D7/WVSbhfdk1uv/4MX6UCWEVKsIqn7A5Jdf8SwJTp2khw
	kDEyTmdFRSXDutHRQ8vMGmxbijzKR/W8eiJiXtXs9YctGQ6szZDHWOOKhPmpHIMSooljcYM9UB0nH
	8qyIS26Q==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfFJj-00000002UN3-1uly;
	Tue, 04 Feb 2025 09:34:03 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CA84E300599; Tue,  4 Feb 2025 10:34:02 +0100 (CET)
Date: Tue, 4 Feb 2025 10:34:02 +0100
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
Subject: Re: [PATCH v8 06/15] futex: Move private hashing into its own
 function.
Message-ID: <20250204093402.GR7145@noisy.programming.kicks-ass.net>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250203135935.440018-7-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203135935.440018-7-bigeasy@linutronix.de>

On Mon, Feb 03, 2025 at 02:59:26PM +0100, Sebastian Andrzej Siewior wrote:
> The hashing of the private is slightly different and will be needed
> again while moving a futex_q entry to a different hash bucket after the
> resize.
> 
> Move the private hashing into its own function.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  kernel/futex/core.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/kernel/futex/core.c b/kernel/futex/core.c
> index f608cd6ccc032..fdfc3402278a1 100644
> --- a/kernel/futex/core.c
> +++ b/kernel/futex/core.c
> @@ -117,6 +117,18 @@ static inline bool futex_key_is_private(union futex_key *key)
>  	return !(key->both.offset & (FUT_OFF_INODE | FUT_OFF_MMSHARED));
>  }
>  
> +static struct futex_hash_bucket *futex_hash_private(union futex_key *key,
> +						    struct futex_hash_bucket *fhb,
> +						    u32 hash_mask)
> +{
> +	u32 hash;
> +
> +	hash = jhash2((void *)&key->private.address,
> +		      sizeof(key->private.address) / 4,
> +		      key->both.offset);
> +	return &fhb[hash & hash_mask];
> +}
> +
>  /**
>   * futex_hash - Return the hash bucket in the global or local hash
>   * @key:	Pointer to the futex key for which the hash is calculated
> @@ -131,14 +143,9 @@ struct futex_hash_bucket *futex_hash(union futex_key *key)
>  	u32 hash;
>  
>  	fhb = current->mm->futex_hash_bucket;
> -	if (fhb && futex_key_is_private(key)) {
> -		u32 hash_mask = current->mm->futex_hash_mask;
> +	if (fhb && futex_key_is_private(key))
> +		return futex_hash_private(key, fhb, current->mm->futex_hash_mask);
>  
> -		hash = jhash2((void *)&key->private.address,
> -			      sizeof(key->private.address) / 4,
> -			      key->both.offset);
> -		return &fhb[hash & hash_mask];
> -	}
>  	hash = jhash2((u32 *)key,
>  		      offsetof(typeof(*key), both.offset) / 4,
>  		      key->both.offset);

Humph, this is a lot of back and forth. Maybe just do it right once?

Anyway, perhaps write it like:

static struct futex_hash_bucket *futex_hash_private(union futex_key *key)
{
	struct mm_struct *mm;
	u32 hash;

	if (!futex_key_is_private(key))
		return NULL;

	mm = key->private.mm;
	if (!mm->futex_hash_bucket)
		return NULL;

	/*
	 * Since key->private.mm is the same for all keys in this hash
	 * table, it does not contribute anything, and skipping it
	 * allows jhash2() to take a shorter/faster path.
	 */
	hash = jhash2((void *)&key->private.address,
		      sizeof(key->private.address) / 4,
		      key->both.offset);

	return mm->futex_hash_bucket[hash & mm->futex_hash_mask];
}

struct futex_hash_bucket *futex_hash(union futex_key *key)
{
	struct futex_hash_bucket *fhb;
	u32 hash;

	fhb = futex_hash_private(key);
	if (fhb)
		return fhb;

	hash = jhash2((u32 *)key, offsetof(typeof(*key), both.offset) / 4,
		      key->both.offset);
	
	return &futex_queues[hash & (futex_hashsize - 1)];
}
