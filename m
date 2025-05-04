Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B08971747
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 03:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746328944; cv=none; b=JHF033uQevQrMyoZvIAYBHxI0vjw3EDCd0uIZhCvJfgEByrZN9Gts4HkQzXfa7FDN5t5NnOUzGNqNd8ThQ1eanAr5hW7CG7GzIwMltGEEpSs0WjD0nelGc8Zk2zA7UxmTiXNVOsprPhJ7T+GCD9vpS/eakZfU/5hB+c9nYYTw58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746328944; c=relaxed/simple;
	bh=6m6nr1NWIiaVA3yLG5B7xln8rW+EjR8RPYRpKxxv90E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SzrbtWL8KpwQ86NXkOAlZLgACZzzJGfTEzYLAbeYQGuYWka/UXXVJs/2FL+FUJumdaKVWRV4FHkHeW1JckdcoJgGz9F7wEBWg545jqnaHil6ArWXQiZlVdnWBtrJnKCtKLx8e4Ao5TFPgAf7nXy4lnB/CJL61mX7Li2U3NMGliI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=MVDliMjV; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="MVDliMjV"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5442tbWj003043;
	Sun, 4 May 2025 03:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=2IJwWI
	cC2GXJ5qxdlZFd8bCuUrclbR4sO/f9KLtfXmw=; b=MVDliMjVlcWkREdfyVr92w
	eOZfaQZ3uYd01YmfcTbsMAs+aaFUkxwE6JGOZCIQNhgecBqZAN9DyBPaoNWeZTTp
	s9/Js5zR4ET8Y2GtGKzaJl2QWoP3h79qEJC8XU1/NOxUqt4we4CHL5owV4enE/oP
	c2N19ytAKUwHOSMGfGkqxwNgi6UehvqHKnD+rZnYqWrJyZF2v6iBk1DgAoJd4GW7
	qdCDXV0woFrPvh4wSfZAHsOmb3nnJqzBu3V41NfjBqsZe3RltamWgfqdoLFoWTRY
	Qvon3tzUpMmI6/ooVZX8/WXE63glpYCX1gl7nvQ2PHbiI8z+J9YR6ap3vFF8eXNg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46dw400dky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:22:05 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5443M4Bv017249;
	Sun, 4 May 2025 03:22:05 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46dw400dkw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:22:04 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5441rO2f032018;
	Sun, 4 May 2025 03:22:04 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dxym880g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:22:04 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5443M2HB42402056
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 4 May 2025 03:22:02 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2CBC520043;
	Sun,  4 May 2025 03:22:02 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F23C920040;
	Sun,  4 May 2025 03:21:57 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.99.78])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  4 May 2025 03:21:57 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: do not build ppc_save_regs.o always
Date: Sun,  4 May 2025 08:51:55 +0530
Message-ID: <174632869189.233894.17327433330282160163.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417105305.397128-1-jirislaby@kernel.org>
References: <20250417105305.397128-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=KefSsRYD c=1 sm=1 tr=0 ts=6816dd5d cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=Jr149zEfbG_pFFu6KToA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: GjWhigNnAKvimmrFS6NGyOzkmK0i_KQd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDAyMyBTYWx0ZWRfX8aCT9ijyTpKN AO2Zcq7f50ZmjGf0WpoMPWc3jMhLDzeutdUjXO+G8k7T3oOEJNLMvnzmA+r6EK4ijsNxKQwVwgE AdPaWOCC5zqdXdcnsbKpj/Zo5MqScVUCweAaYPCFP8Pumve0LYiv4Jq+zsUuhhqWswK9A5UHPuS
 3deTIFHroPDG0dFnbCnYMHTUckMx2H8wRbzaSyKiw9p6DzqrVKrC9lRL6erMeCtkD96eByfZTX3 esL/3Z2CgFfmLBmodjg6/tZs1/A/IFeoYLulCKwJYSQpyDU5D5IGlucAKRv7ah1JRJNiJSqa+7t mYk2NSOGliqthkciUKfD8MJGMGKNG+ZkVAst+T/XdamYCiynfQ0+iqjTsbuIXmb5iwfYGpApb+q
 0ydxaG8REq6EsYlzekQ/mI/RzYajXcyN1kalvUMDFbe/pB+4x9qfA/GR/zknoyoHwSM9QB4i
X-Proofpoint-GUID: hssWibf1N6YpkbyXrTvKaLw4tElQwzld
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=474
 adultscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040023

On Thu, 17 Apr 2025 12:53:05 +0200, Jiri Slaby (SUSE) wrote:
> The Fixes commit below tried to add CONFIG_PPC_BOOK3S to one of the
> conditions to enable the build of ppc_save_regs.o. But it failed to do
> so, in fact. The commit omitted to add a dollar sign.
> 
> Therefore, ppc_save_regs.o is built always these days (as
> "(CONFIG_PPC_BOOK3S)" is never an empty string).
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: do not build ppc_save_regs.o always
      https://git.kernel.org/powerpc/c/497b7794aef03d525a5be05ae78dd7137c6861a5

Thanks
