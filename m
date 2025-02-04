Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E34D2F46;
	Tue,  4 Feb 2025 12:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738672461; cv=none; b=UixD1azwhL1JiFdtn3Y6FNhaSHZeiFXz6wO4ZJV1T853ptissHdQpemIkAJGXFv/yg3GW0EjZKHprH3hAcqss7OBkFJ0zzuZoDshumN6jmEWKBEobIGXQUUDAWDa16LDDs5//InNZBl68PlKyc0FDtIDKwEBTN26/LKAzS2Jpsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738672461; c=relaxed/simple;
	bh=4sD1Gzk7Yru2ozELclo57OBKhbFxI2wO1pg5I0DfOMY=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=WDEtDM5eefuuf3NAoSpD1vEcmlAjFEXFfmZUfDqQfsViaiSxV21rw9ZK7YEp5JS46XHdx8iQy3+UJnb8MoLmRRBuVmQWqV5i3LdHB7Icw6nr2dM/mQxhOgc6Kks/PjtbKx89nGBeqXFCF5Qp6rb0RxgdjM6yF+i9P6tq3uaj5N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=oYG3nLfw; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="oYG3nLfw"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1738672453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MfN7jN8OQzYiImZnTABvy7SyEvQVUmOK9CigANHmlX8=;
	b=oYG3nLfwwS7fdhBxqZAxFHstXJ01m4J1HTG1edyhS8fN1bJZuEY48Dvml8RG5aeKuaxyXN
	HeBqsipmiPAxGFwUcY4XCVpFZnVrHxEdosBZR9l60C1njDSjM6TgqiS37hTGDVYL9kVXE1
	+HFS8z5HwxxRNEGMIRX5ZMbfvmAt38RgnRfrtkc55Ro7dWiQYURjX1Vwt/olz1l5I70f9d
	QBF8/xwpaqc8JTIip75wmmWWx6gVBi6pbumR/WvZl9l9jJVi5kVZpBwXH5RycVr2mx/q0t
	61YkSKMs6eXniMNR9LgtMgnoQJEwL4XnVpoAKjBmI81p4qjliJXobBbhTUn4PQ==
Date: Tue, 04 Feb 2025 13:34:13 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: switch Rock 5C to PMIC-based TSHUT
 reset
In-Reply-To: <20250204-rock-5c-tshut-v1-1-33301e4eef64@gmail.com>
References: <20250204-rock-5c-tshut-v1-1-33301e4eef64@gmail.com>
Message-ID: <709ed6c2097f494f1ed6e5b08f55ef87@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Alexey,

On 2025-02-04 10:02, Alexey Charkov wrote:
> Radxa Rock 5C supports both CRU-based (default) and PMIC-based reset
> upon thermal runaway conditions. The former resets the SoC by 
> internally
> poking the CRU from TSADC, while the latter power-cycles the whole 
> board
> by pulling the PMIC reset line low in case of uncontrolled overheating.
> 
> Switch to a PMIC-based reset, as the more 'thorough' of the two.
> 
> Tested by temporarily setting rockchip,hw-tshut-temp to 65C to simulate
> overheating - this causes the board to reset when any of the on-chip
> temperature sensors surpasses the tshut temperature.
> 
> Requires Alexander's patch [1] fixing TSADC pinctrl assignment
> 
> [1] 
> https://lore.kernel.org/r/20250130053849.4902-1-eagle.alexander923@gmail.com
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
> b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
> index
> 6e56d7704cbe0dc06242cb39df56b2fc9d6bc774..00b2d87a6bce4af883a3e7c7e606ea5b96c68b19
> 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
> @@ -873,6 +873,8 @@ regulator-state-mem {
>  };
> 
>  &tsadc {
> +	rockchip,hw-tshut-mode = <1>; /* tshut mode 0:CRU 1:GPIO */
> +	rockchip,hw-tshut-polarity = <0>; /* tshut polarity 0:LOW 1:HIGH */
>  	status = "okay";
>  };

Looking good to me, thanks for the patch!  I just went through
the Radxa ROCK 5C schematic and it all matches these DT additions.
Thus, please feel free to include:

Reviewed-by: Dragan Simic <dsimic@manjaro.org>
