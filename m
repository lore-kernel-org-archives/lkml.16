Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E382A14A627
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747838386; cv=none; b=Wk6Zw6UZgPCjst4l3necyFbG5Xl7+rWmqeeSxDatMlBVzixWBlPWFcOsXR5237nHVtjP2a95kyU8N8DbyRr1h/FVItUytBlvz5akHjLnzbivm/W1HdB3EAe6qaztiSb2WpzGOIoDKm61i19v1eccVPTGVEER+IwmpcyaemTHuzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747838386; c=relaxed/simple;
	bh=+Q9opnazjpTnmckEx7rzBgMYHs8/1z9DfbekK4Sethc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APzGndMqtMVMbqFZeIBkYCzSo21dKs0i8+U3vnohtsTNkbQT83KWymLgyJBJhoPF7DWsG8CdIp+0S5mh8RrBJt5MKIaqQ1Rfa2hyljJNAcL3M+VYaRJim3Dnlth665UgvSUCfElAswUKnCIm1gzT1t5WCtjnNDuB23y0/HC1mog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SdTdgG/x; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SdTdgG/x"
Date: Wed, 21 May 2025 10:39:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747838379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xw5T5g87jYzPndrWdvTklME7Q7jL4gSJThNAPVQI0mo=;
	b=SdTdgG/xFvVFoM4e1dhkOcJn7Ant44LUDoSbhJiLsBg25aWk3NFMOJ+Ey+wjNeRdMEy75u
	KqYwBMdRtgAVxXCHFYplcjEFU26mjpsJuQk6nTs7BL6ewa+LiBXbkyOKeWNjxbdsyGbSC3
	GLveU69ul8xP1jQEoXeuE/wDjn645/8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Ye Chey <yechey@ai-sast.com>
Cc: linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bcachefs: fix potential NULL pointer dereference in
 bch2_bkey_buf_realloc
Message-ID: <7ymkjjcssj3c5pd43rnswly6nyozmvukcw5kaxzmjpul4trwtz@pksjoiaemiq7>
References: <20250521143033.53620-1-yechey@ai-sast.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521143033.53620-1-yechey@ai-sast.com>
X-Migadu-Flow: FLOW_OUT

On Wed, May 21, 2025 at 10:30:33PM +0800, Ye Chey wrote:
> Add error checking for mempool_alloc return value to avoid potential NULL
> pointer dereference when memory allocation fails.

I suggest you go learn how mempools work and what they're for.


> Signed-off-by: Ye Chey <yechey@ai-sast.com>
> ---
>  fs/bcachefs/bkey_buf.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/bcachefs/bkey_buf.h b/fs/bcachefs/bkey_buf.h
> index a30c4ae8e..8272a1830 100644
> --- a/fs/bcachefs/bkey_buf.h
> +++ b/fs/bcachefs/bkey_buf.h
> @@ -16,6 +16,8 @@ static inline void bch2_bkey_buf_realloc(struct bkey_buf *s,
>  	if (s->k == (void *) s->onstack &&
>  	    u64s > ARRAY_SIZE(s->onstack)) {
>  		s->k = mempool_alloc(&c->large_bkey_pool, GFP_NOFS);
> +		if (!s->k)
> +			return;
>  		memcpy(s->k, s->onstack, sizeof(s->onstack));
>  	}
>  }
> -- 
> 2.44.0
> 
