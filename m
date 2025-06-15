Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A63D28E17
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 02:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749955159; cv=none; b=V5CyPJdlFuA7AAN7vtnVuN/cdlSwSquQp5hyHO4dgrzA64BSXrdlr5H+2RuK453ctoOQgyUJ56nrQoZaIP14TIUwfadWu6qpph5dm8CTtVN9gGT5k7bjvEX+gZRf/VjUlHSifa0gflmCiHdiHkbsuh0c5+2sR//ddo19ARfYDAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749955159; c=relaxed/simple;
	bh=ckFMh341bp8fNeZvgxoSE3EZfH4467TO9wTg/YnqARU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EVlwSAi4tHNJWXXRP/XEALdBZ/1FKN5PG4QeXm7vS6U9baAmB1H4QyCoZLKtvZr4s8awKZPN9AHiDvtvP6oqgVttT5lse4J/igO0iYydsjxDRpcieA1+mFDA0Wf9uMMfSURUpXc72PYLgvRihpPdJ6EucHWya0czeq6hADh7/rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=tu85OA97; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="tu85OA97"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ENrRVX006879;
	Sun, 15 Jun 2025 02:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=GLsN3B
	IbC62Y6nIAz8twezxmUNeBW7WQopcxPpNyxDM=; b=tu85OA973fbS4qU43pcL4c
	GaWa09kDW/fwQryQ8zgrNo7WRrxNNfNNIopHL9mt3/aO79YywsT2RGQUlGuy9GBv
	mC3/Zfc8X9yywuGo2aYUI34rVjjRuQsnObAsY27BpWpPDEn/nbTvlp+8adwhQZUg
	cXm0L41jJ47BvBQ8RVULPO4cdjZoLyHZ7QBUqCrnjVMiyrBxUni3V9a/hem+SWjG
	ALcy539pRkthjxnppET3oFl/h7VRISq57KvWjiDf9eEyPxWWS6X3x+wxQvA4TT+e
	2cz5AMCHuPvroANj5nP/vOPJg+l8qdSun1+yxJ8D3fEot6EuQZ5tJmTPerdC+jng
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4790s43k1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jun 2025 02:38:54 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55F2Z2cu026510;
	Sun, 15 Jun 2025 02:38:53 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4790s43k1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jun 2025 02:38:53 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55F1MZES003333;
	Sun, 15 Jun 2025 02:38:53 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4751ym8vd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jun 2025 02:38:52 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55F2cpEu4457142
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Jun 2025 02:38:51 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49D6420040;
	Sun, 15 Jun 2025 02:38:51 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D96A520043;
	Sun, 15 Jun 2025 02:38:47 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.64.23])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 15 Jun 2025 02:38:47 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Naveen N Rao <naveen@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/vdso: Fix build of VDSO32 with pcrel
Date: Sun, 15 Jun 2025 08:08:44 +0530
Message-ID: <174995502356.107804.9330497672277280591.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <1fa3453f07d42a50a70114da9905bf7b73304fca.1747073669.git.christophe.leroy@csgroup.eu>
References: <1fa3453f07d42a50a70114da9905bf7b73304fca.1747073669.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE1MDAxNiBTYWx0ZWRfXwj+xad1bDUla 3zFdW+Tu8ZSk1xOAf9jE0/ngGrfbBxIAOCVkBeRUMuijA/cExUM3S1/ltqy8YWfDM+nc2gNK2xy S3wMC8cHPwF/r2bmtnHnIky70/5pVQADkrG/hXMxvu36RsdG3uVUt2fDQJCh6TfCgqBF2ZQAM3T
 avniqkkMlpg3yS42mQl0gE/zP9j/yvuKxqGBogqbvhs0XlD4UbNQ3Ap2V4JIrYNGCFBknQ1kf9e 9PNUyjHA8+cYlKiO/Q7auGVQJo8f2q0sJjp7uIUuur3YtYuQwPR/OfB8h5X53+qNvPf0RQgBA6H PMqlexlZTyR7odLPS/qZGpmQvsMrodCstM3VWLheE/MUZwxar37ipbh1eihB2meh57z3otqtG3q
 8MCaDCPIV6QkVYp1mRYIgxatzeSkRlV2paYw9QLy+i9HXfXL3imYWke9PFtLZgOx9WkAIigZ
X-Proofpoint-ORIG-GUID: __4u8C49US9QhDIQnE7e_pJf24hjFO0d
X-Authority-Analysis: v=2.4 cv=Qc9mvtbv c=1 sm=1 tr=0 ts=684e323e cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=lQhRP6PgGiLpFKoNWogA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: c4NP0XlgR8WZKc-LiuU90RmdX32rcY-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 mlxlogscore=788
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506150016

On Mon, 12 May 2025 20:14:55 +0200, Christophe Leroy wrote:
> Building vdso32 on power10 with pcrel leads to following errors:
> 
> 	  VDSO32A arch/powerpc/kernel/vdso/gettimeofday-32.o
> 	arch/powerpc/kernel/vdso/gettimeofday.S: Assembler messages:
> 	arch/powerpc/kernel/vdso/gettimeofday.S:40: Error: syntax error; found `@', expected `,'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:71:  Info: macro invoked from here
> 	arch/powerpc/kernel/vdso/gettimeofday.S:40: Error: junk at end of line: `@notoc'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:71:  Info: macro invoked from here
> 	 ...
> 	make[2]: *** [arch/powerpc/kernel/vdso/Makefile:85: arch/powerpc/kernel/vdso/gettimeofday-32.o] Error 1
> 	make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/vdso: Fix build of VDSO32 with pcrel
      https://git.kernel.org/powerpc/c/b93755f408325170edb2156c6a894ed1cae5f4f6

Thanks
