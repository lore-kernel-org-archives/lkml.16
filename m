Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0B0251795
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901324; cv=none; b=KxctCF+w8KaBcvfSqApBD3Etunh4vHT15cYEQOMkd7lydYkWmIIBtrPJXdC1vDJo+Bua2OLSqXARcQ/9WkUue9BeowEeqdvQWTY7ZENB2ZY9/6IU4MW5XrE8am4ywp0qY6Xq2A5cXUIy/sSOJDB/RXOolE9M5O8L3WwmvTVOwK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901324; c=relaxed/simple;
	bh=pNcBMs7ZlrUB8XX3Hza9aW8YwzWbd47vRBseMGVQzkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mO500QtZHlHLnl3kPnTmUWtJJKRP/h8O27OjpyBZyqpT+/yPykNrW32rd5GKHZTI3jSMyad6D650Iqb864PP1g2ZkJJeCUZ6HjuL2jvHnHWkrp9au3znCDZzFWdE3YQbDdt0E9kNYE5BaQL6xn1Z2wB34CQhapTd2NvY+mReYYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=qWI2p/4d; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="qWI2p/4d"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e8f254b875so8666036d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744901320; x=1745506120; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=72y1EmznVSmoY7TT1dLdPEUbLZhpUALLN+CNBenUUDE=;
        b=qWI2p/4dGO9N7gJ60X+1Qzens5N5nqExaoZZ95ERHV6OzaE4DUfZKD5bsU0l0+FIWT
         PIaJIOOcuCj3uF8cMFxMb9L1Ylnl81Me7BjNAf1lO62pFZ9dXtf0locwGrNUZKmeQgic
         DtYDIg+2VZQk1IztLVQprAadY7ZoOZDGfhXKiD7utogtUApKZfQjCgDkTlfYdOb0zhKg
         +PyBjXEQLdladYfD0MuayctK39isfBv8/NT+2NgA7HEKs6rkpvJbATEYUl09QzGY7keJ
         MRFkTKzaj0jKUv50wA7FWjX9rNq1PZnkggqcKzJunIbDCEBVjoNwlM5dZfvdmD/zbRsk
         5bpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744901320; x=1745506120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72y1EmznVSmoY7TT1dLdPEUbLZhpUALLN+CNBenUUDE=;
        b=uJ70/8i7jidKCWcZLcnVZr9c3fuHFgA5m6lCQJBBtYbJpkdVuctyZHjeVv8hu5lzOu
         hTOiCjBONts0d1VOxaCkFFfBp20GjG2EaOfXa/xdq7jqiXBer6Gjy+7Qd4jAnhck8C6D
         82c/cqLG6lv7GIeHj+HKtL76hd2rSJMMCvWDTl/8UtvKLNEna2vagIt7zXn/qcCiVVQQ
         OSevtp5niQ3Chf4axXacXvJiWtaPIIrY71PweC/DPGOsf0oZIRhI4mlSdQlnMgQxPiWN
         EMWu9kcfNePzCV1y/hfrWXtpGCVm2BHqzkg9lG+d4cNlgnBCKEsVSfnlBVT2D5r6EfTh
         xxFg==
X-Forwarded-Encrypted: i=1; AJvYcCXfNgPrwkrrGqEr2JbCYaJ/2OC3SIdzEapspSVvsFzoTCN3AXkbYy7wwiENDWGtK6G8ET4CATWb6CIa/IY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNMFtT0eAjiI6IGpmqlm8hYluqEHvdAIUqPKohRflqawRBZXiM
	bacOeNBzGmTLZHRYyx3dUQLqKdONs5Gjkbz2xZ62T6j6n8PF4U6egmVFDZwvWfs=
X-Gm-Gg: ASbGncujgEjEYH8xRrsyt5RalZ4oU0amUInq4kNsAuVRUAmuUFz7HhzOEnohDZKR697
	5sNSXeU1M+yOsajvTeRH5DzGjRXxzPAUB/BQ0/jKAiKaJZ7zxOwhspvTvqJJry0ESRt8ttOvvUK
	om+GtwdMCoUZokXTjH2KgznFOTh9f4rPZcMH55YPpMD8h46l2iGzpubN1gY1DccfqK/0IuQ8UnW
	19X/S2oq1CHAPovsHOcp5Yz07TlYuNTcfDgzfAzF2e8Qtyu8AP6bTwKDc1Ae73392o9mgcTI/Xm
	9BfpGLmwqLzKVUjhhORlIuB7xbBB8wxmtffrpbs=
X-Google-Smtp-Source: AGHT+IGDYG8scGbGiGtdjWD5Tl+oF+abCIBc/cfLvyS8vBIxcfDBykRawx8ajQXIXSc3ZbLJsuLZ1g==
X-Received: by 2002:a0c:c589:0:b0:6f2:c181:19db with SMTP id 6a1803df08f44-6f2c1811d13mr8653966d6.43.1744901319739;
        Thu, 17 Apr 2025 07:48:39 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f2a4b60a2fsm38477396d6.120.2025.04.17.07.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:48:39 -0700 (PDT)
Date: Thu, 17 Apr 2025 10:48:35 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, akpm@linux-foundation.org,
	david@fromorbit.com, zhengqi.arch@bytedance.com,
	yosry.ahmed@linux.dev, nphamcs@gmail.com, chengming.zhou@linux.dev,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, hamzamahfooz@linux.microsoft.com,
	apais@linux.microsoft.com
Subject: Re: [PATCH RFC 02/28] mm: memcontrol: use folio_memcg_charged() to
 avoid potential rcu lock holding
Message-ID: <20250417144835.GE780688@cmpxchg.org>
References: <20250415024532.26632-1-songmuchun@bytedance.com>
 <20250415024532.26632-3-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415024532.26632-3-songmuchun@bytedance.com>

On Tue, Apr 15, 2025 at 10:45:06AM +0800, Muchun Song wrote:
> If a folio isn't charged to the memory cgroup, holding an rcu read lock
> is needless. Users only want to know its charge status, so use
> folio_memcg_charged() here.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>  mm/memcontrol.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 61488e45cab2..0fc76d50bc23 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -797,20 +797,17 @@ void __mod_lruvec_state(struct lruvec *lruvec, enum node_stat_item idx,
>  void __lruvec_stat_mod_folio(struct folio *folio, enum node_stat_item idx,
>  			     int val)
>  {
> -	struct mem_cgroup *memcg;
>  	pg_data_t *pgdat = folio_pgdat(folio);
>  	struct lruvec *lruvec;
>  
> -	rcu_read_lock();
> -	memcg = folio_memcg(folio);
> -	/* Untracked pages have no memcg, no lruvec. Update only the node */
> -	if (!memcg) {
> -		rcu_read_unlock();
> +	if (!folio_memcg_charged(folio)) {
> +		/* Untracked pages have no memcg, no lruvec. Update only the node */
>  		__mod_node_page_state(pgdat, idx, val);
>  		return;
>  	}
>  
> -	lruvec = mem_cgroup_lruvec(memcg, pgdat);
> +	rcu_read_lock();
> +	lruvec = mem_cgroup_lruvec(folio_memcg(folio), pgdat);
>  	__mod_lruvec_state(lruvec, idx, val);
>  	rcu_read_unlock();

Hm, but untracked pages are the rare exception. It would seem better
for that case to take the rcu_read_lock() unnecessarily, than it is to
look up folio->memcg_data twice in the fast path?
