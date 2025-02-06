Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60291F4184;
	Thu,  6 Feb 2025 16:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738858568; cv=none; b=eW68CdqjObqW3kyWNCp/8p28U4XNJS2AoLC9nZ/DA17xk7Cjb5lCYHMaDaX7k5yR0BKpDyk9J7Kwp00TvD5IWGrTbphgB7Ehk5n9jzz9lG433wjlD1NoyDl/YX8rdWjGakpSZK/GA0jIv7ir/8QVE32QXpa5D6ljY7W0dw0S+wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738858568; c=relaxed/simple;
	bh=Art8KyjybfoeMsnHABrcEmWzkyDUcEOdHCbqDbJH+iQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AulePZS+iLSqPb3cqACZKFKkbAs2YL6AANlaPJ7RZFpwmzPFpABV3ziClI5iozJzHOmG/5PILCPwNqTCrQ/5pvnJPiexF/XOO1P6a4sSINURACn7Yaodz9Z9HVxY6z2UtQfvksebWlCpuS+nGGOipnfy92R4mjT8vuRq76ErImE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=WoPMQMph; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="WoPMQMph"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7229C25BAE;
	Thu,  6 Feb 2025 17:16:02 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hyL6I1G5C-bU; Thu,  6 Feb 2025 17:15:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1738858540;
	bh=Art8KyjybfoeMsnHABrcEmWzkyDUcEOdHCbqDbJH+iQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WoPMQMphaWzP9CeiXeEat/xaNv13qpR57gZ4ZZv4MlMnvrnMPnN3kO4QIpqjFu6gE
	 S1ELpMzJHCILHrn+eLo1BM8n7WHjRtX6khq0Dq3vG+Z76Yx0AbppnNSq+vEFTaq4+g
	 GhixIAbTP5K1DtQrb2jWzPvZF9jj68vjpyREtL2vcM2o+d4G5vm0ciP6NupzKyLlrz
	 fy0XdClOAdGjnbpC5/FUfD4ZSF9Sd6VfS2IuGdSVCXezMIDEf9gKk1gmE40uNU4YlW
	 DbjjlD7efyOQ5KAf5SWPlu2Nq0PZIbxTSEuMScAN0uFTYgTomNtGs78bU/Q0vdiS12
	 MWz8hdrqZDl0Q==
Message-ID: <19c8e021-d2c8-44b4-968b-153d798c140d@getgoogleoff.me>
Date: Fri, 7 Feb 2025 00:14:31 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: amlogic: add support for
 xiaomi-aquaman/Mi TV Stick
To: Ferass El Hafidi <funderscore@postmarketos.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Artur Weber <aweber.kernel@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>
References: <20250203174346.13737-1-funderscore@postmarketos.org>
 <20250203174346.13737-3-funderscore@postmarketos.org>
Content-Language: en-US
From: exxxxkc <exxxxkc@getgoogleoff.me>
In-Reply-To: <20250203174346.13737-3-funderscore@postmarketos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> +
> +/* Wireless SDIO Module */
> +&sd_emmc_a {
> +	status = "disabled";
> +	pinctrl-0 = <&sdio_pins>;
> +	pinctrl-1 = <&sdio_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	max-frequency = <50000000>;
> +
> +	non-removable;
> +	disable-wp;
> +
> +	/* WiFi firmware requires power to be kept while in suspend */
> +	keep-power-in-suspend;
> +
> +	mmc-pwrseq = <&sdio_pwrseq>;
> +
> +	vmmc-supply = <&vddao_3v3>;
> +	vqmmc-supply = <&vddio_boot>;
> +};
> +
>
  um it seem the sdio wifi module/chip connected to sd_emmc_a it is 
actually connected to sd_emmc_b

i tried to enable sd_emmc_a but nothing showed up in the kernel thus i 
tried to enabled sdd_emmc_b and there are a sdio device showed in the 
kernel (sdio:c07v8888d8888)

<https://matrix.to/#/!bDDAcbaDDYYwsVgelj:pixie.town/$YUSQIZ-pF22j9-ElrCst8XCUg1pac7CzWbUinNZL9HI?via=pixie.town&via=matrix.org&via=dissonant.dev>

acc to https://paste.coreelec.org/CoolersHurry 
<https://paste.coreelec.org/CoolersHurry> it seem it is amlogic w1 chip ?

(well on my board it is amlogic w1. there are some variant that use 
other wifi chip )
