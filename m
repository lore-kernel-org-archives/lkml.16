Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4CA19992C
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 20:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738959840; cv=none; b=dGL5zEGGLmBVGICDkm57DAs5JDXfPX/07bHUNuWRyJeuxPXli7zKr6nbThsVEHFNiAYX9da/fRvB+wlm9mviqAsQ7ifh/CJoE7YREJC7oj5eeb3hM7LLlGZarndtIuWZMZJohv9xybF8an4P/6Q2iL2jZaxkE+9SofgXDovO7Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738959840; c=relaxed/simple;
	bh=egjQMllB3+k3lOaECmT4kWE4WQJMawVgWsZwDrLBuOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W+X6Geju4FSd/7zrbfCicuzwiy9SMbYpIxHbOce6w++QnPVasehwYFhONEt1Epp8BPqbxAKq6wk6W87qd8q3/X3+ZCZptAbFox8WOj+jfhlqOkGo05fVpJBDRQ2L+Cr9BOxeNTWog/ED81TU8aMe0Yv/iHoSU3bYUrpwgFOoz64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mh1ZZVQp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mh1ZZVQp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517CYmGh007704
	for <linux-kernel@vger.kernel.org>; Fri, 7 Feb 2025 20:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lFMK36cFjt7AxMSjvYc/ux9LOfI5AxxB9bO9exg5uBU=; b=mh1ZZVQpfLQawCWo
	0W0/kSZLgXyZXhWCjofe6iQRdZxiC3wMigL8rI7qWgvwkXXUKHq6qxkZR6lr/x0h
	yKKZdLzLdU/TakklVjQEZXIW0fvdrQyOHfBRz1ZBv9psxDQVP7xmsniKxpbA2dxX
	eAlkuL3qbcKuMvbHy/fqapaJVSnIwc1Yr+NyKlkRPFoaPRLO7yaYMNvOocbF/OAS
	wnJWYUsI3EBXJO+9BijhbiOcwWhDH7d0yqrQ3SYyTbwDVJLFLPwe2NBOTMPIJ+Hf
	gDX+WwNE+GJQPzvoTFzBtVeYNkjZMjSGO32F5Ai0M7WBvujTjGxRXXWAll4nZtZw
	DpNW7w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nja3s3pr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 20:23:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e42556eab0so5208936d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 12:23:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738959837; x=1739564637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lFMK36cFjt7AxMSjvYc/ux9LOfI5AxxB9bO9exg5uBU=;
        b=MUqupGce4VCfuKWhyaBqUX8sze3tJWakXFIdtFSuvhJNgQYODPjy/SR/672d8KiDCj
         FydDOyH4ORIEicEyr8/T6ai+e8ia4dN7ewOPF7wheUBhZA/dMhKd8QXvnRkcg9e3d06p
         qNWo7pdv35CAlagz342Y2Svc0tR9HxMotixLw96f77ym2TtzvFPEZq/mL8f+3MC8bBsJ
         nVAhrbHdktwzVoKw4G65x9jZ4N1fa3qxBzmncvWgfbJUPQPFnFyKlz69ZDc1BWzJRAk8
         yiw9WCFckrKavEu2ravSHGgWwQ4n9pDb0WY1W8xkGEmNftbapekGwIPOELBN7+jju28F
         xUSw==
X-Forwarded-Encrypted: i=1; AJvYcCXJCeYvZhDjCEsjeCTOhS8VBhEzUXPnzrC/nbQzoyF/ZK20V0Nu/oaINKahIGq76Zj53IWlnz/7tfttiMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKpxxMxeX1vMOzXPn/UrG1NlF2JMs1jBDmUAc94+UevyUyGLeE
	RDWXQc5ofbO0f8xI+rrNXbz3kE/liGthc3V3Lqzyfmz9BgTJ/+TCvyGh8egyczSK4leZFWIRT3L
	r1hJ3HhEFOzUtVArPQgE2zGY6IfOn5IfGaXAN3SLzu2oN7p620GXSN7evkP+V0Qs=
X-Gm-Gg: ASbGncuYGB8aQs2d0QUpy5jjKWGzy0vGNqq3MoGTy19pKuvlZM6mCiqkXlbq9Do5ku1
	UkoiH4BC9UkSvCRmJlf/Bf6CN5bDG1WUq6P1Bo5Kc/s8y6SJdylthSEyqlkN1ZCm0PCx8hMaPmy
	s/2aOm5oPqgIiIxQg9VHdsOcofg7t5+6feuvS0Dm4pDRaXFDzaNAduIGn51MdperecehWN7zsj+
	liYGMhXFHOziS7VSu2t2i6YTlghhKw41tzttx8aIo7z9on81jzcPSXQ0Lh/z4qpaArW/9EHe/OQ
	QvmQ300eG46rtqIUfxIZuVDglsoOFillSzAPPbzRY8LwUqH1oy+MnS5R7T0=
X-Received: by 2002:a05:622a:64c:b0:461:3cd2:390 with SMTP id d75a77b69052e-47167acb69fmr25559741cf.12.1738959837122;
        Fri, 07 Feb 2025 12:23:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfOKXoFApMhJ6QtE2PUWZAh1oiPCmRbIWwSd3IcovCPv/+UAtw2bYxLPW51FpPfoCUUAk0GQ==
X-Received: by 2002:a05:622a:64c:b0:461:3cd2:390 with SMTP id d75a77b69052e-47167acb69fmr25559581cf.12.1738959836679;
        Fri, 07 Feb 2025 12:23:56 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab78b9b09b3sm175323866b.99.2025.02.07.12.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 12:23:56 -0800 (PST)
Message-ID: <efcc2cee-1d8b-45d1-aa9a-4e7afc19d857@oss.qualcomm.com>
Date: Fri, 7 Feb 2025 21:23:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8650: switch to interrupt-cells 4
 to add PPI partitions
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250207-topic-sm8650-pmu-ppi-partition-v1-0-dd3ba17b3eea@linaro.org>
 <20250207-topic-sm8650-pmu-ppi-partition-v1-1-dd3ba17b3eea@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250207-topic-sm8650-pmu-ppi-partition-v1-1-dd3ba17b3eea@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FStkadflSjyQC1GnZrzqeL3Oms-DokEG
X-Proofpoint-ORIG-GUID: FStkadflSjyQC1GnZrzqeL3Oms-DokEG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_09,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=763 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070152

On 7.02.2025 11:31 AM, Neil Armstrong wrote:
> The ARM PMUs shares the same per-cpu (PPI) interrupt, so we need to switch
> to interrupt-cells = <4> in the GIC node to allow adding an interrupt
> partition map phandle as the 4th cell value for GIC_PPI interrupts.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

If I'm reading the core right, we can leave the fourth cell
uninitialized where it makes no sense

Konrad
