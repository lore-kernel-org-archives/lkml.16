Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3778F20CCEA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 13:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743083573; cv=none; b=TFoleB6qYoCllGOhJcjlqAj5R9GICO/5kplnb4X0+EmM6ItngSYr4a6vwXL/N9HfnEUYMor/63uO0tLLpcr62qvhuf0HRiBwSllEZcNKT8diFF0BNPxW09Y0ltzt3GifrPub96BrGg4LbjAnVOpNhIZ+yIEMKkfdYEbkn34IUds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743083573; c=relaxed/simple;
	bh=zn5LTfzAWNmz5PDwGhphG9HekSubgQERBKmb6YTyFzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=a+nRtLV4RZm0HE66J5lEaon2m4lTKvJ8b2FkqWf4xJ2z9lXr0X2VAQt3njtc73p0mJdQ9jd7QeKdTGVBxqixnT/sWFKdHQHrwVMGd3nG/dW2gLu8K29BFIaRbKx7pw/PZEE+cMGhYt91nDK5uNcQ8CKR+TzUXCBJVEMv087ZJvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Ge6RIF8q; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Ge6RIF8q"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R94WTa011353;
	Thu, 27 Mar 2025 13:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=lR72a4
	GHZEB0fbhC/I4BrNu9OfR1V/1lS9yZ3KHUcrk=; b=Ge6RIF8qmYeUQYK8ghFBp/
	gNPMHqpMtuAgKm0ELozTKdhr85Uxa8Cy/9Ije6w3phbecwICxgqXxNMvPNmZcbNi
	fyV3Uj+4n2RtVYA1y44YOZj3+Woh33ttV+xjGwazq3sg2GWnAV0FZZwKGsFI/xAp
	JgWtIXNak+3yY1nixpYYMj0y9jmij6HVHTeomLpCvvxop1We5i2Ngv94eUP0j8E1
	S4jylpOW8hgSCDdcg/0GaRH4rpmZj1//P0dOY9L10nW0L+LGU7BeJXsOhqcwAuXQ
	McxAZftOO6XxXZpWyXwFkXeVxOgKS0VsJ08V/wsh49KyfuSaY8IPW/NMlku64iQQ
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45mrrq45ne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 13:52:46 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52RCe9eU005791;
	Thu, 27 Mar 2025 13:52:45 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 45ja82na2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 13:52:45 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52RDqi5v27853382
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 13:52:44 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B280E58057;
	Thu, 27 Mar 2025 13:52:44 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB9105805D;
	Thu, 27 Mar 2025 13:52:42 +0000 (GMT)
Received: from [9.43.10.101] (unknown [9.43.10.101])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 27 Mar 2025 13:52:42 +0000 (GMT)
Message-ID: <8797a1c4-dc58-4a85-bc51-a3d4131e7930@linux.ibm.com>
Date: Thu, 27 Mar 2025 19:22:40 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [main-line]Build warnings on PowerPC system
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <61cf556c-4947-4bd6-af63-892fc0966dad@linux.ibm.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <61cf556c-4947-4bd6-af63-892fc0966dad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 80tlj-huWZxxHwB2nd5OSMmCBDts4fjr
X-Proofpoint-GUID: 80tlj-huWZxxHwB2nd5OSMmCBDts4fjr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2503270093



On 3/27/25 12:33 AM, Venkat Rao Bagalkote wrote:
> Greetings!!!
> 
> I see below build warnings while compiling mainline kernel on IBM Power9 system.
> 
> Repo Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
> 
> Head Commit: f6e0150b2003fb2b9265028a618aa1732b3edc8f
> 
> Attached is the .config.
> 
> Machine: IBM Power9
> 
> gcc version 11.5.0

What is the ld version in your system.

Reason for asking is that currently with 

commit  579aee9fc594a ("powerpc: suppress some linker warnings in recent linker versions")

ld version greater than >2.39, this warning is being suppressed.

Maddy

> 
> 
> Warnings:
> 
> ld: warning: arch/powerpc/boot/zImage.epapr has a LOAD segment with RWX permissions
> ld: warning: arch/powerpc/boot/zImage.pseries has a LOAD segment with RWX permissions
> 
> 
> If you happen to fix this, please add below tag.
> 
> 
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> 
> 
> Regards,
> 
> Venkat.

