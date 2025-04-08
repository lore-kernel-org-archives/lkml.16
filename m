Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20E72686A7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 10:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107802; cv=none; b=pUjmgOrN2GboTYn2zB937tj3PAdbIqnRlBrdQobteuorbQL6NwbxI5MpEoEwX/FNHvDWweVMuMKPW7wyRS8mZMNxVEG0hNopNpQdfO7REf8U9dGaIewraLV10kwvSwdEVMiOF95J+XZ5acI1vTz8kRIcc+jo3vpuvLaBcH0FIMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107802; c=relaxed/simple;
	bh=OGNuM13Jn2n20UyvzyKj9h90vOLjQ7TUEPBE+s/TVZc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=SJzOqm3uTY5fYo2Nr/w8H6G9BLgCRyc/B5ZdjulmoVofzHqOdMyA+4H9OSBOWq0Luy++Kli7l+svwI/MTkLd0bq66SxG7JK0k1chK54AoNz3yf03Zns6s+xnTsX+OJfIe28j59hEa78ACpnjWotkbEv3tzngP3nFc3wLYp/K9lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=l0iUWLzS; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="l0iUWLzS"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso11815131a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 03:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1744107799; x=1744712599; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATjvu1YuAWOqdIdSFjKRxn6bFisEx6/wr2o3X2NPy/4=;
        b=l0iUWLzS8/ij7Kcua7IjG/NLTV8wM07QYHdjzRlm+LQstzU20PXVR6VeaDklllgMCg
         ti8XxNoNSijrxDJROigMDzYdNKJ+FuRrlhqe9k+PBZ1/hBIhVr9Y9y9PStjhY5uoGUEP
         G1m8z0xjvCk5eXeEF9nwf/sX1F28hEJyJpcyL1K5HaCwD2PR5aNfj3+CyyjslpwNaxFU
         lX5S6ej9HcxpFZFbL+PCu230b+xVzdA93UsTi3F6u+eoxrFo3gl0to6BGTfdcvI4LFvn
         v5E0llgxCYQZrVJpERiHPzF+jARDJRX2vqlkuzZxMnW178euJ2yo2kA757PXG0FTpr4A
         7AqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744107799; x=1744712599;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ATjvu1YuAWOqdIdSFjKRxn6bFisEx6/wr2o3X2NPy/4=;
        b=oy/a3NwAhSJGNTlsi0cTi08TBMjASN6R/vMpiE07R2R38+TFn/KJEI30JufYoHS6Qh
         Qn7x8aP4RJgZkIbmt85yWaD8TnRGX2BZ+WwY9sXdz6jDSnS9h0mwq2mGk3jgBImzHh+n
         7r45af7UHq7Y5qP3nl7a8ubsrArovU8AN58SH4A5YfKRDCEYqRcbdeqT/W2h7xu3Dr8y
         JcxT0AabxDR8y5oq7sHZGnXh8GK1fcOYSxh61Nihlw4VL0MeITrpz+Wei9vXQ1FP2fM3
         FYAhCfqlL6ccXtCs0w/fNqk9+objV9F6Pv9Mkz1dlInqb8GqDeUbGLFVAJg9r3Sgbln8
         Mong==
X-Forwarded-Encrypted: i=1; AJvYcCWi1tSu5MfvEADQYDyXeqX9C1T/UqI1Rj+MP7BrzWEsAD5HwpiDfk/d1faa4tjv+hsuZMdC3cXt7w02gPY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8OZC581Z5Kol63MJ50V/Wair18KNwJ4Po0zF3VmH5KSQJwT7F
	byxidYjKC9/E8f1ZlxVG2RBqcwLJ8EGxbeK6fo6ja2gDacWkzJ+IjgNY1u8LrPs=
X-Gm-Gg: ASbGncufAkRH0m1Knrj3JaA+O05F0+rbeFXEyeQWl+Lohp0887pP10QZlT6Elms23CY
	YfsGMxhjVqFY6jTm7qobxooKFBqdDHLmOnkkUa66z8KfyFtk1DjMy0Yai0Ls8eREuOhSnyaAXKx
	gthx2Ah2WilWYu8sACRE+nsGehEeWT3Vlo3myJgK0XBv2pzFnPkD+2lL5Figv+kg8MRVSQxD+uF
	zAM02e607VVYmoTYPW9aNPUL1hzFJVGDV8oESR3iHCTiNgn5qIe1Jvb1gWXP/K/NrKQL8I7SFpX
	3dLge3FQ/1lXM//uzJRrAwa2EHp6zH3fKlSj5MQRZ5Nzve2VV4wQynSiRDHmXOlM7K5RhU+EFYX
	8R3aRDfbXc/m6Sg==
X-Google-Smtp-Source: AGHT+IESezrO0NwdMHDG4u4oSclKwyxgWMeMzsPuPPHtz4vm8/nQJIpzM61Y73uij3wfyLK4ntLQ6g==
X-Received: by 2002:a17:907:9495:b0:ac8:1ea0:650d with SMTP id a640c23a62f3a-ac81ea06691mr191813166b.0.1744107798996;
        Tue, 08 Apr 2025 03:23:18 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a55aasm8049772a12.78.2025.04.08.03.23.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 03:23:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Apr 2025 12:23:18 +0200
Message-Id: <D916M5DUK1YC.282XEZ0TMSNEC@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Dmitry Baryshkov" <lumag@kernel.org>
Subject: Re: [PATCH v2 03/24] ARM: dts: qcom: msm8916: Use the header with
 DSI phy clock IDs
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <cros-qcom-dts-watchers@chromium.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250408-dts-qcom-dsi-phy-clocks-v2-0-73b482a6dd02@linaro.org>
 <20250408-dts-qcom-dsi-phy-clocks-v2-3-73b482a6dd02@linaro.org>
In-Reply-To: <20250408-dts-qcom-dsi-phy-clocks-v2-3-73b482a6dd02@linaro.org>

On Tue Apr 8, 2025 at 11:32 AM CEST, Krzysztof Kozlowski wrote:
> Use the header with DSI phy clock IDs to make code more readable.

Hi Krzysztof,

This patch was the wrong subject, it's touching arm64, not arm32.

And thanks for sending this series, it's nice to see some magic numbers
disappear that make little sense if you don't know what it's about :)

Regards
Luca

>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/=
qcom/msm8916.dtsi
> index 8f35c9af18782aa1da7089988692e6588c4b7c5d..c89f9e92e832eae8f630555e9=
e7f5817d6731d4d 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -4,6 +4,7 @@
>   */
> =20
>  #include <dt-bindings/arm/coresight-cti-dt.h>
> +#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
>  #include <dt-bindings/clock/qcom,gcc-msm8916.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
>  #include <dt-bindings/interconnect/qcom,msm8916.h>
> @@ -1497,8 +1498,8 @@ gcc: clock-controller@1800000 {
>  			reg =3D <0x01800000 0x80000>;
>  			clocks =3D <&xo_board>,
>  				 <&sleep_clk>,
> -				 <&mdss_dsi0_phy 1>,
> -				 <&mdss_dsi0_phy 0>,
> +				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
> +				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
>  				 <0>,
>  				 <0>,
>  				 <0>;
> @@ -1590,8 +1591,8 @@ mdss_dsi0: dsi@1a98000 {
> =20
>  				assigned-clocks =3D <&gcc BYTE0_CLK_SRC>,
>  						  <&gcc PCLK0_CLK_SRC>;
> -				assigned-clock-parents =3D <&mdss_dsi0_phy 0>,
> -							 <&mdss_dsi0_phy 1>;
> +				assigned-clock-parents =3D <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
> +							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
> =20
>  				clocks =3D <&gcc GCC_MDSS_MDP_CLK>,
>  					 <&gcc GCC_MDSS_AHB_CLK>,

