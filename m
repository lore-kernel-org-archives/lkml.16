Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D232874FF;
	Mon, 19 May 2025 16:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747671038; cv=none; b=JPYWcIN4IJAwqGTPq9w6VPSisgNJP6xwQKJK5CU6x02nLpWqIX66TN1SHmK3n3JQ/FXxKUhWHTBeDi4x1Ob6KsPZ4Z9/SXM1IMUemdm06SguiYf29KCjqMWH9pIJaGMlPQbiyha/YOyJ/fILqsp3KaEReXZpOYXlFz5yGK2IEHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747671038; c=relaxed/simple;
	bh=8Gfs1ppaN2jlWBdNlgUpnLmCuisZo8JpB/m7e1EOfY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wx5Fg8xJsDEKHrOi3VDqWW8oPx+Qfi0v5bXa30XSWAGs2j6Y7iksXzCWpUjd4eORRNu7X3eVhFb2SD39hAQJS5SrXfTFPAAwIcolt1+xfvicFdhUDex3ORFNPT+fbiEdXtl4feuSFB8oh/OAlCfs4zd9HcWG2f59m1nElC7CZOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ux0OAwzs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ux0OAwzs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57595C4CEE4;
	Mon, 19 May 2025 16:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747671037;
	bh=8Gfs1ppaN2jlWBdNlgUpnLmCuisZo8JpB/m7e1EOfY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ux0OAwzsDhwEUzAgkYnF1PBlXBNY6/IoCrn18FzOxHABKpbXVPdqB/F05wVxnJi/L
	 MlZfa298W9L0UwoSlLPSOqLLs3UmFc3YwUt2v1OKWKNMZNg5Iou6qkVl8aQxWb+zBw
	 MXuhC6BIghUZOGzqYiW3cVf9Pio9XGDImV+ZL9u665zImRAbTKd/GTrHVtp7O7q/fd
	 4DkuDjCcYityBt6kZfId6BQhugdI/032oTdCFCPMHpNCzVr0iVYiJCrOssmCc19hIH
	 m97TkiLH9BUIaPwlKrxlhh7swkUzHiIonUfghBOq63e070hZ5Ige8DSZf+ONWROGT0
	 KdS9NfvBn+dJA==
Date: Mon, 19 May 2025 17:10:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: gpu: mali-utgard: Add Rockchip RK3528
 compatible
Message-ID: <20250519-tweak-showplace-264a15576e76@spud>
References: <20250518225418.682182-1-jonas@kwiboo.se>
 <20250518225418.682182-2-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zE6C03YwwDfltbjP"
Content-Disposition: inline
In-Reply-To: <20250518225418.682182-2-jonas@kwiboo.se>


--zE6C03YwwDfltbjP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 18, 2025 at 10:54:11PM +0000, Jonas Karlman wrote:
> Rockchip RK3528 SoC has a Mali-450 MP2. Add a compatible for it.
>=20
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--zE6C03YwwDfltbjP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCtX+AAKCRB4tDGHoIJi
0no8AQDkDSkDoPmDYFg2jj31yNSF71G37/q7Z+IxLIzuuuABUQD+IxyTT4p/MLMI
izTE/i5XxqvB776nHAIckmO8hCXKmgI=
=b3XN
-----END PGP SIGNATURE-----

--zE6C03YwwDfltbjP--
