Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785F3AD51
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 21:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746306449; cv=none; b=NriUO+nxrytp0MwNgsNcZD5sDhuRtSceTp/BWU2eEqnVzyJjvKaLUrrQghK6OQiebKtuvubWv24fsnjdBk6sIsXIEjZScJZLl4pEAMDg3Gg2sD2aSiBJmHpXYqTS8GKFGJm11qcl4hVytAIZcbSDGFA5034XEH526Gobs0MdWTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746306449; c=relaxed/simple;
	bh=gfWWm3z37dZisjAhfUtOyczLf2I0pzV8I3To02hyM8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J3w/y9GMxYaTpKOPAb0YTv7+czOaS2bngmzGCHC7EsUJ4AZx4J1qIxzic5TKH7vqTy1QcFur6gSqh/8cDknvEHe3Mm1ru+eLOIH8QS10iODo5S1x8v35M2AyTb32zJqnUlPeuww3Iaq40yLkgQcsKCvXeLoAFtTg9T5K83f2pS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=VCqgJIU9; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="VCqgJIU9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=gfWWm3z37dZisjAhfUtOyczLf2I0pzV8I3To02hyM8E=; b=VCqgJIU9EBQPWMZK9lEHQgSI+P
	LtwO/bRD4Y1+XxiS2+1jW+1/V1C4k/GUp/zaYDzUPE2AImcW6yIk7TlY/yke1gjkn/Dl/yXDECxBo
	lYvmNMuyY0iOVUSQUOYdAW+02qG/sqstcoXmP+d3KSuj0rLIQuFRL8uC/5D9Hjk0MsggQS59p04Np
	rAk39KqfUjvv/0ViLIw+GbqcSTvHO93XqleZSCNb8rAvv6yJfscjwqf/vBvFhXPd+c1QWbVbQaH/o
	ND8BZV/O719M9S/pol8RYs1xaHs4KzmH2EQu0HBocEJ33btfbv2oPQQSXh+jP2YbyHtdy6CZ/qd5E
	DpKhBttw==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBK4r-0002b2-EY; Sat, 03 May 2025 23:07:17 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: mripard@kernel.org, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] drm/rockchip: rk3066_hdmi: switch to drm bridge
Date: Sat, 03 May 2025 23:07:16 +0200
Message-ID: <14210550.RDIVbhacDa@diego>
In-Reply-To: <20250428102309.1501986-1-andyshrk@163.com>
References: <20250428102309.1501986-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Montag, 28. April 2025, 12:23:07 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> Convert it to drm bridge driver, it will be convenient for us to
> migrate the connector part to the display driver later.
>=20
> Note: I don't have the hardware to test this driver, so for now
> I can only do the compilation test.
>=20
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

Tested-by: Heiko Stuebner <heiko@sntech.de> #rk3066-marsboard

Will hopefully get to applying it tomorrow.

Thanks for that nice cleanup
Heiko


