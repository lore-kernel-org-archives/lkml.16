Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCEF38B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 05:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749705395; cv=none; b=O4r16vsmfhM1fnezF4nqU+zYLNna7uzBt+Svy45nvvEv3UGjsbrx5UiXkyD/Sjw7SvIA+5vmzfopdSzfcwOMQk6BFohd1dAoi0/lPAP2KX/q+6e4gvdmqLpNMc6+r81qeH/68hVWF8sPSyK4O5j9TCAfqWwwur7cTLD9vnZd91g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749705395; c=relaxed/simple;
	bh=GYwJDBqm5ype1Fn87+cuFdQQ7WJUMfaovIJl6GLLetg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gKzFASI068mjw8pEvxkWautuIthCkLPJTZGF+/XFjHDFixuOoxwUHRvh4H7NVbbANsBReCDp+eqk44ByzhMn+hoy+2BHi0iayW4HlD8xtjY/rNx+R/+U/7pA4C75J1wJ829cCrpMqEXxGxAxgDYyRoUMx7Q51B3CHMoyCJo1bw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sDHB2qpn; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sDHB2qpn"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235e389599fso125335ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749705393; x=1750310193; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6diRbRZRukPlWo9M8OnwMyyu0ZftkgUDqdamePSBwg=;
        b=sDHB2qpnwXvcOKxsQtQo/Q4WJS5QK/HrPfBdYCgUz3W9Eb04KykuWqhl8HcDa/Ui90
         axXTHe8gHVxfSpsaif29YE6UFLQLgPSZjo3pZQsiipao9Hc+MgySlvYCGRbA6n/daot1
         0i2dHxn3azMLq5dqxMEHnTkWa5nErRAYU/4E7rbAZTXIDpbg9B5mQP/f8LoP3rrU2Pzu
         5WPIERiQUhvpR7KlmSo08l3oU+d+H0MhdgcFmy2J5JzkIi8SjDUWmh/hu0QTjgEJsdzm
         HIjOux2C1tnk7asVgoLvImgThko8L5Kqu5XFZFK5F8iV0LBxsCpIEOw2i+MrMYp2UKrh
         0CqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749705393; x=1750310193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6diRbRZRukPlWo9M8OnwMyyu0ZftkgUDqdamePSBwg=;
        b=IPy+TfkaUUxxTKrVCxuxU8KvkRT0/mkO/nCUVij+AuNJ4MU8YXEs9S2ohZtonVqdpm
         GITqZRvc3oNpGvsZoeJtkjT+CLPUrKzHL6XsJcyl5tledapLYKEdetX2sPAGflfrRlRR
         VkDrvoEUTWBvJIncIqWLjeJbqbh1qyhaKrKbBIrl58OYv/o6jBHJeQUaTcBo3oBFhbCb
         ioMSsZ0sQLqUqC9E9nGfzPQWKg+FF+uPkQpi90uM2c4oOEAnJeyZ2byYf/VZbXoWs/0e
         hz/TwQu8rgyhBy0fiDq1iagbVR+4YET/6pu/vQ9t4BfIhhZEWQrLqrcG8x57A+9T+3ud
         07yg==
X-Forwarded-Encrypted: i=1; AJvYcCV9DLoKi86eGRaPuKsJeenNVocYkglyC9eHBo697kWXwDSnOAsCumOniwETKiS7NWMdse55ejOVlDiUZhk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDXlVxhgSMx0cJlozYqSFCjc93WSGlybsJXHQWIkkzJm4XvNTP
	P38vJBrEe2KEJZdlKfYnOkmoSHayjLcKEKDOu5oqq3Zx60otDTz96jQG9tu70yJVZAg/n0lXSiE
	iu+w2WtE/sFHZ9sYAi89UnnFFIUIwSAEvybxD5NE6
X-Gm-Gg: ASbGnculTgaKyGxsKdX8R9XgTMu2AWrdywUHbJoo9aFnt8nBDcJXr0by15KEyVsoHh8
	Eht0/akRlMWoWp91lcMHfO6Ney0Zt9yT8mEzPbmjKQ0rQ6gONUakikIOM3l/HTYSTKgGp6wljje
	xkojIewDFcNrN1uAbX9GTZvc6DYCtx34k+g57X3RbUnnEu
X-Google-Smtp-Source: AGHT+IFsS2B5lC69yG+ZIzDjoB42cEDFFoUNubkkslLP3SlQB8j7he9Gt0R5igTKHstKDOVSt4yEWMRv9eqcqO1H2bY=
X-Received: by 2002:a17:902:d4cf:b0:235:e1e4:efc4 with SMTP id
 d9443c01a7336-2364dc69fc5mr1822195ad.14.1749705392972; Wed, 11 Jun 2025
 22:16:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610150950.1094376-1-mbloch@nvidia.com> <20250610150950.1094376-9-mbloch@nvidia.com>
In-Reply-To: <20250610150950.1094376-9-mbloch@nvidia.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 11 Jun 2025 22:16:18 -0700
X-Gm-Features: AX0GCFtSea24S64oBWfvhRVn2iiOFXlEz1l-q8Ml6dx4ayAJvrSCDhs5kdtjaHM
Message-ID: <CAHS8izOEn+C5QexSPZT3_ekUr2zR1dm9R6OsoGBPaqg5MFvBRQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 08/11] net/mlx5e: Add support for UNREADABLE
 netmem page pools
To: Mark Bloch <mbloch@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, saeedm@nvidia.com, gal@nvidia.com, 
	leonro@nvidia.com, tariqt@nvidia.com, Leon Romanovsky <leon@kernel.org>, 
	netdev@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dragos Tatulea <dtatulea@nvidia.com>, 
	Cosmin Ratiu <cratiu@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 8:20=E2=80=AFAM Mark Bloch <mbloch@nvidia.com> wrot=
e:
>
> From: Saeed Mahameed <saeedm@nvidia.com>
>
> On netdev_rx_queue_restart, a special type of page pool maybe expected.
>
> In this patch declare support for UNREADABLE netmem iov pages in the
> pool params only when header data split shampo RQ mode is enabled, also
> set the queue index in the page pool params struct.
>
> Shampo mode requirement: Without header split rx needs to peek at the dat=
a,
> we can't do UNREADABLE_NETMEM.
>
> The patch also enables the use of a separate page pool for headers when
> a memory provider is installed for the queue, otherwise the same common
> page pool continues to be used.
>
> Signed-off-by: Saeed Mahameed <saeedm@nvidia.com>
> Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
> Signed-off-by: Cosmin Ratiu <cratiu@nvidia.com>
> Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
> Signed-off-by: Mark Bloch <mbloch@nvidia.com>
> ---
>  drivers/net/ethernet/mellanox/mlx5/core/en_main.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c b/drivers/=
net/ethernet/mellanox/mlx5/core/en_main.c
> index 5e649705e35f..a51e204bd364 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
> @@ -749,7 +749,9 @@ static void mlx5e_rq_shampo_hd_info_free(struct mlx5e=
_rq *rq)
>
>  static bool mlx5_rq_needs_separate_hd_pool(struct mlx5e_rq *rq)
>  {
> -       return false;
> +       struct netdev_rx_queue *rxq =3D __netif_get_rx_queue(rq->netdev, =
rq->ix);
> +
> +       return !!rxq->mp_params.mp_ops;

This is kinda assuming that all future memory providers will return
unreadable memory, which is not a restriction I have in mind... in
theory there is nothing wrong with memory providers that feed readable
pages. Technically the right thing to do here is to define a new
helper page_pool_is_readable() and have the mp report to the pp if
it's all readable or not.

But all this sounds like a huge hassle for an unnecessary amount of
future proofing, so I guess this is fine.

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
