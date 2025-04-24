Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591A712CDA5
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745503760; cv=none; b=ZjVu2UHEWh+181b+qg0KkN/ZyhpLYn9sJ1DzNXCaB3WjZW98ZpA4UtRmn1GxzLBHep71P02yrR5jhHypPl5wHBYMaKB3MZDuly2kGKGbdE2CVoSNOdy8w05ss1EfNMO2HmRnWon1Mv5Z8nOt8W72/erCBrYLW87sURih8iDEOM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745503760; c=relaxed/simple;
	bh=yDTnnz4mZAhWt4ghQ1eNEyDtLqai6bbFD9Kd9sfD/UA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SRbr70+oivIgZxMY1gSa64jGhqRPTrTHgKWHXM2ZqoN2ci2v/D5rwTlVKvbN10UrsvIpITr+yAM6P9vzST999wFlGMGAnXr0DmrpZ0+an9BntWnvFTawZUfMDYkKB4OdLcvjWvCpaesMnHRo818kumR3NUIr3eLUu34z1y3etS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FzzDFv6A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FzzDFv6A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47A9EC4CEE3;
	Thu, 24 Apr 2025 14:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745503759;
	bh=yDTnnz4mZAhWt4ghQ1eNEyDtLqai6bbFD9Kd9sfD/UA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FzzDFv6APkZ8IHOkmlbtQXrPU45ZFbuqiUhGCDx5wxGJeJ8KkqlOFetf6rWVehxUU
	 BPMjdYcVkd7jvFMX5U386OORWpIC5WVZnjMDoDiQ5WDBEKVVmJgCIokQSi5dRykfWM
	 LKEvtAJAVy2V6+QlbqFK+utIQpOxwNfm4E2Ox75tqxjxJTxomQ50EG4hebgFYMqpNZ
	 iZrkXgvdGJZ+yVLcVIvU6HRSG2jG862WSDZJN/CRKz8d7bxbD61z6daa+CGMv2BVUT
	 Y34JyKKpGCady3GZhDpwVnu7k4zjnxgdL4+e0t6ZfwsCNgAxN+ixcNQ7gi0XphWy26
	 /pzBM6LyrU/0g==
Date: Thu, 24 Apr 2025 15:09:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com, 13564923607@139.com,
	13916275206@139.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, baojun.xu@ti.com, Baojun.Xu@fpt.com,
	robinchen@ti.com
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Remove tas2781_spi_fwlib.c and
 leverage SND_SOC_TAS2781_FMWLIB
Message-ID: <42e68c8b-aa74-4033-b19e-6fa0eb3533bf@sirena.org.uk>
References: <20250424133814.216-1-shenghao-ding@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pNYgd+/25B6fRw++"
Content-Disposition: inline
In-Reply-To: <20250424133814.216-1-shenghao-ding@ti.com>
X-Cookie: Star Trek Lives!


--pNYgd+/25B6fRw++
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 24, 2025 at 09:38:14PM +0800, Shenghao Ding wrote:
> Most codes in tas2781_spi_fwlib.c are same as tas2781-fmwlib.c, mainly for
> firmware parsing, only differece is the register reading, bit update and
> book switching in i2c and spi. The main purpose of this patch is for code
> cleaup and arrange the shared part for i2c and spi.

Acked-by: Mark Brown <broonie@kernel.org>

--pNYgd+/25B6fRw++
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgKRggACgkQJNaLcl1U
h9Bbogf+LYCtvy6ximPFS1xSVeUvrvhxnH9qEFgmhqfrdNxY/DBlHiZGW5zF/Ffg
Q9TGc8InO8E4RnbB/kxYpQBbojRTcD9VLNw3/hcRjaECoz7Zkf2SflnzBekYR6sk
cLdBypt1LhRObYlsGnZaWnWY1brqeHtRSgZulsSXPXyu9wlajedYn8v/QBWNdY0w
Zzy2YFvOGDEny5uHK72rL7Bf4/9YCZJTjmzjm8kyo3zcL3AuB38DB5TzvRuO7d7K
pHmKgRVGVNGgp7mK6bnBKxIpEHnJMjkYhquUeJuI6TbTpZUtAfa1ffDniSaF39w+
rwhPNKlZx8zUClYLQE5gjox2KrJFXw==
=bXDW
-----END PGP SIGNATURE-----

--pNYgd+/25B6fRw++--
