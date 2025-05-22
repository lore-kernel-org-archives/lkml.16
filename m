Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9766E263F36;
	Thu, 22 May 2025 15:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747927888; cv=none; b=WoXXqBXiaa0H4ibVCGa+ofAI2t9VufssbEEyN3Hg79rayuxH9Vz5Us2sZBqtq/MSEmRN7cLGziONHWPFcR3FNMs22sXERI4lXjfx31PVCZRaGgf7MK5Ia3fcJfjHYbZj/yoBUtRithvLSLieKhiGD7sdsHHCZ9Lt+XtYYmWQAf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747927888; c=relaxed/simple;
	bh=GM5UqvDd48tmOMN7QQ3NkReYaC/yuX/sVwPcKzsWhsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HiPa3Mbe9NNYmT+o+tD841VWSdXssY8Z7G9V1e3V+6/uiF0Bf8oN9sr6tDuKynRxvC7V+Pz/a6xZWJVGB+jiDTmVepTt0bTUmm4yXsj4/lBk+A5tIST94bknb8VtMSd9QFdkT8bntwdarfRigXZ3/ydDgDefmaJ+HbEmUXL1TUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HxviBqmb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HxviBqmb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21975C4CEE4;
	Thu, 22 May 2025 15:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747927888;
	bh=GM5UqvDd48tmOMN7QQ3NkReYaC/yuX/sVwPcKzsWhsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HxviBqmbpehXw97i57SgmgN0MXzwhWB/+tJsJ+uaKl6o2e5LQCp2f3eC+YPhb9znL
	 EgFhAJHDbEYTacQMTDbe6A0ax5OR3tMndeIV0Ztx5kHNxkd24S4I3qGhLWm+NI/kch
	 Eoy17GQoUrviSQpVNkq9KxqmUSuVCerN844pwmuwiPVNaZwkCW8tIZBwscfMtCmYXt
	 kMkD/T25CSZoumLYL194A/QDPoGoZhckmSUXUX282QCHhFwvso8Oi8kTs4kl1XffRc
	 neBdkQerfnYd7qANtfePSkG+e7oErIb72RmLYQ6u1mSMw+mzwrPeXfnkKEyyHVdoQP
	 PdskZKQlt8LGA==
Date: Thu, 22 May 2025 16:31:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Wig Cheng <onlywig@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, heiko@sntech.de,
	kever.yang@rock-chips.com, manivannan.sadhasivam@linaro.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: vendor-prefixes: rename nutsboard to
 mayqueen
Message-ID: <20250522-among-gestation-988395db0b03@spud>
References: <20250522152220.3408999-1-onlywig@gmail.com>
 <20250522-difficult-yummy-84376495b270@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VSnhEKioIcsXBOkm"
Content-Disposition: inline
In-Reply-To: <20250522-difficult-yummy-84376495b270@spud>


--VSnhEKioIcsXBOkm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 04:30:39PM +0100, Conor Dooley wrote:
> On Thu, May 22, 2025 at 11:22:20PM +0800, Wig Cheng wrote:
> > The company behind "nutsboard" has been renamed to "mayqueen".
> > Update the vendor prefix accordingly to reflect the new name.
>=20
> Whatever about adding a new name, the old name should not be deleted
> since it has users - maybe it can be marked deprecated.

Additionally, the new name should come with a user, or a link to a user
in another project (e.g. u-boot)

--VSnhEKioIcsXBOkm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaC9DSwAKCRB4tDGHoIJi
0pZTAQDqHzR4b25qYzkQ+IT3kqi58D/rBzfrBlybVbIYFPu/lwEAghzAI4NyEHxB
5zhpcUC1Bu1dY44NMwvnQsNGRGAf2wc=
=i60M
-----END PGP SIGNATURE-----

--VSnhEKioIcsXBOkm--
