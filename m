Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58621CBA18
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 20:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744662066; cv=none; b=cF4qT8Hs2obBh6TlPBIYP7MBJfhiT1qiAmlxhSC2PY5TM0OsHkzTWjIeFqRLqf0fAcUqBFYirDWakkWiAJo+CQA/wdYwchJyznZHvE70PsT3ygGX+nC4/i79eT+JmAZyJvsQDiijruSKV29Qwa7UqQ90EWLG7LjmB5w7Mc81fJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744662066; c=relaxed/simple;
	bh=IHxH+ITR2MyYN82fNQQ7nDWZbhuT/sr8/lromKSu78I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CUOo0hRO+00EE91WTR4Z1mP9bymhgIIznRReN+OnmyaFIbbeG5NA6+gfZ8JryVJCRE1Iu1gsOtRLXORvYmXziWo0iITybLYAtU6AAcUtyeQvJyIKbGt91pAAjTZc1F48FM/XOjUlJIt/cQGfYtNt0VZ++kGG8OV/tHYjHnRpx4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GUICQXqr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GUICQXqr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EJUApW016563
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 20:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fD1kH8AdGKUlHf5k0cz3xyJc207+khrE5Z3bUIWX2lg=; b=GUICQXqrHwzWYDGE
	LG4fKOHNFG/fnfMiWd5+iuToFru32S9mKs4jiBGSPtSDeTNh1u4aMYhtM1HksmeA
	2O9E9UZXe6b6WWr68IlTYRNacZa8FuUBH0RXlYse+2xa5vZk85ctVjNyXJXpwZfW
	n4V9p429FBXZTo9EDXcx36OLx7xwfDNi+UREU9PLcJzjKRChJ/eksICDBqgfq73J
	899eoefJe6aL5DSZBqOvbsrTj+uQQhe7QsCFCgwvnGhk4ZfBiX4HdlPjpCjTft7s
	oKZyvWZNqb+2Iry2P4Fc04Kxqx0PhMtzUcHJl/lOChXLNrIdJ3YBEmJrMvRhNC8R
	gm4MKA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69nsf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 20:21:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476786e50d9so10227391cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744662063; x=1745266863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fD1kH8AdGKUlHf5k0cz3xyJc207+khrE5Z3bUIWX2lg=;
        b=CeLXGNrhuPU2vOR+XR3x4rgCM1vC2VdOe+L+xtfGzNTKJ5WD/L46QslqQwLLq0dmfy
         5tPu/W15V9++TDkg9Er770XDMnmj4nyrNZX/AZhqaJhtgB8z6ZmoZT77feaiJhtvSxP5
         A4kaka4yXL2jSEtEcYouIYI+ml4E1oo8VYgvMYbYNmwwECCoQPCFbvcyoOx0S1EtEeI6
         2u5Mglm+6/RnKgfS3VE6jZmhoULZUY94rgG7hWsEhgf+5X5mUP5O3u799EZvLBCWZFkI
         md+VjWTbKeJwHKhripS0FK2wV1I6PC0Zco3GBGJNhfBz1jNvNY16MpdVJ3co/nwqhW9o
         L45A==
X-Forwarded-Encrypted: i=1; AJvYcCXmzHunvm9TgJNIJwJw9OhE0lcPY/HZ8AqYidgPS4LutbOz1H7LEcz4qJIfliZwr09bFO1Q6GvB6TTZp/A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+yK8RiVDp2BZqLQCezDCym90d2VN1BihD7iAt682PSxImg32v
	mCof+G6jkqHXHOZ/WaE9DYKDfiiPykrHLnP6ZoId/htRv5Uyg7nu5m4FmmzRbQEVxygwckiqTJs
	O1pk6FaUbR1qXhNVnAdGxDjKyqLeqeZ0gEIZpt6s1Y9MQNml8ywo91q1JnYKpbIo=
X-Gm-Gg: ASbGncu1G5BEfdZcIupr0fqt2koPRW1PXG4KVUPJ22ER+ZeUcbFReDKbg87ze32oLvN
	PQuuGzVKNBv+MPonhFZcgPLphlQsZbnmaMwy0C0k4Rm0kfE9BJNlkF3lFaX6Ay9hmXx1mH/XTtz
	hyQKi8z6ahkYGBw61zlHddN0toqNzD+EQ6cx8ioIQt7CGAf8w83ry1orWJde441RolUF/tqKx85
	ZdcnwHqZ0wV1Pv2u0abJPkSO5jFRViMYpISEHoRqDo67IcueS33nRNxJtFbYE4ujwdyuMJjIu3u
	rcvyqLkVmJxuaWhJzcAcP7OZ1d8PL8SMDNvlzSae9a7tiSPEMUZELuD34gTrAlQbCw==
X-Received: by 2002:ac8:7d4d:0:b0:471:ea1a:d9e with SMTP id d75a77b69052e-479775c6474mr73469511cf.12.1744662062723;
        Mon, 14 Apr 2025 13:21:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQmk8erDwTZPoMnwnKO/lkX8ikdJXyaa7kJzITObjAr+gigb+AnzYJwbVS5NUMmzICm5veAw==
X-Received: by 2002:ac8:7d4d:0:b0:471:ea1a:d9e with SMTP id d75a77b69052e-479775c6474mr73469311cf.12.1744662062133;
        Mon, 14 Apr 2025 13:21:02 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ee551besm5410518a12.6.2025.04.14.13.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 13:21:01 -0700 (PDT)
Message-ID: <c36c32a9-3d07-4406-a3f3-9e2d345682ff@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 22:20:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 enable MICs LDO
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20250412124956.20562-1-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250412124956.20562-1-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Eoz6DlhRRNE7mL1XchuCwu_5kOktzMEg
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=67fd6e2f cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1SN7V59r7WJZvlfn_q4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Eoz6DlhRRNE7mL1XchuCwu_5kOktzMEg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140148

On 4/12/25 2:49 PM, Aleksandrs Vinarskis wrote:
> Particular device comes without headset combo jack, hence does not
> feature wcd codec IC. In such cases, DMICs are powered from vreg_l1b.
> Describe all 4 microphones in the audio routing. vdd-micb is defined
> for lpass-macro already.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---

Looks good, thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
