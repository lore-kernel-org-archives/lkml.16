Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE6827CCF0
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748361545; cv=none; b=OnsZMMhb21JSl5f8LtqLRN5pW7vsELgNIUNtulEjbDI1ib08G1bMRQ/KMKtnYOOy3cUYo14XGLnn5818gsh4c/bd3Gdcw+Wr4nrLXE7mZ5lwSSn4mdWsBvlYrmKbMJQplL6Ig9kQMF9xP2ZVSG2LxDXVFoj6cSi9RVzRdl1jAs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748361545; c=relaxed/simple;
	bh=yfN2uQGm7zbUd++gV/nEJsaDi3LFlJ4HhiGQBuIdi5Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=EvHEg3R8IxZIv8zpeHob9CnQPR2/NuHL8vXmDrVMnejX9tX+/hRK2cuzI3p4YuGNu6d4p9oiJpi9oDp6R/3vJckNGhci7kecRdbdlnZEozvQw8uf6D/Nc8e7qAy863SnoJAbtQP4wq+Su6LqxTDfg6XpSgJit82X4reBAauTDY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tju3Rccq; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tju3Rccq"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a361b8a664so3646927f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748361542; x=1748966342; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLKlrSM5FsamXha6aN6KEk+RGQKQsgUaENo7zbmfoNQ=;
        b=tju3RccqZMoLfrpizNOg32ku6XPo2Vr5LDfbDsQ5IiUV870YoIJgS1H/ATswtw/U2t
         Dh5Kb8+kkxc3Lp/LR5Mn8MRPEyA/GLTZxrzap6fiBTNVB2ELfET9yRox6X6GMLcRnXpZ
         QUxF4hQqxSbyuyvzCLK/BbzoMajB0zzAuiyx5jJ1geCa3c78jbdrXxvGB5IntAjV89xC
         IgO9Ppi5uTBbuW+C1qmZXriPhBNeXcFicHpkWcC3mSc+aK222HJlKzyQOijC8+/RsAce
         lMUe1EMhtfkLo+lqMsCNeNAbARlh+gmidif8bOcepupq5qvm0tT7smVTF819Mq13x5Sn
         nPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748361542; x=1748966342;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uLKlrSM5FsamXha6aN6KEk+RGQKQsgUaENo7zbmfoNQ=;
        b=wJlw1JuRX+NZ0ePUzacZIXcMusaIf8YD6oHrwewd6bxdNQUE7mqAWdqf+sRJTtyVik
         mNUCCFrPDCJdbqH+EJmVtlBm4cS2c+e4mgkd2J5k6mmEMnAJ8xSjOjUnX5ApXZtNrskh
         QwgAZIBg5eghHcs9TYd4aMB0Z7x2ugfvLk6UAgLCAvebM/Yt/L5GZ3HNKa/s/9zKa/N9
         w8NY3v6w9NqkSYsibhTtQ0V30dnxWpH1EuPm1nqWPnqLEn8nrYnd4T+28DLScsP16/xL
         ycJAPngIre7pC0e9/dSrmZ8a1QvoHhw4cU3Yj/1lflVBuAUMeAD/y02mglUacH6jIC83
         0QOA==
X-Forwarded-Encrypted: i=1; AJvYcCVYvPszJMOq7ap7vadLO3Z6R17hquP7VfICZYeBnmvCFmx6aDPrwG6Xm8LsoO5BieUQ3nID/SjB4LPkAwY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyft6r7Vha7+Q9LWFjfHalFTmLrm3wQPtvLGkSQny1VHUPaDt2X
	jD/j+PtJ4wzbyMEH2DpuPhcylWSUGlT6y+MFZUt9UTxeckQOeFv8GauvDNXO3DganGY=
X-Gm-Gg: ASbGnctDgoNbsxAxebfZbhLkIWzRaP27+FlrYpJeZOxRl+VurhC608j+u744dGetNyZ
	pdhIQuYQf0Tn4XUx7h7k+UiSKZl5otPPBirhGwXYdJ6S9FQkvRzsLQXBVdJVn5sksbvCDi8Ib0m
	38vZOB3Z7Er6f1XvmrvrhcOuC+BT0dbc41oqMKzTWfcZu3RaGAaWP9kBoyPbkscnKV2qzNLp+ZV
	6zlcothHd26Rh/u6Iv0n2Pjafv0gPMagJHxj+Y/b+TmhZYyWgsud3l1FMaJ795YDv//drK8PbZr
	yIPFkAVZF9bY7hIxdei/cuRtaB74qDg5CQ60j/CjI5GVyIn/HcdbZmT6TA==
X-Google-Smtp-Source: AGHT+IH8iNaWsyltjjn5hm92Mn0i+lKy9tqudHYWMWemBgptnZTFbGMbCShMorMXcJs0g8uoqovcGw==
X-Received: by 2002:a05:6000:2087:b0:3a4:e706:5328 with SMTP id ffacd0b85a97d-3a4e70655cbmr52232f8f.48.1748361541676;
        Tue, 27 May 2025 08:59:01 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:f024:90b8:5947:4156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d4132534sm8134257f8f.21.2025.05.27.08.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 08:59:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 May 2025 16:59:00 +0100
Message-Id: <DA72FVL1VA1K.1MS0NMPR9PJ87@linaro.org>
Subject: Re: [PATCH v3 08/12] arm64: dts: qcom: sm4250: add description of
 soundwire and dmic pins
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 <linux-sound@vger.kernel.org>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-8-9eeb08cab9dc@linaro.org>
 <a8b2f310-2b1b-454b-9977-f74d975e6e66@oss.qualcomm.com>
In-Reply-To: <a8b2f310-2b1b-454b-9977-f74d975e6e66@oss.qualcomm.com>

On Thu May 22, 2025 at 7:12 PM BST, Konrad Dybcio wrote:
> On 5/22/25 7:40 PM, Alexey Klimov wrote:
>> Adds data and clock pins description (their active state) of
>> soundwire masters and onboard DMIC.
>>=20
>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sm4250.dtsi | 62 +++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 62 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/sm4250.dtsi b/arch/arm64/boot/dts/=
qcom/sm4250.dtsi
>> index cd8c8e59976e5dc4b48d0e14566cf142895711d5..723391ba9aa21d84ba2dda23=
932c20bd048fbe80 100644
>> --- a/arch/arm64/boot/dts/qcom/sm4250.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm4250.dtsi
>> @@ -37,10 +37,36 @@ &cpu7 {
>>  	compatible =3D "qcom,kryo240";
>>  };
>> =20
>> +&swr0 {
>> +	pinctrl-0 =3D <&lpass_tx_swr_active>;
>> +	pinctrl-names =3D "default";
>> +};
>> +
>> +&swr1 {
>> +	pinctrl-0 =3D <&lpass_rx_swr_active>;
>> +	pinctrl-names =3D "default";
>> +};
>> +
>>  &lpass_tlmm {
>>  	compatible =3D "qcom,sm4250-lpass-lpi-pinctrl";
>>  	gpio-ranges =3D <&lpass_tlmm 0 0 27>;
>> =20
>> +	lpass_dmic01_active: lpass-dmic01-active-state {
>> +		clk-pins {
>> +			pins =3D "gpio6";
>> +			function =3D "dmic01_clk";
>> +			drive-strength =3D <8>;
>> +			output-high;
>> +		};
>> +
>> +		data-pins {
>> +			pins =3D "gpio7";
>> +			function =3D "dmic01_data";
>> +			drive-strength =3D <8>;
>> +			input-enable;
>> +		};
>
> Other SoCs put these in the common dtsi

which seems to be sm4250.dtsi in this case unless I am missing something.

Thanks,
Alexey

