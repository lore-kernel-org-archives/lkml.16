Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEDD28C2D3
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670732; cv=none; b=b4xT/fOIbdL5KpGyOob3vizEpFWCRc5lMr/OoFncknr5m12NEcOBSVcMfLayGQnz6l5ebylYZ8jXqYJZI79KOWnuAvmjjLt8v0gJzOaRc5L+qdi4PzqssVqXlgk/E9HRUuKq8KFF21mF73gRINXKRlU6MD8pEwk+XlsmVQReeSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670732; c=relaxed/simple;
	bh=AUke/NWSRLIRn7SoKvI956go9bNucVyPQKWPXFtUZeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbXYY6w0JURyI9qXwpKFC6yPfumQAyWl+3W6fCjBO3bvGtUViSiCVnVTzkds98b974aDDZ965F35knZQdVZNl4q1OrpnXGH2gXCANwN40MNXzrAUQhIfrvxHRD3yeBZZhLkmoHoO1uR9cKu+dtchQitFzJ8ENgRUDRaXIqN+3hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jc3/adoR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jc3/adoR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35439C4CEE4;
	Mon, 19 May 2025 16:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747670731;
	bh=AUke/NWSRLIRn7SoKvI956go9bNucVyPQKWPXFtUZeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jc3/adoRxZirOIHN5H/K6ZNn0Yg5CAjsdamiscbNe77qxdu0FqWSQWERU3b+1dTtj
	 pTl4QEPbKD0azl2uEt/zzqWMNG/3tPAhbrEdyBFoHwWl9B4BrwbFWaYjGBhYzo8oPH
	 UOrSHi++ymFM2oxgSHiHoJy98rmC3JPJoy+5NZa3jlDqlTavFp22cilF/b/wwbOOK4
	 zIeRRizmsOATFg8Qj6OAQzuwWNd9GDDOv5PHWnGQ13pLitCzHhUuCUrl4spd7mbyF0
	 qWEuRBmaaljv2nE4ON8aEJbafg2zOT5OR6Nz/hcrSMNU62E7opaTcJ6eEJm8mCgUNr
	 TNaAQbuNTCsAg==
Date: Mon, 19 May 2025 18:05:28 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
Message-ID: <20250519-singing-silent-stingray-fe5c9b@houat>
References: <87y0vkw8ll.fsf@intel.com>
 <20250429-benign-sidewinder-of-defense-6dd4d8@houat>
 <87o6wfwcef.fsf@intel.com>
 <20250505-slim-bizarre-marten-a674ac@houat>
 <CAN9Xe3RLazpAXdxxJmyF2QAShDtMSgdoxMdo6ecdYd7aZiP9kA@mail.gmail.com>
 <874ixvtbxy.fsf@intel.com>
 <20250509-rapid-flounder-of-devotion-6b26bb@houat>
 <87r00yj6kv.fsf@intel.com>
 <molexnyjkiryvhetfdc66gmzecrf6f7kxl656qn46djdkixrkb@fdgnp5hispbf>
 <875xi3im1r.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="44ortngatcuhoot2"
Content-Disposition: inline
In-Reply-To: <875xi3im1r.fsf@intel.com>


--44ortngatcuhoot2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
MIME-Version: 1.0

On Wed, May 14, 2025 at 12:22:40PM +0300, Jani Nikula wrote:
> On Tue, 13 May 2025, Maxime Ripard <mripard@kernel.org> wrote:
> > Is it really surprising you get some pushback when you are using a
> > design that is the complete opposite to what every user of it for the
> > last decade has been doing?
>=20
> The opposite is also true.
>=20
> If you create a design that does not cleanly fit the model of the
> biggest drivers in the subsystem, and expect massive refactors just for
> the sake of conforming to the design to be able to use any of it, you'll
> also get pushback.

That's the thing though: i915 deviates pretty heavily from the helpers,
in general. If it wants to consume them, then it must also be ready to
make some adjustments. Or just roll its own thing like it has done in
the past.

Otherwise, where do we draw the line when anyone isn't happy with the
helpers in general and ask for an exception because reworking the driver
is too much work?

We did this on pretty much every ARM platform, we did this for amdgpu,
but somehow i915 should get a pass?

On what ground? What should we tell the next driver that uses the same
argument?

> > This one is usable, but you rule out the way you could use it.
>=20
> I think you're off-hand and completely dismissing the amount of work it
> would be. And still I'm not even ruling it out, but there has to be a
> way to start off in small incremental steps, and use the parts that
> work. And it's not like we're averse to refactoring in the least,
> everyone knows that.

I'm not sure how pointing fingers at who has the right design,
overlooked some hypothetical usages 10y down the line, or is being
offhand helps the conversation in any way.

I've been asking questions to understand what you could work with, and
some are still left unanswered, and had to ask others multiple times to
get an answer.

And maybe I do indeed underestimate the amount of work it would take. I
don't believe so, and I still believe that it wouldn't be too hard. But
maybe you're right. You still haven't explained why it would take
anything more than registering a dumb device at probe time though.

> > I guess it's clear now that you won't consider anything else. I wonder
> > why you started that discussion in the first place if you already have
> > a clear mind on how to get things moving forward.
>=20
> I pointed out what I think is a bug in drm_panel, with nothing but good
> intentions, and everything snowballed from there.
>=20
> There has to be a middle ground instead of absolutes. Otherwise we'll
> just end up in deeper silos. And more arguments.

I believe calling drm_panel_init would be a middle ground, if we add a
bunch of warnings, checks here and there and move things around a bit.
But to keep it, we do need a good reason for it, even more so if we
don't have any in-tree users anymore.

Maxime

--44ortngatcuhoot2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaCtWwwAKCRAnX84Zoj2+
dhXaAX99/6tATvYQUSyz9hcmkMAlBSpKAc/PN6MlwYWkkWP+I/hjrTMVuAbhGWSd
9IvD6+cBfi2/vkBdTeY/kaxzhyQR+gVabclTJ1Jq1RtAOVZVAKk0qXWTtCqbF/Id
xM34KIQ2JA==
=rS0I
-----END PGP SIGNATURE-----

--44ortngatcuhoot2--
