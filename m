Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60ED423D2B8;
	Wed,  2 Jul 2025 10:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451024; cv=none; b=dGqIyU/fQLgU1+eSimx14dqXD6QhvrgVkei1TLTDJPT/nrv5MwCHEz5s0B8Q9dPjpOhMUL89PzKblRPePySUrjpUtO/3dKH7VfCFGdzqttjU9cpTJcDG5WINoHvHbHbr4XyYOpGRswDxOK7T0SjT6PdcWbMkKp/Q//JzStn0Xa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451024; c=relaxed/simple;
	bh=Avn8QZ56tvBOvMTNHEQSyXrUuokZ4oLrcdRoo87bmq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7+pKnRDhj/5zZB7IBWDu3TkrmNUTBb3cVNFLe4mU1p7obrvXUD18DqFVZXaxELbIACE4+LoxP3PAFgIn2hRjj41W/CYAePBFGjoW40vSGdxZ/btU3Whg5qQ/BmhfCkz1z3MvGqM3L/YKVwNlInqiatJR4GUFO9pRkK+vdup6wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ivh1EUqD; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ivh1EUqD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=0szaTJk/2IIh92wT4SYepDsVV45HTf6oeyD1uk5eFNE=;
	b=ivh1EUqD5vaLYJTdTkbxM/9LL+gDCtSiyyqjWax7fZYIWhMFfOk6AVZ1AxETZ/
	Zrstmc87LCEp+hHlA6MTYt8Q2sYASbKCJdqtJvc/VTz1Ek6/RJ4SUElNo5MHOdHz
	AzLaeoJ+jQhKglV+oyZezn1C3R5EgsFHgjqp5yd454e4s=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD39w9aBWVoE_ApAA--.52421S3;
	Wed, 02 Jul 2025 18:09:32 +0800 (CST)
Date: Wed, 2 Jul 2025 18:09:30 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: =?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>
Subject: Re: [PATCH] arm64: dts: freescale: imx8mp-toradex-smarc: add fan
 cooling levels
Message-ID: <aGUFWiXuJ514HlDV@dragon>
References: <20250613-tdx-smarc-imx8mp-fan-cooling-level-v1-1-59aae8fee2db@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613-tdx-smarc-imx8mp-fan-cooling-level-v1-1-59aae8fee2db@toradex.com>
X-CM-TRANSID:Ms8vCgD39w9aBWVoE_ApAA--.52421S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYZ2-UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRl+ZWhk3iqGNwAAsC

On Fri, Jun 13, 2025 at 01:35:04PM -0300, João Paulo Gonçalves wrote:
> From: João Paulo Gonçalves <joao.goncalves@toradex.com>
> 
> The fan controller on this board cannot work in automatic mode, and
> requires software control, the reason is that it has no temperature
> sensor connected.
> 
> Given that this board is a development kit and does not have any
> specific fan, add a default single cooling level that would enable the
> fan to spin with a 100% duty cycle, enabling a safe default.
> 
> Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>

Applied, thanks!

