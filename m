Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4661BD01D
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 06:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746598506; cv=none; b=k0bIaQTYKWzTMhsNQSFUGOEktIqD3IZVUnFvI/pNPReCFLgIo+E7d61gAQFoFvWwFVdlUgrz76oOfith90eztrv+NHNEoJa8ESE+UqFfAewM+2mV999FIR6XfIMVU8j0Hj/amRlPA6OMIiF6pgosRAlX3WPJW88vyZplYOgUn7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746598506; c=relaxed/simple;
	bh=vSJ3hzFFhyk+/JSg4qzlSqae6qCpEEs7wyzUJ92o3nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPGdOveUXzrS625WZoZTQWlQgxqak7Qf3aL7DBimIY6PiVWWbz/H8s20zI9P1dpKQ+UuCtKKUW+KC3i7bq5kRS8D4/KT7XNpZXpyxDSo0DfahmtEtSBqdhu//ZA/orCtmiW8kgT9fIX6ou7RPmIz+vn6PdLJ6DwQcQd5zDKfcQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hp5Ft0v0; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hp5Ft0v0"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so5888447a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 23:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746598504; x=1747203304; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7hA73hgBO4nqj41CFJ+0WVG+4WFvvFaJgFRfbQga+uE=;
        b=hp5Ft0v07nn/QUR0QmMJS5AgujLjnnj0oQejy+ghide/gG+1yw0PqI+VYvZBfbcMxz
         P8cEa9JrA93r/QImuFPnmstqOiEXTifJfbRN3sP2hncXHpOdcAPDqjsQZ4BVo8OCem3U
         Dnt8pLguADz2bWbtSD0N+FVxCqMu7RSxwhrOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746598504; x=1747203304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hA73hgBO4nqj41CFJ+0WVG+4WFvvFaJgFRfbQga+uE=;
        b=RxOyBNLjH0/LYa7KPg/8HDDV6ZoLUgK0UOKvkSo5Zaj5eNHqZ0I1Eno4L7g18f9Y0T
         2q0imwYdgy+Zno/eopPtkA8dfdvUry51FCI+u+T+7UZFTTbDVEQ4JX/nOlpIjH5aebIQ
         KU4Px68kLUUqHRZr88ojmw9UAMNvGw9kiHpSkpxWalPH5SRNXGptbY6z4SfFWt8Siyoq
         lvo3uVsHQYBD9xROAaewVAweCOFeUVRAzIbcWX/3LozoR2VjqmiHb6fzbWrmILxnubch
         d6yrh/tSbgB8tzLmoBPoyVXhB0wwdF+xVNJWBAktT5yqieIzQCQUVvtEcFJWySWImhed
         SieQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW2WF1zzJbBpilHqd9lEIjYx+lEH+xKlWZO6RbuZ0jOJ5J38Duj8i0Wsy0yULC2/eekZSoyqKUMzkctmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbMMIAm9qMS9FvoEELrqVQN0lVxyph2WBml8HGg8gNQQXsSt5R
	Tt4Ae3DdWa7NIaO9gtCv4Aa/Izcb8THNdtB8cOqj3XP3AiLhD3jCQTCfi1W6RTlAl4wKfiKswhO
	mHw==
X-Gm-Gg: ASbGncuFMKWEi8yPCfpQ90d8gSeSchNWLWcAl0CBCMpMAAXcbZmOsaeNugvmcCBfRbB
	K1UTmjurthLlttN9/0WfC5iaJ6eR3c+NFCgba16l4CduwfAjVhEp1JIaiZUET4x5wg2rK1/YhnU
	Jw0RWUnjU4RDe0eTlildW6mSt+DfgkrE3Cy/fKQ9Fa4gG1oxL8RRXQCuGp6uewWQoHNxpSL5uxN
	4mb8CMk9rPQp4Ltkw8hWWfA8dZane2/3oSXfPRtP3tWwV6UWAP7/hF6Y6wdWNexwoNTha2jwEbu
	1ie3qPX3ny2loJeKpmgQIHOMv+BVe/RJtOguK7Toh26v
X-Google-Smtp-Source: AGHT+IFt8mxFg2hYeSdOmmKvC1muDMtlAuLWggPsSZO3O0YnP2AnJEZfGHzWefvQFgQU+wsbULnGPQ==
X-Received: by 2002:a17:90b:350b:b0:2ff:7ad4:77af with SMTP id 98e67ed59e1d1-30aac1be4d2mr3373826a91.20.1746598503912;
        Tue, 06 May 2025 23:15:03 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:284f:37bc:f484:cbc6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30aae525d8esm1084822a91.23.2025.05.06.23.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 23:15:03 -0700 (PDT)
Date: Wed, 7 May 2025 15:14:58 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Minchan Kim <minchan@kernel.org>, Igor Belousov <igor.b@beldev.am>, 
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] mm/zblock: use vmalloc for page allocations
Message-ID: <jzbcscg45stzhkbqyldzecmmu34h3yorxkulgowcya4t2x2ccc@3hiz3kkqxnxa>
References: <20250502080156.1672957-1-vitaly.wool@konsulko.se>
 <aBoK7f7rtfbPFGap@google.com>
 <m2dmxnhtvxano6lye7lr3saiobn4ygpln55xntlstfo4zwws5g@qpq7aagx3xwq>
 <b42gpp5qsa4j22ai2v4rwwkjhvfbcbf3lcnjoccz7xeidae5c7@ot2ocric3qzs>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b42gpp5qsa4j22ai2v4rwwkjhvfbcbf3lcnjoccz7xeidae5c7@ot2ocric3qzs>

On (25/05/07 15:08), Sergey Senozhatsky wrote:
> On (25/05/07 14:57), Sergey Senozhatsky wrote:
> > On (25/05/06 13:13), Yosry Ahmed wrote:
> > > If we can use vmalloc for zblock, then we can probably also use vmalloc
> > > in zsmalloc and get rid of the chaining logic completely. This would
> > > make zsmalloc simpler and closer to zblock in that regard.
> > > 
> > > Sergey, WDYT?
> > 
> > This sounds interesting.  We might get rid of lots of memcpy()
> > in object read/write paths, and so on.  I don't know if 0-order
> > chaining was the only option for zsmalloc, or just happened to
> > be the first one.
> 
> I assume we might have problems with zspage release path.  vfree()
> should break .swap_slot_free_notify, as far as I can see.
> .swap_slot_free_notify is called under swap-cluster spin-lock,
> so if we free the last object in the zspage we cannot immediately
> free that zspage, because vfree() might_sleep().

... but there is a deferred zspage free already, we can switch
to it entirely, I assume.
