Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F70189B8B
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746455397; cv=none; b=rtugvxWn2U5AnVwyaySG76KDyYJ8MDw5XlA14S0gB0hyQIw8byyI75xNHkHHLj15Hp2Ys993AYE4latDyP2KhgthJZIDmhlLFJDrgUAS/0Feyb1Z+5ewFRmpK9R+mVCV3jwu03jE3IBC19m2/Xn6K4AL1VZXpJcnWoFuRI7keJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746455397; c=relaxed/simple;
	bh=Ely5tk2iUnBd6WgCdvnjfeBYslRXjUKtmfs3uZ84qJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nK7Y11CHVHWydKDp6y5F0hsUcZuYUUlXcBapV9XPjSRobua1M5u8wOWmzWOJpUIItd2YS3kVcBoZS6g/g5cLRX7EdS3mQE/qNm1x0CR0mF8XwHGcJYtn0jLdNXRyUJ152jOUupH8Vhrg3RnQpjCuoRgNj2Pn5ukRtHFW9du75iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=nwBexBEp; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="nwBexBEp"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7caea4bc9e9so184554085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 07:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1746455394; x=1747060194; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YI8/2634Nw/dQ8gDrL9YbXV+Mn+GWRh9uG0ypiDuisI=;
        b=nwBexBEpyyUqOo44IpIJ3jCM3WbbTgh4eOPGvQmc232YkRiTbjtsXnWHyviOZOObJ9
         M/GDk1x05MHE9bIytT8ZaJTslBLBu5Bvqw2cLJI4aXNkMW0uUepiXQ+EYoToO+98eIt4
         y6frL6UURfnT9BJUm1o21lFVoSYvTBrLh9GcRBR0xIWJZvcVqX6Aj48hJVC30JW4YqFq
         7xcXHtEwRRNLeYpVAfc1eddoxagxMRoOv7sNtsYfbDBwTNlIwG00qo8LFiR/gqlEv520
         DgCJNmx9oUbRU79nPF42llNcTEz3EugWVwutP6EmDEk+ftDSHyJ+tqUdQBDkIx5fkKsl
         5n0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746455394; x=1747060194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YI8/2634Nw/dQ8gDrL9YbXV+Mn+GWRh9uG0ypiDuisI=;
        b=JuPDGDui44nNbKkQojzGBa8QNqPWp+Fld9G2N8Ju0+iGsthTmIkFNDlWAdxU+UphEb
         0McJMrIv28/SeDHFe/wuLt3X8T1zoQ7vlPBStlcIZaOotJqgOphoZlrEKfe5Lpuk5J1t
         fveK40fqGMJGqrKCcH9X0QRJfAbeP4ceqIlfWnWM8CswyB5GIG4ue++/0eJCxgsD/Ja5
         IhwJjK2u5XdEyanUcsNhW1tLiCQG2z0awZqZ+wFwskOKU4jPKdv9DeraUs0gi5+uCdB/
         J+OoLiCjmicTtV6G4udLIOy8WQIidzBdJaPYf5N94igNvqV9HSDpDWP3Cl3tx6vEtliB
         wDEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrQuD5ZTcY9lgVCHfiM8dBGlqm1zMKuxepmk12+EpT3vuFypLMYjOqqFLJLaBEPTgYMMpBsjD1TRdxGC8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys0pRLfldeT8gH66k5T7hoC8vEwd7wwmCjT3wHBc63/84w1QOS
	vSBpZlQXYTeGqnL1QRksSmW0w/8twGbNj/xhfOG9p9BZF0V/10doIEYLjvJYvTs6/ADIiNl/sGb
	YJ5U=
X-Gm-Gg: ASbGnctz8MciGo1taaSqz8BaaQYYerueXTbbdNMfCOIRfML4h+ipJVSp7IdiQSp5NjQ
	Yi7NblxxtfTe5cDzwtAMUvBDCSbq7Hw2Wkpz+3S2FZ/bk7p97l7mj1E4/1dk4+y+jAdE22Eng2U
	OjqN2CXRv5+pHDY6D8tVqJuOBoCdgqPL5yob2FQMZL524NKZBt6B0Tz5l2pn9wzfpFhczqUfubb
	I547WqPG7CTlZTiIgU/SEj1D59yLACu5cvfrDrjz/PzG/ckRZCA+Pyo5grQNjwXIRpRsQDbro55
	POAsqZetQVw4h0RmfWS/D9az9k+qBdEBTEyeXZ0=
X-Google-Smtp-Source: AGHT+IHJEg/hzySYg6+JWlkAwj0DS0qxu7+Xu8xCTzoYz+Qk5R1OLuNOPT5RVk6Enm6pqqr2508HBg==
X-Received: by 2002:a05:620a:460b:b0:7c9:2612:32d3 with SMTP id af79cd13be357-7cae3a92c34mr867371185a.20.1746455394233;
        Mon, 05 May 2025 07:29:54 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cad23c40aesm576065585a.35.2025.05.05.07.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 07:29:53 -0700 (PDT)
Date: Mon, 5 May 2025 10:29:49 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Igor Belousov <igor.b@beldev.am>
Subject: Re: [PATCH] mm/zblock: use vmalloc for page allocations
Message-ID: <20250505142949.GB30814@cmpxchg.org>
References: <20250502080156.1672957-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502080156.1672957-1-vitaly.wool@konsulko.se>

On Fri, May 02, 2025 at 10:01:56AM +0200, Vitaly Wool wrote:
>  static struct zblock_block *alloc_block(struct zblock_pool *pool,
>  					int block_type, gfp_t gfp,
> -					unsigned long *handle)
> +					unsigned long *handle,
> +					unsigned int nid)
>  {
> +	struct block_list *block_list = &pool->block_lists[block_type];
> +	unsigned int num_pages = block_desc[block_type].num_pages;
>  	struct zblock_block *block;
> -	struct block_list *block_list;
> +	struct page *page = NULL;
>  
> -	block = (void *)__get_free_pages(gfp, block_desc[block_type].order);
> -	if (!block)
> -		return NULL;
> +	if (!vmalloc_small_blocks && zblock_get_order(num_pages) >= 0) {
> +		page = try_alloc_pages(nid, zblock_get_order(num_pages));

This is broken in several ways.

The function is meant for NMI contexts - the "try" refers to
trylocking the freelists, in case whatever got interrupted was inside
the allocator already. This will fall back to vmalloc unpredictably.

It also doesn't take a gfp parameter, which ignores the zswap ones,
and substitutes a set that doesn't make any sense in this context:
__GFP_NOMEMALLOC is counter productive inside reclaim; __GFP_ACCOUNT
wreaks complete havoc on how compressed memory is charged to cgroups
(double charging the wrong groups for shared blocks).
