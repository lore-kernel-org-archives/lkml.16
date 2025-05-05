Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956942376F8
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746454989; cv=none; b=jIHapFc48JHYKaZuZ7+bu2fKD67Ml69C8guFINsYeqZ+M9JTV8MSyzJ6RXKP9GiVh3vLYMPkv/6X50UhR4uZnYbRATpa2tImRxvwoQU+gtq8gxyXQKQNGgk+4VL070TqxpjlnHeqCZmQ9Dh7UtXgH8TxADXvqC/U1F3Ie9Klw8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746454989; c=relaxed/simple;
	bh=6oGP8Plu7y9NM6A6cWBbCbj/ubVr6P4vWKc7UF+RUR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=geG2qyV1gfWQoa1z/+fD+cWCOPZsmLD0JvpMIaZQWvX8LM3p4rFWXmfWGKoFSyyF6uHG1fc6vWal17cdKRF8DcPo5shKizOSwZBNX99+zavXiuYIkn0LpCKYMws7khpkdTPjHxaA3SgC5dR4MURBzyajw+ZvePEkvNdl7PU1qmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=RDiG4ixS; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="RDiG4ixS"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545EGJ9S010306;
	Mon, 5 May 2025 14:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=yT/Hz7
	Vny58s7pF04mj8EmDDKFWuILntGtvKNKSpuZ4=; b=RDiG4ixSrFr2V9swc3q2Ry
	54W8AfHXSNvSFwyMKVpIt6oudDGxvQgMQdfOOQ6lCNdpzsL8s9nMttVwQurVGqL1
	64Jtb8vNR2LpwZqPzV6ycb+UYCHvZyRdVhnIp8i8A66Os935iKDoA+5TpEmmpcpA
	Qcv1mpXxgwHxIilJg59oQ857S9otTCVzh6dBVrudheohsgYolEkEWBNgq0efdsQp
	l+ZNhUrY1GTmCloBNsbHljqw2wf4q/9rpu3dA7x7GkuazAztqY7TLp7TEln/x1Y4
	taMKECRlvceJDFT/rKhyQ+pKNM2WGjGaNM83G2dZx9CXeGoUa8/i+p1USFOoT2/g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ej6yu474-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 14:22:52 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 545E6FE8004125;
	Mon, 5 May 2025 14:22:52 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ej6yu471-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 14:22:51 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 545DHtar014167;
	Mon, 5 May 2025 14:22:51 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46dypkebt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 14:22:51 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 545EMnSD19399218
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 14:22:49 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E06D5805B;
	Mon,  5 May 2025 14:22:49 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B635958058;
	Mon,  5 May 2025 14:22:45 +0000 (GMT)
Received: from [9.61.244.137] (unknown [9.61.244.137])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 May 2025 14:22:45 +0000 (GMT)
Message-ID: <898a1a58-ae8d-4210-9f4e-9e97c9e0cb82@linux.ibm.com>
Date: Mon, 5 May 2025 19:52:44 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] powerpc: use lock guards for mutex Set 1
To: Shrikanth Hegde <sshegde@linux.ibm.com>, maddy@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, mpe@ellerman.id.au,
        peterz@infradead.org, ajd@linux.ibm.com, mahesh@linux.ibm.com,
        hbathini@linux.ibm.com, linux-kernel@vger.kernel.org
References: <20250505075333.184463-1-sshegde@linux.ibm.com>
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250505075333.184463-1-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Fi89rRTXqcx4UoqqRZCdr5bRAgcroU0A
X-Authority-Analysis: v=2.4 cv=GKAIEvNK c=1 sm=1 tr=0 ts=6818c9bc cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8 a=wbOSOQyIEbtBsbREJHsA:9
 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: -OjYd0mMDgHSvjQu3mLG3kVKKKuBz6dB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEzNiBTYWx0ZWRfX60VvHmELtd/8 /sZut1BNy9mAmjnPnJhReoI5D1ySrZtcKxV9HyEyZs70zrqN3kijlHD6qNa6QOJCFbchfBrDRdA lG4lT2CqZ2S+yBmk8NJVKvxAweuNqeuh0Znl/uynuZsxYlx+2F0y3TTkdnLhMe1SpUMjfWKpFrd
 HtJIBTMoVbdncHuPqzAHwRFNa5Eph9sKdwaOZ9cz58M4bHTR87FeJjnI0CL1n0yUzFp36rkYpMW CArWQ+xpS8Ltq/4RzYp1+8ABDl75ItCOzuMG2T9Dua26P9oPipwTXk9v2Ch5SzusMGa6t6iV2iG 2kSj6sv8PQw/VKzyq5A2OvcnQU+eCJVH3rj3Auh71ycw6vTjqTW74znnDaxtnZVnjPx2IlVux2p
 Sl6HopcLddKUiQzsnOHhhfR0ar45m75G7G6e5MRzsDNOztA8oxnrY4WWail/tZKtUCFvKiPl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=991 adultscore=0 clxscore=1015 phishscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050136


On 05/05/25 1:23 pm, Shrikanth Hegde wrote:
> This is an effort to make the code simpler by making use of lock
> guards which were introduced in [1], which works by using __cleanup
> attributes. More details in v1 cover letter
>
> v2->v3:
> - Collects tags (Andrew Donnellan & Srikar Dronamraju)
> - Address comments from Srikar Dronamraju
>
> v1->v2:
> - Fix changelog of powernv (Andrew Donnellan)
> - use scoped_guard in couple of places to avoid holding mutex
>    un-necessarily (Peter Zijlstra)
>
> [1]: https://lkml.kernel.org/r/20230612093537.614161713%40infradead.org
> v1: https://lore.kernel.org/all/20250314054544.1998928-1-sshegde@linux.ibm.com/#t
> v2: https://lore.kernel.org/all/20250314114502.2083434-1-sshegde@linux.ibm.com/
>
> Shrikanth Hegde (6):
>    powerpc: eeh: use lock guard for mutex
>    powerpc: rtas: use lock guard for mutex
>    powerpc: fadump: use lock guard for mutex
>    powerpc: book3s: vas: use lock guard for mutex
>    powerpc: powernv: ocxl: use lock guard for mutex
>    powerpc: sysdev: use lock guard for mutex
>
>   arch/powerpc/kernel/eeh.c                   | 20 +++----
>   arch/powerpc/kernel/fadump.c                | 11 ++--
>   arch/powerpc/kernel/rtas_flash.c            | 64 +++++++--------------
>   arch/powerpc/platforms/book3s/vas-api.c     | 32 +++++------
>   arch/powerpc/platforms/powernv/ocxl.c       | 12 +---
>   arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c | 14 +----
>   6 files changed, 50 insertions(+), 103 deletions(-)
>
Tested this patch-set by applying on top of powerpc repo, with HEAD: 
b4432656b36e5cc1d50a1f2dc15357543add530e, and Build and boot test is 
successful.

Also FADUMP and DLPAR operations are successful. Hence, for the series,


Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.



