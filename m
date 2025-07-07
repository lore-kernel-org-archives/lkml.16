Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2274280A51
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751872308; cv=none; b=EDG5vDcQPIfU5AEjA9c0GOb+wqzsPiE1K8dwDHpvGltZ+fUNdXOgVmnx/Aymq8RdxGo5z7gZJSP818BpRMurq6C5hOPE3TSBB33ElhvQmTTt6/8rUlacfQP5XpHshowTyZsHVKy29aFsQw66qxi2gucE5z6EdluuMO+oEANivao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751872308; c=relaxed/simple;
	bh=3Lh9tr9FAciCs4BbFH9mXPaYir1ids7elnvz0KWc1gM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tynhC0lGGc++lIwSFPoBxS0sYyJ3rtKg5HQVuverixxQuClD61I0LL8V4X8WU0BZs7bMV83ercD1H1QH7Q1n6DfTwNLdUROxHDE4NGQhtpb95tinw5DQCW1OpAPIyj6eCTEwJ/mJpytKEIE110h7wtHR6sAYjQhRxPRGyVSvO3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=USGe9gMC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="USGe9gMC"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso2687822f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751872305; x=1752477105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r4Y/xGeQ7s4X2PhVGuXgCFqaUMgI4/gr8gGg0GLYTi4=;
        b=USGe9gMCAigVgfFAlTRk3A0pH8nvauwb5tecsCEO0FxgpTiz/mkda1QSLZumDkcUAx
         B/bODyrfzD0JgEWsW1WP0wOVyp2xcz5bEOcVg9KBkFlDzQCyDIRXNp1joiLeyEHh7Air
         YKFqZiYtoakW4B3i1uG0WKjUZbsOOGCmEkpk2QfqU6dnpoyk4Qpkd/0HAHB+znJquN3l
         Gk8AmQbCXjGbI6R9aWaB9ugD+/doH3MaerO4YTyzVxHuiKdgD00Q/g+QWWVe6f0z9+UW
         NZ8NjKeIKXS6Nm9EcuvJPBFFUHDA05aOY/1g6yTiy+V4LqTIwkTmOk3pcc8Mvg5JVMw6
         iw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751872305; x=1752477105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4Y/xGeQ7s4X2PhVGuXgCFqaUMgI4/gr8gGg0GLYTi4=;
        b=P52gpKgQSeH1mVYPuRiGc6Bqw79KCa/caCZ5brgpOWnUg6EcVEwQ5MQjH0hnO3x76X
         QRgoGID8VSAwY9s5SYnosEmXrh7AMiiMSZq68bXzvDAZdmEINdev/hI7Zemftw9kpiB0
         67snnILsooPlMooZFrjutB/bTQ2jwt3/4EfLHvW5Ssj5WvVKMHDBCZhMk/AyyX4QG5NE
         mW3ejmJYRWBe6g/5JTbVFn8Hj2RhbGFWVxan5KuE+6MvP6R1iKFsmfpKvBBmJl9XppSc
         n9G6JtShTAPjTRwFvmJ7NlmQVHZoUN+Iy58bfl5qVo4hag9EViL8DAr74eC+tFxdqbuP
         WPjA==
X-Forwarded-Encrypted: i=1; AJvYcCW+e6EW2GPrMvvo94kzWd7zK3wbD01bySWWp5cvWc24QhQT+pJPZKYnZ90kouIP4xQXf3UuXL7GBY3n8CE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaV93j5lT+V3slloX2H3edKNOz1SvLwjNzH4otFOuC8uKTMeRO
	eYo6ozs5h7j/xjRJsnC1DRyv3Kj6XJJwZX4IOZIrtZKYUKxgzmBnJ8Vn8CqUa4q4IZw=
X-Gm-Gg: ASbGnctXRmNi5t88MqegmCsOXrRxo8miZTQfBLxJCPW8SRi7Z7vR0ivZqG4EhnfMgQk
	Jlqge1DFSa4+PS+dKR+fqC3xLvZF6bAIQDzvH4JBFagg/Yi3nwn9DYqKFkcaI3I2aQJ+GWA37jg
	Jz/kGXcz7fd74Oc/roDBwqHBcHPDfHkzM66Bh73etyqsFGIM1XC1YAscdFk3EMSV0CzIflbXEWF
	rrDh/5IwjvYEaLwFzuKOrxDnMX70SmE2REj6D4mv71orGvWOxgyt8UrKoouoVK6S/UctL0/WjsY
	dF1avsy/Zgty0S6HKKaD0q28Jl9BIqYQEUofH0dDdikz58QO7V7mn52J8kTi+MkB8DsTjSmsVLQ
	=
X-Google-Smtp-Source: AGHT+IG9uMba89g0EpTCW9RLKk+onN5Suf/gajwi79KfHYljZygSxqkr0XRDyQ5PB6ukUnuqfHOZEA==
X-Received: by 2002:a5d:64c9:0:b0:3a5:39d5:d962 with SMTP id ffacd0b85a97d-3b49aa7abc6mr5230565f8f.41.1751872304964;
        Mon, 07 Jul 2025 00:11:44 -0700 (PDT)
Received: from localhost (109-81-17-167.rct.o2.cz. [109.81.17.167])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47285c903sm9457414f8f.90.2025.07.07.00.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:11:44 -0700 (PDT)
Date: Mon, 7 Jul 2025 09:11:43 +0200
From: Michal Hocko <mhocko@suse.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>, Baoquan He <bhe@redhat.com>
Subject: Re: [RFC 3/7] mm/vmalloc: Avoid cond_resched() when blocking is not
 permitted
Message-ID: <aGtzL-h0TvbML19g@tiehlicka>
References: <20250704152537.55724-1-urezki@gmail.com>
 <20250704152537.55724-4-urezki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704152537.55724-4-urezki@gmail.com>

On Fri 04-07-25 17:25:33, Uladzislau Rezki wrote:
> The vm_area_alloc_pages() function uses cond_resched() to yield the
> CPU during potentially long-running loops. However, yielding should
> only be done if the given GFP flags allow blocking.
> 
> This patch avoids calling cond_resched() when the allocation context
> is non-blocking(GFP_ATOMIC, GFP_NOWAIT).

Do we even need those cond_resched calls? Both of them are called
shortly after memory allocator which already yields CPU when allowed.
> 
> Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> ---
>  mm/vmalloc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 8c375b8e269d..25d09f753239 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3624,7 +3624,9 @@ vm_area_alloc_pages(gfp_t gfp, int nid,
>  							pages + nr_allocated);
>  
>  			nr_allocated += nr;
> -			cond_resched();
> +
> +			if (gfpflags_allow_blocking(gfp))
> +				cond_resched();
>  
>  			/*
>  			 * If zero or pages were obtained partly,
> @@ -3666,7 +3668,9 @@ vm_area_alloc_pages(gfp_t gfp, int nid,
>  		for (i = 0; i < (1U << order); i++)
>  			pages[nr_allocated + i] = page + i;
>  
> -		cond_resched();
> +		if (gfpflags_allow_blocking(gfp))
> +			cond_resched();
> +
>  		nr_allocated += 1U << order;
>  	}
>  
> -- 
> 2.39.5

-- 
Michal Hocko
SUSE Labs
