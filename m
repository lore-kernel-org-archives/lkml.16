Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE6019CC28;
	Thu,  1 May 2025 13:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746106103; cv=none; b=tdT2fkQ7vW9DTF+qC4720O83HyKsBgjkGq8NFOG1T2gpposqoAEHPC5nmbqodSnT7nRFQ7CvZM3NVbU+OWNH2vHU97vHGeI9dLKHgmQcNYNjmoztJLavRy1gMO5tXEjDf6r93pRu5W3jRWI3K7Bn/j8kmtVmbtVBSuDC6D87RnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746106103; c=relaxed/simple;
	bh=F6FjD13/keN8NO/5Qu/i0HT0YcjHnwJPal7ZjR61JJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z0XFJerBDjf4Yd19pfI6tTLiDNVzl8ueRgcdFy3pFD6LBP6R4sL3hwhAtD50lRba/k0TwON5rIkgrnzkJw+JWWlX2Yp0MDzVPIxx73eAaLl4LNRl6Ot3qkl+3Aup2W6FT8OmvvRtxGsKrKJFB3YatnNlTMZzBon2CqeQmZUQKr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=RD6jBeYd; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="RD6jBeYd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=5pF0zRMnxqpAZiQDV2tjp1OzcmcfhmgifjwYB3Den84=; b=RD6jBeYdyI6NdHc8c+BcRx6sC1
	wYRv+O8cKAFHt/LDHeN6Qf0L2jJiSGAtBvMTFUJaYubq+l2HSoQ5YZQ9weBPv8PGy0OyVrlqXAXUb
	DlQ10tPQVsfUPBnm8N2YjE/kN7gWGxY533Hv4snOu4o1pOWN8EP0eGwhOz2cw0IdbTc/F0xpOBXUq
	7EWoYgdB7XoQ5FofLvL9ESHj7ShhmDlZigg6QZ92lbq98encWmo9U9w4KhM168tkMpWnZk1XNEilB
	6ceAZewhyyJKZe6sZSgy1rIHlnScM+ig7Fnl9ldZIfVbB9jhuuYxr1BCIT5hN+rRJueA43s5Lhp/B
	N63Gh5+A==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uATxY-0001u3-Vx; Thu, 01 May 2025 15:28:17 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>, devicetree@vger.kernel.org,
 ulf.hansson@linaro.org, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 6/7] arm64: dts: rockchip: add core dtsi for RK3562 Soc
Date: Thu, 01 May 2025 15:28:16 +0200
Message-ID: <47204993.fMDQidcC6G@diego>
In-Reply-To: <20250415051855.59740-7-kever.yang@rock-chips.com>
References:
 <20250415051855.59740-1-kever.yang@rock-chips.com>
 <20250415051855.59740-7-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Kever,

Am Dienstag, 15. April 2025, 07:18:54 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Kever Yang:
> From: Finley Xiao <finley.xiao@rock-chips.com>
>=20
> RK3562 is a Soc from Rockchip, which embedded with quad
> ARM Cortex-A53.
>=20
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
>=20
> Changes in v4:
> - remove gmac and otp nodes
>=20
> Changes in v3:
> - remove i2c/serial/spi alias
> - add soc node
>=20
> Changes in v2:
> - remove grf in cru
> - Update some properties order
>=20

> +	soc {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		scmi_shmem: scmi-shmem@10f000 {
> +			compatible =3D "arm,scmi-shmem";
> +			reg =3D <0x0 0x0010f000 0x0 0x100>;
> +		};

the scmi shmem is not a soc-device, but instead a piece of main memory.
We recently fixed that for example for the rk3588 [0], so please follow
along for this new soc.

Thanks a lot
Heiko


[0] https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.gi=
t/commit/?id=3D8ecd096d018be8a6bd3bd930f3a41a85db66a67d


