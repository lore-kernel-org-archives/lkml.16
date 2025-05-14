Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEBD275874;
	Wed, 14 May 2025 11:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222667; cv=none; b=eeWtZC2D/7ZrGmlgI5VAZRjBx4yHcUyCnNEsxuue9THdjfYde/HaxioAdtlzk94eFUtZJtlft2y1oif9edC6BffBa3OushiSO32kJ5A6Uvo3zHLlz7N5k6h7wrHGPAeBMMB2BXBEiEPCZfzlozN0X9jQKCdZ4XqLfbUuGF9xDJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222667; c=relaxed/simple;
	bh=JzEkcnZJ9VU3/RyEXnVJDwWtRvNpABazrUcSwCWJKAk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mB0QZ8jZ93CjdlaWJzsbiO1LKLMRhhOaBi8S81471hfDIcGKlYXczIYvF/xzn9MwISPoVD2XtH2D53Tw2svhWmql/J4TGH+AUltl9cx88BtWLk1XA4wrzU0LAAQo2Zx0zSyuMObnyN368AfALfvnfzx+LzXZe5GnrlTe7EDVGok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cXMZqIxS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cXMZqIxS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C81C4CEEB;
	Wed, 14 May 2025 11:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222666;
	bh=JzEkcnZJ9VU3/RyEXnVJDwWtRvNpABazrUcSwCWJKAk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cXMZqIxSjVBYh0fPn1klEs0n3eiErW+MsOAyDLorX3kaMca6c0o5oiqVNGs8PnfQr
	 wCKQjgE2cCzwY9ZlsYV3Z9vfdIg3UQVm3OM1YGlPHUENUeFBprcw7qEGYHUbRiitwv
	 sJWm61Q5hIcpVPDTk5aaLQN57jVsgVdR+tRBx/F2F5ZBcDAjsnA1KttynrEyucpBsP
	 tJJjBzX2g9FkDJqpmzn4HPy/qBlKXaA3HXUNZqHpQz1y7NUZSJStIYOzOetbpiDfAq
	 Iw60nvw3EAGLrFPTuDoNTDU2alez3it1+MmeCOtyJzSTG/dn5ffieeCAfsNN1J6b++
	 m2yuH+rqbx5oQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250415011824.2320039-1-robh@kernel.org>
References: <20250415011824.2320039-1-robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: phy: rockchip: Convert RK3399 PCIe PHY
 to schema
Message-Id: <174722266452.85510.1639873129821152677.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:37:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 14 Apr 2025 20:18:23 -0500, Rob Herring (Arm) wrote:
> Convert the Rockchip RK3399 PCIe PHY to DT schema format. Move the
> example to the GRF binding as that has the complete block.
> 
> 

Applied, thanks!

[1/1] dt-bindings: phy: rockchip: Convert RK3399 PCIe PHY to schema
      commit: 1d6fc048b86b76db73073ded8e84b0fd8757c908

Best regards,
-- 
~Vinod


