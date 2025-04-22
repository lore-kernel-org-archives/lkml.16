Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82FA61A238F;
	Tue, 22 Apr 2025 02:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745288381; cv=none; b=ZQ3puURM6SbUakCcoc2CPTGIEAnQ0Ia42Pi9aWcYfoo9AFfSwZ+MH/Eb6p3mO0Pvl+28a6JIs4jJi7M7W5ahqaTZaV4QFQVrzJ+jYQT415QWvtnQyw2BeHI5yK7pd7GdlHvLjP/C64bpv2TWTq2J/EyddqFOArQUTtd1Zy+uu/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745288381; c=relaxed/simple;
	bh=iDOuuu4f0xgOSSnJHort7rH7kMsvAPBEkCfnsvXhdyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iq8upSVgXjfkCitbtUPyFSxLBSwgI9jvR4zJ3YwQx9L/wAvsfwfa0DkzSSd9F12d6RzwOVdBVVvBj3Dgz7lkr0WF6FvMZttF3eF/gB2AVy4l5TvQ84vRPShqI1E1y1uLCpdIQV6OP2QuqMUXpFVxiqroh2PMQWTMbPvKodl5nos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=hW/jlNO6; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="hW/jlNO6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=0lQKvbPMiWALaCoaAk+3P6t7pLtJ6dozAsI8r7sGWjA=;
	b=hW/jlNO6wHxTEEgecGmNw5P9lLV307K4he+I5ZGHFKHBmp6tQk4GuqIjGF+OSK
	9tVyVLzUWHxfpDwBwbttcj9I+4jOe66ci0GeNvk9vZ+tE8CxtHep9ENX+pf6rpEW
	hi6Yz/qrJABdtTEejn170UUlX+/458HPBrTkEUDlEKYUw=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAXlduS_AZoEu+7Aw--.31707S3;
	Tue, 22 Apr 2025 10:18:59 +0800 (CST)
Date: Tue, 22 Apr 2025 10:18:57 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Lucas Stach <l.stach@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp: configure GPU and NPU clocks in
 nominal DTSI
Message-ID: <aAb8kaw+hmEMnbi0@dragon>
References: <20250311-imx8m-clk-nominal-gpu-v1-1-78de5ea24c5d@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-imx8m-clk-nominal-gpu-v1-1-78de5ea24c5d@pengutronix.de>
X-CM-TRANSID:Ms8vCgAXlduS_AZoEu+7Aw--.31707S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFW3try7ArWUAr1xCFy5twb_yoWfGFc_uF
	13W3WUCw43KrsrCwnrXws5ZFZFgw4DCF4kAF9Iqr4fKrySqFW8u34kKr9YgFy8GanIqwnI
	934DXw48XryfujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8BBT5UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAQk3ZWgG3QyIpQABsJ

On Tue, Mar 11, 2025 at 08:41:12PM +0100, Ahmad Fatoum wrote:
> Commit 255fbd9eabe7 ("arm64: dts: imx8mp: Add optional nominal drive
> mode DTSI") added imx8mp-nominal.dtsi, which overrides all overdrive
> clock rates in imx8mp.dtsi to the nominal rates.
> 
> At the same time, commit 9f7595b3e5ae ("arm64: dts: imx8mp: configure
> GPU and NPU clocks to overdrive rate") went in, which changed some
> clock rates away from the nominal values.
> 
> Resolve the discrepancy by effectively reverting the changes in the
> latter commit inside imx8mp-nominal.dtsi. This is required for proper
> operation of the imx8mp-skov boards, which are currently
> imx8mp-nominal.dtsi's only users and lets all other boards that don't
> include it benefit from the new higher frequencies.
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Applied, thanks!

