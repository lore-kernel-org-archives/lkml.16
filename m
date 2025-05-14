Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5057221F20;
	Wed, 14 May 2025 11:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222633; cv=none; b=ein35a1IQ8aq41uQF9inaSwFL7yTVNgiCZjVrBEJCpez9cQUXOPDjPJ9b2EEc3C8bznTvHUMJuih/5b2RyJGEXwtsXu+kNxZw9SzMagBIhZQKaYQNAaITONdDPo0//BcFrwXsrT9OTi45Z8bi36IEj0L82f5R371UaG0DbVM57s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222633; c=relaxed/simple;
	bh=t1bXaEu9EXQ94m0cdh4MSItJJeYMDzLla+FRFBaaVOA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rO+6JGc7+5WHzXVfSWRNw7/Hp33NtZqAartyqThSLyyrKOedSWD8LH+aU27p1VrE5QVOV9nCrkoJbpuwasBLyGs7RYIqiGoraSA/Rh/myZRwf1BrUFmBW0WdJC1249VV1N3nqHmmYgLtdZM7A2EqO6yvn2rZpPwiqfkuH689AxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NwpkfIl6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NwpkfIl6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1907C4CEE9;
	Wed, 14 May 2025 11:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222633;
	bh=t1bXaEu9EXQ94m0cdh4MSItJJeYMDzLla+FRFBaaVOA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NwpkfIl6MZt3iRQolb75+B6HpoTZyfFuUyBOU3iCCdWyF2d3ukbkHyrA8zIFib9nc
	 EOHXQ7yVKndC1xfuBDcWhVcVzOVrhwiAPM3NNJ7jzA//MeUd8ZZIcpVIDb/GFpCwED
	 pbNpd+NMu5yoxzB18tUGerttcXQ2a1yO5VC4uJGUYaiAtMf/iNa53FZ+fmxhi1HcH4
	 HBydiR7YPq5TnLsV4f26kN1qn2853JpHGEcof10JzSLaUY/ke7xyTcZKX793Z70uM6
	 SKT6RyfToz9+K5wt2nSCKVyNtoz/OwuA/7bc29ll3fokyUQg+QlfOc0fknmmeQCV6m
	 CXvTdBKQ4rgqg==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Wunderlich <linux@fw-web.de>
Cc: Frank Wunderlich <frank-w@public-files.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Daniel Golle <daniel@makrotopia.org>, Sean Wang <sean.wang@mediatek.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org
In-Reply-To: <20250422132438.15735-1-linux@fw-web.de>
References: <20250422132438.15735-1-linux@fw-web.de>
Subject: Re: (subset) [PATCH v4 0/8] Add Bananapi R4 variants and add xsphy
Message-Id: <174722262951.85510.8563581978956288115.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:37:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 22 Apr 2025 15:24:23 +0200, Frank Wunderlich wrote:
> With this series i continue the mt7988/bananapi-r4 dts upstream work
> 
> changes in v4:
> - changes based on review comments in v3 (mostly bindings)
> - changed topmisc unit address to match reg
> 
> Daniel Golle (1):
>   phy: mediatek: xsphy: support type switch by pericfg
> 
> [...]

Applied, thanks!

[3/8] dt-bindings: phy: mtk-xs-phy: Add mt7988 compatible
      commit: 117d09e2830d6ff6c1bb2dc5629f972504fde51e
[4/8] dt-bindings: phy: mtk-xs-phy: support type switch by pericfg
      commit: b484b25a486962b568ada1f55c1b96dfd96b912d
[6/8] phy: mediatek: xsphy: support type switch by pericfg
      commit: f85eb659a48cc2f0c98a122e760552b69e56c06f

Best regards,
-- 
~Vinod


