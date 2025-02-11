Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D21E1F76B5
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739279854; cv=none; b=qqVu6eS5bZH1Jj4dZNhkXEqeUaNvp+TH5bC42cPYrz7llNJUNNrPyMve2Ziku0ym5FrGELBWZk4xS+HZqO1li1309RSNs34AaYSpieBprw4EqTyGpYYmNkxE65GyHIIXQPFQdSf+820fI+0DSNjmTXzJTIgzYccRkBUr8UfJfp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739279854; c=relaxed/simple;
	bh=QW95HtSAyRWSgioqNcw892BFhWS6RVT2u9MZYi9Kl6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQaRnchYHqqDDyq3s8KC/aO5zMPy2k1YuxC6bdQxYd6DiLFV+QYfVWCLOhAJJjc8cNo7WaKtpoUYjM8jevU0HpM+rS+2zc4Lk9jhWyi6Ahu5zS9xq6JF/Y2o/PmsTBoR4fZjIJUnlH/kwC/8/NgePOtYEgmdKZxqSoDd5bLDf18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HKjnUSYn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HKjnUSYn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24332C4CEDD;
	Tue, 11 Feb 2025 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739279853;
	bh=QW95HtSAyRWSgioqNcw892BFhWS6RVT2u9MZYi9Kl6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HKjnUSYnWyK4/IOzU7k7AtQp3oXjK2wwFAB5rJdK9V4L7STFUub7wIjG72IEmJo9/
	 /GWeXN6u8D3Qdq1n0qv78tpj49rIUXtWLUkOUdMzwBM0es26sk6v7bQCaiE1dPqtdt
	 y6bXJGiBSXZkEo98P1HVe7z9p+5gn8H4kkX1QrvceIlkWOWmiDPe91/Byy5pdlNkoy
	 3GJlb9Vsu05VYFRL28xlvP4B/K0LunnDPV5EjoBaB5ng78fYF1px3Cn132uC8C+Bxs
	 FUR2C13CD8GM9hFSyfvT5yF0l/Ec+nd/qeIjjTlZ0BB8/edNV9pXQh+X+OuVu6uChK
	 VdNgQ6e2PSHfA==
Date: Tue, 11 Feb 2025 14:17:30 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v2 00/35] drm/bridge: Various quality of life improvements
Message-ID: <20250211-peculiar-misty-moose-639556@houat>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <yudkovtipwtnofr3o2qwqrmriwxlczrwploieh5i4ke3sx5zhk@5ktlrew7o6k2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="muzs5dl4zad52eyq"
Content-Disposition: inline
In-Reply-To: <yudkovtipwtnofr3o2qwqrmriwxlczrwploieh5i4ke3sx5zhk@5ktlrew7o6k2>


--muzs5dl4zad52eyq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 00/35] drm/bridge: Various quality of life improvements
MIME-Version: 1.0

On Sun, Feb 09, 2025 at 05:27:01AM +0200, Dmitry Baryshkov wrote:
> On Tue, Feb 04, 2025 at 03:57:28PM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > Here's a series of changes after to the KMS helpers and bridge API
> > following a bunch of reviews I did.
> >=20
> > It's mostly centered across providing an easier time to deal with bridge
> > states, and a somewhat consistent with the other entities API.
> >=20
> > It's build tested only, with arm64 allmodconfig.
> >=20
> > Maxime
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> > Changes in v2:
> > - Pass the full atomic state to bridge atomic hooks
> > - Make attach take the encoder as a parameter
> > - Mark bridge->encoder as deprecated
> > - Rework the logic to detect if a bridge uses a state or not at
> >   atomic_check time
> > - Add lockdep assertion to drm_bridge_get_current_state()
> > - Link to v1: https://lore.kernel.org/r/20250115-bridge-connector-v1-0-=
9a2fecd886a6@kernel.org
> >=20
> > ---
> > Maxime Ripard (35):
> >       drm/atomic: Document history of drm_atomic_state
> >       drm/bridge: Pass full state to atomic_pre_enable
> >       drm/bridge: Pass full state to atomic_enable
> >       drm/bridge: Pass full state to atomic_disable
> >       drm/bridge: Pass full state to atomic_post_disable
> >       drm/atomic-helper: Fix commit_tail state variable name
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_wai=
t_for_dependencies()
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_com=
mit_tail()
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_com=
mit_tail_rpm()
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_mod=
eset_disables()
> >       drm/atomic-helper: Change parameter name of disable_outputs()
> >       drm/bridge: Change parameter name of drm_atomic_bridge_chain_disa=
ble()
> >       drm/bridge: Change parameter name of drm_atomic_bridge_chain_post=
_disable()
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_upd=
ate_legacy_modeset_state()
> >       drm/atomic-helper: Change parameter name of crtc_set_mode()
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_com=
mit_planes()
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_com=
mit_modeset_enables()
> >       drm/bridge: Change parameter name of drm_atomic_bridge_chain_pre_=
enable()
> >       drm/bridge: Change parameter name of drm_atomic_bridge_chain_enab=
le()
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_com=
mit_writebacks()
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_fak=
e_vblank()
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_com=
mit_hw_done()
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_wai=
t_for_vblanks()
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_cle=
anup_planes()
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_com=
mit_cleanup_done()
> >       drm/atomic-helper: Change parameter name of drm_atomic_helper_wai=
t_for_flip_done()
>=20
> I agree that use of the old_state can be confusing (and it has been
> confusing to me for some time). The main question is, do we loose useful
> memo 'this is the state after swap'. Most likely it is useless now, just
> wanted to give it a second thought.

The drm_atomic_state doesn't change after a swap, only the
plane/crtc/connector/private_obj (and their state) state pointer do. And
if you meant that old_state mentions that the states have been swapped,
it's still a terrible name and we should change it still :)

Maxime

--muzs5dl4zad52eyq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6tN6gAKCRAnX84Zoj2+
dsHkAX9u62jj0+j/VHr3l9CZUKWK1k/Ets8OAJ6Az0Hs6T8ojUXszlx+9rnb3PIX
+Q/vaWkBfRSJLYVl9IDLrivCRYdC7XrdCNjdLW4gILcZDmVgavVXbgZoq6MQXV3x
dtsdV+WWHA==
=+jX8
-----END PGP SIGNATURE-----

--muzs5dl4zad52eyq--
