Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18E9200138;
	Mon, 28 Apr 2025 08:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745829536; cv=none; b=lSr/CNVD6uGpdmxOFAOjb40++tzAQ5r9s/gHC1DY1EIqsa5NLCKO8c3dKNIGUIFGjrKk0Oa8c3pTqAkfQjbpRKr9eZYiMyLLg1ua2WTfL2Jynz0aGRqqCtYoxxrewUPPpDDa/lCfmWifu/id++Dxbt3UWim4TbRcqTIZRei3nDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745829536; c=relaxed/simple;
	bh=LZ8ENyCzktoqNokGHZMzWBrPs0WotFekQ7wV/XYpdUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oliJUzJ+RhD5nB3nUHU0lZrlo2wEtbu0rQgci/h645qlrUsWXCzEdrfqD6UV5zWtMI2ZilDJpnt1c2dH5AJ68q5lP7I4NJjLdR6Htpv3b6cirbpNbRYxLOOTlb8fhwDrzuWuCUxlT2/CP5FiROi0KAXFK4DJKn6rRTZDSkzqXE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sFuy/fKu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sFuy/fKu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA5BEC4CEE4;
	Mon, 28 Apr 2025 08:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745829536;
	bh=LZ8ENyCzktoqNokGHZMzWBrPs0WotFekQ7wV/XYpdUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sFuy/fKuEuGT7+ypxv3qVz8CGh1a4EzkBT5DBwlnDKzPN+YXcTaZnZ5hpz7ZjKAlt
	 NygqnKH1qtRVdzGeEUGoMYaLfzGef73WwHTIzKqXs1aYwuGHpH8ezzSHUGEpaSvSIu
	 vSqKsPgCoYPREfAbwvOctLy9IE5QEmWqTnnjBdWm56QYpWB3w8cy/2awRe1PyhjYBV
	 jZ3jiK1ccK9QbzHzJQLG4jToOz9OeBYQxuS4Q4GVkLhuo32vZaQqRtG7155gQ1/Tgx
	 P0TNBvnl+lj5KM2GDzatRIGrJuh59OmgIOCvh20gBBwzKZ2ySxEE8JxB4b5+eC8IvK
	 Ya9Dn4SsNBPdg==
Date: Mon, 28 Apr 2025 10:38:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-amarula@amarulasolutions.com, 
	Amelie Delaunay <amelie.delaunay@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Leonard =?utf-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 2/8] dt-bindings: arm: stm32: add compatible for
 stm32h747i-disco board
Message-ID: <20250428-hasty-fanatic-quokka-546887@kuoka>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
 <20250427074404.3278732-3-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250427074404.3278732-3-dario.binacchi@amarulasolutions.com>

On Sun, Apr 27, 2025 at 09:43:21AM GMT, Dario Binacchi wrote:
> The board includes an STM32H747XI SoC with the following resources:
>  - 2 Mbytes Flash
>  - 1 MByte SRAM
>  - LCD-TFT controller
>  - MIPI-DSI interface
>  - FD-CAN
>  - USB 2.0 high-speed/full-speed
>  - Ethernet MAC
>  - camera interface
> 
> Detailed information can be found at:
> https://www.st.com/en/evaluation-tools/stm32h747i-disco.html
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

