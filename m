Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D543DDC3
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748402369; cv=none; b=DCg9nnPkN4ivVmU6DzOy//hzxcg1t4Tr3eJfqugddwWp148MB8Gs7QYXN8npD/hkWFWxOhtqMgvaffZZZSV6FUkS/KVwbR1RpxNU7joneOzwYTSpjppun0mw+CsYfUtU2Waa+jscYeCbHX9emn5SS12HfEqv2Rk6E/r1cHtWeS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748402369; c=relaxed/simple;
	bh=WqcUut7Uh6IFoCVTQzBZljWlhhZKI5JTjf2oc7UNTiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IX7XxjZR4BnQ9F9KOeMgkP/IUPWzLyJguhS3yawrWMUbKCM3nMVzixeIYhAlhy5Ma4QXSs93xfBO3ND91kIaPedVRjvDfSM8tQw0/B+S6fkO9nUvCgA3ox0EEikAvSICIrQVt/DyVrl2p1xmRrHazUEpkFFbieYzPn19fXfJabY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H+Z95Uak; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H+Z95Uak"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2348ac8e0b4so70725ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748402366; x=1749007166; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ckbc5erWWTU5DVNbSyTtw3zIMaPaxLHk1njW0B9XZNI=;
        b=H+Z95UakIZYYpsOovjBMbNNuXZjbz5OAHwPCUql3vSlbd9UbSINXqMyCOxgNWLjeFP
         xc4yW/cjd0Q6RGWM0BGjZ01dBCnDeNJ18hkZrtM2QyiZTBGhuwrg4aunEmzY8uhjft3p
         ZgSU0Ars5kYTKrfJVU5WvyXfAhYSJ3bGl2zgk3cc2ttOLABGY4BxbkR2yoj4mMlpm8nc
         VWRx1JHbBJnbFaTH+OYOMwzHMOJ8cicc6qgta0pBfVJqJmALq0rxCrxgZvJJFQwVGv31
         yICn0sglrQzZwp55a+hyV44A2WLUNb4Jdmvs0dQjWfjpBnGFpLpxZljwTrn88N+GrvrK
         c9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748402366; x=1749007166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ckbc5erWWTU5DVNbSyTtw3zIMaPaxLHk1njW0B9XZNI=;
        b=kLCZ8R2vVf0ZuK8lP3jvAtdv/ZBzLrERT+syu3IkLGBbIilnelPbhqYftqtEFziilR
         GXVpLagtHU09yVlxC3qJyV5ie0RnGzZvra2kbs2sQKckXL6Paiu1WcgW0ukbo+GGrAmo
         OOBLWekFcjUNOnQbUPzm2Ued82swthT/QtrRUK+ek4DGT7na4hrH/FjjQ0gdwbWqvR5r
         YMtj7yOcj0KSWEAGAgQWp9SxFSxlZlEWP3vLIR9wSf8PVuJTq3sacArWwc3gBZbB+dlk
         tnMhyxeGvBhhppLY0lc0vOu2+gPlsI462gbIDQ/MJfF9A34DDjVv28hILC63sD2ODYTv
         1zSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWULdMDzhSkgD7JJeH28qBzoxUcTGhPVuGLVRxSBQATuSZAheuNhOG1OLkPESH+5zjwPArDQCvG3fbFmRE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyajpcvwXLgVFU01EFd4UbuKH9TiTPyQo3ORmmCrYOBkUmtzioh
	3j6AjvyqHF1KkeAYVcoIy/d+FHc7F+XzQQCni67A8oum0ojioT3cmv7Hoqx5xrQzQ2Hm8Fu5wc/
	yDfib9fpPgerWOn2BEnArbhFTnJ/yXCv5vYnrLLiQ
X-Gm-Gg: ASbGncuqtTPFWTrv+xsxOivZ3HXS4z8YWz0VC35Mej0zxvnITxALWF0Cc5b8TTCGETf
	rxakiRGOQ5E6rO5PqlSfhUpPLubufIYNOx552h1Tx0dGXMGibrKU5cgMxy7D9mn9sOoGXNaYLx1
	S4zbBu1QYC7itBX5lQjf7CJv4tlD8CsUtqkYz28EKYirBP
X-Google-Smtp-Source: AGHT+IHzKv4vl5a+TBuv6dmOrk3OjFYKjtBWg3LPXvPu2uRbrhu1w2zFUqDX9TMsKiHX67noNgYjWOe7sB2HYbypdAI=
X-Received: by 2002:a17:902:f641:b0:234:bf4:98ba with SMTP id
 d9443c01a7336-234c534cc66mr1628865ad.6.1748402366370; Tue, 27 May 2025
 20:19:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528022911.73453-1-byungchul@sk.com> <20250528022911.73453-8-byungchul@sk.com>
In-Reply-To: <20250528022911.73453-8-byungchul@sk.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 27 May 2025 20:19:13 -0700
X-Gm-Features: AX0GCFu8nwxheVYTgVQh0YpzLPLEu-yPdp50ge0yNj9j14UdYtJf-iaH_MWsx1g
Message-ID: <CAHS8izNnCYOo_bUnfpUXoh5Dqg0=cDKfZP4=BbukZMJN2SPUdg@mail.gmail.com>
Subject: Re: [PATCH v2 07/16] page_pool: use netmem put API in page_pool_return_netmem()
To: Byungchul Park <byungchul@sk.com>
Cc: willy@infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kernel_team@skhynix.com, kuba@kernel.org, 
	ilias.apalodimas@linaro.org, harry.yoo@oracle.com, hawk@kernel.org, 
	akpm@linux-foundation.org, davem@davemloft.net, john.fastabend@gmail.com, 
	andrew+netdev@lunn.ch, asml.silence@gmail.com, toke@redhat.com, 
	tariqt@nvidia.com, edumazet@google.com, pabeni@redhat.com, saeedm@nvidia.com, 
	leon@kernel.org, ast@kernel.org, daniel@iogearbox.net, david@redhat.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, horms@kernel.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org, vishal.moola@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 7:29=E2=80=AFPM Byungchul Park <byungchul@sk.com> w=
rote:
>
> Use netmem put API, put_netmem(), instead of put_page() in
> page_pool_return_netmem().
>
> While at it, delete #include <linux/mm.h> since the last put_page() in
> page_pool.c has been just removed with this patch.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>
> ---
>  net/core/page_pool.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> index 8d52363f37cc..fb487013ef00 100644
> --- a/net/core/page_pool.c
> +++ b/net/core/page_pool.c
> @@ -20,7 +20,6 @@
>  #include <linux/dma-direction.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/page-flags.h>
> -#include <linux/mm.h> /* for put_page() */
>  #include <linux/poison.h>
>  #include <linux/ethtool.h>
>  #include <linux/netdevice.h>
> @@ -712,7 +711,7 @@ static __always_inline void __page_pool_release_page_=
dma(struct page_pool *pool,
>  /* Disconnects a page (from a page_pool).  API users can have a need
>   * to disconnect a page (from a page_pool), to allow it to be used as
>   * a regular page (that will eventually be returned to the normal
> - * page-allocator via put_page).
> + * page-allocator via put_netmem() and then put_page()).

nit: I think the "and then put_page()" is not needed.

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
