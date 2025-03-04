Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8307620409B
	for <linux-kernel@vger.kernel.org>; Tue,  4 Mar 2025 13:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741094598; cv=none; b=fV2KxYkLG4Cd8GTiZDMwmgzt+XjbSabfNGt/40riZE0I8wGngG3hHZrIb9TuOXk39Pfnh9rRfIpC7uKwE9/0t+LclXFmF6CbfdLByh5AXCPkZechxbpxjp2sMNxVAtpcVezOx3YWviwQ7sbFT+lfiisrdCN9byxanLa0QMpy1K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741094598; c=relaxed/simple;
	bh=9H+d9RsQIWL/It3cH/EQAmTVSxNvClFoGhn10q5wbtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=boIUfnP2nNfrX/ofj9U1SFa4ORCQ8DKAqy9EiDRsINPYxIFGLAPc5QpiUeSr5daFqqKWBG07ay6HroDLlfeNwVwnzukc4xFfRI+W9WERtk2ErqSSklwsqnMxpvHvQDU08uRdIoTCbxQw0dqGOw/GVq1A6lwRjhzl1gQCv2AY2Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q7CCAxhs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q7CCAxhs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3AD1C4CEE5;
	Tue,  4 Mar 2025 13:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741094598;
	bh=9H+d9RsQIWL/It3cH/EQAmTVSxNvClFoGhn10q5wbtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q7CCAxhsN/byK9ybsEcun6VR1Y8lsN22CLTeWFonJKh/w9b+W7o57LV97Y75erMbP
	 e8Ewv6G6tZkLCDIYxqjntt1GMPQGaJNzh/jLclIO1smjcIFCBIk0JJoSN+eGb7oASp
	 dJ9gZ3nRzZD289+fFdQpOj6qieZO03lmnxIr0AZEIuZmnIhlq7gSyM2uDwqEmWWcOC
	 Fm7pM3oGhqglcdv2xJcLsn9M8DmBtXSW50i4/4c/hUw47Bk7wMDLgIG3ufp/7iBd0O
	 8zUNdZE9RxVajT5mSSg5C3rt0rkV8M6tIuIig5w2bfLMudbWtBy8nq2CXdCadQBNY5
	 rjSjIdzgGsymg==
Date: Tue, 4 Mar 2025 13:23:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Zxyan Zhu <zxyan20@163.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regmap: debugfs: Fix name collision without atomic
 operations
Message-ID: <5040c16b-7784-42aa-bd2d-ee7e966a924f@sirena.org.uk>
References: <20250304122221.3317232-1-zxyan20@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BGqkiQDM6aRP4N9U"
Content-Disposition: inline
In-Reply-To: <20250304122221.3317232-1-zxyan20@163.com>
X-Cookie: Do not disturb.


--BGqkiQDM6aRP4N9U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 04, 2025 at 08:22:21PM +0800, Zxyan Zhu wrote:

> A global variable caused debugfs name conflicts during re-entry,
> leading to creation failures. Use atomic operations to ensure safe
> and unique naming.

This doesn't help at all AFAICT?  IIRC this code was relying on some
higher level locking but ICBW.

> -						dummy_index);
> +						atomic_read(&dummy_index));

Here we do an atomic read...

>  		if (!map->debugfs_name)
>  			return;
>  		name = map->debugfs_name;
> -		dummy_index++;
> +		atomic_inc(&dummy_index);

...then later we do an atomic increment so something else could also
have come in and done an atomic read before we do the increment.

--BGqkiQDM6aRP4N9U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfG/sEACgkQJNaLcl1U
h9BOlQf/WMITcPYLS/30VpRy3LAj008c8+jaL4KkqCDmfACbQzp5jOE/oO9m8vyn
xynuXVoIEsmCNFWS/ht45/HubFTtvYgOPYqTYaKDYKbyUxIFOR5nmIU+yNsDUGA+
rWz7nATL7wdSphg5LNHUlBEfI1FBSzqUnzVuWO7WgpScqXOOIjesp2TWmsLUvjHl
NMNgdUczbvB31+k2Gs0oVLo1eStzRPQAle+D2JTaggtk+SUB8a3nunf32ttY6hbp
TPRE7MlL6KxW+sQA/XFuCClbVzM38ejgOhVN/PSzeRLelNHqx5cxCO8uoNtXU+AL
Vq6zvcSS9IZWlAv6MpbhtficzY5Kbg==
=Z5Uz
-----END PGP SIGNATURE-----

--BGqkiQDM6aRP4N9U--
