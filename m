Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F941DFE20
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 08:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751445069; cv=none; b=IbkW/hCdsVSDwKj7u6OaRGFt3zSyWz5UQdbQ94aW8+2bhRijz4UZU9VIhp1z4bbHF/FudhOj0KcC3F0WXSirIdk21lmTcNWea703F5CfM5xponuKx9tZmwwDUcSS0Kug34VJgXJfMOmN0Sv8YaClrQl9D1AsiaPu67Z72sjAcys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751445069; c=relaxed/simple;
	bh=JWnhWvn5tEcYrJv61gKK//rVuDV7lbCIkt1Fq+PYNcc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XpMTpU6XLLabklz4JDdd2oaXboCE+wlSxkAngl7iiPZgXEp9UdWzyGa30p6IkUT9K0OEYEMsnMOiIm2EeMXw1GPwh99fiqk0L0mI/VtqKLTFVhHqEexa9mH3fksFMVU8GkDGmC+4wgKp4j/J5I/maxBs6IMic3y66oBUU48aJUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=K/u+9Wro; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="K/u+9Wro"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561LRlKZ006903;
	Wed, 2 Jul 2025 08:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=+NSs0nj8Gces/5GOvMFHmAd18hLosj
	vHUupciVxjhlk=; b=K/u+9WromCOZiOUZRWFQxcTuj2ITfyUT6BFC+4wcb3OzJz
	HaThGaNTtNL2DgoCGFx7OPZEVvBZj+0wfMVJVUkEwOWI61wGNu/D123u0AF9C2y3
	837WYen/8Zs6B9MWry9LB627CXWvdnstRHjSPE6O7LIHShBt0Rggr8zEAk9dBm0U
	w95F03ViMgh9nrk0bn7NH3cA1byVzkyPQ35DVpJDUYhAEaflvhMoAYDJcIatr5bj
	Za0ZU+beoDsm/cRKg93F1tBQodGAYlmvl8wDuv+ZgFS9y5g17P/RlSRKu5pPjk9/
	vWZEFbDNN/UvnRylKza4bPkr4MPXvmByWpHt5sGg==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j6u1v0b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 08:30:54 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5625pNtE012043;
	Wed, 2 Jul 2025 08:30:54 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47jv7mxh16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 08:30:54 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5628UqWA56820198
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Jul 2025 08:30:52 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F3232004B;
	Wed,  2 Jul 2025 08:30:52 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2951520040;
	Wed,  2 Jul 2025 08:30:52 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.152.85.9])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  2 Jul 2025 08:30:52 +0000 (GMT)
From: Sven Schnelle <svens@linux.ibm.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
        Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: [PATCH] objtool: Add missing endianess conversion when checking
 annations
In-Reply-To: <20250514133515.1829691-1-svens@linux.ibm.com> (Sven Schnelle's
	message of "Wed, 14 May 2025 15:35:15 +0200")
References: <20250514133515.1829691-1-svens@linux.ibm.com>
Date: Wed, 02 Jul 2025 10:30:51 +0200
Message-ID: <yt9d1pqz6ll0.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EnMoh6oyu6nonv6U5BQsq1ON9Do85O3t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA2NiBTYWx0ZWRfX8NRvE2609ld8 74ziSLOslx+KEL8NVLIQ3xflx/VQ9tkJPKt9JGSDHRLVI9HJtcSim2109QjYYHzcYZq3p7abX1+ 9O32FxzlfSFHk3TwZLC730PXVbxuu587QtAzRbrTc6jI9ZCLW5SwAYvWBgZN8pEQ3gIrHVK0ndj
 3WhC4sz4jmea6YJwQOzZW6R9+970Dx0+HkNNS5WVWNkz5QkFqR8Qwjl99s8/oqznUterc+lLL5r amSB0ZVUUIENQOKUdNLRoVJT7jsKIAPKTOnj84LzS4vzouvct5zKvlfgSPBBkBcwXU6C/14kvTn gk3JPJgLIhPsZwXg6ifezwUDEq+dr51x64Y8e7O1UZATuhQ6Xo/TiWEDY1SGPgRUh5VilDU8aNR
 2JXHpWsjVwGuHJm1wUtNKD5GO+0REVaOU90hFBvz6KSNOPrgv3UtLDcBjlW4MliBj8kwwYBZ
X-Proofpoint-GUID: EnMoh6oyu6nonv6U5BQsq1ON9Do85O3t
X-Authority-Analysis: v=2.4 cv=GrRC+l1C c=1 sm=1 tr=0 ts=6864ee3f cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=peRKbTyMqrF04Hhbx_IA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxlogscore=833 mlxscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020066

Sven Schnelle <svens@linux.ibm.com> writes:

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

Gentle ping?
