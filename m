Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B90EBA45;
	Fri,  2 May 2025 07:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746172068; cv=none; b=kjXVrbSOmtXaxCeuFR+m//RA2FXVNLqUe6y9IEsQMfgBzROHrl2Jf0YSYLugDYGDpGr10uhNoCIoARacJ//aigR1GfhKJkyk3grQ8FdctahblN9iBSipgk1O7H8uwzKcBBVBF3Dwp0YOCVNCrAqnyTUdOy7qSiXYANSMW9jQB5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746172068; c=relaxed/simple;
	bh=12fU6nHdcWEJMliTffLzTURN5ljUvBtc8NTjS3gHJ9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyYFJXpEkGx7jiG+lppZX5CuJiJDUAJF9V/MwDnhnaCu1GzcdbSQ1ZhyuknjB0Lcu6ZvzdqPoDSkq6kRDLGLT566jJJJyElxMLHsvY2BAPn/IPZC/5riUFKS3z769Y+6w0L+Cr6lOPwJz8I6XA2zkSBBLGGsK0rL/Xl1iv5CKOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QguFhDS1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QguFhDS1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28025C4CEE9;
	Fri,  2 May 2025 07:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746172068;
	bh=12fU6nHdcWEJMliTffLzTURN5ljUvBtc8NTjS3gHJ9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QguFhDS1SijzgZrzOMhZv+RnKjscPHxDjWyKHP7eGRatpefK76S/jI/5Ez6Rwzv4l
	 88J/mvWRPCoPY7XFAh5JVhjWE20ok2CvkMDOWYP9cwdObPJ46SISahG8U+sogHhNE2
	 xBEITy1y7BIU9OGYqmJSJi34BpI6nI2FUGalfOP1YluWa3gk4lWScFdAKAkJT178qg
	 u95ttLilCwnL4/oMWEykE7e65kBwUWewZ4rZ2s5+Ng1o0ZcMggWS4aXwAGf1xSkl+B
	 xd3PJ3wOje53Cghkinm/8kfv3BE/JaVZsEMnF720+XVMc4+lQ0L336wY7yETDc1AFr
	 8/KCx5fJc955g==
Date: Fri, 2 May 2025 08:47:43 +0100
From: Lee Jones <lee@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Immutable branch between MFD and Regulator due for the
 v6.16 merge window
Message-ID: <20250502074743.GC3865826@google.com>
References: <cover.1744090658.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1744090658.git.mazziesaccount@gmail.com>

Enjoy!

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-regulator-v6.16

for you to fetch changes up to 5d61bb1675ff7662f519ca203b1f8cdc455b9df4:

  MAINTAINERS: Add BD96802 specific header (2025-04-24 14:53:20 +0100)

----------------------------------------------------------------
Immutable branch between MFD and Regulator due for the v6.16 merge window

----------------------------------------------------------------
Matti Vaittinen (14):
      dt-bindings: regulator: Add ROHM BD96802 PMIC
      dt-bindings: mfd: Add ROHM BD96802 PMIC
      dt-bindings: mfd: bd96801: Add ROHM BD96805
      dt-bindings: mfd: bd96802: Add ROHM BD96806
      mfd: rohm-bd96801: Add chip info
      mfd: bd96801: Drop IC name from the regulator IRQ resources
      regulator: bd96801: Drop IC name from the IRQ resources
      mfd: rohm-bd96801: Support ROHM BD96802
      regulator: bd96801: Support ROHM BD96802
      mfd: bd96801: Support ROHM BD96805
      regulator: bd96801: Support ROHM BD96805 PMIC
      mfd: bd96801: Support ROHM BD96806
      regulator: bd96801: Support ROHM BD96806 PMIC
      MAINTAINERS: Add BD96802 specific header

 .../devicetree/bindings/mfd/rohm,bd96801-pmic.yaml |  10 +-
 .../devicetree/bindings/mfd/rohm,bd96802-pmic.yaml | 101 ++++
 .../bindings/regulator/rohm,bd96802-regulator.yaml |  44 ++
 MAINTAINERS                                        |   1 +
 drivers/mfd/rohm-bd96801.c                         | 565 ++++++++++++++++-----
 drivers/regulator/bd96801-regulator.c              | 455 +++++++++++++++--
 include/linux/mfd/rohm-bd96801.h                   |   2 +
 include/linux/mfd/rohm-bd96802.h                   |  74 +++
 include/linux/mfd/rohm-generic.h                   |   3 +
 9 files changed, 1073 insertions(+), 182 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd96802-pmic.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd96802-regulator.yaml
 create mode 100644 include/linux/mfd/rohm-bd96802.h

-- 
Lee Jones [李琼斯]
