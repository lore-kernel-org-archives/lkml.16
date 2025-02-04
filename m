Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC1120C039
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 11:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738669011; cv=none; b=tUq0jg9IJqh/3e7kn2YV1eWsd1LwemgUoixlJvI98KldpJSX4xFV0tzN1WYE5zwRuUp/RB5C+dUnYVAOeYbMxfsk+yCYt3dYpAYAmgHcGqXwviQXiSwJQdWdHUVUfEB/5T0Kxa8kK3GPEUOuBfBgU9l0Br5hTCZV/blkxQ12syo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738669011; c=relaxed/simple;
	bh=PTD8MOKADYDWan2ktYJDP2lcOcYIsSk0ZxIGNFK3r3E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QAdQcgu2FzDJ03qLQf4u0MJssxhsM6dBG6RACXAFMhtRkypVi2OZcdSBAf5aAAJ5KsNreFvPgq8FDNFU3t++ueo1bI7cCZkzBXhB2w3FBcegD9v4BSiDtCps2PZDrx5QKwMvhjB3brB85ztC44HJU9ROpYyHWbcJUAoWiMc8URA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bRk8iKEn; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bRk8iKEn"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514AtohF014594;
	Tue, 4 Feb 2025 11:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2023-11-20; bh=42v2LrGte4tVDJl5/xVb6F5QFU7Vg
	6sRZvVeI5r4deM=; b=bRk8iKEn/HwGDjEOLDcHECMAE7ULh8z2owiM5WLKdUHZA
	S39pPVlx6RQ+Afsp1EwP8YOJrJqeGEDzhlAXWNSDegeV701rwypeOGypDcvkIvJg
	6bJ1tJcNdEs8IqpOxS7n71/ep0uMyzas8gzRvCchTZE1/VCeY/Tln4UK2ApU9O5i
	cXoKG+Fsy64wfym/SvjgJV00dYR5RTxGLDjF2x+N5+HkVG8gGsYFEpGieMW+wTFS
	8hcaXAL7Afraqn7PrUJ9I1tRrle29qQwoQXIP/2GDd+Uq7w8ClTms4/v7WoXAGlX
	ANjQajrXAqWqoIIWiF6er0pLeFZGO95l0BCOlw8og==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hh73mem7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2025 11:36:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 514APmMB029868;
	Tue, 4 Feb 2025 11:36:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8p2ve5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2025 11:36:44 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 514Baiav040213;
	Tue, 4 Feb 2025 11:36:44 GMT
Received: from localhost.localdomain (dhcp-10-191-130-116.vpn.oracle.com [10.191.130.116])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 44j8p2ve47-1;
	Tue, 04 Feb 2025 11:36:43 +0000
From: Imran Khan <imran.f.khan@oracle.com>
To: tj@kernel.org, jiangshanlai@gmail.com, haakon.bugge@oracle.com
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3] workqueue: introduce queue_delayed_work_on_offline_safe
Date: Tue,  4 Feb 2025 22:36:35 +1100
Message-Id: <20250204113635.298634-1-imran.f.khan@oracle.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_05,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502040092
X-Proofpoint-ORIG-GUID: 8gCZfthW-ogIDSgEDzKhlJA2667IqRBF
X-Proofpoint-GUID: 8gCZfthW-ogIDSgEDzKhlJA2667IqRBF

Currently users of queue_delayed_work_on, need to ensure
that specified cpu is and remains online. The failure to
do so may result in delayed_work getting queued on an
offlined cpu and hence never getting executed.

The current users of queue_delayed_work_on, seem to ensure
the above mentioned criteria but for those, unknown amongst
current users or new users, who can't confirm to this
we need another interface.

So introduce queue_delayed_work_on_offline_safe, which
is a wrapper around queue_delayed_work_on to ensure that
the specified cpu is and remains online.

Signed-off-by: Imran Khan <imran.f.khan@oracle.com>
Acked-by: Haakon Bugge <haakon.bugge@oracle.com>
---
v2 --> v3:
  - Corrected a couple of typos spotted by Haakon
  - Collected Acked-by, from Haakon

v1 --> v2:
  - Remove RFC tag
  - For cases where dwork can't be put on specified CPU,
    let caller decide the next CPU to try with.

 include/linux/workqueue.h |  3 +++
 kernel/workqueue.c        | 42 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index b0dc957c3e560..cefcf9e89be6f 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -589,6 +589,9 @@ extern bool queue_work_node(int node, struct workqueue_struct *wq,
 			    struct work_struct *work);
 extern bool queue_delayed_work_on(int cpu, struct workqueue_struct *wq,
 			struct delayed_work *work, unsigned long delay);
+extern bool queue_delayed_work_on_offline_safe(int cpu,
+			struct workqueue_struct *wq, struct delayed_work *work,
+			unsigned long delay, bool *online);
 extern bool mod_delayed_work_on(int cpu, struct workqueue_struct *wq,
 			struct delayed_work *dwork, unsigned long delay);
 extern bool queue_rcu_work(struct workqueue_struct *wq, struct rcu_work *rwork);
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 9362484a653c4..b3c030e6c6b17 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -2565,6 +2565,48 @@ bool queue_delayed_work_on(int cpu, struct workqueue_struct *wq,
 }
 EXPORT_SYMBOL(queue_delayed_work_on);
 
+/**
+ * queue_delayed_work_on_offline_safe - queue work on specific online CPU after
+ *					delay,
+ *
+ * @cpu: CPU number to execute work on
+ * @wq: workqueue to use
+ * @dwork: work to queue
+ * @delay: number of jiffies to wait before queueing
+ * @online: online status of @cpu, for caller
+ *
+ * a wrapper, around queue_delayed_work_on, that checks and ensures that
+ * specified @cpu is online. If @cpu is found to be offline or if its online
+ * status can't be reliably determined, set @online to false and return
+ * false, leaving the decision, of selecting new cpu for delayed_work, to
+ * the caller.
+ *
+ * If caller sees @online as false, it can try submitting work on a
+ * different @cpu, but if it sees @online as true, it can check the return
+ * value to determine if the work was really submitted or not.
+ */
+bool queue_delayed_work_on_offline_safe(int cpu, struct workqueue_struct *wq,
+			   struct delayed_work *dwork, unsigned long delay,
+			   bool *online)
+{
+	bool ret = false;
+	int locked = cpus_read_trylock();
+
+	if (locked && cpu_online(cpu)) {
+		ret = queue_delayed_work_on(cpu, wq, dwork, delay);
+		*online = true;
+	} else {
+		*online = false;
+	}
+
+	if (locked)
+		cpus_read_unlock();
+
+	return ret;
+}
+EXPORT_SYMBOL(queue_delayed_work_on_offline_safe);
+
+
 /**
  * mod_delayed_work_on - modify delay of or queue a delayed work on specific CPU
  * @cpu: CPU number to execute work on

base-commit: 5bc55a333a2f7316b58edc7573e8e893f7acb532
-- 
2.34.1

