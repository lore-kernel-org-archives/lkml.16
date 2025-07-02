Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0F9247297;
	Wed,  2 Jul 2025 09:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751449941; cv=none; b=YHYdD7TXyT9tZr7PSc2DDt3oiujfUdLMQRZ79180fzsmwmOhZ5+QoTmHedU5CZlDy13tS8KCWymKyd1Ty+UQHxVYxR5nMOAnxheIBZk16DhlAJH6SfJh22qNU1tESjdIjmFybrKf/u1N/0aJhZQ0nthu1u/UbI49KSrJ/0BW3Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751449941; c=relaxed/simple;
	bh=oMaM/R8SFUD4LZpCTkVpqQIRRfxIiZ6hh0W2t8wEReI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6WK+ZQNuDpjlm50PSgoGiRYQu032AN42zJnVXKC64Dfh11+xlPDg8Bk6P6yu/MqQ8ixCIYc8eqHJawVDZ/OYLeKyTk/Cy97O8D+l0nYEi9uMFa+bFj1p1/erePWZyFkNbBQvgMevPFqaaU4VcLtvPUkpP+Ro95ERkEX5wLz0JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=hGA4ZzeS; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="hGA4ZzeS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=aBCj5KCtd0YSw2+jeSI15O55rXmA7O2x9Co1/dUd/sc=;
	b=hGA4ZzeSjGnd+cybXPReqSh4PH2pwX4u9pKlm/oeOv8yq86qURfz/Xt1IbIZyB
	Wug27aAY1vskf6a32jw0WDNJ5T9BCynkbthhLJXmD+bMtuBff73qOYOmn4ZtmoUU
	FZPkgcuFdhBZ68eC8rvxcrf73iB7XMs/T8+kH/XsNtOuM=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXfxAkAWVoRbopAA--.51920S3;
	Wed, 02 Jul 2025 17:51:33 +0800 (CST)
Date: Wed, 2 Jul 2025 17:51:31 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	m.felsch@pengutronix.de, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 0/4] Increase i.MX8MP VPU
Message-ID: <aGUBIz1lYIkhMCWr@dragon>
References: <20250612003924.178251-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612003924.178251-1-aford173@gmail.com>
X-CM-TRANSID:Ms8vCgDXfxAkAWVoRbopAA--.51920S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF43CFyUCFy5Kr4UZFWkJFb_yoW3urc_C3
	4a9F1xCwn8KFs7Kw4DGan8Z3yDK3y2yr4DZa42qF4fZF1fZF4rZ340gr9avF18GF9akw1q
	vF98Xw4xAry3CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj7DGUUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNQa8ImhlASaNiAAA3C

On Wed, Jun 11, 2025 at 07:39:18PM -0500, Adam Ford wrote:
> Some of the VPU clocks are under rated, even for nominal ratings.
> Fix the nominial VPU clocks and clock parents, then introduce
> the overdrive clock rates.  The fluster scores don't change,
> but they do go faster.
> 
> This series was adapted from an RFC from Marco Felsch which
> was setup to introduce the VC8000E encoder and extacted the
> parts that affect the existing infrastructure.
> 
> V2:  The only change is 4/4.  Patches 1-3 are all unchanged.
> 
> Adam Ford (2):
>   arm64: dts: imx8mp-nominal: Explicitly configure nominal VPU clocks
>   arm64: dts: imx8mp: Configure VPU clocks for overdrive
> 
> Marco Felsch (2):
>   arm64: dts: imx8mp: drop gpcv2 vpu power-domains and clocks
>   arm64: dts: imx8mp: fix VPU_BUS clock setting

Applied all, thanks!

