Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7545265626;
	Mon,  5 May 2025 18:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746471283; cv=none; b=e9oB3BSZzzJPXHhKmvCUqh0EXkOyEpf1IIgDMyM7nDFYwN398elEZymVQSoBDKujqOIGMmgSacV6cKpqlbXxl2r9QbzgZe/KfyrBrVUDdZt4ybCxSpNUGGKadVMwJDYYwG2iRUmFmrTIX9j1+0VwXTNVRk6ASCRb0hQCbRUWaME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746471283; c=relaxed/simple;
	bh=Wt5xzmEhfQ4KWRfJPCRBmDR4TE8MX7M/nR3ZeTi/wMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ISbXPu1+Vk/46RHiFcKYDR++ycosbxB1nMnb9c85xuXakq8+JTZ98u3whHiVBMinNVN4DWwdaoLAFnkeUq1V2LD4fRp9vLt0YRM4VNFBhgMvo5pKpyDMXd81aqFilz8AJenLC3t61Zp3mi0wN6DRIxZ2M/VwtvXbI2GxYVNj5aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pm27iqwY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pm27iqwY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E0FC4CEF1;
	Mon,  5 May 2025 18:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746471283;
	bh=Wt5xzmEhfQ4KWRfJPCRBmDR4TE8MX7M/nR3ZeTi/wMk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Pm27iqwYJSOXrw2XiaW7wqGFfvb3xfnQ0PrBrHznsyR3bC5+TZpx+JaBEEatSp1bL
	 oRfCYrFdoEDUzREwd3ANLe7QN7l5UdNSODcDW0nGDgGNFXvI6kMf2053wbfIEsAjvq
	 s0Do+Gb+PhLT+K1t/mq+G7qgvDIr1XdrqSQjjy4kjrSXygXPi/YwrKKRqWYwOx6vx8
	 wdq5GGVfxORql6AShuOsaQjmN/WtKQIGx84rqgWgeTzll6DvXWBpRrZ6XravhztFHX
	 zqHpc+u3rq6zOn1wjQYgFBY5fEPA8swkfAp+AgV2v6V5z70gCVjeh2vwfVM6ADMLKI
	 06J+s9JpmWd7g==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-acec5b99052so924951966b.1;
        Mon, 05 May 2025 11:54:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXnjKGJ3Ie56cn12I2E3ZXSDFPdxnNIdoNcJv43u2yQXQI7jf6z1SZ/KymFMuLnlxeGzfsGqgPHR8I3bFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwXNA1xp5AI22MAiGa/yxAuQ5TyTRCXebAFY43Q3RpL8y3KE3D
	WGVmlj1CUPOSje6j31MJRu5iKIAnI+WbAcJ66OJZBdtMdXAokN3ljhtBY95x1c0avTC1P8KHZM/
	uO4rSKvrFlmyZ0V/wizCc3pxYkQ==
X-Google-Smtp-Source: AGHT+IHjgvublUsuE1dFWpoQkQc9HsSmsJu09iwnu9Ap9HbnQ7uoVwIxTMWF4kS0eMV+Ik3r0zR8mixAkRlb538PC7Q=
X-Received: by 2002:a17:906:1c53:b0:ac6:ff34:d046 with SMTP id
 a640c23a62f3a-ad1a48bc9bdmr658682666b.2.1746471281692; Mon, 05 May 2025
 11:54:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409205001.1522009-1-robh@kernel.org>
In-Reply-To: <20250409205001.1522009-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 5 May 2025 13:54:30 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ4whU81jRLD+N+oiKD-VMSYbrQnSCs-6GfUsk+MNJfpw@mail.gmail.com>
X-Gm-Features: ATxdqUHhyEcylLimQ2AZbABOXm5VFq6XGYrWShT7DDd5Zhp86Og0KeGcT0zw1X8
Message-ID: <CAL_JsqJ4whU81jRLD+N+oiKD-VMSYbrQnSCs-6GfUsk+MNJfpw@mail.gmail.com>
Subject: Re: [PATCH] arm/arm64: dts: mediatek: Add missing "#sound-dai-cells"
 to linux,bt-sco
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 3:50=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
> Add missing "#sound-dai-cells" which is required by the linux,bt-sco
> binding.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm/boot/dts/mediatek/mt2701-evb.dts      | 1 +
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
>  2 files changed, 2 insertions(+)

Ping.

> diff --git a/arch/arm/boot/dts/mediatek/mt2701-evb.dts b/arch/arm/boot/dt=
s/mediatek/mt2701-evb.dts
> index 4c76366aa938..e97dc37f716c 100644
> --- a/arch/arm/boot/dts/mediatek/mt2701-evb.dts
> +++ b/arch/arm/boot/dts/mediatek/mt2701-evb.dts
> @@ -50,6 +50,7 @@ sound:sound {
>
>         bt_sco_codec:bt_sco_codec {
>                 compatible =3D "linux,bt-sco";
> +               #sound-dai-cells =3D <0>;
>         };
>
>         backlight_lcd: backlight_lcd {
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/=
boot/dts/mediatek/mt8183-kukui.dtsi
> index e1495f1900a7..9f53344fa83e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -105,6 +105,7 @@ sound: mt8183-sound {
>
>         btsco: bt-sco {
>                 compatible =3D "linux,bt-sco";
> +               #sound-dai-cells =3D <0>;
>         };
>
>         wifi_pwrseq: wifi-pwrseq {
> --
> 2.47.2
>
