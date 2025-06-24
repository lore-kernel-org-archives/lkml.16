Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C07B28C86C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768231; cv=none; b=Y6Wk6ZhTGQeAZdn38/Z+sJmkBxiKsxInjlNhPchaB9V8yiFR2r4pOqzz18TBIT+9CPq96cNCeulZ0OFZAN6SJdxTKoJf77xSj1kRaiD3la0sVs4bGybmsr/KAHezcOWbn0lpdR3vQig8c4nmkr4Kly7WXcd58yhYqBwiO+Kmhy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768231; c=relaxed/simple;
	bh=p3Vh7ppCkQ3RhWt9SYYMNRFLOMQlUdGhaIX1EKs0T8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WnXVY3HcwGpUxkJvjZX/ZkHEaKrb9KATT2H5GHMRHibvtPyt3FsEafDi5b8Ht5zWRhyJdu8SFd4bCw/Q5+ItaptEJfSZs9TJWH3fKX15YoizNdxQsT2FwcAc+nmaKCUtIOfCb6koEorVd8QWmNYsdepTPHKx6BaOg4zoP6nFDhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pe3zE9vM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pe3zE9vM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OCMhJ0024833
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o36MmkVKK8n8t/NEFQfn2PX3WeZ8yojvxiHzllPypds=; b=Pe3zE9vMJbgJ8yex
	1RR071wmOaPsVPWxsBATSJL46okgYVo1aeK6Jy50gMzwGYejmMqVBK0WsxG6X8c4
	pFPvl2HqH/UEbev8lECbev0J4OEnJf/V2Itq1P53Qwp3WdwoF4OJIO99cljvk89Q
	A//Cbo3GgsURIt8BwK9/6l65C4e7kBetgFnVnAmWtSe8wGLkCW5+hveFcBupQXYh
	ey3dFKUiq+Ami+Yi608HZ8vwFkwcT2uJv/g9LiCVnCLUmaEePMRlQANbVMUbxE0+
	snLIA/SG7CJV8wT48cWPmJtja8TXEwe0os4yKcFLMgHE3laGGvAETSrlb3OFfwds
	u1N1sg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f8ymu3ed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:30:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3ba561898so95419185a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750768228; x=1751373028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o36MmkVKK8n8t/NEFQfn2PX3WeZ8yojvxiHzllPypds=;
        b=L2tVFiJ1Yh6J2LPmABeZdQ1g+DCNG/MwrXTZ0aWhIjcL7RXGa6Vp6RF9uw/qjIxJxM
         Y/kvEvlwmW4r1LZMroPCkg9PBOmZ4jNu7yJDRE9sW3XCE8ZJdcTmvkbV5O2s7mpTswfx
         mevTIfL5F4YOg+krsDZrr+KWCOMsANbW65aIaYUCEN12kxdWQ53aFzCtFP0x6fuutj+J
         SwhShAF3mTkHqR2hqlcO/iOvvG/IGnelewxnAk6etwEbtqzKLbGYQizSUiBNcoM688E7
         LGs6g+IaAYW2DWWKWU/SXjICbODlUuDZi1E/97+ZrUBn2ehIUD/0ZoGlxHV0+vfOVGVN
         e1sw==
X-Forwarded-Encrypted: i=1; AJvYcCVB96R45yyfI65b4Y3eNaYJnyQLQw9xuYJpWJkSzK1O4rvaaBffHNvHuJgXvcUbaTcrDvmCNggiXqeawAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjBkYIidPZM5S2AI5+Hlr+gocxqkfjmORUWXTD4vGyumrmJ/g6
	AI4DP8tEyIJ+iqQh5pFbn1UIj1EGHdq2+WLfd9Wb6ecJXR7wqIDu1+jWxemTLsDbJb4Q2sNT+Fc
	4zwh7xzI2dhvfNUVZw7Llimz4P9dggrG4X+5Zaigl6/zbGZqwnkpM+WUVbVrQdyRHFgc=
X-Gm-Gg: ASbGncsLJx/IzkADvVZwLL7SBbhm9utQFuwLh3pTt+A2eKquJD5Wc1diDp+AyBltRl3
	XFZ+pVLO2lJ4Ozn1shyf6vm09vDw4r+vk8KQlQCkpkNm66lJ0A+o1vWu1QnELPyKkHjgP/pUkGp
	Zm3zirPLK1GAvsAoI5sLiOiYXF0MNK5T7X9oN2EdQI2MsamAIGxvWqFpjsAvQ35/fJ+W9viXgaF
	zLnecJlfkgxHvtvXYGlbqgF3hDTDUwLFk04L2GXdhobI0hJYaE3hmWrahEg88X7x+f/nRubx4z/
	xfW+9QJMpHp6FqFUCc8RhpF/yr50Mo4dzVPamLlWsNhB7PZ4cHuFZWddmJL/WtwFnb6hZQTUMUh
	0xKE=
X-Received: by 2002:a05:620a:2903:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7d3f98234f9mr843647285a.0.1750768227446;
        Tue, 24 Jun 2025 05:30:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJpYE0/DUFqd1ePpeiVHIpeqkBy3Rf7f7lqO4eXnZNh5L7fNWwe1Er9MbGPKljDCw7XvPFOg==
X-Received: by 2002:a05:620a:2903:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7d3f98234f9mr843644185a.0.1750768226844;
        Tue, 24 Jun 2025 05:30:26 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b719fsm862758866b.128.2025.06.24.05.30.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 05:30:26 -0700 (PDT)
Message-ID: <4f026872-f600-4940-a6a0-ccb0b677be5b@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 14:30:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add
 Bluetooth support
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Anthony Ruhier <aruhier@mailbox.org>
References: <20250624-slim7x-bt-v3-1-7ada18058419@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250624-slim7x-bt-v3-1-7ada18058419@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEwNSBTYWx0ZWRfX+Hbr8rPppI+A
 9icgAxiJ9uG2mAcXDWLForUfJZtM+Ca3uqPYoNQ//AVGEU6GdA91KPQIpH2Zpe1Z6kpLjoH9Eqk
 Y6RiY2RGa97Qr8peANOGmU/0ub/Vm2Y+eCEX4+T5wJ6NvPbtyvvxnDcMjHPzFdhBCn0jgsR6XmX
 7wwFs0YIjTru9jLtFB2Aztb2uyeNuScXO3sGjSKf2AD+83NYqQL7uettyvHcWzheVmNj7zaP4f8
 RBbEfYfo/eDtsepzybFVyGRcilx9O88VwooWdsFQG9P/vMvILATgbpW2C2sZHRcA/1Isbvm/GOJ
 IIODrfrKEd1WKdHrwyW4m/rfVrIDUonEXVA9jncCXxCIqbE2r6ozTBGaUKskwXbCqU4acNsGvTr
 8U6ry91Nkh5cJMO9fu00p/OTH4enf8Qob+ct1x2twtsCxL0eSmgbZy0/xtilrVnWL91aVoK+
X-Proofpoint-ORIG-GUID: TH7s0SZqAHtAy6FlMUSbMwB9KWuPUVZM
X-Proofpoint-GUID: TH7s0SZqAHtAy6FlMUSbMwB9KWuPUVZM
X-Authority-Analysis: v=2.4 cv=GLYIEvNK c=1 sm=1 tr=0 ts=685a9a65 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=b3CbU_ItAAAA:8
 a=EUspDBNiAAAA:8 a=XJvFTVVEtqmPlk0kGFkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=kiRiLd-pWN9FGgpmzFdl:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_04,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 mlxscore=0 mlxlogscore=924 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240105

On 6/24/25 8:46 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> To enable Bluetooth pwrseq appears to be required for the WCN7850.
> Add the nodes from QCP, add the TODO hint for vreg_wcn_0p95 and
> vreg_wcn_1p9
> Add uart14 for the BT interface.
> 
> Tested-by: Anthony Ruhier <aruhier@mailbox.org>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
