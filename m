Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E756122E3E3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573751; cv=none; b=bg4h20Jn9ZDK20iHmEG+pujJeKdwj7Rpcc07dQIQ2kNKBMmfjAYCfAx71XutZZtVr7DJWjj4Zn/vvmcs5Y7MviSUAalD9lh30qNAoPcDEPz19q+tvBtWjWbREmrOsw7pXe+eSFE5S/xXMr2ClbqEmxRnvMvQH3iRmX1E4UMCATg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573751; c=relaxed/simple;
	bh=sToWdQKy4Ilj8vtZl1fJZYV45WUmXfqIRGKxYDJBgAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D3tHn1RSRRZ28QitZXaF511fXQl3/TQpjtvrFAUdivNeh7NgiwLXIwEnGURXWpdkZPWfRLTMXjnsdEg9rOZB2ngLwhizYdrzAws1WweYveoeFq+x8UbpzunGPB8VWGZBm0+6M4Lvp0tqg6beksI0+cM5xiG9Ra20TrndVTo5vVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C5hl9uK4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C5hl9uK4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T8aB015508
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AJDl4omv7ndvFsud7bHAzIbFbElPaQdLGmav6WIPsh4=; b=C5hl9uK4YRXvDPx6
	U9Eaw4kphDAc62d/9ms3w+qqqJojv0NqT5rUazrhs4eo7M0bM4dLANit7ovWPzrG
	QNcZpuciVA6kgtv9STJZwENx1b16lMINP5UQiVO6pGrIHF6xDo8sQczChxxLV3l2
	ws/fZmbuq1ucBjV72OG0hrOnV3j4fqL7XjNkeJECTRudgZU0E5qjJ1iTMA9PyVgB
	Jv2qRJSrPORvsStQHksdH6rs0QAn2CHAYTEtwztzaSH51QwJUP4kf9g4bbXnqqqs
	uMr8tpHuIaTI8UCrAlVTHkqp88eM40HD1gRyTeL9VAPO2m/TYIMSuVEGMFOH0o8W
	4fs6/Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3geg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:35:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f9c5af3dso3355746d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745573748; x=1746178548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AJDl4omv7ndvFsud7bHAzIbFbElPaQdLGmav6WIPsh4=;
        b=d2XG1ce73tzb7rS1/V++E5WkXBE+RFiHW85qRMIOyiYyuCEYDrw23CZ8Brw6dN3sRD
         BpsI40Q+u+joqtpSKHR7mUccK4YAjisHZDcwppFOqylO0AgIj+bBaKMLW5sZL4yhI3xi
         9XolwSNMf2OtzTnxcLguHgE4pdofWYHYMlP20sTpC0oGf8+HTG90YOpW2Un0TCC8r0jP
         Z/JN7t/hJSN5lVFsx2y1q97IfCsnSiFa7vHugkoHRfa1VItyNko1sjUlq10+ODl27b3j
         UH2/BOTYchsZ2vcziIgj0D1k6R7XTQYypINi4a9rxcms0qR8sHySHRyejs7ScZKa8ssB
         HKow==
X-Forwarded-Encrypted: i=1; AJvYcCVKEUzAYpqQa5PBAVkZxaqVU0CAn/c+RVoudsQyPCQNCr/ECdV+9uM/tR/L7MzTUtyjTfn65OSWt+cabNU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7xEiV+7EQZwEkOyKfdj7sw1Bb+ceGVIBiC0QZkOu8mB/Fxoff
	5aVMuqAxlI9p74SaZDI2FTiyaZWp9c4NnuADhhNYr9z8+TKejnNCT/+9qFkHaNWSi5PhagCI0+U
	7mo7Ffm8XxQ9X96REcmWXjB4mvO6nU25HEB00BbxlVJ2n23RY837hKwgEPZMlJhE=
X-Gm-Gg: ASbGnctMKPfsDnZPZUOO1Roy5Ompvz8NO5JwOQLzbGzsEMOI9paNBRobxCvzwNhaBOh
	jjApNJyn2NoYP336VTH5M22E1Cr7X2kDs/Z/B//DWXUXFB0kV5djsJpLBqjv8EDm7h81FrJnk6F
	GymuEg4AxkYVLj6qdH/pGuFU66kw3Vsa6hGwjJGNqD9nF95td6usOon72ktUsJeQUavl7wI4Jm+
	8MGpRL26FRO00uUTUFavbKA4RwuIyY+3mQF4x8YtV67uVnn8xXlZNK2uNvNa5r93Qi+HJcoJST/
	+pu8n03xhn6QlkQeX7e/XAC2fY1lnN3OIX4VdwPA6xnRP3dMtd4pmqEGlV99OuoZ
X-Received: by 2002:a05:6214:1c49:b0:6e8:fef8:8b06 with SMTP id 6a1803df08f44-6f4cb9a3465mr12149126d6.2.1745573747747;
        Fri, 25 Apr 2025 02:35:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoiv4MlBzWT6NZGwE45WPs9WN6M0wjAeYYYXs2TXJ84tsBTXEo8eVE4CzqSua4OQ5eBomYJA==
X-Received: by 2002:a05:6214:1c49:b0:6e8:fef8:8b06 with SMTP id 6a1803df08f44-6f4cb9a3465mr12148856d6.2.1745573747358;
        Fri, 25 Apr 2025 02:35:47 -0700 (PDT)
Received: from [192.168.65.5] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7038340b7sm982484a12.79.2025.04.25.02.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 02:35:46 -0700 (PDT)
Message-ID: <f74d8b50-35a1-4ce8-bfdd-4c90782b8db5@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 11:35:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add Qualcomm SC8180X Camera clock
 controller
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250422-sc8180x-camcc-support-v1-0-691614d13f06@quicinc.com>
 <H56Iba_grof22uzTtGCI-APhiDAGSejNod6jsSVIykm9ijaaj7PWqyszShCEGjIpM2wCLOn4a3Vfb8Hjziqklg==@protonmail.internalid>
 <20250422-sc8180x-camcc-support-v1-1-691614d13f06@quicinc.com>
 <621d8556-f95b-4cbe-809b-864417f0d48a@linaro.org>
 <b96f8432-132b-4c16-951e-718e91ec52a5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b96f8432-132b-4c16-951e-718e91ec52a5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9m8STDuANVtbL5B5CBasDa_v_hhh8zAv
X-Proofpoint-GUID: 9m8STDuANVtbL5B5CBasDa_v_hhh8zAv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2OSBTYWx0ZWRfXzPwdtmDjEW0G Vw9SZWd6cWcifncrNWvyPzP5thDYLXht+/9piMJajvJXuJVDv58SKVxreQwWxQDEVlanQNkQ906 8qwxY9t9F7ri/8BOGiZunD4BgOSzqBPyO9HuLgWrsIa2lRdcbZwNksZ25CWqYUSlXdLdKxJLboE
 CNx1FcLZ2gW/EyU3cWHSf4DlHLpjoHF2AqtXQ2ilc8G4Gx1JMA5P0a4HUmrUAw4Jp59W00a21XR ykQFJzunDQtcHjR5G8oQnoS2vJgZ613eigWYXO2GWUA+mK+mF+4HtuUDeNcv1sLEDb8U5bgL/tQ TOgKXo3FEeI2NpVJ5p6Wt9t637A7c+UnTLvaGHkRA2qR6Q0HZ1Yfc4EVumragc3VbYcZ/gtid/q
 4LnbKnOaHMieWHEgMlinurtCCombZfWmY+PX698VHr0fLwMDtZ8NLL18njf2jaKHtO2bOWHe
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680b5775 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=4NoTk0SwpzZkwhluMIYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250069

On 4/24/25 12:38 PM, Satya Priya Kakitapalli wrote:
> 
> On 4/22/2025 5:11 PM, Bryan O'Donoghue wrote:
>> On 22/04/2025 06:42, Satya Priya Kakitapalli wrote:
>>> Add device tree bindings for the camera clock controller on
>>> Qualcomm SC8180X platform.
>>>
>>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>> ---

[...]

>>> +  required-opps:
>>> +    maxItems: 1
>>> +    description:
>>> +      A phandle to an OPP node describing required MMCX performance point.
>>> +
>>> +allOf:
>>> +  - $ref: qcom,gcc.yaml#
>>
>> A suspicious lack of clock depends here. No AHB clock ? No dependency on gcc ?
>>
>> You call out the gcc above.
>>
>> Could you please recheck your list of clock dependencies.
> 
> The dependent GCC clocks are marked always on from gcc probe, hence did not mention the dependency here.

Let's do what was done on x1e80100 - describe the AHB clock in CAMCC
bindings regardless of how we handle it.

This way the DT represents the real hw dependency, but the OS takes steps
to get them out of the way (and then ignores the GCC_CAMERA_AHB_CLK entry
because the clock is never registered with GCC)

Konrad
