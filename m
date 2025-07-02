Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC66F236A9F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453978; cv=none; b=HV/snU0gY8sJ7JZQPowLdyB7LdEou+W4K9RxQrF6EGiSV3iMDVaUcVkYDXDNe2pgitR5MTUzFX6IW92bL351EeGzeGG+4/IoxA49IhhT7f6MWFblz1ANLqh4UKf+d84ORIAv9k34yIAtdmNklPXaaaMdg5cWa6o17yR7AezbkMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453978; c=relaxed/simple;
	bh=NL5WZDSJLjYMpx9TL2pLWNNh4OW2ead/Z6PIBLBEMx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QDaOuXi5TxrN3RKfjoVvaRlmzWe2FcdmLn55k0lJTNSitunmQ3MYPSz+vgP1GIypJbXUOFmIu1IYxwMC8vp27wFxiYUBamHkU7ei7Bc9Vxaldgpql80f/+0KUeim4ra/C1scUxfKrqScoxppCJDTo0MvnhWoyESBJiCSqLKuixA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rdojvwqz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rdojvwqz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5626PKIG002603
	for <linux-kernel@vger.kernel.org>; Wed, 2 Jul 2025 10:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u5BDQVhLvHH8BVr+x4dUYqKfZubZmTAaympRKgXLXq8=; b=RdojvwqzC6iQee1r
	GD7vSCM9H6GkLsfK7wl3BdS/2dioV2w1ZDOyesTq4dVdFpeVPPpc9Gpa090LsgVB
	04NhtLyj6ucRrN+Qegm+DNG+zrUhE9zwdoH9tvF8eeiETQV8DaDQ/g67Cv7xohGU
	gwaKmdPlI1oCJDhMPe6oY+Y3CUVMdUdHd4k0wJdoalUDjnsJr4fPHGtUlxQRK+rY
	2oSBOxR120S+iMtR8CkKR8Oa+qP34YX8Xh9hnU4FTJJjnh/T1O0lg0jgiMHt14SA
	1YQOHhOVCf0Slb4E9eDqqviOOoO60WdHQo4tE0nbiyPKJBuLKGHg34EPay4UZoDo
	6xboag==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcv7db-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:59:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23692793178so58484165ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751453975; x=1752058775;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u5BDQVhLvHH8BVr+x4dUYqKfZubZmTAaympRKgXLXq8=;
        b=a6B0cJAO+F9bv9TSB0QpsnH1AylUsFTyHmAF+lqHi0+CZil0if37i747yUjZNiQcVz
         8c244io+hUYtEABK6Gl6flxayTQg7nhJgt00gn4pD6+hOXAr+9yVep53CIHtVV6IJnFc
         mlIvqVu6vpPjvVNiga6G4r3N4yF9JZONhoBR0l8N9W9zY0wtd78S9oH7h/4E2yJo3S5E
         tQ3eN2PASZAPekZk2VjBXJ8G6Zpa1QIlZ9QXX7ttizGvcnSi1odw+AuYTFKoU4JeVDdT
         txjD1CaKGgY9L3WzEqr2zZa2Aoc6ptNxRywU4SUqypttvBY3+bnq/5gbzGFFZNEsEOKs
         clcg==
X-Forwarded-Encrypted: i=1; AJvYcCXHAzkSXzj1wgYSClx9KUfTndrC572T2KMOmEa49TJeNi+OqPbMATNawPbooZZVXHxmb+UCzpMsVVa/FMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxheGmm2xvs8R6xPZc2XkREN6XI+0UXkL50Q7yuMf93ZnDU2ZvD
	x+EC/defSL1VR6U45AdrgVaJN0bCRJYXx3jRUSr9PbBA6YPQ3WMF20K9d3Phd4DU6ukZzsjFKjJ
	Rz0k6qj1aNEsSfA+h3/hsxmh1YTkamAwnN2VU5flNwtZKtAkRfQCVQmr9WHrCtx56tuQ=
X-Gm-Gg: ASbGnctU9mYK+GvN/Q9CFpfRf0VesuS7zQxvUiXx9C4AvaNFGH1PBcbpHHLeGGNrpmR
	vaLINzSs2RBctcJpqOdpshKpFU4dGU4FdFOZTbHq4EZBAnLTI+mmtbXw+w5i3RnKlMMqMty3Yyt
	Uq7qgmOVvdrBlptSGot9ZwwJwir04TftHDOLNV7WRNxWdOPcfGVW7WpUwWkZKwbidn6YgJa4lut
	6+WRTB1J+miCGuJ85tds3p5BmmeoO0x+UZazcgxX9S0MDYPCcGKveNEDS+S1m4Zn9vmYRMocJLr
	4X5SM1LjY5ftYPII1mZ8eCaVsYjr/sK6jPU3+0Cbs7bDFY+1QI2NilphKLR8Auo=
X-Received: by 2002:a17:902:c950:b0:234:f4da:7eed with SMTP id d9443c01a7336-23c6e61fd93mr42616145ad.44.1751453975058;
        Wed, 02 Jul 2025 03:59:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFI1uiNa2DtkbC3czXuPd6JRMFL4J633cWnkq1CvMz4ROdmjIGLW4N8ll7TLtpVDulerN/hIA==
X-Received: by 2002:a17:902:c950:b0:234:f4da:7eed with SMTP id d9443c01a7336-23c6e61fd93mr42615765ad.44.1751453974652;
        Wed, 02 Jul 2025 03:59:34 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3bbf9esm128223125ad.191.2025.07.02.03.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 03:59:33 -0700 (PDT)
Message-ID: <b5481363-ab6e-4b27-8a5c-d766f64e5169@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 16:29:29 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: sram: qcom,imem: Document Qualcomm IPQ
 SoC's IMEM compatibles
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
 <20250702-imem-v1-1-12d49b1ceff0@oss.qualcomm.com>
 <a68f46f0-8053-4d9f-96f7-55de33bb301f@kernel.org>
 <37695966-1d7c-46c3-9717-30da4e8d1930@oss.qualcomm.com>
 <e1424499-718a-41c8-b729-0ea96bb6a172@kernel.org>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <e1424499-718a-41c8-b729-0ea96bb6a172@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KL3BxXdjSyS1psYM-PMCcCeSrerLAwwZ
X-Proofpoint-ORIG-GUID: KL3BxXdjSyS1psYM-PMCcCeSrerLAwwZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4OSBTYWx0ZWRfX/C4CvDED5TKD
 r3JtJBygx6s+4WeOiyc7n4Lm3hZm2vd3Z9+b/x0pfJH6RTvMDLrZlUlte8BjyTGHEGJ3QfbUTzL
 6WygAppgPfS32MFS3G26rBqmlPHRz59dYR7CfJ0ZH23cHOgnSbvnvKp4xdM8MQzMG87mEejQiLr
 Vm4lvMJG3Sd2kD1EXMEpVUoZ5T50gn29kaPo+49gvePjhpbR2qU9B35dG3d5AociAOzIu3ZJeMf
 /5swlzPTjHV1elq86vT7LjZPMFkOD5Z9iLaUoPd93RVNi0Fa8lbUoIofLvwDdEDgsHp1diB6hg9
 w2jGOTufQLI9MHCg+HP2+eSNaVIH5ho5k97Ga5NBKCBTYAFS8KOFZz2oBJFB2lAozgixMbTsP8q
 G++byCdYstVqeRs5//tcDzRH2z4sqFTPhStdvIdtYZNueN5+/9iiSHqrnaXNutiDOrLv6UMb
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=68651118 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=-s9buvLw_tBRhafl9uwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020089


On 7/2/2025 4:18 PM, Krzysztof Kozlowski wrote:
> On 02/07/2025 12:46, Kathiravan Thirumoorthy wrote:
>> On 7/2/2025 3:49 PM, Krzysztof Kozlowski wrote:
>>> On 02/07/2025 12:17, Kathiravan Thirumoorthy wrote:
>>>> IMEM is present in the Qualcomm's IPQ SoCs as well. Document the same.
>>>>
>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/sram/qcom,imem.yaml | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>> Where is the changelog? This is not a v1.
>> This is the v1. The series[1] I pointed out describes only for the
>> IPQ5424 SoC. Since I have added few more SoCs, thought v1 is the
>> appropriate numbering.
>>
>> [1]
>> https://lore.kernel.org/linux-arm-msm/20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com/
> But IPQ5424 is already there, so you reworked that patch.
Okay, so this should be V6?
>
>
>>>> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>> index 72d35e30c439ccf4901d937f838fe7c7a81f33b1..48e2f332e0e9fc9fa4147fa12d9c6c70a77fafda 100644
>>>> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>>>> @@ -18,6 +18,12 @@ properties:
>>>>        items:
>>>>          - enum:
>>>>              - qcom,apq8064-imem
>>>> +          - qcom,ipq8074-imem
>>>> +          - qcom,ipq6018-imem
>>>> +          - qcom,ipq5018-imem
>>>> +          - qcom,ipq9574-imem
>>>> +          - qcom,ipq5332-imem
>>>> +          - qcom,ipq5424-imem
>>> Random order, no, follow existing style. This applies for every qcom
>>> binding and you received such feedbacks in the past.
>> Apologies — I arranged them based on the evolutionary order of SoCs.
> Where is such ordering documented? How is it expressed in your internal
> guideline for example?
I made the mistake unintentionally and apologized for the same!
>
> Best regards,
> Krzysztof
