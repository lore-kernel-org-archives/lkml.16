Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826C81F1524;
	Tue, 11 Feb 2025 09:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266150; cv=none; b=eCp2g5NGTm9PNbCU/IF6+fbrSd3uT/DlHXzi0a4QI+Jz/XHhQQJ9nYmOnkL01inymMmy5nVWMofWqxDMz3tS5hK0jJmpyompj9WDhodmSpENIZdQXZYfOxX3LTXhuvd4A3Sw7hU8b84+8vuLtHyvY66Uo+jp2qw8/JZqt7MtjNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266150; c=relaxed/simple;
	bh=okPQbVYPT1ntp/61RJEoRgq8G3igp9SZpAcnOema58I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bH8cMG8jmev8DKsbzbOlyt88VRpGzGk9l+PKGdo9ATxPek0xoZ5IVxfRVLcn6eHarmeYcqo7uO2+mmuReAAxwe7OoPcjU9OMqU10xX1iGM2q+mRzuxADQQnID9THUhkqY0oONrDWcj+1w/zwsfucwziQcT/63nfG64ajRvisu1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=me0RZXfq; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="me0RZXfq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=l9ZBxMcRpMoEoqbx44hfP6cOQVSEwX25fwYpyRa9ruc=; b=me0RZXfqHze4mlDOIlcJ7qvLr8
	ACyYFpmquyLcJKuo7Wz6huORLPFTUERbLsUPoFi7Zj/9u0vGueiWrrMJVImF6++N4WeoebeicgpwE
	/jnsq6u6K19up+6du/Xeqf72zRq4ivUA5rUO+5wsAdGT6ik8AJ5qlrZZ3RM4BUeBBs7pq63JhWOPP
	mnVpHHGb2d5LUw1ZxplJRsxfbI9wCXM8hPhJEinFqiFRs4oX2Q84knBlh6DOiaf8xyITbl3Fu4+BE
	6BipW7k10w0MCKDn95OXmu7dsqq0C3FUjNKvj/UjdXY1nMaqa6bBvUziNFpiYHq+sFZNfnlRRhfV6
	RV/pXW7A==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thmZi-0005mx-Oe; Tue, 11 Feb 2025 10:29:02 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Charkov <alchark@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] arm64: dts: rockchip: Add SPDIF on RK3588
Date: Tue, 11 Feb 2025 10:28:50 +0100
Message-ID: <173926612570.1219038.2885465365177392240.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
References: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 20 Jan 2025 13:01:26 +0400, Alexey Charkov wrote:
> RK3588(s) uses a several SPDIF transmitters which are software
> compatible with those found in RK3568. This series adds the required
> device tree nodes in SoC .dtsi and enables the dedicated optical
> SPDIF output on the H96 Max V58.
> 
> Note that only SPDIF 0/1 are meant as externally connected outputs,
> while SPDIF 2/3/4/5 are internally routed to the various display
> encoders inside the SoC. Thus, using SPDIF 0/1 only requires their
> device tree nodes to be enabled (provided that the signal is routed
> somewhere usable on the board itself), while the rest rely on driver
> support on the display connector side and are therefore not touched
> here.
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: rockchip: Add SPDIF nodes to RK3588(s) device trees
      commit: 271ba4d6c56c7cb295def511cbcdd9880ec41e1b
[3/3] arm64: dts: rockchip: Enable SPDIF output on H96 Max V58
      commit: cd81ee8667cc13ff69e11b44a727be07035aa536

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
