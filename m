Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E0419DF48
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 04:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746417790; cv=none; b=aTjydXwd7qWQHkeyz+g87JYx2OQDKepD3gD32ygb7Ens9lQwondZHnfIB+bH10/9PvqXyzbhDOnHvaTSUA5Z3KTo69o1On+hfeqSrPlp3qH9Fw69h5uFADASaCnBWxlmP+f1hXWTo2ooGfvrE2wfpRb4FlBPmpmvqwvXbO6XSDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746417790; c=relaxed/simple;
	bh=+pljUp0rNnuvNTOde+uzOR+7150vJrAtAMDHRKaqg+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N9SmxJJptsPx40rufV+3dl89kJd/Y7GjtXdi7lw6mwPBsLjxpoiYXqeMm/sw3ZgtsaJATEerpGomz9tWNze54uoJBrMtAL6OCor8b6eH3IopfxEqU+vlqhtF2EHgMQFhgtfDqHrBhWQDSKU9NjTySw9Do9Wwe/ePcxCNq0Gufec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=CAQXVsOg; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="CAQXVsOg"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544L3qtQ030478;
	Mon, 5 May 2025 04:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=CozjIK
	xbf8eHl86evTFP43PyS7GDovRxQk/b/4pkDiA=; b=CAQXVsOgkbSON0sKW5cWYD
	komiMGmwrdZxuiaqtwk9hshZxoMgZxmCjM8Pdom/eXstawB6gCnCuv6hPHC1g20Q
	zWAk+8IaNKnufJoajflGSm4jCRbQn0/DDOXjARkyUeJ4BKJCeUVGvi39ApzIO5xr
	0xGq0Pw9FrdyjnZKIIVUQo+dKwgTsH+gol0TvofSqueWInjzaYhV16gLpcjL/H5E
	b2nHVpsqazu3kuiVqoYyPP3RL/Ogz8IgD2eQHchMPF9fdvIfpLTnIlpdWbkHjGCU
	E8bLyiDUjAsWv7WAtR5s7g2IJl/Xc7AyOMQoIWtzKN18R1u68xTSaMRgTwBlGWlw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46eftkgyu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 04:02:41 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54541feH017048;
	Mon, 5 May 2025 04:02:40 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46eftkgyu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 04:02:40 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5453M6bw002729;
	Mon, 5 May 2025 04:02:39 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dxfnmgr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 04:02:39 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54542Z1o34210410
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 04:02:35 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 45D7220040;
	Mon,  5 May 2025 04:02:35 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BDDD220043;
	Mon,  5 May 2025 04:02:32 +0000 (GMT)
Received: from [9.109.215.252] (unknown [9.109.215.252])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 May 2025 04:02:32 +0000 (GMT)
Message-ID: <77b4129d-f975-495b-a837-4393bc0d515e@linux.ibm.com>
Date: Mon, 5 May 2025 09:32:31 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] powerpc: sysdev: use lock guard for mutex
To: Srikar Dronamraju <srikar@linux.ibm.com>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, mpe@ellerman.id.au, peterz@infradead.org,
        fbarrat@linux.ibm.com, ajd@linux.ibm.com, mahesh@linux.ibm.com,
        oohall@gmail.com, hbathini@linux.ibm.com, dhowells@redhat.com,
        haren@linux.ibm.com, linux-kernel@vger.kernel.org
References: <20250314114502.2083434-1-sshegde@linux.ibm.com>
 <20250314114502.2083434-7-sshegde@linux.ibm.com>
 <aBIhMiNTpu6t8Hej@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <aBIhMiNTpu6t8Hej@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAzMyBTYWx0ZWRfX8wPVefHHLq5/ G4jx+eC3sxdDH4Zd2mVMcqZKTwUfrVOyAZ/KM21EBbrmDtEtDWXLvgGXRVbv7QAc3ESoMWnSG4j BePS61p46Zv8k26c5a+76uB0CxsLMa3dfeRZQTgEt3tUCvFHkN9P9JD7eyslXAicra+fvyAJlIl
 PcrwRRjKcDa+uHWhP7HpueYq6VjnaI5FQyFIYvkxjqk4ZzHokDIOjw3/n/vP1dl86IDK9YdZc52 N2cqKOm6KP9OSz3rOXGwMXy2sL+BeWc20MBedvZmRsmYf8bIbmUhut+OVa0st5WCWUxHGKdyUaN xFex1MzUsyfq0n8GnwyGz0qGGVxKuUI7b2BuF4QVCt1SQoh70SKWPxzpj9DXczVM+rc0q16jIrc
 epdsKhDwVC7G9gRiMIA57U6O5qq0cBu96Cm7Jbnza7gCzMiiy2qKbJEx2MGxNL5r6KvRVVTU
X-Proofpoint-GUID: CvdJ1bNgkQN9oHq0EXTDlr_-DyKp2gFD
X-Authority-Analysis: v=2.4 cv=Q7vS452a c=1 sm=1 tr=0 ts=68183861 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8 a=hxR3HYdLQCKF7G9SLD8A:9
 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: A3lRK_A8S7woU98tJosiXyNIIWeChrJY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050033








Hi





On 4/30/25 18:40, Srikar Dronamraju wrote:
> * Shrikanth Hegde <sshegde@linux.ibm.com> [2025-03-14 17:15:02]:
>

Hi Srikar.

>> use guard(mutex) for scope based resource management of mutex
>> This would make the code simpler and easier to maintain.
>>
>> More details on lock guards can be found at
>> https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>>   arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c | 8 +-------
>>   1 file changed, 1 insertion(+), 7 deletions(-)
>>
>> diff --git a/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c b/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c
>> index ce6c739c51e5..bbfc7c39b957 100644
>> --- a/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c
>> +++ b/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c
>> @@ -75,7 +75,7 @@ static ssize_t fsl_timer_wakeup_store(struct device *dev,
>>   	if (kstrtoll(buf, 0, &interval))
>>   		return -EINVAL;
>>   
>> -	mutex_lock(&sysfs_lock);
>> +	guard(mutex)(&sysfs_lock);
>>   
>>   	if (fsl_wakeup->timer) {
>>   		disable_irq_wake(fsl_wakeup->timer->irq);
>> @@ -84,14 +84,12 @@ static ssize_t fsl_timer_wakeup_store(struct device *dev,
>>   	}
>>   
>>   	if (!interval) {
>> -		mutex_unlock(&sysfs_lock);
>>   		return count;
>>   	}
> 
> Nit: Here and the next change, due to the current change, there is no need
> for curly braces.

Ok. will fix it next version.

> 
> Other than this nit looks good to me.
> 
> Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>

Thanks for the reviews.

> 

