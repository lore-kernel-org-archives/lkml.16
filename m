Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105EF139E;
	Sat, 26 Apr 2025 21:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745704243; cv=none; b=iXdiQK+MMYH8/MhI2IylQ8EmQmQNLbsV8HYmp4M+6vVGmwLhUGCwrSHvoGacDYmSKxf9BYXgw4GLYhok60NuUxU0IOoKBqFMJUf5/bDjFnvIK88hwx6/DKt/QNnjaGBEjR7N9L6SSiTK5lEEsEleSmyX26fFoQ+N9smuR1Rg0QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745704243; c=relaxed/simple;
	bh=oj1ed+lif75XFCDbJ4JLwfD8UViWsjn8GRULMAlSsRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pMHO5IvIzp5PelIpatsI0k60zfu408TkqmnQJwV79/TRu+HeKG8DBv5QIPx9aFzfXn1FhjXAiaGp60D3CDLTO7pags3puflSkHNAj1wCbLgDyUukMvwSvdf5jXDPCU+zWihM21PxIFgBUKTJlLMcrXVA6Rlq2bqrGADmL5wU99k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=atpPnZjB; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="atpPnZjB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=39W61SoZ/RKxkXTNmTVGYLh5vGymKKFC6iomj8QCgqM=; b=atpPnZjBTjM3lbCpUpbo5/cMW+
	/eFlqFUCQZiJWD7SD5VNaKnSC7k7FmjOZ6f+ydZUIg2gHDdUTHDrAFfcv1AV3AIWOTfRzpR+p6D8W
	QMap/0rcY8+Q26sKFRpZiJABOBIvxIwLZyPuP4QPPgTClrrBYtjLKOJXIUNHKnxMMksGnr9NvjA5f
	2naeNdo8diTeRA8uLeEbSOzfrMTBbNt6uDii9rT1YLQXoY10ofRvDlplGANNiZaEHoj4I6KD8aCCT
	UFvSL3BCZ6nhrTYelgU60jkJtpDFtkFaJ7+H1yaZ7SrDxbOkzRfp/zFhmUFvkr0+WjmL25BfHSffQ
	A55q6OsQ==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u8nLu-0001OR-3d; Sat, 26 Apr 2025 23:46:26 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: enable pcie on Sige5
Date: Sat, 26 Apr 2025 23:46:16 +0200
Message-ID: <174570370141.31943.7222231536133274406.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250414-rk3576-sige5-pcie-v1-1-0e950a96f392@collabora.com>
References: <20250414-rk3576-sige5-pcie-v1-1-0e950a96f392@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 14 Apr 2025 20:37:38 +0200, Nicolas Frattaroli wrote:
> The ArmSoM Sige5 board exposes PCIe controller 0 on its M.2 slot on the
> bottom of the board. Enable the necessary nodes for it, and also add the
> correct pins for both the power enable GPIO and the PCIe reset GPIO.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: enable pcie on Sige5
      commit: 8ea46f3b9348ce9105a32be6a1afec0b23adc906

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
