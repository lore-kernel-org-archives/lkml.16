Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F87E3C01
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 17:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748367362; cv=none; b=mXM/oqNIUUo1K8ofOGniyI6Fh5+hpi+lW6YNpjEJfyFpUnOwT8SQYa11Mhj8iRk1BAPSiBCB0bsKN3UXfVqjQuwurt7agjQX4Va7qgKe9hiISCarsWBRn3rl58yWSIIn2bTezDDZ+qNKm6a1w+q51zclUDG0Rrk+wfHtf7pyy2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748367362; c=relaxed/simple;
	bh=Bnj+T1xUOQ9NGvkqUBXL8OOD/FvifoEELDdfcwYwv9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A5XFWxkmqeXwCH1Tfc7MXXvfMLjbr5f3zsAuS81sGa8i+dnf2lWRILhIeqlrmD5JT5Gs/NO/2Ea5DsG9KpVma7LSiGLhgGVWPWM51vQdGY7zkwiZwkXb3vnZUJJ30TsvM7ZqepjxFuOmSocvoCirzdwkznTXEI9N3v9hkT1TwHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=q39gcgiu; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="q39gcgiu"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RGICUr005507;
	Tue, 27 May 2025 17:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=MXpP59
	+HfF68Kn33L8GsHgTs4mhr7s5gkeESnF54fB0=; b=q39gcgiudeEhERpjXZYP8+
	gGJQy5pbJhl+ed/gA+KorAPkFI6IpXAweOij1ZI2+4C6oebaMhfQElqu3uS4M2l9
	WRHylU/P07gf77eBtExIgYshQWnE4QlYMGiaZwyPyYw4VvEMstaMuvmv+uvzbX83
	pbxjzfvNWQDEnh88r8ZrEko988w44LTdXIEWrxi4J4Sf5Gt+C5tZ4AWZJ6Mcu/n6
	NpWIB1EyQdzzodmlfoOwB4p/ALLUFgF50hw9foTq6ndLnZPEfRJEqoUriCN8SKrc
	Oga3rLFkpKEaC1wS/15U3+X0tYD9EEAWsBCCshJ7oJrGQsoVrUDGA60eb6lpHcMw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46wgsj8c1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 17:35:42 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54RHZfDZ006707;
	Tue, 27 May 2025 17:35:41 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46wgsj8c1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 17:35:41 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54RHKl4u021326;
	Tue, 27 May 2025 17:35:40 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46utnmkenf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 17:35:40 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54RHZa3o52429236
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 17:35:36 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD2C720043;
	Tue, 27 May 2025 17:35:36 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0453420040;
	Tue, 27 May 2025 17:35:34 +0000 (GMT)
Received: from [9.124.208.37] (unknown [9.124.208.37])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 27 May 2025 17:35:33 +0000 (GMT)
Message-ID: <e860ff50-905e-4046-9024-a26348ff49f1@linux.ibm.com>
Date: Tue, 27 May 2025 23:05:33 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] sched/core: Don't use parked cpu for selection
To: Yury Norov <yury.norov@gmail.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, maddy@linux.ibm.com,
        vschneid@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org,
        jstultz@google.com, kprateek.nayak@amd.com, huschle@linux.ibm.com,
        srikar@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux@rasmusvillemoes.dk
References: <20250523181448.3777233-1-sshegde@linux.ibm.com>
 <20250523181448.3777233-3-sshegde@linux.ibm.com> <aDXTOwRxhrtf5YPi@yury>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <aDXTOwRxhrtf5YPi@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Qspe3Uyd c=1 sm=1 tr=0 ts=6835f7ee cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=doqJzoeVyp6HbrEgEFUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE0NSBTYWx0ZWRfX/T/5bB10AMYh eWUPu1SqYYCQt9kgspyVjEtCFu70p36qWvt0YImHaXrjFRY8n32JG2BLHOp6Hgx9gLrbjSmI8tG vdOmulv8Q9FadJX2FLjjOW1Xb3yAP/0JqTQ31n94I1XrINWKlpiLnY/qiOMfCJwObv0xEA8Lfed
 lqjHpsJu4fdiIJ9qF0QHQgHX4G2/4UJK9qm1XhiqimtGI0vwxUCVkQ07ZJOd9vhnqilHyDIwzcA qL9BPYjJPBB/H7jRcx6PVmzwmKWTeWeNBLLzQmSgfUWa4/iiSayrqNOOE7Ti2N9tm7CZRkbkFND CI5rDLWDfs50ZsG/N5H+wtepNRPWiRmCf/NBjGp1TA7gDKJn6YbTbjk6sDfSLGwMWXWFr70NP5t
 Pr1BRFxuSTsUOVoQmCZVoZ492UrDCT0Jd/DCvyQ45UjyN32A2+TZOKPm08sYTbpL4gI/37yu
X-Proofpoint-ORIG-GUID: UspJeJXXpuGTps4x1MCRVhJiY7PAeCxw
X-Proofpoint-GUID: DIxwfHFiL2TxUbh9dhfHlDeF3XSyVJxa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 impostorscore=0 spamscore=0
 mlxlogscore=784 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270145



On 5/27/25 20:29, Yury Norov wrote:
> On Fri, May 23, 2025 at 11:44:45PM +0530, Shrikanth Hegde wrote:
>> When the current running task is pushed using stop class mechanism, the
>> new CPU that going to be chosen shouldn't be a parked CPU.
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>>   kernel/sched/core.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index 62b3416f5e43..9ec12f9b3b08 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -3526,7 +3526,7 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
>>   		nodemask = cpumask_of_node(nid);
>>   
>>   		/* Look for allowed, online CPU in same node. */
>> -		for_each_cpu(dest_cpu, nodemask) {
>> +		for_each_cpu_andnot(dest_cpu, nodemask, cpu_parked_mask) {
>>   			if (is_cpu_allowed(p, dest_cpu))
>>   				return dest_cpu;
>>   		}
>> @@ -3534,7 +3534,7 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
>>   
>>   	for (;;) {
>>   		/* Any allowed, online CPU? */
>> -		for_each_cpu(dest_cpu, p->cpus_ptr) {
>> +		for_each_cpu_andnot(dest_cpu, p->cpus_ptr, cpu_parked_mask) {
>>   			if (!is_cpu_allowed(p, dest_cpu))
>>   				continue;
> 
> You test for online and dying CPUs in the is_cpu_allowed(). Why this
> new 'parked' creature is different?

Agreed. Let me try move that logic into is_cpu_allowed.

