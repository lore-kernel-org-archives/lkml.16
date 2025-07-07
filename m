Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E85E28DB73
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881151; cv=none; b=UOh8t70WNvDrm9yQFksB8ug0+RxTgOmsD94FX9Xu3u2dXyxKKEVB7hZqqL4h+XnI7PnLAH03TaFdGW+XQu84fTqsWVDofDIJTAnXCEV/NAwO9MRb9+K6F9DiiMhiku9DrxPT4F1VzLTyCd514jAArh9maUwkg7Kul3lEpMa4URk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881151; c=relaxed/simple;
	bh=yQIEYkrvAXYCDs3hGuXRVke5AJo8WnvgOejzmmaEvAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jdSNEKOVZNraAglXO6A9B3edtJlOvRJFC3Rj9GQakYukaNLHRhDqKytrSU08Xf2MFty/zOBz41Jb9KL4EwNDbEXZCHktv7JOwpCutEa2h2KeG17Jzr2ycZ9E2+y9j4t72XkrzfqxzA8XugjXrCp3I8I7FTcY7k5LOfoPLANo2/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=RvdfQ7SD; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="RvdfQ7SD"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566LjJg6000549;
	Mon, 7 Jul 2025 09:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=kRYcnq
	LN2BZgSARNsIsjHk4FoWw8XdHRrDbXtcbt0m0=; b=RvdfQ7SDg7lK0+RCSW17ol
	Qi8J14/3Y7dfbCb8HlSOQMO+YY888sqpWlpxsQo0xOUzreaUl3Gx1rXlpXe/3hFZ
	RL9SHBGSngRn6mKk9Y53DZUcAWLIONeKSoRSLen00safxXujwtHi2MlbwYaOjaa0
	KZkA15LNI3NdFrr2W5E+I2aDbopSpA4ymsmiHoHgCjBdfOOXRiMtEeFo5E+5E0tZ
	QFEZdo4mRN1mdrtLh84pKnTywcGf38u3MNEwLjyASuhxkPSuys3uC453TNzhOMJ2
	XYHKFzG3Ae24YaciYp2v8xTFCYwQR3kcfmKEm8S2oMvUk6K+V+JyYXSvRfWMYejA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47pur6rpjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 09:38:14 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5679XCvV029460;
	Mon, 7 Jul 2025 09:38:13 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47pur6rpjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 09:38:13 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5677jQX0021531;
	Mon, 7 Jul 2025 09:38:12 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 47qectdm1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 09:38:12 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5679cBa656033694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Jul 2025 09:38:11 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2020620040;
	Mon,  7 Jul 2025 09:38:11 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 21E3E2004E;
	Mon,  7 Jul 2025 09:38:09 +0000 (GMT)
Received: from [9.109.215.252] (unknown [9.109.215.252])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Jul 2025 09:38:08 +0000 (GMT)
Message-ID: <49a9e43b-7ca5-4c90-a8b2-c43a84c34aeb@linux.ibm.com>
Date: Mon, 7 Jul 2025 15:08:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] sched: Address schbench regression
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, mingo@redhat.com, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, clm@meta.com
References: <20250702114924.091581796@infradead.org>
 <132949bc-f901-40e6-a34c-d1d67d03d8b6@linux.ibm.com>
 <20250707091136.GB1099709@noisy.programming.kicks-ass.net>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250707091136.GB1099709@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1MyBTYWx0ZWRfX2RRJXdpsRtS+ DlHhzO0OLPcGi0oLDXbAe7RNjv5l49lMAVxjFKjgG8+jp+e3NClv0j44VaPCNpRZBWbweN+qhhy iVy1UWtKyWDcuBwBIcM75UV0WNHkc8mRxOjGec7M2xQYjhrmi5GdUaR6weAkr2v++KHokXjtVFj
 CkiOyLWt6H2xlC4btN6bZxwYElIXDy+BquvsuKdCXdNfrf7mGqnH17xzlr2Ejl5h7GXv/ANv485 U4KZzk6uKL1gqhp0INeH+3sraOqJqNl7XPZXmbiv0z4pfzqdVNfqUTZRe2/o7PHBMueD9l6hHRl bQI1Jz9uioJhUAWHn6NewP1hMPV8Jl6hW4KX0Q48J1WC+YtSLuI0Ju9XJXlRmVFUdT563QI+IwA
 nK3Q/zGOGmTD7uckX/hMqEcPwPm1/ktosZRbEI7+drekZvbnaX9GIS53EvOcGQP+8m9CW/Bq
X-Proofpoint-GUID: Jx6BoolNriS9tgqYUbK53f8_IN8epa4n
X-Proofpoint-ORIG-GUID: vdm6K6pcJLTCNEl7nNtgLJ7sYLnjIStB
X-Authority-Analysis: v=2.4 cv=W/M4VQWk c=1 sm=1 tr=0 ts=686b9586 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=0YX1pDHftsOKNYb_5vcA:9 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=384 bulkscore=0 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070053



On 7/7/25 14:41, Peter Zijlstra wrote:
> On Mon, Jul 07, 2025 at 02:35:38PM +0530, Shrikanth Hegde wrote:
>>
>>
>> On 7/2/25 17:19, Peter Zijlstra wrote:
>>> Hi!
>>>
>>> Previous version:
>>>
>>>     https://lkml.kernel.org/r/20250520094538.086709102@infradead.org
>>>
>>>
>>> Changes:
>>>    - keep dl_server_stop(), just remove the 'normal' usage of it (juril)
>>>    - have the sched_delayed wake list IPIs do select_task_rq() (vingu)
>>>    - fixed lockdep splat (dietmar)
>>>    - added a few preperatory patches
>>>
>>>
>>> Patches apply on top of tip/master (which includes the disabling of private futex)
>>> and clm's newidle balance patch (which I'm awaiting vingu's ack on).
>>>
>>> Performance is similar to the last version; as tested on my SPR on v6.15 base:
>>>
>>
>>
>> Hi Peter,
>> Gave this a spin on a machine with 5 cores (SMT8) PowerPC system.
>>
>> I see significant regression in schbench. let me know if i have to test different
>> number of threads based on the system size.
>> Will go through the series and will try a bisect meanwhile.
> 
> Urgh, those are terrible numbers :/
> 
> What do the caches look like on that setup? Obviously all the 8 SMT
> (is this the supercore that glues two SMT4 things together for backwards
> compat?) share some cache, but is there some shared cache between the
> cores?

It is a supercore(we call it as bigcore) which glues two SMT4 cores. LLC 
is per SMT4 core. So from scheduler perspective system is 10 cores (SMT4)
