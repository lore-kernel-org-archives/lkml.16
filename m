Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE161C5D7D
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 07:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746862158; cv=none; b=JC+bEsISsO9OTWYBmtWwsH45+aZAi62fF/37nkOB5CyBXNLpHggxhSYUZ5IapkrzYRF59kOS37qGvoa1ZcxXpJhBe+nELEjgFp/mybHn+QgzAE54phU0LSUE3uNL+EDqS/K2/wlbYX6xfA3gGMfhWmktuAcErS5Pd8jtu/1lKYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746862158; c=relaxed/simple;
	bh=xvMJy4jOfhr05ap3IoxrAv5Nl5E3LbWkecByzv8o984=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K42Zzrshhh8C6w4NkCmDJeiruG1dlw/dFX2NcwpQ06b7AYwZACtVNuerCH5LQwihzD557J1vcPL4pvTExkfWrP16p5hZqkUZqPA7cDJ3EKlmSdlKy4qGeDwNvFQ7F5cRWb4EhaRyPxGtC6WS+3pIuvujgCZh6b9qSJJ8vLYZ5AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FZhqWk4A; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FZhqWk4A"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e73e9e18556so2777219276.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 00:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746862154; x=1747466954; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rmD36ciZziZR7H2RC8Oob602p43Xl1hi/xBE0M4Q8MU=;
        b=FZhqWk4ApcT6+VBF+M4s7PWQ4tvYeyPQ8R/brgGghjJH0YXL8m/yPOGSsMKSA4LC2E
         8SooMeQytLUEDAO4S7zZ3YVgYqD6wS7THBa4WlAcPZq97ZPhcmNFkSrIyXbP+tEerDmh
         Uij2/fjbUrAxxu9cPHpxdSgI1L0Z3s4qb4XZFX05qwKqsksciaQ+oUd22jYdBx7MOOq0
         Yi3+8yJvgOz8hLSzLERJC2H7pfyXztuvyC3qmnxHrw3g6IAqrVMP7mc8W7ZLza2Qfb5J
         /FIrzhRDUHud5IyxOvwJpQdZYttH4cINw7jrn0V1xDPoLYjvDuimeDQD8ANJT1u2Brju
         fiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746862154; x=1747466954;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rmD36ciZziZR7H2RC8Oob602p43Xl1hi/xBE0M4Q8MU=;
        b=hD9L9QqXJYzRKr0UH8elLYksj2BQkXynTsUdBv3ZzHAO6CoIzI5llIggWpEQmSQo71
         zkXn6LqnpNc7lGsHPbwGFcXrd/crOC8uhFzJBFg6tHg3KZlHOvzZm3xB4Ucdqz7cqqNW
         l0wEzY5J/otHOjcIxJZCxerJJ5OlAl3QDj3qsneMFiCinO1M7BOIlvMIA12HRYwMyGjW
         ZIskycYLAmA4rbwgettHSAxqea4nqJt4m+1hVbfq9kG4Xy5giLuDNHaLhOpLuYJHaO3o
         4/PTxRS0rz6BP2H7kLaODW9um1rsnAs8831xwf5TYCjqAz9opcOK26oFZKTzCXLzdsYV
         Nlmg==
X-Forwarded-Encrypted: i=1; AJvYcCXPYK0PGJ2G8VKmNdatnON80IxtGl1htx3d4e5AFk6uP8/JBilKIBPYQhWbWUeJXXS4zmm+BSVkV4NrFoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YylRyf7FIMJkfmWU6CiCIu7pAIqF8t9bJme2xpK0sMvYXN4lRDE
	wEfgTgBR2/riNQVkA38eCygEXmU6+3BRpc42uydnzVpe24Og5LIdFWoMJ786GClGbvfx3M4Abqx
	KJCXckdYlZXrTBUh9P/+3iYJF681yIUb0o8fe5g==
X-Gm-Gg: ASbGncsiY6mqVVfeY7fClpJWTjt0tGN8E+Mwk5DdVbQ3PYtfBHpAwXmgY6/nw2Y34NS
	z1KtgwOETBYkHU9G+/a93s4HHrlonn6hZHnUbrTXt0gPQEq0Zj+gxXnm9DNSRmW9o2d5aC4zxF7
	d7nyZ6GpWPZZlI3O3x9a2dandSE3KNu3mo
X-Google-Smtp-Source: AGHT+IEfIM9Qw+3d6qM4rvgEJLOTcGMzXGJ+Hg/E23wPkNnrtYTIEl4IAR6K4XzzErQSvkwMjFJbKzhGzX8NrLjHTkw=
X-Received: by 2002:a05:6902:2012:b0:e70:a83d:da74 with SMTP id
 3f1490d57ef6-e78fdfb0cbdmr7844342276.9.1746862154336; Sat, 10 May 2025
 00:29:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509115126.63190-1-byungchul@sk.com> <20250509115126.63190-19-byungchul@sk.com>
In-Reply-To: <20250509115126.63190-19-byungchul@sk.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Sat, 10 May 2025 10:28:37 +0300
X-Gm-Features: AX0GCFsXhaptoCkxu0ZbCxN8jfaibb-tlI-nC4q5nIWFLMwAFBGIlbfnvN55rlU
Message-ID: <CAC_iWjLwC1t=Xrxb9QUxRpRqHCuXLcC6eRtu+Tr=NbpS-BFt4A@mail.gmail.com>
Subject: Re: [RFC 18/19] page_pool: make page_pool_get_dma_addr() just wrap page_pool_get_dma_addr_netmem()
To: Byungchul Park <byungchul@sk.com>
Cc: willy@infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kernel_team@skhynix.com, kuba@kernel.org, 
	almasrymina@google.com, harry.yoo@oracle.com, hawk@kernel.org, 
	akpm@linux-foundation.org, ast@kernel.org, daniel@iogearbox.net, 
	davem@davemloft.net, john.fastabend@gmail.com, andrew+netdev@lunn.ch, 
	edumazet@google.com, pabeni@redhat.com, vishal.moola@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 May 2025 at 14:51, Byungchul Park <byungchul@sk.com> wrote:
>
> The page pool members in struct page cannot be removed unless it's not
> allowed to access any of them via struct page.
>
> Do not access 'page->dma_addr' directly in page_pool_get_dma_addr() but
> just wrap page_pool_get_dma_addr_netmem() safely.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>
> ---
>  include/net/page_pool/helpers.h | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/helpers.h
> index 4deb0b32e4bac..7e0395c70bfa2 100644
> --- a/include/net/page_pool/helpers.h
> +++ b/include/net/page_pool/helpers.h
> @@ -441,12 +441,7 @@ static inline dma_addr_t page_pool_get_dma_addr_netmem(netmem_ref netmem)
>   */
>  static inline dma_addr_t page_pool_get_dma_addr(const struct page *page)
>  {
> -       dma_addr_t ret = page->dma_addr;
> -
> -       if (PAGE_POOL_32BIT_ARCH_WITH_64BIT_DMA)
> -               ret <<= PAGE_SHIFT;
> -
> -       return ret;
> +       return page_pool_get_dma_addr_netmem(page_to_netmem(page));
>  }
>
>  static inline void __page_pool_dma_sync_for_cpu(const struct page_pool *pool,
> --
> 2.17.1
>

Reviewed-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
