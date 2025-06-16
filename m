Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5F21DDC0F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750066459; cv=none; b=fKJtPkMsPyjm/03b+VzbLA7HEwpEb6tzplBvzmK9rmYu8cWpdWjRklVS0hwln6dYowChGa/cmQ1UChnN2sEW4SkI9fCEW057JUZKoBXbkw1nW5Qw7mAEkQbcf6Hc2aqpQoZ528LTzKIweofSBlHGYj7tHctWQi6FmdMPKnNRC94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750066459; c=relaxed/simple;
	bh=yWuVND4T3UIjH81QGhsgSpvTzpQOmi6MbpEzktgkuI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lxHi/5Donv0EaQP+wUfqfRH0TrtGR3qkwL9Mdykrj5v/mkyALyIRb1BARIeHCtDcuevBan9pBRMH+2uDy1lZ04/14cTv03qj767bKObcx96i2eZDe8M40TCXMIAfnEhjheUWBS90eNlk8fTWrvlvHEsXsiUWHF5R/idbRpjrv6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MFidEgOK; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MFidEgOK"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a365a6804eso2998670f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 02:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750066456; x=1750671256; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t9CmXx7Jox2MTWDj8UZuRJKz6FA45h7DTh7MdX7eUyU=;
        b=MFidEgOKkpw4Z9O7KVk0KUuUoWwhFn/l6i4WUoKLxlApenc/ehCs3ENMT8hJZW/5sp
         s/6SrY22821PTS/QPYyc1teFOUQ71TodgN73+Ga+bCbHLMKY0DnJaEj2DgDVPLRvDUbY
         4pFdELkO8z7K3jArSU5t6ZvHf8Ay6W23Skp/St87bxPTEoGQNoxvoMgAbbSGt073Dp8I
         Ro6YqzOAN7+vLVc6EUqzxw4VNJBJSEJ3px9MnrhQH5ET9XMRBGwG2KbG7oQ2FUlktDUU
         C35LdAqQEiiUhe0s2LI68DBMIWZEYLE7SWgWLsATa6BfwNslDhuxQpzYmdid+r5KUK2D
         EI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750066456; x=1750671256;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t9CmXx7Jox2MTWDj8UZuRJKz6FA45h7DTh7MdX7eUyU=;
        b=ciapKuZxOuBEvdK2rutMB5bQ43gZ6KuvZ1p0k2nOFLMi3jfFs/V36hf+GI5OLxZgX5
         y0Z9LObqQAE8UF+kbc0nVu6/T6pssqbfuXOuJXNvbE3gCqn1RoXVVDpjMMZ6z4xErBlb
         4EjWp9GAJW0RnG8MsBDQoGwkkor1AQMWYz/TOEQySOrzL21bHbVlGn5frJB9yRJ3/+3P
         I39AB1msFDcHFSDlACBjaXVi4dRins0/h4MDyy7whITax3hiUkq3LTtnsAVykM56MWe+
         WQgA4Gsj+1lHl8EicOPWuAfDkgXHE4JdsCeaKkiH8wWs470y0fGiXmXHpUh0Q+naKkAI
         9Gzw==
X-Forwarded-Encrypted: i=1; AJvYcCVetZ/Z6k3CCkLx5nEyAWiMKl45yPIZ8orqTRtwmKLs/Uh94RhhqgveIgGRp2Hlb8m//iYxPjsoHue79Cs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjgBO4ZwYukyFBG28mulylBkYl3yYaAGg1KnSeY6848CU8MgAz
	+NVOBHzcxuLXmOsxLDmItqkmAybvNETnvbwhUlE3ATgQvqAD7e7HTju7/QFPkwkDGKE=
X-Gm-Gg: ASbGncsRNoTzFFj56ZrZ8bzl4ZQ0GMb2aZaV/OCD5xY5NUMrfuwlp5vOPoguIawGBzJ
	+QyakTAswix5z+WIz9AqnRpUe6NZ6l75+jscOkLpp8OzNFsfo38j47+Ahj+vluxtuj4lLcVfLT1
	StHjcPXJLWbTzYh8gC6OeGDVHyVzTQSbjB+/85LqOyr7/KOXN8EEa5230BkoCBD+ifJDxRYpO0D
	Uk9HkS+3rLlR2uy4rRV1sfvxgxUke5U4Z7HHkg8TVCKweO+GjwPbQFgToDvJjukwF2pudndODwv
	rVoTo+/3QR1gYYL1vFzw+ZSARy7+2X7j91homol8GfOBqtOUXlfI4M7PKQdSK12i323vX1rDAMs
	WYA==
X-Google-Smtp-Source: AGHT+IH2eCAan9hr2z5r64aFmnkOfZ0VQQsGBIwNUvdyfgouIqWaqapfX02p+ntb3Jt3ejJMX+pmLw==
X-Received: by 2002:a5d:5f8d:0:b0:3a5:5270:a52c with SMTP id ffacd0b85a97d-3a57189727dmr7228368f8f.0.1750066456498;
        Mon, 16 Jun 2025 02:34:16 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b403b4sm10327273f8f.80.2025.06.16.02.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 02:34:16 -0700 (PDT)
Message-ID: <9af5522e-02e3-4a82-a9df-20c71ebb3875@linaro.org>
Date: Mon, 16 Jun 2025 10:34:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: spi-fsl-dspi: Revert unintended dependency change in
 config SPI_FSL_DSPI
To: Lukas Bulwahn <lbulwahn@redhat.com>, Mark Brown <broonie@kernel.org>,
 Ciprian Marian Costea <ciprianmarian.costea@nxp.com>,
 Larisa Grigore <Larisa.Grigore@nxp.com>,
 Stoica Cosmin-Stefan <cosmin.stoica@nxp.com>, linux-spi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20250616091955.20547-1-lukas.bulwahn@redhat.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250616091955.20547-1-lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/06/2025 10:19 am, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 9a30e332c36c ("spi: spi-fsl-dspi: Enable support for S32G
> platforms") reworks the dependencies of config SPI_FSL_DSPI, but introduces
> a typo changing the dependency to M5441x to a dependency on a non-existing
> config M54541x.
> 
> Revert the unintended change to depend on the config M5441x.
> 
> Fixes: 9a30e332c36c ("spi: spi-fsl-dspi: Enable support for S32G platforms")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>   drivers/spi/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
> index 60eb65c927b1..f2d2295a5501 100644
> --- a/drivers/spi/Kconfig
> +++ b/drivers/spi/Kconfig
> @@ -647,7 +647,7 @@ config SPI_FSL_SPI
>   config SPI_FSL_DSPI
>   	tristate "Freescale DSPI controller"
>   	select REGMAP_MMIO
> -	depends on ARCH_MXC || ARCH_NXP || M54541x || COMPILE_TEST
> +	depends on ARCH_MXC || ARCH_NXP || M5441x || COMPILE_TEST
>   	help
>   	  This enables support for the Freescale DSPI controller in master
>   	  mode. S32, VF610, LS1021A and ColdFire platforms uses the controller.

How did that get there... Sorry for the breakage

Reviewed-by: James Clark <james.clark@linaro.org>

