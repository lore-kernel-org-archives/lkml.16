Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF4B25D8E6;
	Wed, 25 Jun 2025 13:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750858692; cv=none; b=cmzpAdvNEgcTt6mWL3Oy7LQ57XFukP/onUIR9f/WSgg0Wxn6Lm9tI/B3hPkWGu9ZoEH8CqdRZVQtt39Ok2vPll0SSctzUa42Mi7J0ke4Sq0NAM3E4tHqttfr6tlrbZ8vf/ZQtVjBGRCLknzmn0goicvJ57EeTjLZvf2bs3v3upU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750858692; c=relaxed/simple;
	bh=J5j0nF7I3E6C/XHVjnQpT7AY6DSdrtjx8lmPTDEg38A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Kx0enYtxIA3J2nGfXnQUIjwy2L//wInlaF/YO5eqWy23fFviB9hX+t6ZffHvZZcK3Gu/viiJOXGABHFY/x8ot/UNBBBq3qknsypLACOUyM+TDGu6bpeI2Fb+AXlv/GwPGTveEBX6hNrTQfLZQZD2obNqkbEmmPA3a5wdoQoGJKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D721C4CEEA;
	Wed, 25 Jun 2025 13:38:10 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id EDAF45FB4D;
	Wed, 25 Jun 2025 21:38:07 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250619171025.3359384-1-wens@kernel.org>
References: <20250619171025.3359384-1-wens@kernel.org>
Subject: Re: [PATCH 0/2] clk: sunxi-ng: sun55i-a523-r-ccu: Add missing PPU0
 reset
Message-Id: <175085868792.1673542.16405302707690855377.b4-ty@csie.org>
Date: Wed, 25 Jun 2025 21:38:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Fri, 20 Jun 2025 01:10:23 +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> There is a PPU0 reset control bit in the same register as the PPU1
> reset control. This missing reset control is for the PCK-600 unit
> in the SoC. Manual tests show that the reset control indeed exists,
> and if not configured, the system will hang when the PCK-600
> registers are accessed.
> 
> [...]

Applied to sunxi/clk-for-6.17 in local tree, thanks!

[1/2] dt-bindings: reset: sun55i-a523-r-ccu: Add missing PPU0 reset
      commit: 61977ccf6568f9d104462727b49412a80c22c519
[2/2] clk: sunxi-ng: sun55i-a523-r-ccu: Add missing PPU0 reset
      commit: c17b1b6c86059664e91008a23547ef0aadfc2228

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

