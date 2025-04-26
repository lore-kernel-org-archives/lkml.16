Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DF71FCD1F;
	Sat, 26 Apr 2025 21:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745704005; cv=none; b=mCyjABfoWKiEKWhQpoywewZ/hFyN4SXP6mL1oznMh+817TUwAsUsXDENsOYnYA3DIyFLoJ/N6hMt5olxlSakIyLgXZCwjd2oR6uxXsyoP1MRIkghJWenqc1udqlDO7lwYzxDMSq5o/rZoOVt2ahje2LrucOlOaARqS+iig7nvu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745704005; c=relaxed/simple;
	bh=7Avte2fFuyXnFNqeprlnVBijJalm4sh3MIpgJAePcbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qwOngKGx0HYsiGZlOUo8Inx85/lZJlICvNeTi5YCypY1c3sLcHumGx4o2LujdlNOgsHMoMfFsKHGufeFzZsN2ns6XhKoAiu9hPneQns+jGZ1myr111mARzuALxXs10Wbw/agQLbD4gshwCj7SVIKgGThTSr8t/oHTitbmAu2G0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Olke1UOA; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Olke1UOA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=dJODNHkVNzSlZjFD+IpMJkmTkkNIUPx/SKc2mpT8lXc=; b=Olke1UOAx4j9BXfRb/lB3z7DVe
	jRanRcKezAxfhM4Tl5EFSTmdSDSAeFPeO7FjAbzpfIQJB8/UMJCaMrMlDqOcPaXD6EOPGyv561XJ5
	YPccqN212uYZMl4B9w78Y+ASsRjvPMOboNG1vZqh3kPt8XQRekExUvU0mhOZYNu445YfxqyGfDbZt
	h0hvcY6lI+/z8r8oLYHEp6sAkrCAfz6FBB3xYIXqUvd8N0Kic5sQnWAIw3/HjRhwmQ5oid0vo8EWz
	AAuS/9sxM27mYt+iOwQ8GL3Z5pYN2YA4CS3khfl4+IQb6Nikf/DIBZbaP1BiENLhmAjGjUITXMGAM
	+KGTALkA==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u8nLq-0001OR-5D; Sat, 26 Apr 2025 23:46:22 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <didi.debian@cknow.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Dang Huynh <danct12@riseup.net>,
	Johan Jonker <jbx6244@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Add vcc-supply to SPI flash on Pine64 devices + Rock 5B
Date: Sat, 26 Apr 2025 23:46:07 +0200
Message-ID: <174570395444.32969.7984320646555928039.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250425092601.56549-1-didi.debian@cknow.org>
References: <20250425092601.56549-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 25 Apr 2025 10:44:40 +0200, Diederik de Haas wrote:
> The vcc-supply property was added to "jedec,spi-nor" binding in commit:
> e7f4e924f46d ("dt-bindings: mtd: jedec,spi-nor: add optional vcc-supply")
> 
> which resulted in the following warning:
>   spi-nor spiN.0: supply vcc not found, using dummy regulator
> 
> Fix that by specifying the vcc-supply property.
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3328-rock64
      commit: 4ed658ebd7b506d468c0e28b724390b31abe1875
[2/4] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3399-rockpro64
      commit: b630cf92dd49f6a4df06508969a2eeeba6fd946f
[3/4] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-pinetab2
      commit: 4754eea38f5df6ad03cd93a4fa800d017cc5be82
[4/4] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3588-rock-5b
      commit: 67beb6b123187eaddb954fa9b070932452246d29

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
