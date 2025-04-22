Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFEC20D51E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316447; cv=none; b=qE95G4Qz9E6c6FearhxE5NyJlrHkK/1R+XFJRpfzjxj7wGXAzBRf5KTNM66D4INYgnRemOxvzCSYYs0I8iaawwx3SoUVXCP6hImDs3LuljPHkotyJcmzN4dkR7iqMimaa6mZGG4dBdZu6aIk0DyT6hRkjvzeE+Qbty+S61lG9Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316447; c=relaxed/simple;
	bh=HZBXPRHY3UE9SrReW3ywpmh7huR69l16j+Wq7+1X+gU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZXvPDK4QUCX6eAl4OJdqC2GroWc3cIRdmUjQZ6/ASVRIe9vmNP08NelUq5F6K3Hr44DAOc9NNXW4AoEngcR+DmYwiL7OOvDRIKRcMtWd3m6V0oEtReXpT4KOsm32Vh+DQr7+LkjkSfCtaTMhWnEKyU++T+qaMAfYCIgiX1DtbZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=c2fpnOGY; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="c2fpnOGY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=HZBXPRHY3UE9SrReW3ywpmh7huR69l16j+Wq7+1X+gU=; b=c2fpnOGYE9q/rLy/8Lg49CeLcs
	yW5x7DHAk16cRzODCRCE44mz+kR1zvcaepbBuPL+D1vkSM4/hI0NZXroFVxi1Qx+GB/EhJVNvqN22
	7h/E+BajWiUH125isixFu8bobNB/O6XZhVe+DWiojffWOgInZSA/uZf3epuUQpuRzYfJQuCnph9yD
	8RmWsXC5z8fCdlGkiecC4s5x1a37sm2ry3TUgI0JdrHr3kSllK+b0IfcWV14AVFuLkkIr6P7t83fw
	645Qniyv4R1rbSJS1zSHD9w95Ec2GVnkS5YJNDr7JhoPhxKMy7S+DITlWSvfH3kSvNvqywSzrVYzr
	7gDnMIAQ==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u7AXB-0001SH-2a; Tue, 22 Apr 2025 12:07:21 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 3/3] nvmem: rockchip-otp: Add support for rk3562
Date: Tue, 22 Apr 2025 12:07:20 +0200
Message-ID: <1834328.VLH7GnMWUR@diego>
In-Reply-To: <20250415103203.82972-4-kever.yang@rock-chips.com>
References:
 <20250415103203.82972-1-kever.yang@rock-chips.com>
 <20250415103203.82972-4-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 15. April 2025, 12:32:03 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Kever Yang:
> From: Finley Xiao <finley.xiao@rock-chips.com>
>=20
> This adds the necessary data for handling otp on the rk3562.
>=20
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


