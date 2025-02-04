Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD6D1547D8;
	Tue,  4 Feb 2025 17:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738689344; cv=none; b=W/PCpBc2G4claKHJW996d/1/tyleeAf/Tan44iFfjQIWIjbwh2mmdgKp9D+k1jgZRwW9/6NbjBvpmLDuPRCFJjx/NNIsvbKvvrHxkUZmnDDBQR6D4Cyk8A14eeab+YeuiCBrI6dRqe43tE5snml4Ezwn2Gc27myDrJmWDRE7bNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738689344; c=relaxed/simple;
	bh=3utSJ411NngUd6k8m6seQSFeNuwpsSuyhkYl5TQtGws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZEafQAmTW2gLN0t2VDtqfQFbKSCg8NSjWBci5c7rqGxlYUOk3CKXA78IxGQKj2xipK6BnRXtmprDu4q2ZGFCyOLxWMI9KoFJ6svhIs+ncMQuKCV+Lf3h1koqfvRKQloS7KLj5yynPY2EMrgio57TFzANae394UTOiStbCX4i5TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VaNh998B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VaNh998B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A643DC4CEDF;
	Tue,  4 Feb 2025 17:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738689343;
	bh=3utSJ411NngUd6k8m6seQSFeNuwpsSuyhkYl5TQtGws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VaNh998BpgDbyWeyaak5lKi2kdVzVRXcmyGbLVpJonZ87KnMyAxu9w7aK8kUK/g8H
	 dsI/kYKnyOU6CMOzEN12UKtsixiv2WbXa2d6GN90JSTqSvh5r2xRC2xhhl3ooSGPJJ
	 nDc6Q+n3cLVPR7usEFuRERhz6fNLRTJNO2NV/WE/Hx7zxiXwrhLbwBCkh2dgKMfERB
	 +RCjyYxK/TtU7e3GTJBN4FFnQ+xgFGbgZvRxrXiUbVo2yqxcv/X52jH3M5iEdLYtna
	 fzIfrIbvPb5o9Rdg/kGlZvSi+jDjSrpDAsJqqgKntL5KIjNejF9YGDUalqeEZG8I8s
	 2pykyrOE61Iyg==
Date: Tue, 4 Feb 2025 17:15:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Frank Li <Frank.li@nxp.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/9] ASoC: SOF: imx: introduce more common structures and
 functions
Message-ID: <fbb837ba-d4e4-4e34-8554-fbb878716289@sirena.org.uk>
References: <20250203171808.4108-1-laurentiumihalcea111@gmail.com>
 <20250203171808.4108-2-laurentiumihalcea111@gmail.com>
 <Z6EeZ4lgKVHCee3e@lizhi-Precision-Tower-5810>
 <db81aa4e-dc1f-4c6d-b58f-82883622b0dc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+1RK/W50sxFm0I0k"
Content-Disposition: inline
In-Reply-To: <db81aa4e-dc1f-4c6d-b58f-82883622b0dc@gmail.com>
X-Cookie: Spelling is a lossed art.


--+1RK/W50sxFm0I0k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 04, 2025 at 06:59:53PM +0200, Laurentiu Mihalcea wrote:
> On 2/3/2025 9:52 PM, Frank Li wrote:
> > On Mon, Feb 03, 2025 at 12:18:00PM -0500, Laurentiu Mihalcea wrote:

> >> +static void imx_handle_reply(struct imx_dsp_ipc *ipc)
> >> +{
> >> +	unsigned long flags;
> >> +	struct snd_sof_dev *sdev = imx_dsp_get_data(ipc);
> >> +
> >> +	spin_lock_irqsave(&sdev->ipc_lock, flags);
> >> +	snd_sof_ipc_process_reply(sdev, 0);
> >> +	spin_unlock_irqrestore(&sdev->ipc_lock, flags);
> > Are you sure have to use spin_lock?

> not sure, this definition was taken from previous drivers. I'd say keep it for now
> as removing it would require some more testing which will take some time.

If it's just factoring out common code it does make sense to do the
factoring out then incrementally change the locking as a separate change.

--+1RK/W50sxFm0I0k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeiSzoACgkQJNaLcl1U
h9BJWAf/UbrWOukEmUUeKubtRgSRUj4YCBANoW4tBEilmL6coROl4kWq25DGtWOv
HtvaCU9g9HWskNS7qXD2SHsZMeD3u37VOGK3aRbndiK91nWzRl6I7fJuRO3IFobC
/iyjJFInxxD8inhtkGeYH4aop/buuClugsMFnlFHFCq8bJonuxtQxNcHYXvg1DB9
791k+XklGiJT0ERCIDAO3vNz22LKE9dFqMSgPDkTMUvZtg2jhYcLSKJZ7lF5Kt8y
/rES3rjNnQa41vnYvUAvw+AZMMOime27hwyIZQkdn3pboIo/dhTJPBf+3Ang/052
lC+2A/ohN2fwOR6bjzRatTvqvR+z6g==
=gqnK
-----END PGP SIGNATURE-----

--+1RK/W50sxFm0I0k--
