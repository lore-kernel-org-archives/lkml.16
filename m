Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BEE5383
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 00:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751675852; cv=none; b=Br5NQcIjzEac29fKJF4CzUSGMb7G9/mZ10Em+gddgzZ4GZRRl32uHNw43GpIp/WMFnzqV4c7ECxugeUI0bIeJrhkloh/mhIRQ9C0+FXv5s7RKaQmYVFAXEqTspDH4/t970zHWg2Y5cIceOB6qPkB+G0rM3lyVOSFDQRlxPxHt2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751675852; c=relaxed/simple;
	bh=Qh50Am3z7Fy5ih+1NGDOYCZS+qYgGxgj5B9kUHNx824=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sEJNKC9FySO2C4JN7/qaq1tFwtEQ0Vx813MVNFJsIJiUhm1/xTS1WKhK12frbo5vlhf/5Km3+UO0OJtrmKY4UjBG3RfWj1Z6TfshCAw+JNTrsVHqLm7hWqdcNfmEk9ekMC2Z5wFD0ScbmS+ZkQ2OJJAWbJRH30+nI0XOczfS2OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vCBqWGFy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vCBqWGFy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB679C4CEE3;
	Sat,  5 Jul 2025 00:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751675852;
	bh=Qh50Am3z7Fy5ih+1NGDOYCZS+qYgGxgj5B9kUHNx824=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vCBqWGFyomiMYnHrBUiLOXsX4QwbpiarcY1jXoXYPskI29J+N2tByRL46yqzrgNn0
	 hXVtx1PI//c0u3b2NG52rlQdCmnAMeDo6YIbjpsx6EO/YsQMhuxN8bx9uUjKxHGlHU
	 eaMClLp6kdkf1TwoTQfPwu34jG/OUC+Nn//31TUEKphtL0Qa/MrcBCastEyHaF+C2H
	 boB5a7kBIbMXgEyHNU4MgUY6mYzgXLG+LE7X/RioDadr3DNhLq4ionXhdhfJGT+OZR
	 ldpreW5hAO7fHZ6W9n8+m6HwySIUAS1dcVtxMvN8OFMhsEO8IyyFtNgX9TJFYrkWVy
	 NNlZTFz91sxYQ==
Received: by venus (Postfix, from userid 1000)
	id E7DD01803D0; Sat, 05 Jul 2025 02:37:29 +0200 (CEST)
Date: Sat, 5 Jul 2025 02:37:29 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 21/80] HSI: omap_ssi_port: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <uefirfqd4ymbuq52fpwshr4tws7mex3ur7qhsbg5ymlqbhpviq@6na42kykoqwp>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075413.3218357-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dixzo6yott5xmc27"
Content-Disposition: inline
In-Reply-To: <20250704075413.3218357-1-sakari.ailus@linux.intel.com>


--dixzo6yott5xmc27
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 21/80] HSI: omap_ssi_port: Remove redundant
 pm_runtime_mark_last_busy() calls
MIME-Version: 1.0

Hi,

On Fri, Jul 04, 2025 at 10:54:13AM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Acked-by: Sebastian Reichel <sre@kernel.org>

-- Sebastian

> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ail=
us@linux.intel.com>.
>=20
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
>=20
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
 \
>                 pm-runtime-6.17-rc1
>=20
>  drivers/hsi/controllers/omap_ssi_port.c | 11 -----------
>  1 file changed, 11 deletions(-)
>=20
> diff --git a/drivers/hsi/controllers/omap_ssi_port.c b/drivers/hsi/contro=
llers/omap_ssi_port.c
> index aeb92b803a17..50dde968febe 100644
> --- a/drivers/hsi/controllers/omap_ssi_port.c
> +++ b/drivers/hsi/controllers/omap_ssi_port.c
> @@ -362,7 +362,6 @@ static int ssi_async_break(struct hsi_msg *msg)
>  		spin_unlock_bh(&omap_port->lock);
>  	}
>  out:
> -	pm_runtime_mark_last_busy(omap_port->pdev);
>  	pm_runtime_put_autosuspend(omap_port->pdev);
> =20
>  	return err;
> @@ -401,7 +400,6 @@ static int ssi_async(struct hsi_msg *msg)
>  		msg->status =3D HSI_STATUS_ERROR;
>  	}
>  	spin_unlock_bh(&omap_port->lock);
> -	pm_runtime_mark_last_busy(omap_port->pdev);
>  	pm_runtime_put_autosuspend(omap_port->pdev);
>  	dev_dbg(&port->device, "msg status %d ttype %d ch %d\n",
>  				msg->status, msg->ttype, msg->channel);
> @@ -504,7 +502,6 @@ static int ssi_setup(struct hsi_client *cl)
>  	omap_port->ssr.mode =3D cl->rx_cfg.mode;
>  out:
>  	spin_unlock_bh(&omap_port->lock);
> -	pm_runtime_mark_last_busy(omap_port->pdev);
>  	pm_runtime_put_autosuspend(omap_port->pdev);
> =20
>  	return err;
> @@ -570,7 +567,6 @@ static int ssi_flush(struct hsi_client *cl)
>  	pinctrl_pm_select_default_state(omap_port->pdev);
> =20
>  	spin_unlock_bh(&omap_port->lock);
> -	pm_runtime_mark_last_busy(omap_port->pdev);
>  	pm_runtime_put_autosuspend(omap_port->pdev);
> =20
>  	return 0;
> @@ -625,7 +621,6 @@ static int ssi_stop_tx(struct hsi_client *cl)
>  	writel(SSI_WAKE(0), omap_ssi->sys + SSI_CLEAR_WAKE_REG(port->num));
>  	spin_unlock_bh(&omap_port->wk_lock);
> =20
> -	pm_runtime_mark_last_busy(omap_port->pdev);
>  	pm_runtime_put_autosuspend(omap_port->pdev); /* Release clocks */
> =20
> =20
> @@ -653,7 +648,6 @@ static void ssi_transfer(struct omap_ssi_port *omap_p=
ort,
>  		}
>  	}
>  	spin_unlock_bh(&omap_port->lock);
> -	pm_runtime_mark_last_busy(omap_port->pdev);
>  	pm_runtime_put_autosuspend(omap_port->pdev);
>  }
> =20
> @@ -683,7 +677,6 @@ static void ssi_cleanup_queues(struct hsi_client *cl)
>  			txbufstate |=3D (1 << i);
>  			status |=3D SSI_DATAACCEPT(i);
>  			/* Release the clocks writes, also GDD ones */
> -			pm_runtime_mark_last_busy(omap_port->pdev);
>  			pm_runtime_put_autosuspend(omap_port->pdev);
>  		}
>  		ssi_flush_queue(&omap_port->txqueue[i], cl);
> @@ -739,7 +732,6 @@ static void ssi_cleanup_gdd(struct hsi_controller *ss=
i, struct hsi_client *cl)
>  		 * ssi_cleanup_queues
>  		 */
>  		if (msg->ttype =3D=3D HSI_MSG_READ) {
> -			pm_runtime_mark_last_busy(omap_port->pdev);
>  			pm_runtime_put_autosuspend(omap_port->pdev);
>  		}
>  		omap_ssi->gdd_trn[i].msg =3D NULL;
> @@ -936,7 +928,6 @@ static void ssi_pio_complete(struct hsi_port *port, s=
truct list_head *queue)
>  	reg =3D readl(omap_ssi->sys + SSI_MPU_ENABLE_REG(port->num, 0));
>  	if (msg->ttype =3D=3D HSI_MSG_WRITE) {
>  		/* Release clocks for write transfer */
> -		pm_runtime_mark_last_busy(omap_port->pdev);
>  		pm_runtime_put_autosuspend(omap_port->pdev);
>  	}
>  	reg &=3D ~val;
> @@ -981,7 +972,6 @@ static irqreturn_t ssi_pio_thread(int irq, void *ssi_=
port)
>  		/* TODO: sleep if we retry? */
>  	} while (status_reg);
> =20
> -	pm_runtime_mark_last_busy(omap_port->pdev);
>  	pm_runtime_put_autosuspend(omap_port->pdev);
> =20
>  	return IRQ_HANDLED;
> @@ -1018,7 +1008,6 @@ static irqreturn_t ssi_wake_thread(int irq __maybe_=
unused, void *ssi_port)
>  		}
>  		hsi_event(port, HSI_EVENT_STOP_RX);
>  		if (test_and_clear_bit(SSI_WAKE_EN, &omap_port->flags)) {
> -			pm_runtime_mark_last_busy(omap_port->pdev);
>  			pm_runtime_put_autosuspend(omap_port->pdev);
>  		}
>  	}
> --=20
> 2.39.5
>=20

--dixzo6yott5xmc27
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmhoc8YACgkQ2O7X88g7
+polxQ//Q8WLEDeB32Axcr9J8CaE5X4DNGM1lXmG9SESD2xlLyEV8Q+8J7eMnDr5
yr69jt1XGCXl0Y62peTJ3bgdFGbTFkg/yq34D2CevBaNF8pREiTtJ/gsOQjhypEL
/Fqwcj09f9P/XTJmxnMGCF0dTpau0PmDSbyRnASYD8mYLeilcaR/oo8sP66r7AO5
po7TvV53PeUe0j/uYTPyFM6Z9ESB2Oq8KfVpmdu/i4QyCi6+hmS9vq2XA1foX0B+
ezM/OUElW7PnaKVJDe62S9RlHya8cmTkIPYmM3gceg9cFHuk0FItA2L1tw70a/Sh
kSmTprHGBuAkuqeHgTScwDhf8iBS+WMDRqQoD/cYcRzGm0QIdSD37DcWmqryzXf4
awkcTokqe87E9jV0wxNCxShHU++IuSterdZk7K60aMf3nBXC/3xM1rWWUhn4GJg4
1L0i/vTy7azOn5W5oqPNLI3QTqotTp2ilW+GwXUO/pM+JFMA0w/dqkv48MQgEHLg
yMGg4Q3uwfjSJCEFNXGrLbgLoRMw/mxZCbfu3NTEm540k1hPnzAh7e+RV0GenNOr
BqGjSguDzteG8HzhAChABY0sX1+sbF8xLpW3Gqa3EH7X8cDqUKazohoR73y93UKt
1qNntKtyUMln7iKR01Q3O2iTzt9+EqvTRaZDLaO7SssOwLj6z3Y=
=9O8J
-----END PGP SIGNATURE-----

--dixzo6yott5xmc27--
