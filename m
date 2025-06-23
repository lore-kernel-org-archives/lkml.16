Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3F91E7C11;
	Mon, 23 Jun 2025 06:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750661141; cv=none; b=lwQpQViklKfxlpAXAJgSCwIMx4PquOyyC8xXF55gjBQYpqm+3Yd49EYW4+9Wer6Oee58gmliv5hHtrFwUUcmJBvxTFJRdX4Pw4rzGhKwMmg7eaKWlVLhmSWIn9Id1QhWCaVTXYmHLDU4V4LxhdwpbfmG1swycBgl8xl1OCUABQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750661141; c=relaxed/simple;
	bh=RUyWJknwcbNrB4SUEJysS1JMtz2z6aSBQYuFvoKtpcM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N7/kCPsJZg6Xm0Mw49HWl3DCpVoaIMU7oDncWvFVM2CWUzVv64YEvFF2V41naNHpsgElY9wv5ka/eN797sXCb9Lagd0eOkqOgJzy0zvI5hfH38tOGCwJCZ7nZPGR9SUWs4k2DOUDkwsweDE9Ib3U2j9dUJ6HrkMBEWHlb9Vhzi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ob1hZlCN; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ob1hZlCN"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N0QefF013311;
	Mon, 23 Jun 2025 06:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=TMTr+p8j4YQ2PYbbjdw8+mvac9Gen
	s2uxW0oUSjKPbQ=; b=ob1hZlCNq0vm4baXhJg8qiSygbQB1eFjpy5BUHjs/qVGE
	ngWFv2KROGmlLs9bpbGukjcn1BhHgTE2z17Hc0K/T5bP5WMbMIG6yl4QuZ1KJfT1
	k71rozOcmYVp4i42BPAX+xzXCz6ucNwqfB0wRhMyQKRAtRbDc/M1Hd3R5Jhhmn8x
	DnE+AUyArf5toMsTUryNlbJ5bVy66OBc73RTPn8dHPP7UUdO3tAACGkxkUJEl1B/
	OxPogH1SzANMZFEIPQv8vSIukDQ0BEgN53W3b9owpjcSfUsF32G9yBDZDC8fdtMo
	iE1k+vkaTrTZgiDuTxOk1C16G0C+WcFjRYdFW882Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt18wr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 06:45:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55N50REJ025574;
	Mon, 23 Jun 2025 06:45:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehvufbsb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 06:45:27 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55N6jRRc021681;
	Mon, 23 Jun 2025 06:45:27 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47ehvufbrm-1;
	Mon, 23 Jun 2025 06:45:27 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: linux-nvme@lists.infradead.org, kbusch@kernel.org, axboe@kernel.dk,
        hch@lst.de, sagi@grimberg.me, kch@nvidia.com, nilay@linux.ibm.com,
        corbet@lwn.net
Cc: alok.a.tiwari@oracle.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] nvme: typo and minor cleanup fixes across host and target driver
Date: Sun, 22 Jun 2025 23:44:53 -0700
Message-ID: <20250623064456.4188056-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506230038
X-Proofpoint-GUID: iyNzwmiBGMLigoRdOXqA8FOH-xWPE-Je
X-Proofpoint-ORIG-GUID: iyNzwmiBGMLigoRdOXqA8FOH-xWPE-Je
X-Authority-Analysis: v=2.4 cv=cpebk04i c=1 sm=1 tr=0 ts=6858f808 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6IFa9wvqVegA:10 a=kdh0kE6_XUOs-LRwJDgA:9 cc=ntf awl=host:14714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAzOCBTYWx0ZWRfX+wpgd+oGOhAv eeasPhJ7JVIaxFPmv98lu5V8RCMStYixGyB11MrzaMnhJSDTxY29VSqe7nop2VB+rpfHPawXep0 WQFwTHqR2Dm9cDjb9JPusrs9QjqEEu/xGbPGRCYVPFhwjlgmVqOeNJoVruwpHt8r6DyAVREckas
 D6PCmTZzzuR5VksyQ4sbzZSchKryTV2nWjVSpyvEfjKZuFhq3Se1MrS+9rkYrX07qQ9PzoTAl5d Xm9nxl/cf4ukUN9my+W5xIZxGFlLElX1lVh2vcNwt3tIwO5Jc+a1/ZMeuzUotgK8N0A50GdEPKs SgNr8JUw415LxxbA6QyPFHuFbW+2YuvdI7ypaWZI2dRRIlmsGLn/u9ABnozh+OE3dmQF7jM+t9K
 KvRO83RY68RO33v2gDSSy6rXwKMnxRZEZdXGQuIh7q0UUjZ04ZOoN5TEWHAgJdETAVufT2CS

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

Alok Tiwari (5):
  nvme: Fix multiple spelling and grammar issues in host drivers
  nvme: Fix incorrect variable in io cqes error message
  nvmet: Remove redundant assignment of error code in nvmet_ns_enable()
  nvme: Fix typo in status code constant for self-test in progress
  docs: nvme: fix grammar in nvme-pci-endpoint-target.rst

 Documentation/nvme/nvme-pci-endpoint-target.rst | 16 ++++++++--------
 drivers/nvme/host/apple.c                       |  4 ++--
 drivers/nvme/host/constants.c                   |  4 ++--
 drivers/nvme/host/core.c                        |  2 +-
 drivers/nvme/host/fc.c                          | 10 +++++-----
 drivers/nvme/host/nvme.h                        |  2 +-
 drivers/nvme/host/pci.c                         |  2 +-
 drivers/nvme/host/rdma.c                        |  2 +-
 drivers/nvme/target/core.c                      |  2 --
 drivers/nvme/target/passthru.c                  |  4 ++--
 drivers/nvme/target/pci-epf.c                   |  2 +-
 drivers/nvme/target/zns.c                       |  2 +-
 include/linux/nvme.h                            |  2 +-
 13 files changed, 26 insertions(+), 28 deletions(-)

-- 
2.46.0

