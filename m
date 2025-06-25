Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7CE1E2307;
	Wed, 25 Jun 2025 04:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750825063; cv=none; b=nei/l68uRUUXB2NNShQN8XRMkTbp9AajISg3dnWFjhJev8T6iCVhIQMd9dEvWP/uqulOThbn0b40om4MCGkdbrxgUTJtbXaR1PyQxLAxA36UCnyBiDTGsJVPXUNtM8D/jsFy36/pYveSnyD2hM/aHCdphVsx3w0jj9jam+Bufuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750825063; c=relaxed/simple;
	bh=7z6DeedOJBeNMP/B+UH07XB98vYovCuAtoRvx475+VE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eG54szMIHRGBzxbgHgFL7HrwYDZipixfQWtwfBhVk1WF3kjHMGU3GBQ+e9zjk2b6qz31WnoE01MRe+aMmzS0wOg2MXFkQN31oQuG8JwSkr6PZo9vUYJesaQN1W9pU0pk1UhrFq8UXEoCUBT21/UL/npAHzbJdRMbBV4HZue70ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EztW5mlc; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EztW5mlc"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMifMJ030643;
	Wed, 25 Jun 2025 04:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=ECbJE
	R7HPArjDkUDk2lFtARP1Py/Ve5oi80LCYZNong=; b=EztW5mlclaGDiB4O5FgRr
	jarlMBGOjVhMBka7q0SGLb5zePtRD0I5FmLC8AIWPeoKbAWkQQ1NLeDBAyJFiIv6
	ZMwaPABgpfsKDLOFpnwARkxHpp4SfaOAoHDAvk+l7cth3TIHJu0LRQdXf07Uuh3u
	FY5pRaSu88Y7eFvKfLmmfZ9f+n9ctaxWkq6y7lRn4geyMjSbjPxXEOeNuSa+u5sm
	afEoYfNl8RV8iBQD9EuDAlSIETvuGXHvWW+GVG6Ri7S1BK0TOnNKKbL7N4Lu2X7P
	GDgSdg+uOcH7UDkgi0zZ+2m+sZXE4R7DjdIPFAiKymsqKYjp+sKkhwmfkkXzU1Sc
	w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8mxej5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 04:17:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P3eaB1024408;
	Wed, 25 Jun 2025 04:17:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehkrhfhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 04:17:24 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55P4HGqi029022;
	Wed, 25 Jun 2025 04:17:23 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47ehkrhfem-6;
	Wed, 25 Jun 2025 04:17:23 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: linux-nvme@lists.infradead.org, rdunlap@infradead.org, kbusch@kernel.org,
        axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
        nilay@linux.ibm.com, corbet@lwn.net
Cc: alok.a.tiwari@oracle.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] docs: nvme: fix grammar in nvme-pci-endpoint-target.rst
Date: Tue, 24 Jun 2025 21:16:34 -0700
Message-ID: <20250625041643.174110-6-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250625041643.174110-1-alok.a.tiwari@oracle.com>
References: <20250625041643.174110-1-alok.a.tiwari@oracle.com>
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
X-Authority-Analysis: v=2.4 cv=IcWHWXqa c=1 sm=1 tr=0 ts=685b7855 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=8xN46rftBpwEPShuBVEA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf awl=host:13207
X-Proofpoint-ORIG-GUID: 42A_yuHYoqQbRvjFi9cZOixc_T0n_n7T
X-Proofpoint-GUID: 42A_yuHYoqQbRvjFi9cZOixc_T0n_n7T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAzMCBTYWx0ZWRfX++eHeVTEkkZw mz/IphO9hZYKsElG9f2kKuSHKKd6va4MTF0ezxtv5AehjQasw4KwMcCnMAJlMQC2prMikH0lHlT mAh5d5YsZPSC1YoRHnYn+NjheaL85iV1oZLRs026ypXZu6rKqjIo6DYojOBGgThHiCoxbePrb8z
 CvrtEzJO55u1j9PA+C++F1GZUfXcIbJg9bHIuOhu2uNcCZwkOU/udLCd+S4d7j3G/GC6lhujKSy u1g25YuliSEfq/fiK1NfWfPVoiE64ETZlKb6ix6tuNFypAeOdXltZxhrPcwo+3k5CLKysic/1PZ AA5WHhwhSsyXfhSaDieYQg0schEXDNzTZrosrP9mXNLTYgNb4dtkCGzALGkcvaUT0794VYQAerk
 nFT3DZoM/oKrMD8Yjk+41DC6sfI+CCUhNux7gSpLMxNHAgKHuSbixN7Vr7QfKLbIUeB3ruBU

Notable changes:
Use "an NVMe" instead of "a NVMe" throughout the document
Fix incorrect phrasing such as "will is discoverable" -> "is
discoverable"
Ensure consistent and proper article usage for clarity.

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
v2 
Extended the underline by one more character
as suggested by Randy
added Reviewed-by
---
 .../nvme/nvme-pci-endpoint-target.rst         | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/nvme/nvme-pci-endpoint-target.rst b/Documentation/nvme/nvme-pci-endpoint-target.rst
index b699595d1762b..2f75c8a267de5 100644
--- a/Documentation/nvme/nvme-pci-endpoint-target.rst
+++ b/Documentation/nvme/nvme-pci-endpoint-target.rst
@@ -6,20 +6,20 @@ NVMe PCI Endpoint Function Target
 
 :Author: Damien Le Moal <dlemoal@kernel.org>
 
-The NVMe PCI endpoint function target driver implements a NVMe PCIe controller
-using a NVMe fabrics target controller configured with the PCI transport type.
+The NVMe PCI endpoint function target driver implements an NVMe PCIe controller
+using an NVMe fabrics target controller configured with the PCI transport type.
 
 Overview
 ========
 
-The NVMe PCI endpoint function target driver allows exposing a NVMe target
+The NVMe PCI endpoint function target driver allows exposing an NVMe target
 controller over a PCIe link, thus implementing an NVMe PCIe device similar to a
 regular M.2 SSD. The target controller is created in the same manner as when
 using NVMe over fabrics: the controller represents the interface to an NVMe
 subsystem using a port. The port transfer type must be configured to be
 "pci". The subsystem can be configured to have namespaces backed by regular
 files or block devices, or can use NVMe passthrough to expose to the PCI host an
-existing physical NVMe device or a NVMe fabrics host controller (e.g. a NVMe TCP
+existing physical NVMe device or an NVMe fabrics host controller (e.g. a NVMe TCP
 host controller).
 
 The NVMe PCI endpoint function target driver relies as much as possible on the
@@ -181,10 +181,10 @@ Creating an NVMe endpoint device is a two step process. First, an NVMe target
 subsystem and port must be defined. Second, the NVMe PCI endpoint device must
 be setup and bound to the subsystem and port created.
 
-Creating a NVMe Subsystem and Port
-----------------------------------
+Creating an NVMe Subsystem and Port
+-----------------------------------
 
-Details about how to configure a NVMe target subsystem and port are outside the
+Details about how to configure an NVMe target subsystem and port are outside the
 scope of this document. The following only provides a simple example of a port
 and subsystem with a single namespace backed by a null_blk device.
 
@@ -234,8 +234,8 @@ Finally, create the target port and link it to the subsystem::
         # ln -s /sys/kernel/config/nvmet/subsystems/nvmepf.0.nqn \
                 /sys/kernel/config/nvmet/ports/1/subsystems/nvmepf.0.nqn
 
-Creating a NVMe PCI Endpoint Device
------------------------------------
+Creating an NVMe PCI Endpoint Device
+------------------------------------
 
 With the NVMe target subsystem and port ready for use, the NVMe PCI endpoint
 device can now be created and enabled. The NVMe PCI endpoint target driver
@@ -303,7 +303,7 @@ device controller::
 
         nvmet_pci_epf nvmet_pci_epf.0: Enabling controller
 
-On the host side, the NVMe PCI endpoint function target device will is
+On the host side, the NVMe PCI endpoint function target device is
 discoverable as a PCI device, with the vendor ID and device ID as configured::
 
         # lspci -n
-- 
2.46.0

