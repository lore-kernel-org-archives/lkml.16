Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D082920BA
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746509978; cv=none; b=cN4fX3braNjgbpXe/PzXGIAuXQYdrCkuwWeQcaeHxVsVIByqmtF2VqHw1/Ayo1hxif2Vbw+Q8DJfzJh+iQjy8dOhbALWOUIb8VFD2x0W9wgqpTxB9zVx8FAiW6kzPh/Qq5jb+RUKMh8ovwLXmqAwzedurEgZBGdWbgHcGL2o/z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746509978; c=relaxed/simple;
	bh=9gJ4yAcq26FIHkoEbruT91j1gPvTkb1gC00d9MWpnQ8=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=PPSm0oCk3Hp/pGOAV0rpusPS/fGTx32CsLR7xLrLCoULRNlGBw3iYEsEgLqj45g9p/bH/E8+/DJtwv2XUyLqYCKwgkZ1hLgcfjRPyyRKsfKzbdTuQok/8qHlGhJF88ntwSFy68qGcfGrm7coTJhes4FExsIgx6NmpyxgS2GkTpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=EGT2q7gL; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="EGT2q7gL"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545Lcwpv002195;
	Tue, 6 May 2025 05:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Ts/lpY
	gRvVW3tUCks4eC9rvGcvaiNAjci7VsczPQ+oc=; b=EGT2q7gLjEK8wrzTLibyFA
	tI4LbyhPF6wFVkdvlmO+QYwrdwZIyyodrhB/bjecmPPcnT8JjDGPdUPGgoy7ao8Q
	+LwPy3tlo1TNsTaZRyI0l1b0fbSejlEb/XRt40XMSwWNVK3FQjFlpVfhuUtAwj5E
	bSpcDufKn/kVURGgibQmRXrV+Q4TnraC4t7dqT3o7fC6jYVCEGJxVRUl//3GrDk3
	RS8J/8ypDFgK/P96VNj2Gkf2KEXcsbl/6GYYidKEamDqEgGwLDJY0eXOBu50iA4b
	w2QdvnIJ0O0nm9Z9DRoKsbcjyp2nYbVxrpEoZGTdEKt6T6Mz6WVLTG/X7MzRZ0Xg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46f5e8hdng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 05:39:03 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5465ZZVQ023969;
	Tue, 6 May 2025 05:39:03 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46f5e8hdna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 05:39:03 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54636dYd001353;
	Tue, 6 May 2025 05:39:02 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 46dwfta50f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 05:39:02 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5465d1Td28115502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 05:39:01 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 75F1558060;
	Tue,  6 May 2025 05:39:01 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E0C325803F;
	Tue,  6 May 2025 05:39:00 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.5.196.140])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 May 2025 05:39:00 +0000 (GMT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 06 May 2025 11:09:00 +0530
From: Misbah Anjum N <misanjum@linux.ibm.com>
To: Ritesh Harjani <riteshh@linux.ibm.com>, senozhatsky@chromium.org,
        yosry.ahmed@linux.dev
Cc: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG][powerpc] OOPs: Kernel access of bad area during zram swap
 write - kswapd0 crash
In-Reply-To: <87ldrujhr5.fsf@gmail.com>
References: <89bfdedb74416156423d36d28c5b92e9@linux.ibm.com>
 <87ldrujhr5.fsf@gmail.com>
Message-ID: <3374b7cf6a68364c389a260d7ec9067f@linux.ibm.com>
X-Sender: misanjum@linux.ibm.com
Organization: IBM
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=X4ZSKHTe c=1 sm=1 tr=0 ts=6819a078 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=xe_K4BuX0dQdScSaYpsA:9 a=CjuIK1q_8ugA:10 a=QQLMaIiM1wwA:10
X-Proofpoint-GUID: e--iastPlMmjXy9FL-UQycqA02G4JAZ1
X-Proofpoint-ORIG-GUID: 4Gwlx4U90MbmYYcnk0a4-ytVh4HX2e7a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA1MSBTYWx0ZWRfXzj/UyGbhywwb RLwbZzJ2n/P7SjvOG20klsZCiGuA84n+tZGLeGRmdZz2h2+IxQqel7GtRkQp+Zv+nBWUyZlORPq tXXungA72HjLoIcNpvDDnZY2/NdDKyW6zHptjVuqCpm0Wx+iuU5sPrDmejCuUnwMNXKOPXMV+2j
 zU23p8Zj+bolJOw/YM+skyVNUGnCihMlMNOm4YXjoA0GRsg6idvQYkIdqHYC+DV6L7UZeQ0D3vS mQRbKddIctZm6uyGbdz6Jg+OLzK4NYUVKVX5CJ17hPIl2g1HbIz/5oV9sUcffM5xf8KnxNzBCuJ WRUwjdstbImlnOCUcka4Tx7vP9R/yqwowMusswyw3Xz5iyJLICvX23Ac4ab8rzWb6ThWSDdZh6u
 ZPQUVxPmnSosvw+pA5njXdawkSYdhZ7UoB4fDN7PMdRvfVfFvNt9LkZwmYFNUM49LJ2ndjpX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_03,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060051

Hi,

I am facing this issue even with the latest kernel: 
6.15.0-rc4-g5721cf0b9352
The suspecting commit is: 44f76413496ec343da0d8292ceecdcabe3e6ec16. The 
commit introduces zs_obj_write() function.
Link: 
https://github.com/torvalds/linux/commit/44f76413496ec343da0d8292ceecdcabe3e6ec16

I was not able to reproduce the issue by reverting to the prior commit: 
e27af3f9360ee130b7ab0b274088f92146a0855b
I would like to request assistance in debugging the issue.

Thank you,
Misbah Anjum N
