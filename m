Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB49487BF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 20:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744402712; cv=none; b=HObwtW1sDwmkOXGuZ3ep7tIV8hhj3dLjE88zFUB/ONDV/tznQ+RH338JdYktTObXoFBEJbxP+tFa3/9ek/dprcfSYTt34QYcYZ46ow/SRK8ZIv0XXKHi1ml0u2L9LXtELCBVLMx2SC8kWsgi3RXvqttq/d+f0qsMFK4t1ivBZlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744402712; c=relaxed/simple;
	bh=KGXGKs6WjUiPf5BLiw0Cl2y01NYX2kuZyspFWEsMXho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DgO0C/xmBRidwF8TG/QlbZtUwhX4ChcVrskuBoeWkgorI9rKAu1AKu9ld9LSwEtwJ/AwdYymP5heYqw8K9lXz9VJ2ThREoBj6fYCUsXA6PnTt2JbRgkvFw8GDgKYsL9UFu9qsHumzQwwpa9tGuhoJG/D+bqOjx/aKVkQI8MnJXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WunhPQTp; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WunhPQTp"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54b166fa41bso2827596e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744402709; x=1745007509; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/98QhGk6oF5yN8HKJAQvtUik5njgFHrZm0F3Omrg+2Q=;
        b=WunhPQTpJaeyUNrw+FCN6IZ/11Nzyc0v5FiBaK2TvqvC5JAfeg+fydY8hqWcGEdEne
         /iiyAb+P/5CSgs3T2OUXEiOWhkWjzgkRXI7Y8n5Yu5fYCIcvxkO3BVmo0Hb23K6X8GEb
         tPqOAuZ6JPzgM/JH+OLztVQPg+YAwbM9DQQqCgB+Hdf3CMLq+s6HiUWc5KVNjKPD1lRx
         WRhO74ShmoQ8bawgq6NjFX/pGdVoDnYUgOX2n760Olt84kfEzCcPYWd/0ve9L3JMVVIo
         4Az9fvulCeXSET/dxK5P6g+CnBZzr4PR4TmwUutfnE8/XgsbadjVBVns6sqvJXvIlmc9
         Bqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744402709; x=1745007509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/98QhGk6oF5yN8HKJAQvtUik5njgFHrZm0F3Omrg+2Q=;
        b=GyyzO0ea+L+nalWlcLBmNGUGJXfOzSRx5Xk9jjlkn2NugeaCz9t/znKw9F8VaMNzXm
         DUrtjwUhyz8UVldu14IURzDvX0qWx33TxmQf1+htzEvn2GrkmVcZTFvS2U7wLJocInfB
         /u+uAC/H9UZDgvna32PZwqIfrBPQ/Mh62EuLHslJSG4rsPeb0D/gxyt+/g9XX3ubK76e
         hJjO7280hJEozvt5qI5AwNuV0zh2pZ7bRCBlHCYB01hekFjS2nvkM7uYolnkshrPxLZA
         EjmRg+80jEBQ+Zv7gE5J3kXDlW5tkuwk5IWfTyMEjZhPeuyf7l9xJSCjrMA15NyTuxcS
         O8pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvmsZu1/94IzpBXF3bfnVTxL0C7PIrav7ZU9nmOByM3pRjiqlnhwsHmFiIJan9Lyd1OmEalQksPFC4axE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0xVelJ6S17AOjDjHeMOwQu+CsIZk2fjmW94pixmHE6I8EIV0J
	C0TOpBkx9ykEppHXuy6VP3bbYOagfW6OV29WgHw/07xUkIgqSYmZ1kAzxp2xi9Pcj8dbUYVmQ80
	zYTP646ezZPrDEsN7CJTeCsTKVeg3+DRBVJl6
X-Gm-Gg: ASbGncu1PYhrGMS1bwv/4k4u/uTeEeefpzppBtvIe6bHQaTXud9xYv9gX3Czyl0yJa2
	gW8KKnnw5ry54CKwXLExH/iBFwr6AoNfmDed+COCO9/sApx46zVMPNZ9AEo2+lLomQ94EnweMwd
	RZTryzupXWolN6RkCXEPtu
X-Google-Smtp-Source: AGHT+IFlJC821wTqP2WwR/tilXJz8qD1hUUoo5RXpB0KO2H327NvOJmwrhwlVUCIodiyfR5gb5lbP2hnRh9U7dwQ3CI=
X-Received: by 2002:a05:6512:1396:b0:54b:e70:365c with SMTP id
 2adb3069b0e04-54d4528c267mr1213283e87.1.1744402708839; Fri, 11 Apr 2025
 13:18:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411120915.3864437-1-mwalle@kernel.org> <20250411120915.3864437-2-mwalle@kernel.org>
In-Reply-To: <20250411120915.3864437-2-mwalle@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Fri, 11 Apr 2025 13:17:51 -0700
X-Gm-Features: ATxdqUGL2hPJPgzX75deLoXy9b5V60iBCtma_pWDavgIgVpilY3XEtn4wdmnbO8
Message-ID: <CAGETcx8UGF3hmDgCbUaUhEjiJtwL4ay3jHa6tedV4U0hC0ioug@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] net: ethernet: ti: am65-cpsw: set fwnode for ports
To: Michael Walle <mwalle@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 5:09=E2=80=AFAM Michael Walle <mwalle@kernel.org> w=
rote:
>
> fwnode needs to be set for a device for fw_devlink to be able to
> track/enforce its dependencies correctly. Without this, you'll see error
> messages like this when the supplier has probed and tries to make sure
> all its fwnode consumers are linked to it using device links:
>
> am65-cpsw-nuss 8000000.ethernet: Failed to create device link (0x180) wit=
h supplier ..
>
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  drivers/net/ethernet/ti/am65-cpsw-nuss.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ether=
net/ti/am65-cpsw-nuss.c
> index c9fd34787c99..af7d0f761597 100644
> --- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> +++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> @@ -2749,7 +2749,8 @@ am65_cpsw_nuss_init_port_ndev(struct am65_cpsw_comm=
on *common, u32 port_idx)
>         mutex_init(&ndev_priv->mm_lock);
>         port->qos.link_speed =3D SPEED_UNKNOWN;
>         SET_NETDEV_DEV(port->ndev, dev);
> -       port->ndev->dev.of_node =3D port->slave.port_np;
> +       device_set_node(&port->ndev->dev,
> +                       of_fwnode_handle(of_node_get(port->slave.port_np)=
));

Why are you doing of_node_get()? If that's a bug fix, can you do that
as a separate patch?

After you address that:
Reviewed-by: Saravana Kannan <saravanak@google.com>

-Saravana

>
>         eth_hw_addr_set(port->ndev, port->slave.mac_addr);
>
> --
> 2.39.5
>
