Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0061525D1E5;
	Thu, 19 Jun 2025 07:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750318681; cv=none; b=dBxi/9l4yoqxQYjE7aEWjyV2ddagtRTFS3HIyZRbZcusuFywzqrnUXMpigA8ovIMuzbXctdq6LiDvvtWL8xrrHVcukK5pNGhn7Ik7fMEeSRvF7O4pwbtTtS7llespHiTTkKud6btqcHsMBP/7+bBqDDlpdwT2V5PSqlv0I5B6uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750318681; c=relaxed/simple;
	bh=Ih7bC5bhYbTmRpPMZBGaJQ8Pq8M2pDgtDYMsqv5VH/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j21jaYFL9qDWC9rD3apJCnGQLDmuZ2sMLwUiqcT1JjBcVonADGEUCRewq4ONp8/xoDpKyuXhUQrKL/70Ig4lM25BKUb9S7HcG8uXF6uFvjrWEmTuG+NFG0lu5255EZdbefO7bZb194AK4zaWQRK2pXLZjSpXEi1euRBOOHl2zSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X6mtIv+5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X6mtIv+5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0A1AC4CEEF;
	Thu, 19 Jun 2025 07:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750318680;
	bh=Ih7bC5bhYbTmRpPMZBGaJQ8Pq8M2pDgtDYMsqv5VH/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X6mtIv+5mMpVDsOa6GEQ+nq+5YkMSPNkvlbIzQ1Ew/NGgm6t0X9yaA2YP7urhUX3b
	 +k+jOnYNJ6PfhRyK5bKPPweQKmTevzktmft7Kp9pdNrk+RVIqQSxzRyCrP9EsnTzTD
	 KhfnK2BJ84YxSoBjHqYKxKFXD0P/m9qxcwqvfSnw0952rqiFfh7Ks77CBnHXHwNR2v
	 lCGolP2eW2mrFoYghhWPxBxiKbsB5TS3XtzCRvol1AV0k6bbASL22g8IyRk7HoagJz
	 BXb9dfMxUWU4MUlQeEx2CYf6hnJU8G/T8Ox+vH8X7vekCbEPr8je3TIhn7VKurV2tV
	 Vlse/TdsvSGbQ==
Date: Thu, 19 Jun 2025 09:37:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, 
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH v5 1/4] dt-bindings: clock: add TI CDCE6214 binding
Message-ID: <20250619-nonchalant-benign-ape-1fb180@kuoka>
References: <20250618-clk-cdce6214-v5-0-9938b8ed0b94@pengutronix.de>
 <20250618-clk-cdce6214-v5-1-9938b8ed0b94@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250618-clk-cdce6214-v5-1-9938b8ed0b94@pengutronix.de>

On Wed, Jun 18, 2025 at 11:21:12AM GMT, Sascha Hauer wrote:
> Add device tree binding for the CDCE6214, an Ultra-Low Power Clock
> Generator With One PLL, Four Differential Outputs, Two Inputs, and
> Internal EEPROM.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../devicetree/bindings/clock/ti,cdce6214.yaml     | 60 ++++++++++++++++++++++
>  include/dt-bindings/clock/ti,cdce6214.h            | 25 +++++++++
>  2 files changed, 85 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

