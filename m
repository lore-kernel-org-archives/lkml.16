Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2D51AA1DB
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 19:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746212481; cv=none; b=Q8BzH4QC37XMqM54Vi9HncsqJQnSP0JsM3DVVk3BMjG2l9/VPp/wFoymWU4qgfZeQGzAhQKdBF1lDfCz6er/WO7eS9QQxMqj2sBcA/4XwA0OvU7WAnx496iP430sKaOUxPBNEVa880uSCgyiw1NYJ/ctsXXIDqT2jo/cnKzwY6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746212481; c=relaxed/simple;
	bh=0DJRj/roTx2TlUPmbcSX3CMHGsoBIXB/OFsCbOGjL7s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=fXgKM1HcPVlmkgstgkIxCb/uWiWSnnt0jg8l93yzI9NvukM3992h6g/LcqFp0aLCYaPVzURAp72b7e90XNnuzQWU0GWzoEi1035Czi/N087fZu6seyVx7o2Mh3P830fCivLwqLR05nSlb0U+H0SztoPhVrIbLzon4uRijTbfUEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eyDPLfTN; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eyDPLfTN"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542IttTN008675;
	Fri, 2 May 2025 19:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=jxcag99Lf5vM47fPYCnfh7DS4x/qq
	Pn4W6mmCiyQxxc=; b=eyDPLfTNIg/lGMSU8Ehg9wn6GcdCmuIj338tcdrkafRSP
	WKxGQHVnHEtyQchpZd1iJGpsmUDQUm1kX/dTrqFRt+Qj/TnjMuiLEGpoKESOkd7f
	Bbho+T8GA3B0bb0coYgzmYN04ksVyD34o458Q6y+M/DwyIwHRNL9fDq62dM/g+El
	sLqe0rFxCLmfMn8ChDc3yEpyudM3s3VbtcDcMolqGA/hWkprWN1MogANaMQrj6ne
	GX0ELfp/M2VwnyxAi7MHGU1+IpKdyXj7EST4fdLj3y2QM57zR2Gq3dxffLH+eIVg
	5bTEVW2snIGVwHcAQ3hpKDDyy1bfc2NAyGHC5JWLw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6uqnw80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 May 2025 19:01:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 542IFENI023804;
	Fri, 2 May 2025 19:01:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxmc18f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 May 2025 19:01:03 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 542J12rF022528;
	Fri, 2 May 2025 19:01:02 GMT
Received: from chyser-vm6.osdevelopmeniad.oraclevcn.com (chyser-vm6.appad3iad.osdevelopmeniad.oraclevcn.com [100.100.242.35])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 468nxmc184-1;
	Fri, 02 May 2025 19:01:02 +0000
From: chris hyser <chris.hyser@oracle.com>
To: "Chris Hyser" <chris.hyser@oracle.com>,
        "Peter Zijlstra" <peterz@infradead.org>,
        "Mel Gorman" <mgorman@suse.de>,
        "Andrew Morton" <akpm@linux-foundation.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: [Patch v2 0/2] sched/numa, mm/numa: Soft Affinity via numa_preferred_nid.
Date: Fri,  2 May 2025 14:59:40 -0400
Message-ID: <20250502190059.4121320-1-chris.hyser@oracle.com>
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
 definitions=2025-05-02_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=955 phishscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505020153
X-Proofpoint-ORIG-GUID: 0GzJGuw9mQ521sNWC0uU3TYK8B001jDO
X-Authority-Analysis: v=2.4 cv=Vq8jA/2n c=1 sm=1 tr=0 ts=68151670 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=WsHKUha7AAAA:8 a=glSDMOvTweIbZLxOEDYA:9 a=H4LAKuo8djmI0KOkngUh:22 cc=ntf
 awl=host:13130
X-Proofpoint-GUID: 0GzJGuw9mQ521sNWC0uU3TYK8B001jDO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE1MiBTYWx0ZWRfX3O7D82ma882B YnNjwCc/FExxz+YSUq0Kfid0Oj+NrU4whetDv1sGfLVwGapkRzfBek5k54rPNyUARU4H2PBFwvN nh/8ltZgo/Qyo0IRWXLlu5P3778Ia8BVyHdi/D5Z2uViPDHk6DvR3IyPAXN11ctgQHQ1EOfvaLR
 09gYi/B8GVlmMUI33OMCm/2qKU03UpOKzkiV3HkKRBkbNnMjduzKl07WFnCsZrmrmChRzxCM+EO /Jxm8U2OWgDz5Vx410sozW8JMBIunezPY4iXlkzgNrJMCSwYAYT0HJPBkE//gDlZv4Bsvyqt/dR xH7ICnWAaT44BS7SHaqmro2aztMQvZYb7lRpmoGEZQaSIpmJGAcUoIgm55qcG2X00II0XZK+74x
 0xOZjBmrIY4+SpGBY7sXAQUI2Rz3zxxl7NAFk/cNzX6FfQsW1GFTg9mF9O/JkrgekLN17LYF

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

[PATCH v2 1/2] sched/numa: Add ability to override task's numa_preferred_nid.
 include/linux/sched.h |  1 +
 init/init_task.c      |  1 +
 kernel/sched/core.c   |  5 ++++-
 kernel/sched/debug.c  |  1 +
 kernel/sched/fair.c   | 15 +++++++++++++--
 5 files changed, 20 insertions(+), 3 deletions(-)

[PATCH v2 2/2] sched/numa: prctl to set/override task's numa_preferred_nid
 Documentation/scheduler/sched-preferred-node.rst | 67 ++++++++++++++++++++++++++++++++
 include/linux/sched.h                            |  9 +++++
 include/uapi/linux/prctl.h                       |  8 ++++
 kernel/sched/fair.c                              | 64 ++++++++++++++++++++++++++++++
 kernel/sys.c                                     |  5 +++
 tools/include/uapi/linux/prctl.h                 |  6 +++
 6 files changed, 159 insertions(+)
