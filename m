Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F181C878E
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 03:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747539924; cv=none; b=Y105szmN7wV0Yhz8cTqZgV0v02mcbwOkJ5br3lSrRJsfH0T/9IGjgda7g9021SR7F6W4jEui1RKIWV5uOH3WrxqrsBHgtp8N4zvrQOoI4DSQWnRzCDwU8DDx0Ol9vv/c7xcc/zbG+i5y284nHv2pYnJ3qHu7ITdNVnoakrq3W90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747539924; c=relaxed/simple;
	bh=SUlZB336NSSEQ4Du1L6msb1F4gYxYOs/bn590zqsxtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GnkvOFEdsuQvTOm/Qu0bFg5QhcuZ8JjJtGmLB/32o+ZG1bVI2YGxGjEBQ6Bp65W1xIq2SY+9WvQ+O5+BFXw623n5oywPubQXwoHS0EtA+fH3rsbhKNl+TJXU4sFGcTg4sz979YFtU1cY9iuJ29EexSHB68vQpHQziaB3uxSoDCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=oYVc7cdN; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="oYVc7cdN"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I1LrUF012777;
	Sun, 18 May 2025 03:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=S5pBXQ
	fiiZWtwj2Z2OcVUVAK9uU5YWfhMwVhMgLBva0=; b=oYVc7cdNGr3/+BSS0Qf2Lr
	UFUl9UZA1DItQei12xU9wY8VL8EAldfb9oaVJVgy8maQDsG81KjUycH4MQuVi9LM
	xV1s40sNQ9r7SnkEtpdlwR0E4GER/tPrr3ceUEZXpCnEZid6u42Q+GeiAI0x09qZ
	ns+qjr828/65+TavQ0tdzUSDyNAqCP+ORRepWHwP0g1dYMW/2MokGX2SocFN+m9y
	6DnogxMJaOhbLsjIVc0IqAU3cz2Zo8kwO4OEqSPgF7ty4ZsElWuuZXjiTpSecZRg
	DRz+xG1n821plWh9j9JmCefm+dk97YQgU2fNfhNZXzpp0A5rs0qYLiL9ZJm1x9eA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46pqagav8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:44:52 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54I3iqOF018021;
	Sun, 18 May 2025 03:44:52 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46pqagav8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:44:52 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54I2gpxI008244;
	Sun, 18 May 2025 03:44:51 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46q70k05yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:44:50 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54I3ilGO51053022
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 18 May 2025 03:44:47 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2272220135;
	Sun, 18 May 2025 03:44:47 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49CE820133;
	Sun, 18 May 2025 03:44:41 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.51.82])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 18 May 2025 03:44:40 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Shivaprasad G Bhat <sbhat@linux.ibm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, Gaurav Batra <gbatra@linux.ibm.com>,
        Brian King <brking@linux.vnet.ibm.com>,
        Kent Overstreet <kent.overstreet@linux.dev>,
        Thorsten Blum <thorsten.blum@linux.dev>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/iommu: Use str_disabled_enabled() helper
Date: Sun, 18 May 2025 09:14:39 +0530
Message-ID: <174753967077.24504.11069922120659244594.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250210224246.363318-1-thorsten.blum@linux.dev>
References: <20250210224246.363318-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FweBwmxxUgchFmuM_-jO3bea6jZuAQ6W
X-Authority-Analysis: v=2.4 cv=LLNmQIW9 c=1 sm=1 tr=0 ts=682957b4 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=zcM4IMS7Y6FqgFCI1eoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: rwPcFImpyFuxi_tuNXgja5cbjkWt88X1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDAzMSBTYWx0ZWRfX9gtNYiHrgO6/ MYAthwgT36oxHojFHA21EywccwaIcBei/XSz5Q2eWbfH0p2PwzA+pbU/ZUmyMA3vkF9289OB5Y0 ZKqHwxQYed/iQ2kNV3KDWtapc+ZX066zAAmktSsWgerA6g9u6tvKEZUvin+PGcvIFjhwe5UTT3G
 TIviWUlj6yaJGBeMj5l+LF2gu7OS99OTTbBG0FZfcNoqLGnnZLgJ9iKfKJlbwkhP3pWFFFscAo7 +VLJaRPJAtfzSc+0P8eb0tlJvcooDdQ64xYSyghpxwz3vYhRDCOiFyMEkt/YuhM4iESCPTAtn8D rTw8DVRi/030wjaNwDYvINGJWrcnDaVMluYPCVxh0CK017Ge+2mxLbCSYNRm4skUzN9ynsIoNix
 mzmJ83Odqrpg4ScUCT7eeZcNeGhL35q8Gyg4UzY/WNPYevkiDjKbik0QGiBqXtTiHXsvWqLh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 mlxlogscore=662 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180031

On Mon, 10 Feb 2025 23:42:44 +0100, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_disabled_enabled() helper.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/iommu: Use str_disabled_enabled() helper
      https://git.kernel.org/powerpc/c/f15e87340afd4f5a35575e112aa4bdb0a138aa26

Thanks
