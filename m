Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C0A1A3157
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 17:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739036593; cv=pass; b=ni+IH8gaCYv69XD2OYRedJpdNzzNOobfx04/gLK5Hwf9XVgKwdcqNtYi25y5RTEqdZgd87Iy9IdCyFQKJCYQLCpFAO0kD35q3vEggqIxlz07PUQ6xsNuuPMzhguez8jUB/TO60Qwj+93NB5hBpP7/sYbbnTITTWDeYDhKXu65Lc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739036593; c=relaxed/simple;
	bh=9MYp5BUYxq0ISR4Xea1pggt4JGuFSs5awA+c8pVM5dU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EX74k3Nogs6M98Z8jaOzHeiXnvBuStmusD3Ilh0TJ4DSiJnqQ8I/UABjSSUz/Ues5B3B2/dTCS68+VFz+K2LkIiwKi+UFJBgFz65BnGXevTt9PqKL69KbRu3swEYhHVyl6exIm6ACzykGLMzRSmLNuX4XuEEemHiNVKjH5wGIpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=fTSwT5An; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="fTSwT5An"
ARC-Seal: i=1; a=rsa-sha256; t=1739036582; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jsXNGSQAsL+Edk2t8eFsz5zIA7HlZ/UcZUpcuG6RPQtSK4vD5+ktqZhi26t19yUTUmpBjZ0UWEie/6TScAZUcHV33rPAIrrSkpDdjLHTb2f0gJgayjdwqDYm9zoOmcktsqanNk77+iwkO57N/Nrsm4JG9ujS2nci6uQH7nHfI5s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739036582; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TNdnl6Cdiaml5A95lkf3NMAl703qlII+7odYtOOGq/M=; 
	b=S8AfqWLx+8MQSQzgLcqbqHTtCdy+/n7PXEUlG80fK+1PrsrPhkHQLJqCqjDEd0metFLZ6wkb67/QDYqUia67dgyjpsmDgJ991iHlKChMWUUsDbcNggfAh2Pd4+JkEvBxDkujHxMRre0bHErBb7IXw2IsdSS6L8gDwnwfe2K78XU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739036582;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=TNdnl6Cdiaml5A95lkf3NMAl703qlII+7odYtOOGq/M=;
	b=fTSwT5AnMPrX1ui+WTqEjDeqyV9o1U7hn6AulwXJMonJRJxUe3h+ygztMD/nc3vK
	Oez/MrP4y1DsRlhuELV2D515OK6WJU3eRxVge4kb1EslcJmd8rP/kGz6Utzgwp+cAmD
	L+j+jmCyZ+7Gh+u/ovSX2+Q5a4p46Zk2dbdAiD0I=
Received: by mx.zohomail.com with SMTPS id 1739036580715588.0240874019024;
	Sat, 8 Feb 2025 09:43:00 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 17525180616; Sat, 08 Feb 2025 18:42:58 +0100 (CET)
Date: Sat, 8 Feb 2025 18:42:58 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-kernel@vger.kernel.org, Zack Rusin <zack.rusin@broadcom.com>
Subject: Re: [PATCH v2 18/45] power: reset: ltc2952-poweroff: Switch to use
 hrtimer_setup()
Message-ID: <xie3jilnzhdgawwchqjubonjhulrgv3rcn23dhszzw2l6c5qij@vzczvm5aefgo>
References: <cover.1738746904.git.namcao@linutronix.de>
 <75ef5206f52f194b9c51653628cd2d0b083a482f.1738746904.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dovomicga24ceies"
Content-Disposition: inline
In-Reply-To: <75ef5206f52f194b9c51653628cd2d0b083a482f.1738746904.git.namcao@linutronix.de>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.1/238.993.57
X-ZohoMailClient: External


--dovomicga24ceies
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 18/45] power: reset: ltc2952-poweroff: Switch to use
 hrtimer_setup()
MIME-Version: 1.0

Hi,

On Wed, Feb 05, 2025 at 11:46:06AM +0100, Nam Cao wrote:
> hrtimer_setup() takes the callback function pointer as argument and
> initializes the timer completely.
>=20
> Replace hrtimer_init() and the open coded initialization of
> hrtimer::function with the new setup mechanism.
>=20
> Patch was created by using Coccinelle.
>=20
> Acked-by: Zack Rusin <zack.rusin@broadcom.com>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

> ---
>  drivers/power/reset/ltc2952-poweroff.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/power/reset/ltc2952-poweroff.c b/drivers/power/reset=
/ltc2952-poweroff.c
> index 1a6fc8d38e20..90c664d344d0 100644
> --- a/drivers/power/reset/ltc2952-poweroff.c
> +++ b/drivers/power/reset/ltc2952-poweroff.c
> @@ -162,11 +162,11 @@ static void ltc2952_poweroff_default(struct ltc2952=
_poweroff *data)
>  	data->wde_interval =3D 300L * NSEC_PER_MSEC;
>  	data->trigger_delay =3D ktime_set(2, 500L * NSEC_PER_MSEC);
> =20
> -	hrtimer_init(&data->timer_trigger, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> -	data->timer_trigger.function =3D ltc2952_poweroff_timer_trigger;
> +	hrtimer_setup(&data->timer_trigger, ltc2952_poweroff_timer_trigger, CLO=
CK_MONOTONIC,
> +		      HRTIMER_MODE_REL);
> =20
> -	hrtimer_init(&data->timer_wde, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> -	data->timer_wde.function =3D ltc2952_poweroff_timer_wde;
> +	hrtimer_setup(&data->timer_wde, ltc2952_poweroff_timer_wde, CLOCK_MONOT=
ONIC,
> +		      HRTIMER_MODE_REL);
>  }
> =20
>  static int ltc2952_poweroff_init(struct platform_device *pdev)
> --=20
> 2.39.5
>=20

--dovomicga24ceies
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmenl6EACgkQ2O7X88g7
+prxLA/8DEgeqR7Ouo1bUQDlGX3G5o3/3eVD3A1tX99hsDnpD7oc+yLFC4nEcydm
14clZSow1Wb578ReXgQdrqtdytbzvGNRoAT44MlRjKjzQU5UosnUNNo+qtC1iO+I
J8oQYA3dxQKceNxv7IlJM/qP4BvEQnB9Z5PDI/mJ4Ki/3smHQhgIshJnOCCQK9KI
60qWOzf6ePwJ2s6AOisUFY20P8T6ZynPlqPoNEO0p6gni8UEywxp03s3GPLNVdY4
E/gSzthznm4cR6qNJI28YW3Bw1tcJxE0l92wZX1oWvwMHdi6atvvkZyS2o4Rcgg9
Wnt2SnAa/BXeZOFNdinKvpdrE91Lkc9Fo7f+QKlUU3ki1+SGMg9XhHxOqlM9v6j1
4OdZLJn0rjhyZwmxTsdO5z+mrDSisfJ6qW4+eqlWYZT3h+2jW7bu4UlBcvm7y0RS
aBUZHfoYoApyKzabqCJEJcLM2kPF/ht3i0OMyVZfRUwxDb4g9OB6IonfNcSTZiKF
p0DbZM+8Gc6V8/JPIpUeqLkUirv+EPFTzJ3p71L7OkN1MgrolSKyhRW+K7+kL1JG
tuSS/SbYuJSJyp0mw8g5iH0F9C7aguyJtpucVJnXT5/pHIlei1Yg6NR5zmB5qj4R
TwOvx8Jnb7Hh4KynGSIMjtJ0sizT8I2KtOmAIZce82tHU/9SSyE=
=h2TO
-----END PGP SIGNATURE-----

--dovomicga24ceies--
