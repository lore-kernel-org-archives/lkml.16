Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D084E15748F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743407630; cv=none; b=Docp0U1Qj+AlTlBValm7vL7EbZP8xPhuOnHDvZ1VuqW1nrMZMLu2x3TjsWgmXQEHOtzZT8Fl1EJQAxB4cG3GoqVxH9wcv5Bl6bjZQrhlvL5D+fFRipPfEkeYucAtLi0wJ3vi+jhvpgNTeubUI5uBACFHUQwE0S15N7WwUhJb2xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743407630; c=relaxed/simple;
	bh=pHSJnOBye+2M5W9r0QAOLNEwizHe+AOJ/A7x0NsoBYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MpiSLGbwRiY57BLbSh61zMDhO4UinDjtc8vjGah3X9fxSPtUiK8R1vTvE1G0ldQjIuj52utqWwV6kom/opjvc0RUWhq1nSvh3yIXOxu1AXYRPnle4/mdPZZ2nLUKrE8/vCshOIaneb4rK5RlbtEmIXlRG8z0JYaaAgROJCrAayA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRbMtQme; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRbMtQme"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC6DC4CEE3;
	Mon, 31 Mar 2025 07:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743407630;
	bh=pHSJnOBye+2M5W9r0QAOLNEwizHe+AOJ/A7x0NsoBYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LRbMtQmeJestwFoj/OlDBdiajzkyM8riQrKtwWmajfMoSD3i5hdjSLMgJLAg2dQbm
	 FnkmMeEqaNp+PhPBGf6iMZzY/tOFsEjBI9ZhT33XR/2q5wxsP2s/tkUtV/6QtTq98h
	 aa+3AU/Wd38BKpG6tJtvjWMFW/UPVIAvE7C7lOiMX1UtlduRKcVviE1kM8DKWpz/94
	 SuDCzSHjQf8O7ZK3rpqOu9wQcA4HtdLUE1IibuyjQMRokXw41UIJbFS8JgQimqwzK8
	 gN/VWR/jXdBmJlukzxcRnxfpSCzRfKuyjCIxHB2R003VYbxSFdC85ZhwJTr5yoahVM
	 Mk3bFnJh0wO8w==
Date: Mon, 31 Mar 2025 09:53:47 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vignesh Raman <vignesh.raman@collabora.com>, 
	dri-devel@lists.freedesktop.org, daniels@collabora.com, helen.fornazier@gmail.com, 
	airlied@gmail.com, simona.vetter@ffwll.ch, robdclark@gmail.com, 
	guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
	lumag@kernel.org, quic_abhinavk@quicinc.com, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] drm/ci: Add jobs to validate devicetrees
Message-ID: <20250331-amphibian-hopping-bobcat-e19a0b@houat>
References: <20250327160117.945165-1-vignesh.raman@collabora.com>
 <20250327160117.945165-3-vignesh.raman@collabora.com>
 <v4dhuuuvfk63bakncz43z3ndjdze5ac7nrv6qvtpdnonfpetsx@5hh3vzcj336x>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wbv3572a4nxzn66s"
Content-Disposition: inline
In-Reply-To: <v4dhuuuvfk63bakncz43z3ndjdze5ac7nrv6qvtpdnonfpetsx@5hh3vzcj336x>


--wbv3572a4nxzn66s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 2/3] drm/ci: Add jobs to validate devicetrees
MIME-Version: 1.0

On Sun, Mar 30, 2025 at 08:06:45PM +0300, Dmitry Baryshkov wrote:
> On Thu, Mar 27, 2025 at 09:31:11PM +0530, Vignesh Raman wrote:
> > Add jobs to run dt_binding_check and dtbs_check. If warnings are seen,
> > exit with a non-zero error code while configuring them as warning in
> > the GitLab CI pipeline.
>=20
> Can it really succeed or is it going to be an always-failing job? The
> dt_binding_check generally succeed, dtbs_check generates tons of
> warnings. We are trying to make progress there, but it's still very far
> from being achevable.

It depends on the platforms I guess. Some are 100% covered and any
warning should be treated as a failure, and some have not started the
effort.

I guess we could solve it with some kind of expectation list, but I do
wonder if it's something *we* should be focusing on :)

Maxime

--wbv3572a4nxzn66s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+pKCgAKCRDj7w1vZxhR
xdagAP0XnRYBnSj/dqwFP4OvDmsR0IobwdXIfMWh/qcY9V+UwQEArf0CcTvB/9a/
mOirpItBhtP6MZgwnpQk0Hrn1eE82Q8=
=CE5q
-----END PGP SIGNATURE-----

--wbv3572a4nxzn66s--
