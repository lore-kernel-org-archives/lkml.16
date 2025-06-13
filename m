Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53261155725;
	Fri, 13 Jun 2025 01:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749778973; cv=none; b=ZD/kIuE4GB8B6S/n5jgixhweT7EItDhYoGtIY0PNK4W/o5mCqiobop3H2Z5WP6fpN+Y91hDx0jeO+E8pyo3jrZnTt/hvz8We7EQxI59Q3K2mFp0z/5JGivRYmMs4PrmvXnsIBCST0IRzMOr4vZwsJvaCD4ZfK4zJinsagIQjqng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749778973; c=relaxed/simple;
	bh=tLzU6/YncIma45YYmBLecwFz7bOFDq/gxS/2axTLZGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=He27zTqpJwQrsR28a48ICv6jCRK2wSrrBMjFZBIbWxrFpkh43WZFO3Nbw4GoECQH62bW/gILleph4cji2FMOouYpVVXFY0RnJ9VhfsybH94PLM3NkNWGDqZ8IzX9LtQhhskP1oQK4zAsxb1sQ45giulz8byKqXo7rPRnvmNVGFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=SAVjJQ1t; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="SAVjJQ1t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=/YsHuhFMK2Ld2dcwyKaSNTxrpFLRS6RlejH9OKuA/eg=;
	b=SAVjJQ1tBeMju1DMkOjVOy3pjosvQPsZfbFEAOZx+cRnHqbiV+y/m5pO4OxLBV
	G8Nw9FA5TsCVis34LPiCVD8CMgMUik8JTZdO0itfFjPzed0H0d1atWHwkYh6IUN5
	HqIRZMHCI6T7PUoopJlJ8hz5+ktjf8ZeAYGRcn06R5dBU=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3nzvWgUtoaZmIAA--.34451S3;
	Fri, 13 Jun 2025 09:41:44 +0800 (CST)
Date: Fri, 13 Jun 2025 09:41:42 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Frank Li <frank.li@nxp.com>
Subject: Re: [EXT] Re: [PATCH v17 0/7] firmware: imx: driver for NXP
 secure-enclave
Message-ID: <aEuB1qgd6aVl0i7i@dragon>
References: <20250426-imx-se-if-v17-0-0c85155a50d1@nxp.com>
 <aEqMSG8k+NpQ7ROH@dragon>
 <AM9PR04MB86048A698B03E974CFD3DB489574A@AM9PR04MB8604.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM9PR04MB86048A698B03E974CFD3DB489574A@AM9PR04MB8604.eurprd04.prod.outlook.com>
X-CM-TRANSID:M88vCgD3nzvWgUtoaZmIAA--.34451S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYJPEUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwVrZWhLXLObUwAAsE

On Thu, Jun 12, 2025 at 09:42:46AM +0000, Pankaj Gupta wrote:
> Hi Shawn,
> 
> To test it on MX93, you need additional patches on top of these.
> 
> The plan was to send the next patch-set to enable the support for MX93, once
> these got merged.
> 
> If you suggest, I can share the patche-set to enable MX93, as an attachment
> to you only.

Yes, please.  I would like to test the driver before it gets merged,
thanks!

Shawn

