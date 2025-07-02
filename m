Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA62B2367D3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751455785; cv=none; b=q130YmJqCA1IhzWqHEAolbMrOQ4Kmap3IbxNtKOqZlWCFH8tK0VxzX5HUa7bMsm/acCPWRFYhjt4IkK5EVb7yGBXBstKJWfJYG0/29E/JbJ2BZ5J5oWnivjHoOB1tNQUUwuNFL2QLK3FfqLfCjcy3LapA3Phdvy9xxQqJVHsvH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751455785; c=relaxed/simple;
	bh=LdphP1xXhKqZSYVvlZ50dcoluhElu4dQEdExDpFusYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FhYyVCnbQqNZxFWw8BhAxI7lVli7qz4q3YzN5CWPKy84lRT8yYhLcc9byqD9qQ2oVXz3N8+Ylly0xRNjhw6k1lhTOesAzajgB06Z+Ud4CGOQgp4RcxPakzMcnA6icUMNyqLM3KN/JErwT5BDR/lHC0YHUeIyJTL94VSMdtL0UWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=pBo3l1Dz; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="pBo3l1Dz"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5624VR2W008074;
	Wed, 2 Jul 2025 11:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=p/YBTsHarJnrR0kdVvkZX9N74PaI8WBrZluviimBl
	Yo=; b=pBo3l1DzSXJS4N2dhr2KEfSliVsCb5Vy/3hUHJUoxTuMCsaQavmf+xMBc
	iXOFJA4Mpfj7Y/lClpWLX24oBNWlyyC1mqyLNA2hYsq7ceBEhXU3HbS2naZNeVKr
	jG8iQWSbAQ+OfavYAvf/4DxFNvyX0idNxnpRmY/saJvtLWfJYQAWKg/NNxpoeBU5
	VCeU8pMlgyZYdiEbjdDxaYwOCxZrKSAwQIYSgGDQS2AZRTWkIR+HdwvyCHH+Vj1+
	dBoH1T1tJTGdcPS8jdetleeMYOOe7ABGGg0etjyGhCURZQG9VUjGjP5AAVFvcJar
	Lq8TEbUI6lz0Xi9kJk/o7Nbo7xqEQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j7wrn4g9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 11:29:10 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 562B6f0n012548;
	Wed, 2 Jul 2025 11:29:09 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j7wrn4g4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 11:29:09 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 562AfvpQ012054;
	Wed, 2 Jul 2025 11:29:08 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47jv7my4qs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 11:29:08 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 562BT6M751970374
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Jul 2025 11:29:06 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A8AA20049;
	Wed,  2 Jul 2025 11:29:06 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D335820040;
	Wed,  2 Jul 2025 11:29:03 +0000 (GMT)
Received: from ltczz402-lp1.aus.stglabs.ibm.com (unknown [9.40.194.31])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  2 Jul 2025 11:29:03 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
        KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>,
        Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH] drivers/base/node: Handle error properly in register_one_node()
Date: Wed,  2 Jul 2025 06:28:56 -0500
Message-ID: <20250702112856.295176-1-donettom@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=E/PNpbdl c=1 sm=1 tr=0 ts=68651806 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=VrXgkTA_NDOggtd2K6IA:9
X-Proofpoint-GUID: RSfRXe1pJUfoStl0RtYoKOyEq5Zpp2lP
X-Proofpoint-ORIG-GUID: AXXZW-3Kuz0pGuqr65ZFqcOPMRIsj9Vf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA5MSBTYWx0ZWRfX1ev3hEi+ylHe yiNfqCrt3gKXzzEZzKqJkV/jwwjFVSD8xwrLTgR1D4tmdNv7B0CQzk2SXj41dT+Jmp5P1U0lJS5 aRrwUAMtfFmHBieZtAxXIQh6TjjoPt6yqQw9Gqf3PFJS1Oj2YTrpEL0XvM0qIRXtmvUTiflRgU+
 fFGyBi/n7ndAt7aPUPO++z6ysIq7H5SyTnBN5bixY7SzW3D8iLatwDN4Wy6Il6wj/zWGBlTecJ8 Osl7b3TbQJ5RcdtdCYleNWtqjo8O6OPbOucX/cZfM5IIGZyCAjJ+NnWBQrTeDqrzsbggEeXjYmt fKYHrE1xpn0boSvrT8NmVYmhvZjb0WS1klcyUKL3cVll3dv3ALhlY4Pk1PZh2RDfRvTOtn+m3vv
 5kcQRNonSu/q9bRfYarUpouEF7edpSofRT2aamfthN8GXsZVt2aLDnoD3gVxokD3lMa1gOyh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0 mlxlogscore=953
 lowpriorityscore=0 mlxscore=0 clxscore=1011 adultscore=0 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020091

If register_node() returns an error, it is not handled correctly.
The function will proceed further and try to register CPUs under the
node, which is not correct.

So, in this patch, if register_node() returns an error, we return
immediately from the function.

Signed-off-by: Donet Tom <donettom@linux.ibm.com>
---

This patch is based on the mm-unstable branch.

Fixes: 76b67ed9dce6 ("[PATCH] node hotplug: register cpu: remove node struct")

The issue has been present since the above commit, which is
quite old. Should I add a Fixes: tag and backport it to all
kernels that have this commit?
---
 drivers/base/node.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/base/node.c b/drivers/base/node.c
index bef84f01712f..aec991b4c0b2 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -885,6 +885,8 @@ int register_one_node(int nid)
 	node_devices[nid] = node;
 
 	error = register_node(node_devices[nid], nid);
+	if (error)
+		return error;
 
 	/* link cpu under this node */
 	for_each_present_cpu(cpu) {
-- 
2.47.1

