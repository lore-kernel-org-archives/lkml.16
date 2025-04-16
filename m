Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA89421147A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744823181; cv=none; b=eCiEYtg8ZXYnnCYxwslbq9WNt5je3ssf/0ImRqF3krPXeL90GGfJruPCNaa+qkhQqZwD2JLXxELZA2o6bCv5LIB/g82o8U2bA0K1GZV8La7A0frFlsbLaNboaWJYuekyGE1nta0FiCU94f9PaZ++RryQH6ktFRW7dNk3ydxuwA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744823181; c=relaxed/simple;
	bh=BwsN16YKHONPHxzjU/SbOMb+EVmGjdBp4T7oyG4QakE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mL6mBT8UfgtB0GP6n/o6fVDI7L7inrH25aGAGes+YdIKoQGc1/gnl88EYKAl0kobhG91cyI2GipWJTaw4p51ek3aqEWMHNHmghrG4MTfdMIjPj9R57T8UTk2kiHEfwVL+sMSGRwAquGiVeGUMhnNsZ1jYw2ArFcIKm+1X7Z7vhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=IAoOe2e9; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="IAoOe2e9"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GA3uUV028965;
	Wed, 16 Apr 2025 17:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Th2C89
	4XU0h6B9ZLA23yfpKllnyFrNpJuzHNK5ofMyw=; b=IAoOe2e9lHGkwC3t3QXql/
	52zouzWdQJW5GGSarNiN1W9sv6CwaoYgjmgOos8/yBbuJllWMP66Pd0o7Y0Pl4h+
	jStIp0tQAzLAgiBWrJKYnJcq6SZDhpfYl8edh77C/QNWymxJ4eeMwjJQCResseiE
	8pGxPqjareYUeJipfcbeDN6vZA0rDr27meQohCEC2BLBim5e+qqggLlvuEKLXg+X
	bPYqeyM3iw/RG30PECZOls8tFKs3cF2nvuucMWRtAL3by0fmjqegecN4RTBvN4TI
	BnNxXFBLZMuf/B5HhORtr+6/B3yMw+aaT1JQW8o3enBnCu1rkcLR0SKbUrCnkMbw
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 462affa990-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 17:06:15 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53GF8pfB010467;
	Wed, 16 Apr 2025 17:06:14 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4604qk93h4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 17:06:14 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53GH6DV030868066
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 17:06:14 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CFD315805D;
	Wed, 16 Apr 2025 17:06:13 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5774758043;
	Wed, 16 Apr 2025 17:06:12 +0000 (GMT)
Received: from [9.61.241.145] (unknown [9.61.241.145])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Apr 2025 17:06:12 +0000 (GMT)
Message-ID: <aeeb5e4e-7dd0-41a9-85d6-8fd415746595@linux.ibm.com>
Date: Wed, 16 Apr 2025 22:36:11 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [mainline]Kernel crash while running ftrace selftest
Content-Language: en-GB
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>
References: <1db64a42-626d-4b3a-be08-c65e47333ce2@linux.ibm.com>
 <20250416110253.62056f4f@batman.local.home>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250416110253.62056f4f@batman.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WpllPNGKeMYlQGGkASMfjIX8lXzeX1P9
X-Proofpoint-GUID: WpllPNGKeMYlQGGkASMfjIX8lXzeX1P9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2504160139


On 16/04/25 8:32 pm, Steven Rostedt wrote:
> On Wed, 16 Apr 2025 12:37:15 +0530
> Venkat Rao Bagalkote <venkat88@linux.ibm.com> wrote:
>
>
> Thanks for the bug report!
>
>> [15137.589546] NIP [c0000000003e4738] ops_equal+0x8/0x170
>> [15137.589553] LR [c0000000003ec708] ftrace_update_ops+0x78/0xe0
> Hmm, I'm guessing that you hit a path where the filter_hash or
> notrace_hash never was initialized.
>
>> [15137.589561] Call Trace:
>> [15137.589564] [c00000001473f9c0] [c0000000003ec6ec]
>> ftrace_update_ops+0x5c/0xe0 (unreliable)
>> [15137.589575] [c00000001473fa00] [c0000000003f31b4]
>> ftrace_startup_subops+0x124/0x5c0
>> [15137.589583] [c00000001473faa0] [c
> Can you see if this fixes the issue for you?
>
> Thanks!
>
> -- Steve
>
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index a8a02868b435..777574fa3095 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -3625,8 +3625,8 @@ static int rebuild_hashes(struct ftrace_hash **filter_hash, struct ftrace_hash *
>    */
>   int ftrace_shutdown_subops(struct ftrace_ops *ops, struct ftrace_ops *subops, int command)
>   {
> -	struct ftrace_hash *filter_hash;
> -	struct ftrace_hash *notrace_hash;
> +	struct ftrace_hash *filter_hash = EMPTY_HASH;
> +	struct ftrace_hash *notrace_hash = EMPTY_HASH;
>   	int ret;
>   
>   	if (unlikely(ftrace_disabled))


Hello Steve,

Issue still persists with the above patch.


Regards,

Venkat.

