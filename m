Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C0F2980BF
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751021557; cv=none; b=kdUBBCCClNtvfxlnAhQbqcx4eeF5konKh1iTvESBH0K9e3n0iNkA76SrcJAgPE8CB+Gq2apaQyXo6p4es/uHDpfIw2khEQQ4XhBZeFXHqo0yfQpdlFOzs3tI8f/WmnuQ8AeWI5K+/yPC86RvWjULlbz1zK4xLD459OHoEGHdnxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751021557; c=relaxed/simple;
	bh=mPOghuxsj47lwq8oIa4sXfWI/aVeJZPiSsLaEJNGW4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R1BnU9vtlK7EhbP2tROpgN0fzO/LsBgfgHmDIJeVeuWV3jsBtXE92B1z/wnS1dZpMmThKu5AFjcz7qKH03ehty3F4MKi14HJvM+7j8CG3eDia8iiKSch8m8dJttlret4coLxDNw5Rcx/lFIFUIqdHSc+/3QROe+NYWb+6UOX2XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ceE+V8FP; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ceE+V8FP"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RAbIaI000435;
	Fri, 27 Jun 2025 10:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=dV61dEVtvyb8fbrV
	Vm6gOlkX1KSxV9hG1v71rMs4zx8=; b=ceE+V8FPHNHcb+g3IT4H84byNtByVWpH
	NQ8d3VylIQ38drH/th9VB33SWZNqm0cz0x+U6pjIothjyVyCYRpYn+r8rPlGn+l1
	CFil93zvw4FAeoYPFtiX9dN29imXBvw2bC1va3hNw4mVO9oA45oiErHLzjdeBZz2
	O/+wjoZ/dS8eDteucRoJds9K0Iaiz7I9ybcwkBEzrEl2s1ULiPC8fgqr/LenWaje
	VgPKwWEoAUSOLykNc8cgLxCUMazs8/vAJr66GOadnTuekpUdCHe8v9ZM89utrWgI
	0kaD+ChwOCtQKtpyRpO3l2PhxqLXkm7s2PWzoxTzHzbpZtVPvP4Jpg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8ybq0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jun 2025 10:52:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55R9eRo7017913;
	Fri, 27 Jun 2025 10:52:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehw16x4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jun 2025 10:52:10 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55RAq9dU014292;
	Fri, 27 Jun 2025 10:52:09 GMT
Received: from lab61.no.oracle.com (lab61.no.oracle.com [10.172.144.82])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47ehw16x33-1;
	Fri, 27 Jun 2025 10:52:09 +0000
From: =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>
Cc: =?UTF-8?q?H=C3=A5kon=20Bugge?= <haakon.bugge@oracle.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] wait: Relate wait_event_cmd() to its userspace equivalence
Date: Fri, 27 Jun 2025 12:52:06 +0200
Message-ID: <20250627105207.1613044-1-haakon.bugge@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=961
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506270088
X-Proofpoint-ORIG-GUID: OPucuTbyZnZNYufnqbL2msAf_dXKlFEA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDA4OSBTYWx0ZWRfX3ApYphz0iL2G CYBljnYl06Gb/iiiRxpchOx8i4odDWiAF4nUj4JBzcUXu25Jor7eeEWGDNjj6/9tU6P9QXdAKGk 7PJmlPOOzZ1omOoBuC/92txt+9tO4choAlXuKNZv0679XqaVc117eJaKO+dM0y7bMLQLWrKCASQ
 N/O9Vav06dWFMo6MBHQPi0RGOHfIiCAD35N8vvUzj+wwNI7bjxo2Kphbo6gM0o2Rrd1zSp4BkEa TwjpVMmBsgP4jBSuhqzXDN3nzCdXgFBEDknr5DYFX5d/T8Py8B9qwXlAQnrMsdt2ZwDtUAt05u8 Q1HC2YieETJkUH7K6Otm8LnoFdIXgkVdukIiS4PeUi/WfyUGnvA29HiDN8qUL31Px71y7ch1NKj
 EUHEWjOAs3vYQzDevuJwgOH33QTN3YXHGganRQloi+OaOv2OSJiLzMsP/RWmYrhQxO2lmBX9
X-Proofpoint-GUID: OPucuTbyZnZNYufnqbL2msAf_dXKlFEA
X-Authority-Analysis: v=2.4 cv=PqSTbxM3 c=1 sm=1 tr=0 ts=685e77db b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=M51BFTxLslgA:10 a=yPCof4ZbAAAA:8 a=wEmhiZHmUTMBQUX5UU0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14723

Relate wait_event_cmd() to userspace's pthread_cond_wait(). This
because when searching for functionality comparable to
pthread_cond_wait(), it is very hard to find wait_event_cmd().

Signed-off-by: Håkon Bugge <haakon.bugge@oracle.com>

--

v1 -> v2:
      * Split original patch into two
      * Wordsmithing as suggested by Matthew
---
 include/linux/wait.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/wait.h b/include/linux/wait.h
index 965a19809c7e5..62df98193a3a7 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -469,6 +469,14 @@ do {										\
  *
  * wake_up() has to be called after changing any variable that could
  * change the result of the wait condition.
+ *
+ * This is the kernel's polymorphic implementation of userspace's
+ * pthread_cond_wait().
+ *
+ * When calling this function, cmd1 is typically a lock-release call
+ * and cmd2 a lock-acquire call. The locking primitive can be chosen,
+ * contrary to pthread_cond_wait(), where the locking type is cast in
+ * stone and is a pthread_mutex_t.
  */
 #define wait_event_cmd(wq_head, condition, cmd1, cmd2)				\
 do {										\
-- 
2.43.5

