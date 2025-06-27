Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A272E9740
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751037165; cv=none; b=q81I6YS0wTKsMp3FluzlrWho8C4wbIYV1asdjx2+G6nZnynwYUttjewnE8TgcJb5zwgKGHrKVCLNJ5lndB2jTt5LHwRTU1GIRGtSDXFLRxrQ9BsZMx3OUWacUR9rUf5UeK+/1UMpZfZKfckXreFvwU5HO2WhdqA0s+9aJWVBevs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751037165; c=relaxed/simple;
	bh=ZvUhDINxNAiascznXAJsY4SnRs0y1OpkC51/1Pwt7EQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YQpZYRysj4/d6EPkE7sI36lYnzHzQalmsSN+buJcCI1qdA37fUpkUo59a1ead5zK84AA6pPHrDcwiQV+KyE2Xlc1GAnsb8fV85UvpAw+pDM2CkZ1QKdBuucnzfAkdTijWPhDHufcIbj1uN0Jzc4iAKe9v5C2jsZCkRH6clSb64Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GkKRSkss; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GkKRSkss"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCGOfg015139
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RIoYRSmaGzXOqnEzOL/B5Q1z9cDXwbAoMqevw2KwgyM=; b=GkKRSkssG0OmDcFW
	UoG0lMW07UrdPewDYEm8L3LUdaxPaICQHfNngqRb9NLsgqF8hdwtCYcFTe74qeTh
	fplDV0U0dV4uCLPzaSc5Nw02PGdJ0ZLeB913+1Oj/Tdo2XFieMjd38EoIkMzA9Vu
	sWYz3p6iERBLS/RvDd3Wz0L737kFD0Yxw8swNe8u7LYsquF9NDF0ZWoPVjAWzjc2
	QuElmeBFSd6mKkhzkRw376AVnCDdcNKVbrw8rVf5TpsWlEiwDlymPyGIuwNEtto5
	sevVeIIf+bCwSTcKsR0Ehv6ooSsUCC0gNN1thp35sKCpWQSct0aXoEjGJEQHF34i
	glhKPg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm25ugm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:12:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d097083cc3so48409585a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751037162; x=1751641962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RIoYRSmaGzXOqnEzOL/B5Q1z9cDXwbAoMqevw2KwgyM=;
        b=a8Bu2vpuq56pfQYkFm99XN6fZHcUz3MqDIRd/I6x9x694qZ2uuxq7wVIaoDOEXUZFn
         Jkz+15hdsQ62d+PScYrXIjPsMl5ab8Py9Orbe3iyskr7G0C8ELBDkyIuGB3RcYGxjjVn
         JHfOh0tpnepQiFyp+np7lAof/+SFrQFavOIi4EaaoBA/2RuxXeBSNbOwxrB+YjDaAW7/
         X0kVK0jgEF/14loOJM566RlaqBQ2S098VJLEt4dJrzwS3EjSA2toNrPA1yYEDVGsmiJK
         VOH78Xh8UAmwTnK2Fqt3ZjlbmrVnJx8hzGa+F4eq4WnjUcz6FEQdcjwsipz9bb0DEuXx
         Oi+A==
X-Forwarded-Encrypted: i=1; AJvYcCUrcEfDzK6HBQKAqss0VvCSY9SR0Lztu/NrDqk3e7B6TRq4w6bvg5Q5fgit4v0C/BJrX7Y13p9I/Trd57g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7/zCwoLeMR0vCr22grS76GmXTkKVaUMl4iPmu4RUhai7zeELm
	AnyM8HJDaLQuIxVsAop8qsVjOR2mYFWW2V1W5KrkE/qX2uGq94ZUdtvXpHEYZkO+YcYPqsZtS+c
	ZQlz39qJvB2Q8sS1GoQoMQBg2Hi9bC1QXmnXbXbe0VstZR347gST6lvRuQM4dkHBlY54=
X-Gm-Gg: ASbGncs0iZkHQcw7mTeWmr6AGJOTRTJ7WRls5lyvtoxpwpZslHU2yOPwxybOyYDTdck
	qup5yafFd4u/A3aWIFHDtmJvZdiZaJRuFwJ6Ddzf3XMMbezgecgcc16TX+uUS6LVStWIah/wHmb
	dMHnZ1LKVKjWFY0w0BIwkx4uhzsDwWLOgZ8yMwo31NBN4xDwzaIEusxvjBrBuKlGdw73Bc3Hsl9
	wcYpxnscAVQsQ/4af5zYtnCDPFD8+lglSuciOA1Goqp2CzCqRmoCx8hT2D3M7Sd+pGlBHOWAcCv
	6vnKzQ8FTS11ONBWF1DC8RUYE0WJraPha76bVhoRSv/Lhe9FRcFjbdSEPafIvJGfC4Ov98nJm6D
	MgKU=
X-Received: by 2002:a05:620a:c4a:b0:7d4:1ecb:dc36 with SMTP id af79cd13be357-7d4439349c5mr194102285a.3.1751037162257;
        Fri, 27 Jun 2025 08:12:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAa6Nt6lvKcUWICIuULsHahpspj6k3wDamoAEPH0/kd+3Bw6XkFerAIUGmzFJfDxdsVjE5YA==
X-Received: by 2002:a05:620a:c4a:b0:7d4:1ecb:dc36 with SMTP id af79cd13be357-7d4439349c5mr194100185a.3.1751037161591;
        Fri, 27 Jun 2025 08:12:41 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353659e06sm136750066b.44.2025.06.27.08.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:12:41 -0700 (PDT)
Message-ID: <b487b8f1-906b-401d-ae6b-fe8707b7a063@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 17:12:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: qcs615: Enable TSENS support for
 QCS615 SoC
To: Gaurav Kohli <quic_gkohli@quicinc.com>, amitk@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com
References: <20250625043626.2743155-1-quic_gkohli@quicinc.com>
 <20250625043626.2743155-3-quic_gkohli@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625043626.2743155-3-quic_gkohli@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685eb4eb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=VuxlMRAdqVenG9OKrt8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: bqBsElhPkK4ZuykI4IqygQIXuGhaxhpu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyNCBTYWx0ZWRfX+8agZPCVxSga
 kiMqCCrKKrt9YrnD3UJUJj+TG/oCI/8xWYP3xLTYELYjXJ1pX6b9WKQH225crXu9Re2aanzhueO
 vG2wZ6cvNJyTBl52uoswrTscKDWzkEBZEdjmaIYia+MT/j3R3vgzimJR2aV7H9rTE4Q/aCBRJLc
 8R5Mq3abS+3lfgg7Aysjw/goTuKPP8ktP+J+QzUpIEWVGdc4TdwbqN3E0w3SmsSn9neI+6LVSt9
 cuGcfyOMaP3UQAWTPp7Nz/V9Eq+/QqK4p65L9KkGDo3JDSGGA0dh7pK3+J6UW9TepB2JR+mtLva
 YclvSU9pErSHtGDO3ya7tfiYD/gR2HZUGJGA8YSeTTmUDq+I/qm5iDH4I0XNWwUI9t8kMSrxi5Y
 x3qana8pfW1Nld02mB8RkyGAgHtZAyZrR58EpSW3yY9CCYyZh9QXDY7Tsd+dmOUcp5OIiXr/
X-Proofpoint-ORIG-GUID: bqBsElhPkK4ZuykI4IqygQIXuGhaxhpu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=833
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270124

On 6/25/25 6:36 AM, Gaurav Kohli wrote:
> Add TSENS and thermal devicetree node for QCS615 SoC.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 205 +++++++++++++++++++++++++++
>  1 file changed, 205 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index bb8b6c3ebd03..c20e98f8399f 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -3692,6 +3692,17 @@ usb_2_dwc3: usb@a800000 {
>  				maximum-speed = "high-speed";
>  			};
>  		};
> +
> +		tsens0: thermal-sensor@c222000 {
> +			compatible = "qcom,qcs615-tsens", "qcom,tsens-v2";
> +			reg = <0x0 0x0c263000 0x0 0x1ff>,
> +				<0x0 0x0c222000 0x0 0x8>;

These '<'s are unaligned, please make sure your editor's tab width
is set to 8, do the maximum amount of tabs before it goes overboard
and fill the rest with spaces

With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
