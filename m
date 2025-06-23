Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7074D1C8FB5
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750678627; cv=none; b=Ac3vT+hlM7Nc8PM+597Saeta5mw1phGwn212okSh1XqFqsswz5wQE0MnLq5nLeA0r81rEuCEWvNZcjR+EnfhB1V3XQ7BqsN9HXPYGJ1O+5NJA2rYKFlWh8Dvx7d1PZkxnXNEdeQdUEwmHXGUJIbbkA7q74IEe3kV/zDxuTzjQYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750678627; c=relaxed/simple;
	bh=YQEAJCLfezUIG7yoU9HGhernWupP/zjzQJHrHDVuTeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g1iFos/4JIhvMJ7VZvdoi3yscRsHOVEcsoB/uMQjObPhJ5RFxrVcdm4dLWOc3q0DOYD0YDj9g5HAOyytkR+EjP8jJYXN8wNE4xkq6V3zlQuw+fvHKTcGhbzz390iJbwNifBi17RL0+0jlANuxaEOrorZ+lob03nzwng8TbrNiCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1ZvPhgN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1ZvPhgN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N8aqf2011465
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RNES+f92fEjKmzMHA6ySrLrXjwkhHw9zw3WBGAogWQw=; b=d1ZvPhgNu3dU0tyQ
	5Nuzi3JZq8xpQ/7A4oQlAlLJ863p236YYgL99jmePBSYXbOu4Oz2wMF7Nrkc8mnV
	aCDRhOv8ijx4MLtN5QH3li9A1pLQ5Bpr8KxexLTDJPTGa+Rsym7dy9+RwkJUNVYS
	iwy5VBXfKp972WjmMfR80Y+4+KROnoswfg/W3rCsjm/m11iLnpFR2wwHnUuzznQF
	SSWctwpDAYdPG52WH6pKo6D/lJa8tCAdbTg4EmM5iMW0VRKngTk9bFRdk1Ss6irP
	jkw/klJ6uFrA/81EPGidLM58u/jvcCA6W/300gfwRO5mjVVzJBERkaw9DgDiIdtP
	aVJFAQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmj3cy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:37:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d21080c26fso108077985a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 04:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750678624; x=1751283424;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNES+f92fEjKmzMHA6ySrLrXjwkhHw9zw3WBGAogWQw=;
        b=U/jo5hbXyvo7wMo318g6m1F8HSyBrCmUcgYGYlRMTCPjYCLB7V+cWiiyRubEMFNYnt
         C6w0R3o5WpblqVVxWq/FW/q5EAZiVT+rxYWiAGlR9UirNUtaMwlxXgC+sYzte7QLkbFL
         Ka96VFQW6lV00mLA/b9N1En/V/0bPy/zKxEvLV1nUxnX+sZU9GKn+4UW2M0ZIBl0iEQj
         /UvlcZckTX4COG3FdAgg99uiDPGDG1LzOltUMNlUhbvre0OWxUcJr9fnalPM/8Chk9rJ
         TVLgmqVtu6018TlKk1QfchvFG0xt0yUS7tC0pN0QeL9hQS4Yl31zz1P4KSc1V8aArMxP
         KF9A==
X-Forwarded-Encrypted: i=1; AJvYcCXjKRvH0r7gC0/jAiUlE0SyajOc3OXNXNf1MVvtZu0pVezBZalfRVAyQp5bAHvidaKqX2B5Xh1xX0Glq7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ7By6fuei0soG+pjA99KGb5ksIE0KKISi1i9fDV01Uj/ObIcC
	tCJdMXgFo2RUjSWSLzqpc0O4Z6lbGdCPTuyssyCyRc7sGdezWwJwOxBvTE94q+idn5y64V/cF8D
	smHYE+G9ALLg3c0PATYcR13HJTWUOGDrTgxAAGIoNruUd4nCtWkq7cxSDMb/H3zaMB1M=
X-Gm-Gg: ASbGncvFhj3Rl3p7ZTcSL5UZnGbibhfJjBg4dTY4h8sbFEOGh9AH9JOEdC8OW2LeoVi
	nmXAyYkemZ4U+GAaMnsm0SyCRZ2dnowE8ZkIEM4uML+yY1rtSxyVPJSf6C3YO8WtlzxyIctxowA
	JyFrgOXglcLNqX8Hp/JbN/HMFbf7rbsmgMEfOa8b3DwdpcG0yfgxNOrqAE24/t9S/Yv9ZmMDr5b
	zWvn4//lAoPNHc30jPCSSehmpYiBC1hhOvoTqh1n27W4iNetrIPqfSWd/2z8VlvspAIFZf/SUvV
	ByLhtrI9WAU6TuOkBXzI871oUj/zuw0KD1S/UiJCvWwkeNi+Vop+SbllJ4/kwOqtP2V323XReNk
	1z4M=
X-Received: by 2002:a05:620a:46a9:b0:7c3:cccc:8790 with SMTP id af79cd13be357-7d3f98dc881mr756578385a.5.1750678624270;
        Mon, 23 Jun 2025 04:37:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE64KulbHhXpkGuf8qB1USD8QxfJD2kcnD0exRsp233FiT2+hiKockefxscwnsSJEqw7UcENQ==
X-Received: by 2002:a05:620a:46a9:b0:7c3:cccc:8790 with SMTP id af79cd13be357-7d3f98dc881mr756575885a.5.1750678623807;
        Mon, 23 Jun 2025 04:37:03 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541bc9absm700991766b.145.2025.06.23.04.37.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 04:37:03 -0700 (PDT)
Message-ID: <519f9e21-466f-4e8b-9bd0-dfe0448920bb@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 13:37:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: Disable
 PM8010
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: bjorn.andersson@oss.qualcomm.com, Konrad Dybcio <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        laurentiu.tudor1@dell.com
References: <20250318-xps13-no-pm8010-v1-1-c46236d96428@oss.qualcomm.com>
 <Z9qXFLmnae86_GT9@linaro.org>
 <a7zyhmv5lqxl2l5rdg2x5g55wokm6ztwvzwrfkyeignwdromjr@afpe7zwsmkt2>
 <d2eabc30-f1d2-47d8-82f9-86f6f7a705bb@gmail.com>
 <7c850205-0c42-4e6d-bf5f-f1255367d53a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7c850205-0c42-4e6d-bf5f-f1255367d53a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Yzt2xZFnmvzyADcn4zNggoyDaAG5Gt5w
X-Proofpoint-ORIG-GUID: Yzt2xZFnmvzyADcn4zNggoyDaAG5Gt5w
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=68593c61 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=FUMimz6QtM2Ddm9xIjYA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2OSBTYWx0ZWRfXyK6q5NQJHLDy
 tbmE600AmYCpbAFyfjpS0Y0UoR4O544kbmgvM3vhowRospl4YBH+47sKgjiB0ZvXJRzftxeSVvy
 rWhU/O4jZI/TAawj58/d8cTrSw2dmFLbTRdrh3Q5wASeEUMBh1dOtJ8eu+LIDHcEAT+MSNVNUFr
 Arm1yMNIuLZak5oXx5XP/fq6Sr8sNT8SRPNyt8CqrIk8FnD1+gUA6aCokzMkRtGiBw+30V41ZAj
 jcXJ9pRBWOKPG8C8viZFlr4XaU/JGogIJrgFtvyke6GLNl8beq3sZ+w5FbIOQsL/Cnj5UzYf7Bt
 mYK2MiOruzBjs4yD2jAZkj0GlBLoAcEMtR7sQBIZGIvV5ovbGYvWY1rrTlherMtRdwdj8R843AJ
 A0g676fx+soQC5z134n2h1JmdRZV+XCcN/rEKpzqfyqu2pQcf3Z9YvxUEZwFEnrhNOBMmiS9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=878 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230069

On 6/16/25 10:09 AM, Bryan O'Donoghue wrote:
> On 15/06/2025 19:29, Aleksandrs Vinarskis wrote:
>> Hi all,
>>
>>
>> Revisiting this change in context of Dell XPS 9345 and now Lenovo ThinkBook 16 [1] (and upcoming Lenovo Ideapad 5) as these do not have pm8010.
>>
>>
>> Perhaps safest and easiest is to simply disable pm8010 in `x1e80100- pmics.dtsi` as proposed and _not_ enable it on any devices, since its known to not be used anywhere _yet_? As its a camera PMIC, the only submitted upstream (did not land yet) change that utilizes pm8010 on X1/ X1E is Bryan's CAMSS series that enables camera on CRD [2]. There are a few other laptops that have patches to enable the camera (my Zenbook, Bryan's branch on Gitlab for few more laptops) but those were not submitted yet, so can be easily changed to explicitly enable pm8010 before submission. This way we could simplify this change and not have to figure out which of the upstream devices do in fact have pm8010 onboard.
> 
> As a general principle, unless its used it should be disabled.
> 
> pm8010 is a camera specific PMIC and Dell has its own way of powering the camera sensors on XPS, Inspiron and I'd guess other models too, presumably as a result of reusing the x86 design with Qcom with minimal changes.
> 
> Disable by default. +1

Sure, we can do that

Konrad
