Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9714E221FD5
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747991180; cv=none; b=sKp4upVIzXs/1qLKCWqkaLgV46KAunXrm2GwFFDKpKyO8pyesdqzQnKJqC3038KMBLy5bMMkr3Yq4RK/AwYvjDy1Nxu1rBdNrBKRKnuJpzT1XBHQBjh3GBd/VY2MJbchxB6SQCCwyfaK/ELT6RLmIfflZwOl2QA7+BKrYfk4IY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747991180; c=relaxed/simple;
	bh=gEDYckMFBfy3roqQQJAGLMrYC/JFfFZZvOmfC03dcQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2sBO/q8wbT3fyyQoFECDcm554wJtCVvYAS5o5/rtHmmWSCQBJDubFELi+SBuzhcxRuBi+gKzZHM3S9XXftqIdVszMoBqGNHlzXmoTgAr+luH39LHWKm0UWWMhYBQ/qsTj6M4pCPVNlO4ypYhGduQZM2lMehKyrUY4X7oU978sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=SkOFV92L; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="SkOFV92L"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N8tsLO025614;
	Fri, 23 May 2025 09:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=MFXFhy
	j5hZxVtHrsYoZGkrhBWl4qMvZabBrBeFVnmy4=; b=SkOFV92L3XkU3OrDFZIaDy
	mRRMg6VPDYqGjxpcG0jq+sViECUf7byqgTzcaTpHG60tsbHzUnhMPnbrXL/7Pu3L
	t7hHI9obh98BInP1nl6ey9APjOudj77uyvIBrOhv32wWtA91fnw5pkbLQWN48Xid
	+mSbsHBllrANQ1lwpLUzYLNk3zTXzr7Q0TdUfERXwrtFQtWzu6xr9Q0vNCqo4m2U
	x85/vf0Wvt9bZG0V85OoXaDnsiPx/tLuXeG5JAzxqSC5YPZzAMw8d6Gn9Oma3R0M
	hgvHV6w/2mxGu5qrFJaJuI1nclxPwq15TwNAnvnQ1/ynUmZf3ynp587FRy0B2Szw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46t9j9383c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 09:05:44 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54N91vao016921;
	Fri, 23 May 2025 09:05:43 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46t9j9382t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 09:05:43 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54N6Ni0w015480;
	Fri, 23 May 2025 09:05:42 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 46rwnnntne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 09:05:42 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54N95fsl9962236
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 May 2025 09:05:42 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE6F458068;
	Fri, 23 May 2025 09:05:41 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F178858065;
	Fri, 23 May 2025 09:05:33 +0000 (GMT)
Received: from [9.109.245.113] (unknown [9.109.245.113])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 May 2025 09:05:33 +0000 (GMT)
Message-ID: <23858e11-4f8f-4ff0-a27d-9b720351af70@linux.ibm.com>
Date: Fri, 23 May 2025 14:35:32 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v0 2/2] mm: sched: Batch-migrate misplaced pages
To: Bharata B Rao <bharata@amd.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Cc: Jonathan.Cameron@huawei.com, dave.hansen@intel.com, gourry@gourry.net,
        hannes@cmpxchg.org, mgorman@techsingularity.net, mingo@redhat.com,
        peterz@infradead.org, raghavendra.kt@amd.com, riel@surriel.com,
        rientjes@google.com, sj@kernel.org, weixugc@google.com,
        willy@infradead.org, ying.huang@linux.alibaba.com, ziy@nvidia.com,
        dave@stgolabs.net, nifan.cxl@gmail.com, joshua.hahnjy@gmail.com,
        xuezhengchu@huawei.com, yiannis@zptcorp.com, akpm@linux-foundation.org,
        david@redhat.com
References: <20250521080238.209678-1-bharata@amd.com>
 <20250521080238.209678-3-bharata@amd.com>
 <a6c42783-baf6-4463-a2f5-9a6d3e380865@linux.ibm.com>
 <825d87a7-8e9a-44f8-90f0-01cf3f1b8e52@amd.com>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <825d87a7-8e9a-44f8-90f0-01cf3f1b8e52@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: txXwPzSbCqLCiDU6S2zf_jLjQAFCWZp9
X-Authority-Analysis: v=2.4 cv=O6Y5vA9W c=1 sm=1 tr=0 ts=68303a68 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=wDc4EYGwM7oaOmFDgqMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA3OSBTYWx0ZWRfXyG3mHBj7Ol3W aPZ1hFRDdMnMMq2XxJCjDneH8ULGmwHmTPnOBeEkAxS6cTuYRN9tTrGbaEC575KudBlcMAPkwRU DGODdRQNX0T6vNhQdPIHw+HBAnilb4c2THHRUL8MmoIeU0riRLXYkI5AGcrTZ1DUmyrPAHpK0BY
 ivJ5zeyRUitleu25CIYE06T1Xni+E0c6SYvEkEyXz5LLuklZhAi7SSbDPqVFZ3GHdjxYglN6EmS 42GK1BIuELGbXwdLXcsJnlGIoF0bYchH0R0vu5Srf2fSIoDSFlnTLPWY8xbTW3FQ3hUikNq8b2i i7abauvz9WUIQ0tV++flqJrrHGaxn9tuI3hamuVZh3gu5LQ7dhoSvuLeBSQFyYOCBmjbItDG722
 eLF6CljQDXrfjtr2Dn3yr3+fwa01pQUIUs0SeCDKEDdDEtWt/AeHvOvcp3lC6+nCzwivWM8N
X-Proofpoint-ORIG-GUID: 86aR9zfSZD9JJ7sIVz4jw26oheZbYmoU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 spamscore=0 mlxlogscore=885 phishscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230079


On 5/22/25 10:09 AM, Bharata B Rao wrote:
> Hi Donet,
>
> On 21-May-25 11:55 PM, Donet Tom wrote:
>>
>>> +static void migrate_queued_pages(struct list_head *migrate_list)
>>> +{
>>> +    int cur_nid, nid;
>>> +    struct folio *folio, *tmp;
>>> +    LIST_HEAD(nid_list);
>>> +
>>> +    folio = list_entry(migrate_list, struct folio, lru);
>>> +    cur_nid = folio_last_cpupid(folio);
>>
>> Hi Bharatha,
>>
>> This is target node ID right?
>
> Correct.
>
>>
>>
>>> +
>>> +    list_for_each_entry_safe(folio, tmp, migrate_list, lru) {
>>> +        nid = folio_xchg_last_cpupid(folio, -1);
>>
>> Just one doubt: to get the last CPU ID (target node ID) here, 
>> folio_xchg_last_cpupid()
>>
>> is used, whereas earlier folio_last_cpupid() was used. Is there a 
>> specific reason for
>>
>> using different functions?
>
> This function iterates over the isolated folios looking for the same 
> target_nid so that all of them can be migrated at once to the given 
> target_nid. Hence the first call just reads the target_nid from 
> last_cpupid field to note which nid is of interest in the current 
> iteration and the next call actually reads target_nid and resets the 
> last_cpupid field.


Thank you, Bharata, for the clarification.

>
> Regards,
> Bharata.
