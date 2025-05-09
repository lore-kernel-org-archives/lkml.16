Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CB31DA5F
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746794756; cv=none; b=Ixwo+mYL2xV2JB61N9bBQ7ZROXcRhsVJDCDUTmTXx6k6CC8F/khfRrcPXk9Bxa8pr1cmO3pw4uYV3qeqk91TZtj4eplrGxzOZFch6/UrNKFuGlQdG/J5GN1bgAGRO6milAr1DrLfHQ3RnChN40zcRMNbNOXh1HCXlnhvoUDeLqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746794756; c=relaxed/simple;
	bh=GHvUROcQdkdkWDU1lkpfy6WFUoPAavG+aosHcF65eV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LNeh1PN4pndhHZJ79abY80uvOYBV7j9MV4RtMd0cZmM2tiVNsOORA7f3h3PDpCaSHJ6lgXBxheu0mN/XGkPVcFNIbWqItwho4vjvn/roxdiGb175ZhAmtdQg3eVv8iND6+SeBiOkxWZWEL+iyGNSHMKZpuERZGNFuWAmA8JCQr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UhWVPitU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UhWVPitU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549C6jEe002323
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 12:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AWQynAaZdyP1BwCe0FmFpLhAGkNvtkQ5JL4l2VsgwRk=; b=UhWVPitUSRA7HncY
	sy/jnNE7ycinfKCQQaQ6408d/qaG0KYj9QsEr7ca75/hdwxTRkkX2Tfd7vqMhGxU
	YNgVocrPrcmv/hMTI3ptSOhqVGqCwQy3lkiDg0/sDj9UZif/OV+PK0W3lASVW0gf
	btSA35yhKCsrlO8fJeOWUQW1t0DnDVzUCreCF42Tp/ypRUNC/601WU0N9qyZ15tk
	2JtNgtX+LVE+9pXOyd88VYNqNoN4yn6HDT9NDBWck36H3yQERaoRmFLISQ/FFrti
	RfxaozIlBC3ZwsFfXsXj0eWHt1W5n6S52GnDROUnSzRWXCHdoNEnY7rQWshQMk26
	aKcU0w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5cn9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 12:45:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5af539464so54507885a.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 05:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746794752; x=1747399552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AWQynAaZdyP1BwCe0FmFpLhAGkNvtkQ5JL4l2VsgwRk=;
        b=GRdrm5PYcOCZWQZqD97OOqEl5aegbHXVPbPFA9ia3LEy48H6Aqpu44ApphOWAO9nLo
         jGhpfC4+XChJM0EWJnoX6RrfMB6PHgZDdmmOi4r2iyHztagc67AYMzZ8TzTWs395/GhT
         VB0V/dC2BWo1S2+pYACI5ZUXmx46AEPC/Sm/hftXnE5enQM1NF1o0yqOLdaROiQqVMRk
         EMXYdugzTJZCAc7iR6ZgezUL1CDv2hZ/JHclhDQFxdt0EPJBVZbs4hsVQ9pvqsdHP+wL
         XfqZZLqqeFXRqBP9BCi+Yd62e9O7HQ9AeG2BdMcSx57Va0C88O1MiwTCllyZuYOvI5TP
         PRjA==
X-Forwarded-Encrypted: i=1; AJvYcCUJVRSSxJ6b23g3KaCVVnHNwzAjdFRriZKuhXKCtWZZIcETggtEKnC2EGMweKCyIUx0gDL58eN9g7xwVRA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1u8icI43L4qptKrb7eeq2JQn1UF7KsNVGZDgUawqkfNBWjvxA
	gF7QMEAgh7mfFFhKVxIunx0fjvFmDKAZ50h7ULfwjFGzucqEOZPeyaET2UZT/8pjky/9PTTniMt
	4/fm6H8AtJH5fMEhe8FkRgnpQRt9u7er9rtT1JAhKsW3HluLq3Mrtq7g6j0eTZrc=
X-Gm-Gg: ASbGncuot53TYwiPOTocD+6MRD/Ztkia/PxhFBhxaH87Q5s0421sJnrh6MFvgL9KEMY
	E8fHhm9/T/zQkFsBC4Xml0iOQnbSE+isqzO52Wp7iQ6ijq/Uo2GNSnngX/AfhTa4GVGrF6BHn0k
	STvq+xTDYS8KZlgo9ircWwuCpxU2l2VtcWkqPdv1pPSuI3akRLzGntlqhJG583bJtJTCWJRa2Y0
	+X/Zxv9OAsL9noDtApKUGFgOrL3cWWz6rITbi9XodRD5GHq58MkCGL40E3PllE4tUDzFTzcjVEY
	p3xRLVfqmgOai2H/3knSqOnA2R+p1J+pc8kkZQsj/fA3WskgD0v7dvUwJLtSsx8nphA=
X-Received: by 2002:a05:620a:1708:b0:7ca:e392:2a1b with SMTP id af79cd13be357-7cd01284a67mr201895585a.10.1746794752021;
        Fri, 09 May 2025 05:45:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/01j/klFD9hnBlTgtkHmbIC4d1TarpECZjk82ft0PbRbQixnKSn2HYkL9AbA+mBnoAh6gVw==
X-Received: by 2002:a05:620a:1708:b0:7ca:e392:2a1b with SMTP id af79cd13be357-7cd01284a67mr201892785a.10.1746794751615;
        Fri, 09 May 2025 05:45:51 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd525sm145972066b.144.2025.05.09.05.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 05:45:51 -0700 (PDT)
Message-ID: <c4921bf8-5eb5-458e-8afa-eeb86d5b5f34@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:45:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 10/14] drm/msm/a6xx: Stop tracking macrotile_mode
 (again)
To: Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-10-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7EFK7dzR=hm-J58jz77pMxn2SoJVrfQvV0RHiESi1mkzA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7EFK7dzR=hm-J58jz77pMxn2SoJVrfQvV0RHiESi1mkzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XL0wSRhE c=1 sm=1 tr=0 ts=681df901 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dD46bHw1nIv95-N93oQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: lznkK1P31n3erZgHbQcb8XLOgxmAT32o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyNCBTYWx0ZWRfXzsG5vBuaDpAZ
 s9rllXgfJk6jJ0fTNldPsWzsX+zGcVoi0D+gGhvGrrlh+YosCd/A2z9LVeR7WYTZGgz+DCBjJN9
 WdCzKVACuOu7HJWE4LLmzkaWtCGf3jUxQbK3gvKrml+zydbCRBawiPeXclNCYkhtXqlweFYK9GM
 v5S5BOiUqieVZXKKvl1JlbKBf3aAl0VJNUuXe66xuorER9myjBurlrBu6cW/231vneqYrh/A21R
 Dfsm5g58NOjUjmZjoB2SGwLc51faJ+DTM6u6vLWZ+dwC9bnkSdum1VkE1Sk9lMZDjZSRhihz6q1
 s5+kpw7kjG7DCu8wKm4/TCM7Z9Pi8eyE3b3V4IDfA+9oawvEUL43I6OlAte/HKXR3SQmKB9eSEE
 0ruAH2I1nANHsupHBVTzyy9Y/Wgu29SeFCqYal3OtgYJTbOFYYhgNaP27fEI5wDyoLMa2BcG
X-Proofpoint-ORIG-GUID: lznkK1P31n3erZgHbQcb8XLOgxmAT32o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090124

On 5/8/25 8:33 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:14 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> SC8180X (A680) and SA8775P (A663) require a write to that register,
>> while other SKUs are fine with the default value. Don't overwrite it
>> needlessly, requiring the developer to read the value back from
>> hardware just to put it in the driver again, introducing much more room
>> for error.
> 
> I'm not sure I understand that last sentence. The original reason I
> always wrote it was that for host image copy we need to know the value
> of macrotile_mode, so again the value exposed to userspace must match
> what's set in the HW. We can't read the value from the HW and send it
> to userspace, because userspace queries this when creating the
> physical device during device enumeration and we really don't want to
> spuriously turn on the device then. That means the safest thing is to
> always program it, guaranteeing that it always matches. Otherwise we
> just have to hope that the default value matches what we expect it to
> be.
> 
> I know you're copying this from kgsl, but kgsl doesn't expose the
> macrotile_mode to userspace. I expect that HIC was added afterwards
> and only works via hacks there (if it's even supported at all on the
> relevant SoCs).

Alright, I think I'll include it in the common UBWC config (even though
it only concerns the GPU), as IIUC it may differ between platforms
implementing the same GPU SKU

Konrad
