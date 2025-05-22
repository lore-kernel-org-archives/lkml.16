Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660B119E966
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747937634; cv=none; b=BV5fZToEHaXuLtdrYyGDLpw9YQ/omMsNoVIJXpgbOMAde1zhJ6+p7Sf1gFBABGZVlCW/QhmDQzTObfUgEIlei9XIz+ArtspdK1W4JHnjrQCmeiLbMqln3lY9Zt74GS1301mELbvqpZWYdjZPiyQ2X2OBcjGOysmw6CWHlIASkMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747937634; c=relaxed/simple;
	bh=91toqZEphZKmE9o/rBckXJd1FNa8ApcyPXqGQ8XvA6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jxI8+uj3MI1VtMAWCspLwLOP+H7oGV+x/9fNS8kPMiB/+7h2+zAbzB9Uuvky9ARs1ivxGAu6wQrUX25MFF20qVnZu9+ZhCBjs8w4rH+1A66ofKHmSaXqdBRyRThdJNQrb2UOWO+iqhRUukxBhsVjz/d+uu6ZjE5cpBDzxYbnnwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m9+C8ZOq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m9+C8ZOq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MG38YS029654
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:13:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cJTXM+7S9NgTzSFFl+A5KpdMXXyd0FhjVTeFKwQdXKU=; b=m9+C8ZOq9cNDiEje
	5wxs2n8HsrWNecyEGl8XPaenZ8l/TfNUGfgDOLHH4O+ymVYY0lcn2F3CHzO33uS/
	T3WKZoKFLDhZ+Cl20uXtYL2HkeIKUNr/pWrRS0SFnpOyOOKEZa65GR2PMTPkegft
	nBSnioF31A6ywD7+UmqSuT+4+C76LNK4DU6queo2R0Lf3e4jICLhTFeiKGwehKAO
	oxqZvWmED6FJua0Bq1UwlzjHSzF9J0snSGtG3Og1o/fKcS8Fo5Qk/2nQ6Azf85+u
	yS9Mj6EJFLE6aH+2py6z1uZlugJB4zxQ5TaLNOP1bRg420ujQgcEJ+3olKFLYy4w
	pTt/0g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf47da6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:13:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c53d5f85c9so207758185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747937627; x=1748542427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJTXM+7S9NgTzSFFl+A5KpdMXXyd0FhjVTeFKwQdXKU=;
        b=jaUXzOIyRkuEWqYg/obMgWZip+2QZx+XXBvrvIv6DJX/nUgEjmjMQATXp6XKFpvgM6
         btm5WJsuPUTFZ2QmGbPMFjY1gkyiBhQJhLdgehjCmg0V2YAZG/XpFkoBlZMlPUE0SRQn
         A9RsNqm+QfCIHPE4VB2/JZMvX1pPf808ndffdp+icZ5m9dhsyRkTpqwb6KQXXtIzTTwz
         QMGhaqoin6cnRcg2PC++9fXtjY3GSZZPXcTXVPd1iZj/sYyL+YzuvImhoJViE42+yVmf
         7Jxfg5WlyD08+iWnVngpmU+tjqd0uZbl9YuQ7OPuM30DxD/7otKtAr5dyUibMryrLub+
         GAMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOrkenRbb4ZfnoNRpvN2+7dKt4wbtrWdB+/IjA31d+PkRC36O51dme4Vo63cXxT86xqZHD/0QBP49wMrI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMbLTAGBaEgzjM5va+8eARcMiKbwz3h2EEutB/C4nqeieK5MRT
	112AlCRAy8TwhkpiqYPG/WlD9WlZb9OIdsvQ+c7iUBbWtKYiFhixLrzb9HwyquebnDzIXKxen9v
	I7m6+59A+ZmwJOcOf5sx2f4dmyNHQs8gLXpLmvPLJl5oSydawZP3RhMqoirGp7Bw2T+c=
X-Gm-Gg: ASbGnctBMZteg+zg04ozXhhGRQG7YBIAEqfhrDJEX5NZn713CB3Ow1hCLm0UiKvXRnl
	Xnu41mXzYONwApoWUwYjk1prxTciynDXuIKJmVHgkB0+Ovwp+80ZdhncMiUKCen3sB724pvuzkZ
	tL9nGbH8ietJGmPfLUucs0BCE38JVJJ8VxfiYwetqPaKZsy8xe9WvhhiE8ipIJU8AAroTIHXfB8
	uizR3P/OYGi70APCOP0yYflx07W4uYtebNE8IRTDtbxTZCOrQ5TEEP5TvCUwAQ+/wRAen4wXDqX
	ayj4IRDQ2JpnZGOfwk4GuLIykUvxqLaXnTMMXvjwcpxIiK+/loNT4rM6JcgVW01Aqg==
X-Received: by 2002:a05:620a:6506:b0:7c3:c9d4:95e3 with SMTP id af79cd13be357-7cd46779c90mr1645450185a.10.1747937626841;
        Thu, 22 May 2025 11:13:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFG1s5LWcfdRcLuprDH7NRf4cIMqfzPMsVHaGaLchl1HpyhV9P/PLyDyxgUXuVubSzGN2Rrhg==
X-Received: by 2002:a05:620a:6506:b0:7c3:c9d4:95e3 with SMTP id af79cd13be357-7cd46779c90mr1645448885a.10.1747937626412;
        Thu, 22 May 2025 11:13:46 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06cdefsm1130366966b.52.2025.05.22.11.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 11:13:45 -0700 (PDT)
Message-ID: <c7d5dbab-0a51-4239-811e-dc68cac18887@oss.qualcomm.com>
Date: Thu, 22 May 2025 20:13:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/12] arm64: dts: qcom: qrb4210-rb2: enable wsa881x
 amplifier
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-10-9eeb08cab9dc@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250522-rb2_audio_v3-v3-10-9eeb08cab9dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4NCBTYWx0ZWRfXxLBa3ru+Jj+o
 5krrBevE1JQqiosZgP9KEXQ+MdCp2ks3uPWrJvQeTpa4Q/eHgXGLAxp8cxjKqo1mfnaYSxiNWNZ
 i4OkxxVkwlkE5ubSdH9LcA9MNxo0mLFEkV51bPzZNZ/JpVPDU2ICaeJ2XnwpHEb5xLVKJek3kcE
 BC2o/N707FkxZkq6mdRypDMMJdmzATqMCZO+m3SFiTTfWheMO9yN0UHluG475RMSJwjfAESub41
 mKs4OdKtdznyE/M4uAlFixk32brMV+KA78gRgoQAGpQKZxdNmL4HLhuhrfXX5+JcjWrcnWeZZDA
 i/YzAd1FDDbBAc27OznCrADr6jLdZStN4D6edDLZUJZVTCbuLKCYwDW+5FK5wQVGgYd/NRqWp//
 ze2rsWYNGNGcBNpcyZpzx1+atHXNtgzoA6vSbYNgI6/f0etvHlOFYCY6MdoWZRbG5X0SZvhd
X-Proofpoint-GUID: 06KTkRNBRf0y66UoJ0oqXERdcNgCcjKX
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682f6960 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=75nCLt9WaoCjErCtZgIA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 06KTkRNBRf0y66UoJ0oqXERdcNgCcjKX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220184

On 5/22/25 7:41 PM, Alexey Klimov wrote:
> One WSA881X amplifier is connected on QRB4210 RB2 board
> hence only mono speaker is supported. This amplifier is set
> to work in analog mode only. Also add required powerdown
> pin/gpio.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> index 6bce63720cfffd8e0e619937fb1f365cbbbcb283..4b878e585227ee6b3b362108be96aad99acba21d 100644
> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> @@ -270,6 +270,24 @@ zap-shader {
>  	};
>  };
>  
> +&i2c1 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	wsa881x: amplifier@f {
> +		compatible = "qcom,wsa8815";
> +		reg = <0x0f>;
> +		pinctrl-0 = <&wsa_en_active>;
> +		pinctrl-names = "default";
> +		clocks = <&q6afecc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +		powerdown-gpios = <&lpass_tlmm 16 GPIO_ACTIVE_LOW>;
> +		mclk-gpios = <&lpass_tlmm 18 GPIO_ACTIVE_HIGH>;
> +		sound-name-prefix = "SpkrMono";
> +		#sound-dai-cells = <0>;
> +		#thermal-sensor-cells = <0>;
> +	};
> +};
> +
>  &i2c2_gpio {
>  	clock-frequency = <400000>;
>  	status = "okay";
> @@ -736,6 +754,14 @@ wcd_reset_n: wcd-reset-n-state {
>  		drive-strength = <16>;
>  		output-high;
>  	};
> +
> +	wsa_en_active: wsa-en-active-state {
> +		pins = "gpio106";

Are there two separate enable pins? Or is the powerdown-gpio something
else?

Konrad
