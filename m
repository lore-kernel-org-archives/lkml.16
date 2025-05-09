Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C6B22F76C
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746805953; cv=none; b=Yo6p2qe8RTD+WgHhB4IC06tLqXD3XOfGSrad5O4hx4mDb7WHNyHCGk3Kakyf8AqSic2ExI4T0SJLV1yjs0iBF79Qft11x2kPN0MXlvU0l8LLjbbAmoOdhOFr7ZO+IQg1iCa1MAwf8ycg9lSTpCCNVSPGdgOLHsCCgqsSEBR6CGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746805953; c=relaxed/simple;
	bh=Y/eSZfZFtNCyAe118lul7Kok5V99+6/bpsXa3isPhD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fXn33BU5G3R3EOSdjtoUiag6dS2AMS+5gSRZd36TShLKDaDucBcLEJ70QoBYbyxA5K9FMK89Od+mj6aPVCHr6E/TQ51xItB6/S689evSOGQnvv1pD2kpmANKS8EkNMdaC8iWKVp49vFQxJx9DX+wRV6ARSzb6UEPCX0Zse0W7HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RtiMTzwy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RtiMTzwy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BpLCK010664
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 15:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OgpdIMOzRk6f6Ol3Oo2lwgI+bdt0V38jDJzDqsqNV2I=; b=RtiMTzwybNjNSW9c
	hufGWZfhosdUtfaaQQpgabcB9SXAXgjLDCwLxsSwvX2vNoWCHBJpoUPQsndrBofM
	Xkgxc3VJEJI2fKbS01gbsjT1nF+vUg8TR66RfujbvDP1cnAQ1E75gAAIF48wfBA2
	yN9KLaOl+SI4YRLqesP07oxJRzYlHmgN+56B38so4tS79n5UF8/OInK0ZttWCnSl
	uk9Fqn8uVbDYwc9a+sRM0qSNyg55INx2dw+ZRirlA/1YlSHsPTcnJNGaRzfcY6d+
	EXqc/NlBWno0PBEQzkMf6Q9oH+VZa0wtxxmyOtaNanf7cJJ7Db/2fro3BmnCAT2h
	qxWTmQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpmn5x3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 15:52:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c555d4ad75so6529085a.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 08:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746805950; x=1747410750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OgpdIMOzRk6f6Ol3Oo2lwgI+bdt0V38jDJzDqsqNV2I=;
        b=mIDN9oJjsxo/mF22xr2aBwM3PUB07x4GiI73z7zLKrO42QeMrhxOyJpbvoaSsxPnPm
         SBImpLJj7YAQHXOSMeMTH15yMOaxeYhMkk3pezSyKg+hU1ktoH9//l4u2rOJwFs0QkZx
         qiJTXC/xvBnFKZhBgod60kQLIoyYd1eEmHWNZ/4Qjnp9/gIhE9KYKGJ0SH8PuyBT9Vd8
         D1R0s/P7WlTpQNrLb1UGeAWRFXVSNeWdGYc16QTV59SHuSyvKRvOYRq6xNljlGimTLLR
         C7rM4S7FczuWguZWeK9tsCoIjMB79DI02ZtFnck7o5J6btDKmGkzRxr5p0Ud0cRN3uv3
         SW+A==
X-Forwarded-Encrypted: i=1; AJvYcCWbIru2GtHs9HEw9Q7e64zOw7G34hbIRAkRI6H3Ky96LHZVMoTDCyLD4wX4B/SzF15XHzsv6BpBwA1VA2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhTtSeM+fKGfvXdjNvkY+STGiRndMXTbXCsuX0PPah6FCwo9DG
	PV6KGKHZso2C01nmiBbXZ8MzzBIMAlMqq9glDtKwGsPHoBt8T4jbsiD8vGwnM9cWSefbKMp+QmK
	pCJ0oTxkNV0Xb06wT4xQv8feIbhzbnsqdv3oqsHaA2rl4AHfdF+D7VqICnje3wpo=
X-Gm-Gg: ASbGncsOkeJDNYE6mV604l3zXIBrpxwXc8o838lPF3PcWTO9R0zB6IhWT2v62GjOmQ0
	pc1Nac2vlqnWqqnt7W8ImKXBcE7IsmSZTvjDTUiN1gnI7oVx5+399NThtcseTAgemQ8/gBtLB0T
	VVOUIPCauJuZLNGMTaPqWOZh4cpzW8piDr7LVD6nbS+Lc80eIqRpNYZIsw+zAaecMAK792fOY+d
	v55BrbLu2oDF5Efsapa6Cygtq4C0BeKeSjj19X32F/+5q6v8u7uUQ+a78V1lYejFz7Z3SbTlbO+
	QyOTtnl/hS/17IK1Oc3zGXFsqdaNsAnP29mR53bSeuamu0j5G/Pxjy/CIweXdg99f28=
X-Received: by 2002:a05:620a:290b:b0:7c5:e283:7d0f with SMTP id af79cd13be357-7cd01108cb6mr239887585a.8.1746805949859;
        Fri, 09 May 2025 08:52:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6vSB51mdOZghOfvmG4yP63LfVUtSo1UHFOlSG6Oe5suFemWAMe5tcTQ95NoXx3vY6htX1hw==
X-Received: by 2002:a05:620a:290b:b0:7c5:e283:7d0f with SMTP id af79cd13be357-7cd01108cb6mr239885385a.8.1746805949419;
        Fri, 09 May 2025 08:52:29 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd37dsm166816666b.124.2025.05.09.08.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 08:52:28 -0700 (PDT)
Message-ID: <9010219f-a3f1-4869-84b3-b4f6c5e9f05f@oss.qualcomm.com>
Date: Fri, 9 May 2025 17:52:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 13/14] drm/msm/a6xx: Drop cfg->ubwc_swizzle override
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-13-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7E9yU-cygZxBqVypP7aFkXJCNTfXA2uqdvU84mi9T51Xg@mail.gmail.com>
 <5f5e512c-ae0e-43aa-856f-06820ac4b147@oss.qualcomm.com>
 <dedbfb2f-012a-404f-87d1-2f3cd04b0e74@oss.qualcomm.com>
 <CACu1E7EfgPFcSgGA5TkAVqpO=K2G1AjNVbRij60TknCx5PcoqA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7EfgPFcSgGA5TkAVqpO=K2G1AjNVbRij60TknCx5PcoqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TpjmhCXh c=1 sm=1 tr=0 ts=681e24bf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=0-j0KOu8P3_yQaFSRvsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: c_gvS3xcovpK8jyH-yUxtMw5HKGOuxBf
X-Proofpoint-GUID: c_gvS3xcovpK8jyH-yUxtMw5HKGOuxBf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE1NiBTYWx0ZWRfX4qdHV1PVx5Zl
 tFJYn9NOCaUyPz3RisoPBEGoP74y+7UhX3B5/zNcmYsezq2I/9kO8pnz+su4ubWxP9xpYylcMU8
 sltAQlZEInUXit3FbRqtGhlKnVJmX2nvSnTyU+vm8kOp6es5toZXaYSNK4dPaz0vtp0QhPw2/2R
 S4mwftEe0hk90WiXR6En49Y5ftWd6zq+G7otZ8hznMzwHRwAjBolCSbJFo/5LpEWXypL5SYSjRa
 67DRUCXG+0+wvwNICAkrMBx5CctG5gNQKtZL6SFzQkeze/zk6snVSXVvnN9X5FwX3M+0lKutWEc
 nsncwqYFJ0jYCdjl0jO66RRI2cWJDvZqg35rbVYU82wE1B73JR2rsQ70yoTeJeQJj5J2CzZlDw+
 taCAAVKabqLBSrCrSafFU3wzYT512+hBCj1U31cNlRXVYNDr3kMqRqN+70L85bOaHXQW1gsU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090156

On 5/9/25 4:48 PM, Connor Abbott wrote:
> On Fri, May 9, 2025 at 9:37 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 5/9/25 3:17 PM, Konrad Dybcio wrote:
>>> On 5/8/25 9:26 PM, Connor Abbott wrote:
>>>> On Thu, May 8, 2025 at 2:14 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>>>>
>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>
>>>>> On A663 (SA8775P) the value matches exactly.
>>>>>
>>>>> On A610, the value matches on SM6115, but is different on SM6125. That
>>>>> turns out not to be a problem, as the bits that differ aren't even
>>>>> interpreted.
>>>>
>>>> This is definitely going to break userspace, because the kernel
>>>> doesn't expose the UBWC version, instead exposing just the swizzle and
>>>> userspace expects that it sets the right value for older UBWC versions
>>>> before it became configurable (0x7 for UBWC 1.0 and 0x6 for 2.0-3.0).
>>>> It looks like the data for SM6125 is just wrong.
>>>
>>> Oh that's sad.. I'll drop this commit
>>
>> Wait uh, we have this data in the common config.. why would it break
>> userspace?
>>
>> Konrad
> 
> As you said in the commit message SM6125 has ubwc_swizzle = 1 which
> seems wrong to me (it should be 7), it just didn't matter before that
> it was wrong. You should probably just fix that.

Oh so you meant that the 6125's value would break userspace - gotcha

Konrad
