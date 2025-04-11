Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C522BE7D9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373453; cv=none; b=ZvoCZzNouTeayedtFwExF/eGS2bM8X9MuQ1Th9XkBvGSmrd3RpGPqKA2cZJgES0g1I6MDkOJAR79HyRdI0XLmKCGBlwlWJiG8Pn2wjGqlL3HJABKWhkbH//jVsmIjq2ppPrq1t8ADByw+6BnNOBCA6kozDFcuLuV5c+5NkbrK8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373453; c=relaxed/simple;
	bh=qxljhewYd8uQZhJ5liuBCuqJPGFbVQf70VSK71PakAg=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kGvkGlqMzdwpG1kqr0BzHSpcdvsgRgujm5chr3NTaSTG+5v7fWekTFI//LAH4uyM83+f9zDjNG6VfJXmwOIDTlRFKOQazjz+dVfqvMIfocglMimbY/qImc9XiL8jSEFNikXQTLOl7Od4xkosvtPcq8x0O4ZQromT8JCg5TdZ45I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/I7n/nE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/I7n/nE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 029C7C4CEE7;
	Fri, 11 Apr 2025 12:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744373453;
	bh=qxljhewYd8uQZhJ5liuBCuqJPGFbVQf70VSK71PakAg=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=k/I7n/nECS42xSMcy4SZNPq38kiNBu5aqr9flo3peZIptSXzlnB27dlTj7Kud7nB5
	 19RAH3Y3sOPX8i0542gTDJRswQHP228U4ix6QNTF+5n8GCEn3cegIih8NeKepSHanL
	 dV8yNZigkBnFrYiRNI+FSA/trBFLSFXVZGJSbIsA4NM9dMa7KJb+peefNRAw1WqKAQ
	 qK3en53tCHE+bQU/TPWlFjfqzNW4LbhXd4yyBK09nI3BkFxNOfHTl9pWKbxhfkdtpl
	 3fnBdPrUW/VVmWR2W6UsFpQLBIVHMfs7T7y/qW4yYGpm3qq2X+ZDd1//g7t5+olNlu
	 T/OZO7twLBLHg==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250404121326.318936-1-krzysztof.kozlowski@linaro.org>
References: <20250404121326.318936-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] phy: marvell: Do not enable by default during
 compile testing
Message-Id: <174437345164.673939.5767205456999337217.b4-ty@kernel.org>
Date: Fri, 11 Apr 2025 17:40:51 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 04 Apr 2025 14:13:25 +0200, Krzysztof Kozlowski wrote:
> Enabling the compile test should not cause automatic enabling of all
> drivers.
> 
> 

Applied, thanks!

[1/2] phy: marvell: Do not enable by default during compile testing
      commit: be62baafc24105b3803fe7e09cfd23247588eb80
[2/2] phy: samsung: Do not enable PHY_EXYNOS5_USBDRD by default during compile testing
      commit: 6a9accd65608559c4e00ca5480e5d298bf329217

Best regards,
-- 
~Vinod


