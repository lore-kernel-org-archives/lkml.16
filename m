Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2390215F6E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743084073; cv=none; b=dL5nk+4siWNOSK8Q1GTOyzU3LrKejC13Ac9E0jQh53RtipqviNpI3wIGn9dUbkecfobqGwPyF88arBo3o/s6sT8tjqOReDaBblrMjkUGJ4WLfd4L+3Ff2BhQOvtF2JyvXl6A909zh5o8mSn3PKx3VWNcqwVFszIgrLtLwi3OQkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743084073; c=relaxed/simple;
	bh=zbawFCfa4bU5qrxeiJ7+lqgc+bxCGDhgzcNOVjKekdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=vEHJJsiMsdwvghiD2CPmFe7UYQclcsljSUoBXuhyp7Ak4BO2cw5PbcB0ndgX6e0HAvb241ZrG4mExEuroHV7nEUbJnYaObtNsTT8ZGHDxiEVoOZN2uawwivJkByglDKiYYo8IGFyrXXBM8NwFl99lpwGJKIqO29fln1jdK4V+Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=VAaYU9Ct; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="VAaYU9Ct"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5GuaJ019111;
	Thu, 27 Mar 2025 14:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=zYoyA1
	bdvonavIjgx5TNt4AvZYhOriEJuhiO3ynUUps=; b=VAaYU9Ct+XNYTA60/B60hk
	ZlLaI6lChAdvn9ltlF0Z3M7kkLWJsib98FyX9mG20rpHbKBmZ1hLiu0ywHJdrPg6
	LtW+eQNUfXM4itjbG5nNBtqY3xw9xCh9XzGjGiiNcJKLT3ohuriRb49NnyHNnxbX
	PlcJh+4xK1CYEnLUceS8yqCPml669QwpN8HM3wfrBlPZHu4LmujHcHViIc5VqhCZ
	zV5tCQtMMu/IkB41jFjxOuwpVqN+VmTr9LGjVVdV91tkBb+L2wfrLIRX14fF3hQc
	KIjPVwhsf32dwZfJ207WJkVVYYtAnFroxXCWiidyb/wm7GNnhpUaIbNx+yyH1M2g
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45mnrwn98t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 14:01:06 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52RAbvlx025463;
	Thu, 27 Mar 2025 14:01:06 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45j7x0ds7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 14:01:06 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52RE15MH39715360
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 14:01:05 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 330315804B;
	Thu, 27 Mar 2025 14:01:05 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 04E4658059;
	Thu, 27 Mar 2025 14:01:04 +0000 (GMT)
Received: from [9.61.252.80] (unknown [9.61.252.80])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 27 Mar 2025 14:01:03 +0000 (GMT)
Message-ID: <b5713b0b-a278-424c-8ba3-3aec01454e94@linux.ibm.com>
Date: Thu, 27 Mar 2025 19:31:02 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [main-line]Build warnings on PowerPC system
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <61cf556c-4947-4bd6-af63-892fc0966dad@linux.ibm.com>
 <8797a1c4-dc58-4a85-bc51-a3d4131e7930@linux.ibm.com>
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <8797a1c4-dc58-4a85-bc51-a3d4131e7930@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QvPS5J9NuHdx8l0MVc5qI9N-YqkQCKh9
X-Proofpoint-ORIG-GUID: QvPS5J9NuHdx8l0MVc5qI9N-YqkQCKh9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270096


On 27/03/25 7:22 pm, Madhavan Srinivasan wrote:
>
> On 3/27/25 12:33 AM, Venkat Rao Bagalkote wrote:
>> Greetings!!!
>>
>> I see below build warnings while compiling mainline kernel on IBM Power9 system.
>>
>> Repo Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
>>
>> Head Commit: f6e0150b2003fb2b9265028a618aa1732b3edc8f
>>
>> Attached is the .config.
>>
>> Machine: IBM Power9
>>
>> gcc version 11.5.0
> What is the ld version in your system.

Please find the ld version below.

GNU ld version 2.35.2-59.el9


Regards,

Venkat.

>
> Reason for asking is that currently with
>
> commit  579aee9fc594a ("powerpc: suppress some linker warnings in recent linker versions")
>
> ld version greater than >2.39, this warning is being suppressed.
>
> Maddy
>
>>
>> Warnings:
>>
>> ld: warning: arch/powerpc/boot/zImage.epapr has a LOAD segment with RWX permissions
>> ld: warning: arch/powerpc/boot/zImage.pseries has a LOAD segment with RWX permissions
>>
>>
>> If you happen to fix this, please add below tag.
>>
>>
>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>>
>>
>> Regards,
>>
>> Venkat.
