Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F69624503F
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297586; cv=none; b=MMR/wyFjjIQMR6x46x3/9+57ELkmmCCBsYp3q/zCCqaj+orPcyeTw1RV5bf+LMewtc4bgkvUJnpYHobusTuVjLbwRmxupoLibtuLDxUsdnOwPr7IBuehV8pA3s7a9qk9EyA519KXhUvjxkng338f6tGdLpKlG4fggyieVilAE2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297586; c=relaxed/simple;
	bh=+tiFBHASS9ApEGuhGgBZ1uGEL82XGoSYrrQBTP8gc38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SwWS98XSx7FS9gn85vjKmvULjgJyoGURE2vRb3Dsk5aJIcAOKG/hMAILTR1sQYu8FA3+qcM8WVRFZo7TXQUb4VPBjjJGl9L+r1Pfj340LqbTfanZALn1iDGClGh3jE2rRssfCLeT+XKbQFC8irltPNXYE7caFgDM6pTwcD63j4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ZUAHLyzo; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ZUAHLyzo"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UDgKhG000747;
	Mon, 30 Jun 2025 15:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=zpNsqei2QFEyuLVyVO39jdFYSbIC8N
	oB5Ab/RaHUwvA=; b=ZUAHLyzoVMX+gSYfXm9P+usKtePNi1cX0aRM9xnXOfs1eC
	69086ER4gIhMWthuj/D04kPhsWHOICtz7uDQWmgX5swr/6SCAFNh24L+Bkvq+5Hp
	A5+rjmfsJyF/hnaGyvLA3uPBGLO4F364oMYHo5bl8Z9DhMulpRrQYaLb+M1V7+u1
	N7TSiz56aNxZb0MYKx00pYpdHe3TSs+e3lQhRBLPPgB0fsMhhSwVNUEDLnQ4xuJY
	5pO4HudmivcwpaF06d7sk9GAQboZV4DMrHvc2+c8TA9P/nnX44W8t+FO2yfH3NtJ
	eTazpF9dePb/wBA8giSaaJFTVmVVRTHflyTYU/fQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j84d292y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 15:32:58 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55UBaHgp021361;
	Mon, 30 Jun 2025 15:32:57 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 47jwe365eg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 15:32:57 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55UFWpUs42861028
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 15:32:51 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 640552004D;
	Mon, 30 Jun 2025 15:32:51 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2275B20049;
	Mon, 30 Jun 2025 15:32:51 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 30 Jun 2025 15:32:51 +0000 (GMT)
Date: Mon, 30 Jun 2025 17:32:49 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
        linux-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>
Subject: Re: [PATCH 0/2] scripts/gdb/symbols: make lx-symbols skip the s390
 decompressor
Message-ID: <aGKuIf0PV8CfITRp@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20250625154220.75300-1-iii@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625154220.75300-1-iii@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VJmooM9g4XkzKFnuhz0pgPMVHuBmzp_7
X-Proofpoint-GUID: VJmooM9g4XkzKFnuhz0pgPMVHuBmzp_7
X-Authority-Analysis: v=2.4 cv=Ib6HWXqa c=1 sm=1 tr=0 ts=6862ae2a cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=pcLcdM1_4t_Ntr76G24A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDEyNiBTYWx0ZWRfX5FdrlzxMqDlc hOZffhWnmD/72PeazI3drdUAoyHP2EenYWncgvtYL44AvSBYmZ96bqKY/2DxgmPCJasvkygyJJZ eO4lGbPe3e8fdF/mWacry5X9wothvdcfkXJswdvu5G4eIP4rMeTuNBGqxffu+tLJhpBA1IL8IH4
 DZ3Bn41zSZbL0VPj5YiLrGK1lozMUKWOxaU+TPY4cMMdAsDQ/VeI0Q9eiepe9AkgW7kr1G6Nkwu qJaWsjxQNx0/tZRYUhFV7XXpXWPKY0j45NkB0c2tGyx5LTbf8NHIazyaAF6SE70I4LbH2je6l2o HRX4QLB/jG80aDk3omk60kzFIB5xvNnjfZJDn0NDrQtrt50PrY8Y6sYCVSfkwlkGQwiCxZD9VfM
 TR/3Z6Lv1wtb6Aw7JqiKp8qfO1e8feVU/zhU1GrDLPC7UORhVTDTYoDuBdVZZCa0gvgZlKZL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1011 mlxlogscore=529 lowpriorityscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300126

On Wed, Jun 25, 2025 at 05:36:50PM +0200, Ilya Leoshkevich wrote:
> Hi,
> 
> In order to debug the early s390 kernel boot, one has to skip the
> decompressor code, which requires some private scripts or memorized
> commands. This series makes it work out of the box with the lx-symbols
> command.
> 
> Patch 1 adds helper infrastructure to the s390 decompressor code; it is
> already acked by Heiko.
> 
> Patch 2 is the implementation; it would be great to have an Ack from
> one of the GDB scripts maintainers.
> 
> We would like to get this series via the s390 tree, if possible.
> 
> Best regards,
> Ilya
> 
> Ilya Leoshkevich (2):
>   s390/boot: Introduce jump_to_kernel() function
>   scripts/gdb/symbols: make lx-symbols skip the s390 decompressor
> 
>  arch/s390/boot/Makefile      |  2 +-
>  arch/s390/boot/boot.h        |  1 +
>  arch/s390/boot/ipl_data.c    |  9 ++++++++-
>  arch/s390/boot/startup.c     |  2 +-
>  arch/s390/boot/trampoline.S  |  9 +++++++++
>  scripts/gdb/linux/symbols.py | 26 ++++++++++++++++++++++++++
>  6 files changed, 46 insertions(+), 3 deletions(-)
>  create mode 100644 arch/s390/boot/trampoline.S

Tested-by: Alexander Gordeev <agordeev@linux.ibm.com>

Thanks!
