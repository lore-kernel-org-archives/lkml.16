Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382D0276057;
	Wed, 14 May 2025 11:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222645; cv=none; b=vDMhJPnQDGuftavpBkvRiZ/sp37raonNOaTFxuj6w9LN8by65ebkD2VbCLDmrOv8sCjZiUgr/lZ3+dNVj+4EDNnialrMZRPByL3q46TkVq7daFZNi40SXxNrB8xgQwiGeBCSuP0VWVscRjBYZwvU7EDxCu+9ZMJi9e+UmxkXFpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222645; c=relaxed/simple;
	bh=whRcHaYLmRc/wgTuZhRzziRr5/mx4mKqhn1YvlOKatU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BmjJYxsSGQEF3JWDy2CgQJEcwv/81/J819CyHE751qknCyFmDEELp2J3WVCWP0QB44UnKonakhfoiQ4J/SHs0NEDfnBDIPsKMi0wArhU98eKANIPiZmt73LXIf9PzgIPeicdgKiKQ8wOtWwIvYctmTsazkCntH3R/e0x9M1iMjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C1Tc2Fsm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C1Tc2Fsm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50175C4CEE9;
	Wed, 14 May 2025 11:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222644;
	bh=whRcHaYLmRc/wgTuZhRzziRr5/mx4mKqhn1YvlOKatU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=C1Tc2Fsmdztc7wrkLG8g4Qw1VjJzyv6ONkGp80F7mHpl9kJgjuB8d/P+ffsdAblyY
	 GzB/W49Ykc52JGnYcw0p6YUUBZ+mWI6Rw/W8cYfCBvfbejIifts5rvSGBzFVweflkf
	 wgJBO8psGajac9THxdwmFu831I/7OUtnYm5KyT9lL+FdMMk03kBgiSKAbxhG+Upml1
	 mtK9gD1SI0kZ8sPhNQMB5RvkORgO64tWIIWuXBEEsAlVmrzTakzlKv98ajvMxRvjCA
	 +gGCLJuoNg6gr8F5tKjy0r8yiKApWw1uvevZgBmydn9gL2j30gx0Tp0YfMTZB8qZUQ
	 p6AaWgtiverFQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
In-Reply-To: <20250416202419.3836688-1-robh@kernel.org>
References: <20250416202419.3836688-1-robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: phy: rockchip: Convert RK3399 Type-C
 PHY to schema
Message-Id: <174722264197.85510.7578170417818621392.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:37:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 16 Apr 2025 15:24:17 -0500, Rob Herring (Arm) wrote:
> Convert the Rockchip RK3399 Type-C PHY to DT schema format. Add the
> missing "power-domains" property and "port" and "orientation-switch"
> properties in the child nodes.
> 
> Omit the previously deprecated properties as they aren't used anywhere.
> 
> Drop the 2nd example which was pretty much identical to the 1st example.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: phy: rockchip: Convert RK3399 Type-C PHY to schema
      commit: 2063eedf3c9c4449fbf417c9b84ecd08251c3b34

Best regards,
-- 
~Vinod


