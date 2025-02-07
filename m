Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ED6184;
	Fri,  7 Feb 2025 00:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738886761; cv=none; b=tQK1/3auGOpIU6+KefIXBte1hDkCKER7OpqRZAWbTJImGHARCqyWpZBqGeiFdqtJ+lK4X46gjliwB5MCrZroaoM3moN3dx/ygWCLUN05v1eoDJuJSr3JAu16oOEmxiD85tl3IEQ9tq8QScFkYH35/kngUGIfbZgta/lg/vbE010=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738886761; c=relaxed/simple;
	bh=unumerF3wuEW+t29ZNgfkgqepZFAeZrfvRLZS/aN1T8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OiegL9gl83bFzhqX7Xej9yaW5few/TT+ViCBZm7JMNg6GONRKVEox1juRsPz2ay15a2b4sLbx+DP+Fv3UA8i4lZvrxByDcSCdKF4xgHiOhqYt2Ct5CoE8quCZ53yt/KGycNKU3GCOdiHz509By700gvPzZeh8aA053y3CWzh938=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OS5vtUP8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OS5vtUP8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99FE7C4CEDF;
	Fri,  7 Feb 2025 00:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738886760;
	bh=unumerF3wuEW+t29ZNgfkgqepZFAeZrfvRLZS/aN1T8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OS5vtUP8W1dICJdEc8OCIyy+bmkBKsmWi6lPUGicw+bhnrscCYrEuo3lMoTRnAUWp
	 rm7euvzjm88aoIV3nInhMbLl1iMcPvTit/5Hriau0Ng9G6uA3Arue5deUzFrfhSKKa
	 hEz9afZiCcl2Eq7K8oWyffGE0VEUP8f8jiZoy3EBw/tSrhKRtdsiRoFqGMe7DQdmqX
	 huUQTeV+qCZJSwm+pazFeA3C4t/d2kC/+ISI/BVhtbFgtqKQCnzm8ts87L0As/5W1e
	 /KA6Eey9KYxsHpyGiGOOGTxPAym1MTyDYt99f4v79U8bBkQ2cCDJaPIkEUVYkeexIS
	 Mu/mEKdrXqGvA==
Date: Fri, 7 Feb 2025 00:05:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Naresh Solanki <naresh.solanki@9elements.com>
Cc: Guenter Roeck <linux@roeck-us.net>, broonie@kernel.org,
	Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: ir38060: Move & update dt binding
Message-ID: <20250207-semifinal-fondue-bbc3ad179ce5@spud>
References: <20250204180306.2755444-1-naresh.solanki@9elements.com>
 <20250204-mulled-evaluate-8a690cdfbd4d@spud>
 <CABqG17jHKfwJEfZxto_YA4opS8=QwqTqfNdkku8kcEv2_iW+XA@mail.gmail.com>
 <20250205-purge-debating-21273d3b0f40@spud>
 <CABqG17j4tKXnMZ5=vcjBvfe6JwCLQ6NbkQmJC9ySK_bmGEv=iQ@mail.gmail.com>
 <20250206-camera-mashed-48cf0cf1715f@spud>
 <CABqG17iyRXW2_jvTVkFAEhW+TZZ-SAABm+6efqt0ZWHgYbiUMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZAHNkK8r2FFtRP4y"
Content-Disposition: inline
In-Reply-To: <CABqG17iyRXW2_jvTVkFAEhW+TZZ-SAABm+6efqt0ZWHgYbiUMw@mail.gmail.com>


--ZAHNkK8r2FFtRP4y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 07, 2025 at 12:40:38AM +0530, Naresh Solanki wrote:
> I'm not sure what you meant by 'fixes tag'

I am surprised you don't know what a fixes tag is, feel like you've been
around long enough to encounter one! They look like Fixes: <hash> ("<shortlog>")
and there should be documentation on them at https://docs.kernel.org/process/submitting-patches.html#describe-changes

--ZAHNkK8r2FFtRP4y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6VOZAAKCRB4tDGHoIJi
0pKrAQC2mtE4yFa+MUhJ5WJQKEoJpd+IfARvyS9kAeYiyjEoywD/fzGCCma3iHW+
tDcrp6+1b01Z4Jk932CdnFtcgJnuKgw=
=g4l/
-----END PGP SIGNATURE-----

--ZAHNkK8r2FFtRP4y--
