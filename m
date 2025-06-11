Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2AF1D5CDD;
	Wed, 11 Jun 2025 20:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749674249; cv=none; b=IthAtaNp3gXPQHShfb5IfVU0ScPEwiCqfv65Ce61U/bxvlCuXLucZ/yPflrswF7NPqStAExxvcuDQCd5i5dxf9swxUjlu6Y6F/77s+w8oAlND6svonhI2/w/xI3v0vOsaEUlM0z1+UZ/x7PYYeakyybeMoLrkhU/1HKDNKo32Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749674249; c=relaxed/simple;
	bh=JicRijqsQSelYJCMdx9jWgmyxhDRO7yg+9UnsTRxx/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F44R+Ojzrrb5v6V6qDZVN7n7eVnq+9Nqvn6RmyZtbyWSDr51Hpd4IMZG+U5ZGalx8/Jv0lI/Y061dflb2OniENV9mt+FIHuru6KnNkQzqyWzBueOuQdxmj/Vkn9nWooCNNe2ufPglQmBKJCOCutLOWVf9xDF77/1ZQRD+U3wJp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZzGc2Kfn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZzGc2Kfn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E01DC4CEE3;
	Wed, 11 Jun 2025 20:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749674248;
	bh=JicRijqsQSelYJCMdx9jWgmyxhDRO7yg+9UnsTRxx/I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZzGc2Kfn2GwpPs0lXdQ7CIhXCJulE25vCgtXbcSU7wuQddPgf+bDw+u1/cd599KBN
	 A1UJ0qm0SmEpXd7cU/lLK8tffOsEToPVFxVGH3cIUhmt3+qHeMJFp2jdWjs88BqehH
	 YfJXTgpV5tmowpLk3JxjDt9cIjWjvC039qRkX+veoBqwRJbVXBVmQ3ExwdF6HhreR3
	 TzuK77b8kiLb95FjfvY4wgS26ZCxgzz0XVziqqImGLjfIPA1maX/J1DpCm9+/Qe+oA
	 sfevfGh98aONsSJPnJsqtlw5lGy/vH8MQ39DnV6Fkfhu57gny0hWuMZQSbzMprFGbh
	 SJAupB2Ljcz7g==
Message-ID: <bf7cf6a5-e93b-4611-91a5-fa5a084a2c55@kernel.org>
Date: Wed, 11 Jun 2025 22:37:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: apple: t8103: Fix PCIe BCM4377 nodename
To: j@jannau.net
Cc: asahi@lists.linux.dev, Rob Herring <robh@kernel.org>,
 Neal Gompa <neal@gompa.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mark Kettenis <kettenis@openbsd.org>
References: <20250611-arm64_dts_apple_wifi-v1-1-fb959d8e1eb4@jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250611-arm64_dts_apple_wifi-v1-1-fb959d8e1eb4@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.06.25 22:30, Janne Grunau via B4 Relay wrote:
> From: Janne Grunau <j@jannau.net>
> 
> Fix the following `make dtbs_check` warnings for all t8103 based devices:
> 
> arch/arm64/boot/dts/apple/t8103-j274.dtb: network@0,0: $nodename:0: 'network@0,0' does not match '^wifi(@.*)?$'
>          from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
> arch/arm64/boot/dts/apple/t8103-j274.dtb: network@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
>          from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
> 
> Fixes: bf2c05b619ff ("arm64: dts: apple: t8103: Expose PCI node for the WiFi MAC address")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>



