Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F48111BF;
	Fri, 13 Jun 2025 13:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749821837; cv=none; b=sxaJEm5cZVe7tc54OodJcx7L24BU6iUZE/95B/5Y3kA0HCS+xe0brpFwCpIYR3p0UU4xrQAjtfkq3EVcNr5ChX+Z+cXVYoTsqZ6Pyw5yrs7++fMKDNFaE3nTTzyQ06x0qgJzZI4mKaVv3+vaSx9uX9awGfLW7bh+7gX6FPdt0cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749821837; c=relaxed/simple;
	bh=bU0hBkzZ4K3yFPGajYRk7UGPNkADcS8vp0MAzxdBeCA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Awb11vh3u5zpNtSoe95TNgLdotjUmyHcKqid/1Jy6Y87/l9aqqtUFvMGDzSsO4HU1gSM88QYpF3J6qxxcBTqIvOxR5UVal9y+av7zOEXTmt2o7faBG7TpuupwCfCKzSaLfVsNGqSDeMSXJS80Hqsb4k7nWQDkrtRtBiHFTEv3qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2exNd+l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2exNd+l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51176C4CEEF;
	Fri, 13 Jun 2025 13:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749821837;
	bh=bU0hBkzZ4K3yFPGajYRk7UGPNkADcS8vp0MAzxdBeCA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=M2exNd+lb3hDYp4bZQdJ2V/WXIxIlh8wvYQBrOJsSMR824P11BqGx6fHNBA3cISIg
	 cFw6h+G/h5nji/MNVyRqmj8+OUdZkR7nZ40QOxLNaeVtE7rDvqfyes4D2FIBO5Kyj0
	 Qn2RPIwf2SpQrF5Gw+upe2OXCMa+ZhTV3GBU4zCGcYbCC11JDioEzdbf4hH5HnhlsG
	 iRTQCbzm5fRkOqXyvQJmebiNjEqFDAtNaNMpXkLv2BlvlMUfI2wv0sX0gHsPBb25zC
	 kMtyqVfiUOgNl/pbkbTQmvcVcEJUtq7OPa0jiR0Wr56+PqV2zPa6GWweaOEXNyalmB
	 xECQvg0xvl8xA==
From: Lee Jones <lee@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250528121306.1464830-2-dario.binacchi@amarulasolutions.com>
References: <20250528121306.1464830-1-dario.binacchi@amarulasolutions.com>
 <20250528121306.1464830-2-dario.binacchi@amarulasolutions.com>
Subject: Re: (subset) [PATCH v2 1/4] dt-bindings: mfd: convert mxs-lradc
 bindings to json-schema
Message-Id: <174982183407.898403.11770383898342698811.b4-ty@kernel.org>
Date: Fri, 13 Jun 2025 14:37:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-459a0

On Wed, 28 May 2025 14:11:38 +0200, Dario Binacchi wrote:
> Convert the Freescale MXS Low-Resoulution ADC (LRADC) device tree
> binding documentation to json-schema.
> 
> The clocks and #io-channel-cells properties have also been added; They
> are present in the respective SoC DTSI files but were missing from the
> old mxs-lradc.txt file.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: mfd: convert mxs-lradc bindings to json-schema
      commit: 799f007fbb961b4bb19ea63eacaf20d6deb56f2f

--
Lee Jones [李琼斯]

