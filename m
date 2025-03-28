Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B3321ABBD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743160497; cv=none; b=G/v5AktdfkE7Ces0TD1iJmjn04ZjWpEjLqtktsTthEYK2CvcoqybnUA1JgAZQZXUFldkgWvkGIByeMJOjgTKPYv1vePuH73++cJusB6gzDLZDbN+HLRImVhXXDuO0dG3UhYrOS5a5sbvQwhGP/Gfu7aHtohy2IZnp59k7GRgoFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743160497; c=relaxed/simple;
	bh=HNdCrYO0ofr01KbowJ1S3NSmlOlAaoQA+PA9qREwNBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dmz5AfnzNiZ7aA73lijTVswZ/P2zZJwJRDN0rbLsWGjIGaE0ywz88lPo2ddw62EYajzj4K9ibVtJ0AVUTYIvkjS1M7yaPqIP6me35hce+h2KcqTsO/gBYwxoV0W5jzDvl2EwNinYPZQp7+bdrkCyWGdxcrBqlpp441pXEBwdlV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=cuDgzPjV; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="cuDgzPjV"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S3IOuH001394;
	Fri, 28 Mar 2025 11:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=tBdNgC
	TiH0JzSJs0sxReFO7ivUNoEUckmfZfBH5iVow=; b=cuDgzPjVYpV2Z8Dn7zTb+B
	nU1DDJao0o9XjzDfcOvIA7SUN2UNhuqvdE3bo7mg6Aq0ZU4+n9mIoZ9HbM3gl4Db
	9zu9zmgOIjGTtWdoLrWXWM+ZqIYyQTV2zXd3NnWNWM4Q3ikkGsi1PXu7zbO+bVyn
	PZT7IMyZokLm75gi9NWwCDp8Ag626nl3dIvNrngOTm7zBp3hy+JPJqRSSl6zMVJ0
	wB4OXVAzufJy7ArQ2iVx6zBq6RILqO2n4l8SzddJKsb10tUuo0Hqntv9DvRpXAge
	1zcjvUzOCKz9xU45wI9dzkEjgpOHgs5A8Ki+nETpUvjr+TLXF4SQXEHPFsCgjsIw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45naux4e6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 11:14:48 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52S8Ewv5025462;
	Fri, 28 Mar 2025 11:14:48 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45j7x0j7f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 11:14:47 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52SBEl1630474988
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Mar 2025 11:14:47 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F2C6658054;
	Fri, 28 Mar 2025 11:14:46 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 540915803F;
	Fri, 28 Mar 2025 11:14:44 +0000 (GMT)
Received: from [9.43.60.59] (unknown [9.43.60.59])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 28 Mar 2025 11:14:43 +0000 (GMT)
Message-ID: <e18df940-bb30-44c9-9384-7325e8d02d25@linux.ibm.com>
Date: Fri, 28 Mar 2025 16:44:41 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [main-line]Build warnings on PowerPC system
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <61cf556c-4947-4bd6-af63-892fc0966dad@linux.ibm.com>
 <8797a1c4-dc58-4a85-bc51-a3d4131e7930@linux.ibm.com>
 <b5713b0b-a278-424c-8ba3-3aec01454e94@linux.ibm.com>
 <38653c58-a5c4-496f-9b52-e7bc3e447423@linux.ibm.com>
 <516febac-b2ba-48a0-83a4-ab259e972541@linux.ibm.com>
 <b37c7a1a-9ec8-417e-9d9d-adeffe409df8@csgroup.eu>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <b37c7a1a-9ec8-417e-9d9d-adeffe409df8@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Z3XN_wktqKTys0rekGKUEFQOIFCvRnL8
X-Proofpoint-ORIG-GUID: Z3XN_wktqKTys0rekGKUEFQOIFCvRnL8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503280075


>>> diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
>>> index 1db60fe13802..09ceb5a42d81 100755
>>> --- a/arch/powerpc/boot/wrapper
>>> +++ b/arch/powerpc/boot/wrapper
>>> @@ -235,7 +235,7 @@ fi
>>>   # suppress some warnings in recent ld versions
>>>   nowarn="-z noexecstack"
>>>   if ! ld_is_lld; then
>>> -       if [ "$LD_VERSION" -ge "$(echo 2.39 | ld_version)" ]; then
>>> +       if [ "$LD_VERSION" -ge "$(echo 2.35 | ld_version)" ]; then
>>>                  nowarn="$nowarn --no-warn-rwx-segments"
>>>          fi
>>>   fi
>> Above change fixes the issue. No warnings observed. Thank you!!
> 
> Take care, this must be a special version of binutils.
> 
> With regular 2.36.1 I get following error:
> 
> $ /opt/gcc/gcc-8.5.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld --version
> GNU ld (GNU Binutils) 2.36.1
> Copyright (C) 2021 Free Software Foundation, Inc.
> This program is free software; you may redistribute it under the terms of
> the GNU General Public License version 3 or (at your option) a later version.
> This program has absolutely no warranty.
> 
> $ /opt/gcc/gcc-8.5.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld --no-warn-rwx-segments test.o
> /opt/gcc/gcc-8.5.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: unrecognized option '--no-warn-rwx-segments'
> /opt/gcc/gcc-8.5.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: use the --help option for usage information
> 

Nice catch. Thanks Christophe.

May be we need to handle this special/specific case with an
additional check

diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index 1db60fe13802..d3779c20e548 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -237,6 +237,8 @@ nowarn="-z noexecstack"
 if ! ld_is_lld; then
        if [ "$LD_VERSION" -ge "$(echo 2.39 | ld_version)" ]; then
                nowarn="$nowarn --no-warn-rwx-segments"
+        elif [ "$LD_VERSION" -eq "235020000" ]; then
+                nowarn="$nowarn --no-warn-rwx-segments"
        fi
 fi

 
Maddy
