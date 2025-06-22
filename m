Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5265C12BF24
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 19:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750619799; cv=none; b=oWrkLEFewJjpO23L/XcixZ5Umy3XAOpNO6ZByiPv5ALYxyezQbzhIKTwhPtlnhzw9nfLkEU8Zd22tLgIs8yjeme2utMoi1TtoNYPX/UWuj0duBKJlkfxkLNKRHIc/Qi6ckaRe1EIDGDXNN4siviH1yS1SN2OM9fTMb8pqEM3DDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750619799; c=relaxed/simple;
	bh=3TaGaTsal0W75qUzYEVHLStm/VX2yd7F8aEXUocvsJQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=eA1kwrhO9CrQv9CrT4wH8PIOlYsy5+LGj579oLls/AfPlJF6+k1KIdOZSEnvd4eXy5okGLtlk7zQMogn1b3/+96k0zEQow3/N+WUDdma/FCPBueFXuQE56r+jBYB95Kkq2oOjPj6/nKA/EB2yMCFXavoTUZ1mN9k2FshBL1rIZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FM/CSchM; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FM/CSchM"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MGK8Z8026393;
	Sun, 22 Jun 2025 19:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=QPVhIxtDZZOmxbW1Asro+LhDxKk3n
	PUBBMZkjphznGo=; b=FM/CSchM9BFceLDNGV5ABK1nvBii8O3G8cqjMXzOP5DE6
	45iMsHg8vLepgOwyV8X92dnZYbFQUBOwM7uwVlg54dxON9Ptm20pTHXgGPCtVdvZ
	rfkpgH7HYm43z3KT+aJn76eEvn3xiBHDhshK7s91VYCil05+EK+qir3R+W1EcDUn
	1C+UNj64CHiLJSVTx8WNdMma8GgyODGy7qXky//iPvF+KnVHx3pfviiYvhm3dJyi
	uxjWjT2rVG3fuwVpFgEIv1rr4+/NcY6W5tZX67puHrSboaFXyH1panGC2R4L1auu
	/BzFQU/IK8khSRMUe8oJPuLvSJHA9f5DzRezH6xgg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt5g87y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Jun 2025 19:16:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55MIawmq039350;
	Sun, 22 Jun 2025 19:16:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehr2mp2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Jun 2025 19:16:26 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55MJGQSZ024048;
	Sun, 22 Jun 2025 19:16:26 GMT
Received: from chyser-vm6.osdevelopmeniad.oraclevcn.com (chyser-vm6.appad3iad.osdevelopmeniad.oraclevcn.com [100.100.242.35])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47ehr2mp2j-1;
	Sun, 22 Jun 2025 19:16:26 +0000
From: chris hyser <chris.hyser@oracle.com>
To: "Chris Hyser" <chris.hyser@oracle.com>,
        "Peter Zijlstra" <peterz@infradead.org>,
        "Dhaval Giani" <dhaval@gianis.ca>, "Jonathan Corbet" <corbet@lwn.net>,
        linux-kernel@vger.kernel.org, chyser@yahoo.com
Subject: [Patch 0/2 v3] sched/numa, mm/numa: Soft Affinity via numa_preferred_nid.
Date: Sun, 22 Jun 2025 15:15:34 -0400
Message-ID: <20250622191622.3296825-1-chris.hyser@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=875 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506220123
X-Proofpoint-GUID: VPRalc_kHcBDQCdlI4I3HI23iynRb8PB
X-Authority-Analysis: v=2.4 cv=PMYP+eqC c=1 sm=1 tr=0 ts=6858568b b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=WsHKUha7AAAA:8 a=glSDMOvTweIbZLxOEDYA:9 a=H4LAKuo8djmI0KOkngUh:22 cc=ntf
 awl=host:13206
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDEyNCBTYWx0ZWRfX6qYlXoVaNQM+ E80w46aAAUNw9fkMWsTX/6vlkw4x6ZvfLrI43SYBGBDMG0YuwkT8YzfLGTxYcrex+IFgCPS7TQP ZCT/Yr2CsZwNOID0vn3KNq3JWQ6/lb85c9vF8AA5VYDG9uH29neTk5+BENYeQfI3UjJx1Q33Oi4
 mRm3VYVVKi8YyOSLU8Y/iY1f7bZ01KbWyzP/uksDA57mjRIPxW1Lvb2A54+SHB9V3sCGVnehfpg ModcqSLigE3r9JRz0fNtgGXtX64XsiDOiNT41ydjPgYLnURKRU2rzw6ePLKnHkicVlXd1vMsHtV N9hcv4cWautLiQmuIdu29BXQhrs9eiV9s3/wQl1BHaDW2gM+EcAQ+6mse+sXhD2DthR0FeYIuGU
 pcvj0Yqb8dTQJn0m1a/XfwYO1vQhEgfz6FIdEqqmqcahUs049a4gQfZYe8heJ/dtC4TVHU+p
X-Proofpoint-ORIG-GUID: VPRalc_kHcBDQCdlI4I3HI23iynRb8PB

Soft Affinity (value of hard affinity with graceful handling of overload) as a
concept has been around for years. The original implementation was rejected

https://lore.kernel.org/lkml/20190702172851.GA3436@hirez.programming.kicks-ass.net/

with an alternative, using numa_preferred_nid, suggested by Peter Zijlstra.

This is a simple implementation with most of the changes associated with a
prctl() to set/get the value. It does not modify the scheduler's behavior but
simply exploits the current NUMA balancing behavior.

The intent is to provide a mechanism whereby a knowledgble user, system admin,
or importantly, a NUMA aware application can force Auto NUMA Balancing to prefer
the "correct" node, for example pinned memory like RDMA buffers or other
scenarios where heavily accessed memory ranges are pinned and not subject to
NUMA hint faults.

v2 to v3 Changes:
   - removed confusing comments.
   - combined a nested if into a single statement.

[PATCH v3 1/2] sched/numa: Add ability to override task's numa_preferred_nid.
 include/linux/sched.h |  1 +
 init/init_task.c      |  1 +
 kernel/sched/core.c   |  5 ++++-
 kernel/sched/debug.c  |  1 +
 kernel/sched/fair.c   | 11 +++++++++--
 5 files changed, 16 insertions(+), 3 deletions(-)

[PATCH v3 2/2] sched/numa: prctl to set/override task's numa_preferred_nid
 Documentation/scheduler/sched-preferred-node.rst | 67 ++++++++++++++++++++++++
 include/linux/sched.h                            |  9 ++++
 include/uapi/linux/prctl.h                       |  8 +++
 kernel/sched/fair.c                              | 65 +++++++++++++++++++++++
 kernel/sys.c                                     |  5 ++
 tools/include/uapi/linux/prctl.h                 |  6 +++
 6 files changed, 160 insertions(+)
