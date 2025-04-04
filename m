Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F95146588
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 11:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743766752; cv=none; b=hxc5g6sQslN8p4cp6EdRJfgQhuRkadXtCc0M4btL8so2KYgim4GQJ8JERoXTJxYqREK0whfAshcKvdK9VEFUO6rFXRlvn+Qi/MpnlgrlqzBYUe8eR8A7DK6NM/r05eJqHi3ofvdf6X7OyHlWRBn74H+T15tKIn7+D6wFw1j//9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743766752; c=relaxed/simple;
	bh=OaVOtSqyswMnScAeHQjW6coYcRHBe1m1bBclYABbBIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FzxQZLBmhmwEK2slhCjcsS3JrltWXuJHQodJ2x/afbN+nHJmCTaQdf2yBmtBI3iIw/NpLXcBU9Y3IJNfSV0Z8XGFfqbm6oPT2D/P87WGBJOx5nAdY4eRFlJOMJhbxX+2cdk5SGut5yDTvn2MkjJP+aowoSZbInglRj9RVtvfi1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aklubG7C; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aklubG7C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743766160;
	bh=OaVOtSqyswMnScAeHQjW6coYcRHBe1m1bBclYABbBIY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=aklubG7CZTZ4oD+B+o7ONUyn7kOhXbLT+OLgD0232dAFXRmAWl0xxXUw9UaMAYP3v
	 h2Bbx0o5hWUp81wI02AbBgifEtyUu9yVlk9ZR2P0mQOKIQrKZGys9Rhk3wxQgW1y+C
	 toUou7tP3zhdGxiQObKB1KqwS8W42Nri+FFPHbTIngBnAB46XLLidiT6v1dsYlHvlh
	 W8HXAG6CYJglmXVM4RAwwz4MevjjOp2ea/eTSaddIXeR+zsw7P9QL4S1U3yM7AzFgV
	 TVOv8DzH2xIFAwdXthRPAig4G9vUtqWC4rntz9ahaNFEiaebeaK+8BK1blD+CnJ2Hf
	 xYktL8Tz9tY5Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4F61E17E0215;
	Fri,  4 Apr 2025 13:29:20 +0200 (CEST)
Message-ID: <3e10ed93-dadb-4d0b-b419-28ea492a1603@collabora.com>
Date: Fri, 4 Apr 2025 13:29:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: mediatek: Do not enable MTK_SOCINFO by default
 during compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250404112359.255053-1-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250404112359.255053-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 04/04/25 13:23, Krzysztof Kozlowski ha scritto:
> Enabling the compile test should not cause automatic enabling of such
> drivers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/soc/mediatek/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> index d7293977f06e..006214f8e5ee 100644
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig
> @@ -81,7 +81,7 @@ config MTK_SVS
>   
>   config MTK_SOCINFO
>   	tristate "MediaTek SoC Information"
> -	default y
> +	default ARCH_MEDIATEK
>   	depends on NVMEM_MTK_EFUSE
>   	select SOC_BUS
>   	help

