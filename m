Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51CB1CFBC
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 04:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747197660; cv=none; b=SfrSdxk/kemdeFJNPTk0UVc8vc3lfOiiWdr3z5UOYMw1oWS7Olt3/tpG4O629FVkuyFeJtOwGLq1QbFrV1rNCtqSpBPF0As7B/BuonOOeQL6QJfhpzxh8Fe9u6MipaAfIDFvS9BwrhKxVk/ZLq+RfPfC6b9DrIRcdJO3EGNuHec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747197660; c=relaxed/simple;
	bh=dMeHU9ueqZCEzk+JqLjzQzByWFHEMzqwLA6e/bhThOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+OjvYNf2ii0/w6jRWhIHP5waBxYUO+gSwl0tv5yMs9sLuW7Ovbm/k1GjFDrinEY+tSuxwE5G+MjOMlT4syGQbYzogWMAZTwWhY+paIDL1o2hwzZLAfS13IFnG8PqkqIeteY8KtNb58xSJsRZFXfOAD1u4SOQ8grduiI/GMwAnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=gu8mGbXb; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="gu8mGbXb"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DIbBUm022705;
	Wed, 14 May 2025 04:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=njUmuZXjpyPTwcVnt3iKG
	ijw4LyFNZsH60QUrmxYuUw=; b=gu8mGbXbiYUZnjOduOVf9SVdb53eFGk3bU5Fk
	bagFwo8UdpVU6mtyPRM7A2H2x+Kre664BBWhM8MqIwSKWGlTtRbMbpksSWGSi+L7
	/Sb7nTXBNVHbjX9IKjOOS5CbPOjfUwXCxhD6PmEsRutelr9/hwL54eUPc0m2AOfM
	h3mYzjpv5NEFLkvC9bPPHM8oi2qV69YV6c6XePUs3xcqrEhacX0ISIMHi7nzugL5
	qMZrgBNxJYYoj4AJHh1n0Z3PR6JJckoa3YZvQeTShOTZEhTrO1D1i0M+p19EUzJP
	MWLAGnmtnJUTp4cMv5MgVRNmVDJFokQTeUgxmbZ5GgCZ2ITxQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mbh3j6wa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 04:40:32 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54E4eVBC029429;
	Wed, 14 May 2025 04:40:31 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mbh3j6w7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 04:40:31 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54E298xF021459;
	Wed, 14 May 2025 04:40:30 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46mbfrjbax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 04:40:30 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54E4eSKf27722132
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 04:40:28 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9AC6B20119;
	Wed, 14 May 2025 04:24:51 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EFD0920117;
	Wed, 14 May 2025 04:24:48 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.39.25.27])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 14 May 2025 04:24:48 +0000 (GMT)
Date: Wed, 14 May 2025 09:54:46 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: maddy@linux.ibm.com, tglx@linutronix.de, maz@kernel.org,
        linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] irqdomain: ppc: Switch to of_fwnode_handle()
Message-ID: <zofmgipjaniwwwb43quo6eoct66cnq65g36dgnk2qbrs4p5kxr@ge5gilezyu6g>
Reply-To: mahesh@linux.ibm.com
References: <20250415104758.106890-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415104758.106890-1-jirislaby@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDAzOCBTYWx0ZWRfX3M5aMGs60Kw6 Cb07YYZbYivfhOZoAlGU/oWG7XKyegVXWeqmm7eYoRVT3l+6fiYTy6NuisPGMrs7YDTrrLqaHkg Wh1OQzDbWGB7Pda5KQU+pG44Ig427AZcw4k3vpbGMDLeB4pqmnmhV/nGrJvM7s+0PD6IOg/wl+v
 0bXC9lw8AN0Br1SclZwfcUjkTo56Cn85uh+IBh4nBs0msdUTPcnR8yIJB6NNv7lhzR3l2uz4l2y 7EdqQJ7qrh4NLtKF/miAq6+cykQUezvC7PEWdyqov8+FMH2naBejDNYJzTIYsqCH3UGAleHtfs5 jEP5vSNv7lfyPeU9rQrC/eMn7UG+vSTa4DobjMzJ3HTjEzPQK8TSiFQ6MHKIWMMICnaOIeu+Ih8
 pjm2Ke60UZRMsiiRtioSOfk7lH6l8kegUFcL19fFvAmYf+eTqsFmGZeAISWTGQt98/pAdJPm
X-Authority-Analysis: v=2.4 cv=D9dHKuRj c=1 sm=1 tr=0 ts=68241ec0 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=1UX6Do5GAAAA:8 a=voM4FWlXAAAA:8
 a=6f77wMeQDGy-RQiA4bAA:9 a=CjuIK1q_8ugA:10 a=Et2XPkok5AAZYJIKzHr1:22 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-GUID: Re8y-s0F5H7dMszqyQdmYg3FgXM1ZMIV
X-Proofpoint-ORIG-GUID: 78mfj4bI3w8blIn5tMJ_UU06Hzwp3Q3i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=601 clxscore=1011
 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140038

On 2025-04-15 12:47:58 Tue, Jiri Slaby (SUSE) wrote:
> of_node_to_fwnode() is irqdomain's reimplementation of the "officially"
> defined of_fwnode_handle(). The former is in the process of being
> removed, so use the latter instead.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Naveen N Rao <naveen@kernel.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
> This is an indepent patch, please apply directly.
> 
> The patch was previously a part of a large series [1], but I would like
> maintainers to feed the independent parts through their trees.

Looks good to me.

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>

Thanks,
-Mahesh.

> 
> [1] https://lore.kernel.org/all/20250319092951.37667-1-jirislaby@kernel.org/
> ---
>  arch/powerpc/platforms/powernv/pci-ioda.c | 2 +-
>  arch/powerpc/platforms/pseries/msi.c      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index ae4b549b5ca0..d8ccf2c9b98a 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -1897,7 +1897,7 @@ static int __init pnv_msi_allocate_domains(struct pci_controller *hose, unsigned
>  		return -ENOMEM;
>  	}
>  
> -	hose->msi_domain = pci_msi_create_irq_domain(of_node_to_fwnode(hose->dn),
> +	hose->msi_domain = pci_msi_create_irq_domain(of_fwnode_handle(hose->dn),
>  						     &pnv_msi_domain_info,
>  						     hose->dev_domain);
>  	if (!hose->msi_domain) {
> diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
> index f9d80111c322..5b191f70c088 100644
> --- a/arch/powerpc/platforms/pseries/msi.c
> +++ b/arch/powerpc/platforms/pseries/msi.c
> @@ -628,7 +628,7 @@ static int __pseries_msi_allocate_domains(struct pci_controller *phb,
>  		return -ENOMEM;
>  	}
>  
> -	phb->msi_domain = pci_msi_create_irq_domain(of_node_to_fwnode(phb->dn),
> +	phb->msi_domain = pci_msi_create_irq_domain(of_fwnode_handle(phb->dn),
>  						    &pseries_msi_domain_info,
>  						    phb->dev_domain);
>  	if (!phb->msi_domain) {
> -- 
> 2.49.0
> 
> 

-- 
Mahesh J Salgaonkar
