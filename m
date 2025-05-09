Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696EE21D3F6
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 22:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746830782; cv=none; b=KIDJ0Hg9ew+9dm4dguWyFvUZgu17WItr0Aj3nRM5YAZieQnCbwZB2E9SqpU/IaZEyNU6MeudYqQULWv8vzwVVv13mDDGLVQVivZhOkj93+Xq3XtfnnoEXtysKWLmd7QKO4TosJYhqfU+xPKi3ikEvSVaZTLgmeeCU8G4pmLaOGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746830782; c=relaxed/simple;
	bh=LmhzGq5CA+i9dw0Q9VRHgaeexbUXN7cdMz8Ehua8V24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UqfgSxsXXnoXRPag5eSKPEqBbke5pYfZe1UNpLc+mDtHZNkB0eFiWahxhz4uSlbDDMKkVT7cnv2czSvqfPfVNPy+poWXaLmh0UHG7c29aP/YCC76/1Q96buaUp+5BeOr5YajGHScCI93oZpuQEX3Ys4fueutouTG8Ll/2NLsVAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVJwUiIH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVJwUiIH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549CQkEe009505
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 22:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XmsX3zVPd1MJ+C/O6PKN+I4MPkP+RNbt3dycecHyCTU=; b=VVJwUiIHaWKTi23Z
	FlkN8b+QEkzSnp4Nf0y2v4e6xnmzJjRB3eeDvAvIh0zxNY7CAxC1FJsFd3l3SjHa
	CDEOSAOqZ4GoczhE3dfyILL3sjtSOv4D1ZgIv2MS+ejxBkGffL19m1G4rYRi02dH
	NJo/gzMctJKlKAVhQHzMu+WCnlHxSaIZRDZKM1RCCtNVGKM5NJBCqxKVnc5u2dAf
	02Sp8ct/kxdQIcvWTw9EtDSsSIinz5DI0BB3WfY9lW0ejFubiMMIUxK+DIHxUdad
	cglsclDWTVc4sXojIVetXSxaa+PPKaqnfvb3YPA+68fu0gOWjiPTsEhOh+tgGszx
	ITmDSw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpewux9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 22:46:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4766654b0c3so7940701cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 15:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746830777; x=1747435577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XmsX3zVPd1MJ+C/O6PKN+I4MPkP+RNbt3dycecHyCTU=;
        b=viVT6nAFg9lHDKn1hcP2JFChmaBzf+U/KCkqp3uvOsO+l5KpbeanHiuJHvckAxtxl6
         ZQ4QbmsjpJdmxZbP2BP4zWd4YodPl9I0PLcWaQEPUU2M0vyX/QiVXqFwCHBDCraSClrF
         rByhRiy/xxrXX5AJklGK0M3Kn87RvpRCzsETNMyyCv6uX0RnPuSRmPM+AyQa6LRdGW1L
         tO0mjjbvjpokqfZLu2HcxIlVH7jcJwrgNcsUuoKC+gbn/47wQj7YN/M87Nqjdjr5OCB1
         vfB3aG6djxoEObQDng+T/T2WXkKghP9nxTUSApLW8G4bXJQTLgf5fpKpaCcF+GTFWeHL
         hqxg==
X-Forwarded-Encrypted: i=1; AJvYcCWslUfCdvV6BSJ3+rzaTRwtPPOnAU2z3aQSDoOPBLahN2BchJ1m07WTlQNPctN64wivX9we0IB5YYLeUwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKX7pi6d/o6LtWbwmhxm0keEsRtV5eaMAZkFy1/kF3uXwyT1iP
	Z2kzqlc/NGwcIipjFGaPZJC/cpDbCZG87R17Y+1L1RrZSk32WB+3ulpSzwK/XsKPWe5ejsR+uQ3
	ClorDktZQOJc38gR+1uKbFHh+6m2PuJfnMiMpFYOttGmNbaPnjQsUyFXoC49xWGHZVn815vY=
X-Gm-Gg: ASbGnct5vw82HU2GrZpRtnwwTjJ6Qu5SJeSY8UOc2MH9RhqGPT9CtKrWaG3776WU6IG
	TirxH5icHWTohuTEh49zTwrtokCi+GQru0YmdzTkB7QLuRgiPpf/QZsYav1REGVfIwn3OgCC7lv
	hRMvOc+7zDYwq60LG1zZ+sJ8J79xT9i6WJAcA7g+zL3uEJSh7Rj5I529IW6x1bHKo9w+pH5d0Uo
	5zDYSL/jwDgqjJatOBj4gRxMhh1fOPAldru9x5Gnw6jDg8YxcdjfH8jvZ2mn/ebh9jHtGCAQFlO
	d/DOELF2r3Xqmg5Fd0/lB4Bsdj2gZds/oEiKjvrf7CrUBJbY+vrlx25LIZraDc5S0c8=
X-Received: by 2002:a05:620a:2628:b0:7c9:2465:8731 with SMTP id af79cd13be357-7cd01042d16mr316449385a.0.1746830777047;
        Fri, 09 May 2025 15:46:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8mB29rNz9EPmqNSAKWxfwN3Ge2P5PmnwdY5r9Sv1sWFQYXOYKiy7Tvg31K2gb86LZkyrP2g==
X-Received: by 2002:a05:620a:2628:b0:7c9:2465:8731 with SMTP id af79cd13be357-7cd01042d16mr316447585a.0.1746830776665;
        Fri, 09 May 2025 15:46:16 -0700 (PDT)
Received: from [192.168.65.158] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad219345735sm218522166b.64.2025.05.09.15.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 15:46:16 -0700 (PDT)
Message-ID: <aa864626-3910-403b-a7f6-b3d86b4ed423@oss.qualcomm.com>
Date: Sat, 10 May 2025 00:46:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] soc: qcom: socinfo: Add support for new fields in
 revision 21
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
 <20250425135946.1087065-2-mukesh.ojha@oss.qualcomm.com>
 <mc6n7fbhjhe6cxyoqkxs23kjs7gsa5cihy6qwrcrnz4g3kwjms@vh3vfqzfprw2>
 <aBzPn2OXapJLsikk@hu-mojha-hyd.qualcomm.com>
 <s5fd3txerbwgzzgqnoovkffmijgub5dxfucqqskhdqyjqzkbyl@5cyycrfmubup>
 <aBzgaKSspA0Af0sZ@hu-mojha-hyd.qualcomm.com>
 <03409f08-9612-40be-b8b2-6cebd5acd0a4@oss.qualcomm.com>
 <aB3TkK7wEjdxSSvQ@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aB3TkK7wEjdxSSvQ@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDIyOSBTYWx0ZWRfX3dc33+jkecmW
 +BM9X2vsgrJnjT77E4x8E+TT393j2DwPa3ZKUPiWJnkhx+jk4vyloh+QV/VYe6MttlIwPIP85F7
 WS/JaxzNutQqjJm02VgfH0/i3z0rq4sYvP2dBablGXR8trcN5Wbsw9lsYFohkAMIRw6c4GRAEO5
 4FLwi9/wKxmhd3Rrrg4chMx4vXEjlEQ6oO8RLS0xai20OJXGs5WfhbgqW1xKwjKaXFC76CszIEj
 hmemn0LkYVAfGJ71ryqxEPW+1/3mT861AG27AB4xY3ucUvaya5EE9lcz67SY9HCglTkV39FkPJU
 7FU9gZ4glauJPFoPY6YIXHzeuHLawZZiU55revDH6GbfnUgTyB/U7kt/m/Bz/1sktIcLzHRnx2J
 UO2AsoOuPyWu1B9uEAG+7mb8Gsz2UNGmQxjPSyiJkNO2Qk3y5ZuW1rWo/Gmj9c+IAJBCFPbN
X-Proofpoint-ORIG-GUID: k_pgMcrgwAfllCengMddFVOMimaLBfhE
X-Proofpoint-GUID: k_pgMcrgwAfllCengMddFVOMimaLBfhE
X-Authority-Analysis: v=2.4 cv=Yt4PR5YX c=1 sm=1 tr=0 ts=681e85ba cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=IPssWVxA-tG6VVCJEEYA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_09,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090229

On 5/9/25 12:06 PM, Mukesh Ojha wrote:
> On Thu, May 08, 2025 at 08:01:44PM +0200, Konrad Dybcio wrote:
>> On 5/8/25 6:48 PM, Mukesh Ojha wrote:
>>> On Thu, May 08, 2025 at 06:56:47PM +0300, Dmitry Baryshkov wrote:
>>>> On Thu, May 08, 2025 at 09:07:03PM +0530, Mukesh Ojha wrote:
>>>>> On Fri, Apr 25, 2025 at 08:28:51PM +0300, Dmitry Baryshkov wrote:
>>>>>> On Fri, Apr 25, 2025 at 07:29:45PM +0530, Mukesh Ojha wrote:
>>>>>>> Add the subpartfeature offset field to the socinfo structure
>>>>>>> which came for version 21 of socinfo structure.
>>>>>>>
>>>>>>> Subpart_feat_offset is subpart like camera, display, etc.,
>>>>>>> and its internal feature available on a bin.
>>>>>>>
>>>>>>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>>>>>> ---
>>>>>>> Changes in v2:
>>>>>>>  - Added debugfs entry and described more about the field in commit.
>>>>>>>
>>>>>>>  drivers/soc/qcom/socinfo.c       | 6 ++++++
>>>>>>>  include/linux/soc/qcom/socinfo.h | 2 ++
>>>>>>>  2 files changed, 8 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
>>>>>>> index 5800ebf9ceea..bac1485f1b27 100644
>>>>>>> --- a/drivers/soc/qcom/socinfo.c
>>>>>>> +++ b/drivers/soc/qcom/socinfo.c
>>>>>>> @@ -154,6 +154,7 @@ struct socinfo_params {
>>>>>>>  	u32 boot_cluster;
>>>>>>>  	u32 boot_core;
>>>>>>>  	u32 raw_package_type;
>>>>>>> +	u32 nsubpart_feat_array_offset;
>>>>>>>  };
>>>>>>>  
>>>>>>>  struct smem_image_version {
>>>>>>> @@ -608,6 +609,11 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
>>>>>>>  			   &qcom_socinfo->info.fmt);
>>>>>>>  
>>>>>>>  	switch (qcom_socinfo->info.fmt) {
>>>>>>> +	case SOCINFO_VERSION(0, 21):
>>>>>>> +		qcom_socinfo->info.nsubpart_feat_array_offset =
>>>>>>> +				   __le32_to_cpu(info->nsubpart_feat_array_offset);
>>>>>>> +		debugfs_create_u32("nsubpart_feat_array_offset", 0444, qcom_socinfo->dbg_root,
>>>>>>> +				   &qcom_socinfo->info.nsubpart_feat_array_offset);
>>>>>>
>>>>>> An offset into what? If this provides additional data, then the data
>>>>>> should be visible in the debugfs. Not sure, what's the point in dumping
>>>>>> the offset here.
>>>>>
>>>>> offset into info(struct socinfo) object.
>>>>>
>>>>> I agree to you and I said the same in first version this is just offset
>>>>> and does not provide any debug info we would look from userspace.  For
>>>>> parity with other fields I did it for all newly added fields.
>>>>> I have dropped it in latest patch.
>>>>
>>>> I'd rather see the decoded structure that is being pointed by this
>>>> offset.
>>>
>>> You mean info + info->nsubpart_feat_array_offset ? 
>>>
>>> There is more to it which I don't want to mention as they are not
>>> upstreamed yet and unrelated to this change.
>>>
>>> data = info + (offset + (part * sizeof(u32)));
>>>
>>> e.g., Here, part is a enum represents camera, display etc., and data
>>> represents their feature presents. Since, part is not upstream yet I
>>> don't feel we should expose this information to debugfs. We could always
>>> add them in debugfs when such things are standardized and upstreamed.
>>
>> That's what Dmitry's saying - just add support for them
> 
> We definitely add support for this in the future.  In the meantime, does
> the absence of the support prevent this socinfo field from being merged?
> Without it, there could be inconsistencies between the boot firmware and
> Linux for the SM8750 platform.

Why delay adding a couple struct definitions into the "future"? I feel
like we spent more time on this thread that describing them would take

Konrad
