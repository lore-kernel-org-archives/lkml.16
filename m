Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161521E493C
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746447289; cv=none; b=CaSkf+H1mBtIYg9ra4P0JMvhWjKwrNHuLt8aWQaM5s6N9RkEzOoleK7wYcpO28FpqwkNmOPWkExWB8ATBt0dBE34iFBPsmpM0UlfkRX/VwktgdztVygahqwbQenDeGAON7UggChpMsVhQA4Ai3+KihEnNO0OFktqX1V2Y7CBor8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746447289; c=relaxed/simple;
	bh=23fKJtqfoj9mNdTNimYcSJ0MZtCIBgHnzChKb2VXJl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbibW9zvn+kCT67Mgz+JT+BNzqnVDuLK5JTQRmhPE+59qF4rc8Kxpa2PAUx/75iY685YqgbuHXfL05jJmpb+4DKlsV5IoSMXZSMt+JmjTDHnyz4mgPaIPjnmTEbKeYKD+E//hlIpKQiJWNweQfzjfOLP5QXDhjgKoqZT7pqAWPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=kFNA1s60; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="kFNA1s60"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5450qwgw020764;
	Mon, 5 May 2025 12:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=MFkhBoR1HBPrUPguFR6rDDZ2fkcFU8
	yRrW3RyCsP6pI=; b=kFNA1s600UZG7Zqem0FwvtHlK/Yde3kQo8tDCqkV80BvoD
	3YrGcVjhjJz7KsNMRZDrO1Qr6lPLEC1+pI+XSR3kw+On68DOYCIKddvJodOYxEE3
	hGNIeoeb+ynV+NJFMJc1Y0jm6x3qMmQMkFiR5TK5XQeI9XfKZ9DzuBIxBBPCDXdS
	t9oPz7biBQVbk/zT6TjtXiMJ1u8rmC84HAVw79LwZZXtyL16d80Q/gInp2fT2jXi
	iBaXUI07DeTy+LFV6MjBSygaKRHIVKJJyIAb7cTQgR9nxyyfMV6SXWhSBA5goj5B
	+a1MLA/jrcCaveOOQkfRhY/XvlkCbysP7/8VKuRw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46eftkjw1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 12:14:25 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 545CEPcr016328;
	Mon, 5 May 2025 12:14:25 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46eftkjw1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 12:14:24 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5458Bt5Q032301;
	Mon, 5 May 2025 12:14:23 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dxyme0yk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 12:14:23 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 545CEJDB54133206
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 12:14:19 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73CC62004B;
	Mon,  5 May 2025 12:14:19 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E8B720040;
	Mon,  5 May 2025 12:14:16 +0000 (GMT)
Received: from li-e7e2bd4c-2dae-11b2-a85c-bfd29497117c.ibm.com (unknown [9.124.222.251])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  5 May 2025 12:14:16 +0000 (GMT)
Date: Mon, 5 May 2025 17:44:13 +0530
From: Amit Machhiwal <amachhiw@linux.ibm.com>
To: Michal Suchanek <msuchanek@suse.de>
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
        "Nysal Jan K.A." <nysal@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/boot: Fix build with gcc 15
Message-ID: <20250505174145.5f1837bc-d8-amachhiw@linux.ibm.com>
Mail-Followup-To: Michal Suchanek <msuchanek@suse.de>, 
	linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kernel@vger.kernel.org, "Nysal Jan K.A." <nysal@linux.ibm.com>
References: <875xjsjj6b.fsf@mpe.ellerman.id.au>
 <20250331105722.19709-1-msuchanek@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331105722.19709-1-msuchanek@suse.de>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDExNiBTYWx0ZWRfX38OR0vUwV1wL qQup0dSZOYruBjbeBRCjwDr88xj5XaHzL6QfhjCEd2N63IjtBtnWSQj0iiy4t/Gid5Md1aPKU6N jZLMOKZo494mCSFp9n800CKUZYPc2ODSPyRf4qKGRZrjUBtBI15E/5gzbqb2P3PEpuaMEhLGmxd
 9VZTXVDQNa7nDvwtpfem6v+ObYqH5qvQ8hXXglAIhzQKxosEvAgKJR6Hmh87pd8+QpJe6UNMjHn cIMYVtVh1l/rHCJc+JAt6YfeZdCcuLRwxbUE8wdvZLoypt/QQ2OHN1pAomJmCYxCkb7r1MmX3i7 PSh7gSrjp1p4RxZV4WDokwkx3qWD0wmX28Kqk7iClvO9WEOEd4RKwK/btU+K/+kMVo7JNggL6e1
 6qtzQkYZGlTs0ei4jT0/G1Isrnw6KLkzFl5z8iC3GCbdufFIwDiMi9Zypehc/j6s0QUOlhIE
X-Proofpoint-GUID: 4log6DXZ9-J-KGQx_Q_xEP_-N87o4ISD
X-Authority-Analysis: v=2.4 cv=Q7vS452a c=1 sm=1 tr=0 ts=6818aba1 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=Mvvlgebnvh2DlqqIrrAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: mAtMQHOA0FBSpgpNICWBvkUfcZXhZDZX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound score=100 lowpriorityscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=100 impostorscore=0
 suspectscore=0 mlxscore=100 mlxlogscore=-999 clxscore=1011 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050116

On 2025/03/31 12:57 PM, Michal Suchanek wrote:
> Similar to x86 the ppc boot code does not build with GCC 15.
> 
> Copy the fix from
> commit ee2ab467bddf ("x86/boot: Use '-std=gnu11' to fix build with GCC 15")
> 
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
> v2: Move the fix outside of ifdef to apply to all subarchitectures
> v3: Change BOOTCFLAGS rather than BOOTTARGETFLAGS
> ---
>  arch/powerpc/boot/Makefile | 1 +
>  1 file changed, 1 insertion(+)

Compile-tested this patch with uptream Linux on fc42. This fixes the build
errors with GCC 15. Hence,

Tested-by: Amit Machhiwal <amachhiw@linux.ibm.com>

Thanks,
Amit

> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index 184d0680e661..a7ab087d412c 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -70,6 +70,7 @@ BOOTCPPFLAGS	:= -nostdinc $(LINUXINCLUDE)
>  BOOTCPPFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
>  
>  BOOTCFLAGS	:= $(BOOTTARGETFLAGS) \
> +		   -std=gnu11 \
>  		   -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
>  		   -fno-strict-aliasing -O2 \
>  		   -msoft-float -mno-altivec -mno-vsx \
> -- 
> 2.47.1
> 
> 
