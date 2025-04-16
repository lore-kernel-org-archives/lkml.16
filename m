Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0484B241673
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744803773; cv=none; b=lqS7KhkW/w3jdrOiKJW5UF6xPp/TPAKqeg2aY2F9fH5DGvnLQoNYPng/toRboOYUCKTk+4bMoqladwfVReTM7pXMk7huPExSiAP8B2t4tcNfAKFFr8Hxv/yV8qkXi7DbPLWIXA0iSFhAZouvE4twLxSZ1jukaocQs4b1KYKI0oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744803773; c=relaxed/simple;
	bh=JMjDwH/o8RzPEzjltNKbdLR6klIkr+mhqoHQ68CaRkc=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=HSZzq0aZHamxjm9n90SOk2+YpJ7N9FxgWcIpPaIyDI5yNPKdcN1MP0cLLRhBE1kz+ywMiEtXDMw1zYbajCDaOS4BCrCJju8nX8t2X0n3k5Pa4Bw0IZL5TRA17riCg3bEQC0A6KFvTNxlzEY+DGpvou/kDZtxuBlrl6FpImyL4y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=CxQRyQRG; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="CxQRyQRG"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GAiDqR026718;
	Wed, 16 Apr 2025 11:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=VDC7VFGUydYdFkbJC9ubCp+8u8uW
	7LLKOWCFxu0Qii4=; b=CxQRyQRG2kMPIfduLrEwLNMmneyWpqCraR99BpyO8t1l
	di8G5iajEQmNLOPpEn8Tx5cHq9hl5rH7UfFgnMf62MsZS/ZLWkwdqzuUoInRNGwN
	fRl0LHXBuJ7wjNNu9g0fLAbisfbIZSSe42Ezfh78AQck590X88CE9xn+ZrrXXA10
	Z49ZJbzS7r278VOEQjuP76nEGxHpooyg4KotQem1Mif9et9SwN0buz/5RYAVayOD
	5a+AGVJ69YEDA2OQePm4zYSQsB+/Wy1lkGV1y4RUFsLDAM8M50otjgwE2uvm2XBC
	RkeVnfEjbCI6dLm7dfW7gJnTrbf9GVka11NDibtOXw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 461ykt32sw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 11:42:48 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9JEEr024907;
	Wed, 16 Apr 2025 11:42:47 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4602gtgchq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 11:42:47 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53GBgk9l26280530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 11:42:47 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B106A58054;
	Wed, 16 Apr 2025 11:42:46 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0219C5804E;
	Wed, 16 Apr 2025 11:42:45 +0000 (GMT)
Received: from [9.61.241.145] (unknown [9.61.241.145])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Apr 2025 11:42:44 +0000 (GMT)
Message-ID: <2c04b7ef-dc85-4a40-b0d8-6ae73c20b65d@linux.ibm.com>
Date: Wed, 16 Apr 2025 17:12:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
To: Athira Rajeev <atrajeev@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Namhyung Kim
 <namhyung@kernel.org>, mingo@kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Subject: [mainline]tools/perf build warnings
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QqZ0DZG7bpE7aefwz3L6twNJeP_Y6A0H
X-Proofpoint-ORIG-GUID: QqZ0DZG7bpE7aefwz3L6twNJeP_Y6A0H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=818 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504160095

Hello,


I am observing a new build warning on today mainline kernel, with head 
commit: g834a4a689699

Repo:https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git


Warnings:

diff -u tools/include/vdso/unaligned.h include/vdso/unaligned.h


If you happen to fix this, please add below tag.


Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.



