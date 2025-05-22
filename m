Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30DB148827
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 20:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747944206; cv=none; b=cAi23D/9woRPQQtbxSg72pXHxzLR5Lo47tQCNw4x4nw0qEdYU2Thc0RCaKfg1I6l7XL8O5yuTrKh6bJFDHTtg1C6Kf3KTmk08slrrL21zZymvErka99npnG85ZNT1oKEw0Gqy+DAJk0mXGvTauBW2GKiGxspo3hduxVniOUgvrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747944206; c=relaxed/simple;
	bh=ld5qaH27erwn+v4cs4MEC0E8uCca4+YFeBxOrd0fjXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m2ZXccTbT1Re1bXJsky32kNZL9I9hEirgCacrEl/mcJBL3guDyVQCxCgoBk7QIrxVfdyulj6Titespp4+xy3bBptZ4qGDluZLtnOMoOQgk0kOkEqZPn/oZaIpMsJsETYBc3lDJEefFgkLSMN58SC3Ddej7dZWMpvCsWZJ2jhUwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C/wBmMOc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C/wBmMOc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MF3BMT016577
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 20:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cl89gNM5TIzVL4bs/l1Go7+vsZRrCb5lIMeR2G1ea68=; b=C/wBmMOc0EaTf82X
	Hkwa9K5RpXrO8NvvPOqi+yXeIkOHEOBUO6SvSq3qIqH2ftW89TWV+1EPTk/CfXIc
	A6PQIWlVF0YXyMHJJsQLH3wwxHvESvQJ0bA/+ioTQC+WaqSaLDDZsZZPTJNm6kpp
	Le+zwfBr8gP9K8dsvoFF4DwYzatUA+HWNV8Q8y2CA/+aQu+o94onRbB9VVMbQsRS
	jREeA1PvcpdZD9//f5poEmetxz2tH46W8HD0TurP1HSsjTUhvjPJA44s/6RIPJok
	vmp3g5pkdbPH0rQypJV+RofaugKTeADLjGQtLp9F2wFbhDb5i3iyc1dQ7O5bo6Ur
	yuiVfA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9yk82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 20:03:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c53d5f85c9so209603985a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747944202; x=1748549002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cl89gNM5TIzVL4bs/l1Go7+vsZRrCb5lIMeR2G1ea68=;
        b=v/FyU6ZplxbfSxs2wGb6gNA0NK9MFMxpTHsglXtj4sliUfrYDi+okvzQVytDFgmycq
         zTXYO20ibABfFGtKPWrCPmbHioekA6wSFLEc1+fpnD56NuryatlRmUV2zDm34M+42A1E
         LJTzWIFRcCP22NJrvgE3Qwz01zGhG9wB+XMay6niyMNWUWsziaDV8ggbEKyeNnVDIvLg
         4n3owqOe+zWqYoBL6CrfMgrjrwUYN4eOA/0Ooay765Zr53Ey4YbeaJraGuAbs31K0VS+
         6DtzDWN/dNhYs3EZ57oB1lqKvVXZWbaLKhKiHbVpbskQpYnLNulgin4e1FyBN5b2XPM2
         EFOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL3uD+oQMh8zR0SRGXHqrtAZPRBcaKdn1uiY0A9v8o7ywUgnbDx8wZzU/GCgMdhN2Ahpzz85zvhSxQPVA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw97KZq5Qt1dLddRAqCDuiw416l/P0Ncmv9MbaEoOf7vyhWsNNV
	M/C8Lu1LRKzRcWbt+R8jztFt/p6dujpJsrgJTynKhVszBSTtDVJ/L4muIr37LgchJU/7wa0b6zS
	4H2+BEW7gXmS2M7/lDRH0MuoZRP7o1aJOktFFt9E0z1Wnk4Jo7K+u4jL8DxC/iDzf9YQ=
X-Gm-Gg: ASbGncubwB2CaxRDSbmHbUyj2NrwOw6ed423yMIdybucW6Q8D0t4NEcW8ZXlNk0BQXW
	QxjMYHVHP9WP9tL5gNDxZl2fubAf+HLASFUskNSqeowEg1PIsjl9VOmyiu4VX0/r760o71zgq6i
	gzW5lEBHElS4hyAc0Mr9iGUnLmolv/sY9gAJGlbW79v8OzT/KMsNQ1P/flYlP+nmmSRNlIUWmNM
	I/nnrEqDGdXIr5I3gXFrR9Wzu1ibu9TnPl0whlY4bS/IyAbLJp3uwo1dcqCt+WFSJkCG74nXzBL
	1pIPtbhyhzp5zdNwMgMx24dlVqbjGyKjcd4SFg5Y3YBAmVPPwCXIniFHL0qzo4KXsg==
X-Received: by 2002:a05:620a:1b97:b0:7cd:2992:9f43 with SMTP id af79cd13be357-7cd460ae593mr1598393385a.0.1747944202602;
        Thu, 22 May 2025 13:03:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdPVBb/3dMa+Oth0RFZpbRe4D5jwSzHxL54HpR9/3qg8beQB+fbLvxl1KJ7Gfry7w44GjJvw==
X-Received: by 2002:a05:620a:1b97:b0:7cd:2992:9f43 with SMTP id af79cd13be357-7cd460ae593mr1598389385a.0.1747944202183;
        Thu, 22 May 2025 13:03:22 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d0717c3sm1134397266b.65.2025.05.22.13.03.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 13:03:21 -0700 (PDT)
Message-ID: <55a85622-fe33-4b5f-81b2-4a4270fab680@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] phy: qcom: qmp-pcie: add x1e80100 qref supplies
To: Johan Hovold <johan@kernel.org>, Qiang Yu <quic_qianyu@quicinc.com>
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_cang@quicinc.com, Johan Hovold <johan+linaro@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
References: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
 <20250508081514.3227956-6-quic_wenbyao@quicinc.com>
 <aBxpMuFGKgWrw1TV@hovoldconsulting.com>
 <5fd4abe7-3621-4119-9482-de823b247b0d@quicinc.com>
 <aBx9LB_qQIvA0bj8@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aBx9LB_qQIvA0bj8@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682f830b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8
 a=COk6AnOGAAAA:8 a=lzpFBSrVIYugpwGNuwEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=xwnAI6pc5liRhupp6brZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: PZWyCmm-hS-J5q7VVbegitBTU_nKa2-Z
X-Proofpoint-GUID: PZWyCmm-hS-J5q7VVbegitBTU_nKa2-Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDIwMSBTYWx0ZWRfXxAa4nm82FMm4
 NQM4b90IzdsgYMt3bQ++wIfc2KqVmeudZ/L3YQk6ivyHfDOMbCS+6FLAvGRmVB82P+uRLUvHD18
 lMr1ICwStds+gIv9X6YaL6M6Uk4/YXC6+DZ+aGemUSVPiMKXmq6VojysGuLWkXY6Yj3k3hbwKaK
 Sek2YQKW8vRN3tiqmFmNdhtMMDj0rVF+2CYzYPU4hxvrrJBiTu87bK4WTzTqrSC0EZ1UOmh5fir
 wZYJXf3cT9mHbbSwHf0V306CkDXgarfo07ph4Smd6SlmpdqnBCR4qylTToSpsM2NiwdYFDmQuAT
 6rw0jEmKSj9ZbmRuQxm14kw0MPl8eCP/SwWWvRrKPcex0UzC3k1YTCkPElIbn1x0qkj9rGxc0zO
 qMU2nSINk+MwmxIOJZmZX6GrHoXJP4/7P0n0cL+zFQfwiqPa/mPgisA9PdZJ8mTTViBwOpdv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220201

On 5/8/25 11:45 AM, Johan Hovold wrote:
> On Thu, May 08, 2025 at 04:50:30PM +0800, Qiang Yu wrote:
>>
>> On 5/8/2025 4:20 PM, Johan Hovold wrote:
>>> On Thu, May 08, 2025 at 04:15:14PM +0800, Wenbin Yao wrote:
>>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>>
>>>> All PCIe PHYs on the X1E80100 SOC require the vdda-qref, which feeds QREF
>>>> clocks provided by the TCSR device.
>>> This still looks wrong and you never replied to why these supplies
>>> shouldn't be handled by the tcsr clock driver that supplies these
>>> clocks:
>>>
>>> 	https://lore.kernel.org/lkml/aBHUmXx6N72_sCH9@hovoldconsulting.com/
> 
>> Sorry, I thought Konrad had convinced you.
> 
> IIRC, he just said you guys were told to add the QREF supply to the PHY.
> That's not an argument.
> 
>> If the TCSR driver manages these supplies, would it be possible for tscr
>> driver to recognize when it needs to turn vdda-qref on or off for a
>> specific PCIe port?
> 
> Sure, just add a lookup table to the driver and enable the required
> supplies when a ref clock is enabled.
> 
> As I mentioned in the other thread, the T14s has the following QREF
> supplies:
> 
> 	
> 	VDD_A_QREFS_1P2_A
> 	VDD_A_QREFS_1P2_B
> 
> 	VDD_A_QREFS_0P875_A
> 	VDD_A_QREFS_0P875_B
> 	VDD_A_QREFS_0P875_0
> 	VDD_A_QREFS_0P875_2
> 	VDD_A_QREFS_0P875_3
> 
> and it's not clear how these maps to the various consumer ref clocks,
> including the PCIe ones:
> 
> 	#define TCSR_PCIE_2L_4_CLKREF_EN
> 	#define TCSR_PCIE_2L_5_CLKREF_EN
> 	#define TCSR_PCIE_8L_CLKREF_EN
> 	#define TCSR_PCIE_4L_CLKREF_EN
> 
> That mapping can be done by the TCSR clock driver (which would also take
> care of the 1.2 V supplies).

So we had an internal discussion about this and while it may work, it
would only do so for some SoCs, and maybe only on the surface, as the
wiring behind it is rather peculiar..

Plus, not all QREF consumers have a clock expressed in TCSR as of
right now.

Konrad
