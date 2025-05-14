Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4659E2797A0
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 16:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747239237; cv=none; b=EcJKkhOsxi93rT7/dqHbYeymouVSWCniKSAynzjqB5BOX4K4Oi1GT+B7tOB+0fcgqr1GVWBQQ6Z9joJKxVCbfMFtvXKYp3P2r1FPywrd4P9ugYBLJajlZn4aaJ/yhOtl9fNbj8crVaonE/zvQvmJ1aa7bygg6WNjst/b1lkGU0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747239237; c=relaxed/simple;
	bh=Q1WkQ44lqqbTjJaiuj3zmIPg9rpZXy+xVNlaC+/BCBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBxwAxdflJwHxxQW+TeP0fwCJMasB25BE+wL5tEm/5WDPmCB8dC6AnTps8YHIGFH8xT388F9Uo1qPJLDqIzIe2/YBbPjqVOgubZxEoQMo665B/3OWpDyj0lAErJ1edEYz/SBaI6LNymbcFdgBOIMQssJ4mavXHntaRdISoNOfSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ePV8GO4M; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ePV8GO4M"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EFrJel024793;
	Wed, 14 May 2025 16:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=b09PHDE199RoV0m/mw4oHx6iXWi13L
	4o0WsdH58ic1M=; b=ePV8GO4Mpu3bXgyaaSfXo/wERGfXCBdtCDFrSflUQuvrMs
	THM3DciTJdgW/ks0rEn8goWU4PhQVaOCfybNy1L2xkh6WGfugxoKPpWZrCFe2U0R
	+qeQ3pnXea6MRuGX4rqk7K0d01JcMh8pipO8yQlp1nbLGmu34j2yufCDkh2WewyT
	dn8cka1utHBz/9lk6y5/oU4KbnHExOhvxsCjzPOitTzn5+xPMlz7/OqRQw2DxCDk
	qUlqq/yBMMW58S7wU+O+ckC6Hx+sEuwJvhs4O1smbHtmTEDC7Jkxyokll7ctisgU
	GxMsh6M9rUxAoMbtkBySBEHscC8SIqeD2RDWBKBw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mbs6nbgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 16:13:47 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54EDKEuk015353;
	Wed, 14 May 2025 16:13:47 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 46mbfpw6h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 16:13:46 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54EGDjA536766100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 16:13:45 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 55767200A9;
	Wed, 14 May 2025 16:13:45 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2ACA8200A5;
	Wed, 14 May 2025 16:13:45 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 14 May 2025 16:13:45 +0000 (GMT)
Date: Wed, 14 May 2025 18:13:43 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Sven Schnelle <svens@linux.ibm.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] objtool: Add missing endianess conversion when checking
 annations
Message-ID: <aCTBN2IdcxoINGjQ@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20250514133515.1829691-1-svens@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514133515.1829691-1-svens@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE0MyBTYWx0ZWRfX02n0T20TLe7o dbKPGjO+WKDQQcmKMNqo560p7k9d9AmemrquWBwC6uWyZANxzxbUOe3GeLxjCmUobYFxv3fagXK NT4rm9ExSBsU+hYZeLb9PIGRPiYA3IesqZdM9vnZ6y1PzO/s2QYN9Qqa3Q0TlWgj9fquu+yvukm
 svmAA2W6oaL5VHmfjpC9YJ1DS4iMqj5xnga2RncPADoPM6lSqEXEiY2EP72loUrBo5WWdplc2Qt 8JVe79boHrmA3x5464UPbgUnAcQPNsT1yihALKFlfnFp2eHEx4tWC1fci41SMb8hlY83vQf4CjU UldBGTWWfiMwES5OasKKddQZKtGb9UxQb0r2zgMhjF0aWi6TGW2in188qy4+K7JXEdJoLlHjwRL
 otNKHeSMuIfafLLsqvEvKC+rA6dKt3V9yi/utm8SR+LYDUb0Hvkf4HlJRsJUI7UtyvvxHsW+
X-Proofpoint-ORIG-GUID: tiLSOTp0G5FNJut9ypapO69-l6h1cqUD
X-Authority-Analysis: v=2.4 cv=d5f1yQjE c=1 sm=1 tr=0 ts=6824c13b cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=xgUFjPgrbCOhmQH1JSgA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: tiLSOTp0G5FNJut9ypapO69-l6h1cqUD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 clxscore=1011 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=995 impostorscore=0 adultscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140143

On Wed, May 14, 2025 at 03:35:15PM +0200, Sven Schnelle wrote:
> cross-compiling a kernel for x86 on s390 produces the following warning:
> 
> drivers/mfd/mc13xxx-core.o: warning: objtool: mc13xxx_reg_rmw+0xc: Unknown annotation type: 50331648
> 
> Fix this by adding the required endianess conversion.
> 
> Fixes: 2116b349e29a ("objtool: Generic annotation infrastructure")
> Reported-by: Alexander Gordeev <agordeev@linux.ibm.com>
> Signed-off-by: Sven Schnelle <svens@linux.ibm.com>
> ---
>  tools/objtool/check.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index b21b12ec88d9..35fb871b2c62 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -2316,7 +2316,7 @@ static int read_annotate(struct objtool_file *file,
>  	}
>  
>  	for_each_reloc(sec->rsec, reloc) {
> -		type = *(u32 *)(sec->data->d_buf + (reloc_idx(reloc) * sec->sh.sh_entsize) + 4);
> +		type = bswap_if_needed(file->elf, *(u32 *)(sec->data->d_buf + (reloc_idx(reloc) * sec->sh.sh_entsize) + 4));
>  
>  		offset = reloc->sym->offset + reloc_addend(reloc);
>  		insn = find_insn(file, reloc->sym->sec, offset);

Tested-by: Alexander Gordeev <agordeev@linux.ibm.com> 
