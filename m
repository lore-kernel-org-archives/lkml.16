Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB0A241671;
	Mon, 30 Jun 2025 09:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751274714; cv=none; b=o1Hd9zYOhBEp/B+zbf9BjUvxyv3Ta1XOReYjCASL33UTUqlS5UN3WX07WqqbbtxPj0O3SnG+ZtutO6xe7qL74T3sGBqi2iburX+w2wJEdmQKPj6l4qTxt/+yEnfmw7qtqCstefVJP3HTqEQF/B4g6akchIIfTH1g8VcXcnJNaZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751274714; c=relaxed/simple;
	bh=AmB68GTvDym2+Crf/1lxRWlUKkCyHkC2bkqzLaHBhiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TqzehEEk+KNeDbg/avta+OlVov2NJdvVC/1bE7Rd5OYIDwUMk3zwi/atCZhMM5yyTzAJU0LPTAk91HNynfWtapzaA1hvosnRsoZ4Efxo0hOEg1wiz3XKkx5QoEjCu+Ej7IyGSe5F6IpbbHnOQET0jAUdaPUopyuxZw2EYLhT/cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=zZQE1uvM; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="zZQE1uvM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=HwVUTZQKNW/ggCzjg2eCwPTwxdG9ZX3n70WlY3ZOPic=; b=zZQE1uvMxW9DStbgQ/xyA8KycJ
	8shhjMFRqsUso4UxhsrduIqFI7km7seVGEU9T6S/GFGnOlUwztGpYunCXRk0/wnhQiUlaMmd4VubS
	JuMG2+3fWWzrvkvqWeZJ0qOoXvjCxw87S62mkW+g06k3bIBzeSvm4Dh9wwaoe6cWdKlgQWD3/O++B
	1OEHuY7BmkIjIhu07t1/+d5AaUCES3+e/6DDaf+oPDB1IH4OwDIOX0XxmN17HX9m3WI/md+WBxq2B
	2f8Nsq5rjca7OHUzRAYoxdI1clRMFiKwyrU9l4IZaMd0M+9YXFC25F/5wbB4TWkYAaulGp5CupRat
	n/YgmUWg==;
Received: from i53875bfd.versanet.de ([83.135.91.253] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uWAY5-00065C-15; Mon, 30 Jun 2025 11:11:37 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <didi.debian@cknow.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add missing fan-supply to rk3566-quartz64-a
Date: Mon, 30 Jun 2025 11:11:24 +0200
Message-ID: <175127468078.130313.6730196931400503235.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250628142843.839150-1-didi.debian@cknow.org>
References: <20250628142843.839150-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 28 Jun 2025 16:28:18 +0200, Diederik de Haas wrote:
> The Quartz 64 Model-A Schematic from 20210427 on page 7 shows that the
> fan's power supply is provided by VCC12V_DCIN.
> 
> This fixes the following warning:
> 
>   gpio-fan gpio_fan: supply fan not found, using dummy regulator
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Add missing fan-supply to rk3566-quartz64-a
      commit: 9037532ab893635a46afe88542cd747a4a846497

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
