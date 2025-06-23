Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9545B25EF82
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750693655; cv=none; b=FzQWsf/rUiD60+qEvXuPS1wnCOoqw/1DLLQUBL2xXOfh+4lvwrU35sv+mhWat3NYj5ICqWUw7JRICHRzaHqdQ7at0K5GiLT6CfuBkvqy4pUBGN+lJqs3z7jAlnA1f5u0trViIO7XhkuZweB4SM7yU4U35iI5ifluGmmK6O8qcd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750693655; c=relaxed/simple;
	bh=EKG14ZOQzaaYGD3X0xzYAfmF2d6RXXI1/3I7QMJPo/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6MAb3lR+oWzjV80YK1V9Gnt7epccjT1QvtefaPeuaeaRlRb2GCA4CPxjC7Jeua+eR5Wdiwgmsv9W+K2r+/z1AtxOyj4jaJ6z1mBMo3UpxbQVjfCHyGVeeIIM3G3xYNnk5iZnig3YpGTuXyD1tkidcguRtJtTZMh8pQXQWICH+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UG5DegPJ; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UG5DegPJ"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-404a5f4cdedso953468b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750693651; x=1751298451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e19ex1p/1LBOnXetMuCg5KYZZ6yY9+nHnj0I40BuyDg=;
        b=UG5DegPJVq+xw1Nc4wanJ/3/PRJ0GCy0+gIuLP0s5v9DhBYWtThZIPoOLukvJclAB+
         MFTYd2YJOu8sSj7ib6bJ556pVMUeAyHTRQpEaUumGGfl65PspzMllXH40nrQiDUVa7uM
         io5RuJ4EVaqGfoUqxNQPCDi5Zd9Ai7kFnA2WPn3GDwUKCY3bDVDSK0nJpcVU9Cbhfryo
         L09+Y4/TAMf2sWITydkotyU9Ne2eGo2oy/8hbBu4K/qP93MerRdokkuuSomYVYdYNceN
         y3OanasJ6FODGWbMip5KAYLrptivE+573UC3MeAVXqZ0BlU/eZ5H5JwMatYtflaXu8gH
         XKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750693651; x=1751298451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e19ex1p/1LBOnXetMuCg5KYZZ6yY9+nHnj0I40BuyDg=;
        b=kLI1C6NTC25C5+GzTg2Uq89yNLiJeMuDjpQq26ZJzXxss+r8m9t7DPKZlFO9w+1c6T
         qbojmcHyUJK49oGALZewei9bGpToUo8t6b2TEv3O9L2H6KxVdXl+WD7WKR0tcETNI04l
         Ry+wAweGmWWtpLa0yERzoJ6MOQaRfprQDej083rD0BNUvFWwmy9i/4F4/ROFsQwGH/WN
         pfKwwMuDK9xa9KOZdR1m65ZneKy4lK1KftHVVlKzr//oxKfYbveX87bBoMkbdit8GFdi
         bCQdPcDOuDFGqqiVfbCH9TX0u0oHqR+ooGhZalz7t+pC154Y3i9nKngaLLahcy6Cpdcz
         FVMA==
X-Forwarded-Encrypted: i=1; AJvYcCW9FrxRGcKfoJd2Lg0t6KQXz3Y9Zv9Kc4Ign6yXB7iHXJRi9cL4vQIWjbYOVhuxQxWgB6wQJY8aTdNO7wE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkLMoqbam/H7oqYhIqKRjSURPlDRYSZ2Lr5B98Yb+x4tPCoeLk
	Zu8VUmh2I4hiHt9YtyOqIj+sLETH/Vm/+lsQABmx/ESzLF261/Xebnq8C2hbr7KFxeE=
X-Gm-Gg: ASbGnctpgPlRTk0ZpFt4lrQ9tMz7ceMpH2m5NK5z8br26a5oV1mqS8raG7sCnnviU1B
	xJum8nc5naACugu6b7eDwpqIeQ9jBxDzvhh4YWaUx2Sx04H2A5qVPGUvEpZPoz1K/6sWhK7Jvdh
	PA/IAeBXt0yHeQjb113HFNu6+zqpoch1JCVYejsq+SQYPyjR96Djha6utSe+2U3YQNd/bRXYKA8
	/EZO/Uuwk4Pt7je4VjXIHh5zwq4VsFbeifnRFO78zoUBG1GVmd09mk5a5XAWTXyAsL5n8ofUQVU
	jztIsdlfgGb6YJlQaNkfwuioYLLdOLPIdhG4IrnuoAxCf3VvtWJNu4kdK7RDTigPrymKdQ==
X-Google-Smtp-Source: AGHT+IEouOoMNRNSuGf/ZMWbMPa3V8T1EO2Pbz1snAOvKwdQBof5o9MTJimT5y50shcK8/7BDOdy9A==
X-Received: by 2002:a05:6808:1717:b0:406:5a47:a081 with SMTP id 5614622812f47-40ac7053a9dmr10755047b6e.13.1750693651415;
        Mon, 23 Jun 2025 08:47:31 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8c3f:8b5f:5c74:76a9])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40ac6cf03a7sm1411227b6e.25.2025.06.23.08.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:47:30 -0700 (PDT)
Date: Mon, 23 Jun 2025 18:47:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: chuck.lever@oracle.com, jlayton@kernel.org, neil@brown.name,
	okorniev@redhat.com, Dai.Ngo@oracle.com, tom@talpey.com,
	linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] nfsd: Using guard() to simplify nfsd_cache_lookup()
Message-ID: <148c69b4-4cf7-4112-97e8-6a5c23505638@suswa.mountain>
References: <20250623122226.3720564-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623122226.3720564-1-suhui@nfschina.com>

On Mon, Jun 23, 2025 at 08:22:27PM +0800, Su Hui wrote:
> Using guard() to replace *unlock* label. guard() makes lock/unlock code
> more clear. Change the order of the code to let all lock code in the
> same scope. No functional changes.
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  fs/nfsd/nfscache.c | 99 ++++++++++++++++++++++------------------------
>  1 file changed, 48 insertions(+), 51 deletions(-)
> 
> diff --git a/fs/nfsd/nfscache.c b/fs/nfsd/nfscache.c
> index ba9d326b3de6..2d92adf3e6b0 100644
> --- a/fs/nfsd/nfscache.c
> +++ b/fs/nfsd/nfscache.c
> @@ -489,7 +489,7 @@ int nfsd_cache_lookup(struct svc_rqst *rqstp, unsigned int start,
>  
>  	if (type == RC_NOCACHE) {
>  		nfsd_stats_rc_nocache_inc(nn);
> -		goto out;
> +		return rtn;
>  	}
>  
>  	csum = nfsd_cache_csum(&rqstp->rq_arg, start, len);
> @@ -500,64 +500,61 @@ int nfsd_cache_lookup(struct svc_rqst *rqstp, unsigned int start,
>  	 */
>  	rp = nfsd_cacherep_alloc(rqstp, csum, nn);
>  	if (!rp)
> -		goto out;
> +		return rtn;
>  
>  	b = nfsd_cache_bucket_find(rqstp->rq_xid, nn);
> -	spin_lock(&b->cache_lock);
> -	found = nfsd_cache_insert(b, rp, nn);
> -	if (found != rp)
> -		goto found_entry;
> -	*cacherep = rp;
> -	rp->c_state = RC_INPROG;
> -	nfsd_prune_bucket_locked(nn, b, 3, &dispose);
> -	spin_unlock(&b->cache_lock);
> +	scoped_guard(spinlock, &b->cache_lock) {
> +		found = nfsd_cache_insert(b, rp, nn);
> +		if (found == rp) {
> +			*cacherep = rp;
> +			rp->c_state = RC_INPROG;
> +			nfsd_prune_bucket_locked(nn, b, 3, &dispose);
> +			goto out;

It took me a while to figure out why we've added a goto here.  In the
original code this "goto out;" was a "spin_unlock(&b->cache_lock);".
The spin_unlock() is more readable because you can immediately see that
it's trying to drop the lock where a "goto out;" is less obvious about
the intention.

I think this patch works fine, but I'm not sure it's an improvement.

regards,
dan carpenter

> +		}
> +		/* We found a matching entry which is either in progress or done. */
> +		nfsd_reply_cache_free_locked(NULL, rp, nn);
> +		nfsd_stats_rc_hits_inc(nn);
> +		rtn = RC_DROPIT;
> +		rp = found;
> +
> +		/* Request being processed */
> +		if (rp->c_state == RC_INPROG)
> +			goto out_trace;
> +
> +		/* From the hall of fame of impractical attacks:
> +		 * Is this a user who tries to snoop on the cache?
> +		 */
> +		rtn = RC_DOIT;
> +		if (!test_bit(RQ_SECURE, &rqstp->rq_flags) && rp->c_secure)
> +			goto out_trace;
>  
> +		/* Compose RPC reply header */
> +		switch (rp->c_type) {
> +		case RC_NOCACHE:
> +			break;
> +		case RC_REPLSTAT:
> +			xdr_stream_encode_be32(&rqstp->rq_res_stream, rp->c_replstat);
> +			rtn = RC_REPLY;
> +			break;
> +		case RC_REPLBUFF:
> +			if (!nfsd_cache_append(rqstp, &rp->c_replvec))
> +				return rtn; /* should not happen */
> +			rtn = RC_REPLY;
> +			break;
> +		default:
> +			WARN_ONCE(1, "nfsd: bad repcache type %d\n", rp->c_type);
> +		}
> +
> +out_trace:
> +		trace_nfsd_drc_found(nn, rqstp, rtn);
> +		return rtn;
> +	}
> +out:
>  	nfsd_cacherep_dispose(&dispose);
>  
>  	nfsd_stats_rc_misses_inc(nn);
>  	atomic_inc(&nn->num_drc_entries);
>  	nfsd_stats_drc_mem_usage_add(nn, sizeof(*rp));
> -	goto out;
> -
> -found_entry:
> -	/* We found a matching entry which is either in progress or done. */
> -	nfsd_reply_cache_free_locked(NULL, rp, nn);
> -	nfsd_stats_rc_hits_inc(nn);
> -	rtn = RC_DROPIT;
> -	rp = found;
> -
> -	/* Request being processed */
> -	if (rp->c_state == RC_INPROG)
> -		goto out_trace;
> -
> -	/* From the hall of fame of impractical attacks:
> -	 * Is this a user who tries to snoop on the cache? */
> -	rtn = RC_DOIT;
> -	if (!test_bit(RQ_SECURE, &rqstp->rq_flags) && rp->c_secure)
> -		goto out_trace;
> -
> -	/* Compose RPC reply header */
> -	switch (rp->c_type) {
> -	case RC_NOCACHE:
> -		break;
> -	case RC_REPLSTAT:
> -		xdr_stream_encode_be32(&rqstp->rq_res_stream, rp->c_replstat);
> -		rtn = RC_REPLY;
> -		break;
> -	case RC_REPLBUFF:
> -		if (!nfsd_cache_append(rqstp, &rp->c_replvec))
> -			goto out_unlock; /* should not happen */
> -		rtn = RC_REPLY;
> -		break;
> -	default:
> -		WARN_ONCE(1, "nfsd: bad repcache type %d\n", rp->c_type);
> -	}
> -
> -out_trace:
> -	trace_nfsd_drc_found(nn, rqstp, rtn);
> -out_unlock:
> -	spin_unlock(&b->cache_lock);
> -out:
>  	return rtn;
>  }
>  
> -- 
> 2.30.2
> 
