Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D921717FAC2;
	Thu, 24 Apr 2025 13:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745503103; cv=none; b=g4HKNaWQT4Arqziw8c8ov1bqsFCx4AH7Gk/LjPi5nQCt8RyPM5HZblFEQbFkkUhkM7EwbsNPc+veis23Xq7YvfleMjbiUqmmdTIlW7hQt+88ynvumkHlb6C6IhcP7LhpwzOQF0dWN5Z7Ad0aBYbWUNq3/vJ0vTryCaU1ND01AD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745503103; c=relaxed/simple;
	bh=uVSxY822Rea4tkAmQlq7O+vfDd2OfqMavnTSirvBBmg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ln5gPBMcn52y1aiTtCZh3BOl9Bxv1aM4DX/ndt1k0oC9Cv0d09f1J+C1jKEFl7jjRGki+mEhPz1C//wN+pciTo5F7B3GupI4PHqtKoFosoCiyhOFdgetaWMT0YNieBbBlzuiAtmwB0wlf0oJFDorEjh2L5t4lDe5HIk3PFIhvkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BfopJUu4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BfopJUu4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84109C4CEE3;
	Thu, 24 Apr 2025 13:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745503102;
	bh=uVSxY822Rea4tkAmQlq7O+vfDd2OfqMavnTSirvBBmg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BfopJUu4/5VDAMEZhmVVqp0+Z8UYrgjZkfU0/+JvqdQi6jVenD4/rjhe6tUlka9+g
	 X+QFtultyrbN8O0+FYqKnxZY80u+GreYihCpxrqhJwD/IFqeQDIkbpYx20FB2CaZLW
	 LU5fGkrP79zFQbqa2pMDBLhHcSt8jVl/CbdXpbNEn6gZ5RvBvs3Zt7EeVykKkndED0
	 yY/DWMcqG5GqmXMi9QL9i68Aohe8JCoMT4XLhz5TzJ5TJ0qsgg7UWph0ugzlBrM2ty
	 eIoUrZp5T2XEmnHDhXNS2yDE9Ns8piKZuTi3SVxyVjWgY13mtdO8wRIoJSy8nqrVyT
	 wEgtFg09x9UIQ==
From: Lee Jones <lee@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <cover.1744090658.git.mazziesaccount@gmail.com>
References: <cover.1744090658.git.mazziesaccount@gmail.com>
Subject: Re: [PATCH v3 00/14] Support ROHM Scalable PMIC family
Message-Id: <174550310025.1376894.8036030194609947768.b4-ty@kernel.org>
Date: Thu, 24 Apr 2025 14:58:20 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Tue, 08 Apr 2025 11:40:24 +0300, Matti Vaittinen wrote:
> Support ROHM BD96802, BD96805 and BD96806 PMICs
> 
> The ROHM BD96801 [1] and BD96805 [2] are almost identical PMICs what comes
> to the digital interface. Main difference is voltage tuning range.
> Supporting BD96805 with BD96801 drivers is mostly just a matter of being
> able to differentiate the PMICs (done based on the devicetree
> compatible) and then providing separate voltage tables.
> 
> [...]

Applied, thanks!

[01/14] dt-bindings: regulator: Add ROHM BD96802 PMIC
        commit: 9effbfda6bfd677042434722a9c2f2e17d261dce
[02/14] dt-bindings: mfd: Add ROHM BD96802 PMIC
        commit: 9d851b2e016a13b0a673503f5600315b6601e025
[03/14] dt-bindings: mfd: bd96801: Add ROHM BD96805
        commit: d5a30228b6fa86cf841d8c12af0025c0bacb90fb
[04/14] dt-bindings: mfd: bd96802: Add ROHM BD96806
        commit: 82c218969eb0ec989d8e049878fd3d6a97ccd8ba
[05/14] mfd: rohm-bd96801: Add chip info
        commit: 7289d96ba557fb5e0a90813b7e24f3815127d14d
[06/14] mfd: bd96801: Drop IC name from the regulator IRQ resources
        commit: d082571fca4d1db5642ad4436cef22d65bfe4153
[07/14] regulator: bd96801: Drop IC name from the IRQ resources
        commit: 9cc957546e3865bc3adfd39ceeedc8074521024d
[08/14] mfd: rohm-bd96801: Support ROHM BD96802
        commit: 4094040b1a133206ed893da2cf5e17cc22f7ca7c
[09/14] regulator: bd96801: Support ROHM BD96802
        commit: 55606b9b20639b634560f44a070ff6153b59b557
[10/14] mfd: bd96801: Support ROHM BD96805
        commit: 6a309b489215f705c20cb4ed7f85d9c16f768e55
[11/14] regulator: bd96801: Support ROHM BD96805 PMIC
        commit: 7baf818d0d90e00c0688d8156bc7d9d1d1ee1dbb
[12/14] mfd: bd96801: Support ROHM BD96806
        commit: fecc18a9f59ce9c36eb3622ae77bff5fa5c6d976
[13/14] regulator: bd96801: Support ROHM BD96806 PMIC
        commit: 956e9363c8230a0dc9a83cf5de61200206a9154b
[14/14] MAINTAINERS: Add BD96802 specific header
        commit: 5d61bb1675ff7662f519ca203b1f8cdc455b9df4

--
Lee Jones [李琼斯]

