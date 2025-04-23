Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E440625CC73
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 18:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745433698; cv=none; b=IryWNyfJivdIQHb+SWicPWJq51GXzXUjnJdQZjtgMIVxSN5I+uEeX2BqF8WI5quaAo08rqAEeLW0mv0JlTASfRSCKckzCrcCD505Xvaxdy8K9jCEsBkA0w5amUwPoH8IK9X6leDZcFD/PvfcC3Yd61rv/eP4ltqmPsJoaMPTpx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745433698; c=relaxed/simple;
	bh=XJHmYc8HCCw78nHh+059wMSaQHH7cUidzMWN9s4ZLfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GXiGgQtUkWlB7UbGPoaqTAYLshoHpfSEVUiqUewGwAZSq7y7EwuElDU9pjq9uLfHIoZ3LcMEF+pNzGLH2Cqx2a6jxOI4+nJ947dND/+x+TQIDBdrnBhX0AcUj88+ywQimJeIJqmp0VzhPqpd2hrOGI+JpOV+9VGUgHxRAK5deeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=DwMKOjNJ; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="DwMKOjNJ"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NA4ChL025377;
	Wed, 23 Apr 2025 18:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=eEBVX2
	omivvc0sd9lbzbNpYWayv2ykxUycF2Bm/Seac=; b=DwMKOjNJiBIv7xzxAH7ULV
	aImtIuTpd0sQ+hMlgmaRa/1K6iEJ0GRU/0VXOkqMz4/qGf0AFr+YY7ZUnZnPN4Ox
	yYb1dyENXMd1TJHm/wNoXn6nGyrsAzXHHtsXNIj1eXUrTOLHywjOU3Ob8ILptaAU
	gBz7Fq7XqUAgNXQmvUcPM9im+/pgbg0zV4Q5e/C6OzTXHMtSjTAaACOkNNgnDTzE
	EO3dShHAm4aMbXz2yDZi82YtGJHYbl4Wih+HPaMLFIw3e0LMYZ1ccvZ18Yk5cHWj
	EpDxJvkBH9M9BmxBHX6jmns2uhMNHxHPzpLIEJSTsaHusKChnnGWVo1uBPOxYZOQ
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 466x4jtdfp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 18:40:32 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53NIc0lw022276;
	Wed, 23 Apr 2025 18:40:31 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 466jfxcdbd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 18:40:31 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53NIeTsA42729774
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 18:40:29 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A789E2004B;
	Wed, 23 Apr 2025 18:40:29 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F1A1020040;
	Wed, 23 Apr 2025 18:40:26 +0000 (GMT)
Received: from [9.39.28.170] (unknown [9.39.28.170])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 23 Apr 2025 18:40:26 +0000 (GMT)
Message-ID: <cd6d72c7-cdc7-4af6-b070-076f64887ee7@linux.ibm.com>
Date: Thu, 24 Apr 2025 00:10:26 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] tick/nohz: Move nohz_full related fields out of hot
 task struct's places
To: Frederic Weisbecker <frederic@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar
 <mingo@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Michal Hocko <mhocko@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Valentin Schneider <vschneid@redhat.com>,
        Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org
References: <20250410152327.24504-1-frederic@kernel.org>
 <20250410152327.24504-5-frederic@kernel.org>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250410152327.24504-5-frederic@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=eJ4TjGp1 c=1 sm=1 tr=0 ts=68093420 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=jg2in13-UT4g0phRZJ0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: h5dwc9IKWEJdG14oBRXaZKD3EKjciBoM
X-Proofpoint-ORIG-GUID: h5dwc9IKWEJdG14oBRXaZKD3EKjciBoM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEyOSBTYWx0ZWRfX8Rrk6+e5/QSv notdkbzQsHmgtW3SZFL8jDLCdYfAa4AFNjyKaAo1OGP3GGRKKVwZoN6WVGnzW6moJ5AP1+pUzGt WrDNSuKeTc7iM+xAgjE40r43dFlBRnXnUG/RHqRfooyuocoqAnJ36mT953KvC5HSV6df6L3pSxN
 vCt8NMueckF242l6d2OJkDFEP1I49/CUalZo7MEPVh+VyUHoJ2I8JUg9qXDUAc0m74ZT7CkqLWM Xch+hlBQ+ZTt6VhAEeV383qn+3PR6CRHJUxu0/GtpVILx8OmtcgacQ2e/N7J/Iekwy9DmrrpffB WC6xQQJmDc7jTQaHarqAdq2NN2m6HDZgOISZRNRJ0CZI2yTxkkugB1HrJTHQXZwCywond6jw0B7
 OlQc/ZGyGjlD31G2FuLoAAMunFm7of5DuOBg1ppiCHF5cqX+Upc4O2Q3Wx9aJ5p2RbYWruOC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_10,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 bulkscore=0 adultscore=0 mlxscore=0 phishscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=999 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230129



On 4/10/25 20:53, Frederic Weisbecker wrote:
> nohz_full is a feature that only fits into rare and very corner cases.
> Yet distros enable it by default and therefore the related fields are
> always reserved in the task struct.
> 
> Those task fields are stored in the middle of cacheline hot places such
> as cputime accounting and context switch counting, which doesn't make
> any sense for a feature that is disabled most of the time.
> 
> Move the nohz_full storage to colder places.
> 
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>   include/linux/sched.h | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index f96ac1982893..b5ce76db6d75 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1110,13 +1110,7 @@ struct task_struct {
>   #endif
>   	u64				gtime;
>   	struct prev_cputime		prev_cputime;
> -#ifdef CONFIG_VIRT_CPU_ACCOUNTING_GEN
> -	struct vtime			vtime;
> -#endif
>   
> -#ifdef CONFIG_NO_HZ_FULL
> -	atomic_t			tick_dep_mask;
> -#endif
>   	/* Context switch counts: */
>   	unsigned long			nvcsw;
>   	unsigned long			nivcsw;
> @@ -1438,6 +1432,14 @@ struct task_struct {
>   	struct task_delay_info		*delays;
>   #endif
>   
> +#ifdef CONFIG_VIRT_CPU_ACCOUNTING_GEN
> +	struct vtime			vtime;
> +#endif
> +
> +#ifdef CONFIG_NO_HZ_FULL
> +	atomic_t			tick_dep_mask;
> +#endif
> +
>   #ifdef CONFIG_FAULT_INJECTION
>   	int				make_it_fail;
>   	unsigned int			fail_nth;
> 

Hi Frederic.

maybe move these nohz related fields into their own cacheline instead?


on PowerPC where we have 128byte cache instead, i see
these fields are crossing a cache line boundary.

without patch:
	/* XXX last struct has 4 bytes of padding */

	struct vtime               vtime;                /*  2360    48 */
	atomic_t                   tick_dep_mask;        /*  2408     4 */
	/* XXX 4 bytes hole, try to pack */

	long unsigned int          nvcsw;                /*  2416     8 */
	long unsigned int          nivcsw;               /*  2424     8 */
	/* --- cacheline 19 boundary (2432 bytes) --- */


With patch:
	struct vtime               vtime;                /*  3272    48 */
	struct callback_head       nohz_full_work;       /*  3320    16 */
	/* --- cacheline 26 boundary (3328 bytes) was 8 bytes ago --- */
	atomic_t                   tick_dep_mask;        /*  3336     4 */

