Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F088238C21
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 20:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751572838; cv=none; b=l88oY7g89oamVQtWdJxe9hk68dkYGiJ5j7VPYJ+fKgScCRSFOuM52S0IKkncjSCijvLITk4joy/G08kOmIZNT2R7EfemLuZQ0iPfGz29mKX7PbJhJFYtkQbZG6QP6YMVhZU995Rp7egVQSwshSAkS/mBHY8YEfpnXZawbR+cLs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751572838; c=relaxed/simple;
	bh=qKFvUB49lHcatphKfroWSPIVKGaEzIoelBiOCGdYo3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bwGWb/Pwhq7bL2m/QGp4JV7Ms6j+pYM483z08/g7ep6IXHf+15jW5WH7iwefN3vCQc+6w3ONyC/gk2eb4EdnW4kDOe+l7iB34w8Wvw10yMPIv4RzJd2JzyJeKattqnctAUoO50z2fe8az8x7cWjrHPMokieVj+7vOZL3sqZ9nVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=OMlezj5t; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="OMlezj5t"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563DgC0f012368;
	Thu, 3 Jul 2025 20:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=rfgg8t
	8fL/hN34JuDmn0Bl88k/NOnsZ4zYg/su5b01M=; b=OMlezj5t4NSESAQuj3aGYE
	h9P2XLBRwwza2Bw1MbrP+WupHENiiX4PVp8pQnZEveccPLFmxjWEFhEQOPfVMjLz
	ZKz01lcVNXvECob27++QN0n95eQem2STotL2EOB2dcXqbODi21OKfSQYtGrHfjPe
	ry9ZtUl3JDVUyKtR8GsozxbkYaVuKbjf1q9RMuBPQt7HSJYxtZ3lhTx3tZL0PQ3D
	dUjfRR3RUyFcSni5XP/LpZH4ZksW2mP95rcJ4g5C36XfjZBqNNjvBMY+OZS5yHai
	DZtPiMBm1hkqTu3+XTUaKoeZb7faVOgz8Xl47xdLQlMPU3g1iO/BRdlog8JEpsPQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j82g5fam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 20:00:17 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 563K0HIw001577;
	Thu, 3 Jul 2025 20:00:17 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j82g5fab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 20:00:16 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 563ISaCA021430;
	Thu, 3 Jul 2025 20:00:15 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 47jwe3p8n7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 20:00:15 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 563K0DOb46006722
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Jul 2025 20:00:13 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 96C6B2004B;
	Thu,  3 Jul 2025 20:00:13 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDEEF20043;
	Thu,  3 Jul 2025 20:00:09 +0000 (GMT)
Received: from [9.39.27.83] (unknown [9.39.27.83])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  3 Jul 2025 20:00:09 +0000 (GMT)
Message-ID: <ddb9d558-d114-41db-9d4b-296fc2ecdbb4@linux.ibm.com>
Date: Fri, 4 Jul 2025 01:30:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch v3 00/20] Cache aware scheduling
To: K Prateek Nayak <kprateek.nayak@amd.com>, Tim Chen
 <tim.c.chen@intel.com>,
        Chen Yu <yu.c.chen@intel.com>
Cc: Juri Lelli <juri.lelli@redhat.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Libo Chen <libo.chen@oracle.com>, Abel Wu <wuyun.abel@bytedance.com>,
        Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
        Hillf Danton <hdanton@sina.com>, Len Brown <len.brown@intel.com>,
        linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        "Gautham R . Shenoy" <gautham.shenoy@amd.com>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
 <4cde5b36-4ef3-4dc8-a540-99287d621c7f@amd.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <4cde5b36-4ef3-4dc8-a540-99287d621c7f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9tBhavMIxa6KQexOOEUnQW_mSi6owUy1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE2MyBTYWx0ZWRfX8D7hzKnLMLPn EqAQTo75TktpbUF7WLa6c6HNTmCkdJVOL7IVxC87lWhdQffsFSBqrqgYRvUN3wEniAk3vCG71f5 oFIbkv9LMj5XghMHy2SS1nk7/mjeCsA6325sEg0JoxyKiXjzQ5N4D8s3RRvKIgerEcFSPUSY4As
 BhXLbDngFEFCZr+U8SEl4WBh53Et2nDN5PjVCSpEqsyk008LD3Vll8+Myq0t7pGvzK1vlTHHeDv IDz2ccYCDRpyF/YCv1nFNJ0s8pj70lw90qsGmFhgtw/TSw2LOpP87ocoWjT7/jW8ojbtewu/mLj Xy2QubYEJ4eLsUGS6KA8U933+vet+OgZei7hmEKRnFZfshNE5hRvFbiNCmjzLYM9sKO1qpEtTND
 PWsZpUXww2NuyDO0/B3aVIhHA+UYgLCCpjKTxFrlda5C6aVdQAxxU6+UfXjTL2bLTEJxgtGR
X-Authority-Analysis: v=2.4 cv=LpeSymdc c=1 sm=1 tr=0 ts=6866e151 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=qOEF4q6Xsp6u27uDJ_8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: JIaRkH9LHfAY8tSL0SkNpD9DgJXosAjw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030163


> 
> tl;dr
> 
> o Benchmark that prefer co-location and run in threaded mode see
>    a benefit including hackbench at high utilization and schbench
>    at low utilization.
> 
> o schbench (both new and old but particularly the old) regresses
>    quite a bit on the tial latency metric when #workers cross the
>    LLC size.
> 
> o client-server benchmarks where client and servers are threads
>    from different processes (netserver-netperf, tbench_srv-tbench,
>    services of DeathStarBench) seem to noticeably regress due to
>    lack of co-location between the communicating client and server.
> 
>    Not sure if WF_SYNC can be an indicator to temporarily ignore
>    the preferred LLC hint.
> 
> o stream regresses in some runs where the occupancy metrics trip
>    and assign a preferred LLC for all the stream threads bringing
>    down performance in !50% of the runs.
> 

- When you have SMT systems, threads will go faster if they run in ST mode.
If aggregation happens in a LLC, they might end up with lower IPC.

> Full data from my testing is as follows:
> 
> o Machine details
> 
> - 3rd Generation EPYC System
> - 2 sockets each with 64C/128T
> - NPS1 (Each socket is a NUMA node)
> - C2 Disabled (POLL and C1(MWAIT) remained enabled)
> 
> o Kernel details
> 
> tip:      tip:sched/core at commit 914873bc7df9 ("Merge tag
>             'x86-build-2025-05-25' of
>             git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip")
> 
> llc-aware-lb-v3: tip + this series as is
> 
> 
