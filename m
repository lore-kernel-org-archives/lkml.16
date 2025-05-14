Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C1527A44E
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747228223; cv=none; b=qDofoLbbT57nuCcTQroFbEgEwFbulNBCCMrfzyJIF1UeVrWpLSBSj9EHTa7FwzrBo4YoLXv/5o36vz3c3Ui+D5Lrp31tQq9WE2yG//+iobiKscMKWFHQRJ52/Xg/OqMuf7qjWgs7L0W3oQmWGmT6znTrU6KCHkfEMFp3u/Zhass=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747228223; c=relaxed/simple;
	bh=xcAjH4iEjrkMXvyb521V6+fvdIlb5bIbkB1CSs7bCZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I+AxjQ5MiLng95l7ze1KfnuF+IpBUDsXqLg07bSxJzAK0YSIL8V1R3wAIgR5V7BqTFyvm+42nG7WzOWIcCCU8dbFYQPPezR8DJxGi0BwltSHcMpLgBDVhltl8ihlSzxvrO72utDwtO7q43vFDlOt6nOSUlR9hLybOiEzS2RlxJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=oYZKdarR; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="oYZKdarR"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E8pN45029463;
	Wed, 14 May 2025 13:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=McKolM
	Qvb55hck4pQRmljZVk0o5e+NP2bZCcZdD7Lf0=; b=oYZKdarRndsWlHZZ2+gjIf
	n1HGe1gZcyUkwvVPd4vBtUo3CFLxJGtBSGybhTP4UcT1mNGjyYvmK/Cq0osU3Mve
	D6jff8rRmV3C49EnGfSxf9lIsKpfyp6f6HJOhzEXxAnBRTyBqTqHdUBaZN21dYYB
	2IWuP2TNwYsGATR56h1nWS1AuN1aFGNrLBPZdmb4V1/yRcpiAf/QA1PODZLDBl2x
	Id9ar5yVHoAU8oOIVKZwh1Ra/Cnk1Fi8TaPqJ4afvN8xC23l7b4AnBSc6bFTH04V
	qoF2CbN9XB35AirmFXYmbnq8UGyRLvIMvHLCBoF3ZvNyYbkblzu5P2k3eH4M7Sxg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mr1gh75h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 13:09:57 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54ECi8KN006762;
	Wed, 14 May 2025 13:09:56 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mr1gh75e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 13:09:56 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54E9pVQ2021424;
	Wed, 14 May 2025 13:09:55 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46mbfrm9v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 13:09:55 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54ED9pQH59703672
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 13:09:51 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D54120172;
	Wed, 14 May 2025 13:09:51 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4AF722016D;
	Wed, 14 May 2025 13:09:48 +0000 (GMT)
Received: from [9.87.145.82] (unknown [9.87.145.82])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 May 2025 13:09:48 +0000 (GMT)
Message-ID: <9b936f0c-14d0-4601-927e-89fc0b7016b6@linux.ibm.com>
Date: Wed, 14 May 2025 18:39:47 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] powerpc/eeh: Fix missing PE bridge reconfiguration
 during VFIO EEH recovery
To: Narayana Murty N <nnmlinux@linux.ibm.com>, mahesh@linux.ibm.com,
        maddy@linux.ibm.com, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, oohall@gmail.com, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org,
        gwshan@linux.vnet.ibm.com, benh@kernel.crashing.org, agraf@suse.de,
        vaibhav@linux.ibm.com
References: <20250508062928.146043-1-nnmlinux@linux.ibm.com>
Content-Language: en-US
From: Ganesh G R <ganeshgr@linux.ibm.com>
In-Reply-To: <20250508062928.146043-1-nnmlinux@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vp_JmzGcVB9K5AAqpm7sbLZis4BmuKCh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDExNSBTYWx0ZWRfX0wyJdccglwNp xKV0dSoG83rzqNwioHrvHQWxSkEDnJ31K64PwNA7UkY/DAdhCQjo5jLzPjJTMxXsXq2O4s+74ez aZHYGe8tMTPISLVWg5QRL1TBjw+Tyq6Fwy04fW7MDO/Ec5GX7mBtU1Or+pPMjBNnlcDrclyQEqS
 OyM4bBiU6fJd6FYCvdYfKy3gZpL0ovY3HFDpuMd4wz2akKqGz5aTaojFYr2NLh7dnefKRv+cEj/ smASnmIxdXtWZseDVmRBeqiTNQnLPo1/GlOHUF5zpQTSlYa6hOHBT+ergWJAxiEzezniO3y4b5M n9fSjZBpBlCaKZcydb79BfoSgxfvtQjnJcO9arQKk/TgyxUwD00AuR5nj+m0hcNykAyGE686lGP
 WxC7rrsK4S9UAuf8t69Uv7PJOFVmybRhpEtxZCCznPrMmcuVoC8edCvPx9LslJWXAq6NKwhN
X-Proofpoint-GUID: wG5sNZ45GPfphW7TLGpr2hg9dGrBJQer
X-Authority-Analysis: v=2.4 cv=QOxoRhLL c=1 sm=1 tr=0 ts=68249625 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=87gp3Zgmo8FheM39fz4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 clxscore=1011 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140115

On 5/8/25 11:59 AM, Narayana Murty N wrote:
> VFIO EEH recovery for PCI passthrough devices fails on PowerNV and pseries
> platforms due to missing host-side PE bridge reconfiguration. In the
> current implementation, eeh_pe_configure() only performs RTAS or OPAL-based
> bridge reconfiguration for native host devices, but skips it entirely for
> PEs managed through VFIO in guest passthrough scenarios.
> 
> This leads to incomplete EEH recovery when a PCI error affects a
> passthrough device assigned to a QEMU/KVM guest. Although VFIO triggers the
> EEH recovery flow through VFIO_EEH_PE_ENABLE ioctl, the platform-specific
> bridge reconfiguration step is silently bypassed. As a result, the PE's
> config space is not fully restored, causing subsequent config space access
> failures or EEH freeze-on-access errors inside the guest.
> 
> This patch fixes the issue by ensuring that eeh_pe_configure() always
> invokes the platform's configure_bridge() callback (e.g.,
> pseries_eeh_phb_configure_bridge) even for VFIO-managed PEs. This ensures
> that RTAS or OPAL calls to reconfigure the PE bridge are correctly issued
> on the host side, restoring the PE's configuration space after an EEH
> event.
> 
> This fix is essential for reliable EEH recovery in QEMU/KVM guests using
> VFIO PCI passthrough on PowerNV and pseries systems.
> 
> Tested with:
> - QEMU/KVM guest using VFIO passthrough (IBM Power9,(lpar)Power11 host)
> - Injected EEH errors with pseries EEH errinjct tool on host, recovery
>    verified on qemu guest.
> - Verified successful config space access and CAP_EXP DevCtl restoration
>    after recovery
> 
> Fixes: 212d16cdca2d ("powerpc/eeh: EEH support for VFIO PCI device")
> Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
> Reviewed-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
>   arch/powerpc/kernel/eeh.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index 83fe99861eb1..ca7f7bb2b478 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -1509,6 +1509,8 @@ int eeh_pe_configure(struct eeh_pe *pe)
>   	/* Invalid PE ? */
>   	if (!pe)
>   		return -ENODEV;
> +	else
> +		ret = eeh_ops->configure_bridge(pe);
> 
>   	return ret;
>   }
> --
> 2.48.1
> 
Looks good to me.
Reviewed-by: Ganesh Goudar <ganeshgr@linux.ibm.com>


