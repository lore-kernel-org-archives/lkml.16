Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9C922B8C2;
	Fri, 27 Jun 2025 20:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751056689; cv=none; b=TWeYmRV5dtnmOblcpmHeCv6nEc5wSs/rOKuBmMCEyADZ3gHFjZEcAnCWXXozi5vD9ixc3FRof2LvocFoiEjKrWxukLdvNY5uKnklmqPjTiXOnZKH+95Y11eM5R/TIw4DRTzYXEHySLuVVLRXvM7liYs2KTQ1BiPn/4907mC+KYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751056689; c=relaxed/simple;
	bh=VLsRMIIbHkcIiBubCm2O/Vz1rQK6YmG+Kz4kjvRqN0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MDDuiDgricr8eIlirVpu/7znHg1KM7yVRPPVyAdDxLtij1KvSRuAgdQzZL7vOAy8wM4/6+VSfOzxaFdkheW0ZHpfeemeHGaBCbfVg1x8r3XUu9fSyAdWebK9nRkOmnrLHS1pKcNBz4yyS5bxcmKlHQFC3x2duHVOjHpPk+CtDpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SKIP1j95; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SKIP1j95"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E939C4CEE3;
	Fri, 27 Jun 2025 20:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751056689;
	bh=VLsRMIIbHkcIiBubCm2O/Vz1rQK6YmG+Kz4kjvRqN0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SKIP1j956FjIIkOUncDjuT3hx0qNF41n5qrEKUpQVoCNQRT14I/QbIlMbuZZRzQGE
	 WRfRw3pNyPaFk74ZWQQM+CoP2UfMaiaJxc0Uyeqg19H/+YLzoqG40oymmerNEAJ0VY
	 qboL7vpIkacDV4GZNNg6iHvYpUYVYF/Q8hZjod64XS+BVejhySidY9eGsksc16/3r4
	 M0DLJZq5KxPIpXd2jPoPI9kzHAhW8/pPbYBZxtU1xNp5B73qdmGg3FEeGoUhf8gDda
	 uDGZujIMvAzm2buJq7BAJQIUf8rjlBKhV7Xgeo5j/CxSGy5uFMatAKJql1NZINKjSI
	 Hf1MqS/pHZYkw==
Date: Fri, 27 Jun 2025 15:38:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fred Chen <fredchen.openbmc@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: aspeed: add Meta Santabarbara
 board
Message-ID: <175105668797.42558.2699449089558464482.robh@kernel.org>
References: <20250625073847.4054971-1-fredchen.openbmc@gmail.com>
 <20250625073847.4054971-2-fredchen.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625073847.4054971-2-fredchen.openbmc@gmail.com>


On Wed, 25 Jun 2025 15:38:37 +0800, Fred Chen wrote:
> Document the new compatibles used on Facebook Santabarbara.
> 
> Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

