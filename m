Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89ED21B0421
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 05:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749706437; cv=none; b=H3XFKeFxqVcRwE9mYqFUryjodND4ugiuCRphfehBsx2gn4VvtqHoF6P7xLKkv/o7iX+6vwKVB2+/o3m1Xroz6M6sDdO/YMBS0yvLhVJhrYOeH96wlO/tOs1oP+3kD/NPVdtML6/XckeGaxbFv6YMc+DcZIVJq69Vnp+T0ya4Tuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749706437; c=relaxed/simple;
	bh=Esu639NQ3h0pUolsE+L62kqRdItgxrjwHM5dB+O9x3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJ9o4Ga/QXeVWjrtUDM7GbL2c8rU/pjoMxI/kU13UCe5a7iLCyvtOz+KwOFfr5Ev2uo8aya7OPgoqcHixJFn69pGk1UG/GxmOij63dn0/+GGxHghGVlnwH/nxtVNiA5e0qVWjfHTxnkeiv1zdICwEUJ6tG1/QiNJeEvd8y/NGUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vj4PqL21; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vj4PqL21"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-235ca5eba8cso99835ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749706435; x=1750311235; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MG8DHTvq/qRGMg3QrUciQGDqEK1excvKUOp84PPj3c=;
        b=Vj4PqL21xT9R0D4u2FmNnEg5IkKp4mBGq1CFhUAF0xxfGlJ2NVfbrUtwyVA2YUQCYu
         5NMSW3t7wuAGyMMlz7GqcG5yq0QJID15SPU12kSeVUS/+BVkuFpyyrLSl/+i7hAuFhXC
         +7+y2DMEB6IuaDiVdG35JzUq+h1rdeF2p5jrycd9nj0+mYUjKD0Vsa9yTpqzMhO9fe0G
         CXOE+zkRJXZ61N/fK9eLhPtvzy+MvCkv6FD3xtjnxFlQEKD6ahJmJiPJCynuR5x8jjL/
         Nlw6j/EG4f63+5ok4m5K+KJ06vof40jICqifS61QQ0IAoNxJtZcbsZpaSUcoGrfctNyo
         QUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749706435; x=1750311235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0MG8DHTvq/qRGMg3QrUciQGDqEK1excvKUOp84PPj3c=;
        b=X5y/1YpmnnGFo/mAi0scorzEOy2nIbApfgjyCHDC6iYbGfuSVXh5mhmU04NnyQn3bS
         b7rn/BlnILZeYM+nP1HzOjuNB/bdculeXbc9X96El+Hlc2PzjBS5/nN6KxOzKxigPT5M
         Mr9pYXJvx3ORvnk+AdewtBEt+v62e+0O663tD4HwCCzrJmKV8TxVjvS0R7l+6NUmOD+f
         wm2uLOD7GEeOiKxfdzjqbL1WD3t+BPFXZTikFdsxok0VUQhI4WeGsC2fDiFyfToRIAB7
         e6ARYloDkfeCxPfXIITutIKSd6a4g1ZG1mQIFW1iiKsNpuU0NRY1myCub8vC6YpS5Jv1
         pYZw==
X-Forwarded-Encrypted: i=1; AJvYcCUx5RCvkluv6cd84llu/XeOPy6dGOxYti5N1rI1aatu2mCfNho3ARIlKsShdCS+Q8lWjPKLNd/AOm/cnKw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm/RIC8NDtZCHYet2QwUp0oRAeaI/2ZK3YvGPrgcj8125Yw3QA
	urUILXWr/GlGp/O1VkL6dX/00K9TZ4vVX9dA2boqdq9Aj9/w7kkDZjQuYpI/cec1j+J8degwNnj
	VjMeHM12s0X7+D0KnDqoZ22EVys2D5Z39tJoktv3E
X-Gm-Gg: ASbGncs9ndaYKZneH7tQ8BaQbbxMPKrsbIqsaRyz27acCVljjjcgShOSSOOZpBy2BiH
	CMovHYM9Wx/zlatpNlXBcxTMLRbtOHBBeUOQl4yTCRxRzr1a5p+dNEu/IWKkowvibLwz6jV7L+w
	NmRtmW9e766zOg1aPMIYeCnppq4xHjYPQB6FNDwKu1yLfW
X-Google-Smtp-Source: AGHT+IGXAg/B6LBkZbDCWSh7HnwG3gh9i4+QKa2dl2PrE4nN9ppued4dSt9P5QJ+xN+GLNCTbDB2L7Rfw46DFAwqD5E=
X-Received: by 2002:a17:902:e545:b0:22c:3cda:df11 with SMTP id
 d9443c01a7336-2364dd812f0mr1702785ad.10.1749706434224; Wed, 11 Jun 2025
 22:33:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609145833.990793-1-mbloch@nvidia.com> <20250609145833.990793-11-mbloch@nvidia.com>
In-Reply-To: <20250609145833.990793-11-mbloch@nvidia.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 11 Jun 2025 22:33:41 -0700
X-Gm-Features: AX0GCFsYSgx73nrC-SXHzv68aZPiBHRhi1b3Qjgt6e6IXA1Ei-CkUqpGNyxM2ik
Message-ID: <CAHS8izOX8t-Xu+mseiRBvLDYmk6G+iH=tX6t4SWY2TKBau7r-Q@mail.gmail.com>
Subject: Re: [PATCH net-next v3 10/12] net/mlx5e: Implement queue mgmt ops and
 single channel swap
To: Mark Bloch <mbloch@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, saeedm@nvidia.com, gal@nvidia.com, 
	leonro@nvidia.com, tariqt@nvidia.com, Leon Romanovsky <leon@kernel.org>, 
	Simon Horman <horms@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, netdev@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	Dragos Tatulea <dtatulea@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 8:08=E2=80=AFAM Mark Bloch <mbloch@nvidia.com> wrote=
:
>
> From: Saeed Mahameed <saeedm@nvidia.com>
>
> The bulk of the work is done in mlx5e_queue_mem_alloc, where we allocate
> and create the new channel resources, similar to
> mlx5e_safe_switch_params, but here we do it for a single channel using
> existing params, sort of a clone channel.
> To swap the old channel with the new one, we deactivate and close the
> old channel then replace it with the new one, since the swap procedure
> doesn't fail in mlx5, we do it all in one place (mlx5e_queue_start).
>
> Signed-off-by: Saeed Mahameed <saeedm@nvidia.com>
> Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
> Signed-off-by: Cosmin Ratiu <cratiu@nvidia.com>
> Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
> Signed-off-by: Mark Bloch <mbloch@nvidia.com>
> ---
>  .../net/ethernet/mellanox/mlx5/core/en_main.c | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c b/drivers/=
net/ethernet/mellanox/mlx5/core/en_main.c
> index a51e204bd364..90687392545c 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
> @@ -5494,6 +5494,102 @@ static const struct netdev_stat_ops mlx5e_stat_op=
s =3D {
>         .get_base_stats      =3D mlx5e_get_base_stats,
>  };
>
> +struct mlx5_qmgmt_data {
> +       struct mlx5e_channel *c;
> +       struct mlx5e_channel_param cparam;
> +};
> +
> +static int mlx5e_queue_mem_alloc(struct net_device *dev, void *newq,
> +                                int queue_index)
> +{
> +       struct mlx5_qmgmt_data *new =3D (struct mlx5_qmgmt_data *)newq;
> +       struct mlx5e_priv *priv =3D netdev_priv(dev);
> +       struct mlx5e_channels *chs =3D &priv->channels;
> +       struct mlx5e_params params =3D chs->params;
> +       struct mlx5_core_dev *mdev;
> +       int err;
> +
> +       mutex_lock(&priv->state_lock);
> +       if (!test_bit(MLX5E_STATE_OPENED, &priv->state)) {
> +               err =3D -ENODEV;
> +               goto unlock;
> +       }
> +
> +       if (queue_index >=3D chs->num) {
> +               err =3D -ERANGE;
> +               goto unlock;
> +       }
> +
> +       if (MLX5E_GET_PFLAG(&chs->params, MLX5E_PFLAG_TX_PORT_TS) ||
> +           chs->params.ptp_rx   ||
> +           chs->params.xdp_prog ||
> +           priv->htb) {
> +               netdev_err(priv->netdev,
> +                          "Cloning channels with Port/rx PTP, XDP or HTB=
 is not supported\n");
> +               err =3D -EOPNOTSUPP;
> +               goto unlock;
> +       }
> +
> +       mdev =3D mlx5_sd_ch_ix_get_dev(priv->mdev, queue_index);
> +       err =3D mlx5e_build_channel_param(mdev, &params, &new->cparam);
> +       if (err) {
> +               return err;
> +               goto unlock;
> +       }
> +
> +       err =3D mlx5e_open_channel(priv, queue_index, &params, NULL, &new=
->c);
> +unlock:
> +       mutex_unlock(&priv->state_lock);
> +       return err;
> +}
> +
> +static void mlx5e_queue_mem_free(struct net_device *dev, void *mem)
> +{
> +       struct mlx5_qmgmt_data *data =3D (struct mlx5_qmgmt_data *)mem;
> +
> +       /* not supposed to happen since mlx5e_queue_start never fails
> +        * but this is how this should be implemented just in case
> +        */
> +       if (data->c)
> +               mlx5e_close_channel(data->c);
> +}
> +
> +static int mlx5e_queue_stop(struct net_device *dev, void *oldq, int queu=
e_index)
> +{
> +       /* mlx5e_queue_start does not fail, we stop the old queue there *=
/
> +       return 0;
> +}

Is this really better than maintaining uniformity of behavior between
the drivers that support the queue mgmt api and just doing the
mlx5e_deactivate_priv_channels and mlx5e_close_channel in the stop
like core sorta expects?

We currently use the ndos to restart a queue, but I'm imagining in the
future we can expand it to create queues on behalf of the queues. The
stop queue API may be reused in other contexts, like maybe to kill a
dynamically created devmem queue or something, and this specific
driver may stop working because stop actually doesn't do anything?

--=20
Thanks,
Mina
