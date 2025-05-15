Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BD329AB04;
	Thu, 15 May 2025 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747313465; cv=none; b=GMRTY8o0ZJ/nmyKedBNrVtWrWkzbprdnrz78L8YdQgXPCvISCAqPhbAtMl+fPlBLhk9E9aGmpWaU4eaVCk3KDnyl4HynMhplKtxhNKuD3A84ItperjEx2q0Sc44EgJ0HJcrVGY0k4VaRGJiwyEy4pOuZvc3dCPC91aHKVWfmGvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747313465; c=relaxed/simple;
	bh=JTzq3Vmf4gscMebiu/HYcXiL++gX3a7M3+Fmkrk/lDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RBUEMBpzWV7isgmE1+UJSMHn8tv3q4Nj5goBY707BjivD5MxVn21GClQCSApvnSDt15s5do+FVI1btWE0roqVtBHhEU+PqXvGUXKr3dQyPy8+bsY4tMR7jDXfBmEpGscEZCl56EOLzjUq12Fgib6awjWbxsxCLEvQ/q/+w/xQEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=TjRmRqag; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="TjRmRqag"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=M4rwDJq3pbg55Yo2g2267mrIWdXYEpDyoX3ONJqyKdA=; b=TjRmRqag+mIisO5kJBdgCmE6K0
	r13pxMuEsOR7Ckq4gKYUV6vxh11ScjFRAQo635hxe+soIxmLYQ4q+v2OYmMN6BEEOWUZW+/lPDnXQ
	gODEfplZWGFjUFmMuXW+t6YGQNAj8L/dqSsMWBzRXQplTtuVQTW/WteXuEGojZV4mGiI+GVKwuOPK
	duPBZlUIIlhp/vefZSnGOcRjYccYdPjQGGi181AJcDto6ADt2LhOcgQPPqN0pKWp1fnXwtNuKUfm6
	nu/oZJb6T88bLXJfi0yHZAVRSTA1H7htxjlY2Gkz5hT8wnnv21GymCV1mji8kLkF/IwUSmz4mUZQV
	L20bYLXw==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFY38-0004ph-Mr; Thu, 15 May 2025 14:50:58 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: quentin.schulz@cherry.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/6] Add two board-families from Theobroma-Systems
Date: Thu, 15 May 2025 14:50:44 +0200
Message-ID: <174731343062.2524804.6752535988560416961.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250514150745.2437804-1-heiko@sntech.de>
References: <20250514150745.2437804-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 14 May 2025 17:07:39 +0200, Heiko Stuebner wrote:
> Both the Cobra and PP1516 boards are based around the PX30 SoC and can be
> found with a variety of display options.
> 
> As new boards should not use the deprecated snps,reset-* properties
> in the gmac node, I also added a core mdio-node for the gmac and
> converted the Theobroma Ringneck board over.
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: rockchip: add basic mdio node to px30
      commit: ede4837a504ca7e5811217060aa8300b8d0cf7f2
[2/6] arm64: dts: rockchip: move reset to dedicated eth-phy node on ringneck
      commit: e463625af7f92c4a9f097f7fb87f6baaad6e762a
[3/6] dt-bindings: arm: rockchip: add PX30-Cobra boards from Theobroma Systems
      commit: e2a6b301ca6054fc72905810d084690ec0ee1aed
[4/6] arm64: dts: rockchip: add px30-cobra base dtsi and board variants
      commit: bb510ddc9d3eda3d6e1276d301e923e7021e9972
[5/6] dt-bindings: arm: rockchip: add PX30-PP1516 boards from Theobroma Systems
      commit: b8310e4d391ad123048de738ac023ef8b7ebdbfc
[6/6] arm64: dts: rockchip: add px30-pp1516 base dtsi and board variants
      commit: 56198acdbf0d57200e49311e16d6bf16498128f7

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
