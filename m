Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104F664D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743092685; cv=none; b=DE/6WYO8MRZyDQkCEQqYVQc1KJudxNuRDYTXDvaX+qa/+VjgYGdrqRtj9jrkgjUJV0vk/Zfvck2c+HY64v61U2T8IvYBoODl9KA31q2XnscbQE6P5n3oINbwaz70AkJ4t8tTtA6727heYgAlGzPbvnSsfFoN7bcoQ4xZ9ONbb9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743092685; c=relaxed/simple;
	bh=YdGXo3O56TtZkikoFlLOQ06Nt/mDpuGqNS8P4JRI6LU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZHTxClALOiHtOUWuUyagqu1KC3JvVlyYkVANTIqli3ZtidpdqErtar7FZ3AGKFjPUBqUhiamt5nogGcIX63M8kgaABehPnOQ/S8dLP+4NYS5LcDeNUjQcYtzes5EooHZ08SALK641rNum3w5KUwFrJjCYYGgy8DDL9vQdl9FnpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=DPNeVo0i; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="DPNeVo0i"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RDvPgC017821;
	Thu, 27 Mar 2025 16:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=GQ7ivu
	oqY7MTsplWB8t9QbLTPOQ8dbOUSd+9gIXDayM=; b=DPNeVo0iZyOK9AI5ESFHMy
	0Zsu5qlorY5RG9hUgw4b0nLuPCAJzqIicNqQuG8AswcipHakP/1Er4UWa2kCI76O
	Y4SodDycbUmQlQdS2WxEes81uH/r9lGwI1qiT9B4WsD4q+gyhWJ5SmBbNaF8QJRO
	fVweFeqFFxtt2yq2gPOrZO4EXGBzQ/z5CbNNCwzfbZ+8C6amBdHSzmNAg3/wFb8z
	7mc5u8aZktTyiKSYbmt5fSZS6vcJFSM6+lLO6/qaDBwB1oCkqAlfke5WFlbmDqj6
	NsIzW3XpzLBbSy5PKzCfSqeHXTlGCzQOK6MfNYyXkWhFUTcAuI2bOs1Dp+prL/gw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45mnrwp4nc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 16:24:38 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52RFFbXU025462;
	Thu, 27 Mar 2025 16:24:37 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45j7x0eass-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 16:24:37 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52RGOaJ45309038
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 16:24:36 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6118D58045;
	Thu, 27 Mar 2025 16:24:36 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3406558052;
	Thu, 27 Mar 2025 16:24:35 +0000 (GMT)
Received: from [9.61.252.80] (unknown [9.61.252.80])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 27 Mar 2025 16:24:34 +0000 (GMT)
Message-ID: <516febac-b2ba-48a0-83a4-ab259e972541@linux.ibm.com>
Date: Thu, 27 Mar 2025 21:54:33 +0530
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
 <b5713b0b-a278-424c-8ba3-3aec01454e94@linux.ibm.com>
 <38653c58-a5c4-496f-9b52-e7bc3e447423@linux.ibm.com>
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <38653c58-a5c4-496f-9b52-e7bc3e447423@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EGuk4gJJi_iR4eRUC5ynX8DlPgy25Q9v
X-Proofpoint-ORIG-GUID: EGuk4gJJi_iR4eRUC5ynX8DlPgy25Q9v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_02,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270109


On 27/03/25 8:36 pm, Madhavan Srinivasan wrote:
>
> On 3/27/25 7:31 PM, Venkat Rao Bagalkote wrote:
>> On 27/03/25 7:22 pm, Madhavan Srinivasan wrote:
>>> On 3/27/25 12:33 AM, Venkat Rao Bagalkote wrote:
>>>> Greetings!!!
>>>>
>>>> I see below build warnings while compiling mainline kernel on IBM Power9 system.
>>>>
>>>> Repo Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
>>>>
>>>> Head Commit: f6e0150b2003fb2b9265028a618aa1732b3edc8f
>>>>
>>>> Attached is the .config.
>>>>
>>>> Machine: IBM Power9
>>>>
>>>> gcc version 11.5.0
>>> What is the ld version in your system.
>> Please find the ld version below.
>>
>> GNU ld version 2.35.2-59.el9
>
> ah ok that explains. Kindly can you try with this patch and let us know whether
> this fixes the warning in your setup
>
>
> diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
> index 1db60fe13802..09ceb5a42d81 100755
> --- a/arch/powerpc/boot/wrapper
> +++ b/arch/powerpc/boot/wrapper
> @@ -235,7 +235,7 @@ fi
>   # suppress some warnings in recent ld versions
>   nowarn="-z noexecstack"
>   if ! ld_is_lld; then
> -       if [ "$LD_VERSION" -ge "$(echo 2.39 | ld_version)" ]; then
> +       if [ "$LD_VERSION" -ge "$(echo 2.35 | ld_version)" ]; then
>                  nowarn="$nowarn --no-warn-rwx-segments"
>          fi
>   fi
Above change fixes the issue. No warnings observed. Thank you!!
>
>>
>> Regards,
>>
>> Venkat.
>>
>>> Reason for asking is that currently with
>>>
>>> commit  579aee9fc594a ("powerpc: suppress some linker warnings in recent linker versions")
>>>
>>> ld version greater than >2.39, this warning is being suppressed.
>>>
>>> Maddy
>>>
>>>> Warnings:
>>>>
>>>> ld: warning: arch/powerpc/boot/zImage.epapr has a LOAD segment with RWX permissions
>>>> ld: warning: arch/powerpc/boot/zImage.pseries has a LOAD segment with RWX permissions
>>>>
>>>>
>>>> If you happen to fix this, please add below tag.
>>>>
>>>>
>>>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>>>>
>>>>
>>>> Regards,
>>>>
>>>> Venkat.
