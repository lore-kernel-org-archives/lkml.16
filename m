Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F69215F306
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 06:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746339286; cv=none; b=L/YSb8MJoWXskMop+uN7XzGumF8rNC4LdKRoVc5chXB16xICCk01TVoli9dL1c93E53trSjkxIUdcDKLS33Wdr/lh4ipWG9uAXtJMT9o8yUgvZC33q+fNQtJmc/YFPwg7ESnwe3lSOkdtnoMh7iSboFWJ4PnfTBmVfXbugSymW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746339286; c=relaxed/simple;
	bh=dj2UV7mBEC83Fb8EOblKnyL32VtjiPyeco4gmRDzMXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7aszwGvEREurkBKZIkpGPZj7b1x/uXUFezl5pOTwbcNNoyQUqbRJr7G/d5mGUlEEimwcy8ki1XL+/5iFlJekVGzHWZEB6TA+cbIMRtTpOIE2GP+IfWqyRpP8ZpSjwbM4C+uB6slA8z7/9NoWZoYBps+oUjGGOWgx9u2E0Q3tU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gHodoMuP; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gHodoMuP"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso3444435b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 23:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746339284; x=1746944084; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yGfljSQR72vHh57GoTeFdSyY80nTlVjhqTzRQ79L/6Q=;
        b=gHodoMuPNT2UNrgtTGqPv3FtHgZrEFPeoVokKpzwAhUwyU1NMSl9H7fH/kJh8sLeVL
         4iU3e2BDdvYkCDakWUYI/GqsWRYz+TNHM+yjHoFoXr4oGU4Ywy8wUs2JpGjgajG1Q59Y
         tqqCxA+KL4tJD+enb1wwHF+ZW4W4eb1969yz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746339284; x=1746944084;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yGfljSQR72vHh57GoTeFdSyY80nTlVjhqTzRQ79L/6Q=;
        b=lOw9gEfPseDm8bOs7OjEaASUpLzRKrcMiwnk/P5jSv4J7g5uXJaUw+qwwSmDBCmsZ+
         45P5dH2Sim62uAITkBFHl5RBiDwxC9NZKQedpdCzyoE/gho0l+tvmCA13zFTwIGic2ee
         6YGet+qRM+Dy0Rhx5N0UsHWHFyfANlJ0g3l2Wn21/imQ90GFOYibk7wayjUaoE9vdXpm
         XBhFvyzuECol7mNfXw/7KNZ97933tqMJCYOYoBmNDydstRyXY4tziHNq+Jx0ev1tdwT7
         h2yTq/+uPfVSeb8OIkE6rr5Svynfvp0V09aTSc9bdE6rIPI/AQTe/hT3IuEVPjDjydz1
         /mZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkTaSzq1fzg+W9ON/cE3eoR7DZeZF31SPW6Rda1WS0IAyJbKxuxM9sZ5nWK3FZji41t1uUN2NcqFM7hwE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYuJAKUyp/91VEocG8sYTsigrnKKpnXeSQTuKw+JA3yhvKjC2S
	z9N8g+oSp2mEF7uHlchWBuwNQHyY6Nd7X3lhUrpLtEOXrJjvwvYwNnZFqDNEHg==
X-Gm-Gg: ASbGnctsA/CcoSWRk44o/FS3TrvdYmeNO/SaqLUlN4AqGB2EBn4ZNOaMV6PlSKrBrf9
	AM4cFBxBbFyX1dvwI2Nk2VeD2wavJSqziib0ds4XmjH0lkVKCHzzRTlUxsz+rnyPpGpkddUQZtF
	klUSUT1iNlh5OXDehmDz2EIj0ZQY3OTyu4mxhX8txh38dvsDG7Ht2pMvSyFf7TnRpmR7n+02aBu
	cROtHw6QjQqYIVJp/b1p2lAB0po4YHB4vdtx1KooimOVAjzdfpHwO8tZBJbbrRQe6/+QwsNc28F
	M1IAVjMvD7Eiss9EyJQEFaeEPYdTCJya584W1/21hrjdeK7SRNI44Yw=
X-Google-Smtp-Source: AGHT+IGl7KbXZvMm0c66oxwHKMUOs8ZckceHWFdHUpbWEDwsDlxH6Nfx8kQ90vTv/tmxvpXm7sjnaw==
X-Received: by 2002:a05:6a21:1645:b0:20d:df67:4921 with SMTP id adf61e73a8af0-20e9620566amr3801614637.4.1746339284299;
        Sat, 03 May 2025 23:14:44 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:c979:b45c:9e0c:bf77])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm3355820a12.11.2025.05.03.23.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 23:14:43 -0700 (PDT)
Date: Sun, 4 May 2025 15:14:38 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>, 
	Igor Belousov <igor.b@beldev.am>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] mm/zblock: use vmalloc for page allocations
Message-ID: <q52ddqgi42mgknla4y6i5l65nj57qck6vuuruwcm6lpez7bxmp@3luv4iwjppa6>
References: <20250502080156.1672957-1-vitaly.wool@konsulko.se>
 <fddf0457275576c890d16921465cf473@beldev.am>
 <83CB359A-955E-48B6-B0D9-DD4F2E1146D4@konsulko.se>
 <myejh7ow3qwbcptyn2d2nz6td67x2noztu4bxihs5jtqw7s4pk@j2wff5ztuu6a>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <myejh7ow3qwbcptyn2d2nz6td67x2noztu4bxihs5jtqw7s4pk@j2wff5ztuu6a>

On (25/05/04 14:02), Sergey Senozhatsky wrote:
> On (25/05/03 20:46), Vitaly Wool wrote:
> > > Right, and it looks like this:
> > > 
> > > [  762.499278]  bug_handler+0x0/0xa8
> > > [  762.499433]  die_kernel_fault+0x1c4/0x36c
> > > [  762.499616]  fault_from_pkey+0x0/0x98
> > > [  762.499784]  do_translation_fault+0x3c/0x94
> > > [  762.499969]  do_mem_abort+0x44/0x94
> > > [  762.500140]  el1_abort+0x40/0x64
> > > [  762.500306]  el1h_64_sync_handler+0xa4/0x120
> > > [  762.500502]  el1h_64_sync+0x6c/0x70
> > > [  762.500718]  __pi_memcpy_generic+0x1e4/0x22c (P)
> > > [  762.500931]  zs_zpool_obj_write+0x10/0x1c
> > > [  762.501117]  zpool_obj_write+0x18/0x24
> > > [  762.501305]  zswap_store+0x490/0x7c4
> > > [  762.501474]  swap_writepage+0x260/0x448
> > > [  762.501654]  pageout+0x148/0x340
> > > [  762.501816]  shrink_folio_list+0xa7c/0xf34
> > > [  762.502008]  shrink_lruvec+0x6fc/0xbd0
> > > [  762.502189]  shrink_node+0x52c/0x960
> > > [  762.502359]  balance_pgdat+0x344/0x738
> > > [  762.502537]  kswapd+0x210/0x37c
> > > [  762.502691]  kthread+0x12c/0x204
> > > [  762.502920]  ret_from_fork+0x10/0x20
> > 
> > In fact we don’t know if zsmalloc is actually supposed to work with
> > 16K pages.
> 
> Hmm I think it is supposed to work, can't think of a reason why it
> shouldn't.

I'm able to repro, I think.  Will try to take a look later today/tonight.
Thank you for the report.

// Feel free to send a patch if you have a fix already.
