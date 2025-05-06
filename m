Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224B0350DE6
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 01:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746493207; cv=none; b=i9luv0QOSReJZlLTy+76PezLxLaNdH28O+bVd+Gbh28H29GlzV7FTbHCSe50L3ux/bzXFQAR7Ib5lOHBluyj9v7RWGb0WEX8dHUJ960d55VqdWW5641gmJlXRITohfTJIFgwusY2euQ4Veb8v3lMdsyciSOwg+IlWt17ymdjV9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746493207; c=relaxed/simple;
	bh=mu+Bs8ufgmYPoMWaa3r4Rn+xjkFBtrCiihgK0Hdki7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jVOwKp1UOGtTi0EcGlbhbSvPCoPP64PhanF9yTGPpqsPnue5XcwiV9qlrqeDN3QMUXPy8FGcngeEeWRQHUuqoOH/F8nNpAQFMRz46z0TqyDinLOOoZWyLN/I93r+DpY3YqaBrxROZjsVe5srHztN0QBkTIHHVbGQhWPqYMATDXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HkpX+czY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HkpX+czY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545M4kj9011164
	for <linux-kernel@vger.kernel.org>; Tue, 6 May 2025 01:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xdv764RLRrGf3SUwbhabEY+EiTd1qUAhXP6mTrPrGoA=; b=HkpX+czYmjPE+Ljl
	Yu7zmZ6gdpcFxonh39cOaEq6Z9KbmHcNxGOEZTM2yrmu244MLQ7ccc4BiGRrRJN3
	YThX+WcL1fk5Gq8rKpnc7/QjsYLn+UKHXz+5NJcRRXXp6Jm9YIxeltquaQEBVwLn
	SLPnSl/Dql1Z+baVnO2QSeWRg/OieWVSCa2wSKYoJDt0JHzfbihjXc/14r/0sKUM
	0KehQDWdIuNLtyzW7ENYRIZxVCnvtPgAOzxUKTHXzdEYrs5WT21gFkyxcbAPrrW7
	oGPVEs9bBDqcc5wiwKud8pR4aiGOGLQhHsLRT6HYWZ88g7MN98Iq4+6J3BmSNXe9
	7bqqGA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5tb8c26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 01:00:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-48f812db91aso2106701cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 18:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746493202; x=1747098002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xdv764RLRrGf3SUwbhabEY+EiTd1qUAhXP6mTrPrGoA=;
        b=sO+xBxRWRsADAwe/jqUMl5OoGCn84hqW3WFj7AN0lO8fxbtf3vM/vk3b/KJ1bijPB7
         r+Gs6n/P9PDJ0p2otaYNkvUNcTAH0VRm1qs1RuhLLezG9zZlw0LSAuU/AVafUZpGILcn
         PXlLgfzhnV1VF7aatM8xy8vM40f81kUKHrpWru7eE+Bgpz2Rywi/GO4H6z/aEtS+RLw3
         iCHAzmsnI0idgBptr5vIG0RfgkPaGOlbKSPGiQ2ZJ/Kkh2o8PRISLAMjEMyD/AHIjCIa
         LRKEOGm+O+VXxzYAaMZ/XmQv6CqHcZ1aSn04+SyH3eNFSC8Qsh3LENbao9R6dFy4pv/G
         PycA==
X-Forwarded-Encrypted: i=1; AJvYcCXUSrG0KJYiDwtBf2CkHcRxmgQncGSbXYQign5ss9jh5irO43GIUIb1G6grQPgX35/3L+DoAbiPOiTdcUU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz229mIqCQI0MDizKHuIyBbZnmrUjBuRUi+R2zPeZDHVWzdYDbe
	C7HmRuZZoBQ0ntHUHHfhjyewGDgHHU5eUGcBTuwg+GdWAxfT10eMHwbkTsGEGDirN7mzPqCT24O
	XGbS9GDETOE5lCQZJ4XQPTHwk2Rjs34FtZX0ES5AxDfXGdLCS4CqnbK/hDpYpQ4M=
X-Gm-Gg: ASbGncvdUjQaAJNehtMGHLouZK8vm1oHmaNmm4uA/oS7SCeq8AGHK6lwlZZB6xjrImd
	bktwDJUErICvvU19IYGkjsgekgPSYRzLbJePtfsz+WfzgMrSwPsa39XJzdtF8StmMIfpSJlWtya
	RxrotFXZl8qMTpKwFfPLJss1vWfHrIzBNJjfOv/2oSC35PREoOwDYx0WLK67Db3t5SshHsL51Gc
	Dhwn7smItkjfyLD85tx2pGtNL2eHwHYWjxEoVB2QUFQKRQ+9rkBeReQIY6I3tsBIQJhwr1CQufw
	raAHKm18sYDudIdaMEAwVC7sJgJWVNohXwjjQVm3hc2yNlVpekH7bYOc+JhGE3juViw=
X-Received: by 2002:ac8:5d0e:0:b0:47a:ecc3:296c with SMTP id d75a77b69052e-48c2e0916e0mr86864431cf.0.1746493201916;
        Mon, 05 May 2025 18:00:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2SXWHDRs6cCc/ENSCxWEM4J3053zB5ep3H8W4JdHCVxT6N9A6giFp3tQ2bpDMGbTdjClJzQ==
X-Received: by 2002:ac8:5d0e:0:b0:47a:ecc3:296c with SMTP id d75a77b69052e-48c2e0916e0mr86864211cf.0.1746493201577;
        Mon, 05 May 2025 18:00:01 -0700 (PDT)
Received: from [192.168.65.169] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77b8fe52sm6532159a12.55.2025.05.05.17.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 18:00:00 -0700 (PDT)
Message-ID: <31008c59-afed-405a-a330-e42d89a62790@oss.qualcomm.com>
Date: Tue, 6 May 2025 02:59:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] clk: qcom: ipq5018: mark XO clock as critical
To: George Moussalem <george.moussalem@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
 <20250502-ipq5018-cmn-pll-v1-2-27902c1c4071@outlook.com>
 <1435b068-3bb9-4285-8399-81fc278152c4@oss.qualcomm.com>
 <b05d9351-cc79-4e60-a6e0-de2fe698098f@outlook.com>
 <DS7PR19MB8883995CB86AE2784CAFF8AC9D8F2@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DS7PR19MB8883995CB86AE2784CAFF8AC9D8F2@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5FmBQyl95GfoK_pI-YGOvma27lGQKd6b
X-Proofpoint-GUID: 5FmBQyl95GfoK_pI-YGOvma27lGQKd6b
X-Authority-Analysis: v=2.4 cv=doXbC0g4 c=1 sm=1 tr=0 ts=68195f12 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=qC_FGOx9AAAA:8 a=UqCG9HQmAAAA:8
 a=NYj23yi3rhxQzrYcNZoA:9 a=93bzvrPoB/MOLOjVLaw53YuoC0c=:19 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDAwNyBTYWx0ZWRfX9/MeNBwo5CV8
 kBTi7GgPRXDxIy5CtscD7os7+T1E3rRJqc5lJth9lZC2PCQJ7PkM3YZpI8e7EydFyjjrfsNsKC+
 Gqy3oCJLYy7HKOazOcyDg8LZoAsq4Jm+qeL3wZFHj430F45edkD3uW0C8WDfqXioyoHf7Crozz6
 ZjPlDDlNhwLVmCo0NSHIAsLa+4swc5lnbBOf34Q1dzOjhvoIyk2PU35INJ70uXPxczX9XW2WUwM
 9lENUfkjTn/JQmtdtTeNm+zUbnjVQB79qmI3XeDpfbcVLH+4SnxH3r9ndQBNxqRKi+NsUivL+Da
 Zax/XBwmQDdaVIL7ScJ83iha5diM1Njzb1fXEoMuS4DFwuPyQLUCzNLrVfuc2O3gwa/pOJWj9aH
 95Bp6SQg2rCz0a2qpo/A7dn6IMgCJaE3UEmEgC2bNLqc5an3KaNpbUBRBDH2r1l9S5wAvitg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_01,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060007

On 5/4/25 8:59 AM, George Moussalem wrote:
> 
> 
> On 5/2/25 16:45, George Moussalem wrote:
>>
>>
>> On 5/2/25 14:29, Konrad Dybcio wrote:
>>> On 5/2/25 12:15 PM, George Moussalem via B4 Relay wrote:
>>>> From: George Moussalem <george.moussalem@outlook.com>
>>>>
>>>> The XO clock must not be disabled, so let's add the CLK_IS_CRITICAL
>>>> flag to avoid the kernel trying to disable the XO clock (when parenting
>>>> it under the CMN PLL reference clock), else the kernel will panic and
>>>> the following message will appear in the kernel logs:
>>>
>>> Remove the struct definition for this clock (and the assignment in
>>> blah_blah_clks[]) and replace it with:
>>>
>>> qcom_branch_set_clk_en(regmap, 0x30030); /* GCC_XO_CLK */
>>
>> understood, thanks for the quick turnaround!
> 
> Tested it, but then then the issue is still there. This time fixable by setting the CLK_IS_CRITICAL flag on gcc_xo_clk_src. I was looking at removing the struct for gcc_xo_clk_src too and use qcom_branch_set_clk_en, but there are clocks that refer to the gcc_xo_clk_src as their parent. I'm a bit hesitant to tinker with the GCC driver without access to the datasheet. The downstream driver actually has the CLK_IS_CRITICAL flag set too on gcc_xo_clk as initially proposed in this patch:
> 
> https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/blob/NHSS.QSDK.12.5/drivers/clk/qcom/gcc-ipq5018.c#L1457
> 
> Are you okay with this suggested approach?

Since turning off XO means the CPU (and nothing else on the soc for that
matter) clock will not tick, just unregister the RCG along with it

you can remove the .parent_hws (dont forget .num_parents along with it)
from the affected clocks, this is effectively cosmetic

Konrad
