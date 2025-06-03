Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1FD24DCFE
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 23:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748993839; cv=none; b=Nr5KlGUx3e+IViR0B2zc2L/Wc5lbIKr6fBowZRIo483pGRSIzB5nSJ6fU+/30JiRxxQj9EWXRiDgtckVput5fAiHDQRk3DbIOFwOD3XbzGKKAgMv5ZQsIoQpDBr7ZgHnF5xhYFgyhxX8RMYhvaiE/61F+WI9fKHg2R0Kcv3FyBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748993839; c=relaxed/simple;
	bh=CpW5+EnRH/eprOB2Im5mjNYvWXmMldYepx3fogdbW78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mpW8S7FeuGzxOlpgG7NT6XPQ2YIWqQlXdHJc5AOWrydTe+KfjHKIkCOMUJJMYll8oqFNhOdQa1/el3N/BboEYAOTMsdMkS0v9rdvSGX0jtUtSw4XNLDMuvTkN3i8T37Wd22K+tg2XjENKz775bE8OqgXzTi7OtpFrWwwlVOL3NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TKfALx6Y; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TKfALx6Y"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553MN19S032342;
	Tue, 3 Jun 2025 23:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=2ziAp
	oYnxEqaxK0lHJjI7BRw8C3lEmMXkqJPO+VXKv8=; b=TKfALx6YhyegGOsg7CzRp
	M/SSTWtsTl0fRo/Z4ghCOQNus42M7cbb77ZiT+O0XaWkDVP+J2i2qjpaw1hYCoZh
	hdjVVu8dGuE0S650uftf7OayqDZ5ylClNoBSOhsDKdYPzYAfEOQsTjWY3JWOpl4w
	vwmW6vVY+kt6NGYObOzS2bVraoqOAGQ0OowVdVktB6+YmiyKkds323rrDslXLDSD
	OPs+4GqO6bDFka4ZgP55lF9U5G5ooAgWjHIHd0t+WoItxMr3rwhV4Lkkg+I5vFHQ
	o9gEy9/4P+Xn/rEqrqxSjfj69LFI/dYxK4+VMb5y9JdRV3oZDZn6/6dPL4rVKhPH
	w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8dty3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 23:36:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 553MtHr0030803;
	Tue, 3 Jun 2025 23:36:58 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7a2j93-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 03 Jun 2025 23:36:58 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com,
        vineethr@linux.ibm.com
Subject: [PATCH V5 6/6] Add API to query supported rseq cs flags
Date: Tue,  3 Jun 2025 23:36:54 +0000
Message-ID: <20250603233654.1838967-7-prakash.sangappa@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250603233654.1838967-1-prakash.sangappa@oracle.com>
References: <20250603233654.1838967-1-prakash.sangappa@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030202
X-Authority-Analysis: v=2.4 cv=Va/3PEp9 c=1 sm=1 tr=0 ts=683f871a b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6IFa9wvqVegA:10 a=7d_E57ReAAAA:8 a=yPCof4ZbAAAA:8 a=f51I_UcxYSrpky289IcA:9 a=jhqOcbufqs7Y1TYCrUUU:22 cc=ntf
 awl=host:14714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDIwMiBTYWx0ZWRfX6UgiaRWLlONQ MZ9uMgK0uDGxIEl6TpDg9YiaR4GZNuRgDk/KsVJHsSCC0deyKoAE5JoNhMXgsf6FDm5b0kZ6twt qx1ngG5gbnIh32SUkFVeNriJkTBFCg2KFLEuxBouX2yeKXM3suxYIQgKsU61SQeNNHzCMLIss05
 Pkri9Wl/sxmZ3ST0DMR5ZaaJ34qov0DwKZgqAHI0ozGLJHKiGn6lIESK9ypUQO4nIJidBu26dFq Ra7yiXR7kwLlL5BPDGSnmKGmx3fO1Hin54xB/knK6JMy/I39+EMWOds22Qy6uVJ+TL9tLa1pn4p wxAaHctAiKupWpSnkKHhMJWOvm2qkVGSlzcbgehplwiYa4eZDcj7UIRox16YAC8Nl39NoZbEQwc
 vXSac5K2ZOLhRiNnZ8mH1xm8+kQa1OTbHeLIhOoyR8yPAn1gxZOgsqySRKskHW5/yq7/rvFN
X-Proofpoint-ORIG-GUID: rlXCmcjw8u6UR_QqL1MTkPuegnRj75D0
X-Proofpoint-GUID: rlXCmcjw8u6UR_QqL1MTkPuegnRj75D0

For the API, add a new flag to sys_rseq 'flags' argument called
RSEQ_FLAG_QUERY_CS_FLAGS.

When this flag is passed it returns a bit mask of all the supported
rseq cs flags in the user provided rseq struct's 'flags' member.

Suggested-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
---
v5:
- Removed deprecated flags from supported cs flags returned.
- Added IS_ENABLED(CONFIG_SCHED_HRTICK)
---
 include/uapi/linux/rseq.h |  1 +
 kernel/rseq.c             | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

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
index c4bc52f8ba9c..d2b010dccff5 100644
--- a/kernel/rseq.c
+++ b/kernel/rseq.c
@@ -576,6 +576,22 @@ SYSCALL_DEFINE4(rseq, struct rseq __user *, rseq, u32, rseq_len,
 		return 0;
 	}
 
+	/*
+	 * Return supported rseq_cs flags.
+	 */
+	if (flags & RSEQ_FLAG_QUERY_CS_FLAGS) {
+		u32 rseq_csflags = RSEQ_CS_FLAG_DELAY_RESCHED |
+				   RSEQ_CS_FLAG_RESCHEDULED;
+		/* Following is required for delay resched support */
+		if (!IS_ENABLED(CONFIG_SCHED_HRTICK))
+			return -EINVAL;
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

