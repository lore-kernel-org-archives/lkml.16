Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEC62D23A4;
	Fri,  4 Jul 2025 11:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751629977; cv=none; b=oS5Oeexh+eNwrBSLCyEZq/9WC5IgNqiRaEe1qW8Ym2Dqr3xUceC1TfWpOqnpHyZOB7AAe7fu+l0f+HMl8tbgCEJEN98I13INrkZc0+zW63y2wO3n/vR2oEKzJj0S1dLByIL13QH8ieqVGOYYnOat2Mt+Fa39DgRjXbyPcsbAM9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751629977; c=relaxed/simple;
	bh=F8fazwFlMyUoJbXqxR7SrVVoqpCFZF0mi8fYUNYZNpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b8YfIrwn5pzBjLARa1q4pIMri5DB0QTAz5wQ19/ctTASEC7Q9wEg8eWil7EzvAmEateacHi0/Opp4vW3MqxmixXQIwckkPLQJkMUycEladdAik7UAWkziRfVFUDUCF7AtyPiibwR3HDqeB28DS7xh5S8FrWe3egxyxTB4HVhWAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7JOEY+C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7JOEY+C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A95D6C4CEF2;
	Fri,  4 Jul 2025 11:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751629976;
	bh=F8fazwFlMyUoJbXqxR7SrVVoqpCFZF0mi8fYUNYZNpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d7JOEY+Cp8OPoHDKvSSRKrH94l0O4Ru9f6SD6zWxmzGJJmzYqQHXj/ILozmnj76fb
	 IoqmKSOAmFGcye1R7KoR4JUEiF0rJsrrSeV0GRWWLluilPwXR/NeUF8TB+FWmJ7Wxv
	 fnwEp54/olJGeRScgnNN2Aa4PSsB5KOto+pNG6XvXogRg9sDDy0IOZudz+Vi0BvqxW
	 fjRGzL7GwmUZfXwtQIe7ZstAljOLvmG2TOgWNWpD1denNd63uFc4CFeEq+3/6Rluyo
	 zd7imm4HDMIVGnfpKZaqT35QL6n7USAnUfyDTQvalCsV7VcdS7+S36m22A8XaPzv+7
	 jnRb391PK6Dng==
Date: Fri, 4 Jul 2025 12:52:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Chen Ni <nichen@iscas.ac.cn>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 69/80] ALSA: hda: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <df66418f-29a9-4dc8-95eb-a4d81d5f0d2a@sirena.org.uk>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075455.3222438-1-sakari.ailus@linux.intel.com>
 <87tt3snpo1.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bK/e0190QLAppg09"
Content-Disposition: inline
In-Reply-To: <87tt3snpo1.wl-tiwai@suse.de>
X-Cookie: VMS must die!


--bK/e0190QLAppg09
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 04, 2025 at 01:47:26PM +0200, Takashi Iwai wrote:
> Sakari Ailus wrote:

> > pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> > pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> > to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> > pm_runtime_mark_last_busy().

> Acked-by: Takashi Iwai <tiwai@suse.de>

The suggestion in the cover letter was that we should apply these to our
trees after pulling a tag from Rafael's tree.

--bK/e0190QLAppg09
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhnwJEACgkQJNaLcl1U
h9A9gQf/ZDtPXwk/+iL95yAm+Q0bdIqYIkZRA/fVykn5ZQAw5KHqgFd5XDcBxJkI
aHgvjQVsUrzenCEOhVC1s5XGuW/khPrwh8m35baGPKxzuuGni9UtaEAyXA1Rm3/R
6nR8PXA89d+WvYVzvOhb5jJjmx9icXycWGKTKee7YJZRp2PXgvcrlhJlU4k7SeWM
pBHThr43LZedmFNXGo5XfkcFzX1NGI/i2kCGoeKWpAi/Q/e4UiZbbMmDkLJql30p
FJBHpgfk8U5RkEy1aFE5Qgx6yDVfJBkQlAiWC146OPx/yVFDZZcHgoP7CIWqHNzr
XBcNT36A6DhxAAm7QvnT2CIjQj2Rbw==
=f4k6
-----END PGP SIGNATURE-----

--bK/e0190QLAppg09--
