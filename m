Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C95C28F521;
	Fri,  9 May 2025 10:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746785611; cv=none; b=KLoesT4/RH2cAaltZdjubx8IqAm9tj0BNUS2pJxwgbImfZNUvYCiIAKvweorh/uALJjrKjOBHXZeytKht05PlR7fGLJztPOiBpkC5ka9h0rqVNIKC0JXIoXbTfmh+tMICI3F9x83jkVn3BTWZswz4TElwYdkIhCEJwrcoFWlaB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746785611; c=relaxed/simple;
	bh=i2ouzxQBdefH+i2o/XeUfGDkchgNAn5bKFkd/HjKI2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SiCZIjtGmBPj7Nn9vagMleHgboWdj/Ls3ofH0ucyTlS/C8LI8IMpC56jUOd4BII0oB6YfStwRrevH8HqhvfZLiApnKGfEfJ0avtQXjQYV3Q0N0WKu3SF+Y7NtCj2uMcKHPiaCR9K9DUZW2e/s60Dk/vl3/I4SN76h+vl2Oz9D8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=SwAlCaBP; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="SwAlCaBP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Kze5h2h8k5Lwn+zJ0PPawJ/lXrKJAnhMldQ/t7GAho4=;
	b=SwAlCaBP9h8HzTJ+rkN9kQAdcr9cesJouIrJL/OQUnI2sWb4c7LFkfo2iTPO71
	cIiskaZwkRrysvrtWzCk5QQs/brJpTlAoZZ9V32z/PJdEzys4xUKuheRZhUMs5sk
	dab8ZaIZT07kX0bdv/28nkjbRON7kaqJH95TYHnROCYyo=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD35_4l1R1oPKqnAA--.56775S3;
	Fri, 09 May 2025 18:12:54 +0800 (CST)
Date: Fri, 9 May 2025 18:12:52 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: max.oss.09@gmail.com
Cc: max.krummenacher@toradex.com, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: imx8-colibri: Add PCIe support
Message-ID: <aB3VJOWagJEF2xbB@dragon>
References: <20250422115051.1867349-1-max.oss.09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422115051.1867349-1-max.oss.09@gmail.com>
X-CM-TRANSID:Mc8vCgD35_4l1R1oPKqnAA--.56775S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUza9aUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAR9IZWgduGdwKwAAsC

On Tue, Apr 22, 2025 at 01:50:49PM +0200, max.oss.09@gmail.com wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> The needed drivers to support PCIe for i.MX 8QXP have been
> added.
> Configure PCIe for the Colibri iMX8X SoM.
> 
> The pcieb block is connected to the on module Wi-Fi/BT module.
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

Applied, thanks!

