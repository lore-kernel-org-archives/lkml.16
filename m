Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7271F4199
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 06:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744870066; cv=none; b=kuDoweqbtzUVODQ0iSB8/pQj535JMw7/R9jtcz07msK863zrtd7/72FVOxjeiBN2QP3j8Sy08gF7SUXMT+8y93s72X8LzYyu/4/48bSxRq0KaWHQdQT39gePSQDWF96Tka5H5RbU0ortAAFs4v0sPyjjrLcyZ32A7rj448Lh8YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744870066; c=relaxed/simple;
	bh=EYJo+YE0yFm/r19+jM/L59CCc2JH1TDTjIU2wuFNY3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/LHTYS2tOv8NyYjjL32WxIlpf43j9vdDt2XBgR2PrQ/GB/QLCkBcgX7XaKRX8kfFyhMhIfwtNvq/k8bmPYKJj+22Jh5c9+NPdJqs/2NfWvrap8Aa1MbT7W6pLuBhSmDfybxiQio898Z4vuVZv+PlAM8brsldRtq1njfih33VrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=NI+km9gb; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="NI+km9gb"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLgScL016371;
	Thu, 17 Apr 2025 06:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=THz3o+doHvTr0SFETxxoJFMa+RP9Dm
	Jr6IJ9N8sxneE=; b=NI+km9gbD3ZxRCirjZr1BQp+mJtzh2MeLtp36RS0LyrEOX
	DTYDA8XSpexkFySdwMljdKUMv1aJEqFSO2+KYMmh5+dU5BamNWpzyViJ1prtAjQR
	2+O76fUzxqscv7A0FVqYFKM7RZK8fPTSDpCGGTLSF4At0fix3QSXrzcDUGdsfx8d
	726smf4ZCMV23qGCp7n8t8XTIV2+12eMLVGIz6LZ9hT++Luf4tOjyrLfBPqSokot
	0IwnpiLXxJqps/bFNALlZxj2rxouROcCoGWVBvVssS2fBZnWptOIA3HdkzOEfLyq
	Kooes+RLTTzJb/kOdGjDyIxKnTKLkBuVIYlnmm3g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 462mpv1pnf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 06:07:16 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53H5uDw1016383;
	Thu, 17 Apr 2025 06:07:16 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 462mpv1pnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 06:07:16 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5IlOi001272;
	Thu, 17 Apr 2025 06:07:15 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4602w04gr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 06:07:15 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53H67D3T55640400
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 06:07:13 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 91D912004D;
	Thu, 17 Apr 2025 06:07:13 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BF6E20040;
	Thu, 17 Apr 2025 06:07:11 +0000 (GMT)
Received: from li-e1dea04c-3555-11b2-a85c-f57333552245.ibm.com (unknown [9.109.207.139])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 17 Apr 2025 06:07:11 +0000 (GMT)
Date: Thu, 17 Apr 2025 11:37:09 +0530
From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
To: Michal Suchanek <msuchanek@suse.de>
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/boot: Fix build with gcc 15
Message-ID: <fo7xb3bqk5h57mqgfrnyfpweitkr2l5vk3tomu6zgxgqlivwpt@afm2n3c2sxke>
References: <20250307092055.21986-1-msuchanek@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307092055.21986-1-msuchanek@suse.de>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=KJVaDEFo c=1 sm=1 tr=0 ts=68009a94 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=DDHIVGj7xSj8lN_WlfEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: VqLNXORCr3A5w_bjbgamuzHcpalJDKya
X-Proofpoint-ORIG-GUID: fk2siq4AUq7OrQLhwfeGpLml0abhbd-H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxlogscore=765
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504170045

On Fri, Mar 07, 2025 at 10:20:52AM +0100, Michal Suchanek wrote:
> Similar to x86 the ppc boot code does not build with GCC 15.
> 
> Copy the fix from
> commit ee2ab467bddf ("x86/boot: Use '-std=gnu11' to fix build with GCC 15")
> 
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
>  arch/powerpc/boot/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index 1ff6ad4f6cd2..e6b35699c049 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -33,6 +33,7 @@ else
>  endif
>  
>  ifdef CONFIG_PPC64_BOOT_WRAPPER
> +BOOTTARGETFLAGS	+= -std=gnu11
>  BOOTTARGETFLAGS	+= -m64
>  BOOTTARGETFLAGS	+= -mabi=elfv2
>  ifdef CONFIG_PPC64_ELF_ABI_V2
> -- 
> 2.47.1
> 
There's another patch which fixes this problem by version comparison.
https://lore.kernel.org/all/20250323163607.537270-2-misanjum@linux.ibm.com/

In my opinion this is a better solution as it will use the features of latest
compiler.
