Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9A427510D
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222642; cv=none; b=cfT8gROvSRu67WJu/GCPB/47CYZWjAhrbQnqeoNQrDemDAUUr2hGNblELNU2VTGySXhYqoNyxQjjNL7n4oE+yhV5Mn9UpHWpBGhzgyRMm43nvRrAS27OIPZYCsuHlt1HL04SFeAu3DKiZz0mpcZnC2K+T/6bZZM4asBxjWWaB8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222642; c=relaxed/simple;
	bh=i533NMeV5GO7/xUYiXrfMLveCBR6FPalyI6+47rPinA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PEdEIulNRGHOGMIlW7kYA2QY+3dUeBf6orLPLDD0uWa0x2SZCkOemGJxDRrqTQSWCIk3hdRIelJOzk+UDrhvC1r6glAW9LLyMyGZlVe7XF9od/f2hIEw90Arsfj3J1p2LJk0DkzWVjCkTT6WsyzHn0Be7MnmvLl0CtHXc38cSic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5DCbJdD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5DCbJdD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3511AC4CEEB;
	Wed, 14 May 2025 11:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222641;
	bh=i533NMeV5GO7/xUYiXrfMLveCBR6FPalyI6+47rPinA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=B5DCbJdDVntyYKsinJJZkSasBRsJRoIJbKDNq0evLfR5lBVlzCo3GjKAMoL5xXgI8
	 6RrU/kNHwaLRNUh/Kc1Va43x0qX8rJCbT5pgsVAHKLNukv8kPSUNWc9Cpjv3Kjm4Hf
	 CFXTEkOaiVAMsS+DmJaMCILJBIa97FDqWmA2xaQ+J+ucod3JSEI6wP9Hs95WL+ITbp
	 6FJRJZdJs72MtXP0gIrsnLKkCKUj+KHQBilQdjtXp4Ok/XMTAqPUNNhA+xVKysVTb7
	 CvO+e1DQYEC3SUoKaAV3ykq3pdevrjaOnrH4qmxuQkvSCEUyGoL+zDg9K03UmNAKri
	 rDsC51GYixY1A==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, heiko@sntech.de, Chen Ni <nichen@iscas.ac.cn>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250415081200.349939-1-nichen@iscas.ac.cn>
References: <20250415081200.349939-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] phy: rockchip: samsung-hdptx: Remove unneeded
 semicolon
Message-Id: <174722263987.85510.17860995825685488845.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:37:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 15 Apr 2025 16:12:00 +0800, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> 

Applied, thanks!

[1/1] phy: rockchip: samsung-hdptx: Remove unneeded semicolon
      commit: 3b2b414927dcbd866c99ec92e3a214a69fc51c90

Best regards,
-- 
~Vinod


