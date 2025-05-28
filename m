Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B869D24A07C
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748421263; cv=none; b=grYnU0SWT6ongg5KmJXrkP8cscGFCwa0rV8iIX0Oh5F6Yxagt7xYqVUCBg+JbhM8IGYjzzDOsownPL2wJTlgRsHaIhc/YWF1Sw2giw59ExCTx38ZuRyBqR6F7K/nafNLI3Wer4TNygz5ZPv8Z4zItXBIzUok4wGf53ryrVXeBR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748421263; c=relaxed/simple;
	bh=+CCZesIMhNxnvohUDQmsFwus3PXchNmfqBl0as+bi8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DuJhnfRrhaDW7TNNaJyYuvcqpvXlKXH1MiXnsC492LEGscKThuqboKYbGOrD0XvSOq3LbTaG7Fv4+W3ZBSqZLax82LjuWzimTSnuHFELU6hoUQh0FKuUfsMvjXCb6jioSlibu23o4fHIFmjvWr9LSU/24iQ/yErcSHCqlox6f3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=nXn8IeKw; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="nXn8IeKw"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S3ugMK004944;
	Wed, 28 May 2025 08:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=UTM5u1l2n0kAspKjldvPCAwdiqwUnt
	i0AqdYXhv4OyY=; b=nXn8IeKwSsnbto93bOvck9BDUzGNMoVQKLpmhRvOMs70e7
	gn5qZOr65atsT5YDaENZTgKkIsDMSPykZ16QvPD4bT7OQSfSwvl0ayplxBcZuwqH
	VErm3I+28PdEgqXHcvoyhBNsQ0yajpKcWsQpXm8YaJ9VbrJnWZikfIjXqxL7PfHL
	MZzwmCB9puEwE1MWUWSQ1TUcik1SNgjRDLZ3H9x2LNyleM2eQSvck3rwO0lEG0ZL
	th9q8SJtNy2/NBGwJ0FhKb/tHmGko37E5jNVxJthKIgFuQeY/GojvnXdMrcsktaS
	mQuGqw1P03Wo9D4F48dmnm/kePgF8RohzPbPJ9yA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46wgsj3q8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 08:34:02 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54S8UfvY017974;
	Wed, 28 May 2025 08:34:01 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46wgsj3q8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 08:34:01 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54S6Y0Vk028983;
	Wed, 28 May 2025 08:34:00 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46usepxp48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 08:34:00 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54S8XwbA50528604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 08:33:58 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E09220043;
	Wed, 28 May 2025 08:33:58 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3682B20040;
	Wed, 28 May 2025 08:33:56 +0000 (GMT)
Received: from li-e1dea04c-3555-11b2-a85c-f57333552245.ibm.com (unknown [9.39.16.188])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 28 May 2025 08:33:56 +0000 (GMT)
Date: Wed, 28 May 2025 14:03:53 +0530
From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, arnd@arndb.de, jk@ozlabs.org,
        segher@kernel.crashing.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: Fixing typo in comment
Message-ID: <e564iytmzbbchj7cxbh6nxysnjh3akd4tixjdg46uvkryl6bnx@njjpjxeppct7>
References: <20250528080051.1351779-2-mchauras@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528080051.1351779-2-mchauras@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=IcmHWXqa c=1 sm=1 tr=0 ts=6836ca7a cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=iZhVWIIbJi_2OSwl4MUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA3MyBTYWx0ZWRfXxXUU8eVrSeot B8+g6YU/mgrpkz3setWL/beWZy2ojs1Gy1YiPmoPy6KM/kBNQPcGg0NYm87HC6SQwhLrx9idpil WuBJaPIiemy4UoLlavqtqMhIgaFIo5BqiGsBxi5OGbBYZje2fo+v4I6eA0iw9S6s2DyVBVPjw/j
 a52lc7ED0+tiGBdgPprknHowD6a20lJhYOoJCCl5jVr9pmszkCXzk7f68pcvalrWhXRARaCuHBt z5T7jrnMKEZd0zFYigzJ4rXX1DqUMi5JLpamMT5NlKkQ/5O5Zuib+HmbeQrP6dnKv0qk3sKTX3M WWnesbL1icoPH0A3vDMyY09uchaHVfkcc9WjCVfzTrNal/kBgchfKkCup+AbkBvs84vIXPZqVCE
 WxJkpVYxkeLVgVwtfdhCugh0gDLdK1r8s8s8kLWfvkVMEY6Dv/khx64z1LyyXDa3Zqkp5r9o
X-Proofpoint-ORIG-GUID: VuMODfVn3SUMOJ3XoRcus3ysqe-89dE9
X-Proofpoint-GUID: lP-Zoj1lNRC1qbOl--l2mxzoRreFgaK3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_04,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 mlxscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxlogscore=577 adultscore=0
 impostorscore=0 bulkscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280073

On Wed, May 28, 2025 at 01:30:52PM +0530, Mukesh Kumar Chaurasiya wrote:
> fixing a typo where iff is supposed to be if.
>
I just realized its if and only if. Please ignore.
> Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> ---
>  arch/powerpc/kernel/exceptions-64s.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index b7229430ca94..53667dc7fe1a 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -393,7 +393,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
>  	.endif
>  
>  	ld	r10,PACAKMSR(r13)	/* get MSR value for kernel */
> -	/* MSR[RI] is clear iff using SRR regs */
> +	/* MSR[RI] is clear if using SRR regs */
>  	.if IHSRR_IF_HVMODE
>  	BEGIN_FTR_SECTION
>  	xori	r10,r10,MSR_RI
> -- 
> 2.49.0
> 
