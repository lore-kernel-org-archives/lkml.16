Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E692DFA4B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 06:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744870186; cv=none; b=ftAETNKYjfNyaNmrDkXmY+t/UMZMFt3EBAXVzpgdsDPE7PZvNn3ikw9UUHvJNgkF5V3zBgotrZGK8xwfEdgVGH2jxgR8+Jb5ZPoPfF6q7xuaa47vbZ5ewCxuS5Lzm3XC87H4ApY6a/svNBtr4H0wvSDNqpYUXMMEHfrd1LNExTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744870186; c=relaxed/simple;
	bh=lXDEFZjhpvjtK8iiYDFuw+tF0cAOWt6YH0wCwA0iPg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJ+qJb2PX4zDIiZl2b1w/7pR2OhRJahQnCjaInmON0azdCIs1mmqhYoe2w5gMvbQqK6KPIVTFtApJkfFZ0xLhMrki5JU40PWo4J4lLOMJdYMqQR+azGAzRvRCSlPJ+OjN3bbBzqHsuTXYdl08y1wRRDBCvUE9rfGTQnekgQle4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=FhOkpxSp; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="FhOkpxSp"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GNlAqZ019278;
	Thu, 17 Apr 2025 06:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=OibXNJCHuU82A+EwGowd4e3lnAlwTB
	ETZ7mbg5uTl+o=; b=FhOkpxSpmgICINQ0SP8mU9hZrbuIeTDnx8lpswj1QNafVH
	DlxjyeGnHMkvG7Ior+JiVeOD5v69rRYMGIERnw6h3Q1wJYl5I2Xikg/H7BMbefer
	JIfsx9gzdmGZ9QvIrwuUlQACJcSNCMjtKXuK37HsePn70VDxqUIn7kyJNCW9BYfe
	QMGUuvQ14zve2fa8sgDOUrEBL/Mpgv7kEw7tKAqWE3sJoNut0FyUoB5e4sBi6mmS
	CF7Qvb2DzkwidK7UfLsA6uTD1Rn0aFhpvDcI73YHIMls4onsSpF58lri+v1bt7rh
	mv3tnKeC4G1ulH7mZPx0gTMvDvX5PJdF65mIkwOA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 462ph09amt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 06:09:31 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53H69UCn013794;
	Thu, 17 Apr 2025 06:09:30 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 462ph09amq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 06:09:30 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53H23KSh017207;
	Thu, 17 Apr 2025 06:09:29 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46040m46b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 06:09:29 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53H69Qfo51052878
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 06:09:26 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F18AD20040;
	Thu, 17 Apr 2025 06:09:25 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E73420043;
	Thu, 17 Apr 2025 06:09:24 +0000 (GMT)
Received: from li-e1dea04c-3555-11b2-a85c-f57333552245.ibm.com (unknown [9.109.207.139])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 17 Apr 2025 06:09:24 +0000 (GMT)
Date: Thu, 17 Apr 2025 11:39:20 +0530
From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
To: Misbah Anjum N <misanjum@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arch/powerpc: Remove redundant typedef for bool
Message-ID: <jwhxcpjsikjfwmeibpssbc3mvr7dhkd225bfgp4pukr3caugxd@mdruiivxfhod>
References: <20250323163607.537270-1-misanjum@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250323163607.537270-1-misanjum@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=QJdoRhLL c=1 sm=1 tr=0 ts=68009b1b cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=WN4RLpz-Xj6QzkEfG4QA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: nwZmyqO5dRddaamJ3gdckl7Dq4Uca1t_
X-Proofpoint-ORIG-GUID: 9vC7EEff8svzUx1zPm7V4x-nUUs2J2NH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 adultscore=0 mlxlogscore=833 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2504170045

On Sun, Mar 23, 2025 at 11:36:06AM -0500, Misbah Anjum N wrote:
> Hi,
> 
> I noticed that a patch addressing the same issue has been proposed by
> Michal Suchanek:
> https://lore.kernel.org/linuxppc-dev/Z86liwlwP5WvrEkw@kitsune.suse.cz/T/#t
> 
> The existing patch addresses the compilation error by modifying the Makefile
> to use `gnu11` with `BOOTTARGETFLAGS`. This is a practical approach to avoid
> the error in the short term.
> 
> This patch builds on that work by providing a long-term solution that ensures
> compatibility with C23 while maintaining backward compatibility. Specifically:
>     - It uses `__STDC_VERSION__` to conditionally define the `bool` typedef only
>     for pre-C23 standards.
>     - It ensures that the code is future-proof and ready for upcoming C23 standards,
>     where `bool`, `true`, and `false` are reserved keywords.
>     - It avoids reliance on compiler-specific flags, making the code more portable
>     and standards-compliant.
> 
> Changlog:
>     - Adding version check via __STDC_VERSION__
>     - If  __STDC_VERSION__ < C23, 'typedef int bool' is defined as usual
>     - If __STDC_VERSION__ >= C23, the typedef redundancy is removed
> 
> The patch has been tested with:
>     - gcc (GCC) 15.0.1 20250228 (Red Hat 15.0.1-0)
>     - gcc (GCC) 14.2.1 20250110 (Red Hat 14.2.1-7)
> 
> Thanks,
> Misbah Anjum N
> 
> 
> Misbah Anjum N (1):
>   arch/powerpc: Remove redundant typedef for bool
> 
>  arch/powerpc/boot/types.h | 2 ++
>  1 file changed, 2 insertions(+)
>
Reviewed-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> -- 
> 2.49.0
> 
