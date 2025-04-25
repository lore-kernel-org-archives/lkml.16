Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714927483;
	Fri, 25 Apr 2025 02:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745546643; cv=none; b=PZFyygA1pNzm0kdv6y8uy6ehyjF7sxd+lmhMzr5imnl0epli06h+sqh0ujUIzO+LiZkI+G6kg2OQj46C8inGyuFYePGCDHrKrDXSvz26W99URd87J9rCxwokedNYvvfoiU4Fml3qcQP6a+Q1XZjnuumUyrMQG09iUT+8TKbvZuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745546643; c=relaxed/simple;
	bh=JJ8rxowVDQuzei/jFejrAlW4KLdrj6AXuBhBx69i6hE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZc+cEfSocTl0s+GmUQ2x9cO2Z8fiFfy2qOv5IihJpQa/FRR3P5k48+46U+EYFOU5ZWaGZigxomOfS8Ve1VPyAp2R75yyxZ4k6YY/s+Uqy7sujtRBACKO/6/9bZPhHrFsjdL4UiCVIFI/1tEV6rPAPyK4dhS/7GTpL4gTvIhoqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ozwY4w83; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ozwY4w83"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=A4Rq8oM0lfxwGxHCxGHz5nvQEWnfy10Mn/MUqJBAsDI=;
	b=ozwY4w83ev7WrpOBi/KKnBVlxt0eSYZGRLhNKOfKLpFjx4khFNj3Ruhu9OG77i
	MtkWK2jRqHjfGE8pTmrBJo75KbcWLjzfQ7SL6Y2FKg/AOue7urCWkDHFsmtAAlMW
	JebPiLShAF99fK3llREW7xanCG6IQYN1iS2j00WNFAb5Y=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCHhtVe7QpoHU_aAw--.28202S3;
	Fri, 25 Apr 2025 10:03:12 +0800 (CST)
Date: Fri, 25 Apr 2025 10:03:10 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 1/2] dt-bindings: arm: add MBa91xxCA Mainboard for
 TQMa93xxCA/LA SOM
Message-ID: <aArtXhus7Q+Qa+Wb@dragon>
References: <20250415125947.429121-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415125947.429121-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgCHhtVe7QpoHU_aAw--.28202S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU3YFADUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgQ6ZWgKtVvRfgAAsq

On Tue, Apr 15, 2025 at 02:59:44PM +0200, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> Add MBa91xxCA starterkit base board for TQMa93xxCA/LA SOM for
> parallel display evaluation.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!

