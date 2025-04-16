Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37AE16E863
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744786845; cv=none; b=syNz4HbZ8I5D5Ocj5lHc3Kri38XyO3n2/s4L/elbikZSnooiXwERz3DUp5qdV0TZXADaM+BokFw4nHhy1q3xAg+H7JJhAVn/VgRqfBl/eF5KkbX4xKpChLrTQKc0OwyteP4yquexCIe/fbH0Lxr1XC/SSQrIAxNLBTQxVfkf+Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744786845; c=relaxed/simple;
	bh=MZX0NyL7XhAWv3wI1eNlSgIT6OB5NQWs/WXya+IRPWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=ViUQwjrHzbZD5o5Zrb0eUuXGPeURfp7prpl0npZsfSHlRZvgJcbIjomHnCk0lSo5vRj4i1K/gPXVAxOHK3sVeUpsvC3LbLwzVb5J9l3lTU3dyW5ui5KcQEMoCGaaB+V4hWxVwiQuJbU9MISUlGUSrEWTP+DQCL7hV6RcSDKd61w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=NhSVRkOG; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="NhSVRkOG"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FKXD5m020476;
	Wed, 16 Apr 2025 07:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=pp1;
	 bh=D36A7KPoEBhyYjfZYvrPed95J2eo7HltAgjgLq94Xzo=; b=NhSVRkOG7HVe
	H0GB71Om2YkjIzBzF6LF/CB7QuNtAsaEaUthUI3EM3QTOl6Uu4v9s3/B9hJapKXT
	MMHAYAhuSBvpykckDDO8HcIlU4XXns091kkQf7WzqMKEFup6uaE8PvcNIAI0Wq3N
	Ih1CFZOLkoYQNRrgRF4CIg8ZXKgk2PSWHGxFRW794qjXonGEr3MCbyVuEBhrqZoc
	j61IOtvPpq0q5JhJNc6rMjlThwq4uluoj8YgCyciNBrcn4Qr85JdKdT/X/WySPc1
	7hZSM77dt/vlnwqE3qDekKUKZcznJ8Kbt2OOHpHbMHwCA41rM6VStlBJAYKK6TXC
	yBG2hc0/Mg==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 461nwq4vsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 07:00:13 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53G5SNAE024892;
	Wed, 16 Apr 2025 07:00:12 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4602gtfa83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 07:00:12 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53G70Cnj20185620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 07:00:12 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F13E5805C;
	Wed, 16 Apr 2025 07:00:12 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2155658060;
	Wed, 16 Apr 2025 07:00:10 +0000 (GMT)
Received: from [9.204.206.228] (unknown [9.204.206.228])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Apr 2025 07:00:09 +0000 (GMT)
Message-ID: <37d018ac-ddb2-46c8-908e-9924f0f74e0c@linux.ibm.com>
Date: Wed, 16 Apr 2025 12:30:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] sched/numa: Add ability to override task's
 numa_preferred_nid.
To: Chris Hyser <chris.hyser@oracle.com>
References: <20250415013625.3922497-1-chris.hyser@oracle.com>
Content-Language: en-US
From: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
        Mel Gorman <mgorman@techsingularity.net>, longman@redhat.com,
        linux-kernel@vger.kernel.org,
        Madadi Vineeth Reddy <vineethr@linux.ibm.com>
Reply-To: 20250415013625.3922497-1-chris.hyser@oracle.com
In-Reply-To: <20250415013625.3922497-1-chris.hyser@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XyLol5-JmvzDhOvqfVl5UPMIIujiNb_0
X-Proofpoint-GUID: XyLol5-JmvzDhOvqfVl5UPMIIujiNb_0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_02,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 clxscore=1011 bulkscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504160052

Hi Chris,

On 15/04/25 07:05, Chris Hyser wrote:
> From: chris hyser <chris.hyser@oracle.com>
> 

[..snip..]

> The following results were from TPCC runs on an Oracle Database. The system
> was a 2-node Intel machine with a database running on each node with local
> memory allocations. No tasks or memory were pinned.
> 
> There are four scenarios of interest:
> 
> - Auto NUMA Balancing OFF.
>     base value
> 
> - Auto NUMA Balancing ON.
>     1.2% - ANB ON better than ANB OFF.
> 
> - Use the prctl(), ANB ON, parameters set to prevent faulting.
>     2.4% - prctl() better then ANB OFF.
>     1.2% - prctl() better than ANB ON.
> 
> - Use the prctl(), ANB parameters normal.
>     3.1% - prctl() and ANB ON better than ANB OFF.
>     1.9% - prctl() and ANB ON better than just ANB ON.
>     0.7% - prctl() and ANB ON better than prctl() and ANB ON/faulting off
> 

Are you using prctl() to set the preferred node id for all the tasks of your run?
If yes, then how `prctl() and ANB ON better than prctl() and ANB ON/faulting off`
case happens?

IIUC, when setting preferred node in numa_preferred_nid_force, the original
numa_preferred_nid which is derived from page faults will be a nop which should
be an overhead.

Let me know if my understanding is correct. Also, can you tell how to set the
parameters of ANB to prevent faulting.

Thanks,
Madadi Vineeth Reddy

> In benchmarks pinning large regions of heavily accessed memory, the
> advantages of the prctl() over Auto NUMA Balancing alone is significantly
> higher.
> 
> Signed-off-by: Chris Hyser <chris.hyser@oracle.com>

[..snip..]
