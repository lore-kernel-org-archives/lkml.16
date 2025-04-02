Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C2F16BE17
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 09:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743586514; cv=none; b=OfYmJSyYsi1588NaGU2KOu22mAiVfFnYwSMHIOxYlRq7StPxK8GsmGME8cXMDRdIe2cxUQ/ThfAkLRtswse2TFFo/f0rDLsfeh6YNWl5RQ963FYn7x6xJY76WsAMPWsMF57tFtozVuN+DoBv/zKjfE3xIjFDW9hiOLAHrWuWkWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743586514; c=relaxed/simple;
	bh=xz2QsNIt+Ztwq87lCfk7uvdsZ/Qk6EAegVkCzpv+338=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kv6q+n9UnFC9wdDGzSDAcMur/0NY1XHxxppqkfc4SM7hIpp/pVmQeQxtpwWfa6WxfY1qmo3cVbEjhPCx5ViYJm+Q5w42n2h1sJDZOfee0iggZ4vpP4CzRTv2Rq5QqXd9ymmxsAXPGo5ts5+74QBqQnpI1AvNpmU8X+CaTJlMAkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kEIJWqZj; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kEIJWqZj"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54c090fc7adso2242297e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 02:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743586510; x=1744191310; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvqFvLihDh/0pOLv9eRfMmIbmTTMjctegUodYgsIBs0=;
        b=kEIJWqZjebQ+b+/qdVU5HIHyEMIMmhUoVIJpNDcCG63R4wq+TOMAHSnO4Lotcn+orD
         SIfWdUPsis/80vEuhIPpdR8siXVyeR2li5ZNsBM78qBxdOj5RIH0nEU05zNzzRfPTEMD
         SBfoX9vtVVtO+YVR5pzzdZ3TxI+a5+0NZMzAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743586510; x=1744191310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvqFvLihDh/0pOLv9eRfMmIbmTTMjctegUodYgsIBs0=;
        b=Ftftsz/GpmjNA5H8/uYci+S9QQf3AymAsv+gsHDpzio01TWQx0Fvkvk9OS1YpF/wBH
         S1aEk/BIZkFIT54il3Q12M6kXqm7e+hHJQXhiGdHp7uEN+EU6m6UzdBnp1/5fnJXH8k6
         +VqBDf6YGHD/55bJJwYWyR3pLkpcB599CzqokOjCkd+BDX4xgYpbHGSp4fnXXM08Tmb7
         QW+A+7GF3ZB6/dUlgz1tED8qVRt1SJXfXm7JJbL3EUy2nbd9s7vVUk6WI0syr5E0mSk6
         qbRpYmHnrVEjQ4QGKlBlE9pEXj++G9/IN4vfbZxreRo5J3AdR3Z0nsrAMNayDopByIHR
         K8ig==
X-Forwarded-Encrypted: i=1; AJvYcCU2o8wyVdIwAoFusazTD0Lod+FQEcjPV7o/O0QNR4Ky+gOCO427jUOu63xIjnVoptxjTAbE7PePZ964H9I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5p2JeNjdLY4rGD8rPhK8rRKiqyFf5XZHUPa8f+oS1aIZgqqg5
	7MuIsPP+q0nJ4nDHDWhEATDA60Qb++/un9pG/sjNddoUXtvj85BiXjWbH6BeiyWMQwmveEvVyTe
	iXZ/EXlGf31OsLpqginySEQO975+KXm3U0eER
X-Gm-Gg: ASbGncumtLp0+uGOWdfLQUscWXlhmoGzI0m1bdn7l21KUnYYTb1L+792S5dvfUUwpCj
	4w2Z+oBmjVr+bIrWdkRLYUzii+KQkCybCSMvdO//ImTMs95Ctx6v3TaQQS4smQXZI0msLq7D2vx
	zv7sad/BfSGxsgstPYDyiqmuPea5e59++IjanDQsiBa9dLGG0hZ2vY
X-Google-Smtp-Source: AGHT+IHolYjToDJLO0MSTMBrUHXLrPk3zfgJ0HVwalaG7YqgYjm+NUtBLWq6MDeTZX2/PLh7y+9Yuwp9U64qQgsq58c=
X-Received: by 2002:a05:6512:3ca4:b0:54a:fa5a:e9b3 with SMTP id
 2adb3069b0e04-54b111401fdmr5382707e87.52.1743586509850; Wed, 02 Apr 2025
 02:35:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402090615.25871-1-angelogioacchino.delregno@collabora.com> <20250402090615.25871-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250402090615.25871-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Apr 2025 17:34:58 +0800
X-Gm-Features: AQ5f1JqvPNDibEnWSVdu_841YWdl7OuqFaP96Ge_W58uChccFThN9Of9ZLYLgag
Message-ID: <CAGXv+5GHf5D3JDh+OZ-Cxf91PTAGYk2+jvuwK1gymy=k1YOo_A@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: mediatek: mt8195: Add subsys clks for
 PCIe power domains
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, weiyi.lu@mediatek.com, 
	tinghan.shen@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 5:10=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The PCIe MAC needs the sram to be powered on for internal IP
> access and it has always worked before because the bootloader
> on Chromebooks was leaving the PCIe PERI_AO MEM clocks on
> before booting the kernel.
> Add the SRAM (mem) clock as a subsystem clock on the PCIe MAC
> P0 and P1 to correctly describe the hardware and to avoid any
> issue with bootloaders behaving differently.
>
> Fixes: 2b515194bf0c ("arm64: dts: mt8195: Add power domains controller")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8195.dtsi
> index b33726da900b..0cb96cba727a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -792,12 +792,16 @@ power-domain@MT8195_POWER_DOMAIN_CAM_MRAW {
>
>                                 power-domain@MT8195_POWER_DOMAIN_PCIE_MAC=
_P0 {
>                                         reg =3D <MT8195_POWER_DOMAIN_PCIE=
_MAC_P0>;
> +                                       clocks =3D <&pericfg_ao CLK_PERI_=
AO_PCIE_P0_MEM>;
> +                                       clock-names =3D "ss-pextp0-mem";

Doesn't the PCIe host controller already reference this clock?

>                                         mediatek,infracfg =3D <&infracfg_=
ao>;
>                                         #power-domain-cells =3D <0>;
>                                 };
>
>                                 power-domain@MT8195_POWER_DOMAIN_PCIE_MAC=
_P1 {
>                                         reg =3D <MT8195_POWER_DOMAIN_PCIE=
_MAC_P1>;
> +                                       clocks =3D <&pericfg_ao CLK_PERI_=
AO_PCIE_P1_MEM>;
> +                                       clock-names =3D "ss-pextp1-mem";

Not this one though, since:

         /* Designer has connect pcie1 with peri_mem_p0 clock */
         <&pericfg_ao CLK_PERI_AO_PCIE_P0_MEM>;


ChenYu

>                                         mediatek,infracfg =3D <&infracfg_=
ao>;
>                                         #power-domain-cells =3D <0>;
>                                 };
> --
> 2.48.1
>
>
