Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633CC29C34E;
	Fri, 11 Apr 2025 12:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373445; cv=none; b=FpvW/8UHhxRr16fD3083VwVbc4BzoN1eMQUNKdMegDQ3qCZ3QGceeuljmrv6hntRU1jUY2GhZFCPjqf619SQ4m+bDn5OavkiJ73o6iks0oYADWjzZncu8Mgy052RuCGoHQN8Vq7ZYlLdk/pBF3XZssnNDGDE6Ou7ZUxv296Clzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373445; c=relaxed/simple;
	bh=bef+HJXcEo2hORvZPJWuTpm+dOfyv21lTNoivV+wiLQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Obi/jg61wrfgg97dy5er90W78lgqbBExq0Xr+bygBOfMB4yCkktAT/gGY3QnAboNJXGHCTPgbCXrt9aDFlCgkI2HBKXFoFfN6oURJjaqR9oCTr6sHbOSg4wmFzuRW8pXwyk4iObuOMmuTsO907WPmv3Efyx0Z+QSkL7cmmVC/sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EUQNS3Tg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EUQNS3Tg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6EEFC4CEE2;
	Fri, 11 Apr 2025 12:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744373444;
	bh=bef+HJXcEo2hORvZPJWuTpm+dOfyv21lTNoivV+wiLQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EUQNS3TgW4ma5b+9diC1JS/QSa3on9tCBUIieI+S3+FKCYTQCBxu0Q5Lm7WxP0C9G
	 jmTtYq1R2foBthUicTIZLURqxEUVKiAm1xi3yS1nmBl0giAgsKYf3D+23ztucU5UWe
	 LfZex2TS41FS6nMNCTgL5MU45QNz2DbQ6cQ1luO3Ng7CtltHZcrSrYAGUHI2yWmXBL
	 5tn53k04JKavpMLGyI5DHaV8ENyl3w83Emww0DZUmSdtOjLYYwrDXnVQMdh3uqo+6/
	 z+frZgXCsR87+JR+3s8a3vlNgC8B+o0I6DBOjudAKXwhO0G+taW5VybSWG3oJV5sdq
	 JhBLze5q0F96Q==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Frank Wang <frank.wang@rock-chips.com>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250407165607.2937088-1-robh@kernel.org>
References: <20250407165607.2937088-1-robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: phy: rockchip: Add missing
 "phy-supply" property
Message-Id: <174437344138.673939.9714886269957011717.b4-ty@kernel.org>
Date: Fri, 11 Apr 2025 17:40:41 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 07 Apr 2025 11:56:06 -0500, Rob Herring (Arm) wrote:
> Several Rockchip PHYs use the "phy-supply" property, but don't
> document it. Add it to the current known users.
> 
> 

Applied, thanks!

[1/1] dt-bindings: phy: rockchip: Add missing "phy-supply" property
      commit: 070d546258257c75c65a2f15da558eb96bce550c

Best regards,
-- 
~Vinod


