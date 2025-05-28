Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C8317A2E3
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748403191; cv=none; b=pmcO7rnvArdx7i2MZlyWPyt/Yg6TADto9Tnk/4YXqCvbTcQUXD0L0QJYXfGXTvz2aAc1ZxaDsY7gnpOeo6sRTlNZP2CeM5QlEit2zUViypGwMfqjDOMMSlRXJGBoRNrVrNZHY2KYY2SMQKPjCdfnBq/0cH1Ss036YwjW6kw/l4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748403191; c=relaxed/simple;
	bh=4/HY1VdWL+M1HZdhEbLRc98xqnHDG1nzeo/Mnk034c4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AE44FovqZ4jkurepzNDFbtTQm/OoZlREjuWBlE+zMuASViwqC3VR274eVf251Jqrcj75YLFcepD4lG+FDMYY2RUeyv/ijqLqlcVlAX9egQSZwGSGcl4E/ENkos94Yk8XOsZpQK4kG1n5wERNnHHgSSdYfeJuasHwBpTvgqRW6oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bGgd2hZK; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bGgd2hZK"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2348a45fc73so109345ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748403189; x=1749007989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1NvDGJ09/tu5lx6cy96XQEBcqTxbssUzneuCXvKiQ7w=;
        b=bGgd2hZK+mbqmMG1DxUvm5OUei+trsCojaOYx1FohQe+8kegpLYO/BoNUp7V9HYhsb
         IvRvjM7UGmWfarcs0WytcMj0ulQV43nvUKBW0fOrvtKzEZjw8k9pBRA/j8/tsQwX9lU9
         GoBg135/71C+tyg3fQq8BE9/V1UwnGWZqW0b2N/F9+NjQPYx0hz6mCf6P9GmLkUgXlAw
         5Y+vhCbIdm+wK3S4AcvnjqUGYf6dtRkLVETY4iEQ+QOoMcV+FWQ860+9opfRfTXVnC2V
         yrq3JH1IVn/a5HKs5qDPdcu2yU/4d4KdXUmHtIGoW+gd86IOlJmARc5IpHJVRA1BBssg
         eQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748403189; x=1749007989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NvDGJ09/tu5lx6cy96XQEBcqTxbssUzneuCXvKiQ7w=;
        b=jJPkIVe+t+aQSDpih22FcLAXatK+3+a9r47q905Hyz1N8HozQYy/QoR/SLA0lEK5in
         K03BizSjWwWK7Ib2iuZDkPgzenV3t785Xc8MT6P0RkM3thbr10//24TzTX0XzQ6og4JN
         /0euI5aA8Yy0uZDoJ3QKoY/5vPM+FUI/LFMP/8MW1rqCZl+jYZGZXn6oePHSHIp/ZXdq
         4sQN3Zq8TP4WDFdkRUja7admJ4Whw7SOeEbZ/Ku0GWSXIBlNBOMHzQfrxuVF6Mgick/o
         vrjpp7lV5C6WQWXA7n8jdW5peWLtW5Plb8QY5aYqaTpWi73dtAEn5uKybMnOc30HQNCM
         DVcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFRqsVtAwEUTOtFL6YPUozPVzcyaLo05BL/QDSUmjGWmkfMwnzpfLpqyjon8xLXUD4IfK4vpkgcAQdn8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZE/9ovoqDNji4u2UpTTZvduE596FskzGXT1vQnGkWgMaURVUp
	zAHqNwhrQRYLdacUzOLs0E4mtYTDVg1uUHc6MUb+F40a3f5UqhgwKwqzzmpR+BB6wUR1x9fqXsc
	DQ7dd4uVQGw+TSD81AVEhCm9sOfTZ1S6UvRzBnIMM
X-Gm-Gg: ASbGnct1fq8e/MHwal3CKexg/IEIT72z73i3cK7hW91OmDqmfwmuDzKaYYjS03LVpXq
	aWFF6tN38CMceq7iua2sLPPR9kG8iT9DvuuwFhweYAc1Z+ns8lcn6j2YWtYha8NLVwcuIugUjFq
	xGyLoPbkaEziLJbWCxrCJgejopkJna1v5ZPk2BUFnuC6Pc
X-Google-Smtp-Source: AGHT+IGOF0NG3MQmraD43lvm7RYkw+L1ZNMtg/526GYJO8l+kiYo1BH3IU9UVbT9cidKiq8Ig68hPh33Ie4D7QG4Asc=
X-Received: by 2002:a17:903:24d:b0:234:bca7:2934 with SMTP id
 d9443c01a7336-234c5222e3cmr1866435ad.6.1748403188460; Tue, 27 May 2025
 20:33:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528022911.73453-1-byungchul@sk.com> <20250528022911.73453-17-byungchul@sk.com>
In-Reply-To: <20250528022911.73453-17-byungchul@sk.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 27 May 2025 20:32:55 -0700
X-Gm-Features: AX0GCFuJLqKeYzCNk8mzICLO0VU5BcZ2poUiBYEj8luKwtcPAu1yEtAEKuGm8qQ
Message-ID: <CAHS8izM-hfueYox9Eqti4OsoCafh=pDL2v-6BEJRyt4ay580hQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/16] mt76: use netmem descriptor and APIs for page pool
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
> To simplify struct page, the effort to separate its own descriptor from
> struct page is required and the work for page pool is on going.
>
> Use netmem descriptor and APIs for page pool in mt76 code.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>

This patch looks fine to me... but this is converting 1 driver to
netmem. There are hundreds of other drivers in the tree. Are we
converting all of them to netmem...?

The motivating reason for existing drivers to use netmem is because
it's an abstract memory type that lets the driver support dma-buf
memory and io_uring memory:

https://www.kernel.org/doc/Documentation/networking/netmem.rst

This driver does not use the page_pool, doesn't support dma-buf
memory, or io_uring memory. Moving it to netmem I think will add
overhead due to the netmem_is_net_iov checks while providing no
tangible benefit AFAICT. Is your long term plan to convert all drivers
to netmem? That maybe thousands of lines of code that need to be
touched :(

> ---
>  drivers/net/wireless/mediatek/mt76/dma.c      |  6 ++---
>  drivers/net/wireless/mediatek/mt76/mt76.h     | 12 +++++-----
>  .../net/wireless/mediatek/mt76/sdio_txrx.c    | 24 +++++++++----------
>  drivers/net/wireless/mediatek/mt76/usb.c      | 10 ++++----
>  4 files changed, 26 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wirel=
ess/mediatek/mt76/dma.c
> index 35b4ec91979e..cceff435ec4a 100644
> --- a/drivers/net/wireless/mediatek/mt76/dma.c
> +++ b/drivers/net/wireless/mediatek/mt76/dma.c
> @@ -820,10 +820,10 @@ mt76_add_fragment(struct mt76_dev *dev, struct mt76=
_queue *q, void *data,
>         int nr_frags =3D shinfo->nr_frags;
>
>         if (nr_frags < ARRAY_SIZE(shinfo->frags)) {
> -               struct page *page =3D virt_to_head_page(data);
> -               int offset =3D data - page_address(page) + q->buf_offset;
> +               netmem_ref netmem =3D netmem_compound_head(virt_to_netmem=
(data));

It may be worth adding virt_to_head_netmem helper instead of doing
these 2 calls together everywhere.

--=20
Thanks,
Mina
