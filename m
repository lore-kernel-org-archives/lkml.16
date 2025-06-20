Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3081130E85C;
	Fri, 20 Jun 2025 07:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750404095; cv=none; b=l2vfuUxN5rv6j2bdNFDcgI2sJMdKAxZq7p7S7vareSvIQqGJtsgEo/phGOGN3/f4bjqF1LtAxNLHOOvM3/OC+FGqbbCUsLrp26/zII3goP6YQjdZSiK4Nz31tXgW3V7MA56islH0+DcFiHMTc0/2z39m+C1B7NdQN/zapePae7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750404095; c=relaxed/simple;
	bh=Itc9ddbP7s53ig+Z8sahKa7vHJExHczg9UB74ndkSPI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Yf7e6LqbWcHcTdGXmxpfucVuW2jPlo0E1tE6MJqOwbK92uI4U7P4twfOkQsNDzl4LH4VMipXGUWaTm0nWiWd/u58tD96c46EMyFuwTzJmRyByVCN8p9mJTGrzLxWwapomQLIBasE+K2HPTyQ+YX3ZQeNNI2sb1UMUdXlfquJgUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3ibzmw6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3ibzmw6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FFE4C4CEE3;
	Fri, 20 Jun 2025 07:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750404094;
	bh=Itc9ddbP7s53ig+Z8sahKa7vHJExHczg9UB74ndkSPI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=l3ibzmw6cfD/1zap3DXnKrGsKBbjSdP8g0Via6HC1pavu2/ECH2MlF9m04hMRtL7A
	 JAn1iwABQotzPbFEaAPh7yXXCzjXVvRJZPg7J5lj5hXBpcTT5pecqu6Ap8h1z+qlG4
	 +7pHonS5IHIPoOvrl9RDESnG936EtL7S9Obz6oDEURnDYFxrizS7DVcro3tfU+tL/N
	 oRi5BZW0FUfhbMhbPSk5Ij6detl2UaZ08imnUq2iC67HH40M0FTgva+2wbeeTH2ymZ
	 xFbXWmttm2Cb0WPzCj5GVJLJeNEE4HTeCRDTAEGVsX3rhcYMBp1+ysj6u/SASmOl83
	 WJNvYF7qYzU1g==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250404-kconfig-defaults-clk-v1-3-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org> <20250404-kconfig-defaults-clk-v1-3-4d2df5603332@linaro.org>
Subject: Re: [PATCH 3/5] clk: stm32: Do not enable by default during compile testing
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Emilio =?utf-8?q?L=C3=B3pez?= <emilio@elopez.com.ar>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Samuel Holland <samuel@sholland.org>
Date: Fri, 20 Jun 2025 00:21:33 -0700
Message-ID: <175040409330.4372.17935739040360849030@lazor>
User-Agent: alot/0.11

Quoting Krzysztof Kozlowski (2025-04-04 04:56:59)
> Enabling the compile test should not cause automatic enabling of all
> drivers.  Restrict the default to ARCH also for individual driver, even
> though its choice is not visible without selecting parent Kconfig
> symbol, because otherwise selecting parent would select the child during
> compile testing.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next
