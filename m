Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15186126C13;
	Fri, 11 Apr 2025 15:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744386279; cv=none; b=sQCQvGzr4kWdFFdvGFSczBJQyEQdqXsw4GpdJ15eZuFnynFAeUOn19Z1TeiDuDCZQtPhwFIMF8ne7MXZve7ek/TruTgzUthpl39J5z79YVvJU6xqzYrp2HpghrEIpEw1MU9awUcWVlW8/hpQm/OrNWSS/ofhX6Cn0MXvGaZ1Mvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744386279; c=relaxed/simple;
	bh=vaYUHzRSyveXSy4FdeDJJYvBrK8TJfRBouXRgYzretc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UGWBcrB+zVWKCwB3jYtKZJu/vk7/WHFRrUjUnRJ4hOuvRLZqdcrEw484jvC/p4+VBQbkPsMOwDk9201vamU3w+08amJAVZZQk733vG2od3q66zWdoB+W3l9EmIWAwDRGYtajsxnG78tUp4AnvsgRIyCQ5hRMiZen5ofu1ChFSbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7B6C4CEE2;
	Fri, 11 Apr 2025 15:44:38 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id A740F5F863;
	Fri, 11 Apr 2025 23:44:35 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20250409203613.1506047-1-robh@kernel.org>
References: <20250409203613.1506047-1-robh@kernel.org>
Subject: Re: [PATCH] arm/arm64: dts: allwinner: Use preferred node names
 for cooling maps
Message-Id: <174438627562.2569515.5719390722381962161.b4-ty@csie.org>
Date: Fri, 11 Apr 2025 23:44:35 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 09 Apr 2025 15:36:12 -0500, Rob Herring (Arm) wrote:
> The preferred node name for cooling map nodes is a 'map' prefix. Use
> 'map0' like most other platforms.
> 
> 

Applied to dt-for-6.16 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/1] arm/arm64: dts: allwinner: Use preferred node names for cooling maps
      commit: d94a1c93673728e6c2bc678fcb047a7e730f2e06

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

