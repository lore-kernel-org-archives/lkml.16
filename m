Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE481DC98B
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 07:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746431672; cv=none; b=FCHEABUdBwyv7BWKtKmmci2YPKmjl96l7iLsP1pYFEaKhnodKU8ZWj5Mf8vk5yqbMW1XV4ZD2SXnDWlgd27EqK2pEh1QvvRqtAxbpmmNFTh64fTq3/OZ/yyEQflGcVIkNp0CKSEbUSVtA7+S2cKOq0+XXE3YitEqo+ouQZriqOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746431672; c=relaxed/simple;
	bh=AWgY/FK/gzokndzyuhiyuAZO2vF2awcWmnBZbwUTdkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rciAAhqOaS4cOlIuOpxsUMmL8wMoODOIzF6KLE0+k8MBGviu1MJ1Mp89nXpSdq500KByk6l7agCF/QH4hYGLkgPJR5QCXbNEO021noCGI8B6UAE9Q5avEDEyR+7ld42wt4Bzh0qPre81x+BhROOsqo9ReS5l+ib1fJFdWcakkE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=nrXHZkKL; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="nrXHZkKL"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544Nkf94005900;
	Mon, 5 May 2025 07:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=F/h88Tsd1ya9ti7j7
	IRQj5EYdS5TpQ9agwRHTxBlyVA=; b=nrXHZkKLGRr2YJiQpN4vbN2wF19WTEgnw
	w6P43VdrgUgi6FGhBK9AEOMR6y8iWdWMzrja01EFNmjOAWUIPDaYWDbV51gVDppt
	ulqJc/Hiz2RanKO6ZAArUS7Rt3B6mwgVnIwWdrV/Z8gDudJnykRpD3w7XYQ0KZrG
	QdjW37CTQ/w40aAjUYBp+Uj2hqbnbvF8yRb5Q+5c9RqrYoBwFUrEhlnQMqa1kJuc
	KMEXZ0NNh0HNClC4wy+8Bi+zq04VVAf7n0vxnKAgfvVcJAL3ZEdZahfX/vlOdO/t
	K3TnLfqRQlibax+0jvP2kZwom9Kcc6ncSULFDAJsk3m46dxDqDuFA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ej6ysedr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:54:16 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5457p51f010075;
	Mon, 5 May 2025 07:54:16 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ej6ysedn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:54:16 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5453xo99014122;
	Mon, 5 May 2025 07:54:15 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46dypkd0c3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:54:15 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5457sBvV49545488
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 07:54:11 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 947F72004B;
	Mon,  5 May 2025 07:54:11 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B4E820040;
	Mon,  5 May 2025 07:54:09 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.in.ibm.com (unknown [9.109.215.252])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 May 2025 07:54:09 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        mpe@ellerman.id.au, peterz@infradead.org, ajd@linux.ibm.com,
        mahesh@linux.ibm.com, hbathini@linux.ibm.com,
        linux-kernel@vger.kernel.org, Srikar Dronamraju <srikar@linux.ibm.com>
Subject: [PATCH v3 6/6] powerpc: sysdev: use lock guard for mutex
Date: Mon,  5 May 2025 13:23:33 +0530
Message-ID: <20250505075333.184463-7-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250505075333.184463-1-sshegde@linux.ibm.com>
References: <20250505075333.184463-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kBQVnUnuFpLSvP7f5dZS-KQDlcBy5Da1
X-Authority-Analysis: v=2.4 cv=GKAIEvNK c=1 sm=1 tr=0 ts=68186ea8 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8 a=CqbteBQ7vrl-IhNh9TYA:9 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: SqF5Eq3rrK9GgJ0USVieMbIFd3QRexFm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA3MCBTYWx0ZWRfXxeue7AZ49zOX eJ7bvxsFcreKKCvC4Cqc5nuaIUOkK0JMT4sqcJNnnUHt5BsmHbIjTwH+eWduwzTT8kyqSbO/tTw YnYsmnn4K0qhyQyS5nd9ECeCfQHTwDqH/L3v0HGUe5F4bYKTzUIXB/XwGRAzE5ksbfmgWNX0ObM
 58d0vr0igz8Z7aOtHxZ6ZEfC7bS8Bnb6nZlNs25/srGV5rF+c8SY+vkr3PJ4Es4KqdWNMlopuw2 zbYYFmL8rMMddUdxfdTqsabiF1Eaxr9dAgFk9tJY19wl54xt/SqRyGPsvCsd0Sb3/mQ2eP1mQHJ /K8BY1dWukTVrG9OMovnoNaIwvLJ3U4bFgzpOSa01mBo0JKG2R9fLXNg4Jvz8V0TxujpEiPb2By
 Z1vztvx357e/0kGSWtpcXdMOGydRFj5WoWOopP5yCvwGCmjFjWElwCZxxXpRoD1+htbLQNnJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=755 adultscore=0 clxscore=1015 phishscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050070

use guard(mutex) for scope based resource management of mutex
This would make the code simpler and easier to maintain.

More details on lock guards can be found at
https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u

Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c b/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c
index ce6c739c51e5..06d9101a5d49 100644
--- a/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c
+++ b/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c
@@ -75,7 +75,7 @@ static ssize_t fsl_timer_wakeup_store(struct device *dev,
 	if (kstrtoll(buf, 0, &interval))
 		return -EINVAL;
 
-	mutex_lock(&sysfs_lock);
+	guard(mutex)(&sysfs_lock);
 
 	if (fsl_wakeup->timer) {
 		disable_irq_wake(fsl_wakeup->timer->irq);
@@ -83,31 +83,23 @@ static ssize_t fsl_timer_wakeup_store(struct device *dev,
 		fsl_wakeup->timer = NULL;
 	}
 
-	if (!interval) {
-		mutex_unlock(&sysfs_lock);
+	if (!interval)
 		return count;
-	}
 
 	fsl_wakeup->timer = mpic_request_timer(fsl_mpic_timer_irq,
 						fsl_wakeup, interval);
-	if (!fsl_wakeup->timer) {
-		mutex_unlock(&sysfs_lock);
+	if (!fsl_wakeup->timer)
 		return -EINVAL;
-	}
 
 	ret = enable_irq_wake(fsl_wakeup->timer->irq);
 	if (ret) {
 		mpic_free_timer(fsl_wakeup->timer);
 		fsl_wakeup->timer = NULL;
-		mutex_unlock(&sysfs_lock);
-
 		return ret;
 	}
 
 	mpic_start_timer(fsl_wakeup->timer);
 
-	mutex_unlock(&sysfs_lock);
-
 	return count;
 }
 
-- 
2.39.3

