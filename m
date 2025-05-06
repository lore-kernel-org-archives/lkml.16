Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F4B27C170
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 11:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746532585; cv=none; b=gM53j7MiWExCAU2A0qYm/5GnJIswwWO+MfyoL+JTEbhI3BRyFvnNVUvvZTLJfF5dS3YS2UrFFu0b+Uv839CjKeXZAxABPYRvvoaavkj5SCwnObPsHMd7WcwTFw5oxn3LXZoYZDEqo0KrOz+R32MgBDmeRvkadX43t2t62YQ1Abw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746532585; c=relaxed/simple;
	bh=5+ipE9UhJF+YeppF5M0T3FzTwH5/yUg4Yv/hjzEnqyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DEs/I+iL6QIr/3n+OEmvgtxtJ8TetDzHZ0FVwNB+y/P6Y42Qir+4isxinSUtYgCusBuNCVRlMX8gra+ER3o3XPT7rwBMhK4Q9JoNajBkOv0c+oCdaL+9I3g1HcC+Ffm3GDl0W6oTMijuAIip5J0b8jUCvLDgPCGgRYhaF+t/rzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YsmUegA/; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YsmUegA/"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39ee5ac4321so6736724f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 04:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746532582; x=1747137382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PSp23uKg30FosdR57Aue+EjwAXnVYQPmW9iMNcd6hw0=;
        b=YsmUegA/y99sHO0ctsgIAbjoDxcxtRxBByTMOrTBGGdg+HjGbS65T9xtag+givNz++
         Gs2FaEHuXvcoJ8nWGIMB4T/6J2hJcoIfs3G4FEsn1WLDsns1k18T2yd9DyIwqRSK66jH
         RVoDwCa6otjR/4nexyZm4RBBJE9vaWRu9lRK0OlgR6i0itz1Gys8n8nLD0epha8zXLnV
         pJ8+wGDfzUv57p9DmG4BnXQqtjLDxYuPtTxM5laXt9DBWExeZJA0JWdn5UCROGExa8oS
         /Bq8hRre62eMeCgBJGP9XQoO27qIp5IRCbchGpFLxMIXnrzWiv6WbP0FUy3BdwFV9904
         KfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746532582; x=1747137382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSp23uKg30FosdR57Aue+EjwAXnVYQPmW9iMNcd6hw0=;
        b=HLqk8Nvcg8CBcr6vh7FzMswiJgi4XoSVWrMQKd583+GDK346N8TLhFna8BxBA24mtB
         Zwio5oC340EqrcBCkgdZyWhI8YeAF7XtE6cPUX4lZgCY6vFsQ7C8A9UtJSOGWtuV6bY7
         tSelm3CKkNkhlfPhFUMePQemR9L46CbpzLkdcc4MaGRe9CzePHQPw6gxCsDLY8AHnuKK
         +LPAZMHH2C7FpnserpT3FmhfVZArZmYTp3N2yegNRLuTlOhDBw0cwCCS3ZVzkNrgY3o8
         ay9Uh/EZmZNqLbv3s9uDFHMOZJpyprMeeH7/Fozua8d8pe3xKcK7b1/yKsUP1EEHtJTK
         M93g==
X-Forwarded-Encrypted: i=1; AJvYcCXhecD+aiQ1iGWAH9f19KtxDDMiM5nqhk0CSLB947iJ2WuvfvSi0PwG0xZzD96KSiWwRD7zaFleKxZvmH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHPNhHoDT7+GECu/GBdcdWo5VnGGPqH6+0NKEAUIzKo2lE7DUd
	dCEFq8g3FXrzh5XiikD8/ywxyIOPfC5wghacHH4drlYc6F7IUtxA
X-Gm-Gg: ASbGncti2tSc/8fgP3iptKTc4JaDhtbtTDdzk+4SliA3vzK4sQ8zx+Zc8g2qcHKWxeI
	COy90sY2nc96c/kn+GnxJq4vfI8+3RsvxwnL6nmocaWukKCRbgFwnBwAwYzfAIIbcI3RQmBiFxg
	nFK7+WSNb5UWmv/z3a3MeVi4qkzK0gqELeZFDuc2dacmdwzWKcJznnP+L7bLfMjN2YtQdnkE/hx
	hi+DXFOZk/U+oYGZyB7JTUislkLBiHeBWa0oOGA3uKfIpu/EG+BEhPeFL+PQ5x9iddMEBm6INTO
	jX0onkeJddo3hi+P4Mtp6XAcBrcvun4jySx1za9UZELWFGZ1LSsNdMqQd/y+ww==
X-Google-Smtp-Source: AGHT+IEUE9rYhVi250wDtV5/V82hfsptu/C5vtWowRF13T50+FQmQCJ1nlvMwA+hON9plMr6424SeA==
X-Received: by 2002:a05:6000:1a89:b0:38f:2413:2622 with SMTP id ffacd0b85a97d-3a09fde46c2mr8312683f8f.47.1746532581784;
        Tue, 06 May 2025 04:56:21 -0700 (PDT)
Received: from f (cst-prg-3-11.cust.vodafone.cz. [46.135.3.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89ed4d4sm164477165e9.19.2025.05.06.04.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:56:20 -0700 (PDT)
Date: Tue, 6 May 2025 13:56:13 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: Jeongjun Park <aha310510@gmail.com>
Cc: dennis@kernel.org, tj@kernel.org, cl@linux.com, 
	akpm@linux-foundation.org, jack@suse.cz, hughd@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/percpu_counter: fix data race in
 __percpu_counter_limited_add()
Message-ID: <aiap53zqms4igpmdxorv45xsgzyx44xb57jupr2ndiibu3qugo@mg53s6mdbq3j>
References: <20250506102402.88141-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250506102402.88141-1-aha310510@gmail.com>

On Tue, May 06, 2025 at 07:24:02PM +0900, Jeongjun Park wrote:
> The following data-race was found in __percpu_counter_limited_add():
> 
> ==================================================================
> BUG: KCSAN: data-race in __percpu_counter_limited_add / __percpu_counter_limited_add
> 
> write to 0xffff88801f417e50 of 8 bytes by task 6663 on cpu 0:
>  __percpu_counter_limited_add+0x388/0x4a0 lib/percpu_counter.c:386
>  percpu_counter_limited_add include/linux/percpu_counter.h:77 [inline]
>  shmem_inode_acct_blocks+0x10e/0x230 mm/shmem.c:233
>  shmem_alloc_and_add_folio mm/shmem.c:1923 [inline]
>  shmem_get_folio_gfp.constprop.0+0x87f/0xc90 mm/shmem.c:2533
>  shmem_get_folio mm/shmem.c:2639 [inline]
>  ....
> 
> read to 0xffff88801f417e50 of 8 bytes by task 6659 on cpu 1:
>  __percpu_counter_limited_add+0xc8/0x4a0 lib/percpu_counter.c:344
>  percpu_counter_limited_add include/linux/percpu_counter.h:77 [inline]
>  shmem_inode_acct_blocks+0x10e/0x230 mm/shmem.c:233
>  shmem_alloc_and_add_folio mm/shmem.c:1923 [inline]
>  shmem_get_folio_gfp.constprop.0+0x87f/0xc90 mm/shmem.c:2533
>  shmem_get_folio mm/shmem.c:2639 [inline]
>  ....
> 
> value changed: 0x000000000000396d -> 0x000000000000398e
> ==================================================================
> 
> __percpu_counter_limited_add() should protect fbc via raw_spin_lock(),
> but it calls spinlock in the wrong place. This causes a data-race,
> so we need to fix it to call raw_spin_lock() a bit earlier.
> 
> Fixes: beb986862844 ("shmem,percpu_counter: add _limited_add(fbc, limit, amount)")
> Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> ---
>  lib/percpu_counter.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/percpu_counter.c b/lib/percpu_counter.c
> index 2891f94a11c6..17f9fc12b409 100644
> --- a/lib/percpu_counter.c
> +++ b/lib/percpu_counter.c
> @@ -336,6 +336,7 @@ bool __percpu_counter_limited_add(struct percpu_counter *fbc,
>  		return true;
>  
>  	local_irq_save(flags);
> +	raw_spin_lock(&fbc->lock);
>  	unknown = batch * num_online_cpus();
>  	count = __this_cpu_read(*fbc->counters);
>  
> @@ -344,11 +345,10 @@ bool __percpu_counter_limited_add(struct percpu_counter *fbc,
>  	    ((amount > 0 && fbc->count + unknown <= limit) ||
>  	     (amount < 0 && fbc->count - unknown >= limit))) {
>  		this_cpu_add(*fbc->counters, amount);
> -		local_irq_restore(flags);
> -		return true;
> +		good = true;
> +		goto out;
>  	}
>  
> -	raw_spin_lock(&fbc->lock);
>  	count = fbc->count + amount;
>  
>  	/* Skip percpu_counter_sum() when safe */
> --
> 

As this always takes the centralized lock in the fast path this defeats
the point of using a per-cpu counter in the first place.

I noted this thing is buggy almost a year ago:
https://lore.kernel.org/linux-mm/5eemkb4lo5eefp7ijgncgogwmadyzmvjfjmmmvfiki6cwdskfs@hi2z4drqeuz6/

per the e-mail I don't believe existence of this routine is warranted.

shmem is still the only consumer.
