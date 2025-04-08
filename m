Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B88C24501C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 20:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744144026; cv=none; b=UoCZYXNGHtV5yyOV1/fb1N9HgTuMhkbtPw2OufKEfdXKMtWSIlQ4iNyXQ43bzoSN8emw9hYVDahYkHUROKnp/3yNCz5j4MrmJHpw+J0024edxugB1LglTosohfftn//jpY/9un24gjSIFlPjekCDwM48RJkcxPJoPlzkplskQ6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744144026; c=relaxed/simple;
	bh=lmxJkzFzN55CvpHITqysrbpyojnZyXakGvg4sdUShRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XlzkJSY4UaJua3L8lsn8F+zpz190wqWY7vfN2EadEqM0pDQFhAIqYrx00z/9uRxlnq7837RlnW5ypjUwXAvmsdFCvjO+zjGLFjTBecW5fGVBNt/Bo4ixnuftDNxwVQiw4UzVKfRmNYCrNNeZgTB4U/9zsxoC4pA3M8Y2YCE1EPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aGQZHq6/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGQZHq6/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JYqr7026657
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 20:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cqXN69eJjj53VercbPPDUqUwXi+7djq/bqmM04r34T4=; b=aGQZHq6/nEayjBSQ
	x17b6vBaVffK69+9jySaswTU4QZWqd8ZQrUvDNbMHcTmNAJYKuR8aoXnVCMHLbAr
	A7SvqTj6dV9eitGJBU3zY1VVO6N9P460NjnTifSBAc57hM/OABHO94pWKvmcIklB
	SKer5dCA3KW6/KpcbVwrZ+UJh9hfhWr578Bn1W9PmhP7Ag0GdSyv7RhJgIsHJ7j8
	60dKkVgPxeyDoBLzdWO3L4RDYAKxJBJxsJILtCbzdBuHLpGfuOKsrRINjzwk2W4x
	xzYNsl6rKwWh8qLSks3ZUmVsAQXlTehBEw+NwKwzC2HiXRBSUKRTC1oMgZFxleGK
	TeuFjw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgh5h9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 20:27:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c57f80d258so1943714785a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 13:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744144023; x=1744748823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cqXN69eJjj53VercbPPDUqUwXi+7djq/bqmM04r34T4=;
        b=tu0dOftdbw7QUcK6W/fpL3969A0rvXZWPwzJ0iHkHcmOJiiofaKTCp+gZ5kNAEKWVM
         bcN3Qk61ZDzpXkHQBRRS5yVLLS+SGntVh/Mj+a3lTj7/FLrskiEsBnJEOgkuxePrDcDd
         qtTcsV5YLlL00TfVS9IW0fCHP8caPtsXYOuB4eF7tb6RvF30whJ/9KMO6t3iFW729KAy
         e6cAWvEG8x3fuewJK3XAfB8Rp2z89DBJykSlrE4HAAi/3Hh2UeSvAr9inK8p49nhccvY
         4FlgY3EAcyNAHx8Ly64M4Th0P6NE1aeqYs/A3DoHxNJnUlTnIc5Qy2VAsLpN8/r0NRZC
         BxLg==
X-Forwarded-Encrypted: i=1; AJvYcCXk0k/mNyX5FljpA6bP6Lbtjn/beaN08Sf8j8F2auU+7HmExWhTdQnV0c5dEQdzMSc7kDKnC9W3iTag8kg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxu42KQ9GcFINfcnxHSAmG/aYirnq/F4Cjf3TuVFXv0gMTbUlh
	gRONP7IYwMwOwXAwVUo3xdh+0r8ENax300bfMMsT/ps1kNZBhtsIyLPZnvAf4HcBTgHjUz8Ikbu
	tUhlUftytGouw+C6S83NNCtr6GVciWMzH9/6Z/DUSGmtxNIC3sMdm/y1FeVX7YqM=
X-Gm-Gg: ASbGnctyqJfJh8OIlvZLKa3DIAnONYE1G5kf1+d4LmRv3o5yh8VfjelU4qizQxGkddC
	rF+USyrdL1S270Bk2UO1/CsWTEqxFiCo1uUCjDaIYSiIosRBmoTMmgwz1SAlGQ4vsdBnYNWhQQv
	B+in9G9PkphfkOSrKFAxgXsVhEV2i0axWLATSL1I/Uu0aSWNoMJU4PVXAAECifbK5SOld8+Cpjg
	79s9MSGt+4Kjr+D8hXU1ZeCoHeVGkNxBx84MfIFuQmwmyXFaOWofVpObHZvkoOJxabW0DQlCTml
	rviDdH+iPO7SuzonSPLUAotM5uUlteFmIJl/J5iLmq5dWnZgxU2vmDj1eOsBrSEmvnb5uVI=
X-Received: by 2002:a05:620a:408c:b0:7c5:6c02:4c25 with SMTP id af79cd13be357-7c79cbeb80emr99554985a.25.1744144023100;
        Tue, 08 Apr 2025 13:27:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFa91aTShNdMl7VmKxRQdJAndH07tT2U427MXJh74EQlfRPx/O/pMOjC+hvL+QXxIcw4lHwVA==
X-Received: by 2002:a05:620a:408c:b0:7c5:6c02:4c25 with SMTP id af79cd13be357-7c79cbeb80emr99549385a.25.1744144022716;
        Tue, 08 Apr 2025 13:27:02 -0700 (PDT)
Received: from [10.187.209.180] (37-33-188-210.bb.dnainternet.fi. [37.33.188.210])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0314b908sm20034721fa.55.2025.04.08.13.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 13:27:01 -0700 (PDT)
Message-ID: <767e11cd-e338-4e00-a8e7-2e15f3da84b4@oss.qualcomm.com>
Date: Tue, 8 Apr 2025 23:26:59 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/10] dt-bindings: display: msm: document DSI
 controller and phy on SA8775P
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-4-quic_amakhija@quicinc.com>
 <20250312-calm-steadfast-cricket-fe9dd8@krzk-bin>
 <654d409e-2325-46e7-a064-ed9e64277e69@quicinc.com>
 <a168a473-c363-4041-8e3e-84fa44e92b10@kernel.org>
 <zpmr6cpiixyu2sj7r7oqpqsge6dcqw6xszldf7ugznmcrxqsme@efiwnggcn5qx>
 <a654d62e-502a-4a47-96c4-a44c14860e54@kernel.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <a654d62e-502a-4a47-96c4-a44c14860e54@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f58697 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gh1egkeLKbPt9jDVRuYeUQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=0U3iGMtbaPiC_UXuCSIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: LmoC_s4vWzQOFnZwGp7LBMnLL8VdLP7y
X-Proofpoint-GUID: LmoC_s4vWzQOFnZwGp7LBMnLL8VdLP7y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_08,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=802 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080142

On 08/04/2025 21:42, Krzysztof Kozlowski wrote:
> On 08/04/2025 13:44, Dmitry Baryshkov wrote:
>> On Tue, Apr 08, 2025 at 01:03:53PM +0200, Krzysztof Kozlowski wrote:
>>> On 08/04/2025 12:38, Ayushi Makhija wrote:
>>>>>> +    properties:
>>>>>> +      compatible:
>>>>>> +        items:
>>>>>
>>>>> contains
>>>>>
>>>>>> +          - const: qcom,sa8775p-dsi-ctrl
>>>>>> +          - const: qcom,mdss-dsi-ctrl
>>>>>
>>>>> Drop fallback
>>>>>
>>>>   
>>>> Hi Krzysztof,
>>>>
>>>> I couldn't understand the meaning of "Drop fallback", could please elaborate it ?
>>> Look at SM8750 example on the lists. Keep only front compatible.
>>
>> Why?
> 
> To make things simpler and shorter.

I'd prefer consistency. Previous platforms use qcom,mdss-dsi-ctrl.


-- 
With best wishes
Dmitry
