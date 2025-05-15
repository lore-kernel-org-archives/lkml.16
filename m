Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EA8295DB5;
	Thu, 15 May 2025 09:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747300834; cv=none; b=KMQtmw4x6WHhuz8Zlmg19SZfy4TP/bIARGtUdN8s0l4hOnOYc/yN77R07/WRgZ/NHLgdlbmA+Rnqj7efSgTVaI7qLdjR12/2SYJzeWSL+vbGCiSE/0HDIqnRHCtBYOa3OjYPC0qXifft+OF5O6qiDBczYysq3J8k5zxGxX0LZn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747300834; c=relaxed/simple;
	bh=T0xIs53YyMGsPIFPEWuTJKQwtqyUkFoPGQIbHPbvpOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e0cJIIgt9SnaPiknhbNppDyTYMCVwIaUse+P5URRnlmt4bupP7Z6f8QCGCKLs2tiGYg8mqEn7eziGzorBExRa3hlAEp/S6FYTzHUt9cW8u5P1XCZNmokFoykMRLTbCLXakw2wydQfPodCplMzA0uuyuQcxebN6xFuyF0Pmbm1XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1ipIkpy; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1ipIkpy"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so744623e87.0;
        Thu, 15 May 2025 02:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747300831; x=1747905631; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gr8YDjeShMs5Dbf0Xg1ibXjoeWLBh6KvIWOpPkgrAjM=;
        b=d1ipIkpyvfr3cPvSkw8MWolysLm9zavbxJfieEfSDgT4sFOik+sJ1WHFOwp2C55N3c
         jgOjtedqdy1MiLzITNgifK89Hjr+c2agepVLSRtO1JCOL4XxGGYdNpNoL32Ge0E+J3KX
         0tHuFE3A+0gkl1qPH0xLQDHZImp4rs21Kd4Iw/2OyNcaOt4fYmDoAISrPq1lKi2YM+EN
         xRGVRW0gjwrFJVlxCY99oq9sYuevEh1DFwXCPUfGIyM1GPEk1o6jOU5FN2XS4p53i0AQ
         qZ2mIfAlv04zxO4I06J+99JwwNPHnLqrygpvQ0RX/HB9KXfos0o6D4wMI/2URiOFCKLE
         c5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747300831; x=1747905631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gr8YDjeShMs5Dbf0Xg1ibXjoeWLBh6KvIWOpPkgrAjM=;
        b=E2F1L0QsYF933U+4fbqtGZX0yOvx3SseWRO4GESlfgLi/Jf0qGCnVZK8jK7bwHAxzB
         Wxk18rWcQIcL8WB/kdJTn0BVhiQFn94fdJ82KK0juVnxrXJcN0N5KXp7h0DfKtkKof8l
         eZMmjwW/epN2x8tXM3AeUBXOrcDZI/SC4zVseoDrDpC9wF0k/SEznvCFPapnVibyHazo
         fCvP5G3d599+w7X0dTT3ATdej6Wr57Mla2ngVBfTVMNCKeWQokXB4O08q36JFldPlFOZ
         MZurvBXBRwKBjod9Kp5qHA4SNA/s5ljn/BfybwgKTAoNzzLxqEhhgRcncE3U9xnXUbT5
         z1Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWN/ICEFVbDbD4r+4XHqBubSM0hE4hdI5/d4Wi84I1HW9kbZlFxzHdjF3j1cF/HE6Gy36H66N4/fyst9bTG@vger.kernel.org, AJvYcCX80N0H6lIREN62/9KO45Lct4wmVwOSQ90S3/sh+W0LCcwJw/A9UNCgC8HQPGRwGugLwEecEhfi0D8Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwgzTYRbPgxvCm3WzVjgLQbddrw9EenJl5ESePBtDCMqnlUiqqh
	/dNpmzLopAq6HKAQRcxtfQqu5BDXATfsQ4rOV+zqlQ+BWUG0W1hk
X-Gm-Gg: ASbGnctjCeiKJ0Sq+cCVPMigcEU1xc0QsD9Kf1+/JTaXiliHpbMjgmk7QZU5DLsghYu
	Y3WlTUyBFRJSHPSIkFaW0qVQ+ebEDFyjVs0Xb1moKU3tlg7tnxT0cuzkiTm1BrvfPzP2rjYFez6
	jLXfSgVRII4hAq1WVD9SjqYoxd/N5A64dJBeDror5X4OBjRnNJRBnPt8HDd5E8EUgva5YmjWliq
	KuLGnZsZJWnQUcixgL3L6ATPNvPjx98Z3qVub6e+ePciVX6Pj2axsAUJD7vqoWvBpWxQif8AlsQ
	lFx3p7p4UyZpQtkgth7XxvYNI+MJ6nO4es+FgZDPuWljKYujFMhRYeSYVD6+mkzqfdFQQS2Ixe7
	BHnPbMifY4Gnx4CFLUpQbcPDVnhIMEufzC3nJIXvQHkU=
X-Google-Smtp-Source: AGHT+IF1K2xmstWUKqRXQKvNfbx1fHA8kSSO7L0hXYxzd9u70VeGhf6RRP23AYcOT1vimL6BWWt6aw==
X-Received: by 2002:a05:6512:2392:b0:545:944:aae1 with SMTP id 2adb3069b0e04-550dcffc298mr627839e87.12.1747300830765;
        Thu, 15 May 2025 02:20:30 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc645d082sm2579696e87.76.2025.05.15.02.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 02:20:30 -0700 (PDT)
Message-ID: <a44cad65-1f23-43cd-83b7-bc128e9f858f@gmail.com>
Date: Thu, 15 May 2025 12:20:29 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] arm64: dts: imx8mn-bsh-smm-s2-common: Set minimum
 value for VDD_3V3
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
 Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Wolfgang Birkner <wolfgang.birkner@bshg.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
 <20250514082507.1983849-8-dario.binacchi@amarulasolutions.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250514082507.1983849-8-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 11:25, Dario Binacchi wrote:
> From: Wolfgang Birkner <wolfgang.birkner@bshg.com>
> 
> Buck4 is called Buck6 in the BD71847 datasheet. This buck supports
> 2.6...3.3V. Set the minimum allowed value.

Same comment as for 6/9. Please provide better rationale than the PMIC's 
limits.

> 
> Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>   arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> index 81fa0a8767e2..04112a83b1d3 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> @@ -144,7 +144,7 @@ buck3_reg: BUCK3 {
>   			buck4_reg: BUCK4 {
>   				/* PMIC_BUCK6 - VDD_3V3 */
>   				regulator-name = "buck4";
> -				regulator-min-microvolt = <3000000>;
> +				regulator-min-microvolt = <2600000>;
>   				regulator-max-microvolt = <3300000>;
>   				regulator-boot-on;
>   				regulator-always-on;

Yours,
	-- Matti
