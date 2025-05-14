Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB8127A918;
	Wed, 14 May 2025 11:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222659; cv=none; b=n9FEuYlZCtIYRSexzZ5v3k+6Ox6PUk2lxfABDX7oiDI2hVz8HkZlbktcpeT6P5YqQPzO3/VK1C2cJ3V056490AiCgZk/ofUnf6KbtZOwF4ftsM/5qlzDqE8n5sRWqz1ampiAnaRWaIeQ3DucyEbK1F20IWPa6yAr+VIYqzWHD/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222659; c=relaxed/simple;
	bh=PIe7R02ZRUfkyIGks0BCtEM0QJgK8//iDeGDTITbzGg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rPE9EdaWh7iGFOwMekRV60dnn4NjMYjkElCf+gpGHO3rXPBmN5mWUsptgBXebm5XsSSS2LLvvL06NL9IiXhsuqQ0D6sGqBVmxfRjpBl4huwIr0CyB4fVa31HwWs8bRgEiWn1flkqIOGAQWl642/4yhi8BxlqwcaaRaUoj+dcgno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2sECodp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2sECodp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC204C4CEEB;
	Wed, 14 May 2025 11:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222658;
	bh=PIe7R02ZRUfkyIGks0BCtEM0QJgK8//iDeGDTITbzGg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S2sECodpkb/8puFcDPG/SZLY/CP4xmgyZtTWxLMnuE3AMYmCVp93ZEDSaZ4DzWzh3
	 bGnfA0luZMHA5DM0R+I3nWIeOQqPP1hExCq1mfPzsYp3B+tiSNngDskPSUzDqX/pzd
	 E4jg23q/Mx4ZTAZm8mDmiaIK9GGQajbMVVOcNglj66mTkgDUvoLKMV2opCfjBJ0yaS
	 J7fYZRTSwF2xSpOKcEReH+uRKpFHpFK5BOiOeRBAK+xene91IDcjBKugENhcMQ54fi
	 O6INyyNye5cg9mxYCdf37XnDdjSOriqX3Nvf1+6dt1KdM6SUc/CERDzMshTe71Oz8H
	 FwCKTPUY706nQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250429090152.1094243-1-alexander.stein@ew.tq-group.com>
References: <20250429090152.1094243-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] phy: freescale: imx8m-pcie: Simplify with
 dev_err_probe()
Message-Id: <174722265646.85510.13417598033555165566.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:37:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 29 Apr 2025 11:01:52 +0200, Alexander Stein wrote:
> Error handling in probe() can be a bit simpler with dev_err_probe().
> 
> 

Applied, thanks!

[1/1] phy: freescale: imx8m-pcie: Simplify with dev_err_probe()
      commit: 74c2524a51ab7a0539eb5ec64ee594c981f3d8a0

Best regards,
-- 
~Vinod


