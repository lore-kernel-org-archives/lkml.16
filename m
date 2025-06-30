Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1F0257427
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751280073; cv=none; b=ixQHc6O9BSTb0P65SOftpbJQH44X2QF11N4KsDANb8JRI8D9W3FL90uS5NQRYpaCvAhTXx2MCMj3Vq5UmYyI0FL7pcIS3uhYjqh4p7v33QNTutxZhdglWqOHdqC9+Ue1ybs8YlkqjI/04nNpdjJRHPMNGyZMmqdrKMX5vxEXG5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751280073; c=relaxed/simple;
	bh=e7pfmBcZztrn8HiRnhViHIspvCi9I+/6KQ6gjgbCmqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qbN9BGhHLJscx6bTVmWdyqkGpvdFzXaHnUqqRkudNLMnsrxv21AtZ48K7ukxpRGlTjJ6xE6bUy/Dpo3NCRlnjv+8w9xDIiWc4IT7a2DzTdCKFPX5JwVaM9HlpMAbBUAB2y4vc56Tts8rFxvt1fURqUpfIXiWesXaGhSM9AnAuF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QDsGmyAH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QDsGmyAH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8DNLg024817;
	Mon, 30 Jun 2025 10:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bp5ploKNWkv4DSMKxE+2dNUK9PlXqglN+pouAyoCECI=; b=QDsGmyAHARqblrRM
	uU7JVeSVRXyIZk0McqDVtVkHr+AfE7e4vuZ6/6+W3LcW6+dqJzaLuHr0LQAOe5W+
	qjRP36Q9HOSP8IRxyZ4Zd08MIg3+D6e+Zm0ANdEy/NbiEf7oW6bQNAXCjG2w10bs
	sgkV+s53aW8roZDZWub86FABP0Z6faujTYebSGdAhpQPDvkx54n8szvD3u+qhWDi
	Iwf+aL2XVqOD938TKIMkbg0/vacbHk2wit6frBgbyDnU5iHBuj5aHHZ6IB7RPrX6
	L2rE04jDwi8sc6ILl/1IE3Rry9LNq9qarCvytkzNAAcJZ5vdfHNpQzmnW7c7rnAa
	LZFKaA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9cbaq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 10:40:58 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55UAevrH019798
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 10:40:57 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 30 Jun
 2025 03:40:55 -0700
Message-ID: <5f2527d2-be55-411b-a79b-f628e9fe7f06@quicinc.com>
Date: Mon, 30 Jun 2025 18:40:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight-tmc: Add configurable timeout for flush and
 tmcready
To: Leo Yan <leo.yan@arm.com>, James Clark <james.clark@linaro.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, <kernel@oss.qualcomm.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
References: <20250627-flush_timeout-v1-1-2f46a8e9f842@quicinc.com>
 <78f2179d-26c2-47f0-bc19-b72e5e51ad29@linaro.org>
 <20250627141745.GS794930@e132581.arm.com>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <20250627141745.GS794930@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=686269ba cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=Ft20jaeptSDJms2dInEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: cfYfjx0hB6_5WUAaZKslL-KI0exlZmlc
X-Proofpoint-GUID: cfYfjx0hB6_5WUAaZKslL-KI0exlZmlc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA4OSBTYWx0ZWRfX/viCJKYjn96H
 Tkwg+xIC72yGaV8pS0FGZuAoQ2jZyLOK9383KALj3FJEjgQ8DdJqwlxvhwgehisI1pfrWdx7UMA
 7KsvIySZaS8GARtGjTbs/j1/iI0nJ3lU9CfgdMkA7akkcK3nQvtG+ZMwxE5F0Y3x8D9OzcCTIZO
 gEmbVNDHG878KYAAW/vxLTDsgxt36Gj86ZGwTx4FX9Aloi/aN8boIxzI4B7iZrsDTk6wx0XcaGN
 gXMF3qIXLmODFCpxb3IUGUx7HogsA/Zhc7AHlR15Q1/QGmgHeNA0dQkR82XiKRDrzGeaFmXwKiy
 FlkcT/KBMSkO5CSfFAeGLsVeX9zUkDt36XN2zk3se1iGK2Nk5YskBQBz6x2PpsFGrZQWkzr2Zzw
 KrqG4ubGbREbs/wIAk8iLVLbFKsHszl9+438dkv/YleZbJeYKHMBh0x326F0QfUVAVpBXFfX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=568
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300089



On 6/27/2025 10:17 PM, Leo Yan wrote:
> On Fri, Jun 27, 2025 at 12:23:29PM +0100, James Clark wrote:
>>
>>
>> On 27/06/2025 12:10 pm, Yuanfang Zhang wrote:
>>> The current implementation uses a fixed timeout via
>>> coresight_timeout(), which may be insufficient when multiple
>>> sources are enabled or under heavy load, leading to TMC
>>> readiness or flush completion timeout.
>>>
>>> This patch introduces a configurable timeout mechanism for
>>> flush and tmcready.
>>>
>>
>> What kind of values are you using? Is there a reason to not increase the
>> global one?
> 
> IIUC, this patch is related to patch [1].
> 
> It seems to me that both patches aim to address the long latency when
> flushing the TMC, but take different approaches. In the earlier patch,
> both Mike and I questioned how the timeout occurred in hardware, but
> no information provided about the cause.
> 
> I would suggest that we first make clear if this is a hardware quirk or
> a common issue in Arm CoreSight.
> 
> Thanks,
> Leo
> 
sure, now this issue has been found that not only CPU ETM, but also subsystem ETM.
> [1] https://lore.kernel.org/linux-arm-kernel/CAJ9a7Vgre_3mkXB_xeVx5N9BqPTa2Ai4_8E+daDZ-yAUv44A9g@mail.gmail.com/

