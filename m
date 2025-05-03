Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8625BD529;
	Sat,  3 May 2025 15:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746285639; cv=none; b=eXH7DLjQgLpkQVZylc8v8mePsvD+csDAy35TlROSQ54ZLKXZjer33RoFf7+fug3oWtaq1VWKfKGs7JHQG3D6k65sLAgITnAYDUcLv+YNgaC99fuUynGLC9PEso81Lrqg15LN7qhCvPO/hYlsmoWAHQZcGyPd/MzEjqznSb4ig+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746285639; c=relaxed/simple;
	bh=WnOwiAbTOzs90jSrXC5bZ9hiEklBZ9dGAADpnd5Evoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C05B/7y0ifyR5QDS9fKcdlpb9/xyQmrBS1lyt1r4JIJosO49K6vhTuriaVVMdhrVHo3F90+HI541q3/hf01+zjzCVDUikSc2mC52Urpo96lNA4/HUqOqzEHUQHPLysC3QkJ4TI0IRGdmssjYKWH/xyFFam/sX9etTySvke1E6EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=OI1C6deS; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="OI1C6deS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=EjcDYrHrfsWdwpPP6OffxdP9Ov3fR2yq6A3OOg3IpEs=; b=OI1C6deSV2rWXR8k0KU0g8khKJ
	2sJvPWd5Ln1aVYQ0KnzPXCsLnES7wzDbFTx/hdw0xEOoQo+c4iFZuc2dk0gmLaG/XeH4NRam2M5C9
	ggk629MgT719kvU5Hn2c3ZENEVmx2NwqZBAZtU3UsCYEN7vVhLq+oKdqwRMfKvrhexLe51Jv1nqGO
	dJZQQjUXKQsakZtsUZ0rT69kpHy/thv6c/+qM5GDXyymd2eBKFrQwhPc5/9XIr4T4Y+D1ZYHEDeNp
	rLRd0jjvYFk6tpWTqBASNLP81rNFuYROAB4Dg0x2qBAQLS+qURON1sgvCJFLSRyCvQKnbfA6HQwLU
	zPt78tEA==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBE45-0003pc-JE; Sat, 03 May 2025 16:42:05 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 hjc@rock-chips.com, mripard@kernel.org, neil.armstrong@linaro.org,
 dmitry.baryshkov@oss.qualcomm.com, knaerzche@gmail.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v4 0/7] Convert inno hdmi to drm bridge
Date: Sat, 03 May 2025 16:42:04 +0200
Message-ID: <9503607.rMLUfLXkoz@diego>
In-Reply-To: <20250422070455.432666-1-andyshrk@163.com>
References: <20250422070455.432666-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 22. April 2025, 09:04:39 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> When preparing to convert the current inno hdmi driver into a
> bridge driver, I found that there are several issues currently
> existing with it:
>=20
> 1. When the system starts up, the first time it reads the EDID, it
>    will fail. This is because RK3036 HDMI DDC bus requires it's PHY's
>    reference clock to be enabled first before normal DDC communication
>    can be carried out.
>=20
> 2. The signal is unstable. When running the glmark2 test on the screen,
>    there is a small probability of seeing some screen flickering.
>    This is because The HSYNC/VSYNC polarity of rk3036 HDMI are controlled
>    by GRF. This part is missing in the current driver.
>=20
> PATCH 1~6 are try to Fix Document in the dt-binding, then add the
> missing part in driver and dts.
> PATCH 7 converts the curren driver to drm bridge mode.

After resurrecting my rk3036-kylin which hasn't sucessfully booted in a
while, I could veryify this series, so on a rk3036-kylin

Tested-by: Heiko Stuebner <heiko@sntech.de>


I'll probably apply patches 1-4 to drm-misc later today, as that solely
touches the Rockchip (and only rk3036-)side and patches 5+6 to the
rockchip tree.

Patch 7 should probably get some attention by people more familiar with
drm-bridges, so I'll let that sit for a bit longer.


Thanks a lot for working on all this
Heiko


