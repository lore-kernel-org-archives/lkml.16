Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8B72F5310
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 22:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750201166; cv=none; b=F6vXWllk9GdrtaedHKRG9KxjIFvgPanqCtduioAdqwVYJN2Np1d02Qak79fXixKlULB9+rA5h9fjfpoeK2iJ0oMcivGemrQ+RYZuf855wvy8Y6eFiZujd70gMSQLMPj9/CLNohYpkTyK/t6WawDXsASrutjsQrk+7B6N62USzLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750201166; c=relaxed/simple;
	bh=FSs5Nqbe7V63xl6r8gkMha33mF8T/HNIQuJCNwFu9wM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AJjtmiL2RVvQo5Zfbx1vBP9FIs0rzbjYrgbIA4Dyz8RiY2KNnvE3iQIL+HHFlxRjqGbAGxqV9fNfd4QcPfjjkhTHUkokzLPket6JdTfVTJpYmFV2vi47KnT/bbEFpBkUF5MqDiVAwdPyPaAQCMkh6wu0VkA5vJ8WzrxSQDQQgr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nc9Qu8/B; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nc9Qu8/B"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3141f9ce4d1so2112204a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750201165; x=1750805965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VQty6NL3er2ndIuuACaFUG5ZLAPGl4wPPK5wFC8l+DU=;
        b=nc9Qu8/BRNsW2PGvkpS7CsPlHio/HJ0wplO8vLR8GG6AfE5+PfxqjZfJWUkVB1fCbl
         kbZ8Kw0Qvv+5SuXWyP/Ex3Jr7cLm5+afn3YhoDzgU8FW2600l4zydiQUwZvLpH+AqmjY
         1U1WWx0v3y0BZZWX2rXGa/86rB+6uSWbiXL6tpAja2ZSXK3wC06aChLGh7sHeBggHQ8V
         6RJos7osTHehmC7STQZBGCsjXfFAuVTmu8crlmdmF/tZAZU/pq4/+BEtPrEht8JWwJXA
         /sCCCoZ5g0PFNa86nOh6EY+6LKoFU2KQdmnJ4ooKCl489T+rnqCNVbZR8Akz7GPurB3q
         qt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750201165; x=1750805965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQty6NL3er2ndIuuACaFUG5ZLAPGl4wPPK5wFC8l+DU=;
        b=Hb9uvugaSJj6dRuZ0K/ERfd6IoltUzsowEPkr2L45NbYD4I2iY19gF99cXWtmoXciJ
         gkMacxujeRHOjveyszviPoiOzjIM2nFH/pvPvwUyTYcfbpeg09y1HjDOexiy5rSNQuYt
         KNTiPm5F+HLccZUZeX/3z5Wob+PnQzASQk3kWd37dGF98xomlbGgBWia0JUeWRjIr2oZ
         a4dWBfnqgfmXIbGHp9hR7kM+6+PqyJwMZ4VrSK0/23CZk54EejYIzIkbbweLOlWr0zgD
         fAF/wiBTsjvXj6zdVfpXh1ECk0tEM3E7Gwv9ZouO/C5WSfrfySbgWilQbK3euLWSft1D
         aENA==
X-Gm-Message-State: AOJu0YzlNmyiqsXDuEb1MH7H3/Ckpv3LwS4U2mgyUEt7hc0826AKZrae
	XaT+rV9UE2svAq0+RVzq2N+hqemGsuaALVqRzw/m1sT260urKK4M9Wjj
X-Gm-Gg: ASbGnctYo2OYnebxm/FYFV6EhY5++srBnJarng5FHuJjl6pRc4/AHKK3tBHPlT4SKgp
	AjunBP5z5wlXO0e1EYlhS5ciFjk19THwxSJzhwPlhHBC2zE74qIVI+1Um1S3gGn874e0u/0ivML
	+oVRmsJZQ8zG+8LXf1+Oj50fWKQGEHiMeab9J4z4HSoJAodSNLK7UMeT1yICzqZAI5jEKu/TFe6
	3dGJp2K54uwVc2Gv4XDO9EiUndw/ST2suzIeutV5FO2MsXB8N0CQyEBfqQdqs3MnsxdfZLHQthR
	P4yv13j/G3W4jtg5V+NVjnk6ELRPKw9RzmtR2T2Bgb75txDJr6rHBEvMuYIqOQ==
X-Google-Smtp-Source: AGHT+IGYJS7SmX8fQzqig83PgLKeexDR5dy2AsKJ+ghjlprsvI8RMRUKcV9KRprhX7fSez4Mhva7aA==
X-Received: by 2002:a17:90a:dfcd:b0:311:c1ec:7d12 with SMTP id 98e67ed59e1d1-313f1df631amr19427336a91.23.1750201164759;
        Tue, 17 Jun 2025 15:59:24 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19d2ccdsm11283246a91.19.2025.06.17.15.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 15:59:24 -0700 (PDT)
Date: Tue, 17 Jun 2025 18:59:22 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 1/3] bitmap: generalize node_random()
Message-ID: <aFHzSvlj1pqeSy6E@yury>
References: <20250617200854.60753-1-yury.norov@gmail.com>
 <20250617200854.60753-2-yury.norov@gmail.com>
 <20250617155056.5c1d292d8831e7c7a27c8e5f@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617155056.5c1d292d8831e7c7a27c8e5f@linux-foundation.org>

On Tue, Jun 17, 2025 at 03:50:56PM -0700, Andrew Morton wrote:
> On Tue, 17 Jun 2025 16:08:51 -0400 Yury Norov <yury.norov@gmail.com> wrote:
> 
> > From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
> > 
> > Generalize node_random() and make it available to general bitmaps and
> > cpumasks users.
> > 
> > Notice, find_first_bit() is generally faster than find_nth_bit(), and we
> > employ it when there's a single set bit in the bitmap.
> > 
> > See commit 3e061d924fe9c7b4 ("lib/nodemask: optimize node_random for
> > nodemask with single NUMA node").
> > 
> > ...
> >
> > --- a/include/linux/nodemask.h
> > +++ b/include/linux/nodemask.h
> > @@ -492,21 +492,7 @@ static __always_inline int num_node_state(enum node_states state)
> >  static __always_inline int node_random(const nodemask_t *maskp)
> >  {
> >  #if defined(CONFIG_NUMA) && (MAX_NUMNODES > 1)
> > -	int w, bit;
> > -
> > -	w = nodes_weight(*maskp);
> > -	switch (w) {
> > -	case 0:
> > -		bit = NUMA_NO_NODE;
> 
> If the mask has no bits set, return -1.

...

> If the mask has no bits set, return the mask's size.
> 
> > +	case 1:
> > +		/* Performance trick for single-bit bitmaps */
> > +		return find_first_bit(addr, size);
> > +	default:
> > +		return find_nth_bit(addr, size, get_random_u32_below(w));
> > +	}
> > +}
> 
> I'm not seeing how this is correct?

Ahh... Indeed you're right.

Thanks, Andrew, I'll send v4
