Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A091156F5E;
	Tue, 17 Jun 2025 08:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148153; cv=none; b=FbJc+tIxL48SCuswhS1ydZLvV2qg6OkHYnXmhn2bFc1xt+e+4HZsAAh1imD0bFF7O1SrGv1bxQctrVx75mW0gAMzlceZszlfPfDQSvlh1hnbQEwfJwzTXryna1UscLwCsBKXXd20t8slWuj2YmNGMLC4Ta4Tuher0Ff/Wd73ujA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148153; c=relaxed/simple;
	bh=fk7f/dwAlQZgX1NDAdsyqWiKhDe3Ny7ZLAxMuT9Ey1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VkedWdLt1sBF3s9+A/je0xgDAvAhuiGXxNpLxoP/T2kgkAwomrMTRzBxXE0CIlHIGAS3LgJ6cxd5CLQMGxldP2ZQ3ZwfckxsB2yTM6z3FEjKgK6JZ94tmgY4m1XPVKbByuJ9QhGD+dBHtxYClxj8eBswgA+58ARNiNCqBzY41Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qcBYmil9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qcBYmil9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0BEC4CEE3;
	Tue, 17 Jun 2025 08:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750148153;
	bh=fk7f/dwAlQZgX1NDAdsyqWiKhDe3Ny7ZLAxMuT9Ey1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qcBYmil9r5O3EBpoJ0BbQRjvlMSqAA5PHa5Y+GYe0aRbvCiXSCPO6owyXOPrccGs5
	 VIkwFIqZ55cM1NZJ5xLZYgXDxGu3ZqXG5PGYhaeC6LW0cK6kvD+Qoa75RXddYQfqIm
	 +hdGavwnArcWcrwwrfPrzNW6djgn7BjYZyoFBWn05WbXiDcrMkEpFeMgR0BwO+rzwz
	 OZp+mvnVEKB7CrWw8PNFZ2euCjEOao2ZL7imO+gwOis+2ImQhQuqB6jGhnvfIHtZ7e
	 /Of9iN5HSskErlb3m5rrkopt3VCletE4ojlET9r9s8A10ISlHBwgKbg8/04nQq3XdS
	 DhOqBiulVt5ow==
Date: Tue, 17 Jun 2025 10:15:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Roland Stigge <stigge@antcom.de>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/LPC32XX SOC SUPPORT" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: arm: lpc: add missed lpc43xx board
Message-ID: <20250617-hound-of-improbable-intensity-e7c3c9@kuoka>
References: <20250606164012.1363896-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250606164012.1363896-1-Frank.Li@nxp.com>

On Fri, Jun 06, 2025 at 12:40:11PM GMT, Frank Li wrote:
> Add missed legancy lpc43xx board compatible string to fix below CHECK_DTB
> warnings:
> arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /: failed to match any schema with compatible: ['ciaa,lpc4337', 'nxp,lpc4337', 'nxp,lpc4350']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - move to nxp lpc32xx.yaml
> - fix ea,lpc4357-developers-kit include lpc4337
> ---
>  .../devicetree/bindings/arm/nxp/lpc32xx.yaml  | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

