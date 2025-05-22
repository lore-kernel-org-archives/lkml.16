Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D24251022
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747928621; cv=none; b=opDKr22eIpS3CAy4LqBjsIhHqDUgd8UQ8S5udl4gYrWUGSPgWbe4DT0YnEzzxMqSY3yWxGlO/wSPizP8b3V06AHhlYBdJDd6M4WKAWZWtMseJnzqFK4FjZgUbN516TIi4Aag59taR3rhl6BpGF7blNOMtnj2Y6xR5+Rq+iX2CRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747928621; c=relaxed/simple;
	bh=c8OL6PpN47V/G4B7m2WiV8zHMTLMhBQlndjpc2oamTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F5qqNnFyl6HmfrK5Uz3KIW2chraAB8RC+0ltK0VBb5LdSsSmtQlcdqNkj4N7dRG0pI2a46gaSZXOsESCGATrEC96T+nsObEhUrL2LCx079v72mQL3R4GcEC0CBEa1VkLbFGYinCJOYTMxDzpfY+kPVAxd6LCkID7Yb/xElyj/1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n3EZwBJ3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n3EZwBJ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73342C4CEE4;
	Thu, 22 May 2025 15:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747928621;
	bh=c8OL6PpN47V/G4B7m2WiV8zHMTLMhBQlndjpc2oamTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n3EZwBJ3UKlMe0byRqGTTH1EGdfPEHEsRe/IxKBM+LkTo/EZOZ4FaBkwkoVySMthA
	 L5vfVH7ru5EA4Bg8BcM33Xtq39aUOIrHqf5Cz6dkNolM3i/Hejf1ViGAYzUsRlmAjs
	 3YmN2b0gR5D0Jh8NLm1aMhFo6aiTsCba5xgCJmjlHQ8mvtxACAMnEoPWxxmXhQ0LgS
	 I6TYTHL6MlpQSYCkTp33fndSGsT9uD+xl8dnHNi+evrsHwm6bDRlhoj0J/7hJSQFc6
	 rtIDUEFN/H9AMU0RkGEpMOJJtJn5J6bR2zwIkkESy/Mf3/9BgNhqEZQJ+vIo8EjKGB
	 WYSvEnQBxdZwA==
Date: Thu, 22 May 2025 17:43:37 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Anusha Srivatsa <asrivats@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
	=?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/3] dmr/bridge: add a .destroy func
Message-ID: <20250522-hot-hopeful-smilodon-dfb5b6@houat>
References: <20250516-drm-bridge-alloc-doc-test-v8-0-7e356fd58ba5@bootlin.com>
 <20250516-drm-bridge-alloc-doc-test-v8-2-7e356fd58ba5@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="wagilyymp6isqxif"
Content-Disposition: inline
In-Reply-To: <20250516-drm-bridge-alloc-doc-test-v8-2-7e356fd58ba5@bootlin.com>


--wagilyymp6isqxif
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 2/3] dmr/bridge: add a .destroy func
MIME-Version: 1.0

On Fri, May 16, 2025 at 06:48:38PM +0200, Luca Ceresoli wrote:
> Some users of DRM bridges may need to execute specific code just before
> deallocation.
>=20
> As of now the only known user would be KUnit tests.
>=20
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> This patch is new in v8. The .destroy callback had appeared in v5 as well
> [5], but as part of a larger patch and for different reason that do not
> apply anymore.
>=20
> [5] https://lore.kernel.org/all/20241231-hotplug-drm-bridge-v5-3-173065a1=
ece1@bootlin.com/#t
> ---
>  drivers/gpu/drm/drm_bridge.c |  2 ++
>  include/drm/drm_bridge.h     | 10 ++++++++++
>  2 files changed, 12 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index b4c89ec01998b849018ce031c7cd84614e65e710..6185cb29fe3162264f0912c09=
c205fb467975dee 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -203,6 +203,8 @@ static void __drm_bridge_free(struct kref *kref)
>  {
>  	struct drm_bridge *bridge =3D container_of(kref, struct drm_bridge, ref=
count);
> =20
> +	if (bridge->funcs->destroy)
> +		bridge->funcs->destroy(bridge);
>  	kfree(bridge->container);
>  }
> =20
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 4e418a29a9ff9d014d6ac0910a5d9bcf7118195e..3ccd493faa580845c2ed1166f=
398eca27b464261 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -86,6 +86,16 @@ struct drm_bridge_funcs {
>  	 */
>  	void (*detach)(struct drm_bridge *bridge);
> =20
> +	/**
> +	 * @destroy:
> +	 *
> +	 * This callback is invoked when the bridge is about to be
> +	 * deallocated.
> +	 *
> +	 * The @destroy callback is optional.
> +	 */
> +	void (*destroy)(struct drm_bridge *bridge);
> +

destroy is before detach in alphabetical order, but otherwise it looks
good to me.

Once fixed,
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--wagilyymp6isqxif
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaC9GKAAKCRAnX84Zoj2+
dlrbAYCoHT8OaEnv8+xh/VR+KvYz5K5EAHovgvqTLDuo9f1Wc0zAF/YiqgfINEDS
w2CmeY4BgJBEARiEm8Z6K2XWJZrL/GpWDPS+7KKbiWSlZoAMs6EcYEOYXNlTWO4s
JP2ZfjitvA==
=5rIp
-----END PGP SIGNATURE-----

--wagilyymp6isqxif--
