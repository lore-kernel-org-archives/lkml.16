Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AE02900B6
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746794390; cv=none; b=EN5Svwr2YXM0IyUVBKjidNBQtXC9IS5j8HTO9ZjEMz788LZQX5PH6c3dYJQhfnHURExHsrf1bELWe6oKWFXrTR9qJL4DoBsaKe+LnxynFX5odASIa8s396BX4T0BQ1fwnzvKJmXBANZ+Mz5MCah2YiOZ148Rg3yCZazBBWBuRVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746794390; c=relaxed/simple;
	bh=/yVwv3WnxQrh5A9TkAjLUuCLJpOPoWAN+elytrliOlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HpKtWh1cAhy7BYjuPOrWN3BvcV3cN21hCzom4UjTax2w6JQ2UgglzRAJ3fGxXFhILAOKdagXZyypxpevPZSO13EXeTjSGA4ouopGL4p2YertIW6j/X0AYtDCQVTMlBRhGf/v8+88RmrpsE27DVz+DIJN+vQyiibAqu4B/WoGpvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnLUUF76; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnLUUF76"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5498Qj3G024844
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 12:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4G1RV5OSQbBgLbkxXdEz6RKY+uaAPac1V0RoEspl1mc=; b=KnLUUF76t2PuxaRe
	ypLdVnGyaLLu66zSCesTwxcmWkL0OyupdYnP85RjBJqaRGr3Y9mUdsW+WGmBbHZm
	wws1I6B3PDr+y9fMgwCJb5FCfEkN8nQux7Ehj8rJ3IQjl32nEaRzJ1u3BprW+mOo
	V2LS3XUHbvTAglhtFTLVcH+eM19dSORNU1foWMKmfzu+zdhQZ4lLFfcgZg04W8An
	VlF+ir97v0BI3kxI6xJzWKEvOcamssCsPKrjRjcsQhRPtUyjQ/6hIz+c2c1GtnjE
	KTum0rXo7u6+h16SjVjI6XOvOhY5pcWGcl6CeIK9gs7SVOyS9JrWusCcMu2UMqgw
	/aeATA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp84qc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 12:39:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54734292aso56715785a.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 05:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746794386; x=1747399186;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4G1RV5OSQbBgLbkxXdEz6RKY+uaAPac1V0RoEspl1mc=;
        b=wexZfatsKIpFXU4FIY/OwCDveRmLCJAXRqbWsq9dzIz/bgX3YYu1ll3m3BwUvB6x+N
         YPc9Rzd/XNCz6EJmA9NGt8zOwop5j/bmrExtnmVRePLSowJUL/HOkj69aDa3mnJKJQ8L
         l5NFlxRu751vVbKnOvQJucP8bdpSbavvBxGxkhtoQfrhw2NQa+UYJgwGxcnFUo5by4vh
         B5lLtDSrfLMwqmm7nGaSkz0qP82MIZzHJSU3nV+ORoKhKiV3aHoUgNvGcntLeLklVC6E
         9MeoiL8XtF7HdC65UajNTXBB74gAHcV4MgNzkbBXl+GYRA+J4jQmv5MwYXdMHSclqyg9
         yaNA==
X-Forwarded-Encrypted: i=1; AJvYcCXkKP36FgsSxuWDCpWeIH7utoHXBtRB7O7eZGD0v59H4EnOEnjKiEfi3ilmOyiP6++QCq5Dd9iTVdyEc14=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX8zDe/WtOhjwDIryZEEjrbt2MCOlM0IhkG3s9t4dNVqYwIWT6
	D1h9ZkWz+xIZvvEI+EY2VC7h+SQZzJ9pquQVZw7/LPOE7xfFNG8vWwYcw2XTcJVrrSe3/UhI5Br
	20bG8QMfTZNYqLHfmm3NFfCgA7+ELXUcaAidQIJiUL6Y5YBqaVDfbY+q4vGzIqhA=
X-Gm-Gg: ASbGncvDOLsh+z+JYOBgFruy8TO0yInU8ej+qqoSCUs6c68dl0pwFz3fuiIaCvqkq6s
	eIA3FFe61/9Pi0KdOcTQONmc9nlfqr8agpK356gt5BbNtHgGPvyBf5YiRPOGXQOFdHlZ46+uTnw
	mB2kK+vsJlQcvPTXxlyiNSmsDtZvOiXUtJncNEwZEnEr7uWyQh4jS3c67YwHO9PUiQFhfgwwPL1
	AOkSjR193Sn07UWcKWxJu5mpiGGffPvBPrno7sH13dfxvIjoWw5TM3hM5yOrL3PNtJUR6hWewZY
	gqdf+RAX5nEHG3d4HmBothwUtSETbzmq0Wx18L8cnvfPbWeOEoBQRhqsPdrNGZ56D9I=
X-Received: by 2002:a05:620a:270a:b0:7c0:b106:94ba with SMTP id af79cd13be357-7cd011186f3mr194764285a.7.1746794386264;
        Fri, 09 May 2025 05:39:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhQplMN/T2Kquk8OAgFmlti7cmfd722WmVfsRvtwRfluidvoeB7ua1lUBaXYSIjte577KX6w==
X-Received: by 2002:a05:620a:270a:b0:7c0:b106:94ba with SMTP id af79cd13be357-7cd011186f3mr194762585a.7.1746794385893;
        Fri, 09 May 2025 05:39:45 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad219746506sm143082866b.88.2025.05.09.05.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 05:39:45 -0700 (PDT)
Message-ID: <b374b468-819b-4f5a-9ecc-0926c3696db3@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:39:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 07/14] drm/msm/a6xx: Resolve the meaning of UBWC_MODE
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-7-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7H9_EkGFkjL1MRU9M-_YFHnPb5v9SxDg6fXm0m-imzC2Q@mail.gmail.com>
 <1f6fcbed-c7c4-42c2-814b-3834b08c5977@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1f6fcbed-c7c4-42c2-814b-3834b08c5977@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=681df793 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sEJkFV_Ntms1zBwlKkIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: LzcDvv8d0HX2tH-J-sJ4AyzaCdJoRgZx
X-Proofpoint-GUID: LzcDvv8d0HX2tH-J-sJ4AyzaCdJoRgZx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMyBTYWx0ZWRfX0YoHHFtKVh/g
 p8TsVQTWC5ToEdylp3YdiUxUkgAHDpy3JrnoCXWcqYOpMddJEWEW6Be2L1ecXpBL8n9oqOrANdJ
 uNolwjfMIuTXVe2LTGDwSHmCpUTqawm9qcAp3m/zOFLdSbXYI0O1KK7xoP0+FcFubRXxbKWezvo
 YqYQWHDCmfxoVlD3iKOTO3pr0PUO+gOCOcBnnJN8FGDmVRptGEURXrbSfWO39wbUr/W+KT9c1GD
 rtBHGU6ip5qATAZDk2FFDzSm2oZ3xnBF2zcN074a68YUKW4b7n9zb/DecjVpHMRobn+fU4oyRb9
 RoSMXaMtneKpjCTARuCtKIidiYaO7bvzFMP0nOACJCl5jrHF/nQ/o/wJZau7XT7rSmMhWj3PEDM
 VDeA3cHBr12b3aCHnhOLyZrLWF8VFpvE2lw6Mxe3CxA3mFAyFyiRZLoVtjYcRKwJ4i1lEtVW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=889 bulkscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090123

On 5/9/25 2:37 PM, Konrad Dybcio wrote:
> On 5/8/25 8:25 PM, Connor Abbott wrote:
>> On Thu, May 8, 2025 at 2:14 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>>
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> This bit is set iff the UBWC version is 1.0. That notably does not
>>> include QCM2290's "no UBWC".
>>
>> While this is technically true, AFAIK the only difference between UBWC
>> 1.0 and 2.0 is that newer UBWC disables level 1 bank swizzling, which
>> is why I originally wrote it this way. There's a bit of redundancy
>> between the UBWC version and ubwc_swizzle bit 0.
> 
> It turns out to be a hardware matter

Well you just said that.. in any case, i can do either (or both with a
sanity check)

Konrad
