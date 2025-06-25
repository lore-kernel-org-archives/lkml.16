Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116C425F985
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750852616; cv=none; b=Sijo7T/tj8J9BD8a/zyGzBJ6OJQ9FQn2NxDQBwnwFEV8QbVLLB+CT7aYqOp9NQjshgp8kNM5CLgwYH4CJdw/AitBxY7JUanp8zFIr7DRKLlPq+KSDT6o9q3wdyS50qRHurZhKLHLkP73afoFZ7npF4+ZqaAK4KKUsvBX3O+dpCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750852616; c=relaxed/simple;
	bh=BVCdK3npxOuJY1EA2b0sv4BUq030Q9+u3iWzgAMxjkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FtAxWRGrKrRYD//s+XHtXNmOPRKu+A6tUvcnGnZeJ4M6OpAWKmFuFYnHK/kxOVEpYFG3mkcg3hftQvivBJOOiqVCvMBh1wIqfq5vK0zA3ufMAzPU3S8tWHwAYiLN4r9X4FrS0hYr0jAmmwsih7vOqq6B8+hfe9z58dCoLCicCPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gcAy36CW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gcAy36CW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBg9l4021046
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qtf2LIek4hpLZ54vWooJjQr0lr5Bw40aXqP1yVThXvQ=; b=gcAy36CWTbjZXPo4
	LTSwKhbDedrFZlz2r+vLYTqGQbV/ntVaxiyCSbTWhGgbB4wiL4cFf4RcpxTeukyW
	Z0lUSg7KCMvc5YZyB20FRHLHELnUuDX76MW+Ff5cAnAtskiBNIMufa1fhKxduvjW
	gHpIWW9JY4YOBptfCCSpG9K90osox1ZM/Rb66n+jwJ+O8q2kAZwvwE0hdKiM8oL/
	VGI6Ao8ka2NnGxon+VNonHGnDYpVqFSwKr68tZ6/5EK1kwAgXj8RxJdBKOJdo+gt
	OfsE4gxhBaJrm38QaywRixi3s9AUIk36u4Y/mgV3Q8tLahgjHdQcgtNZuTHthVAz
	pnNLrQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwx1jy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:56:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09b74dc4bso158829385a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750852612; x=1751457412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qtf2LIek4hpLZ54vWooJjQr0lr5Bw40aXqP1yVThXvQ=;
        b=aSRpEO7nwhRW4oQX9CylTfXUaowtOIf3aV0LSsB//NkMJI5fYGliz9pPAMPO7ShnSs
         DqFl7stb0FTIPV4ZU3rBOvq0MXiy+iOvbAmYCL6C3AZBAFqedGvzt0rzmhE7AizVUcla
         bc92kbFgM7UF3G8glcjgVyeINkfgqEb8M02Uz+1Zr4vnAjaRCw8+O28UcoJKLcuTYDq0
         iWcHPpAJKbf+Kgoz3S2GXOLoHDPDRaPIteZ6d+6IZROhv0DquX0ydGijaJApmawv/M2l
         b2cWi9tPPSd00kv+i+VwcYcGDNvfHOpptZ3vPM33ZIGE8DvJkBqK7aKAZn1TXTtLDyLg
         tTnA==
X-Forwarded-Encrypted: i=1; AJvYcCUNxia8EyAaRbYk7u0Qui6fcmuxJsOiBzxK1E1yyiQkp8GU0UzEozf7p0ZTxDgtdiXuf25biCowHjHiBWY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1GrN2ImuLgIVnbUgIP2mQuVD3S5kDLhHiupFdSffh2soxWvHU
	l8WVyB81Mmdn+RDoBHjuJMXWBanvgsbQMJppuArnE518TQH2ROcd4GMf0ubkQ52OzTR1gteIoHb
	/Pazj2ZaOwpISP4IUK92+lxQv/bcfPi/BBVnvJB3WhmblD5RXkm604OS2IKIacoEv3NA=
X-Gm-Gg: ASbGncu+RwvfspRz29QLsclUt/387EMlLMICHjt6IHidShwhkU6HVAqP4vwquZpavpA
	IFtSWBYMe+3I6r7szyblw57/E5nMgMeLdFZ5dX0X2vfSfHH3hknaQnUHZQl4DZTXwb4XVXa1uZ+
	iB3VGdJUv5C/muAQOUGl8t+NtylcxmXg6fPV+ueP2qGBcI6vuvgFnkQyvPpVWsPwcI9hSLPx9Kt
	MbLPodC0Sp4J9VAsyluHvJNFqIgSrHcPuPNiJIDskYgUskRbX7MnJ30U8HAtgNcvzV1LmiH2kJZ
	q8Rp9+5la7Mk9PWZZO20RTQH0dvXuUQynTzn/PnusBwUI6L2rXwRgPK1TZh4kX8Y26jwREUxCYr
	KCAg=
X-Received: by 2002:a05:620a:2949:b0:7cd:4bd2:6d5a with SMTP id af79cd13be357-7d4296db1e0mr156158385a.5.1750852611671;
        Wed, 25 Jun 2025 04:56:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbNAdmHcL/ohxdpxrFhw+P+cQf12Kd+1+opwn8szOOQKrMRERAl3ZBXjt2J5pp3lvClg9lMA==
X-Received: by 2002:a05:620a:2949:b0:7cd:4bd2:6d5a with SMTP id af79cd13be357-7d4296db1e0mr156154785a.5.1750852611039;
        Wed, 25 Jun 2025 04:56:51 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f4842e9sm2431839a12.61.2025.06.25.04.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 04:56:50 -0700 (PDT)
Message-ID: <b98d305b-247f-415b-8675-50d073452feb@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 13:56:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] Various dt-bindings for SM7635 and The Fairphone
 (Gen. 6) addition
To: Luca Weiss <luca.weiss@fairphone.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Thomas Gleixner
 <tglx@linutronix.de>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-mmc@vger.kernel.org
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 63TDbYDBGWsCmTT1lguRxU-TutsajTHN
X-Proofpoint-ORIG-GUID: 63TDbYDBGWsCmTT1lguRxU-TutsajTHN
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685be404 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=PtzdWR5wS_Xl21Jse7IA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA4OCBTYWx0ZWRfX2pVRZYjbmgc5
 IjfrwhTIuIrDiHnUlRvaegVD2ZPcgeRt3vvUeN57QISj+2gF7MLnXL2DBkbpaadPId0k2QZc0fC
 nUIA4qFUhspUUo/2hvO2BtIVlWLCW0z7uAj2Wtj+Z3NLlJQ+1XMIizNhupYCmU1SyqEgBLcd84p
 mBji74wdWjdhydwNe0Fmu9VJtOCVLi63g1r5KaK8+wdSvZgahdvDkWjWnkWG15gsso0DREb92dD
 4a0HBQar2pxJI08pbhSiYRzbKoylvKE9ieXPBdUMmK5gP1wiXAJOD/Bna1zTRTFbU1nRwZ5HTSA
 n9r4tjZkssiAUbUphqVxL64pSnqaBv7uT8hLWiVS2SdQhutRY/92+wYWY/S8WzTFj7Sys5IlP3f
 Dv7Yci93UkirAJNb13GADr5IBJdcCGanLX4YeCs2xewDEZgH6pWmj7qyEjBGGvAjQT+OEs48
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250088

On 6/25/25 11:22 AM, Luca Weiss wrote:
> Document various bits of the SM7635 SoC in the dt-bindings, which don't
> really need any other changes.
> 
> Then we can add the dtsi for the SM7635 SoC and finally add a dts for
> the newly announced The Fairphone (Gen. 6) smartphone.
> 
> Dependencies:
> * The dt-bindings should not have any dependencies on any other patches.
> * The qcom dts bits depend on most other SM7635 patchsets I have sent in
>   conjuction with this one. The exact ones are specified in the b4 deps.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

DT/subsystem maintainers, please hold off a day or two with picking up
these dt-bindings oneliners, we're having some internal naming discussions
and want to avoid potential big revert-redo patch sprees, I'll try to
post a decision whether we're good to go with these ASAP

Konrad
