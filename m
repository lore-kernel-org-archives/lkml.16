Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F06086323
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 05:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745816984; cv=none; b=eNAVRsyTWS7n9dkVpo28zi6MFbvHXczGgdnxAQTH2Uyp2IYEflGvtjDqrJ1LcSkU7wBa9spNbfkPWKPQ3dpWGaFqIPWNZ/7LUqHRGR+gmy6SsK3i3Zma47u4iKXtijhAa1ptiR5BJ4uH8wLleAvFfiFGoxhWd66+muNigzlvGzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745816984; c=relaxed/simple;
	bh=pwplAq7sR73Eedfj5RJgT6LHKNqYmF7wSl7fGsYpndA=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=YtftuTGOwie4DoqqZrr9Rj8MtsmVDG7YnngD179ZzI2bhEEAqQRSfTS62gVKtmTNb2DLv7w6yYh1YwxUlYNb0O38F8jQXtZVzN/xtfhN1TBPiIm3ai02Kz31MjBrBiMG7V/0cmgeHCL70n/DVxn3cCD0wZvpPDc93h9PcByf1Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ndiZNUkv; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ndiZNUkv"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S4SFqt002962;
	Mon, 28 Apr 2025 05:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Mr1poo
	bggn6JY8NgFJGQfnnwZCaRBg6+TJ+LyBuoOiI=; b=ndiZNUkv31ukPWvnc8SRFF
	jzva+dfLrhX6v/9d651ai3T/jBaJFa1qI76XUuUPRmy9K1VsXEUwSMLTIykLAOU6
	ZgHaZRRyBAlrylB5dVNJq1XClQtEQze3iGSTeUPskemWz7v+izjdvdctDrdTch7R
	74jLQ0Koq3Hz8DKdek2WdONGzSM78g3x5QfOnQ2qa3Hgtr54dR01H3mIXnnkU4Bl
	O6gBYUlSYSqNDi7kQ2RATUi7/87qfP7mhl0evtSHh8AszF1zE2MCc6WfqGL1F70w
	/mJ6lUg/XvfJXzh1J9/H/LyoHgx+EvJUpIQeLv1ydOhk5Q+rBFUMYm7p5dU2/P3Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 469jgjav2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 05:09:20 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53S59Iuh002999;
	Mon, 28 Apr 2025 05:09:20 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 469jgjav2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 05:09:20 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53S49v1P024595;
	Mon, 28 Apr 2025 05:09:19 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 469c1kvm4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 05:09:19 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53S59H1L2228850
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 05:09:18 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9268B58064;
	Mon, 28 Apr 2025 05:09:17 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 224875805E;
	Mon, 28 Apr 2025 05:09:17 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.5.196.140])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Apr 2025 05:09:17 +0000 (GMT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 28 Apr 2025 10:39:16 +0530
From: Misbah Anjum N <misanjum@linux.ibm.com>
To: Ritesh Harjani <riteshh@linux.ibm.com>
Cc: christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, naveen@kernel.org, npiggin@gmail.com
Subject: Re: [BUG][powerpc] OOPs: Kernel access of bad area during zram swap
 write - kswapd0 crash
In-Reply-To: <87ldrujhr5.fsf@gmail.com>
References: <89bfdedb74416156423d36d28c5b92e9@linux.ibm.com>
 <87ldrujhr5.fsf@gmail.com>
Message-ID: <bcec125a551e086911f82cef7bd632fd@linux.ibm.com>
X-Sender: misanjum@linux.ibm.com
Organization: IBM
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wsIDt46e0tVfdjVz3Zr7Uo-7ay9M-Yen
X-Authority-Analysis: v=2.4 cv=C4/pyRP+ c=1 sm=1 tr=0 ts=680f0d81 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=09Uxs5wTwXsWUI50y4oA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: o_Ee4r_eH4VpeaGAGKu0gvRZHrPdlGhU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA0MSBTYWx0ZWRfXyPTdSNEfU8ST hup4A1NYpNG0OsEtWzTLFajrs+swh095bfGS6z/uvvzEkq9jKClNEgDQqoAkBCFf7Erfe4nNIiA ca/BXl4A3ww7M4yUPkoBT45re6CnD7IjRPnW6IMXX3ysvZCiG5ukZqSyi4+c9cnjcfXuYfycEt4
 sNLV7qp77Jkwilzq4VCSjypW4EDJXFww6LBPf6tlg2yisWUwUfOWnfhMGrdeEaLYlZPCQ2copr+ M1hg/0uD8/8ypDlxfXiopz2xjWZ+3+COnOpHinAMD9JmKUJpe7PAFHwqh494VBkh0GtcJOiS6Ja QvTxMFtKhe056C3hjLwU5VsaRw4hTJ9ZJuVJiFIUrahTA6pSzpYmuswByhQWzejAExG4aBgQGC+
 ucJIYpj9BoAH4FmluPq8VzDAJdzNP5yJH8HNWZkkuCw0un1vfrh/nuXlnwP/6MIw6Q7lgICm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 clxscore=1011 priorityscore=1501 mlxscore=0 suspectscore=0 bulkscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280041

On 2025-04-21 09:19, Ritesh Harjani wrote:

> Looks like the issue is happening on 6.15-rc2. Did git bisect revealed 
> a
> faulty commit?
> 
> Looks like zsmalloc new object mapping API being called, which was
> merged in rc1?  But let's first confirm from git bisect, unless someone
> from linux-mm who knows zsmalloc subsystem better and can point on what
> could be going wrong here.
> 
> -ritesh

Hi,

Regarding the issue, I am currently running tests by removing the 
suspected faulty commit. Unfortunately, git bisect is not feasible in 
this case because recreating the bug requires running the avocado bucket 
for approximately two days. Hence, I am resetting the kernel to the 
commit prior to: 44f76413496ec343da0d8292ceecdcabe3e6ec16 and manually 
running the bucket to come to conclusions.

The commit in question: 44f76413496ec343da0d8292ceecdcabe3e6ec16 
introduces zsmalloc - new object mapping API
More information: 
https://github.com/torvalds/linux/commit/44f76413496ec343da0d8292ceecdcabe3e6ec16

I will update the upstream bug report with this information after 
performing the tests.
Thank you,
Misbah Anjum N
