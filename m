Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F5D1F5E6
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739232078; cv=none; b=hHBBCTbRnJt/O/8kGzDNhYrUGxOOPtVqZccmSzDAVSR/kxYbgwMZ78E2I30BmxPZgq1daBbmSNF1IaXKCeX5BZ4Z7oI15OFJPxhcW+slTALFt+jIiQNzFIThoA3iDSgviOpI3uqI7yIPG7DFuNxg/U3tC2nUJumtewty5HQMOIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739232078; c=relaxed/simple;
	bh=nJ6LzyoeCFVUzoZJxDKWwrZWehljrX0DhSYi/LN5Rh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shrp6Sh/sJOmYEmY0SDdXiqGVzfrlwPRjDFM/UcN6IzGp/zCndtUgSOzanspwX9rW1NA7+UEISWKtiRUljRXgl/TxWr12padqIfTnQ5WElefXAYsIgOvojWIp7YtLJQ2QuknEs50KQTsOy5sncuSTsxmfjt/4LTCYyj+BJRX3Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iX5WbZS+; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iX5WbZS+"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3d14811cabfso9772085ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739232076; x=1739836876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o+6VjZyKkm05cc5abGkcRCYDQiyuvjp7DI1YWDZerk8=;
        b=iX5WbZS+JoAYBsgYxpl6YrW89+p70yhF992Vocgl1ivjdsv+Satdjm2HcL7lSdBpl7
         SOEeJpC9dxduVk8eQbhzyGyfRtI84+H8+5zVdhqxsg8ct01aHL96fo5EfI4zNh2sqSHt
         2ceVv45CI4Ub4aUp0R4dRks7NoYYo75pH8X8e8oERVapjcQAP8w2P6rkqKdcU30iASKB
         bnkSFwH7cSU2GIkcpT4SWfGfI6lo2RC0NJIfZ7o47OQ1zbtdZk6/ElOdg9qhjGEr3pPw
         OEvhYdS8nmV2sUGoqX5JwZAT7qFttafzr7Hzg/uuJ04wWSkdoY/dAKjaaLRal6NOeg2+
         N7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739232076; x=1739836876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+6VjZyKkm05cc5abGkcRCYDQiyuvjp7DI1YWDZerk8=;
        b=eGF5X08UAe5e25BnTCNxFvIJE3qg5XIeIy0qsMzjsm6OPqQZlUVEeVttgqrzJZ1PWQ
         FP9630HN3sBr0ttXW6OEgXiDLV79XQzGStOYlXCQSrtusq2AVWp9vAE6yLk57ekMq9qx
         VtUIvF8ENNyCjtzjFkNCj2CgxxaMzfPQMDQQlXcv3kL1CqdLs309MqRUYr+TCPxauu10
         ltPvdLtyy7CMLNwpQcz1U5n2s0ZQn6WGjyv2OQJ1XEX6vyvYcjI+hm0SRfzG+wJJGgmc
         aFtheNjgm1R5XNUoRqmA6Gvqjj1p2+TEqJQ80Dwu2uaC0chf3REeGNsDkDeZEazJAfVe
         MiPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk76cq7LteC4PN62oQo1rvuytXXJFsR30uLo/l9PezAp8QLrWww46egsuziqDTC9oyzm/bKbVaAQCGyus=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOy59LZouMzJqDAgjvAsAVDmGLEA8JkL8W4bKRgwYVpJ0t5E5c
	EnvTac3fzjwejyG9KzusF/HWNo/y9Gg6h3vjT9DjA9bAiLmidgKMktrgs/3LFw==
X-Gm-Gg: ASbGncsWDzzt0xd3MVTiks6knQMQIQnBetsAJYwWnkOU+EJ48P8g5ApewJKJlI9rQCS
	hSnLAVl6ywT6SQsZ81Blz1E31Ujrf1fqor+FP3x04fgYKWvNC1LCOZv3QqSxt/VmXWm9XO9pwdf
	HfqZ/hbmHKtn0zW8LbHp8M+l87QRdb4VcmjQfOHsR//g07jvp1YntEKmoUDM09scDDarK5O+nTG
	VsEprb/v2NVJ7pvEkbm/8Whzsu3fdePC+SeU9b3avfynasuWK4JtjNyfWn+So6ICCaVFcW3VIfW
	8+OzmOXccBN/Lf9fmKzrUutM5vy3huIwjlbGStt4AbqJSEt7vpqRUq4=
X-Google-Smtp-Source: AGHT+IEPW+Dnhu306cg6k4cp4JKL9h87jLz1ibbxMZeZMr5tSf0uulSyxZPsQKhKZyhcDka4DYJs9Q==
X-Received: by 2002:a05:6e02:b43:b0:3d0:23ac:b29f with SMTP id e9e14a558f8ab-3d13dcee786mr134115905ab.1.1739232076020;
        Mon, 10 Feb 2025 16:01:16 -0800 (PST)
Received: from google.com (143.96.28.34.bc.googleusercontent.com. [34.28.96.143])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ecef0c9674sm1185594173.117.2025.02.10.16.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 16:01:15 -0800 (PST)
Date: Mon, 10 Feb 2025 16:01:10 -0800
From: Justin Stitt <justinstitt@google.com>
To: Kees Cook <kees@kernel.org>
Cc: Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Yishai Hadas <yishaih@nvidia.com>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] net/mlx4_core: Avoid impossible mlx4_db_alloc() order
 value
Message-ID: <3biiqfwwvlbkvo5tx56nmcl4rzbq5w7u3kxn5f5ctwsolxpubo@isskxigmypwz>
References: <20250210174504.work.075-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210174504.work.075-kees@kernel.org>

On Mon, Feb 10, 2025 at 09:45:05AM -0800, Kees Cook wrote:
> GCC can see that the value range for "order" is capped, but this leads
> it to consider that it might be negative, leading to a false positive
> warning (with GCC 15 with -Warray-bounds -fdiagnostics-details):
> 
> ../drivers/net/ethernet/mellanox/mlx4/alloc.c:691:47: error: array subscript -1 is below array bounds of 'long unsigned int *[2]' [-Werror=array-bounds=]
>   691 |                 i = find_first_bit(pgdir->bits[o], MLX4_DB_PER_PAGE >> o);
>       |                                    ~~~~~~~~~~~^~~
>   'mlx4_alloc_db_from_pgdir': events 1-2
>   691 |                 i = find_first_bit(pgdir->bits[o], MLX4_DB_PER_PAGE >> o);                        |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                     |                         |                                                   |                     |                         (2) out of array bounds here
>       |                     (1) when the condition is evaluated to true                             In file included from ../drivers/net/ethernet/mellanox/mlx4/mlx4.h:53,
>                  from ../drivers/net/ethernet/mellanox/mlx4/alloc.c:42:
> ../include/linux/mlx4/device.h:664:33: note: while referencing 'bits'
>   664 |         unsigned long          *bits[2];
>       |                                 ^~~~
> 
> Switch the argument to unsigned int, which removes the compiler needing
> to consider negative values.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Tariq Toukan <tariqt@nvidia.com>
> Cc: Andrew Lunn <andrew+netdev@lunn.ch>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Yishai Hadas <yishaih@nvidia.com>
> Cc: netdev@vger.kernel.org
> Cc: linux-rdma@vger.kernel.org
> ---
>  drivers/net/ethernet/mellanox/mlx4/alloc.c | 6 +++---
>  include/linux/mlx4/device.h                | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlx4/alloc.c b/drivers/net/ethernet/mellanox/mlx4/alloc.c
> index b330020dc0d6..f2bded847e61 100644
> --- a/drivers/net/ethernet/mellanox/mlx4/alloc.c
> +++ b/drivers/net/ethernet/mellanox/mlx4/alloc.c
> @@ -682,9 +682,9 @@ static struct mlx4_db_pgdir *mlx4_alloc_db_pgdir(struct device *dma_device)
>  }
>  
>  static int mlx4_alloc_db_from_pgdir(struct mlx4_db_pgdir *pgdir,
> -				    struct mlx4_db *db, int order)
> +				    struct mlx4_db *db, unsigned int order)
>  {
> -	int o;
> +	unsigned int o;
>  	int i;
>  
>  	for (o = order; o <= 1; ++o) {

  ^ Knowing now that @order can only be 0 or 1 can this for loop (and
  goto) be dropped entirely?

  The code is already short and sweet so I don't feel strongly either
  way.

> @@ -712,7 +712,7 @@ static int mlx4_alloc_db_from_pgdir(struct mlx4_db_pgdir *pgdir,
>  	return 0;
>  }
>  
> -int mlx4_db_alloc(struct mlx4_dev *dev, struct mlx4_db *db, int order)
> +int mlx4_db_alloc(struct mlx4_dev *dev, struct mlx4_db *db, unsigned int order)
>  {
>  	struct mlx4_priv *priv = mlx4_priv(dev);
>  	struct mlx4_db_pgdir *pgdir;
> diff --git a/include/linux/mlx4/device.h b/include/linux/mlx4/device.h
> index 27f42f713c89..86f0f2a25a3d 100644
> --- a/include/linux/mlx4/device.h
> +++ b/include/linux/mlx4/device.h
> @@ -1135,7 +1135,7 @@ int mlx4_write_mtt(struct mlx4_dev *dev, struct mlx4_mtt *mtt,
>  int mlx4_buf_write_mtt(struct mlx4_dev *dev, struct mlx4_mtt *mtt,
>  		       struct mlx4_buf *buf);
>  
> -int mlx4_db_alloc(struct mlx4_dev *dev, struct mlx4_db *db, int order);
> +int mlx4_db_alloc(struct mlx4_dev *dev, struct mlx4_db *db, unsigned int order);
>  void mlx4_db_free(struct mlx4_dev *dev, struct mlx4_db *db);
>  
>  int mlx4_alloc_hwq_res(struct mlx4_dev *dev, struct mlx4_hwq_resources *wqres,
> -- 
> 2.34.1
> 

Justin
