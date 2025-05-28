Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC38288C37;
	Wed, 28 May 2025 14:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748443179; cv=none; b=qQlX0ufL7MCmFh87Heox6JHdm8eSGo2TdeC7A6/2SuBtHK54n27NZocb2dGRnCzk2ucsrKfQJYg5o8wt2438l/xcct0hCduB3Mr0/g0Gn2QCIeQErJvfiShkXoP/9AeW1vmQIXQPKAhV3OV0zCeN4gokhT7EXxB7Q8riX6ZSveo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748443179; c=relaxed/simple;
	bh=WQWL+eAKKiAuLfGDDdt/xLT8MzV7WUoPJ6v+IwTBPeU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=C24DYq5xv0jd/HZDxjq0B+5TlgqcH/4TIobGXZPnzucs87WSpvGSpVos8njMW13edZVe3NftwCPgHuRK6zbhjqJDLdSGrxyP8iyWRWaMFh60AaETBxFLVdlwrGy1UA0a4s6sa55ySfTmRO6sRX72FoE+6wh+NYB7KYh0eFZoJ7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=eR/C+2CG; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="eR/C+2CG"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SE9qCt032761;
	Wed, 28 May 2025 14:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=oAjHp1
	ItUS1j3EslUs9fCVFgilA9MP6Ipijq08HmnZg=; b=eR/C+2CGMvXBi+Apg76Vw8
	lTh8VVSbt+DgMQj8vGIiZxy8KW7GrAX26bIQ0wpofCOBlJHNRnvf8pg/5PArVecL
	JUSHaTi3WNMKD2LNfXje0mu0RGUdLzQ83f3A9CbvXroXvfsX/r8oZ8GjL4pbKDs2
	C9WlZInJnl2FNbgYXDMm2A3CN6k1Hlm9q1AUZQyMZMIX60liaNn5VBpPnX7eosMz
	X9hgT2HkS23TsMZrYXmQ5KjEYRQLM1FFoYghzmI2E+jvgrxXeUvQC0MI8JfXRWjE
	wl9y4myjYCejvx9IWw81DarQPJrvOT06vPjE0nD9LSAKCDF3+qGaYUgBdFhp3CDQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46x40jr5x4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 14:39:14 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54SEQ71X009419;
	Wed, 28 May 2025 14:39:13 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46x40jr5wy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 14:39:13 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54SAvDbg016187;
	Wed, 28 May 2025 14:39:12 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46uru0r13y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 14:39:12 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54SEd8Yo37421542
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 14:39:08 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3165120043;
	Wed, 28 May 2025 14:39:08 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C63B920040;
	Wed, 28 May 2025 14:39:02 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.244.234])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 28 May 2025 14:39:02 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH v3] docs: powerpc: Add htm.rst to table of contents
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <20250528054146.2658537-2-me@brighamcampbell.com>
Date: Wed, 28 May 2025 20:08:48 +0530
Cc: Hari Bathini <hbathini@linux.ibm.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-kernel-mentees@lists.linux.dev,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7FF625BF-03E1-4EB4-BEE2-BEAEB1C5DD96@linux.ibm.com>
References: <20250528054146.2658537-2-me@brighamcampbell.com>
To: Brigham Campbell <me@brighamcampbell.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=SdL3duRu c=1 sm=1 tr=0 ts=68372012 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=wukD7SXyAAAA:8 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8 a=bs08ehmE3BuyNYDtbNMA:9
 a=QEXdDO2ut3YA:10 a=n7THaJik3DRP1sDdJiGm:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: LUmEJCQEVgou63X75IUsqr_P7UpE6I4P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEyNyBTYWx0ZWRfX/5sC9EyYfYQf 4kBPoiHoytPVz02DUtS9VKeo7L+jJYfqh9khKL62ieg7w++gwphVlKl3d7NmIarLpGjYjMS7SVx OQ0AZeXmArv5kE3jFEldcDsFm3p0wPJ28L4Ua4XtcilZDiUPO+xeDaf1nJmnFK1alYCockum3cr
 5M2y/huHRw2U9qbukcN2OXQkwOeEUw0wg13qKkHrPmsuy8jVg7SW2tdEclyEUblZLaF88xWwm1X Q1lEx3sgIm2CeA2L4HePa2RRvPBDMFCkURkOgI0njKrZATte9wC7JoBzlDEHeH8rpbBmpZ3jJ0k l/UI7MSfaDZ/uP8UqPlDYwf2lCjY7XX+Kql2e927YyG6Q6KiBDa+YFtXJmoH8FkX3DS73Y7IkFz
 HVI4OE69Rqcz6o+F5/nDBm0Fs9JrkliF4lkKTJx2KejYs7bmvIHTYJdtD+zE5oom/5H6ug+r
X-Proofpoint-ORIG-GUID: OqOX88odwfV-1paicwDnn1JM_cS2iwlR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 spamscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280127



> On 28 May 2025, at 11:11=E2=80=AFAM, Brigham Campbell =
<me@brighamcampbell.com> wrote:
>=20
> Fix the following documentation build error, which was introduced when
> Documentation/arch/powerpc/htm.rst was added to the repository without
> any reference to the document.
>=20
> Documentation/arch/powerpc/htm.rst: WARNING: document isn't included =
in any toctree [toc.not_included]
>=20
> Fixes: ab1456c5aa7a ("powerpc/pseries/htmdump: Add documentation for =
H_HTM debugfs interface")
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
Thanks for the fix

Tested-by: Athira Rajeev <atrajeev@linux.ibm.com>

Thanks
Athira
> ---
> Changes in v3:
> - Edit commit message to conform better to de facto kernel development =
style.
> - No changes to the diff.
>=20
> Documentation/arch/powerpc/index.rst | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/arch/powerpc/index.rst =
b/Documentation/arch/powerpc/index.rst
> index 0560cbae5fa1..53fc9f89f3e4 100644
> --- a/Documentation/arch/powerpc/index.rst
> +++ b/Documentation/arch/powerpc/index.rst
> @@ -19,6 +19,7 @@ powerpc
>     elf_hwcaps
>     elfnote
>     firmware-assisted-dump
> +    htm
>     hvcs
>     imc
>     isa-versions
> --=20
> 2.49.0
>=20
>=20
>=20

