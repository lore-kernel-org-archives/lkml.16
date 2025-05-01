Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0218155A4E;
	Thu,  1 May 2025 12:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746102553; cv=none; b=KdRkm0I+AFaTGW6dafiJzAr0aeRx2FIEECby1SpD3C6vOgC3c27PmD+bx3h57pY0A+6SnilqRRdGCzLIpxBuFClaXKhT9cR4div0UPU0T+JSLTNStDQyspImjaMVQGkXjjPm0Hg9bGDhz3AeFSSVGXCsQk5hrUEsBkcX9q7YvhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746102553; c=relaxed/simple;
	bh=u5mpNsLNUVXpirS8AVUjZQUXt1KeHOFF2eiZr0XViho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hXg/ahFSzQgrz2NVxLanFhLbjzyG99xbliAGcATOHFIAqoXmtijTGFABwzyQXGVDFlI9r/KssW69GpENJc/Fr7yeTjaw3sahwlgvHFwHU8eG0thkTeV0wf7IukLVYA/5pVKajVrkg11iOb8W+c4StNmzfzXpvfVQGE1f+gxSxpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=DP6jfear; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="DP6jfear"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=qY7jMh2s1Q1/dxv6yXIZWQpJJC7k3Ol85coLC/4oDNs=; b=DP6jfear58qpqLih8qEWeAKnQQ
	Am4/8PcoygDS5o6wPyNNnUy0zvYj8bbVtlYNpg61LXGX1j5zZiBO6wRVUpDJo4xruDni7GlGyBNwh
	LHIErPoNjgMhjuckkR12zUAxifgvdKGpG+iSS5oJ1V6jDs8j0BlWxt4a95QJESN7zVWCHoQXS4AH5
	2FQ30Io/ZM48p3VvhJI13Y4JuD8QHc8/a6c/S82IuzkqnasGqhW6pJAcgCQSLPQIMNs1zsu7gzF+2
	4vsbA3V8ZZUmEvUz6AKIjH/yiTq1mC0Vav2HgilyjKGiCzv2GUYC76ElZZOiR9XB89XTHXIdF4fRW
	WuOP+l+g==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uAT2A-000129-Qn; Thu, 01 May 2025 14:28:58 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>, Alex Bee <knaerzche@gmail.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 hjc@rock-chips.com, mripard@kernel.org, neil.armstrong@linaro.org,
 dmitry.baryshkov@oss.qualcomm.com, knaerzche@gmail.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v4 0/7] Convert inno hdmi to drm bridge
Date: Thu, 01 May 2025 14:28:57 +0200
Message-ID: <3554727.QJadu78ljV@diego>
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

Hi Alex,

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

this looks all pretty okay to me, but could you check that your rk3128
keeps working and maybe provide a Tested-by?

Thanks a lot
Heiko


