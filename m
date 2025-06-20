Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF66225A2C;
	Fri, 20 Jun 2025 07:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750404084; cv=none; b=u1ufxeJlLK7sD+onjcEGkaLgnWQmstgHq9INfBfOglvSywY7agKMY30/UCAZXLmTckNtXI0ZOxgESXzFeXLuwnONzEuBbf/60vOyi10ClCjJUgR3O2REXqUN/BMW6sjQg3rLqxanEDLlpSgdlpeSjD0SSWRR2vo12nne+KZfIkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750404084; c=relaxed/simple;
	bh=FSM2izM9vl5e3Hqb+oIj0xlTknp96G+HXI6ROxmh4SA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=rKV5qbTiFX3W/Mr1i697KMJ+DdZnfQMfU5HJR2ac+N6MPtUlzWkeZ1Ut2MUSuZL8P2dQhxb6ZPT+o5IXRm2U+qkMvlCMhPM2/s1jKMvU11JODI7ujSzvKr1HC3odFK/jlbEcqsxUNLapn7dk22UDTYeRQBHU1Gc9XvhLqpxNkrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UoRRXQiL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UoRRXQiL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 480B4C4CEE3;
	Fri, 20 Jun 2025 07:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750404083;
	bh=FSM2izM9vl5e3Hqb+oIj0xlTknp96G+HXI6ROxmh4SA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UoRRXQiLO+R0p4ZlmRLdszbRQ3CXGasmrKwf0KJAtOE1m1aqiOcZyZsaIRvWQ0pe2
	 MGK4ZpAvNswj+g4TDkFL74RdrdwXEHDGiGJ5GutrNTSYny0w/xp1YBHBFqW0TQ4vV5
	 2598p67FYgF/tkW5qSsuJVOJky9F/iaivYRZPf5Mj8TrNvU/f2SYzG0/Cll171zt1F
	 /1mexlZS5/AwibSZ16WWqdJ1jIqKHZF8CGTeMrZLsjA9QtNdPbE3kDRYzCJ3L4JEuu
	 G+vrC0+S2bM1j4RUdvuWezHWIcPv//+lNBM4SW1c1E1ojLb1BOk6V+0nH1tcvzPs0Q
	 4TUEO7h88wtLw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250404-kconfig-defaults-clk-v1-2-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org> <20250404-kconfig-defaults-clk-v1-2-4d2df5603332@linaro.org>
Subject: Re: [PATCH 2/5] clk: nuvoton: Do not enable by default during compile testing
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Emilio =?utf-8?q?L=C3=B3pez?= <emilio@elopez.com.ar>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Samuel Holland <samuel@sholland.org>
Date: Fri, 20 Jun 2025 00:21:21 -0700
Message-ID: <175040408188.4372.10647064030431437175@lazor>
User-Agent: alot/0.11

Quoting Krzysztof Kozlowski (2025-04-04 04:56:58)
> Enabling the compile test should not cause automatic enabling of all
> drivers.  Restrict the default to ARCH also for individual driver, even
> though its choice is not visible without selecting parent Kconfig
> symbol, because otherwise selecting parent would select the child during
> compile testing.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next
