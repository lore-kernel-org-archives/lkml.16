Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8B71D5CC6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 16:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751387032; cv=none; b=bZoFoUzjClpKilksm4RS0MxigNgsramy4OhAosXuc3dZ7XRrWgP5NgxncgzmqUg6qPU01C5Pr8FqoODlmWVCVpBXQKhYXCu3lQRiKlR1MDoi/vOofeqjgO+h2XIydeGs0lAUOZwLw8PwGV3up0y3FHXsMOiAUVi5aUPkzDAhn3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751387032; c=relaxed/simple;
	bh=TRyKPGlzqNiaAIc+Td0ze+LpUFf6sYZ4Ct+UtsDxJJ8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Ov4GqmlLprQ8/rVli5T7wRCTKmK94tJRtbSuF82Lk73NXb6gUvIp7sHI/aeoR9T7sivAJkpRUvpC6OKkWuDYVtPgSWavqr2JasfsYd8wncoTmIyBvcD2U1T9M6y4De95dexpkOUzCkxrILzJia+W0pVkdKZPC7m5wGG4Sknjb6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IFMHXUn2; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IFMHXUn2"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-451d3f72391so36585255e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 09:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751387029; x=1751991829; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N84p1IfPOnU2LRyJ4jJI6ylTwqJRzAAmh1pUeFRFmtE=;
        b=IFMHXUn26XoQxgu1PEOhUk+1DwDCC0gLL1fvGvxN6KXwHj83WYK7MaMemjuyu6Bj6C
         s6kIMqsWWEeY8yBZuvpFt8JZmMrPDXLzxWb21dw+utltdf4Q9XhLNMkuhPzP6MKkXyvU
         dBcze56B2AcofUbbLP3R0xmh/GJEWkmBoR6NoOIu4g7IW8Gr7tZgju0zBQiknwyUR2IK
         ue+Vqe7Lp/z/zGd6Q9EBY7megXj46NTu3uPFLZZc78ubpCu7fSmApHW2EONsaOeOAMeK
         x8JfK+lv1V7mTm2i5A0ZoE7eOfbWSgacnkUcWgy4hR21+6XBUe+RNurXqFZY993daOIe
         AyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751387029; x=1751991829;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N84p1IfPOnU2LRyJ4jJI6ylTwqJRzAAmh1pUeFRFmtE=;
        b=ueqYsOtvXDasBvOxYD4L1CJLElPLqkJrA1rnkujfpV8aqTn4Vk/VG2pZwqUguTYIy1
         zHI3TL5WK2YqtFJqMCNthfVACfL0taNJZ0Ku5WnAelKS3be+310sLIXA8ZRTZT+D6bSK
         LJE3B69noWhd/AtwnGVJOqXCldhCWzD9gnNmUWq9vDy3X1mZJIGIB7sNaCFsAz5FM0RH
         GvoiTT/eE4lWM0ZFaZW3GUpQZi9/WWaK3dpL38gWBb9ofQpqA44X/hA0fDw6EjWKRaCP
         Jz7FRPRIFSABAuL14XtauFCSrJhQInRAYsi3yFe418Qw/dMzS6wJdpqpF3hMUjBsa/Ab
         Z/GA==
X-Forwarded-Encrypted: i=1; AJvYcCVFGygWXIgl2PeX1hWXG0L7IGsPNWMmvFjVQEOh0FFqvOqImxuo8To4yomVddrr00dC1tK39Yp6a+JKGRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy44F+fy8WZs5Tus2qJDPzgr5zsKpRRNlueXPSit8f4dArUANee
	gllBHy8kmZT/D2H2Lq+tLLRqNCFOYihZSz1k5Ge2r0IdkPryXy84N/InK7OkOCYqz9WMIc+SJVC
	PGJ6T6Pc=
X-Gm-Gg: ASbGnctxDNE8ez4Nm/Spi0moqtEdoG5ayyZNKypZN9ueT17dxkrM5YDhSPMI7gBNOk4
	fy3ytOpLfJaymPAzzhT3Z75wcYNC/okWKhtI+f4bBMX/wkTir1ctNvRzrGvTTEadZekokCqntsh
	4qAndtmuZRctid7ovJ9/CzxXNjPiONnPnvjeQIpHsQpxUMVLKb+TfTOufguKtbIVbifJ5vdx0MY
	UzzQfnUIcn8yaWexYIc0oZRegdxYrkvmPtjuLziXPqY4nrdhE2dYAumM2dJkhWj+ExsnkX84biH
	9gb+v7QXCyF4iZd0EEaFSL0CNZo+y08eqfLje/PHB+anJsTMUND71awlKL+68vUp3270ug3VIpF
	Ks58=
X-Google-Smtp-Source: AGHT+IF76AvC+yZFLcI56pCMDzSJYwqFxY/61zrbScuKifRBlFHkGuW5GbezYGfN5iWuHq0HbK4jxA==
X-Received: by 2002:a05:600d:7:b0:442:cd03:3e2 with SMTP id 5b1f17b1804b1-4538eedf21cmr160209575e9.2.1751387029430;
        Tue, 01 Jul 2025 09:23:49 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:4dad:b69a:9c81:2e57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e528a9sm13932521f8f.60.2025.07.01.09.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 09:23:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Jul 2025 17:23:48 +0100
Message-Id: <DB0UVXK5ATOQ.3JOWJ0A1JNIAF@linaro.org>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: qrb4210-rb2: fix GPIO lookup
 flags for i2c SDA and SCL
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250701-qcom-gpio-lookup-open-drain-v1-0-9678c4352f11@linaro.org> <20250701-qcom-gpio-lookup-open-drain-v1-2-9678c4352f11@linaro.org>
In-Reply-To: <20250701-qcom-gpio-lookup-open-drain-v1-2-9678c4352f11@linaro.org>

On Tue Jul 1, 2025 at 10:01 AM BST, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The I2C GPIO bus driver enforces the SDA and SCL pins as open-drain
> outputs but the lookup flags in the DTS don't reflect that triggering
> warnings from GPIO core. Add the appropriate flags.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reported-by: Alexey Klimov <alexey.klimov@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/d=
ts/qcom/qrb4210-rb2.dts
> index a37860175d2733214f1b257e84d5cb4821033242..bdf2d66e40c62596b8b024de8=
33835a0750df35d 100644
> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> @@ -5,6 +5,7 @@
> =20
>  /dts-v1/;
> =20
> +#include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  #include <dt-bindings/sound/qcom,q6asm.h>
> @@ -65,8 +66,8 @@ hdmi_con: endpoint {
>  	i2c2_gpio: i2c {
>  		compatible =3D "i2c-gpio";
> =20
> -		sda-gpios =3D <&tlmm 6 GPIO_ACTIVE_HIGH>;
> -		scl-gpios =3D <&tlmm 7 GPIO_ACTIVE_HIGH>;
> +		sda-gpios =3D <&tlmm 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios =3D <&tlmm 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
> =20

