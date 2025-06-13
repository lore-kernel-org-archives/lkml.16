Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82EB190679;
	Fri, 13 Jun 2025 14:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825449; cv=none; b=qYXVkc5h0orPGdLt73wa1eDyxfG304a1lBatoqYCxyjCON0KflZiBX4qKqlBUD4U4KKWdxOYYbkSy+1QlJDnMwnBu8RkRlRI/Ptc3gN8myh16hnSLy4ELpCumc9zL38x1vZt5t4KPXb9BO+7M2belBcCWwWEUhVVQbzYUsjVlG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825449; c=relaxed/simple;
	bh=i35Blln3gEa4SQHbL2VvB+ztpaiUcqNUVdy5ebPitJk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gi8EHTBsmYSpNbJFEQWAkTPpZjqYnnMk20scv+2uE5FsPhpBo/BhC82UXC8UNVbnp+rDCWQB4RyuLjohHROtmupZjrud+CyLXWqX/4BoHSfRamlJRdU+p7vlmZ1uJBEpaomcoi6IcR88BfckzWk4tnJo+llUUouUh5av6VnZYJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EObp1vTw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EObp1vTw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F96C4CEE3;
	Fri, 13 Jun 2025 14:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749825447;
	bh=i35Blln3gEa4SQHbL2VvB+ztpaiUcqNUVdy5ebPitJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EObp1vTwmIjdcn/t6ZGh1gZJC4KwqSfesjWJnZfRt8ARYLRrqALgK1azomN+h6WVI
	 j5t2crKErpAUJ9tYg8dMfe7H9OORa2MvGrFTUsSm+nq+Kt8dnA8UWeVO7Srnhp+eIT
	 3mKPnDt3ZY+gVqaeRCwZy4kcvtPp4O9iosGNELdqx9Ilp2r81m+EM0kNDBab6S7Oab
	 LDXkijQNgiPuEitbm/OLqvTBY3Kb/ZkELC70doQ0ZyLyQCv20EntCvUudqtcPyECVr
	 cItT4FkqPxYc4xbWUCuru9EUGI0sD6uxecIO9mNe5MCo+zBeVX3D/N6P1VAIJtnm2N
	 Gz1DOJTnCT5Mg==
From: Sven Peter <sven@kernel.org>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Marc Zyngier <maz@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: apple: t8103: Fix PCIe BCM4377 nodename
Date: Fri, 13 Jun 2025 16:37:13 +0200
Message-Id: <174982533895.547352.6090659751733022479.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250611-arm64_dts_apple_wifi-v1-1-fb959d8e1eb4@jannau.net>
References: <20250611-arm64_dts_apple_wifi-v1-1-fb959d8e1eb4@jannau.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 11 Jun 2025 22:30:31 +0200, Janne Grunau wrote:
> Fix the following `make dtbs_check` warnings for all t8103 based devices:
> 
> arch/arm64/boot/dts/apple/t8103-j274.dtb: network@0,0: $nodename:0: 'network@0,0' does not match '^wifi(@.*)?$'
>         from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
> arch/arm64/boot/dts/apple/t8103-j274.dtb: network@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
>         from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: apple: t8103: Fix PCIe BCM4377 nodename
      commit: ac1daa91e9370e3b88ef7826a73d62a4d09e2717

Best regards,
-- 
Sven Peter <sven@kernel.org>
