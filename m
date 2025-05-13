Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7191E5B93
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747172782; cv=none; b=qHX7EAbrStAAzxNQyWcnB1hMklUm3K4WeGwFTpnh5RXlIedO27xTJP778HiZ6SSso7BKUGRqF+8uzptCjCTl6+MymovbP43MelmHk7imWA6/1s9aYRwgmOEVbblczOxKN+jXbTTS52lVlO0doJFLoGvhuZnONsGCCbBhTQt2rRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747172782; c=relaxed/simple;
	bh=8oSgZqYJ7fyvLQLyfkymRSnOWIb3CUWExGI3AAn9z3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a56jAS756y+WVjxKbvIQ79doDS3pwN3yM7ljVLaK6mX8462tiOMx8RYv4khmER/BSPoBEUJtLbTaEZANE2G/HUKdaO4SUSdUBkI0dBotgMyDJM8nZpXmksmND8QlqB/1AvDFclBKYlqdgoAFwV3N5khQEXQgui/L/XqfYY4lp4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fa3vkfXw; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fa3vkfXw"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DL0mCB008956;
	Tue, 13 May 2025 21:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=J7Oxn
	v8gc8VK5Due4buy0qqRPwymDwfCK+r62ACGAIU=; b=fa3vkfXwYYnfSnWUWAGu3
	YaMfhqn8gRaV7aTERCbtZPLD0dNc0V8+fpIxqGzpYxKMmYSQekJn36H2X6uivYW0
	Hnk+RTGpkfThIt9p0sOD7GZhx5LIvA6wBTd8peVBwYfCTHib7pDHMDXdTnWTeBQ+
	epovwiP5AenBYbEqB78FVtAUzRa9s1KyCss9dgtku6n9PVqfGerbhxj86C0R/HIL
	u2s/868BZHLdHDFNS2K6XYCPCgyrTKI6sXWOr63+7OHv86ibOCG5+CY7zyZX7tk6
	Cw1wTOigt7uapNVL/1gvyJ4pQmtjyhiqdmPNrUW0NilmNU/5jKi9M6u8VsbntxYa
	A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbchgbbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 21:46:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54DLQjeS001890;
	Tue, 13 May 2025 21:46:04 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46mc4yv943-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 13 May 2025 21:46:04 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com
Subject: [PATCH V4 6/6] Add API to query supported rseq cs flags
Date: Tue, 13 May 2025 21:45:54 +0000
Message-ID: <20250513214554.4160454-7-prakash.sangappa@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250513214554.4160454-1-prakash.sangappa@oracle.com>
References: <20250513214554.4160454-1-prakash.sangappa@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505130206
X-Proofpoint-GUID: Swp99mSf9_JrBTggQ06xahzA2TBUG436
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDIwNSBTYWx0ZWRfX0M3GRc9T3lU7 I89qYSuTzkoKywtdRVtRU2q470RMploR2FWdSoH2JDdHpQDiNF3pWj657OyjfUFqvxCkKLQ5BNh LGDFZY9P4JR91HJW7XdEYvDeCAfLSSdsEYd1XxIG0KZSnAsfDgo/oeaEYs7fcOUWcW+2DOer3+J
 BQH0G3JVKQHlNYB9QYsRqxVdat/logzrgzYaRG4pguoEmjtEc9M+f5qm6F5fWFVngVvP/dvrM3K vDr37pBJTj2M7MPEcew6PQyoID9xngR3U36L4Qef0TtDWb6jSl06J+RZFXyza2ZOMldEbisIhSF 66E20wGgOrOjx4YiXOZMG0dnnvpm1Bc634aTyI3w+TXMCorPNJu3T0wS6Vta0Z+cFIU211aj5G6
 YEBMvryvswEJnB9Ji6xT0Mb9DEEu4r5H/QaDKrHDydyBY+0sjBlr6JP5NH4dp8UAlHna7Fje
X-Proofpoint-ORIG-GUID: Swp99mSf9_JrBTggQ06xahzA2TBUG436
X-Authority-Analysis: v=2.4 cv=Da8XqutW c=1 sm=1 tr=0 ts=6823bd9d b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=dt9VzEwgFbYA:10 a=7d_E57ReAAAA:8 a=yPCof4ZbAAAA:8 a=lNSuT_yr9ip2OW1UfLwA:9 a=jhqOcbufqs7Y1TYCrUUU:22

For the API, add a new flag to sys_rseq 'flags' argument called
RSEQ_FLAG_QUERY_CS_FLAGS.

When this flag is passed it returns a bit mask of all the supported
rseq cs flags in the user provided rseq struct's 'flags' member.

Suggested-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
---
 include/uapi/linux/rseq.h |  1 +
 kernel/rseq.c             | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/uapi/linux/rseq.h b/include/uapi/linux/rseq.h
index 015534f064af..44baea9dd10a 100644
--- a/include/uapi/linux/rseq.h
+++ b/include/uapi/linux/rseq.h
@@ -20,6 +20,7 @@ enum rseq_cpu_id_state {
 
 enum rseq_flags {
 	RSEQ_FLAG_UNREGISTER = (1 << 0),
+	RSEQ_FLAG_QUERY_CS_FLAGS = (1 << 1),
 };
 
 enum rseq_cs_flags_bit {
diff --git a/kernel/rseq.c b/kernel/rseq.c
index c4bc52f8ba9c..997f7ca722ca 100644
--- a/kernel/rseq.c
+++ b/kernel/rseq.c
@@ -576,6 +576,23 @@ SYSCALL_DEFINE4(rseq, struct rseq __user *, rseq, u32, rseq_len,
 		return 0;
 	}
 
+	/*
+	 * return supported rseq_cs flags
+	 * It is an or of all the rseq_cs_flags;
+	 */
+	if (flags & RSEQ_FLAG_QUERY_CS_FLAGS) {
+		u32 rseq_csflags = RSEQ_CS_FLAG_NO_RESTART_ON_PREEMPT |
+				   RSEQ_CS_FLAG_NO_RESTART_ON_SIGNAL  |
+				   RSEQ_CS_FLAG_NO_RESTART_ON_MIGRATE |
+				   RSEQ_CS_FLAG_DELAY_RESCHED |
+				   RSEQ_CS_FLAG_RESCHEDULED;
+		if (!rseq)
+			return -EINVAL;
+		if (copy_to_user(&rseq->flags, &rseq_csflags, sizeof(u32)))
+			return -EFAULT;
+		return 0;
+	}
+
 	if (unlikely(flags))
 		return -EINVAL;
 
-- 
2.43.5

