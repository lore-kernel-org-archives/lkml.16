Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281E22BEC25
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 23:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744414618; cv=none; b=ruc6J+jOImMju4slce5wwnAr7PNMOHw35XAEcb22qCLLIutFktBxqt3Vgk4SLNjKhTrW0hTKHU/EDSWEUJEU5/Hjtv57CqUg0zcXEOxiVJTMFPzGiIG9ugtIV2XKo8LwqrwJweQPCDzbcPnoSH2YltQXcGv/DZ/oLwzCKqllbVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744414618; c=relaxed/simple;
	bh=F2MEoZb1oiLXWTvtzNeOVYUS/wljEiRsjLEkB7yYgjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A2ZhPT+P1mXSsGzqDdhYr+QUKHMK45gbIgO1WXUWbuEo/K0QYk7nnwvkqMMHwSHWLODt8quH7AMdxMtL7TKFNjSjRoSWa+OPZRSCLnj7z8Kacr9oJpFsWTuxKOtNNwZGiQaIPBEcfrtUp54dlyEgdGB1sYoWxDHkQVU0ETQnSBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GKtjNfCT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GKtjNfCT"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BF6X5r018668
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 23:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mZXJCUN8rXvDAQzcwbJgFzoqzmbQNg/zrl3mL0uESrI=; b=GKtjNfCT5E6xbHzy
	2zK/uMSQMpIXL/4t1SMfkH/Rxle8dIrD5p1SnG95SFTa76Qg6cYc4voIQFGC4fQH
	Zon0J89MwWs5V+8/KGPmvbpMVU0dmwcEQna4T9vzjbHi/BZ63aXjRH28lHiXqduy
	Y2+Ukj+lWj9SliUzknannwvfrz7UuEvt02IsF1JEAWET87prpXEe7+diO9a24UFk
	l5vL6q8UfCIU/FNJvthHy3X8/Ee7vnQJfmQxivgpNkBMkiJHsPMTLgA+HsVOm8So
	x+ay4ZyitX6iz9U1o+DLwa+/IFl2GvIhwCHLS61de2RWS0h0rft1JntzQrz9mVIH
	k0vtqg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtbc1ah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 23:36:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c547ab8273so39605485a.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 16:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744414615; x=1745019415;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mZXJCUN8rXvDAQzcwbJgFzoqzmbQNg/zrl3mL0uESrI=;
        b=f+KJ9LFV/I9PIbhd/2xyI2V6o2IFWm4qP8VpsmvPyRh66MT1GivWYpU0OLdvwC+bxm
         MUxRQsTUxpOcpUVzzQz4aCq3C6wesmMRbUkOT/kbdQ/fza7n9SOcCOlQenDx1tgzXm/J
         86dZ7jMT7FJnF4hF9aV/UgOt+sOswEFjAU5EsjneUY1c+Lo3sq426HDwLuIJyAiQuCRf
         P5ZH23WjYhAZIjP6eUfo9ajTSgVnfZfPaetRkt3yi5B6O8uHjoMF5gYy09x7Rb4y1sOr
         iv1Mw4KQzBc7E8lPmcl0YbEWzvUEbTmuwW8R4aGrkXCc3Tep89hLhJI0Ja2XzGjLCPx1
         TLNg==
X-Forwarded-Encrypted: i=1; AJvYcCVF9NBSyHKcSiPhuD8FdD/Cz1Ur0EPD0aU1LHzCOvUk0bgKhNrfXX4IOidh1r63+14tiRy78ZPyYoEhbhg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmf5VyCBfrltkrNM4Qq5ts6eb3Kk2y1o0h+gMiDIMCWH5RzlAZ
	Olm9MRhb2AM7F/T5wHTi3H0570hN7Y3bcgdej6RWGOVizDGLzEkCSnU6MPMX5UGNHDC7GJHuxgM
	ifalpwfhg0ZCZMVljBCQeiSNYvMaXa6n8rYd+OxmRl0e1EUIlhJJwU7MgMgKjgLE=
X-Gm-Gg: ASbGncuIAW1NJGza/90SY3/KxrXqdUDHoSJ1y2viGsQ+Ts3721X0wmDvc1D7vIUhb1S
	i4Wv2Mb5hnvcHoFgMHgIg0VSb64N81B21aGqDa+YemHAg4aUTkXn+nUAi/2PTJkWTk14KdVLYmy
	H5PTfmiW0pWN4gfgHKWbAR1bbxKvAYbbkfP02j+p3PhR8ys8fSxGXtDclnLWsCew0UtdEpJPlrI
	WGJcYVQNYQ6YlXyoFAPSrc55Dlfd9EtGSed3BRVCpseGasOhZSGcTApFOdidZIUKIc5s4IuxcO8
	9iG1U9yvxNLzNcCC23WsdLiW9uaAD11D84xaVl0Tb+SvtluIANJ2AtbSsqqZzbAp9Q==
X-Received: by 2002:a05:6214:5091:b0:6ed:122c:7daa with SMTP id 6a1803df08f44-6f230cd679fmr22455426d6.4.1744414614690;
        Fri, 11 Apr 2025 16:36:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqWzMl5yflqeZYthO3b8cF3jtNIJ0SnneEuz2SJ9TsBsK/1KVX/HyIKbbpsr26SYJi5lAVqw==
X-Received: by 2002:a05:6214:5091:b0:6ed:122c:7daa with SMTP id 6a1803df08f44-6f230cd679fmr22455246d6.4.1744414614130;
        Fri, 11 Apr 2025 16:36:54 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acad99c4456sm126724966b.110.2025.04.11.16.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 16:36:53 -0700 (PDT)
Message-ID: <2b9128be-1989-4511-995c-103c8ba71af7@oss.qualcomm.com>
Date: Sat, 12 Apr 2025 01:36:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add support for X1-based Asus
 Zenbook A14
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, maud_spierings@hotmail.com,
        dmitry.baryshkov@oss.qualcomm.com
References: <20250402084646.10098-1-alex.vinarskis@gmail.com>
 <20250402084646.10098-4-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250402084646.10098-4-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vpTpHqjxoVoW0j0vP7N0pD8TWE5Zlbn9
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f9a798 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=aVW_ViuoiE48ciB45ZYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: vpTpHqjxoVoW0j0vP7N0pD8TWE5Zlbn9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_09,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110155

On 4/2/25 10:44 AM, Aleksandrs Vinarskis wrote:
> Initial support for Asus Zenbook A14. Particular moddel exists
> in X1-26-100, X1P-42-100 (UX3407QA) and X1E-78-100 (UX3407RA).
> 
> Mostly similar to other X1-based laptops. Notable differences are:
> * Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407QA
>   and Qualcomm FastConnect 7800 on UX3407RA
> * USB Type-C retimers are Parade PS8833, appear to behave identical
>   to Parade PS8830
> * gpio90 is TZ protected
> 
> Working:
> * Keyboard
> * Touchpad
> * NVME
> * Lid switch
> * Camera LED
> * eDP (FHD OLED, SDC420D) with brightness control
> * Bluetooth, WiFi (WCN6855)
> * USB Type-A port
> * USB Type-C ports in USB2/USB3/DP (both orientations)
> * aDSP/cDPS firmware loading, battery info
> * Sleep/suspend, nothing visibly broken on resume
> 
> Out of scope of this series:
> * Audio (Speakers/microphones/headphone jack)
> * Camera (OmniVision OV02C10)
> * HDMI (Parade PS185HDM)
> * EC
> 
> Add dtsi and create two configurations for UX3407QA, UX3407RA.
> Tested on UX3407QA with X1-26-100.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---

[...]

> +	/* Left-side display-adjacent port, PS8833 */
> +	typec-mux@8 {
> +		compatible = "parade,ps8830";

What Krzysztof referred to with fallback compatible is this:

diff --git a/Documentation/devicetree/bindings/usb/parade,ps8830.yaml b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
index 935d57f5d26f..aeb33667818e 100644
--- a/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
+++ b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
@@ -11,8 +11,11 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - parade,ps8830
+    oneOf:
+      - items:
+          - const: parade,ps8833
+          - const: parade,ps8830
+      - const: parade,ps8830


so that in case there are any sw changes down the line, people with older
DT receive the fixes, as if "parade,ps8833" is attributed to a driver, it
will match (due to being the primary entry) and if it's not (like today),
it will fall back to matching the next compatible (and the driver currently
looks for just that)

[...]

> +	eusb6_repeater: redriver@4f {
> +		compatible = "nxp,ptn3222";
> +		reg = <0x4f>;
> +		#phy-cells = <0>;
> +
> +		vdd3v3-supply = <&vreg_l13b_3p0>;
> +		vdd1v8-supply = <&vreg_l4b_1p8>;
> +
> +		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&eusb6_reset_n>;
> +		pinctrl-names = "default";
> +	};
> +
> +	/* EC */

It's customary to leave the i2c address to make it slightly easier for
the next tinkerer ;)

[...]

> +&uart14 {
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn7850-bt";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&bt_en_default>;
> +		enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
> +		max-speed = <3000000>;

You'll need to provide some supplies, coming out of a pwrseq device, see
e.g. the QCP

Konrad
