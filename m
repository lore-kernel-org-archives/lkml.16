Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F98D2907
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 00:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743641653; cv=none; b=TsP6vhKmRi7BXdZzZGve2RF1+QQMCxnaFohe47pjnSOP4qZGy7czVS7pgTTo50OcWUqcokpl9avYTEZBpfBCKGA/Kjb1GgKchPFbhN5Y+5AbYsje5RE+XbsEOo4b/+m2XvF5eTB8gahbWX0NjAAA4iOo/kb+F4sSExMGy8H875w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743641653; c=relaxed/simple;
	bh=xljT8NtzhHE5BHK2IoVjq3bgJH4GspsFbCyqmf0NG20=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=l6F/kwohhbZEuRBN35nozF3W8LZQR/FliQxys8OS5FYIvLdc1tQOGBj2ZXeuKjVQrDPiNrkZ/8OByvYCkGiwPKe270WVRa8GVC3k4M390UM06mWgHXJCFNlNdzS2vnt06gcOlL6RBXw0/2RZq43XD3r5+chghfhOvpc0EPlNvOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i70vckDx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i70vckDx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532KD4Ga009884;
	Thu, 3 Apr 2025 00:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uer0RfSroTyaMMgudcavQQBrWzkwUHa+awFpTFXVkX8=; b=i70vckDxE//X8lw/
	wz/r3KZ3iiiTM1gKzGfsoHjGblt7gu9el6ELqtL0djDdHuOKF98EkA9CiqUP7kyo
	1QiMW8Uyr/D4MYpH7IqcbMJbx1lO9dnmzug4Ij7V0GsBiLDNoAKfoR47w36KNVBf
	ZZBORWr+5nujUTETNL/JsNryVsR5fMOyMpsSuoo632OR6PLLBRZZ3n+A3v2uAHfC
	XiF20ns0gOc5fZ8axocqv8yCGm/CkJRxgJMo3U2p+er8xyHwHVIzcf9e0vmzJldy
	57Yjl0Sxtp0E0jEbJ3HUE7MHYjNspglQMVVXZkQeK612+sKeeXO1t6+/TZbBJtlK
	QYY6lg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45sc2yrey9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 00:54:00 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5330rx8K022776
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Apr 2025 00:53:59 GMT
Received: from [10.133.33.117] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Apr 2025
 17:53:57 -0700
Message-ID: <98c1acbc-7e14-4aa1-9c1e-831be9eb4c91@quicinc.com>
Date: Thu, 3 Apr 2025 08:53:54 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] coresight: core: Disable helpers for devices that
 fail to enable
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>
CC: Yabin Cui <yabinc@google.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20250402011832.2970072-1-yabinc@google.com>
 <20250402011832.2970072-4-yabinc@google.com>
 <CALJ9ZPOvcxswvfbpWkXgJ=WL+HLa33nm0ZzHogYNZ9keXfi1MA@mail.gmail.com>
 <20250402133232.GJ115840@e132581.arm.com>
 <CAJ9a7Vg4DGzPhnSBh2taTgUTORMY3GUPpJY2bHjkMdFB1=wP=Q@mail.gmail.com>
 <20250402141228.GL115840@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <20250402141228.GL115840@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=AMoviu7M c=1 sm=1 tr=0 ts=67eddc28 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=kdkFstmWLiu210ncHx0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: KcGwo3aitrWkFLNwy-z2p51p0dX7CYSy
X-Proofpoint-ORIG-GUID: KcGwo3aitrWkFLNwy-z2p51p0dX7CYSy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_12,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 mlxscore=0 impostorscore=0
 clxscore=1011 spamscore=0 phishscore=0 mlxlogscore=927 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030001



On 4/2/2025 10:12 PM, Leo Yan wrote:
> On Wed, Apr 02, 2025 at 02:50:22PM +0100, Mike Leach wrote:
> 
> [...]
> 
>>>>> @@ -465,7 +465,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>>>>>                  /* Enable all helpers adjacent to the path first */
>>>>>                  ret = coresight_enable_helpers(csdev, mode, path);
>>>>>                  if (ret)
>>>>> -                       goto err;
>>>>> +                       goto err_helper;
>>>>>                  /*
>>>>>                   * ETF devices are tricky... They can be a link or a sink,
>>>>>                   * depending on how they are configured.  If an ETF has been
>>>>> @@ -480,14 +480,8 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>>>>>                  switch (type) {
>>>>>                  case CORESIGHT_DEV_TYPE_SINK:
>>>>>                          ret = coresight_enable_sink(csdev, mode, sink_data);
>>>>> -                       /*
>>>>> -                        * Sink is the first component turned on. If we
>>>>> -                        * failed to enable the sink, there are no components
>>>>> -                        * that need disabling. Disabling the path here
>>>>> -                        * would mean we could disrupt an existing session.
>>>>> -                        */
>>>>>                          if (ret)
>>>>> -                               goto out;
>>>>> +                               goto err;
>>
>> Going to err here is wrong. The comment above specifically states that
>> we do _not_ want to disable the path, yet the new code flow disables
>> helpers.
> 
> Okay, now I understand here avoids to disable source and links for a
> sink error.
> 
>> then falls through to coresight_disable_path_from() - which
>> the original code avoided and which also disables helpers a second
>> time.
> 
> Seems to me, the conclusion for "disables helpers a second time" is
> incorrect.
> 
> I checked the coresight_disable_path_from() function, when the current
> 'nd' is passed to it, it will iterate from the _next_ node after 'nd'.
> 
>     /* Here 'nd' will be skipped and start from the next node */
>     list_for_each_entry_continue(nd, &path->path_list, link) {
>         ...
> 
>         coresight_disable_helpers(csdev, path);
>     }
> 
> This means the _current_ coresight device (here is sink device) will
> not disable its helpers.  Could you confirm for this?

It seems there is an exception that the helper devices connected to the 
sink? The sink device may not the first the device to be enabled in the 
path if the sink device has a helper device.

So I think we should add following logic before return?

                 switch (type) {
                 case CORESIGHT_DEV_TYPE_SINK:
                         ret = coresight_enable_sink(csdev, mode, 
sink_data);
                         /*
                          * Sink is the first component turned on. If we
                          * failed to enable the sink, there are no 
components
                          * that need disabling. Disabling the path here
                          * would mean we could disrupt an existing session.
                          */
                         if (ret) {
				/* disable the helpers which connected to sink */
				coresight_disable_helpers(csdev, path);
                                 goto out;
			}
                         break;


Thanks,
Jie

> 
> Thanks,
> Leo
> 

