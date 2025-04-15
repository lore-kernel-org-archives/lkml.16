Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D951017A316;
	Tue, 15 Apr 2025 15:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744729541; cv=none; b=r4aUHCHs7jLN8Acx84lKQ5zew8ZJ/MXHg9jghtGaZTEilfo0envzpq7RlIbHPB6VhMjtPGqPCl2UTXi5oKHnScVODWobNw1ZJuyHuQ4V0F8bYCwDyRVNlcZcOfiy1g5qMmi024s5eFD5NqEPxgTmN1uKXij9ExkKN7Tr4FdZ6uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744729541; c=relaxed/simple;
	bh=fph/GqhjZhoz1tpBFFHpktak06Ykrl7Ng2ZZ9kGhlw0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PDymDHs3ldU0KTjn+Vt+lGolsONlzJzwFXqcDiBGIFQXKv+hfxaVed3TKaQBWJBejwmC6pcpLTP9/GtzUSNFlsP9cYZCLPOth3oszyivHtqBafo8sTyFpJHv6t4Iclr6VKyQ6qFG8IzC/AVT8BLDRBLFKYYIS1oU5RUaVQN0TYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; spf=pass smtp.mailfrom=svenpeter.dev; dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b=e1i+aKoQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Iy9PUxIM; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="e1i+aKoQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Iy9PUxIM"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id C669A1380212;
	Tue, 15 Apr 2025 11:05:37 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 15 Apr 2025 11:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1744729537; x=1744815937; bh=kwjwUckSCSBSaxgPLzqJL3F5+m9BbFCd
	aP0FISKu/pE=; b=e1i+aKoQTp/qG3a/AvuoqXJEKqEjGZ7Xu5i5UZWuFQEaqqxP
	IRZJcFF0hh68y7U1qYJ716fePeYevZYuAddaNn8TDHPYcnL7KfmzFVaM38FRg3uR
	t/2Yk0xwotoEZHmnBAMzXQRphDXhu/K7HDs0pHzOiASQ4q/smIoaioGGsGsIfB2G
	kxEQXBF/0QIvL6SxZaGbSgaUUAQDQLBHgV2Vo38UpckMGYoL+IfXTBX2s9LA+Fwf
	Mk+9c7sjpNFoVlpZ20yUCvadcKZel/uYI/lffgkUNBzN1guxQxfXxzv6eYu1xZvI
	Fwd3f+SL2DMm70L01Np53vDYkyftqTVob/udOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744729537; x=
	1744815937; bh=kwjwUckSCSBSaxgPLzqJL3F5+m9BbFCdaP0FISKu/pE=; b=I
	y9PUxIMZKyx/wWiunAgFAXidgGRyW3HZxHbDbJhY2IV6uLhTAEMXOQOSujgoSmJ2
	eyKMz73oEbPHArYwm/c1VpaRYA4LDK+UXG3wfCxMm017XFmxQHFmWUtB04+lcIt2
	/BCafFPHApSWp9o94je/xTB9FHtt8oQr8Gj8AQ7JxRv1BNyVGOtgdJspuhlnNJbc
	Z/pOp8dZkUB344j5pcTJldOcJmOTH/vdAexu5qGzPERkAQcm4TXnxxPKIsx8YTzE
	8FsF5TuaUlKUyX1+A2OYMUk7rLxxB4gcOFEgwRU7UtqI0FkjmFfzq3XnjzciJ0WL
	IqE3RM0Vsn/THhQIQlhcg==
X-ME-Sender: <xms:wHX-Zz92DOTRw4C0ot-ejLCYTcM4v6Sb-YhKYL4dZmf9WIwun9Vspw>
    <xme:wHX-Z_sOlTfWPuLGWyKcGZqj4KcLd44iTJaJVym86VT0dm7TVrqm3A_toN18NL98q
    AG6-o5dOa9vgQhD-98>
X-ME-Received: <xmr:wHX-ZxA7sQbMtGcVQ7ieDdVNxsB3nf5G-vtGiXEEnF3eDjfkChhEaj0d4cdxD-0edVPo6I_7Dy_IaNvaEm4rrUjXVSa0OJP3iBjMEJGBF-AudOvyWZAryRsgMX4Yh0o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefkedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefuvhgvnhcurfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrh
    druggvvheqnecuggftrfgrthhtvghrnhepleetudehlefgteduffeijeehfeduudekhffg
    fedvueekvedvveeuhefgieetgfegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvhgvnhes
    shhvvghnphgvthgvrhdruggvvhdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhopegrlhih
    shhsrgesrhhoshgvnhiifigvihhgrdhiohdprhgtphhtthhopehssghohigusehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoug
    htsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdp
    rhgtphhtthhopehfnhhklhdrkhgvrhhnvghlsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    epshhvvghnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:wHX-Z_fxKazDrAyXj0GgdL1YHnnm5RWu9mzovfCRmhBuubKnKX5TyQ>
    <xmx:wHX-Z4O0N3vNAHS2aI2UAEW1fbVOUJQ9GYJ-dp76zhfhncrUCI5nAw>
    <xmx:wHX-ZxkqkAZM7BJJFZ7kaWbZDXfOTX3OaCV_14q50IMz_tFztaeaIw>
    <xmx:wHX-Zyv03UDgmVQsjCgdhMqA9Xf42gf0x1q02Ac3WVcmaf5sMfOdhA>
    <xmx:wXX-Z5cVCwJgp4WWzKe8YRLgEhp5rxtkwsx1Gf4smRcrQY1y9AutgjxR>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Apr 2025 11:05:34 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neal Gompa <neal@gompa.dev>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Jean-Francois Bortolotti <jeff@borto.fr>,
	Nick Chan <towinchenmi@gmail.com>
Subject: Re: (subset) [PATCH v4 0/3] Driver for the Apple SPMI controller
Date: Tue, 15 Apr 2025 17:05:22 +0200
Message-Id: <174472945748.1150.17125023476658706352.b4-ty@svenpeter.dev>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250409-spmi-v4-0-eb81ecfd1f64@gmail.com>
References: <20250409-spmi-v4-0-eb81ecfd1f64@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 09 Apr 2025 23:52:11 +0200, Sasha Finkelstein wrote:
> This patch series adds support for the SPMI controller persent in most
> Apple SoCs. The drivers for the attached PMU and subdevices will be in
> further patch series.
> 
> 

Applied to git@github.com:AsahiLinux/linux.git (asahi-soc/dt), thanks!

[3/3] arm64: dts: apple: Add SPMI controller nodes
      https://github.com/AsahiLinux/linux/commit/2e0e70c95077

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>

