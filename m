Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB39F194C9E
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 20:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738960253; cv=none; b=prjQDqp5ihIsHLgtm/OX/n5DTrZjkV3QMpRGPsRpqtnp26D7INUNkw4h7ABmLKXUK4AWMPT6syJA2ynxaUhzoUEX8qEXIw6L8U4dwXH0q4YYgfYvxG5BNawwhdkow/Emtg75N0s4dqfjxb6A9ZFIcf8e9CZ1ptzBbgBZzZoVS6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738960253; c=relaxed/simple;
	bh=IFMgb2Twtp3Ix5oDbd0zFvdGJcCB+Omt610xaW1yL9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ryZaXc/QQ6gLLGqsfLtllTj17KaK17w63BcVI1wskohLnmLg02v9DuxDFd+Dg+cVuGUE7WM2YL+gKJ4wPzROUNPgMPIp4hn5aFvWXpJI7PdG3JoAgf4eSFJLVBHJog4xLNGiLHr9MV+aCRCrZiuQKIgh4tNXUCIsygLcu1fZw2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6tCmssN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6tCmssN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517BOLuM002692
	for <linux-kernel@vger.kernel.org>; Fri, 7 Feb 2025 20:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ExD9ltWz3c2Y3/SMiQ3HiISolJICJWzYaCFE2C2UWQY=; b=N6tCmssNPK/HHC1I
	oQngbaoV5a8YNovFxjEGcGALJQC2eSdLK33Ea8XbnkYK4dajPaLAU4+kXiAQjlr6
	8xDBUZOfH9VX8m2xrguOhRK6B2bYB00s3VvJ5UQz5X55UTQBx/XaB98uPROAdX3Z
	rzPV/CAwnMdh76ony3tm2TMRvHqSDpBhFr4rJrJAXdlJpP7Cs7tVROGFBT3xjJe+
	5tMJ9p8A7Gt388scb6L0vxTdo0fmCNUmQzDMhDGlHFCVpk4N/1S6cK/WBoFl9eLr
	2hwk2YNyRYDv5wtVYhNtO/9n2358Y3/RmPUFJrzIG9CiT1pldtfLJOO9bykTPE/d
	AfQSJg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nh8usa35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 20:30:50 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e18596ce32so4892496d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 12:30:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738960249; x=1739565049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ExD9ltWz3c2Y3/SMiQ3HiISolJICJWzYaCFE2C2UWQY=;
        b=AkRqGAMo+b1XphY4KU5gmuBMLvbz8mHnlDTEMZEwS0ZKDQDJCT2scYvmcBfoAOk24Q
         XW1F6AWVCRx6gaI4To9syIBMEwUa8o6HtTxhwXxtVQtGOE56Xlp2r+AwPvQXTZsTxBnh
         Cv0VK1x7Uca7rOuPQXInZBAt+MUJTb58HXXSLVtvLZPI9Zw4bfxvTj6ufydxDM4WryZc
         wVgEJ00r8TCJOSM7qvki8t5o70pyEjzyOf072luuKS+JS5t3xAExrFQkG5tePKc3o8A9
         XabcuLg/FbBO28O6sW7sg7Vmn34y52pMqcw23gjw/puwwprByUC3xu5QgrQW5iKTCHSY
         sqpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS92chxkVUttYjLX4JWpEksxycL3TOngXlISqObxqep5GoE2CRvPtfsJoh3JfR8yGnLB3rA5EpBaS5VP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPoEnOTNG+XmkDKMXdl4pQLmWsGDluE9mlGQfzrpizk//Z4fc4
	a2HroKxDqrCCVBTmwuxt8JGgmnpmM06dPD9hLpp7H35LmxPCIdW725bVAlL/qQjarSA3/KWjjTb
	T6gEMxGsFwGkrQV5e6WfFU3mqyn8BujmhSpXtuBAIWkFsKEGNtPjzH5fvU9wrKSso1RryM28=
X-Gm-Gg: ASbGnctqQj3aBvKWqz0aRHTPPnx9JIRdZaDn0FCYe80GwuXLa6Xg8vW1usbHSg3oTn+
	Zlb10ivlPMTUqESLE0wUoWbEA0TRmdGxf8uQFIvR1aT9uQfFGO7j0Ehh2lQfRC74WB9xU7o3CRJ
	Dr+C8WkAIy/Fx3O4kFppZBWwHL/J2/2jiL87zrqQBfnHEZkdutd1ZaFztrQs7KlXOyPM5XhIRRs
	tTTBw531w64sf8HKbGLvuCnhoKA7ABx9XTurWtGBmBoHjJ0o4E8g14vY+dl/bAYpudRGYrauwrn
	2jeLEWg2d94Fv8KKReQjyhkWK1zP8b6tvOa3CZPhhWTFwgZsj9H8LaIDvDM=
X-Received: by 2002:a05:622a:1901:b0:46d:e2b9:c4c with SMTP id d75a77b69052e-4716799308emr26709471cf.3.1738960249264;
        Fri, 07 Feb 2025 12:30:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0sznoMW8Gr6aAQcdDwsAOxR9nzSI3Nl0mGCEXlqe4zxuLzaWnRKyZ/iuY+0HhMqgW2aaGfg==
X-Received: by 2002:a05:622a:1901:b0:46d:e2b9:c4c with SMTP id d75a77b69052e-4716799308emr26709231cf.3.1738960248855;
        Fri, 07 Feb 2025 12:30:48 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7832a02fcsm238343166b.94.2025.02.07.12.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 12:30:48 -0800 (PST)
Message-ID: <ba546075-cfc0-4b17-9129-f99054e2e1ae@oss.qualcomm.com>
Date: Fri, 7 Feb 2025 21:30:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8650: add PPI interrupt
 partitions for the ARM PMUs
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250207-topic-sm8650-pmu-ppi-partition-v1-0-dd3ba17b3eea@linaro.org>
 <20250207-topic-sm8650-pmu-ppi-partition-v1-2-dd3ba17b3eea@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250207-topic-sm8650-pmu-ppi-partition-v1-2-dd3ba17b3eea@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nMk9Uc5SvEHWija5kgrQLlTXl1lwheBa
X-Proofpoint-ORIG-GUID: nMk9Uc5SvEHWija5kgrQLlTXl1lwheBa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_09,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=796 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070153

On 7.02.2025 11:31 AM, Neil Armstrong wrote:
> The PMUs shares the same per-cpu (PPI) interrupt, so declare the proper
> interrupt partition maps and use the 4th interrupt cell to pass the
> partition phandle for each ARM PMU node.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

> @@ -5309,6 +5309,20 @@ intc: interrupt-controller@17100000 {
>  			#size-cells = <2>;
>  			ranges;
>  
> +			ppi-partitions {
> +				ppi_cluster0: interrupt-partition-0 {
> +					affinity = <&cpu0 &cpu1>;
> +				};
> +
> +				ppi_cluster1: interrupt-partition-1 {
> +					affinity = <&cpu2 &cpu3 &cpu4 &cpu5 &cpu6>;
> +				};
> +
> +				ppi_cluster2: interrupt-partition-2 {
> +					affinity = <&cpu7>;
> +				};

I'm not sure this is accurate.

I *think* it's cores 0-1 and 2-7, but I can't find a concrete answer

Konrad
