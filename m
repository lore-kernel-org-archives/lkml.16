Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036A722083;
	Wed, 25 Jun 2025 04:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750825060; cv=none; b=NxFPuDJCus/QmCOjFHUEfFMksRMhfP30kPkoaBWrwNie0Z+BtoI18FLzghddSSWoyabIgy3dd+iO4od8gcqe85h1HtxkcfP9vNNwUNmJ1wsO2aPSx4nIjqrS+gAua1VhD1FDHtiE5fsxIrmzRXlPByziYCH4Y1gfbTE/XrIw9wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750825060; c=relaxed/simple;
	bh=BVI1QQ1DftreBTvquEr9V02qGJUvo3QxTKZLivD7OIM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tUf1w7U4Tfqy9iBOpd6N/NJ1YVaT/1aerdLWRdZ7DJoVyqijCAEhqcanfmiKDjUnm0l5iUeJUB9we9hOu+Pybpw92CkRWaIHzJaBhvxqqOxW70Iqehj8wBKJ5gF9Ztxce7KkS+K5VZWgYiBcdP7mPASvdRTLUSq2J2qQp1bBXJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VI/r0PFk; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VI/r0PFk"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMj2xD005375;
	Wed, 25 Jun 2025 04:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=OUy9Nb6UnUkRJdShPkX1m4czJ6/Aj
	8FGvD0iprhAxto=; b=VI/r0PFkABHRaybxHzDZxOWf5zzVMcHt9/uuxlD645HZz
	I2Pqu1jxUXKkljrXo0lyZ9O7ukwN5i9GZyUeXl0Rqc4jX4/ie9u4SnAkBAGzQzjW
	A0CzzWMc58/QWrFZOr5hIt274gwU8fDFWj1ayxXlhdDb14CGyOLxwp5IIBhrWzOn
	peIlISdUcVZqWYnGgpv5nSRrch8QlbfuY9EoMd+8zl5Me4sZXVag38zgITP1/1/y
	q8bzuCKrg1ulM4CkJF0JQtUw3lTOwHJJEpdB24UGijLQRzZsQ2/LOByvd6WoNje3
	9Q3n2rU7vU9G7gwwOiGz8lX/pP6b7DXC+Ah1k7jSA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt7dd04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 04:17:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P1V1Mr024180;
	Wed, 25 Jun 2025 04:17:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehkrhffd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 04:17:16 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55P4HGqY029022;
	Wed, 25 Jun 2025 04:17:16 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47ehkrhfem-1;
	Wed, 25 Jun 2025 04:17:16 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: linux-nvme@lists.infradead.org, rdunlap@infradead.org, kbusch@kernel.org,
        axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
        nilay@linux.ibm.com, corbet@lwn.net
Cc: alok.a.tiwari@oracle.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] nvme: typo and minor cleanup fixes across host and target driver
Date: Tue, 24 Jun 2025 21:16:29 -0700
Message-ID: <20250625041643.174110-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506250029
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAzMCBTYWx0ZWRfX1GGPDfPQ4c3Z 23J7uimBEyeqjywG3kJZMNF3A9TnWwJkjmP/Gz3EVXiuVoSiqToKcbLIgtNQN8KRQCQ++WE/sI8 +za4nIuYyuZUCkaTMa8WOkdd9RjNBPfoNNqjfv8p/6R9StuVEMtzSsID+/XozuVmTZfniZcBXfI
 BzcQPR9LTOk6rQ2VE5ZiEXG465cEMdJdQwzGEcjeY22cC2jbvFy2/c2+4eu8nI+qhKgNZEBw0pC fQtoaI9y7D9hwqYqsBSnr/1mlh0eZWK68Vo/fWK+n7c5x8NCs6c6fVyzkX4TIZ3Gw8XQNoaPlo7 fkZkIMih4eymPBpLwzqZusi8+wtK40P02XxX0qo9q/cW0rjU/BzFHVDamDC6DxOdTcV3HUPtaH6
 DGiUHmeTVc8ThTAcyaqMew6Gn3iBnctsW24dHUVIIPBUOhqv+F6xtRVRUlGbuUwUghFgSzxt
X-Proofpoint-GUID: TIy6MbB8EIsxWjghf5pD0xloqFKfNduR
X-Authority-Analysis: v=2.4 cv=QNpoRhLL c=1 sm=1 tr=0 ts=685b784d b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=bqPIn-H1XwaJnLBdygsA:9 cc=ntf awl=host:13207
X-Proofpoint-ORIG-GUID: TIy6MbB8EIsxWjghf5pD0xloqFKfNduR

Corrected typos and grammatical errors in comments and documentation
("terminaed" -> "terminated", "limitted" -> "limited",
"glace" -> "glance" etc.)

Normalizing hex format output (x%08x -> 0x%08x).

Improving grammar in explanatory comments for better clarity.

Identifier Correction: Renamed NVME_SC_SELT_TEST_IN_PROGRESS to
NVME_SC_SELF_TEST_IN_PROGRESS to fix a typographical error and align the
status code constant with its meaning.

Removed Redundant Assignment: Eliminated an unnecessary initialization
of an error code variable in nvmet_ns_enable() to clean up unreachable
or overridden logic.

Error Message Fix: Corrected incorrect variable usage in an error
message in pci-epf.c.

No functional or behavioral changes are introduced.

v1 -> v2
Extended the underline by one more character in
nvme-pci-endpoint-target.rst as suggested by Randy
and added Reviewed-by: Randy Dunlap for series.


Alok Tiwari (5):
  nvme: Fix multiple spelling and grammar issues in host drivers
  nvme: Fix incorrect variable in io cqes error message
  nvmet: Remove redundant assignment of error code in nvmet_ns_enable()
  nvme: Fix typo in status code constant for self-test in progress
  docs: nvme: fix grammar in nvme-pci-endpoint-target.rst

 .../nvme/nvme-pci-endpoint-target.rst         | 20 +++++++++----------
 drivers/nvme/host/apple.c                     |  4 ++--
 drivers/nvme/host/constants.c                 |  4 ++--
 drivers/nvme/host/core.c                      |  2 +-
 drivers/nvme/host/fc.c                        | 10 +++++-----
 drivers/nvme/host/nvme.h                      |  2 +-
 drivers/nvme/host/pci.c                       |  2 +-
 drivers/nvme/host/rdma.c                      |  2 +-
 drivers/nvme/target/core.c                    |  2 --
 drivers/nvme/target/passthru.c                |  4 ++--
 drivers/nvme/target/pci-epf.c                 |  2 +-
 drivers/nvme/target/zns.c                     |  2 +-
 include/linux/nvme.h                          |  2 +-
 13 files changed, 28 insertions(+), 30 deletions(-)

-- 
2.46.0

