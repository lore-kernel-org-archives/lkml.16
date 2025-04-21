Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E97E3D81
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745221393; cv=none; b=erU0QwYMJHRdicmCjOVyCGGzbd50ECMGwpnlh6lLkjCu+lEJrMQEdu428VaTongjm3C2cQZHoO737dZfTE9aYqiq/y/6pFxyC6roC8Mnm2L9wdYKBKZb9irNJsg5JK8UgvAT4GeNv02QBS5IZdVBu3pzyXEJHwWf4VaJ7Hk0Su8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745221393; c=relaxed/simple;
	bh=zNr0ghVhsv/1Vj+Sp7mLYUgmXNQzQSx/eC0cYZR67mg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UJRJBZTrqlGL8TQtS4DxysXm0bTC/533hwNz/9GT8xbEdwTKRbdr1i7OfQAvu0L3DqWi68zKa6FQztscO/XwHG9/8gqHwDiH8UBwxEiB6PTGvdDjHFn18AyVFqTnLjLWhj6RVvEK+n4dYgF3oWQ33i2v/UFemRLzfsi8pTTHgec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F2yUarBY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F2yUarBY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KNDt89025922;
	Mon, 21 Apr 2025 07:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uda27OR6jl0Qtu3XrSgAsNeJj/Kw9HnJ8gdvEdHRSF4=; b=F2yUarBYjb+LQ3d2
	V2lAUDqrg0jWn0XcZW25Z53FIFZEss70bgzq6J0rz2sAaVMSXaKWrhLMn3qzMGkK
	OkP8x/GUns5LxP6z4cP6NqpuljJlHDCBaXIWVr9WOG+bu7XPWlTX3DkOYD0jDGdb
	9/QHFjuOQ7bF6xn2wmi5hxtEIadNmMOxOFuAKW6OlEG5q62dKaNHyYEAdd67vtdW
	sAsU2axmFuRsPeXwis/869V5OgFJ5pPfq/r0keXgZ0UNAzfbim0RXhP2XPtb4mfj
	2YI0yXga7KIHKKTGaNykWuRDA0Taai3vJra0MwJh6fpr2UWEtBZiN2GomoPWP/CC
	OWa0Yw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 464426kb2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 07:42:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53L7gghw004059
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 07:42:42 GMT
Received: from [10.239.132.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Apr
 2025 00:42:39 -0700
Message-ID: <cedf31b0-e639-4062-bb65-c36d36da7e5c@quicinc.com>
Date: Mon, 21 Apr 2025 15:42:30 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm, slab: clean up slab->obj_exts always
To: Harry Yoo <harry.yoo@oracle.com>
CC: <cl@linux.com>, <rientjes@google.com>, <vbabka@suse.cz>,
        <roman.gushchin@linux.dev>, <surenb@google.com>,
        <pasha.tatashin@soleen.com>, <akpm@linux-foundation.org>,
        <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>
References: <20250418061459.3898802-1-quic_zhenhuah@quicinc.com>
 <aAJtFwAH_ayIJ-SR@harry>
Content-Language: en-US
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
In-Reply-To: <aAJtFwAH_ayIJ-SR@harry>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QdMRYimzp7ELfGaPx9J1Lx3SlfpZrx1O
X-Proofpoint-GUID: QdMRYimzp7ELfGaPx9J1Lx3SlfpZrx1O
X-Authority-Analysis: v=2.4 cv=IP8CChvG c=1 sm=1 tr=0 ts=6805f6f2 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=yPCof4ZbAAAA:8 a=tUVUhsVVWxwbZEqO3ecA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_03,2025-04-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210059



On 2025/4/18 23:17, Harry Yoo wrote:
> On Fri, Apr 18, 2025 at 02:14:59PM +0800, Zhenhua Huang wrote:
>> When memory allocation profiling is disabled at runtime or due to an
>> error, shutdown_mem_profiling() is called: slab->obj_exts which
>> previously allocated remains.
>> It won't be cleared by unaccount_slab() because of
>> mem_alloc_profiling_enabled() not true. It's incorrect, slab->obj_exts
>> should always be cleaned up in unaccount_slab() to avoid following error:
>>
>> [...]BUG: Bad page state in process...
>> ..
>> [...]page dumped because: page still charged to cgroup
>>
>> Fixes: 21c690a349baa ("mm: introduce slabobj_ext to support slab object extensions")
>> Signed-off-by: Zhenhua Huang<quic_zhenhuah@quicinc.com>
>> ---
> Acked-by: Harry Yoo<harry.yoo@oracle.com>
> 
> I reproduced the issue locally and confirmed that this patch fixes
> the issue.
> 
> Tested-by: Harry Yoo<harry.yoo@oracle.com>
> 
> By the way, I think this should probably be backported to -stable?

Thanks Harry, I'll send another patch that incorporates Suren's 
suggestion as well.

> 
> -- Cheers, Harry / Hyeonggon

