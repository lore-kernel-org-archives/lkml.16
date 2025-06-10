Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BF128B7C5
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553953; cv=none; b=iy493ecizsuHckraxeyvjh1zEgGyInha8ITgnvymlY03oS79i11cfJNb+wM73SoZtJ1/uDBuOFfRRKhkcTCsDesppcaGDnzy0BDvHpz4X2axJumgBgvS0NO6XpXSk1nqbOhb7A5Ll7ccSjLDaalBlMSUpfFzpg2iNfAIxQnHE18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553953; c=relaxed/simple;
	bh=bVBYTD4v+/Ier+Ih6qhzzgjDmtl/7PTYTLiH0yhjTJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=la5Qt1/YTlu9zHDQdL9QhLAylgwKqhu00P7FPFWwfVL0TcPX8qHfH3S3CLjzryY4NNGFOVy6RZLpKEX7/ReQEb6wrm9LqnhSB6vP3wtlPk2ugWcHladqlKO9yQhdlizOTe4qRdjIrOQyXM/xVEL2PyRwDUhfYAgLAZqAiolfG60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sf9ftl8t; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sf9ftl8t"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70e447507a0so42353417b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 04:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749553950; x=1750158750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGJoap/WPosW06fDBcr7SQqlOi1DYaMmMX1oaY7kRo8=;
        b=Sf9ftl8tNkdDyvMWCnAzzm/hw+2pgqq6esUgXlU6Be6xD3AnLrrD3k+1rkNZ9iIZBG
         /O+wyaDOjO8Az8v1JZd8IWbB4P3B2CS/hGVvtg9IM3nSWr8jtBw5FezH1njk4cPnyB0j
         iWMXbl7NAlVbuvjlTlLGnTdHXwW9E1rUflKEWH7V/Nkf3yTx+bVWIUscccKFY/FCwrGL
         non1QN3ApzQQpfELVeEhKEgxel75BejUWtc5yF3jasPUyHU73ua/W5betIcfBAo19haI
         d/xzBZ0oMqJCKhM1/x6GyUvtLXiV+Wr6R43xwKtDsB1ynfM7rUDPMn8hzXFKq+nioCki
         YM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749553950; x=1750158750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGJoap/WPosW06fDBcr7SQqlOi1DYaMmMX1oaY7kRo8=;
        b=i5VIPAIyfE3o1FYJ/jMG425FLIKGp3XcYFypD4qqST5T5uRGWxITyv9sScNp+53wg7
         EBJDPpir983Gdf2BByR75MkO7e0lxAdPLI0G6TCutuF3rLx+LjDWUJtx0FvBi42opr2Q
         Fxk7w3etNi39LXA++Oz2nHq+L2JDHWbHEc1EuBgpLj4kFeC3WwKHQR9oZd4BE/+K7LGg
         woLcX6lCSlPYs4kW9SmwrdY95lNMK2SamIb40y+FV7SjmTnDLVggi6kMoDg5KXmZFudV
         aAlotZD7M1AGobAiX1jDQzk0oT2Lwqthksw6PX3Uz/5pwmNvztvNnRPgEIUn7V54KM4v
         gFdA==
X-Forwarded-Encrypted: i=1; AJvYcCUpU7X0kWJI02m1Clrb4PjTRjjJoiwXOmPZyQYlDiOvcDbGuUeFpIqPTYx0yTclVew1JXTA5HFh2S/EIN4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzua7BWocrH8twcza5fSiW3hzq7R8BlPhmJJOcYSM+jzfjJGlX7
	jOPllbaAypQ16LhNh/OkvCezStTAHFCU5KHW2peldGieabVKMGBD27he7qlJpepRASkHEb/a3Hp
	ncSRZRtD8MU8ibg3TqLurGZnWUVcGlqnjSgn7PFGjvQ==
X-Gm-Gg: ASbGncsIElSyNi4s3VWvbbDj0x6Zc8/1BnFjV9/2YN/zyTSdAWw/LLzj21oXOXPETYL
	Lzi5+O8CuFJRm+qw23xUImexeBKhdZifbTQGU+P+0UQb77zlrMqT0AxGYbs4vqKUy1WaC+N66G6
	//m2ZqmTLGhxJi6GE35id6TRt24PWiWBXGWK47GtbetzwA
X-Google-Smtp-Source: AGHT+IG8zsawN3xDkIiHoqtoDeuKT1Bq9JS9Q1xXDw1TdS7PPhQJHt3vukBAJDXQ5rpuyqj39qP+g+huLdHgKtWsHJA=
X-Received: by 2002:a05:690c:6d12:b0:70e:2d1a:82b8 with SMTP id
 00721157ae682-710f772b158mr238734027b3.34.1749553950407; Tue, 10 Jun 2025
 04:12:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609043225.77229-1-byungchul@sk.com> <20250609043225.77229-4-byungchul@sk.com>
In-Reply-To: <20250609043225.77229-4-byungchul@sk.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Tue, 10 Jun 2025 14:11:54 +0300
X-Gm-Features: AX0GCFsoN4Lw-oBn0iS9Ed66FhTtsA-gk57hCRDoaANAiIafqJARqdL3Be-QVJk
Message-ID: <CAC_iWjJQ7k2drnPZh8bjaLvVa9rd2mLw7_=L3hV3scnWBQBvRQ@mail.gmail.com>
Subject: Re: [PATCH net-next 3/9] page_pool: rename __page_pool_release_page_dma()
 to __page_pool_release_netmem_dma()
To: Byungchul Park <byungchul@sk.com>
Cc: willy@infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kernel_team@skhynix.com, kuba@kernel.org, 
	almasrymina@google.com, harry.yoo@oracle.com, hawk@kernel.org, 
	akpm@linux-foundation.org, davem@davemloft.net, john.fastabend@gmail.com, 
	andrew+netdev@lunn.ch, asml.silence@gmail.com, toke@redhat.com, 
	tariqt@nvidia.com, edumazet@google.com, pabeni@redhat.com, saeedm@nvidia.com, 
	leon@kernel.org, ast@kernel.org, daniel@iogearbox.net, david@redhat.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, horms@kernel.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org, vishal.moola@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 9 Jun 2025 at 07:32, Byungchul Park <byungchul@sk.com> wrote:
>
> Now that __page_pool_release_page_dma() is for releasing netmem, not
> struct page, rename it to __page_pool_release_netmem_dma() to reflect
> what it does.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>
> Reviewed-by: Mina Almasry <almasrymina@google.com>
> Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>
> Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>
> ---

Reviewed-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>

>  net/core/page_pool.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> index 460d11a31fbc..8d44d1abfaef 100644
> --- a/net/core/page_pool.c
> +++ b/net/core/page_pool.c
> @@ -673,8 +673,8 @@ void page_pool_clear_pp_info(netmem_ref netmem)
>         netmem_set_pp(netmem, NULL);
>  }
>
> -static __always_inline void __page_pool_release_page_dma(struct page_poo=
l *pool,
> -                                                        netmem_ref netme=
m)
> +static __always_inline void __page_pool_release_netmem_dma(struct page_p=
ool *pool,
> +                                                          netmem_ref net=
mem)
>  {
>         struct page *old, *page =3D netmem_to_page(netmem);
>         unsigned long id;
> @@ -721,7 +721,7 @@ static void page_pool_return_netmem(struct page_pool =
*pool, netmem_ref netmem)
>         if (static_branch_unlikely(&page_pool_mem_providers) && pool->mp_=
ops)
>                 put =3D pool->mp_ops->release_netmem(pool, netmem);
>         else
> -               __page_pool_release_page_dma(pool, netmem);
> +               __page_pool_release_netmem_dma(pool, netmem);
>
>         /* This may be the last page returned, releasing the pool, so
>          * it is not safe to reference pool afterwards.
> @@ -1139,7 +1139,7 @@ static void page_pool_scrub(struct page_pool *pool)
>                 }
>
>                 xa_for_each(&pool->dma_mapped, id, ptr)
> -                       __page_pool_release_page_dma(pool, page_to_netmem=
(ptr));
> +                       __page_pool_release_netmem_dma(pool, page_to_netm=
em((struct page *)ptr));
>         }
>
>         /* No more consumers should exist, but producers could still
> --
> 2.17.1
>
