Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9597718C011
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 19:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744398184; cv=none; b=WMUlNQPkEtCrhDMjh2yUrYv1x1zqh10JGd2G7CymTWm/iWY75vEqi99B7J5nqSfGjteNZRShn9I/WWXloB7wlJsiYawOODCyPovMaJgWGzm6Eow5hBBIXwNdU74O0i8c6KA8RzNmr7LNJXVymHU3zkvdC7pz6NSoHpK6ulCUvJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744398184; c=relaxed/simple;
	bh=UQQ6vcoB3VC6bc7iYzqFYWKGCwZsMEpWBdA9VyKUiSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mtEjBNemwF3B0MPgvQbaiN834lHd9ERoSl+qdzc9NUxjaBMekRp+VC9cot2u7PSF4GGfMxrGw0mJ3k2R9EOulf12fay6k1T3xhj2ckpDdLlwBvUug4ITmuE/OJW2QN18UM+tkdpeLOmr9dauRQ434DLqK1JCbcJsg2UoLo4hkCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GfWF6Bqk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GfWF6Bqk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BFGfLN013884
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 19:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1vaF2aDcuvUPgXupZj1sVSgz/YB0ZGf0jSIIiOXLx5w=; b=GfWF6BqkdJKMNOU7
	ciBjWgxx4T3PldJrt9Va+elrIY1nOz3yefv2U6MYeUy80liCMngrW8AfWg8JaBvP
	q8WIRIKWWhggJ0QzyvUnMuKCnnQMA5X6c66XsUdFiHiQQQiWv6eoJ2ATXvo9ocfn
	Xpc5Ge6dSaOcQcjw0szgF4/9hZDNkJma4GR1eaaIEuK8lqzpXW6inbZl632b13/3
	sIkHTN9k3COw2YcsdlAIZ8E5whIcAJ/GDmnAB8TwMmcYLw8nfBQDAaBRRoHAzewv
	C4mF2aRse1qPJL8gSBVKMZYHqoqJ/JyLXvQd8JUxJ3RfZdTzZbB6j8+QqMpVJKd4
	zKIptQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbekfv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 19:02:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5530c2e01so35629985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744398174; x=1745002974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1vaF2aDcuvUPgXupZj1sVSgz/YB0ZGf0jSIIiOXLx5w=;
        b=iNt8il6o9hOQztHnG24hfPJ2ypC+acbznABcv1d5svfMetlDP6N/nkrd71NGto0JyG
         4vMghCiP37W5pZX3LvUWEFE1MuChUfKXGBOjFGSy31Dct1vUCPR7ol+ysTvh1dNviRPp
         hyNYFbzsifxoT3TVk5QHg32UtD2mdXqH5kznmwRra6z0BdI7zX0r0E6cBnxDfIbG47fP
         7BOQBppTvZHvP/WnxQubhFfCHndzmgCyIMPC8aA+IHjStNdCrqew+xRFcKrzl7puq4Sf
         FIVImg8uLYJp3h+3O4dEgDxzKqULs2liTInh/qd7nUYxQWyOeABeZS6nP1FFiRIBrPtX
         ROGA==
X-Forwarded-Encrypted: i=1; AJvYcCVZA8fgf+ax7fNb06uvS9LpKW3dZauLqZUGlTZPrNe8kP4zNIpJfpgRVusyKfpbnVr7MaIv0P9dVdfuQF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfKj/57HlKze4b8uWx0Z2SO9BtmRys+fba4BoH/t3iNJGArFWb
	idakkX+X0Eplx1p3PrfQPHO1AoUbv2JRNLURxfMZQPoHFU01criE/aNxYXVdzVAbh4nbp+nZVKy
	F413Tnuwwj85g0H/1Bb4y7OnecXmi5FAOviKNLMUvBlBgrsq6EU+um/84kHSKUQk=
X-Gm-Gg: ASbGnctnvRKsDpJqxLzBbk7SXaXk7WX8DgfXyaTFb3nZLXqBsT+3RgiltAUFVffz1Xc
	Vqotu/5PqfQYoXcb+JVdF0T1ApDQkTLyMZ/Sj7B7BJ4RFDsnE0yiOelXz1MrWOhAKTo80/A4RM/
	lvdM1F3nCmnWEsILKElawuqkw7JjvCRz0Hb9ACkL3FEW+H3nsC8XQXgFJf5YWl6XfEtJAVkdar7
	TwjOOa0bQFlHB6iBs9TOgJoLveqLIvXjqwNfEPd99odP2FmT4y3efyy+aalbKppUJqRXC+XDXRO
	RZSffotAJCq0+1UNDaYH+lVvbGTPtJcPF9O0UzzhKiuU0C6L6RVxPRwp9cDkavbJxQ==
X-Received: by 2002:a05:620a:2805:b0:7c3:d266:3342 with SMTP id af79cd13be357-7c7af0d6f78mr233681585a.5.1744398174181;
        Fri, 11 Apr 2025 12:02:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUNrZb30hikn84frYT3M8TQ5a40xIqc08XkhLasXRgrcJZ3bIfcGeUhPq/L8esoHi8gTSMDQ==
X-Received: by 2002:a05:620a:2805:b0:7c3:d266:3342 with SMTP id af79cd13be357-7c7af0d6f78mr233680085a.5.1744398173807;
        Fri, 11 Apr 2025 12:02:53 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb424fsm477367166b.120.2025.04.11.12.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 12:02:52 -0700 (PDT)
Message-ID: <9295b681-fcd1-4e8a-bfa9-5e7ee80c8fa1@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 21:02:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] soc: qcom: socinfo: Add support for new fields in
 revision 22
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250411095025.4067964-1-mukesh.ojha@oss.qualcomm.com>
 <20250411095025.4067964-3-mukesh.ojha@oss.qualcomm.com>
 <a730e112-b3c8-46a1-a9d7-186d22a2479f@oss.qualcomm.com>
 <Z/lKDZFtJEQEYbWd@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z/lKDZFtJEQEYbWd@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YLmHOjNACpzROsaV4GnDxZlJpwNG960G
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f9675f cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=8k34yVbjjd5OpHI9aoMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: YLmHOjNACpzROsaV4GnDxZlJpwNG960G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110122

On 4/11/25 6:57 PM, Mukesh Ojha wrote:
> On Fri, Apr 11, 2025 at 12:01:48PM +0200, Konrad Dybcio wrote:
>> On 4/11/25 11:50 AM, Mukesh Ojha wrote:
>>> Add the ncluster_cores_array_offset field with socinfo structure
>>> revision 22 which specifies no of cores present in each cluster.
>>>
>>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>> ---
>>
>> So with all three of your patches, you neither introduce a user for them,
>> nor even expose them in debugfs.
>>
>> Please definitely add the latter, and let's talk about the former.
> 
> These all revision is added as part of latest boot firmware's socinfo
> struct version and that also necessitates updating Linux socinfo struct
> version.
> 
> I don't have a problem in adding debugfs entry for all of them however, I
> don't feel the need unless there is already some user or kernel space code
> using it.
> 
> If you still feel like we should add it, let me know, will do it.

Yeah please do, debugfs is precisely for the cases where *someone* may want
to get a read out, but it's not especially useful in general, plus most (all?)
other values that this driver retrieves are already exposed there.

>> What's 'subpart feture'?
> 
> Ah, my bad I did not explain that field in the patch.
> 
> Subpart_feat_offset, it is subpart like camera, display, etc., internal
> feature available on a bin. 
> 
> 
>> How should we interpret the value added in patch 1? Does it expose the
>> higher temperature threshold in degrees, or do we need to add some hardcoded
>> variants for each platform separately?
> 
> As the name feature suggest some of thermal policy could change based on
> this value and currently, this will contain only 0 or 1 and 1 means
> its heat dissipation is better and more relaxed thermal scheme can be
> put in place.

Please add some comments in both cases

Konrad
