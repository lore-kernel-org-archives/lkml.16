Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AB728C2DB
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751300137; cv=none; b=ib+HahTI95w2YCEf0/GQ0IQpx0huvtaVrWZbuY4E7hmhSg7tWonASB2A/XgeN1soXy6VIgb2TfQTYpBnbteb1hpHby3DuJainF8Q9ri+wI/2e2zIcP1YeS8n8Z6O+W9f6psPVit+kgJATLV0+Ni0O+F/mGE3KHRh/xoOpnHF9Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751300137; c=relaxed/simple;
	bh=az5QUBg3paeo4O+KQL7Xcce+9nwdOOaSJbdP+VaTk84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=txCy5q3kpcVHnQF/vyphy5pdfAH4c/rrkpFp0bSxDoFGvmW1PMjwEU3XlVaQUc7Mf3vX1XfW+bcEcLwJvcmdlPr+MtEZsgl0KGpu6OI+cxNgPP8oSRQaUkOve+tf6ANqnTxZo/KH5hVCEVEC81lcl2pifWGZmG5WCMxyJ0+SK4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ti3Gh2d4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ti3Gh2d4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFXoXt008243
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mQQDvBO6LqPQoIi5HwlG43Vm0/0EOI2Xkn06iwnBM48=; b=Ti3Gh2d4RQmncd9/
	egBI0ZyWLS8PHaIpmdWutgtOIc3QymidjFS4CkKnNfsXy4hPkk7D5s786Rifjs2t
	Hoz5WJYmmnx8soCWqG5GcV9dEDbnVldPM/VKi6vjwEOw2Mv3cV1wyQZrheJDrc9y
	Cc5FTZ68uFHG50z/PMBl0dfV7O1MXrkwGj9supMJX5TG8ZMjVsFSSSl5jULK0Niw
	hlSvwsuaJzQOR4hsOaAyJztlWq/Yy2WJoZCNEMvnTIbl9qDH499SPjk4czakNZxZ
	Qhw0scVLkyGwfKcA0V/sN73aBVXcNwkqemsT238Z4k2enr53zIU91Y5k3x+x8s6J
	Nz++nw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kkfmt2uj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:15:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2356ce55d33so63306375ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751300132; x=1751904932;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mQQDvBO6LqPQoIi5HwlG43Vm0/0EOI2Xkn06iwnBM48=;
        b=pqNNqvEzWHDANG57TP1qFDyaSW3egF/OkG43a9LdOmcNq8Ovpl66jnNZrCDRLR8oyc
         6N1R9zO03+7AOAW1gGL/jQOJUDrEq7PSsW04ZKvgOo2ABCAMcz2OyJkH7nHrI+XEctcL
         +tmJHRjjsaOK2Hloy3KPjtGBZsZfaPCkRNqrhwfkwuIu8DKJqodBcYlUB7n0scYq1DD5
         8GPRQBtPQZnoSv1hbe1qcPsuZ+jejv87PklAhxuApEBV/45XatPsmdmPWy/YA4I9My1T
         tXzGa9J09UrSe1c0n8FdnxOMAyzQdq9KoqGbxxvACx5vogvoU3OEBP0dVRhPHPr2UbgD
         AMwg==
X-Forwarded-Encrypted: i=1; AJvYcCUrf/msBzvF4TK5ceJImTRyMTyzpMTydUXCXX1ZtrUROs89IALH90O0sXGWslQTXXmwevCmeEofMMw8bEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJRRSF4zyFBmD7pM1jzVzzRILQjScxIRFk20gE9x5RJlUMpfvJ
	PZyYWu6Q9VtoMQHMZRvLeycsc9+uQWpi8vlabeml2YVT/ASaFohAxcWrDbGm6Ba2oHrOmC/qGqi
	Rf9z5cwJy49dDv2XHdsq5UzR/oaF2+t5gZOb65JBmV63ArCM7XMJO1CMt94RfzUesZGk=
X-Gm-Gg: ASbGncsVajjIX59jmC5hMtFdi9hA/fAylL8Mz04F5PB/HZvkVxdlxp5M7H5dczFgkCg
	T9v2i8DMlzRXI7jaW39LX/4/azNjdEkqV+YYPXqj4SMno8G9s95blhba2fFnzGHVKuG3KSD4zFn
	bkepdVT3dGOYqpQlXaeyR5bQNBibTy4LA1S6V+fxiXHmXD5oAiFJQbPpvTPMpbyrfxs46cMTPZe
	c8QHDtVduu5K7bsAUwFXSN7ZtIrFhUToVZpZcqL8U3J/KVES3SRrcnTDMw+HGEZmFIkXB92UZ3R
	/GFl7a8tb/HY5Pj4ZqydBu4UkSrtPCqLeLUvvkp+f8o=
X-Received: by 2002:a17:903:98f:b0:234:ba37:87b6 with SMTP id d9443c01a7336-23ac40dee6emr209862135ad.17.1751300131833;
        Mon, 30 Jun 2025 09:15:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIs3i+DGQtrPZJHgDp38If8o1rdqI9yiRt+U4S1ECjmkidu5/g+aW0XIiSH1eCUSC/7H2oZw==
X-Received: by 2002:a17:903:98f:b0:234:ba37:87b6 with SMTP id d9443c01a7336-23ac40dee6emr209861455ad.17.1751300131259;
        Mon, 30 Jun 2025 09:15:31 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.233.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f54417f7sm14678037a91.45.2025.06.30.09.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 09:15:30 -0700 (PDT)
Message-ID: <d323ceed-19e2-4b17-b97e-0833f132be16@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 21:45:23 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: Remove sdm845/cheza jobs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, rob.clark@oss.qualcomm.com,
        Doug Anderson <dianders@chromium.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
 <92314f06-e6a8-4882-a31c-914438d7761d@oss.qualcomm.com>
 <CACSVV01AUOp7vZ7kLt+gwxvfv4CYLtAQg6MhUccygbi1NpVJMg@mail.gmail.com>
 <aaaa42ed-989e-43ee-8d45-2908f52e8584@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aaaa42ed-989e-43ee-8d45-2908f52e8584@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: G7FT2Ja8DtP4LDh7dn7Y9nptmPnU_O2J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDEzNCBTYWx0ZWRfX8EMkZZQM0FFV
 B38UvGIZfnAmP1sRQackdOPHni4Jnz63RD7aEglLWUrsFLQjIpiVIc1A4tfOWOFqv1Erzvqs3k2
 o5ruBJsOVNGENfbGkQQi2x0Ki/4As+6qcLRWnEZpLPr+60ij5S06HgJ2YESqvM01HM3a+tIS8d/
 hlixHGoGos/1jVTjMCo1WY4WifbOPSwonDfyr7C9banJVPdtqfzVfodXNbo3xYgjdPoprURPFIy
 McK9PEPd6aPA3V6yVUlXZCKZHd3Kww/b5oaiU/Z9X7tsxXS/daR8+/8GfPtSk+bvBRaQMsREz60
 o0bz4aAxsR8bltpsNhJvEcIgb7uQgkov5QnNclt1GJfhYvt7f7DqwrGpJ/SM+T1f/UsfifAJsIX
 pqbpQ/MuP1aif1zMNncFpTUHiSQvrRqarpbDsxk5WQVD6IyM4mwa4ULImEDJbWcJ0tlzf5m9
X-Authority-Analysis: v=2.4 cv=L9sdQ/T8 c=1 sm=1 tr=0 ts=6862b825 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=rtNiIixKYgeDUDJv+u67mw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=dp0Al3FcNReu_-gFsVQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: G7FT2Ja8DtP4LDh7dn7Y9nptmPnU_O2J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=747
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300134

On 6/30/2025 9:26 PM, Konrad Dybcio wrote:
> 
> 
> On 30-Jun-25 15:46, Rob Clark wrote:
>> On Mon, Jun 30, 2025 at 3:34 AM Konrad Dybcio
>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>
>>>
>>>
>>> On 29-Jun-25 15:58, Rob Clark wrote:
>>>> These runners are no more.  So remove the jobs.
>>>>
>>>> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
>>>> ---
>>>
>>> Do we have anyone using cheza at all anymore then?
>>
>> Probably not
> 
> Adding +Doug +Akhil +Jessica, if we don't have any users, we may
> get rid of it upstream, as it never made it to the outside-outside
> world..
> 
> Konrad

I am not aware of anyone using Cheza boards within Qcom. So it is fine
with me if you plan to remove the DT bits.

-Akhil

