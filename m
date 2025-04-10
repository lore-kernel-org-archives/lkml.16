Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F53283691
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288578; cv=none; b=Jxf0oGFahJEdJ9iRdzRwKeMTs22G/aBBqLQFGUIP4s66nMeZ0Rw0+hwbozQfALgBIZ0P3naU1aRUZYTEw7e0hb1eRln/IXSfGH1ZsurPUd1/mSZXtYYu34s/eexxsQ+KAgAC49vRYGsWKXHW7jH+ajZqtGMkbIRbmehtQOWNuGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288578; c=relaxed/simple;
	bh=H2rAYnbGeFgX5saZ/b7X46QHeJfq5kinlY6BpgEnd3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y5ZeAs99Vme+ED8aKRFi2w7h6U+/tj2+Okijn/gRn8xhWAwNSqITSkW2wm6hWCnN3hpbwjTCM3hUBw7fVsais6N4HcDGkf/kgsDM/D1o6JxZ7v8wcebVE0jYJ9tfFEQNg0bK6y2M7WNcBPhq3EN8d1Kg86XSjr4vRWDt600vyK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ygoG7ksq; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ygoG7ksq"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so7088675e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 05:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744288574; x=1744893374; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iQ0j7wMSGTmXUuOHtflR052mxHlsC9aOf5SK3WIqsvY=;
        b=ygoG7ksqWNg5LSepdZfB/g+GufHjgHmLbB8kRtXYFazeG1EQ3GAs58DYd41HbC4Msf
         v1iNSbVmc5xO6lBOIWnTCRlJWkcgRpmt5QeV9BiPNPNsMtcYBgTYGsphaDyJfbmTlKYx
         OMpfQRnGgVRDKAHzsMoyN25N7RLLB1ecXlr8g8Jg/ZhRGFzxpfsZCT/6bimq+2srOxzH
         z0TYCHmGdssVtMlbzsZa96s1IzN5jZ9C8wrgW6wOmUqjg7bcAkgEqR1sakAYSyUOIdwD
         nTeNLTql2k00gDCHDEwNOhrI4IDG2r/8HIMXola1w5WpOriOqWJ+Ym//XOVvxNzE/v0n
         C6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288574; x=1744893374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iQ0j7wMSGTmXUuOHtflR052mxHlsC9aOf5SK3WIqsvY=;
        b=H70KvXn3WY3hKFAAjJ8v6tOWgr04A0Q/3daB9q4Q1hNNS4jf+qMFsSKdIQiscJcYiq
         4DpdBUgxZrRhBaelMrbH4/v1heOr/SfgWke9vjBdSKR0wDz3ivIugR/Q6lcHAKCdrGI0
         VvduFpKAhtoJ183R9doKlWTX7CytHsL5aDAIZ3q/sBq9LDWMbDbDR+ZfDqWajXXAKdqS
         CMQ4xVhQVSiXDEb8IU29d80AZo3yUw+t1EXsHfMjRdyPk2i/oDVbTdpP90/JkkXxwmkf
         LxYWEGRuyWeqrm68ZwKeY3kgjFLyN5RIdV0Ur3BRLSuttA94IonrWZiXXepqmuehMGZd
         PkxA==
X-Forwarded-Encrypted: i=1; AJvYcCW8V7Lnzu5VB1rNvvtsXHh+m7+LBRVUIYh9AmeAZOwGe89FX678Js/JrYoviPioilmxhDafOdk9CfjVf34=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaTIFfh9qesJqTs6npqyQpcdiWVGsyiuSPzxY8c6aJxkDPeEvy
	KrYAQpMRf6uF0Z2NDCAT0PcXhhHKOqvOgu5gs8a558sMQ/wlZOHPtNbNhviK4Ls=
X-Gm-Gg: ASbGnct6oEz5aRfp9o5b2yd6KlbDaKSGUBAw6XxCD4m0+4uozwU8xoaBA/rpxo4Q5Vq
	aD4zmzbwnTiVrUgarH6r7les+CqnWg2fJ1Y5PSNIxl5MxOHTjO51j3lCzQrFN28BM80PpFCDzxS
	caTzCZ6UKgMY+kgt2utVbnTBPsuh3Fqdz03JPKUiXipMoByqhTdP1CyWkCWN9M7p7ZjAaB5yd1X
	sWkjWZEZD0MpRiRHTwLPRR7kLJeF2WYKQ1Iu2GoYoxO9CVjU+l3OGJfOaAyfjR7X0mlTCgMvkzD
	rFFEB/9M2Tll4A61/hrPP3SanCl7jimM04u2YCNId3LmZckJwTFtItPPuQRBjjQyfBde8xHU3ok
	2PHnk4h/Fh9n3rA==
X-Google-Smtp-Source: AGHT+IFetWy1yp/dwylC0fW3Xc3rkEsOkh6f7DWozfmMsr0xNplY7KcWpRd6urR6Mieq6r6/8yNM9w==
X-Received: by 2002:a05:6000:4285:b0:39a:c80b:8283 with SMTP id ffacd0b85a97d-39d8f498980mr2285415f8f.31.1744288573720;
        Thu, 10 Apr 2025 05:36:13 -0700 (PDT)
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893fdf8fsm4624182f8f.91.2025.04.10.05.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:36:13 -0700 (PDT)
Message-ID: <17b9ff87-899e-44ca-b902-ab965cff0879@linaro.org>
Date: Thu, 10 Apr 2025 14:36:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/19] arm64: dts: broadcom: bcm2712: Use "l2-cache" for
 L2 cache node names
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
 Conor Dooley <conor@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-2-076be7171a85@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250403-dt-cpu-schema-v1-2-076be7171a85@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/4/25 04:59, Rob Herring (Arm) wrote:
> There's no need include the CPU number in the L2 cache node names as
> the names are local to the CPU nodes. The documented node name is
> also just "l2-cache".
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

