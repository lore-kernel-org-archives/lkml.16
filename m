Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A9C202C26;
	Wed, 28 May 2025 11:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748432065; cv=none; b=eE0zh/Y5wI/XUSXPJYM8NW8JCSBw+U3teSzVM6WvlB/MBCKm5vBnRP6SVvdjtKWnKfEbx+Yfshv2wlMO+JgvBR8Uac/vI34pJRaAxA1oOmRmzSAH6HiXVrSEe8wlRu5L7hlUq3/Cw8NH4E161x6mMjfyXbY0dt2BmH01Nv3Jv3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748432065; c=relaxed/simple;
	bh=5zcSpGUiDurj5ZygSE+BJqZ3vn6+jUWX/UqrQnid/RU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jvr6Du2ocosLNkaYwn9kmGfQaPziUuqDeYmoBttVwOKwJxxncrp3kWClY2Rq1oUt1EQkjqsELZuOtf9rg0kWN2mfmeryCv2sB9LZTDfwyegMYJificKLndlhqMaX8hSl09x+60Wif7cn0HMWTpLApdKzA6nHJG9nG60XcGFwv/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=kIe2dk6U; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="kIe2dk6U"
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 5BAD51FC91;
	Wed, 28 May 2025 13:34:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1748432059;
	bh=pxDo9IO9ATTuQyALamZSwSmn+16k7bv0aYEa/a+N+TE=; h=From:To:Subject;
	b=kIe2dk6UVZiF19EuFHoJjx5/xbuPmkmdu8StW+SA/Ai7aStdASEzonHThl7qB5dnR
	 CEAQIqUuim4oh/QL7e+IR5BUZ2aI1W7JT+yMXNnOtB8gTjlW5vcXbL1uu6OGKUkH+X
	 Ne4o2nzkAFgxdnqqrz+KuFTVVkZWtZPMns761Ts5l778QqlE+aA33ayRCgFXnUrHpm
	 xxJv2IvcG0r6Odg2VYfl9/B3msT/nVgWcj09VMg95w1FBgeWOHL03rFfeQ+/SXeGCO
	 DnQIo2zHYtvxNS5LPfEYDSUFGAtLRNztqBZjM9HkVpSfczNyocrxLq9W8G9hHvHR88
	 cdcmYBA/hWRiw==
Date: Wed, 28 May 2025 13:34:15 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Enable pull-ups on
 I2C buses
Message-ID: <20250528113415.GA43553@francesco-nb>
References: <20250528110741.262336-1-ghidoliemanuele@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528110741.262336-1-ghidoliemanuele@gmail.com>

On Wed, May 28, 2025 at 01:07:37PM +0200, Emanuele Ghidoli wrote:
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> 
> Enable internal bias pull-ups on the SoC-side I2C buses that do not have
> external pull resistors populated on the SoM. This ensures proper
> default line levels.
> 
> Cc: stable@vger.kernel.org
> Fixes: 316b80246b16 ("arm64: dts: ti: add verdin am62")
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

