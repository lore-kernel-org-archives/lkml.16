Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A731518DB0A;
	Sun, 27 Apr 2025 05:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745732393; cv=none; b=KXVXdyk38K1jKMziQu8vgWa98alfkXo2UxZVDxXKYNrVsbydKJRARrpmJuONxlDjoLEbB7r7384B0e725z/Z8WtdTEPmnfDQwzfMV5sYwh6AItifKSckVFgPhiC4z7/e7jDo1i0AAbKU6jrYg1Xh/v7fYpxPy+/xUI/SRZROyUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745732393; c=relaxed/simple;
	bh=H21k1pBrbn6I0vPZPACkqm5gr2fShDbnXJv+KMcufWA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mk61TgAdghedNy5arahXts5IDKfEGfwviLpr84KxSHuFHWYHANQdz9xt+xABtdqIO3y2KhaEuUFYTNce0fymCxIrbrBzt9ip+CFIMV1eyo93KTWvT8pnmVrDKQDda4GFHPhCT8oiwTeUw90dNSIQ2sVSJ7e7OuJlrBT/yF2/oK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD91DC4CEE3;
	Sun, 27 Apr 2025 05:39:51 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 3D4EB5FA0F;
	Sun, 27 Apr 2025 13:39:49 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: samuel@sholland.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250413135848.67283-1-jernej.skrabec@gmail.com>
References: <20250413135848.67283-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH] Revert "arm64: dts: allwinner: h6: Use RSB for AXP805
 PMIC connection"
Message-Id: <174573238919.922936.17995587846709082958.b4-ty@csie.org>
Date: Sun, 27 Apr 2025 13:39:49 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Sun, 13 Apr 2025 15:58:48 +0200, Jernej Skrabec wrote:
> This reverts commit 531fdbeedeb89bd32018a35c6e137765c9cc9e97.
> 
> Hardware that uses I2C wasn't designed with high speeds in mind, so
> communication with PMIC via RSB can intermittently fail. Go back to I2C
> as higher speed and efficiency isn't worth the trouble.
> 
> 
> [...]

Applied to fixes-for-6.15 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/1] Revert "arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC connection"
      commit: 573f99c7585f597630f14596550c79e73ffaeef4

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

