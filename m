Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EC7264A90
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 12:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745238861; cv=none; b=mG/7a5CoR0nLXfKB7r4myR3BiDcme3G3lUEUaqwEu0vPP1daJBBzS8kPm6S5N8UJ9gZKGC6KLEHx6fSVkOTqge1j7rq2tKVPz33epXDmA+HtHqdO3jOT8fwQtHjYQfqXVDfnQ+IYzttFSL+4CnQoD4WNq9cDqy4JsyJSO1dBYJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745238861; c=relaxed/simple;
	bh=tBnOWminYQiAD8VcUWZjwBQVEiHljlN/Q+tV+nA8C/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A2/VH8P7CnqdG8wiuABa7cnMMvcaCPjsffChx1NIttTGXr6CDY1qq65VqEvEp5o3kGyVyMZ1T2nO9vFNYeelYNrRw3JSkaGqrnzOyuHTa2sPAKO1DTsFz/r27/R5SnwjjB9urbnnfVZypduxEiNc1rNS25aZ7oDdQ/vMeRdF1vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ZJkx09Fo; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ZJkx09Fo"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LA541A009401;
	Mon, 21 Apr 2025 12:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Y7onz8
	cl48XsU3bJSx9rmiPBhBfsK++dY7LgegblbwQ=; b=ZJkx09FoOaB3soUW3C+L5e
	zWt94fe0oZ0jUvF+4YYxlRj8qr7+Yf7qD2G4qqulvwe1hZzSmprEz1tQIqDaWaHc
	CNOEz/WWkb5bfHuV1FmxTOEa7iHH802C4EihtTO2YJdxH47sA3p7Y2subRinq/IK
	4IwIJFJb3CCAF5FJdg81LN6JILiSnh18+C0ARRsb0YI0pjeuCK5RPtGGxudv8o3y
	r85YC1vVWGgmv8NJtS/IuuiIODZjQHTHRPHd8yv3PnLc9nLEZ/xiyRRC2q+ZhYH8
	HGJNcBbCA1LAAdWkZgXF1uG5v07SxJDH0TEkDIHzn/MtBe/iBReNeVjSD1yi/cqw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 465kxj8h3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 12:34:09 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53LCVaon018921;
	Mon, 21 Apr 2025 12:34:09 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 465kxj8h38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 12:34:09 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53L94unm028120;
	Mon, 21 Apr 2025 12:34:08 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 464rv1wy2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 12:34:08 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53LCY4Ex58786150
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 12:34:04 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5ED252004B;
	Mon, 21 Apr 2025 12:34:04 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F08520043;
	Mon, 21 Apr 2025 12:34:01 +0000 (GMT)
Received: from [9.39.25.91] (unknown [9.39.25.91])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 21 Apr 2025 12:34:01 +0000 (GMT)
Message-ID: <f1cb42d7-573c-4c48-a4f5-c19cf0485b10@linux.ibm.com>
Date: Mon, 21 Apr 2025 18:04:00 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] powerpc: kvm: generic framework and run posix timers
 in task context
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, gautam@linux.ibm.com
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, vaibhav@linux.ibm.com,
        bigeasy@linutronix.de, linux-kernel@vger.kernel.org
References: <20250421102837.78515-1-sshegde@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250421102837.78515-1-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xIHtw0W0b6MXw8v9NiI0Jqc7FWVbDrPx
X-Proofpoint-ORIG-GUID: F0Zk8WCYH4lY-Wfp3sdBm6MRQoripmC5
X-Authority-Analysis: v=2.4 cv=HLDDFptv c=1 sm=1 tr=0 ts=68063b41 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=YefxoRAhaFKz9cKMQ00A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210098



On 4/21/25 15:58, Shrikanth Hegde wrote:
> From: Gautam Menghani <gautam@linux.ibm.com>
> 

I made a mistake while generating the patch. Sorry about that. i will 
fix it up in next version.
Please consider the above as:

From: Shrikanth Hegde <sshegde@linux.ibm.com>

> This is an effort to use the generic kvm infra which handles check for
> need_resched, handling signals etc. i.e xfer_to_guest_mode_handle_work.
> 
> kvm guests boots and runs stress-ng CPU stressor on PowerVM and on PowerNV.
> preempt=full and preempt=lazy was tested on PowerNV and in both cases the
> KVM guest boots and runs stress-ng CPU stressor.
> 
> Please let me know if any specific testing to be done.
> 
> Kept the patches separate since they differ functionally, but kept them
> is a series since 2nd patch depends on functionality of 1st. Also this
> could help in git bisect.
> 
> This is based on tip/master
> 
> Shrikanth Hegde (2):
>    powerpc: kvm: use generic transfer to guest mode work
>    powerpc: enable to run posix cpu timers in task context
> 
>   arch/powerpc/Kconfig         |  2 ++
>   arch/powerpc/kvm/book3s_hv.c | 13 +++++++------
>   arch/powerpc/kvm/powerpc.c   | 22 ++++++++--------------
>   3 files changed, 17 insertions(+), 20 deletions(-)
> 

