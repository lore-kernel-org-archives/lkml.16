Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D06F1A255C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 23:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743031245; cv=none; b=ZfttsqjUfa0gSzGmwWSCxvFQCj14ib5SPLI9D3JQnRQkh9uoievPFK/WlIPlmWW4/seyQ/PvXMrV+bhFKhwGk8SFiMlVF+pidbk7SGCCiTumdhS1WBAGo8YFg2h6y9R9kVdbSJ9IUuyR59uOyQr+hAd6EmUvbTk+UE2GDcnlTgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743031245; c=relaxed/simple;
	bh=eEE2r1yYFkUZu7hEG2XGMjMoeTAApxZuXF2Q5/43/SA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XlCz4+y+8KEyovuHn3181KGLmekFxUYrT4OVGa7GBMO7BC1b+Fec5GMp76bflGJlsvF5K4uGYmJkICnX/JZmrdUc8d2sLo+mSNlETerTTvqou6aUrsBCDFhNTrQQBW72HGm7/9AXViIzmjjRQ02rB97KHvOOWHbFs3cin0Vy0Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VulDeUkB; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VulDeUkB"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so3471105e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 16:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743031241; x=1743636041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XuFo84pE+zU/a5xWpeUooNoDSLrcVG0XywvPlUvoobY=;
        b=VulDeUkBZJdhVfEi7UAmIteQ7+twfxrhvthHGXAEyq28sS9fPmb/uOb7gQXSB6Xav4
         RMCHUXc4BeBrgQ3X45vo7Jg/X1rSNWWLXKpZNfQnzHEPtfLSrft73WmsvVEXCSJkZujr
         gWlOQQZrhkIRisK1ZD6VfZXN89VHt/QFxjsIN0qbmtJ/1tbY8qHF1p3UQLUQnvv3UR4h
         IRZiQxXKKuqv5swDsxNql7GCwDtHl6O91/eA4VwxWxVhttus5tMZMRyOs4jn+iQgjt8W
         Fq3G3l5FKuyHR997ES4Bs1yyo0Z5bjM0RpgLwTuBhVTn924ka2MN/K4MJLUel8tSvOE/
         pU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743031241; x=1743636041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XuFo84pE+zU/a5xWpeUooNoDSLrcVG0XywvPlUvoobY=;
        b=IvGbef31gQ/jwkOHT30VYR889UiYP8UERzkcvua+CVtQcQJBT+lp6at+KHDmGKY4Wp
         xWDq5hd36YVCiTv0L8ANkjhX8Wdi3ROZCo87QO/kw1cb9XFfy8v/Z45A6eWKG75xhIGL
         /0Lrq1Fc6FD0cymmAyBZjbZkJu+z34QO5OfCT934vN10DLt+eeOv4s3EOOo9/lWizR1B
         fGSg4AdhZC6UGE1HrY9iKKpxg3h8BWEpMIrZkm2YOX5uxAguXvU90DxWPpJJ4PUqFyRe
         Wk+CJVYakCeyTdRlVAhFpd34EUxBFPsr55tWYsJSULWMx4ASksZClS7bjdP4flSa+XPc
         YfDw==
X-Forwarded-Encrypted: i=1; AJvYcCVlHSuKdwcIml7BowotZ4Pse7KzE/dNuw/NO1hSvIvCr3KL5hgWgCWhtKfW+gtSn0YGwinHns6yy1Acc7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMo3ZM3FJPHFj3+b7zM9uFFJDBoXy55MyVFEUGg5OmFyWp9E3m
	PvZBLWjFlS4WQBB//weeyN5LA9Nyx7z97NhE+lyMWhEByDDAJasIhNed6s1scSQ=
X-Gm-Gg: ASbGncu/io25bSgEFHZShAGSIU7oYveXSdF0gF+eqgftwI/0NEGiAYMX8cnNPW6+NAE
	wSUYh+EDrQhVgvHzKtw/Nxht6LFYhXgMs7qQ4HYZLUlqqIww4BwJLy6JpicjP19mokyE4CiIPv0
	0/uXjtndCqaiRheKSr0Z/pHRBhoUQGBWdAgXN4V68EPATLF763A2e8SCjI4ib0xlEugUtit0zes
	QSHMY+VWDfn0jaaNNmB6jU9QMPafD+o0r3bnuV7g2Y/JQ99uzaVRn1zngEtt7i43vWmkExnURCd
	KcIiYrE5WmbNJudoef1n8EF98kEPhHO6pKLM9jmO3n6ly7vkKdOBJjWL7YiexEPn9wybKBCBblX
	5t+SadKzWtA==
X-Google-Smtp-Source: AGHT+IFFqiheC5thw/TIFb+2LZxLiMGm8Pw7LKkpF7QCjDZPBPf2FRSdFD6V9DQI8xaqabcvnC/8/w==
X-Received: by 2002:a05:600c:3d97:b0:43a:b0ac:b10c with SMTP id 5b1f17b1804b1-43d8509745dmr9396235e9.26.1743031241531;
        Wed, 26 Mar 2025 16:20:41 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82f1bb75sm18551995e9.25.2025.03.26.16.20.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 16:20:41 -0700 (PDT)
Message-ID: <316c55f5-189c-40f6-95e3-c7c0d858a6e8@linaro.org>
Date: Wed, 26 Mar 2025 23:20:39 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 LCD panel
To: Christopher Obbard <christopher.obbard@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>,
 devicetree@vger.kernel.org
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
 <OO_0LvWJ_pUpza-tYPX0qCtcJ0_aZFbYrE81PaiSXqt7-R2mUWB8XyJLww_1t9mMLrI92GH3PconB8FDnbq_NA==@protonmail.internalid>
 <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-2-e9bc7c9d30cc@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-2-e9bc7c9d30cc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/03/2025 19:21, Christopher Obbard wrote:
> The eDP panel has an HPD GPIO. Describe it in the devicetree.
> 
> Unfortunately I cannot test this on the non-OLED model since I
> only have access to the model with OLED (which also uses the
> HPD GPIO).
> 
> I believe this could be split into two patches; one adding the
> pinctrl node and one adding the hpd gpio to the T14s devicetree.
> But I will wait for your comments on this ;-).

There's nothing wrong with defining a pin when you also use it but 
emoji's in a commit log are surely verboten !

> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index 962fb050c55c4fd33f480a21a8c47a484d0c82b8..46c73f5c039ed982b553636cf8c4237a20ba7687 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -980,8 +980,12 @@ &mdss_dp3 {
>   	aux-bus {
>   		panel: panel {
>   			compatible = "edp-panel";
> +			hpd-gpios = <&tlmm 119 GPIO_ACTIVE_HIGH>;
>   			power-supply = <&vreg_edp_3p3>;
> 
> +			pinctrl-0 = <&edp_hpd_n_default>;
> +			pinctrl-names = "default";
> +
>   			port {
>   				edp_panel_in: endpoint {
>   					remote-endpoint = <&mdss_dp3_out>;
> @@ -1286,6 +1290,13 @@ hall_int_n_default: hall-int-n-state {
>   		bias-disable;
>   	};
> 
> +	edp_hpd_n_default: edp-hpd-n-state {
> +		pins = "gpio119";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
>   	pcie4_default: pcie4-default-state {
>   		clkreq-n-pins {
>   			pins = "gpio147";
> 
> --
> 2.49.0
> 
> 
This definition looks consistent with the schematic to me.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
