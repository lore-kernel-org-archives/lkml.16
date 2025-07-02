Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AEB2A1AA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751450629; cv=none; b=rghzjNf7wSGlTSumEKMO+Ag9bMA46hhYTR1KkJxh0I3A7m/zFepigmBfJ84T3LaXnbpsBkFd3pLRmdaVJrTIZykJaH0jDD4NWhX5BgcEB/swblUOH2UgWmN00S+MEV063fTf2h7wpEJXvJ/uKjHas041RFlcJ4WShmbuXFVFY90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751450629; c=relaxed/simple;
	bh=rovKCdgkUOXPOgvVeWZ5LO3siIecERaHLLMd5oMtwzQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FhQxnq+b14D+LTL8N9SK1dFZCrsYNw1w1eTwnrmUt/2awE5rHS8WI2h6aKLOM1uSuX6eRm4kj2BMufiQfKnY5T8zoGL1ikr/EYPmVi/NkPR4p2L9iQSU2bOoflYdH0XkaoLGsp7P6jybvmSjCu+0ZCrmmgWwuQyJMsCqsa5z/5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ZgSpwBKH; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ZgSpwBKH"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5627LLK3029725;
	Wed, 2 Jul 2025 10:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=HJB9lUxpTYnJK+paRvtmjElG/wgCc3
	Hkv8JjaMSnA7I=; b=ZgSpwBKHCig0iYpq8p4wxe+Mr7pfN/g5/neA8rdpwO40vd
	EHjTjgXByIRbNq4k8vCqWqx83L84FdD7xkS7YLq7hDTo+4eMbzWR73kJKV0rQh2+
	ZsfYPA43BXxhsEl+ZpAt1tMin2mEjrJLAIo1FiJQcpNm/n0JkJBDrOSUL5UXiG1d
	+J90Rez0rc0JEcqVaUD//xc6hosPgiBHoHfGZEkxE046bbS4EfiURjZwFtz/396C
	qWQBagkeyHKypvaTDUJjsU4FUwxH6UBtJbjLqJ0bP7GC+XPduTsHrhu1pOBC7jdf
	2rYWRxE/gHZ34lz5PSeeSlJmjYbvs44N8c7WawIA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j7wrmr6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 10:03:44 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5625R5B6021106;
	Wed, 2 Jul 2025 10:03:43 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 47jtquf4c3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 10:03:43 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 562A3fPX53477860
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Jul 2025 10:03:42 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E03082004D;
	Wed,  2 Jul 2025 10:03:41 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C717E20043;
	Wed,  2 Jul 2025 10:03:41 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.152.85.9])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  2 Jul 2025 10:03:41 +0000 (GMT)
From: Sven Schnelle <svens@linux.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org,
        Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: [PATCH] objtool: Add missing endianess conversion when checking
 annations
In-Reply-To: <20250702083825.GM1613200@noisy.programming.kicks-ass.net> (Peter
	Zijlstra's message of "Wed, 2 Jul 2025 10:38:25 +0200")
References: <20250514133515.1829691-1-svens@linux.ibm.com>
	<yt9d1pqz6ll0.fsf@linux.ibm.com>
	<20250702083825.GM1613200@noisy.programming.kicks-ass.net>
Date: Wed, 02 Jul 2025 12:03:41 +0200
Message-ID: <yt9dwm8q6haa.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=E/PNpbdl c=1 sm=1 tr=0 ts=68650400 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8 a=AI3QU7EO4IhOd1qKGRoA:9 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: gRSBysdsfCsFPVmBl2ms5ndZlJuPj-aJ
X-Proofpoint-ORIG-GUID: gRSBysdsfCsFPVmBl2ms5ndZlJuPj-aJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA3OSBTYWx0ZWRfX3m/T2UxFCRwI EOyRxB86U56UaZfb4S5xRGnjywN5KbXwAG3UbQoJcQr2x2XZ+TBLYOfEeVS68cdYmeaFGMNVcxY jBVUNxorbVn4EpF2n/+3YbZBxC0O8jpCs3Em8RgDRgw/+xvlvN9uXs2jwecnLWxBXO1uoSIUcd6
 FaBEIL51E//5bkTEmfvhPTNboWpm7FEVDjxd7QpyBMnlgqL/+WstxtZ9CesPzS8Vwyguv9157dq tusr9hA1h3qfWJDGBu9VQ/uVuu01Pj2U2OK7+tdbdAwwrzbcGG7SCKItdgJnS+QpKxMDMaIc4mO 7ta3Fvfr9UgpnfXRZ2fnMCLfccaMxYbkiGClLTH6NGIdlgHvqrzOJe31HTf19innrKzYcyy2+ov
 4f02sFKQ59PFGp3ibCnWyJ0bbkJMPPPwywdPEwWvsrUKnKtyZ8bcGw99/s0BTMCu+MqYRn3i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020079

Peter Zijlstra <peterz@infradead.org> writes:

> On Wed, Jul 02, 2025 at 10:30:51AM +0200, Sven Schnelle wrote:
>> Sven Schnelle <svens@linux.ibm.com> writes:
>> 
>> > cross-compiling a kernel for x86 on s390 produces the following warning:
>> >
>> > drivers/mfd/mc13xxx-core.o: warning: objtool: mc13xxx_reg_rmw+0xc: Unknown annotation type: 50331648
>> >
>> > Fix this by adding the required endianess conversion.
>> >
>> > Fixes: 2116b349e29a ("objtool: Generic annotation infrastructure")
>> > Reported-by: Alexander Gordeev <agordeev@linux.ibm.com>
>> > Signed-off-by: Sven Schnelle <svens@linux.ibm.com>
>> > ---
>> >  tools/objtool/check.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/tools/objtool/check.c b/tools/objtool/check.c
>> > index b21b12ec88d9..35fb871b2c62 100644
>> > --- a/tools/objtool/check.c
>> > +++ b/tools/objtool/check.c
>> > @@ -2316,7 +2316,7 @@ static int read_annotate(struct objtool_file *file,
>> >  	}
>> >  
>> >  	for_each_reloc(sec->rsec, reloc) {
>> > -		type = *(u32 *)(sec->data->d_buf + (reloc_idx(reloc) * sec->sh.sh_entsize) + 4);
>> > +		type = bswap_if_needed(file->elf, *(u32 *)(sec->data->d_buf + (reloc_idx(reloc) * sec->sh.sh_entsize) + 4));
>> >  
>> >  		offset = reloc->sym->offset + reloc_addend(reloc);
>> >  		insn = find_insn(file, reloc->sym->sec, offset);
>> 
>> Gentle ping?
>
> Oh, I missed there were two of these. I merged this:
>
>  https://lkml.kernel.org/r/175137563313.406.6298042704364318030.tip-bot2@tip-bot2

Ok, thanks!
