Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DE7271A7C;
	Tue,  1 Jul 2025 14:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751379472; cv=none; b=fZJSA7HI/3iCyUbRIR73B1b2dbN2rl1TV54uAReYDEj4m4ycY6LVdM9b4qkMtx9/0b8nFNQ64HZs7l5SUEOS/hqqwlyVM0znvE3jQ2dQzD1Ssm9YwiKEElToItQhxx61MXhpziNRHOSVQVmo6Frpn2cF+eu9rD9sY4kJrVSwT6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751379472; c=relaxed/simple;
	bh=H+d8K1h3HHkTY/7w00DJUJUkTQbVdJUWWJhS4HtXAzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMV1LBaFjrjzFJ6gJ0vx7Lv/KVMPj0e9qyDryKNpghhOXA75cpa1qIxRFB2nC29Di+oKj8cXdSULZISz1X66rEYMfev3uy3OZG+Ap83WLHaeJnRXzewFkltiNFVHh53icfVyHeZ53zTvfcS2IKPmkXpHwrpK0KGxjbV/8Xp8Fhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=TbhgpTn6; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="TbhgpTn6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=p26k3iNBH6NEFpUE2GR2mYl5kAA+PXFhcjSGL4mCfPA=;
	b=TbhgpTn6hdC1rodjsefbUOg8xgpuZ6gyHHbF7NXNUo92APh/KWd1H2pZp/svIw
	i5RIjX67k8zYHGgNq6g2uzycNnJ0tTxfOqD7E6CMJcm8J1Cmur0DoBbuwYy39JGY
	hn5bUFQ3+sJ9nzD51RTrnOUiMvqZ4v1+HGOmS+xama+/M=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3V+bs7WNozMcBAA--.4462S3;
	Tue, 01 Jul 2025 22:17:18 +0800 (CST)
Date: Tue, 1 Jul 2025 22:17:16 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/6] arm64: dts: imx93-9x9-qsb: add IMU sensor support
Message-ID: <aGPt7Cs2jrGDAZ/m@dragon>
References: <20250609165237.1617560-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609165237.1617560-1-Frank.Li@nxp.com>
X-CM-TRANSID:M88vCgD3V+bs7WNozMcBAA--.4462S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUoYLvDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNA6pD2hj7e6qGAAA3m

On Mon, Jun 09, 2025 at 12:52:32PM -0400, Frank Li wrote:
> From: Haibo Chen <haibo.chen@nxp.com>
> 
> The i.MX93 9x9 qsb has a ST LSM6DSO connected to I2C, which a is 6-axis
> IMU (inertial measurement unit = accelerometer & gyroscope). So add the
> missing parts to the DTS file.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied all, thanks!

