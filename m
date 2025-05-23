Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29CC20C489
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748020511; cv=none; b=oAx2Wo0hPz9tcTzaBBTGShLY2auqrq8ISx4yTVDhGlLHRx62i6eqrVnWE/nMm4zhNSfcKCL0Qn0mtuWuN/h22prsx7TKEqTJT+AIPDAvzclhJwuKYyowZP963DUs7D+jdjWLbVtxkUatU3Gk3vPJsmK5V6l607I50J8mijUtaKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748020511; c=relaxed/simple;
	bh=IHS8+BmUXeAp3Xzbk8VRC75jhVDLrcvcJDpOGyFT7GU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cvq6DoDqyJb0WzTyHGBFarKNRuzo3T039rluP+PJgOjGTuQoYdJJJm8zwBFGtnHpEMQMwVNrWgmIgXWdgVCwkZ0bqfESr11Xu0WjLNGC0wfeiL/3UwuX5WEorSpIWM5989xJGksMoC4jQNB5Xk9KvO0Bs/EN6FWMZr6s8GGVRFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AwgU7xHF; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AwgU7xHF"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-231f6c0b692so11445ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748020507; x=1748625307; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1L0JjzOjlHgjWZPMHxouS8dOF8m0fP7fyoaNhah9J5s=;
        b=AwgU7xHFPElDMpaAU2nPAe0detPN0TBDBZo9r3J8vgltoaJUD6xbW+C4kcqpRTU/H+
         6K4rkF4f2uQt5i+JqWLT0ClCJebaZn20/vB9xGle/iNkNyt8XvReWD6cOdoDCAljwm+s
         NcRAlv24FvVZW04dVKNX2qK5zQsTS1JmpKRoIlu52XbRWD0uUYR7yPdgITxg4iO/0BK4
         sYe3wfRTiWIb5dvpWnqNJIbDojNAk1GRbc21Gu3uttpmR659UGJjyU0fQ81iQwHyXOBa
         DHWBDsexEyVggLoH00S2STn56e0Qy27cIdNRoA4D0baHyJ+ETyoVH5ILg01dG+wF63UD
         oKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748020507; x=1748625307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1L0JjzOjlHgjWZPMHxouS8dOF8m0fP7fyoaNhah9J5s=;
        b=i4ArvzJAw/2YFl7LCWofWkhRKoy/xqtJPoYFUDPBZGZqKTninF3M0dBcPC6ZbLBTLS
         pXi7PfmBabY6S2YL5VmZaenAeQfh9fqw3nZfKLoKzdDrhdn7EDlSXW58V9b2FAZrh/C0
         RNNk3ZGaCfjrGNcC80Msr0FA/PllVnXbgPgC4CHBiD1+5buU/WFC6aZHeDpEuNvrVGlD
         w+59F+O6T6rWYancsRG42ub4ob2hoo4svCIcuhyhcLhYfZhsMJCZBIm4Z+zx7aLG5PtB
         AlYczbLmz5hECatffO3oMeYbQ+S3YvTgdtomg0q2Ky4yYZIEPwp2269z185g16K5R1yC
         9TMA==
X-Forwarded-Encrypted: i=1; AJvYcCXWlcve2y/7ZwRo9LXNd69ry1GemJNF8IlPOib74q3noYq7TNP/cCvCWPmt+gfBzdQmKI5KBNrZdZvBUcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBrAu08bXt3TEpXmfNMxtcODvnFOQx5zW3ZoD1CKMLsTWZ3X8w
	kGHatEJqTlTAjmfYutJdvCbPeAscTHtRlc1YcqVxvMuq3NWjg1XpIUv6Pbpd0PplbbSnOw0iWAJ
	7mF9YSfeUpeAN6SuCmcTVbo4M+6llzUB2/h+Og0cx
X-Gm-Gg: ASbGncsmE5reVrWcrCy5rXtOMNxywkwt55sVZbta0PzLXVcOE4q3SnxwjrNGTxm1FtR
	S3a6SS+jxPtwvFk+UR1nERQXdNtmPqoIu4YF2hFBRtjz6NzXKUhmqUdrF4lm7HSjWD6c6ZgRiM8
	0GZ76bsaUJMjcEZNyNIisOUMzk2HUPiaP3BD5I1Bvm88PmzHKF1EZAQnPNSv8MYbQSG4y51uNaO
	gLqEs8vjRg3
X-Google-Smtp-Source: AGHT+IHKY4+eyOTipL+J4QWHEmhi7z98sbn5GuQRI5Ig+KizZC1qpLnfhveOl7CVrrTaKZsQhRy6NnMNBA8jCy7xQ54=
X-Received: by 2002:a17:903:2348:b0:216:7aaa:4c5f with SMTP id
 d9443c01a7336-233f34df516mr2608055ad.3.1748020506755; Fri, 23 May 2025
 10:15:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523032609.16334-1-byungchul@sk.com> <20250523032609.16334-15-byungchul@sk.com>
In-Reply-To: <20250523032609.16334-15-byungchul@sk.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 23 May 2025 10:14:54 -0700
X-Gm-Features: AX0GCFuS-_ZvIZXs7vWDJYGmbnFNShYZqaEghvfevVpzOFymPJ1-gQ7S9gnP9aI
Message-ID: <CAHS8izMRDixoLC5p1+h4oxrfVvErXcokR6qC_zuOqBredBBMbA@mail.gmail.com>
Subject: Re: [PATCH 14/18] netmem: use _Generic to cover const casting for page_to_netmem()
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

On Thu, May 22, 2025 at 8:26=E2=80=AFPM Byungchul Park <byungchul@sk.com> w=
rote:
>
> The current page_to_netmem() doesn't cover const casting resulting in
> trying to cast const struct page * to const netmem_ref fails.
>
> To cover the case, change page_to_netmem() to use macro and _Generic.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>

Reviewed-by: Mina Almasry <almasrymina@google.com>

> ---
>  include/net/netmem.h | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/include/net/netmem.h b/include/net/netmem.h
> index 29c005d70c4f..c2eb121181c2 100644
> --- a/include/net/netmem.h
> +++ b/include/net/netmem.h
> @@ -172,10 +172,9 @@ static inline netmem_ref net_iov_to_netmem(struct ne=
t_iov *niov)
>         return (__force netmem_ref)((unsigned long)niov | NET_IOV);
>  }
>
> -static inline netmem_ref page_to_netmem(struct page *page)
> -{
> -       return (__force netmem_ref)page;
> -}
> +#define page_to_netmem(p)      (_Generic((p),                  \
> +       const struct page *:    (__force const netmem_ref)(p),  \
> +       struct page *:          (__force netmem_ref)(p)))
>
>  static inline netmem_ref alloc_netmems_node(int nid, gfp_t gfp_mask,
>                 unsigned int order)
> --
> 2.17.1
>


--=20
Thanks,
Mina
