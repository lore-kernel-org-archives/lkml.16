Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5035F25761;
	Mon,  2 Jun 2025 04:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748837436; cv=none; b=Tz1Ra/0vQFVlcykir9d+0xxg+VOD4bDDXyI6TYbxfnScsXFaC8Y/vmP7eoxQqO4u7ZXiUcBXaOoc/IP04IlzdKrEXbClRE5hjSVTscshGQjV4pHd63lUgNBfc0qb/xPtY/eVzTHflp0F3/IbuRI8fMzGjJUQ2+uyVuA/U73GpWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748837436; c=relaxed/simple;
	bh=FyI94pFb6BLEkoTZEquPEmfGVXYRKJvASIgguB4Xhu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kCNu4RMUubVWusuKhoowFpwqlJyVXepY4OayKPJwP5Ayj7go+y6jXCBDqN7dJWsIWTdSSxm6IM9X4TJK1HiEpivWSmHXnq7LCCieie43so/YG96W6WWuqiHXHSTwIcMGaCd46CSCCEpKSXicozcB9m+JLwqOR+Y2zvPGO2BvPdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=OA/JTIcG; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="OA/JTIcG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=FyI94pFb6BLEkoTZEquPEmfGVXYRKJvASIgguB4Xhu0=;
	b=OA/JTIcGI8uPdANyH9q/94ex8Q9Rt1o+M/hc2kvDsWsnrXg0ALJGWCXPWZUF1K
	Jl1vgWFQJq/VvKd47/m4VnIoJAS1HznKfKRfw8jGRO9W1OEM0T4eIKvEz2gbJ//V
	omPNAlc+8Q3kwZ0/RwmiEkc+wjXa/rWO8E7LQCYxkzCEQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCnF_HeIz1odNx5Ag--.7355S3;
	Mon, 02 Jun 2025 12:09:04 +0800 (CST)
Date: Mon, 2 Jun 2025 12:09:02 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/6] bus: add driver for IMX AIPSTZ bridge
Message-ID: <aD0j3gXeD6Nn6L60@dragon>
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
 <20250415171919.5623-4-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415171919.5623-4-laurentiumihalcea111@gmail.com>
X-CM-TRANSID:Ms8vCgCnF_HeIz1odNx5Ag--.7355S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUnUUUUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNABqz2g9I+DgbwAA3I

On Tue, Apr 15, 2025 at 01:19:16PM -0400, Laurentiu Mihalcea wrote:
> Add driver for this IP. Since there's currently no framework for
> access controllers (and since there's currently no need for having
> flexibility w.r.t the configurations) all this driver does is it
> applies a relaxed, "default" configuration, in which all masters
> are trusted for R/W.

Just out of curiosity, is there any ongoing/planned effort about creating
a framework for access controllers at all?

Shawn

