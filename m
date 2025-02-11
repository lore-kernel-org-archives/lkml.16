Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBB01F0E21;
	Tue, 11 Feb 2025 08:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739261866; cv=none; b=r6lu/W3ETPSUs3WH636cpOkrN2g6YXlsMhTXCvkEU7EUKhK8/RJN9537roF5g/EATEnGRANrZZqYmn7fzY14KSVMT9qpIUyTgpLsLHv1tRSgYmuvRMwjhhjONmOezNE53y4kJGFFdiuS3z+8bys6ByE3sUR4GO04k+zW8v5vyn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739261866; c=relaxed/simple;
	bh=Rhu162EIhM1z2w4T5glLEdRgvuphMT5lNfv79kXrgZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hK6r9ZkNKoL2H1xUMex7Klod7zhr9Z8mE5YpHADfKzteFY6BmIKjn7H597uT76aoVISt3Obd67P29wtdUo6yRU9vIZrIJihC+LPDpbDR9j+/o3DrZipGLa0O4QRSfZd5jfUMO58wdNoAnq20pv3gaN5cmPBazUnevkE1uBl/LuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fi8qdzTN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fi8qdzTN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38DB8C4CEE6;
	Tue, 11 Feb 2025 08:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739261865;
	bh=Rhu162EIhM1z2w4T5glLEdRgvuphMT5lNfv79kXrgZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fi8qdzTNv5o5L6fULK5uB2A8iFz0rpLxfz9BzCcQbs++3URe8eKfSZyPMv0nGybMa
	 ENrEJh94hP0C8V+77xFjgzwwam64bLelN/HEgdamZ7MmlHYUAm3O3kQcww8Pp1vF89
	 gqBgHPMW6KrAG1RuvyYW1kI+4cLMj+KJaMVJ9vPNd1uZ4NGrI/PydQOtkzLiaNHOVz
	 p7EgbGECVZ+jfPckA1DTVPSavkJV0ih5VQbkcRIyVdV2Cv8KVvhXrOCxHv8NGaVVfL
	 8xd+tbRE8u9h4N1UeDwahSTZqxFm6Pc68LkMpMXcxuKvv0azhCbEsUAM6iR640mJE3
	 X2qJ4ZNQc4nmQ==
Date: Tue, 11 Feb 2025 09:17:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, linux-clk@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/3] dt-binding: clock: ast2700: modify soc0/1 clock
 define
Message-ID: <20250211-encouraging-free-aardwolf-0fabb1@krzk-bin>
References: <20250210085004.1898895-1-ryan_chen@aspeedtech.com>
 <20250210085004.1898895-2-ryan_chen@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210085004.1898895-2-ryan_chen@aspeedtech.com>

On Mon, Feb 10, 2025 at 04:50:02PM +0800, Ryan Chen wrote:
> remove soc0 clock:

Why? Your commit msg must explain why. What is obvious from the diff,
isn't it?

>  SOC0_CLK_UART_DIV13
>  SOC0_CLK_HPLL_DIV_AHB
>  SOC0_CLK_MPLL_DIV_AHB
> add soc0 clock:
>  SOC0_CLK_AHBMUX
>  SOC0_CLK_MPHYSRC
>  SOC0_CLK_U2PHY_REFCLKSRC
> add soc1 clock:
>  SOC1_CLK_I3C
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  include/dt-bindings/clock/aspeed,ast2700-scu.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/aspeed,ast2700-scu.h b/include/dt-bindings/clock/aspeed,ast2700-scu.h
> index 63021af3caf5..c7389530629d 100644
> --- a/include/dt-bindings/clock/aspeed,ast2700-scu.h
> +++ b/include/dt-bindings/clock/aspeed,ast2700-scu.h
> @@ -13,18 +13,17 @@
>  #define SCU0_CLK_24M		1
>  #define SCU0_CLK_192M		2
>  #define SCU0_CLK_UART		3
> -#define SCU0_CLK_UART_DIV13	3

NAK, ABI break without any explanation.

>  #define SCU0_CLK_PSP		4
>  #define SCU0_CLK_HPLL		5
>  #define SCU0_CLK_HPLL_DIV2	6
>  #define SCU0_CLK_HPLL_DIV4	7
> -#define SCU0_CLK_HPLL_DIV_AHB	8
> +#define SCU0_CLK_AHBMUX		8

NAK, ABI break without any explanation.

Best regards,
Krzysztof

