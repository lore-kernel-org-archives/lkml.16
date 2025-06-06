Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B6E1A5BA9;
	Fri,  6 Jun 2025 09:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749201445; cv=none; b=VOJHqOOFBsiFEJIwnML0fl1hTXT7U6EtNR4s5Q04/fPLIDsx9M5C7Xrqu3YV7d7BDGQTYjy3o93xns0HUaeu1odLWNjpbNsdetMB3LC1DGYyL2PYs9U9ML6N+GXGjtA92uTwrzi8+x6rPWufzAHfHeYWPd58MoBZvdvRKm0+9+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749201445; c=relaxed/simple;
	bh=7cXe2RVI5l+VbEwv6pMU5n7vOdXDTkLOGpmb/XnSvNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=npy7FhpRl2v9VovDrshx2f2JZZbeCPFKKs1OGM7rldhc87i8GgTGWm8R6D3/YEvBDw+0NOpcLwN9jWcC3+Is93BDqJL9/qTCSQl8r3VkKqLxqUU1g/59W5vhlnPCoSRlxPRCRrlShCRtlVa9hjkvcFkqgvQT3wXkNq3K2eDRv/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kxKiavON; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kxKiavON"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30624C4CEEF;
	Fri,  6 Jun 2025 09:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749201444;
	bh=7cXe2RVI5l+VbEwv6pMU5n7vOdXDTkLOGpmb/XnSvNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kxKiavONcB/WIysSRDIfdLKgglvY/RwSo+s6CJdrbUK/bbk/oaklsT/mEShmR63Ae
	 jypwSf89L/DocrigEErSG9RCm4iyKzMIkOTcOjn9VmxBNHkxzslE7KcC19neaLEDdA
	 vHrsTPq99j/8SeVfbJvCsLUvZ3+qkX0VDPR8uX0SgG74efyJ8yd9m9cPGUO8lxc/sP
	 Bk8EX8+GDKhD8oenxrw8o2niISgQWdbijq71omz9zcuzIj96c8wlZRjhEVFpK/exjb
	 vvmkO9X0wZNSZVMr77t3xA5CwDXPdyabkPu5f78subnYeOjV7kl4Ob6NiRkbgb1/jf
	 fp6j7jonntr1A==
Date: Fri, 6 Jun 2025 11:17:21 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Alberto Ruiz <aruiz@redhat.com>
Subject: Re: [PATCH v2 01/10] clk: add kernel docs for struct clk_core
Message-ID: <20250606-fuzzy-hasty-deer-fdcee0@houat>
References: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
 <20250528-clk-wip-v2-v2-1-0d2c2f220442@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="nqgulkyw2ns3u2wn"
Content-Disposition: inline
In-Reply-To: <20250528-clk-wip-v2-v2-1-0d2c2f220442@redhat.com>


--nqgulkyw2ns3u2wn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 01/10] clk: add kernel docs for struct clk_core
MIME-Version: 1.0

On Wed, May 28, 2025 at 07:16:47PM -0400, Brian Masney wrote:
> Document all of the members of struct clk_core.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/clk.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 0565c87656cf5c557d8259c71b5d2971a7ac87e8..a130eac9072dc7e71f840a0ed=
f51c368650f8386 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -57,6 +57,48 @@ struct clk_parent_map {
>  	int			index;
>  };
> =20
> +/**
> + * struct clk_core - This structure represents the internal state of a c=
lk
> + * within the kernel's clock tree. Drivers do not interact with this str=
ucture
> + * directly. The clk_core is manipulated by the framework to manage clock
> + * operations, parent/child relationships, rate, and other properties.
> + *
> + * @name:              Unique name of the clk for identification.
> + * @ops:               Pointer to hardware-specific operations for this =
clk.
> + * @hw:                Pointer for traversing from a struct clk to its
> + *                     corresponding hardware-specific structure.
> + * @owner:             Kernel module owning this clk (for reference coun=
ting).
> + * @dev:               Device associated with this clk (optional)
> + * @rpm_node:          Node for runtime power management list management.
> + * @of_node:           Device tree node associated with this clk (if app=
licable)
> + * @parent:            Pointer to the current parent in the clock tree.
> + * @parents:           Array of possible parents (for muxes/selectable p=
arents).
> + * @num_parents:       Number of possible parents
> + * @new_parent_index:  Index of the new parent during parent change.
> + * @rate:              Current clock rate (Hz).

I think we should define what current means here. clk_core->rate is
effectively a cached value of what the hardware has been programmed with.

It's initialized by reading the value at boot time, and will be updated
every time an operation affecting the rate will be performed.

Clocks the CLK_GET_RATE_NOCACHE flag however should not use this value,
as its rate is expected to change behind the kernel's back (because the
firmware might change it, for example).

Also, if the clock is orphan, it's set to 0 and updated when (and if)
its parent is later loaded, so its content is only ever valid if
clk_core->orphan is false.

> + * @req_rate:          Requested clock rate (Hz).

and clk_core->req_rate is the last rate requested by a call to
clk_set_rate. It's initialized to clk_core->rate. It's also updated to
clk_core->rate every time the clock is reparented, and when we're doing
the orphan -> !orphan transition.

> + * @new_rate:          New rate to be set during a rate change operation.
> + * @new_parent:        Pointer to new parent during parent change.
> + * @new_child:         Pointer to new child during reparenting.
> + * @flags:             Clock property and capability flags.
> + * @orphan:            True if this clk is currently orphaned.
> + * @rpm_enabled:       True if runtime power management is enabled for t=
his clk.
> + * @enable_count:      Reference count of enables.
> + * @prepare_count:     Reference count of prepares.
> + * @protect_count:     Protection reference count against disable.
> + * @min_rate:          Minimum supported clock rate (Hz).
> + * @max_rate:          Maximum supported clock rate (Hz).
> + * @accuracy:          Accuracy of the clock rate (Hz).

The unit is parts per billion

> + * @phase:             Current phase (degrees or hardware-specific units=
).

It's degrees, not hardware specific units.

Maxime

--nqgulkyw2ns3u2wn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaEKyIQAKCRAnX84Zoj2+
dkyfAYDSVOdlnZmKx2FqnpDkMSE9pm85fEZTb7iWlHewL2hOdF7wOkEGZw5k3Akg
Xa3G7qMBeQFn5bn+m06N2XT535qmFpoVRzdZIwm8h+7Rvat2YrBvD3CE7wMoq2Zr
MYcipCUb6w==
=AOV5
-----END PGP SIGNATURE-----

--nqgulkyw2ns3u2wn--
