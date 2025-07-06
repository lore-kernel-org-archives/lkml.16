Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91D715E8B;
	Sun,  6 Jul 2025 07:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751787499; cv=none; b=XfR4CFE4vFfJTpp0lyQfTXu4Qbj2H+76gJM8S2cf93ppop1HSKjdcTXVeuUItaGqu/gxbbjSbFZWyJvW/Fueh+4MWgxL0NKS3+iE6qMZ3Di8nFAjDq1QrLLwba7AelS/Z395lq1gINcH/oOCvByhj7kxpDsNSC0ukkiLpOjKCPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751787499; c=relaxed/simple;
	bh=MRuYqklZAqPEl114Z2qUH3Dn8yQ2poRSGp+P+gR/nuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9cL0IGju9P7k4GE3JGQ5hBdkY2yE970KZhwQn4WabZhPm4icdyU3YTIeuA1gbXlS9n1AmUbc9vwW8+VkooVN74nzs+x81UtvV3YYoGfarixrPKraw5e2cQQgIf+unuNP4L4/G1HfF1KmdPM/QZkinPuiafdk5akOmtxquSAW7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=vXxICCOa; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="vXxICCOa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rw4lPHDv7nwh61n8L1sS4Kiu7H3J5SMaCQwqs6E7FAM=; b=vXxICCOaKVxlttHopdBE0sfGcq
	12/JFRTle9Dv+ZpEGXINHHZX6ryDgAp4zfyl34IoGzAl1jraq/vO+HQvTWX+Q50znPezK8MvFliai
	CGW6LPiGD7PH4VeBgyO2S9LvRFmjEogTXdjSAvynOQ9f0oG9yHaaaQKbLVDOaTj6BrQs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uYJwm-000WxB-Uy; Sun, 06 Jul 2025 09:38:00 +0200
Date: Sun, 6 Jul 2025 09:38:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 5/7] ARM: dts: sunxi: add support for NetCube Systems
 Nagami SoM
Message-ID: <b2351675-cba2-4d8c-af6c-f341f5c77ee7@lunn.ch>
References: <20250705213900.3614963-1-lukas.schmid@netcube.li>
 <20250705213900.3614963-6-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705213900.3614963-6-lukas.schmid@netcube.li>

> +&mdio {
> +	lan8720a: ethernet-phy@1 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <1>;
> +	};
> +};

Just for clarification: The PHY is on the SOM? I've seen systems where
the PHY is on the SOM, and the magnetics and RJ45 on the carrier
board. I've also seen systems where the PHY, magnetics and RJ45 are on
the carrier.

    Andrew
