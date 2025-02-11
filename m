Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA90250BFD
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739285128; cv=none; b=J9OJ8XySAbulzJc0h4ZEuLDbqBbjriFJGF2cniF+3feJmSnyFtLmH19pyOM2r2KeWgBY6DwH3PrBj+5m814jHTQ4glQkN1rqHTb8iyyJQ/VZrmNPcWCk6wBK/NCuEprOI91q8V22eHBOxRisD96KLV66Iv4mRI0CrN2YPBlG74Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739285128; c=relaxed/simple;
	bh=0kVKqk5IG8JfqeSpFKJ8BTtJxmpzxliMEVgSL/PtQ/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bWnUGAdHR8AJaDjUQvpAH8ifVJ5tmx7Uc4CKrJuLMSBihzoxpDClYmVie58czuWs67KxvkLePvHYPjVpIQPtNShpllIi2UC4/AEfzpY5B1cS+oVMlyRvVu8aG+Da3coPW8cvPQVfi0hA8bmz1uAo1X0ILRJROIJnE6xSL9ZFV6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NNu4mvq8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NNu4mvq8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BBHpil026413
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C5ZlX1YetlmrIHMSkZ7v4IVR+ij3Aa6gQsqhWVYajoY=; b=NNu4mvq8Bibvup0q
	emXXlq3IMFDCVOSvu3WyMYVa8m4UjZpgX0w3jf39xpGgp2RJYoxBwqUO2LfRKrP5
	hqTxnROGq/o1SUOGLrrjEhkBjzq43sEhPndizH1kD/jMHE7PcgpLodHOBUcSEr8u
	FHVf+1W4Zm+MCUqXWMcDid+4F3J56qThuP41CBhnuyOe1YgiBe88LBHhsrCYR9tO
	iFH3PN1CYJFwW96hWdzXPw3Kbv4BZwaFKy5Ub/Dv9+TWtOqV9XUeGnyFVfHBUoPg
	jB8ykGcsm6sLTkdGCVlWKG5U5rRCQaPhK6mIx3jnwvQ8hJZ7nvGUv8mJoSvMVyDD
	K+1J8g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44r5j58mhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:45:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-471ad2e69d6so251621cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:45:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739285125; x=1739889925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C5ZlX1YetlmrIHMSkZ7v4IVR+ij3Aa6gQsqhWVYajoY=;
        b=Fv/61rkffsbSjc6Dqg2b4FIy74lfverQmE2OWTpsHt0UxXkCpyOOsMRNHd6AviiD05
         tGc4lTtiXO6jCZGHTtLhv/X6SSs1XjLcAdyqkhuN7egloVc9pKMrFsy6YNg4XcVUEzGg
         TdYOETXaIeKTbLZP9azuWxVNmOydaeclqxisxt2mgiXavwJJBV7BxjUUoJ2UM9tmXvqq
         xCAo0+FzOuXBQJrCw2MM4RRS5os1AojF3I81P9fDmKAWENTXdBkqbogSCSnszbH6XTUI
         bO2iiRta8XNhFkjx8zIR9KLQ3fiuiRUpVxZX/YaLEhC/EVasDeQNzFOUiayCpQ2d3SKB
         CWog==
X-Forwarded-Encrypted: i=1; AJvYcCXMUOAfVVne/aPv3MyxvhFbmoWB4FFd5RAlwh1NGzBXjrQqizM441Ruj3p1+MayfNubmg69xqGxRhoU1XA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7FzO9Zb//p578lEFjhThv973TbbKw6AXvTkIUc90utyw3KRBa
	QITOPNjnx/dhrhVT1LK8v7FD+HRZ0pz9S83f9CyVcNOclRfMoVo51UTdYjkiuu44ARhYXXgIOyG
	HAqLfapTrCy5f6ayuibCwh5VUP9tL3iaxbnMXn14z+EkGuX0/XQH6wW10atV7XeE=
X-Gm-Gg: ASbGncuS95DdDxIDr7fJr4CiG61KZ80xAPHcqiVrrdW29XOaASfPO6hwp5gl3lCpN0P
	ISLCH4hwW1WWgW8ue124kvHJy6HrMJ0YUzj5hRiSk5+tdYFCVxQtQMSbBE/KCzruUxgLuwhRm8J
	yY/bvacVKHukijC/bpTPPPnpEyYtCZQH0TGa7l7cnYzxT4Mb4VILoJrp89BMzpOF8aPZM38GFT4
	MQjFXv8/znN36tvU+DY8vranayjX2evhmiABk0hoZgG2HZnJRAzHjdux7CUi4hhVE1eRfh21cNL
	EQ3WUjALhy542hsPpJd9bofzmV3MWKvQa+9wMAlAJBwvbWaBMmdLJDr/gOg=
X-Received: by 2002:a05:622a:130b:b0:471:89e5:5154 with SMTP id d75a77b69052e-471a3e0db5fmr12104521cf.12.1739285125032;
        Tue, 11 Feb 2025 06:45:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZMSc6eujUP6gA+rQWjF9sJt0YkUCD00xhY+fNjYpiy1BMcxtRBCV1dPRg4/gTMVtVYU5GQQ==
X-Received: by 2002:a05:622a:130b:b0:471:89e5:5154 with SMTP id d75a77b69052e-471a3e0db5fmr12104271cf.12.1739285124385;
        Tue, 11 Feb 2025 06:45:24 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bf1d8aa5sm439955066b.62.2025.02.11.06.45.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 06:45:23 -0800 (PST)
Message-ID: <fc8483e2-b149-4f7c-b62a-9e7d0f6e2c65@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 15:45:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] arm64: dts: qcs6490-rb3gen2: Add vadc and adc-tm
 channels
To: Rakesh Kota <quic_kotarake@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_kamalw@quicinc.com, quic_jprakash@quicinc.com
References: <20250129115226.2964465-1-quic_kotarake@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250129115226.2964465-1-quic_kotarake@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hvg_Og9jKBVkM7svFSZZlopOnD-NMY0D
X-Proofpoint-GUID: hvg_Og9jKBVkM7svFSZZlopOnD-NMY0D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=928 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110099

On 29.01.2025 12:52 PM, Rakesh Kota wrote:
> Add support for vadc and adc-tm channels which are used for
> monitoring thermistors present on the platform.
> 
> - Add the necessary includes for qcom,spmi-adc7-pm7325 and
>   qcom,spmi-adc7-pmk8350.
> - Add thermal zones for quiet-thermal, sdm-skin-thermal, and
>   xo-thermal, and define their polling delays and thermal sensors.
> - Configure the pm7325_temp_alarm node to use the pmk8350_vadc
>   channel for thermal monitoring.
> - Configure the pmk8350_adc_tm node to enable its thermal sensors
>   and define their registers and settings.
> - Configure the pmk8350_vadc node to define its channels and settings
> 
> Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
> ---
> Changes from V1:
>  - Update the Die temp name to Channel as per Documentation.
>  - As per Konrad Dybcio’s suggestion, I have sorted the pmk8350_adc_tm
>    channels by unit address instead of alphabetically.
> --- 
> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 114 +++++++++++++++++++
>  1 file changed, 114 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 7a36c90ad4ec..54ad11d33b38 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -9,6 +9,8 @@
>  #define PM7250B_SID 8
>  #define PM7250B_SID1 9
>  
> +#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
> +#include <dt-bindings/iio/qcom,spmi-adc7-pm7325.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> @@ -212,6 +214,50 @@ pmic_glink_sbu_in: endpoint {
>  		};
>  	};
>  
> +	thermal-zones {
> +		sdm-skin-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;

0 is the default value, please drop these properties across the board

Looks good otherwise

Konrad
