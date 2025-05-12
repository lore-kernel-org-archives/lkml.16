Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC132253F1C;
	Mon, 12 May 2025 16:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747068870; cv=none; b=nDHJ4RmK2VJ3+nf9eTEBBoUtV57y55ODVnSRux+8QTgmpHYIFG4kvsMGrFk0CUSABjIX68GGylAcbJg2VT+8g+/l1nJHtVYNZGsj3N2GfRmue1e1zAs1osEtghH/twkxToQuij4vzXfkyta1tUl+hysUHCMx8edmtM7EdEH53ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747068870; c=relaxed/simple;
	bh=v8YP76OSQkJ+jZugp5dkNzFbI7u4ptwVFaT/PQOaqs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+nkeR2bDrLO0KE/kOC/PbP2yrpTxXYKxCgtdxCgIDS6HD9ZQ76KCEWB2+x2pLpca92UDeekolPJ+88P+Bb1fY70CSweA7rK3MZmfRFrub/1AyLjGnINGinoDCd0S/jOH8HwRL8ZDNLzLo1ZtC0VxhXfnv/dDTPgNo8IpuhEE8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZHfa85kr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZHfa85kr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B954BC4CEE7;
	Mon, 12 May 2025 16:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747068870;
	bh=v8YP76OSQkJ+jZugp5dkNzFbI7u4ptwVFaT/PQOaqs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZHfa85krTALDXckFn1ygz3B+HxjcEezmbPPlyheHYS7jESvlZPqQOJFyhpulS82IB
	 SsvE1/XfeZbTyD8aRtz9Hav3hqWsgdnpTPqc/GxIx6tK8/0JH6l3E34N6A0A2aCPaj
	 iZLQSUbrefiYpRE7l+aIRQphN78QPi3au0lLu7+APHIXcfCRAB8vPaf0VJWb8cuUHj
	 sS5/cu+nf5wPf5nF5QUmmWbaINvN0XrkPwhQzB4iUe7zkLIo7BR+j8X+Tof23Yf61E
	 9ALxd1OaQRq7NPkWU59GSrQ/FCvqsEv//btEZFH615+sRkAiYQ90nAvdTIIt1ZG7jG
	 Yi0TXDfzIJZiw==
Date: Mon, 12 May 2025 18:54:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	kernel@collabora.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: rockchip: add RADXA ROCK 5T
Message-ID: <20250512-bulky-olivine-catfish-d6bcea@kuoka>
References: <20250509-add-rock5t-v1-0-cff1de74eced@collabora.com>
 <20250509-add-rock5t-v1-1-cff1de74eced@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250509-add-rock5t-v1-1-cff1de74eced@collabora.com>

On Fri, May 09, 2025 at 02:31:41PM GMT, Nicolas Frattaroli wrote:
> The RADXA ROCK 5T is a single board computer aimed at industrial use.
> Its design is similar to the ROCK 5B+, but it does away with one of the
> USB-C PD inputs, and uses one combination USB3/SATA/PCIe PHY for an
> additional second 2.5G PCIe network card instead of USB3.
> 
> Link: https://radxa.com/products/rock5/5t/
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

