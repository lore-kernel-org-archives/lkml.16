Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0C3225760;
	Thu, 12 Jun 2025 08:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749716098; cv=none; b=K0xteUUTB+duH8IpGRrc/+iB6UqPWNzn1IiQePx2af+rKDfP2XsvAQch31s0nnYdJitAEM34+Ij3gZjp1NancD7cD/MeLr8nBe0o2FojoHjdXLRBPEmbjT+ACC4LAk6PnfoDlWjGGflnLaH8UVlSOrMFfCUqhbW96gnvxl48RMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749716098; c=relaxed/simple;
	bh=E999MkY8G16mdwr3lLoy0otT7vL7jN3SWws9GQ/x3T4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DwsO74BSidaaqsZEFBwE0w85j44YQddEQvnj/Xars4wIqe+fG49B6iMk1jRnYhF25TmYn+E2dL0/gj9W1CCxQLZKVAWEADgvsZCbtA2mtnQa1NBfRmb56/C+4Ze+77tj51vFfern6MbZ3Gc9vbD+r+gY0A6lynHCU/rkVViJP60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=FxmvYO5B; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="FxmvYO5B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=P7bmc/TE0Cpmjx2x5BymBb3H3wO3D26PuXJn/y60y30=;
	b=FxmvYO5BUUaj0e1z5HGfnvzp5/hgUVUvFFvanXs5cXQ8s9cElDxNtDWOQFxXFg
	iDXw2D+qYpVfPsHQ0vy4I7V0PnCG70REWrivS8gGtGlzSVv+RUY1cBA/bixbaiC1
	v889CBqgeiviCDkEKQQ+Pnn7qXqnZMf9tlwYMDdH6rUp8=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD31+1JjEpoEXJ+AA--.15796S3;
	Thu, 12 Jun 2025 16:14:03 +0800 (CST)
Date: Thu, 12 Jun 2025 16:14:00 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v17 0/7] firmware: imx: driver for NXP secure-enclave
Message-ID: <aEqMSG8k+NpQ7ROH@dragon>
References: <20250426-imx-se-if-v17-0-0c85155a50d1@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426-imx-se-if-v17-0-0c85155a50d1@nxp.com>
X-CM-TRANSID:Ms8vCgD31+1JjEpoEXJ+AA--.15796S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYJPEUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgJqZWhKSSr63AAAs4

Hi Pankaj,

On Sat, Apr 26, 2025 at 12:31:31AM +0530, Pankaj Gupta wrote:
> Testing
> - make CHECK_DTBS=y freescale/imx8ulp-evk.dtb;
> - make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8  dt_binding_check DT_SCHEMA_FILES=fsl,imx-se.yaml
> - make C=1 CHECK=scripts/coccicheck drivers/firmware/imx/*.* W=1 > r.txt
> - ./scripts/checkpatch.pl --git <>..HEAD
> - Tested the Image and .dtb, on the i.MX8ULP.

I have an i.MX93 EVK board.  Do you have some guide that I can follow
to test the driver function properly?

Shawn

