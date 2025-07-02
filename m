Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6848626E703;
	Wed,  2 Jul 2025 13:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751464569; cv=none; b=PFjFEoL5LtvFrfSOeUyKFLwAZWKD76Y/XT3vsG/o4LE9N3kMg9iu2sNFIlAb5kgM6v3BSGRSPBeXx4qMdY/QjuF7yuh4m3oKYI5cTslA1rkGVrNCDJa9WpidoJAgwuTeoFPIiDTxCKg8mZnVyiZoC+oB+6uo/5+8SDPf4fOJrnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751464569; c=relaxed/simple;
	bh=WtBsD7bFa/td4ItScapL6sHI3Wry7a5SITse4w2Nv58=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hf9y5GDUzsyGC0e62WkZebyAIZtkzzYhZYaU6G17oEI/C3Gh9hQloh4vFTH0+calFtsYf5i3czBNgrQ3G8blYwL6jcgiQX1toJiWNOX/Dma3vY5zx+F04CtdyBnN80ZreufmyFJtB/EcRy6YDBhKCPJzR9mS8LWXjOHXWnOPt+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A3EC4CEE7;
	Wed,  2 Jul 2025 13:56:08 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id DE7D75F949;
	Wed,  2 Jul 2025 21:56:05 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Paul Kocialkowski <paulk@sys-base.io>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
In-Reply-To: <20250701201534.815513-1-paulk@sys-base.io>
References: <20250701201534.815513-1-paulk@sys-base.io>
Subject: Re: [PATCH 1/2] ARM: dts: sun8i: v3s: Add RGB666 LCD PE pins
 definition
Message-Id: <175146456585.641360.7859504612515623199.b4-ty@csie.org>
Date: Wed, 02 Jul 2025 21:56:05 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 01 Jul 2025 22:15:33 +0200, Paul Kocialkowski wrote:
> The V3s (and other packages) supports RGB666 LCD output on PE pins.
> 
> 

Applied to sunxi/dt-for-6.17 in local tree, thanks!

[1/2] ARM: dts: sun8i: v3s: Add RGB666 LCD PE pins definition
      commit: fdc0682e1153a6180eaab35033b05ad4ce35b6a5
[2/2] ARM: dts: sun8i: v3: Add RGB666 LCD PD pins definition
      commit: 62ac3b380334ca0be4f7b2b1bfb3dbbaf2efcfa7

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

