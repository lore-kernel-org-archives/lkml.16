Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797DA1624E9;
	Thu, 24 Apr 2025 13:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745503162; cv=none; b=tQw3Ec8I9oblJe9n7SU1W+SY3qM26J+HZu7tjcckASQCmlk7zNkE6zWtWDxYsvb7knPoYOTi2a5yoI42vC4s/vy2ympya5JqjwU8oj3oE+kFPKQSqNdhsZqcHJ1cbXa4F1osHNzwtCg/Wa0d8lH3aX1dMHQGArcRtHmupu4vgfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745503162; c=relaxed/simple;
	bh=LNLq2jrp4jXlFBRNH5jwTRErjxa45lXvpbgHWUlUUnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBckkREA+O7TVNDC1GVwAWPSWLU6ngFXnFgjjJ55ZTlZlARXxAqr9IDjCQ2snun+RdU7T0BRBfZsqH1ca8m+3eL8FuzYiQ52UKdlr/aLXFnJote7LoRJYp9hbvI8UOivWo6VX9MiOe5Hi33J+XgIOyxZFS4pMuvpWaPaaKkhJpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=otsFosfv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="otsFosfv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 262D1C4CEE8;
	Thu, 24 Apr 2025 13:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745503161;
	bh=LNLq2jrp4jXlFBRNH5jwTRErjxa45lXvpbgHWUlUUnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=otsFosfvFeOs4ffJAiNGc2f9ljrrjnN6Zjm464szwbsI6Yfn+3D0EfDjdC3zshhY/
	 EQeYcH1X0zNQ/QfalSb+uJYkZXJb1p/TMOLB4JsvOaQKMVPssARDBPGyAofQQwISfy
	 eqcwj7aWiKmpuveh9Xor17xusoHadU2KGkuASbzJybwNYyg2sEmWnzEAjblpYUC87C
	 KsPPGLu+qqnufB979pZmlQJU13GyfCEbCN7LsuSYyAIbM8atBEp6rEQE87cozYGmOP
	 EYmwMgP19x5fDPyYN1C8bwcCuWRMoJ2WUuKuRmk0/fvPg1k08sC8IY4L5QWYCjFYZG
	 29fqA4wz9OmCA==
Date: Thu, 24 Apr 2025 14:59:17 +0100
From: Lee Jones <lee@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/14] Support ROHM Scalable PMIC family
Message-ID: <20250424135917.GE8734@google.com>
References: <cover.1744090658.git.mazziesaccount@gmail.com>
 <174550310025.1376894.8036030194609947768.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174550310025.1376894.8036030194609947768.b4-ty@kernel.org>

On Thu, 24 Apr 2025, Lee Jones wrote:

> On Tue, 08 Apr 2025 11:40:24 +0300, Matti Vaittinen wrote:
> > Support ROHM BD96802, BD96805 and BD96806 PMICs
> > 
> > The ROHM BD96801 [1] and BD96805 [2] are almost identical PMICs what comes
> > to the digital interface. Main difference is voltage tuning range.
> > Supporting BD96805 with BD96801 drivers is mostly just a matter of being
> > able to differentiate the PMICs (done based on the devicetree
> > compatible) and then providing separate voltage tables.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [01/14] dt-bindings: regulator: Add ROHM BD96802 PMIC
>         commit: 9effbfda6bfd677042434722a9c2f2e17d261dce
> [02/14] dt-bindings: mfd: Add ROHM BD96802 PMIC
>         commit: 9d851b2e016a13b0a673503f5600315b6601e025
> [03/14] dt-bindings: mfd: bd96801: Add ROHM BD96805
>         commit: d5a30228b6fa86cf841d8c12af0025c0bacb90fb
> [04/14] dt-bindings: mfd: bd96802: Add ROHM BD96806
>         commit: 82c218969eb0ec989d8e049878fd3d6a97ccd8ba
> [05/14] mfd: rohm-bd96801: Add chip info
>         commit: 7289d96ba557fb5e0a90813b7e24f3815127d14d
> [06/14] mfd: bd96801: Drop IC name from the regulator IRQ resources
>         commit: d082571fca4d1db5642ad4436cef22d65bfe4153
> [07/14] regulator: bd96801: Drop IC name from the IRQ resources
>         commit: 9cc957546e3865bc3adfd39ceeedc8074521024d
> [08/14] mfd: rohm-bd96801: Support ROHM BD96802
>         commit: 4094040b1a133206ed893da2cf5e17cc22f7ca7c
> [09/14] regulator: bd96801: Support ROHM BD96802
>         commit: 55606b9b20639b634560f44a070ff6153b59b557
> [10/14] mfd: bd96801: Support ROHM BD96805
>         commit: 6a309b489215f705c20cb4ed7f85d9c16f768e55
> [11/14] regulator: bd96801: Support ROHM BD96805 PMIC
>         commit: 7baf818d0d90e00c0688d8156bc7d9d1d1ee1dbb
> [12/14] mfd: bd96801: Support ROHM BD96806
>         commit: fecc18a9f59ce9c36eb3622ae77bff5fa5c6d976
> [13/14] regulator: bd96801: Support ROHM BD96806 PMIC
>         commit: 956e9363c8230a0dc9a83cf5de61200206a9154b
> [14/14] MAINTAINERS: Add BD96802 specific header
>         commit: 5d61bb1675ff7662f519ca203b1f8cdc455b9df4

Submitted for build testing.  Once they've passed, I'll submit a PR.

Note to self: ib-mfd-regulator-6.16

-- 
Lee Jones [李琼斯]
