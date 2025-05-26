Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEEC1C2335
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 18:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748283636; cv=none; b=hwbF59Nm+TESxL7plJuzEIwwR1hiU7frUrSgae/8uyqPghYkOgpOdLMZ8xIrMHMDN7pafSCN2FvIsbO3gP4LZAXdrPLOevpQh4XfHa6rKRbe0tJw86XxHYvS467uyQrejgN7YQppkmevl7L93yX83YGAx+PuCCqL51Qo/P/2WB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748283636; c=relaxed/simple;
	bh=WM/6bLMnHAI8PjYbFLVDPXJEySqlfrUhVK9zQO6tXLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DRbWRD2OESWr1KtlPMe8+mNdUWfp86m+3zvfM55kxEz0qtua+9igBxBfHe/mnnao05gMdzVGN+nLUmxxSdJpjccG1Cqb87Sy7Jp6HALLSxK9TbMnbnGu1eAg6Vn8iYuWbgAUQVZnlrXUdbAwMqfQdrQW4VWtcwuyZjtC+zvt3sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KiP5GWYF; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KiP5GWYF"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4cad7d6bdso1601318f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 11:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748283632; x=1748888432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLm2u+K+PI/38ypNwBYrTuGrq0xLDvMbTxRXLnz2xDI=;
        b=KiP5GWYFdfSY1Exhk/sJH8XjKUTr0sI+Mh9ljzXT55TnaIRsJY5Kjzr76gKIMWuMa9
         S0BJCTcat4hVdy8xPhEmKJLye+L/0YK1u7A3SvXrv+w1vyf3/xLQqqS80u+eSr2ku9sa
         nTFl4tn05iSNYcOmTjZhKvhOiovacnvusaIA0JIwVNJwZm/hqnxaqRKBqYt9Bcs7auNj
         gieiSvDDBbdPTgDqWKHKkeO9O9pUmgZmCpiPmrXOdSZvF8/YsxazfaaYilcix3pR2eP9
         A6VDo5YNTC2Cc7atJaSSmv36p/WyDW8VXhdIligGfMJ2yt5pffdJ0WM0GyXlw45RZpGA
         CoyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748283632; x=1748888432;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLm2u+K+PI/38ypNwBYrTuGrq0xLDvMbTxRXLnz2xDI=;
        b=ifLqYcegIkSKxTXGQ7etltwBM/iAl5aTh2fXUD4GINc4xUXMQLy0UAKQJkOIXKYivf
         uGDoPH/QkOh/bJySqcbBnJ6zQgekEkqDuX234/Jf+9RNRoDs8w9WJMoE4nxzfe43aSTU
         pry3GD8V5DwXL9jRxy6BDePcbVNWdUFitpVbV0pgvAVnHHhcZw+E71Q+xE/gDET4+4LF
         IVcnp5C3q4g2VHyeipOluOilIMdTbjylDQgCp/pHcAXtw9ysAD74kNO+0TG/2EW6u43G
         UjETn6T7heRmkzQ7Mq2MUpdlADCH9vWL1S31qy8dNEVKSMvvxKgp6+s82a66eZKhm37o
         1MSA==
X-Forwarded-Encrypted: i=1; AJvYcCUCuafKhKmOSmoS0CGC1hJ4abs45QBsnFp89uHKcISsg35IVtESRdS45Azl+dK/gjVr2mbOnX8OICJKHbM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy97woDqXo1DrpNdPN5mwDi1ndPhmHikJ6Qu73hkAuYXcpndNn
	92RYz6rHBbbSzUI8e6uec8xcDlwcGFiyyFCjTzITDy6VLDLeplgNhB1ZU7uPTKerYmc=
X-Gm-Gg: ASbGnctE5oaMok6bJEF7obzo9dkQoI0+fWfRv3r+d7L21xmmTp1b1ZFLizE44GYmXPC
	Hu4QV5Tyy8nT2PxncW6eI+aWdpz3Aaybaplx6iEbzhzYlfPpPu1i9mDsSeP3p5FvSy54OuLNEo2
	8RP3jt66pNvxYxJXAsbtV/03fNshheCWSBP1zat1HS8LjAjgHp/yq3TNf+KVSab2y7OvJpP8UiR
	m5wwAMSa1ApZop9c0SubB/+UNf9HgBYtsINCCPezfGDA6cOWIDbbzCMjiVnt/PGDwpf/PytV/Fx
	p6OtDrEgp/nIgL3EFpMvVEqzue/Wyd57C4h5l2h+fHL7yDJ0JL68
X-Google-Smtp-Source: AGHT+IHu8Gg1J8BbsWgqjCqgkp/CdznFrPX5IKNjnPHBnTXYL0HJEukNqC3gh5NYw3XdXDtRMjCSCg==
X-Received: by 2002:a5d:588d:0:b0:3a3:6a77:3391 with SMTP id ffacd0b85a97d-3a4ca4139bemr8058309f8f.15.1748283632092;
        Mon, 26 May 2025 11:20:32 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d53ce0b4sm5179796f8f.37.2025.05.26.11.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 11:20:31 -0700 (PDT)
Message-ID: <7f986e07-69b5-48fc-89f1-8ae37b998faa@suse.com>
Date: Mon, 26 May 2025 20:20:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: s32g: add RTC node
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
 Chester Lin <chester62515@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: NXP S32 Linux Team <s32@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>
References: <20250526162140.2460122-1-ciprianmarian.costea@oss.nxp.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20250526162140.2460122-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/05/2025 18:21, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> The RTC module on S32G2/S32G3 based SoCs is used as a wakeup source from
> system suspend.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   arch/arm64/boot/dts/freescale/s32g2.dtsi | 8 ++++++++
>   arch/arm64/boot/dts/freescale/s32g3.dtsi | 9 +++++++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> index fa054bfe7d5c..39d12422e3f3 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -114,6 +114,14 @@ soc@0 {
>   		#size-cells = <1>;
>   		ranges = <0 0 0 0x80000000>;
>   
> +		rtc0: rtc@40060000 {
> +			compatible = "nxp,s32g2-rtc";
> +			reg = <0x40060000 0x1000>;
> +			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 54>, <&clks 55>;
> +			clock-names = "ipg", "source0";
> +		};
> +
>   		pinctrl: pinctrl@4009c240 {
>   			compatible = "nxp,s32g2-siul2-pinctrl";
>   				/* MSCR0-MSCR101 registers on siul2_0 */
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index b4226a9143c8..e71b80e048dc 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -171,6 +171,15 @@ soc@0 {
>   		#size-cells = <1>;
>   		ranges = <0 0 0 0x80000000>;
>   
> +		rtc0: rtc@40060000 {
> +			compatible = "nxp,s32g3-rtc",
> +				     "nxp,s32g2-rtc";
> +			reg = <0x40060000 0x1000>;
> +			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 54>, <&clks 55>;
> +			clock-names = "ipg", "source0";
> +		};
> +
>   		pinctrl: pinctrl@4009c240 {
>   			compatible = "nxp,s32g2-siul2-pinctrl";
>   				/* MSCR0-MSCR101 registers on siul2_0 */

