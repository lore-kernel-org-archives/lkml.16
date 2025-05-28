Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE90D284681
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748434822; cv=none; b=qdQp9uBT6pChc983W1NE1gmG+9ddCuc8KXwhRDsvAqKxa5y87i+ydJ+0t9bS2wz9dm1XEUO9WWusSgIvx3bpvuAGx+EtwxBI5y+w2PgqZubiHVIHgFJ1Eaa5vm67RrCGD8bELlc0tMY3Ohu6L7SFZ+GMZhyfiy/mLuqsTfwiRME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748434822; c=relaxed/simple;
	bh=LgluqXTAQPOxJPKju8Bo8ViAFRC7s0F2a9tFXlqvtIo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LAWy3gC4ZUWygBRQArOzXnLLllWGudjUJvp+amTkRXa+iOyLSF/q/I58FTe7RdTiz9ir/6DxECgxNWkbfdykwiu/XFXNH4ymMw8wT3OA7tnjsYCr5royoGBfRmFb4EdyIeabfBUSdA14oWitTMMo6Bcf2dy/K88Socf8JdMJF0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Up9MwRuH; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Up9MwRuH"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so56042935e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 05:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748434818; x=1749039618; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUiSIyBK9bnL6y5jkIEyCSHfBFQ4eE1Z0A1Z3a6M0aM=;
        b=Up9MwRuHNjPw1rlRQzUew66x7qEPzJiY9UVqJhwvtqIf0Eyo8lBQCHqtWdrA5m9oYE
         cQuPLlhoGUjI1pgVqE+wE/s544dc0VOLMRzLVEmaDPWy9BpuDGjDTlWu7NHnXkeqYYDi
         LS/N2aq0Q5HHtM26h+IwOruFH3o0lEwdzLbpOu8LTAoMEIQUmLpzyomxAMNSLuLFe+l+
         hN1kFmpyq4xM5UYNtEbrl0NZjqmb8dCbT0mXGc0ahpMwuiHfCCMu3MdqvNnqbNRXfM5M
         tx3XGeVV7oXENS2jWvJto04TScoaNtoDRPUeSBNGT2V7MU+bmGc+wOKiTULLKBme1g96
         wzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748434818; x=1749039618;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nUiSIyBK9bnL6y5jkIEyCSHfBFQ4eE1Z0A1Z3a6M0aM=;
        b=XOc7MepOmqqZoD8zGfT+HJhCoAsPDDNAEV+4ZN+M2zRMmilS08mi02HijfjDQrunkW
         ut8tULi7bNpyWaYOL01eAK+LAWaAYuXAED3CJUvIXuGwJqu4Ae8MlOAWOtGjI/UDCmhv
         90K+ZyMeslrYy8NY6C8JcUULMcrdeNEXEVlSbRfSHQt4les7yNyQLhG+F46Kra6OFKFL
         ZhG6b6ZzDHVlwPPReM3Ml+QRgupKI0OVARjSctif/UA/PudkrwHp+0wKKPrqrN0q6A/r
         b46lClLwmnlrAprASjPZNQlQQsQnIwAmH6H1ryw46VaOMqvUg16PmgG1fEf6SbEZt4j8
         5VHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIZJ+B+DDT0h9pw6Af5bhzDVp7PjtS/G31/rtyllSBHL4NRWOy1iV4q559N0ruEMugwQuMpptaWezGDpU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3/Gx0UMJxJHguxKQCEDoqnP7RCvg/DKfZ4Q/5srSaZanRP7FQ
	/E9xP0Tg/jhaoj+vkNm64tMF7vsN4YFgePeGpOpluifKQ2E6bGyWSY2u02KzrB2x5Gk=
X-Gm-Gg: ASbGncv69awXF4CcqirUKhgbwTkN7xhMSKPqP/mYE6Iulye7vBJvcC8wNJIk1HZ5TkI
	C6n9Xo7pyNQilaBiAuS/aPI3fybbzkqwsOVCRVnDPDfz6GF9fdYsOm8GO+E2qTz9PZynRhRUn6N
	NYdYXdDk4UlZJbR8f58fAF6rr/qV11XzCI7huDpbTF5xqiEvHVIIviN9Bt3A9c7Njd1F0Nzf7nZ
	cOEwOsvwU+3Bw5VaMNknwYdo74pDbWq95ciaq/zqqFCIda3g1jM0sx31l/592m2q+7e1dHTtrag
	lsIOwwaAQF+lYMzL2fPt4EItk5Xl8WPGK0XAU3GDvWMGMFDxJPsS5BbVEl0LtivwKoA=
X-Google-Smtp-Source: AGHT+IGZexNRqILydRhcO4IU4n98EZEdu0fFVjtfd4sxx1IIeEAtAXBTC1Us7iU6PxbqQgpjB0cAjw==
X-Received: by 2002:a05:600c:3109:b0:43d:1b74:e89a with SMTP id 5b1f17b1804b1-44c941884eamr149032045e9.9.1748434817966;
        Wed, 28 May 2025 05:20:17 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4507255b619sm15992525e9.22.2025.05.28.05.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 05:20:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 May 2025 13:20:16 +0100
Message-Id: <DA7SEY5S1F1Z.1LZE7191BKBFM@linaro.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, <cros-qcom-dts-watchers@chromium.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <kernel@oss.qualcomm.com>
Subject: Re: [PATCH v4 7/8] arm64: dts: qcom: qcm6490-idp: Add WSA8830
 speakers and WCD9370 headset codec
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Prasad Kumpatla" <quic_pkumpatl@quicinc.com>, "Mohammad Rafi Shaik"
 <quic_mohs@quicinc.com>
X-Mailer: aerc 0.20.0
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
 <20250527111227.2318021-8-quic_pkumpatl@quicinc.com>
In-Reply-To: <20250527111227.2318021-8-quic_pkumpatl@quicinc.com>

On Tue May 27, 2025 at 12:12 PM BST, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>
> Add nodes for WSA8830 speakers and WCD9370 headset codec
> on qcm6490-idp board.
>
> Enable lpass macros along with audio support pin controls.
>
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts      | 96 +++++++++++++++++++
>  .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 24 +++++
>  2 files changed, 120 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/d=
ts/qcom/qcm6490-idp.dts
> index 7a155ef6492e..884abbda74fd 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -18,6 +18,7 @@
>  #include "pm7325.dtsi"

[..]

> +&swr0 {
> +	status =3D "okay";
> +
> +	wcd937x_rx: codec@0,4 {
> +		compatible =3D "sdw20217010a00";
> +		reg =3D <0 4>;
> +		qcom,rx-port-mapping =3D <1 2 3 4 5>;
> +		qcom,rx-channel-mapping =3D /bits/ 8 <1 2 1 1 2 1 1 2>;
> +	};
> +};
> +
> +&swr1 {
> +	status =3D "okay";
> +
> +	wcd937x_tx: codec@0,3 {
> +		compatible =3D "sdw20217010a00";
> +		reg =3D <0 3>;
> +		qcom,tx-port-mapping =3D <1 1 2 3>;
> +		qcom,tx-channel-mapping =3D /bits/ 8 <1 2 1 1 2 3 3 4 1 2 3 4>;

It will be tremendously useful to add comments that elaborate the {rx,tx}-c=
hannel-mapping
(and port mapping for what it's worth) here like it is done in other dt fil=
es.
For example in the same way as it is done in sm8650-qrd.dts
or like here:
https://lore.kernel.org/linux-arm-msm/20250526-sm8750-audio-part-2-v3-3-744=
29c686bb1@linaro.org/

Best regards,
Alexey
