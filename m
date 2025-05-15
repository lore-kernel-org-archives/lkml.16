Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176A12882DE;
	Thu, 15 May 2025 08:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299263; cv=none; b=hTGoPZuwmV6ElYRcKrJYStjAGBfB9pp3k3tS4GoUGEEZzzELtcBKn5ed4j99MtWzdl/PjQ3QYVmpamXCz+dIsNjRjsBQZYpIOsK/eY6iCSjHTzMmbeylqaFMPAewpcKk+zi187KH7CZUYAppYTM2YffD0w8vK3Pyrf/+Y/AOcwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299263; c=relaxed/simple;
	bh=E1z5He3Wwd9ce7anNAAfQb1t4GFYDRY9FnjlwNIzh1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FgG+/2toL7o+n9kxLioHHXAC+ZZHXqtyU0vNGHNtvAnHK9vPqC2Zr2xPlDjKQCArD8xVyMzZ8tTpcfQ1xR10Y66rmBBF5bsjTomZXP7y9JMW5Z3wMxl7NL6d58I64PO/ZmxMtuvgEVnU58R9wC4vP3ScgNU0/rGiEgjxZwwjBg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZF51bbuA; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZF51bbuA"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3105ef2a08dso6307921fa.0;
        Thu, 15 May 2025 01:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747299259; x=1747904059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a7JvnrWNRYAOhJGuJiHPvQ8RmC0zHeKbDlxT+TMUjbE=;
        b=ZF51bbuAlW7Kvyo9CyxZ9rnkD2cKQpmWRlub/pU8RHRVA19b2gAlaSdAo46VB7n+7w
         RptgBDII7LLM/9u5rKH5ZTSIt3UEWJ5XewpGhL/QgOsJEo+tX6PdwcEFEX4AkTfjfcJ9
         fbRKBxGk8lvceq0mTBfEN+XD0r+q5xy1T6LoQUt0GvRrxIBomy2MFrfO6dAZaap/zeHQ
         dbYJcMZVSij3lBOO43chm7BBF2uDG6I+w+4ziv0+WgHDBULT6rVm+YFMq8pCF51Cr9yN
         bZRIlob7bl8XMNxXWkUvamGHjZM6fLgxJeUdtbgLlBH59Dwy1lDZDH23Zc37ho5vFpZD
         lz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747299259; x=1747904059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a7JvnrWNRYAOhJGuJiHPvQ8RmC0zHeKbDlxT+TMUjbE=;
        b=fVlo7P6vod9dYYxOUxtlS9tEuqkK8R0EhZZ7ekpsRn7nlSEPgOAW76BkMqMZCv3zS1
         +V6Jcumbg8VzcDh2WDWvI5e1WqA3DiRRg1SpaJzch5mM07ur6rEJjeGIFxzYZJnIIcy7
         +TWv9+cj3gJfuYx/X1wbJyR4jKkp2YuyHA1XyV0FA7yrqaDzx1y1qXB1aEc7upuLtFno
         wYnM/3OB03vmirJq+XpNu6RMUqDXdVz9rza355i/7Q8E+LrbT97FF+jsHWXFiP1a+Qat
         gcz1cW939FXt2AAEgjGWbdMk5mcK2K2kMTHVqwDaddYjvh36BJ9zWoc/vAtlvcG4J/xl
         nH+A==
X-Forwarded-Encrypted: i=1; AJvYcCVgiHJVCYvuG7RQBgp4tEwWVoKRFZyAOrIoznlBLpRQixM0XP0Zl4enj/mI5+0UlvcUnEtYE3SRApBRsFtX@vger.kernel.org, AJvYcCXtnA46+jLSANondHahqhhP6Dmu9ifEabf/fXQ0i/gVCqE6kDoEPMEyy2fYu8c8UvF66bNbDxUa0v/D@vger.kernel.org
X-Gm-Message-State: AOJu0YxKZ2Az8B62AE8MrRImG+mdij4n469PvxMIDKaVX5qCS20UK5yU
	q6JolH/DChMq3lnoLIyiMejNfWWzUtUm6akr+KwfJ4ji8kQ1QlP0
X-Gm-Gg: ASbGncsJ9sHjB8larFgdNysejLZkgjq0no/dzsvA1HItzZPP5OB2k6YEDEy7IAx/zZB
	scG8cRC2faoNfksrngRejQVa3EBou9of6e1qa5C3l1NN3d1bmcegUFJSXexQajLP/vsAzR0tUMd
	rYR36nKAI7TIN5Fkda99KOEGdlrg0p6KXPr88cmwnR61uei7LikJ57y6kwFPzr9Kp3unocZhwcr
	aPtDZ1seBCC4eg6yhUCk24iPCqFjSC54B5m/rhm+2+bYGxrVawHiIa1K87Zf+QWF+0vwTnHOCv7
	dT7X8SUCR2Pj1utzKe5WjBFwYCJT/dAeVEw0sHVPKF1yMa6zvKx2RXVbTmy0v4SkOk7XQiEeUkl
	3FvOm1sZZOS4YTPAFDMwGf8iBOkrNQt6p
X-Google-Smtp-Source: AGHT+IHtcdpnhUlg72zfo7hWrvx0FJm1YaMSsnRsy3WAnb5OW4dErT+GY1iWZYdh7iEQuUQYLBOqVg==
X-Received: by 2002:a2e:9fcb:0:b0:30b:ad2c:dfe4 with SMTP id 38308e7fff4ca-327ed1dedb9mr32145521fa.30.1747299258821;
        Thu, 15 May 2025 01:54:18 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c33b7fe3sm22411401fa.24.2025.05.15.01.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 01:54:18 -0700 (PDT)
Message-ID: <db3f6178-646b-4f42-983e-9004d61dabc2@gmail.com>
Date: Thu, 15 May 2025 11:54:17 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] arm64: dts: imx8mn-bsh-smm-s2-common: Leave regulator
 under hw state machine
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
 <20250514082507.1983849-3-dario.binacchi@amarulasolutions.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250514082507.1983849-3-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 11:24, Dario Binacchi wrote:
> From: Michael Trimarchi <michael@amarulasolutions.com>
> 
> Let regulator to be controlled by hardware state machine.

Is it possible to add a note _why_ these regulators must be controlled 
by the state machine and not by the software?

> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>   arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> index 5a1ec2f6a552..0d343ffdb7f9 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> @@ -144,6 +144,7 @@ buck4_reg: BUCK4 {
>   				regulator-max-microvolt = <3300000>;
>   				regulator-boot-on;
>   				regulator-always-on;
> +				rohm,no-regulator-enable-control;
>   			};
>   
>   			buck5_reg: BUCK5 {
> @@ -153,6 +154,7 @@ buck5_reg: BUCK5 {
>   				regulator-max-microvolt = <1995000>;
>   				regulator-boot-on;
>   				regulator-always-on;
> +				rohm,no-regulator-enable-control;
>   			};
>   
>   			buck6_reg: BUCK6 {
> @@ -162,6 +164,7 @@ buck6_reg: BUCK6 {
>   				regulator-max-microvolt = <1400000>;
>   				regulator-boot-on;
>   				regulator-always-on;
> +				rohm,no-regulator-enable-control;
>   			};
>   
>   			ldo1_reg: LDO1 {

Yours,
	-- Matti

