Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF3A205E3E;
	Sat, 26 Apr 2025 21:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745703995; cv=none; b=hDQA0yWaJ4R4o/Xz54Iv8y2wL/51cTg8RERaW2DvqQEREszViID5XImtwjbJk4NW6yCicomab4npxDPhrlWuUWi8SC2czC9IdNVmVVbr0kxrmTkujDFWw/oEqZB7bXb7E0YzG5VdTs4MEawvjopzov/+qPHOD1V0QmIanxO3Sbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745703995; c=relaxed/simple;
	bh=eqScF0EHJuTDK+PZKK2EKx4ol9Xh1BwUdH6B7r0kY6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l8YKweN3L305WHo9ibdPQf3bjdoH7rSmP0CbHJ8erMnG5k4eoZ+YpK3znVu+fcg9RxE1+M6wwnEVvSyRRLoAFGVLlLgQZk4r3jVtAI8fkS8Xz3uz+Yia7O3mHlInaWyXV1xQi4e3D1cL21tbK//a1OJV5wI9Vw+HUvcYWW15tW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=0aWUie/t; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="0aWUie/t"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=1PPwkymYZC8xYiHOMvKBeSeonflfVA/++cGx6iEK8tA=; b=0aWUie/tnHEBtP7js4HSTrzYtJ
	5GGDUiUt2A+TZTzhTimEWaxvLM4ai+Ih6j/zkeJgJMQuLqDBzbH7wvBHcEBiZL7xWtVJ7vCMApV6/
	1KcvffwJgphub+BqVNhPzeHXKvaVsaJSFucrRRdu5cBIpiaJa70shjd5FSLIL6ZTH2/4YVS7fAq06
	0+/kmBTWfsnbRXJqy8MDbdjO802naRtOCYsPQW3opVcSQVAYNP3Pl6CV/f+qaf9gLHMCtjUZkZuTR
	6sjTJtX9x7bI8l+WPlgdTmVV5wlThuZvetcvBEG+7RTc4yqVdsUVWVRe6EVHaRd6daxcj+CytbZq/
	9tn1g0uA==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u8nLs-0001OR-Cd; Sat, 26 Apr 2025 23:46:24 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: Align wifi node name with bindings in CB2
Date: Sat, 26 Apr 2025 23:46:12 +0200
Message-ID: <174570370115.31943.9281326415535306804.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250424084729.105182-1-krzysztof.kozlowski@linaro.org>
References: <20250424084729.105182-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 24 Apr 2025 10:47:29 +0200, Krzysztof Kozlowski wrote:
> Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
> wireless-controller.yaml schema"), bindings expect 'wifi' as node name:
> 
>   rk3566-bigtreetech-cb2-manta.dtb: sdio-wifi@1: $nodename:0: 'sdio-wifi@1' does not match '^wifi(@.*)?$'
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Align wifi node name with bindings in CB2
      commit: 7ec0987da2c903d58167573e58b39d7ed19fc627

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
