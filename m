Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624D19461
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743525449; cv=none; b=pdzJftwfgcLnWwwMc5rr6C1QN1wiLisbcmUKERWyWAWO87T6hr4U7Rn867PgsXLlNyJ++Izlts6kDfZNYvr2DAPzzSvTh7/6UErmmeBdGHpU3QJtTp8+zcBh2bUWVlughJzNyIRxPnozl5oWSWE97XYnyV442jFwKAekgQeDaSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743525449; c=relaxed/simple;
	bh=xso3yVMv1IMS4sKIOz4iJ1XJ+y9QD15Nm6ONJyFulUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z37fy8Gp5IBBZRtkavxVBtufp4t6o4m4zM1tD3Qw7lwoQ6MZOL33jw7o9OO/hoUHq56X8SITJYdXukgG28vc1H1woK9kOpmeFl215TIkKxpJR03IpTyjjylptE8iKAIJtPH9bKGF83Z/ABjfAidFW/QJzrewwxnpsPyhcgzepk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mHWcTYla; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mHWcTYla"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531C4Tfl024680
	for <linux-kernel@vger.kernel.org>; Tue, 1 Apr 2025 16:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hKbhPlTz0jVjC2n4EBy1zzs4F3CjcmytkwZ1FbdlItY=; b=mHWcTYlaFdmTeZlK
	ql96SP8BJesuYNcqU5Ok4PBJ81iFViUKlCi4oW57Z9ZvRxdnKOZMcerfWCkSEqIA
	aVvcD+RnkfgpSOACL+OneHMz30KafrbMjvLa65EI4J6XQWI9lU95UOeWnqnIOFdA
	XDH5sEbKe7datLiyIxnvWI41o8oAHDOX5tfLpq5GJTrMbessZmkZcknp0dUqzr/b
	8OxeVWicJPdPqGZGnfCMeFK4OlmxjgbbdRLasinPN3CdAg8DoYKbkwmWw3AEcMei
	Fzpk2kbzNpGaKc/5o6alrvLj9ihsbWJ96NBOZJwsqVt9OziU+fhaWd4AdK5p77hy
	b0AGcw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p86krrba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 16:37:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5530c2e01so23317785a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743525444; x=1744130244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hKbhPlTz0jVjC2n4EBy1zzs4F3CjcmytkwZ1FbdlItY=;
        b=caVtUVi43Iy5r5j6cUlBx3AqtJpaquomVm7YhfITlNYBToRSfHV8v8CJzBrfAGTKLO
         T9o/cXOgEVN4xDx8BNrjkEWZJbLNnW1dZLANpac8bOXdbhonplmODYNzROcgA49trqRs
         Ievicda4iWQLT2vQVYy4j2GZ4B7rDO774VZ2WiV83fM9S8fRG4qHhgq7kaERgMtCcAi8
         2Ttu/U6Vl4rrMayuHhUcnjApAYPn4FIstiKOxW/em9QnXfFiEhTLBIDRTMoYl+jod2Ws
         thv8RWRt0P+D4IBCznrA4sL2TLxzxIHJqSN0Z2KMeZ1p0sxoS7jD7MEjSz083Q/94VkB
         +SLw==
X-Forwarded-Encrypted: i=1; AJvYcCWqi89ciS5uMJ97MwdhFpINxJCsl6rG5I+KWFL1LvlRMjlqhpw4j5TZNB0Uck3GYhAtjaXjnzCIsV9rgRw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yywq46pUBqVp7m4JKAjvPFL0g3DTOhpvsInfMrGzyLQj1wHZCx4
	vBu6XypiHduWO3HXmhuyXOdnK8zYgIRPPW67uQ08HqSqgquA0IahtltSiEuCGn/3MI9hju7Nffs
	rKjIf8Q65QsljZDYPJ0GUbynrFkJ7r7ItR1G83bxbY6qtTaKVmLoTJq6+BMsC3ec=
X-Gm-Gg: ASbGncum9PKQlQ86AkwZjruFVCIOknCJOskERra16NFW11wcHyQB6BipbHIZ2aiPMQa
	TyxAuB1MScnP/jcXJfD6prq00cVn5ZAJRrYDz6PPIQVKaPXZniZrqlMuX3f7P/Y4Tj/TKiLZEzv
	un+stcRyZOwO6c2vpnprnJ05UpinS3+E2C74LddHfdZSxYKkoiFkVnLsOQ+ICKjNx7EoQ6WKRnh
	xgk7pxpyhyhDveEreAHMBWt+c7e+prKQgBn7Gq7vwDlte2LqWoZTiW73VacIqkUe32A6s3fIo7n
	Zspm6NHJtCOq43thY6NpUYr1xk3qOT3szJriWoSoQbdcKNeBis3nmVORzeVpHZjyHfEUPQ==
X-Received: by 2002:a05:620a:4491:b0:7c0:c2ec:e560 with SMTP id af79cd13be357-7c75cbf574cmr166615785a.15.1743525444335;
        Tue, 01 Apr 2025 09:37:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY9F3T3aVlxlnrRQFttmbYcyMce6WTdjZjN6/Nqe8LfX/zNfyXhMverLlyrcOeYnZdRL0LaQ==
X-Received: by 2002:a05:620a:4491:b0:7c0:c2ec:e560 with SMTP id af79cd13be357-7c75cbf574cmr166614785a.15.1743525443965;
        Tue, 01 Apr 2025 09:37:23 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71927b027sm777628666b.47.2025.04.01.09.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 09:37:23 -0700 (PDT)
Message-ID: <f105d601-89c3-41b7-8893-f84965a7565f@oss.qualcomm.com>
Date: Tue, 1 Apr 2025 18:37:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250327024943.3502313-1-jie.gan@oss.qualcomm.com>
 <20250327024943.3502313-3-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250327024943.3502313-3-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W8g4VQWk c=1 sm=1 tr=0 ts=67ec1645 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=NSQ7DHjqZRjaoW-GLy4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: uah2qE0keKTqUU5vlWCAwN3ncSC0M4wq
X-Proofpoint-ORIG-GUID: uah2qE0keKTqUU5vlWCAwN3ncSC0M4wq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_06,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=663 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010102

On 3/27/25 3:49 AM, Jie Gan wrote:
> Add CTCU and ETR nodes in DT to enable expected functionalities.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
