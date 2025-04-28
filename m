Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0803E25F78D;
	Mon, 28 Apr 2025 09:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745831852; cv=none; b=Ne0wFY8BKMHtVocfDBixjl3m2BN/tKgrSevklLyG1xzf3fkPKFSL9YHtMnyFOpPIIwv3SSpVB4uhQ6anlwS2bh2mGaVoZDccGCLujT9/xJlVkzXSYvTR0n90WpP3JQwYHLYgMRZmLAcF04w6Ia590C4sFwBbgZptGUfKIVm8oh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745831852; c=relaxed/simple;
	bh=rVoSXr4jghjdCMyJc/6II40yfja/uHfb4SXOJ3XhWyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fEZE4RGnsabsoNjHR8nBRxPqZbSzGaxT4JA044/Q3pHy/7Zd+XN8+Wc3zajWrwQBD8zXqGHPw2gt7pWFTq3Ko3nSN5sfIgXCcQSzr9mgqevgWzDmO5AF8Aao98k1c5Pb2ZWGC78oqDEL6ePCHRDiqeo9Kf1Mzcgl6xYmosy6tB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qa6umChS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qa6umChS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCEEC4CEEC;
	Mon, 28 Apr 2025 09:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745831851;
	bh=rVoSXr4jghjdCMyJc/6II40yfja/uHfb4SXOJ3XhWyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qa6umChSdPLZ3KSNEbFHIbUpDSPBvEFVU8GSDUKva7coZw7Mt3E2w0lFkx5XwSHXl
	 1rn42r/+Tm5M1vMlImdr9YrdJleJp5+H6gr+cBuQlbjR2OsgGr5JnannNkj3geC5sB
	 gV7eLE4rj0CZoYLQNcDl8K4tfSPtJyUBX99xxhLuOqcb18ri+MjYgtzIVMzzC7Or26
	 jeM1wxFq5fUfNQKOcyuhyzmuVQ0ggliAP+tTtXBenKw5m7ZK3loHNE+RpsposFsTqw
	 z26aJqqq6GxXmYanrQfJmUpbN+slofEEynpUM4o2YUvZKdPGmYuqqp2FJy337fBwGR
	 ZrYm1kPWBDfrA==
Date: Mon, 28 Apr 2025 11:17:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 4/8] clk: stm32h7: rename USART{7,8}_CK to UART{7,8}_CK
Message-ID: <20250428-hysterical-smoky-mongoose-f6dde6@kuoka>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
 <20250427074404.3278732-5-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250427074404.3278732-5-dario.binacchi@amarulasolutions.com>

On Sun, Apr 27, 2025 at 09:43:23AM GMT, Dario Binacchi wrote:
> As stated in the reference manual RM0433, the STM32H743 MCU has
> USART1/2/3/6, UART4/5/7/8, and LPUART1. The patches make all the clock
> macros for the serial ports consistent with the documentation.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  include/dt-bindings/clock/stm32h7-clks.h | 4 ++--

dt-bindings subject prefix

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

