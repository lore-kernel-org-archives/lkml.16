Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF790244E96;
	Tue, 11 Feb 2025 13:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282159; cv=none; b=jPUeFN1fnzeRXzGT8+P5NBd/T+t6XgRJH0E9BUwd38XihWxb6WKu0tqg79IYsQAsLdCqjP93NBFh+u1OTEnpdNIV/DwsnsdpX4mqT4wR7yhOxIhCUed5vYoVSiRpF5EcMVpcWkBrPfFYw2sJK3MbMZ4QZEdh5RoinaaUwa0t3pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282159; c=relaxed/simple;
	bh=f9IOn1H+Qz7jYxe1KmRcYdzwSDqyhB302hT92PUKc2E=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=AWv5hpfDRxcPDMmilE2XHvsQJWitPefSKKxaA3oRySicNZKA/y+1/i8+OkBTeKJlLNGaNidv0zfqXa2ySAnn5yFOe8C5f0rtc7D95wfOLg8mhAJcyPYRgg6mTENQhgbljM/Vudyl77oY2sBjKJbFv/FRx7kACuR03AMWxLVVyFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=NM7NzNok; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="NM7NzNok"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1739282154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mifodZnx+GAT8j3y7LTSrIDDb3fyeuMJi7Lz1TWQoWg=;
	b=NM7NzNok5uOfeVIliUUYXIjdfRtVgvDGaH9gru/W/Z2DSizT9jGyeohS7f/+9/x41Hh+UO
	AasxnZ7X27daRD2cLPsFWyH4C5MfdLr8955ZuZ32LOOHz+IybYOnKka8tHUOM4TSGUSqox
	U2Ypmvd8oWnSgL1tSLduD7ltV9sqTxa4xPID6osBCAwssPuMKt9QuFvJjtvRDkZj5rxb5J
	XTTqUZjNlZylDn+t9EcfUVemavXzxOS1BWBM/NTKgJpYSZIFuUvaAkQn4Ydxw9BzRv2Tlj
	tVlJ0mhoiALwBGSmZXcVVfsWwXNaDVsaImIoxOLJwBqjxCnFqlapMEjkR+mZ+g==
Date: Tue, 11 Feb 2025 14:55:53 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Jagan Teki <jagan@edgeble.ai>, Quentin Schulz <foss+kernel@0leil.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Niklas
 Cassel <cassel@kernel.org>, Michael Riesch <michael.riesch@wolfvision.net>,
 Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 2/4] arm64: dts: rockchip: add overlay test for Edgeble
 NCM6A
In-Reply-To: <06f1f9f4-8a79-4505-98b8-992accf1fb87@cherry.de>
References: <20250207-pre-ict-jaguar-v5-0-a70819ea0692@cherry.de>
 <20250207-pre-ict-jaguar-v5-2-a70819ea0692@cherry.de>
 <CA+VMnFyom=2BmJ_nt-At6hTQP0v+Auaw-DkCVbT9mjndMmLKtQ@mail.gmail.com>
 <8d830c2c-6268-4c70-ae8a-47183b8cbace@cherry.de>
 <74502f5556584ee7378c63d4971f2a66@manjaro.org>
 <06f1f9f4-8a79-4505-98b8-992accf1fb87@cherry.de>
Message-ID: <a9a023233f9a096cc215203bb6ef41d7@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Quentin,

On 2025-02-11 13:59, Quentin Schulz wrote:
> On 2/10/25 7:29 PM, Dragan Simic wrote:
>> On 2025-02-10 18:57, Quentin Schulz wrote:
>>> On 2/10/25 3:11 PM, Jagan Teki wrote:
>>>> On Fri, 7 Feb 2025 at 20:50, Quentin Schulz <foss+kernel@0leil.net> 
>>>> wrote:
>>>>> 
>>>>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>>>> 
>>>>> The Edgeble NCM6A can have WiFi modules connected and this is 
>>>>> handled
>>>>> via an overlay (commit 951d6aaa37fe ("arm64: dts: rockchip: Add 
>>>>> Edgeble
>>>>> NCM6A WiFi6 Overlay")).
>>>>> 
>>>>> In order to make sure the overlay is still valid in the future, 
>>>>> let's
>>>>> add a validation test by applying the overlay on top of the main 
>>>>> base
>>>>> at build time.
>>>>> 
>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>>>>> ---
>>>>>   arch/arm64/boot/dts/rockchip/Makefile | 4 ++++
>>>>>   1 file changed, 4 insertions(+)
>>>>> 
>>>>> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/ 
>>>>> boot/dts/rockchip/Makefile
>>>>> index 
>>>>> 534e70a649eeada7f9b6f12596b83f5c47b184b4..02f98abe1df10f44f2ac27ea5f6c6e6c6334724e 
>>>>> 100644
>>>>> --- a/arch/arm64/boot/dts/rockchip/Makefile
>>>>> +++ b/arch/arm64/boot/dts/rockchip/Makefile
>>>>> @@ -192,3 +192,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568- 
>>>>> wolfvision-pf5-vz-2-uhd.dtb
>>>>>   rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb 
>>>>> \
>>>>>          rk3568-wolfvision-pf5-display-vz.dtbo \
>>>>>          rk3568-wolfvision-pf5-io-expander.dtbo
>>>>> +
>>>>> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
>>>>> +rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
>>>>> +       rk3588-edgeble-neu6a-wifi.dtbo
>>>> 
>>>> Please add neu6b-io as well, wifi dtbo is similar for it as well.
>>> 
>>> Similar or identical :)?
>>> 
>>> Should the overlay be renamed if it applies to neu6b AND neu6a 
>>> instead
>>> of implying it's only for neu6a based on the name of the overlay?
>> 
>> I'm afraid it's a bit too late for renaming the .dtso file. :/
> 
> How is it too late? Is there some rule somewhere about renaming I 
> missed?

The way I see it, names of the .dts and .dtso files become part of
the "extended ABI", so to speak, once they've been accepted upstream
for a while, because renaming them may break boot configurations.
