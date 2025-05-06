Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E681442C
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746524538; cv=none; b=dOUT0Olx/EUCrhRrF7rvGiBrWXSnBGSEtQZSE21Y1JG0BkM9v4NylpubfdZFuv7fquXrd8RBKJPQsSrvWI1mkxIoJKWOEGn1ovuZBpeXKo1QLjwrPW6d7q4ZnxQblugAwcsyvtjGvhWtIA7X0Rk8VYMgvKfCpn0Gz70lcg8bikE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746524538; c=relaxed/simple;
	bh=deLiRQ4N/GJJ6TgPdYtR8EjONNDuSOEKsEWL5QReYJE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2aFkAYF3TZbpqXLXX4d83PTP2DwKvsUgipa94Om0S1NLQOevxl587m4nG+PYbrl2HFG1Bu7yX8Uo1400RWEl0VKkh2F0+cIE4Fi0PVArS5SkpCW3/bDFhyh5ldiidDBVIqToHUaBQzUolHDQcQ3XFzIfEgRdSGL5EN02OIpvFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KqxtYdD+; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KqxtYdD+"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54d6f933152so7477701e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 02:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746524535; x=1747129335; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DnYgIEbZbM7AEX1GIIDCB7iTsvQrOHQFzeVr1mPAjRI=;
        b=KqxtYdD+w/XKTM210JMd7P2g5VglpnHMRobhZ4SOe6mJCEMXck0d4UK0pQawfRCgIy
         PpQ5cJxiJ0G1a7+pQWKNJHHYJy3XUiPjnUMISbuDgAq2b2svnjU5y1numkxzEfPLi4sa
         PPfTKXOrAJsXO7Edhiib1Ljxr9gtNUpWMsKFzmfGq7PKsh21ADINkRufPZ3Y649ytJBu
         pdpsz9giK+LZ6haEQW6UoP6G53+uTziIShgzGjU01wtwLpX7OEBoN3bLQE8+gLzqGsrB
         DUFVWVaOP4u1azuvZwiPKzOm2W1jQuUFbqm1rDcjFeimQysoVeGRPMdyCGsb6/b2EdmP
         Eu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746524535; x=1747129335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DnYgIEbZbM7AEX1GIIDCB7iTsvQrOHQFzeVr1mPAjRI=;
        b=DPVLefnvp/i1whx5hJFkFhVuvx42rYjohDplTkmk12Jnb2TKzpY3vrm0bUYRJ8J4VS
         4KqZfghebMatzGrQNiZ8efjkIef8jSBCaFoCSSt2SdssCGnUkmguoNxW+wHCa4uUsAvg
         enpbFRH3hoYAT7WXIT/aTsmSiPe3dFVc0jgVDBl+RxMIyrenoWgOzDF7ShL8JLoUxd7J
         PDyU77ovbUKiolFLJ5GynJWe+/u1F4bVBD1WTfS7XiUABMl4LF4cekQQukTR6k9tVYQ6
         /uldRsgHq0mPnT81CobNU+Hn054Y515vsFdzxgbvdCqiRgO41lmM0izZbGwgKilqyKHM
         KVQg==
X-Forwarded-Encrypted: i=1; AJvYcCUyyuwpZklieAqN6zfHjLJVaKJIuSQUizSVs2vbhRwZwLvA3qybZ5a4yM9dRvQnPYT2eA1ivhdWwPZCNmk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvB0bqcla21BVeRyBzYHoIUqPeDcW/6u8quXQ/c7UJUEC4+Bu0
	gTNOePz8K4oLm+HpEBgNOSzpYMeSrXA0wdo8Zvpt1ZZdvfBK/qwN
X-Gm-Gg: ASbGncsliRJzDfIIIjdUXx0sjPn6t5J4BL7U3PTC8GxLGK25sscu8xtpTp0kjY3VGDz
	ZBscQFHHnlKkOx+NirhtLKZKoWwhnQnhonAwAoVXvAfoy/+jaFNfvEPZ64m7MQdrnqd0LOhmH45
	n/4fWzuNjRNLsm9ZU5BAYj5NPpuJiRO3lI84v6L41DEuFMW352ImdhBx3DhbhwM2hiuQrK1h1Z+
	m44pudsrz+frqV+Vi/isK4lI43moVZYiGM8V0rCZ0CtIPhE3tcApOWb4Qrv3lCoZsdJYdOdl/Fg
	BX9zXoy+89LPw+6ic2ynl4gw3TJSGPkYPs5dpXCzNsFelFNDAivqnkqivlBBPVcDUeab
X-Google-Smtp-Source: AGHT+IE5oihn/tybHKHZFV6TFYH6vzBVfOCZNSggfeKTY+cJcyX8A2k/xGaUzO6rR+eZ7R/hhrCsPw==
X-Received: by 2002:a05:6512:1093:b0:54a:cbfd:5517 with SMTP id 2adb3069b0e04-54fb4a70fe0mr675574e87.53.1746524534762;
        Tue, 06 May 2025 02:42:14 -0700 (PDT)
Received: from pc636 (host-95-203-26-253.mobileonline.telia.com. [95.203.26.253])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee6ccsm2001951e87.122.2025.05.06.02.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:42:14 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 6 May 2025 11:42:12 +0200
To: Johannes Weiner <hannes@cmpxchg.org>,
	Vitaly Wool <vitaly.wool@konsulko.se>
Cc: Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	Nhat Pham <nphamcs@gmail.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Igor Belousov <igor.b@beldev.am>
Subject: Re: [PATCH] mm/zblock: use vmalloc for page allocations
Message-ID: <aBnZdLvgtz_54URF@pc636>
References: <20250502080156.1672957-1-vitaly.wool@konsulko.se>
 <20250505142949.GB30814@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505142949.GB30814@cmpxchg.org>

On Mon, May 05, 2025 at 10:29:49AM -0400, Johannes Weiner wrote:
> On Fri, May 02, 2025 at 10:01:56AM +0200, Vitaly Wool wrote:
> >  static struct zblock_block *alloc_block(struct zblock_pool *pool,
> >  					int block_type, gfp_t gfp,
> > -					unsigned long *handle)
> > +					unsigned long *handle,
> > +					unsigned int nid)
> >  {
> > +	struct block_list *block_list = &pool->block_lists[block_type];
> > +	unsigned int num_pages = block_desc[block_type].num_pages;
> >  	struct zblock_block *block;
> > -	struct block_list *block_list;
> > +	struct page *page = NULL;
> >  
> > -	block = (void *)__get_free_pages(gfp, block_desc[block_type].order);
> > -	if (!block)
> > -		return NULL;
> > +	if (!vmalloc_small_blocks && zblock_get_order(num_pages) >= 0) {
> > +		page = try_alloc_pages(nid, zblock_get_order(num_pages));
> 
> This is broken in several ways.
> 
> The function is meant for NMI contexts - the "try" refers to
> trylocking the freelists, in case whatever got interrupted was inside
> the allocator already. This will fall back to vmalloc unpredictably.
> 
> It also doesn't take a gfp parameter, which ignores the zswap ones,
> and substitutes a set that doesn't make any sense in this context:
> __GFP_NOMEMALLOC is counter productive inside reclaim; __GFP_ACCOUNT
> wreaks complete havoc on how compressed memory is charged to cgroups
> (double charging the wrong groups for shared blocks).
> 
+ "&& zblock_get_order(num_pages) >= 0" is always true?

A fallback makes sense to use when order > 0, IMO. Or just stick
fully to vmalloc. Another option is kvmalloc()/kvfree().

--
Uladzislau Rezki
