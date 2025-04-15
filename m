Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C84312A177
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744690100; cv=none; b=f15i6Tzs3KO5zlQQHg8jd55+yARG1SJdPlynposZfFNzp98crvYzVnGPGFqcJxPR4tzRSlA/rB4cAKFSs6sh4pB400FZmJNyjDc+73t5g/KShsWyAN2dx9mVrJM4QNoFuNo53bEKCb+UsgOetVTOn/rLsSi4yhTRNXpAaQ08WeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744690100; c=relaxed/simple;
	bh=WZRxP1TczlIric9hx2FfdJXAegNj8fLRQnlzcHQVEmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ECn37iXiteHt2V4JhrUecL/FS3w8mfwKI9FwLUpepeN0f7+pCL7/PxwUM/eG/s6tXGHaqKAahlsv1L+JYDtLVTJeM3UqkKDaMo1QhLjs9TZJbuCuX2ahP+deRvD5dTsH32c8j8sQd5RmJe+Ajf4muF9jN40E+xT8oAAdnqFsWgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTrcwBLl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTrcwBLl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F15N4s030982
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OfAMw9FnKcM+bSbPo/M8N6K85i+KuWMDiGkgDeFsDm4=; b=KTrcwBLlnerVHkCy
	Y8znUHrGW7YPEGSiB5Qa6ZulV+8sO6yjRcU/MADsx2xysJLIQ10tGXK4zyvPaTyw
	MmbLBcbRYbkevghls6+X3RZb93yL+Jf2prF1JUPF4MkhxXUx/L71BauBVxM5qsQB
	GbTAuCEmoy+2njd6F2VWLNBPDP1RMU/BsNWU90mdk8aSBi74GHWG9u5egUkLLsQp
	yVSljiTqpm0e+43Bs23hddQiYubVOITBs/4EUQXB/ZNq3HyrL7xXNRbjF+411BQ1
	zbKZgs3tybENFAmjTWA2bhAcxbiER2htGAWoet5D51+Dn0VyVzTF68lYsiFE8zMS
	512EMQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjxfdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:08:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-227e2faab6dso42794285ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 21:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744690097; x=1745294897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OfAMw9FnKcM+bSbPo/M8N6K85i+KuWMDiGkgDeFsDm4=;
        b=Wp44BSB486/6GchWHgAI0ua75VhFVkXKB2oB+GWz2C/Px14d1rgZg05yjzKe4yY/Lw
         KfRQuNIAC4nS9f+CQtcqvEgymSmlqiT+1q5vcGrJ6DljfDcW1KZMH3Cho6c45V8X5ygR
         HD4rq8sk1gO7A/ouGFYEJwuBpQw0WgNVwBn442QJk0klOfc41W6N/exkXmcbXJEEB9jh
         Aj1fp299x/12brtJh4cqH121KfxA8g4Yi0k7r6OTQ2I+RZPHyVTR3WfdERtdo1NVq6GZ
         bSMMv41poGwB07dD83trTxlmvKkSUyyn+ROTUN6p7Ei6V9rCG0FVW+0KD/q+ruuotGNG
         jW7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOcFki+OdlS1N3CdOBi4qpqw3kQyu2wcEeMtZily3DPJFpRFRC8qKP/XP74Xzw1Su/w6Q1oU7d+7d4bns=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXI4KhvFL1K3rHU2d7WawhbspMhzn0Ue/aPxJiS+Wvx9CEsmzN
	QUgghuhmdRW2kQoPinGdnZQNBd1qx7M4hZTMEkt7zginEewYRhLejkYkJOujnn4GCkvq+OAG5jv
	L7aouHAV4XNx1qcDlmOYNTP6XFXfAqdi2W69TS/BS+ZwOGR1V1MzisIiOBtMPzIA=
X-Gm-Gg: ASbGncv/xIhkGQuDwS7GdAjfNMiL8ChZtYnxxP2F5r9F5tfAadb4J9R87LdTUD5cPez
	6qJTpJJQbown4mtEKMCD1xV0Akb0NOGevs0frmjmvVIRosNcYXx5fzco4o8tlzJGfmXOR68WbUb
	DKusEtxfpVgpjgCM4D50bc4hSoekldLWNtC9CBX7+aILVzuuyDMqq8uaxsSuddZUioBn5/t2/Q6
	GlsDLZN05Nv42VlTxYaTB21GJJvPrTH2SYwMlGPH5fAQCHYz1xqxjwedW1tkB6xjFycAZ9AffOW
	O7TyptwznEQna6WcMW/wjjC6JJ/NugG2HhK/lVU7MtBQ0vG3PYu8
X-Received: by 2002:a17:903:41c3:b0:223:60ce:2451 with SMTP id d9443c01a7336-22bea4adea2mr211411365ad.15.1744690096743;
        Mon, 14 Apr 2025 21:08:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfNMHFUTKafJCZ9yRtG1Wxb7uhLpzHR2LHcpwK114phBQV66RupNgJbHDc3SbkjNoZ0glg7w==
X-Received: by 2002:a17:903:41c3:b0:223:60ce:2451 with SMTP id d9443c01a7336-22bea4adea2mr211411185ad.15.1744690096383;
        Mon, 14 Apr 2025 21:08:16 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb5381sm106856735ad.192.2025.04.14.21.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 21:08:15 -0700 (PDT)
Message-ID: <b850b468-f962-4ce4-a778-f1e47c017bbb@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 09:38:10 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Revert "phy: qcom-qusb2: add QUSB2 support for
 IPQ5424"
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250414-revert_hs_phy_settings-v2-0-25086e20a3a3@oss.qualcomm.com>
 <20250414-revert_hs_phy_settings-v2-1-25086e20a3a3@oss.qualcomm.com>
 <5ccf0252-c16c-44e6-bfac-7f94597c5493@quicinc.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <5ccf0252-c16c-44e6-bfac-7f94597c5493@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fddbb1 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=p4y_1cVLeYHBzHAUBk4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 9N1G2kJEeeaV9ShnNXZ6e20fZt0kDirt
X-Proofpoint-ORIG-GUID: 9N1G2kJEeeaV9ShnNXZ6e20fZt0kDirt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150025


On 4/14/2025 7:03 PM, Mukesh Kumar Savaliya wrote:
>
>
> On 4/14/2025 5:22 PM, Kathiravan Thirumoorthy wrote:
>> With the current settings, complaince tests especially eye diagram
> compliance


Ack.


>> (Host High-speed Signal Quality) tests are failing. Design team
> Write it as "recommended by Hardware design document/guide" instead of 
> design team.


Ack.


>> requested to reuse the IPQ6018 settings to overcome this issue.
>>
>> So revert the change which introduced the new settings and reuse the
>> IPQ6018 settings in the subsequent patch.
>>
>> Fixes: 9c56a1de296e ("phy: qcom-qusb2: add QUSB2 support for IPQ5424")
>> Signed-off-by: Kathiravan Thirumoorthy 
>> <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qusb2.c | 28 
>> ----------------------------
>>   1 file changed, 28 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c 
>> b/drivers/phy/qualcomm/phy-qcom-qusb2.c
>> index 
>> 1f5f7df14d5a2ff041fe15aaeb6ec5ce52ab2a81..81b9e9349c3ebb4d303cb040b5c913336bb6b6d6 
>> 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
>> @@ -151,21 +151,6 @@ static const struct qusb2_phy_init_tbl 
>> ipq6018_init_tbl[] = {
>>       QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_AUTOPGM_CTL1, 0x9F),
>>   };
>>   -static const struct qusb2_phy_init_tbl ipq5424_init_tbl[] = {
>> -    QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL, 0x14),
>> -    QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE1, 0x00),
>> -    QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0x53),
>> -    QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE4, 0xc3),
>> -    QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_TUNE, 0x30),
>> -    QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL1, 0x79),
>> -    QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL2, 0x21),
>> -    QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE5, 0x00),
>> -    QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_PWR_CTRL, 0x00),
>> -    QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TEST2, 0x14),
>> -    QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_TEST, 0x80),
>> -    QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_AUTOPGM_CTL1, 0x9f),
>> -};
>> -
>>   static const struct qusb2_phy_init_tbl qcs615_init_tbl[] = {
>>       QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE1, 0xc8),
>>       QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0xb3),
>> @@ -359,16 +344,6 @@ static const struct qusb2_phy_cfg 
>> ipq6018_phy_cfg = {
>>       .autoresume_en   = BIT(0),
>>   };
>>   -static const struct qusb2_phy_cfg ipq5424_phy_cfg = {
>> -    .tbl            = ipq5424_init_tbl,
>> -    .tbl_num        = ARRAY_SIZE(ipq5424_init_tbl),
>> -    .regs           = ipq6018_regs_layout,
>> -
>> -    .disable_ctrl   = POWER_DOWN,
>> -    .mask_core_ready = PLL_LOCKED,
>> -    .autoresume_en   = BIT(0),
>> -};
>> -
>>   static const struct qusb2_phy_cfg qcs615_phy_cfg = {
>>       .tbl            = qcs615_init_tbl,
>>       .tbl_num        = ARRAY_SIZE(qcs615_init_tbl),
>> @@ -954,9 +929,6 @@ static const struct phy_ops qusb2_phy_gen_ops = {
>>     static const struct of_device_id qusb2_phy_of_match_table[] = {
>>       {
>> -        .compatible    = "qcom,ipq5424-qusb2-phy",
>> -        .data        = &ipq5424_phy_cfg,
>> -    }, {
>>           .compatible    = "qcom,ipq6018-qusb2-phy",
>>           .data        = &ipq6018_phy_cfg,
>>       }, {
>>
>
