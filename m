Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC88F1A239E
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747892709; cv=none; b=TKSJREDxFVd4647bnOTaZx/0d6q97h8LWMQJw4rQZOdhGZ5MOBGiYlX78P8lvBRAQSLfiIIrf/HhBlr54Fl11qU6dWGyEDLc6IYBOTe57vLIFv0dpMwjDmrvzbr03UFR1dXJcsqnw4i7bkjEvC8hKHY3EjHAt0rKlcVsCjv+1lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747892709; c=relaxed/simple;
	bh=wn5rvngoXjEOTbs9LydJrFYAObEZzhOB5gLsGzJit9E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hczzvvcWlqNH6t8nhs0xo6O1P1BA6hGoNmm9i23ql+ppd3bJkJIk+UD5mkpRBtipR6s2DjsiQl9mQa6jk80LA8jvK57/jfxA9oRs7S8CFPzd03KediyXv5VwLhx/ZRSP+IjM94A2CwHxPJFWuxXX3b9bMa0OeblJ6dmIeM2k3l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=KEGmmMfa; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="KEGmmMfa"
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M0H9Ih018805;
	Wed, 21 May 2025 22:44:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=MZ1QNQEa3i4s4PYSuorS108
	MHOUPJ+06yTcg/25jY0o=; b=KEGmmMfaWzR6hBAMW1haLG5FM1l9z6w+ZGkhcvH
	HDhpTNR3nesQ+GyH4/SHJipBcdjJQ6CdR8814PKRNd0kIWh4cAWuA/ZvpX9SLChn
	HQXxnV4XjbI+8fFqknUy/y9GndTBMar1qVHE82Tfm9tyCyD2Hp0xei9+rSDimHmz
	GMo7mUayE/FWUeTjzXswlNfiZdhaC3p+xmNDFvPrGSoWa8xaFFARY3+FzTQ/ksA8
	yEHewx39Ha/oArcdBpEDjzcRcgGfyvVou7oZUNiZgiPZyQxsYVmGbVdZEUoydj1+
	NZ3b4Ke9mjREeIRmT1P2bCwe1HzDmTmM5a0Wc9JmOxfZBMQ==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 46sqap8nyb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 22:44:45 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 21 May 2025 22:44:44 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Wed, 21 May 2025 22:44:44 -0700
Received: from tx2-sever.caveonetworks.com (unknown [10.110.141.15])
	by maili.marvell.com (Postfix) with ESMTP id 819915B694B;
	Wed, 21 May 2025 22:44:44 -0700 (PDT)
From: George Cherian <george.cherian@marvell.com>
To: <arnd@arndb.de>, <alexander.sverdlin@gmail.com>, <agaur@marvell.com>,
        <nikita.shubin@maquefel.me>, <vkoul@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <gcherian@marvell.com>
Subject: [PATCH v6 0/4] soc: marvell: Add a general purpose RVU physical
Date: Thu, 22 May 2025 05:44:40 +0000
Message-ID: <20250522054444.3531124-1-george.cherian@marvell.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Lwjci2CeWI99JYYizY_3o_Ig05fx6NET
X-Authority-Analysis: v=2.4 cv=HfgUTjE8 c=1 sm=1 tr=0 ts=682eb9cd cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=dt9VzEwgFbYA:10 a=u9sYCzFxeLlO5s99bmEA:9
X-Proofpoint-ORIG-GUID: Lwjci2CeWI99JYYizY_3o_Ig05fx6NET
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA1NiBTYWx0ZWRfX8huweje9ZhmV iz+xeYishK+PGIZk208ei/vNAQxjpT74pQE/vlnzVPQUI/K9WQyetgFX3bmlapOHGwhY0JXXZPl QnG2bcT4efGdKq94v5ITBfcB+o/P3TRzJgK/bqheNcJhnuAW5/kPwCFkdbg0TZY/mAZcf9jOvBw
 6STi13qfdt91107lxKKu86eFjteVLBET7Hpkqd3GbgFlRlC+bVXrEUvMqTOPGldSsoHzOZCGkef smzimQyrjChvNShEuVWuLgW332vgIYZ5Sc767ym19CjIaPgFZbVw9KyF27JKhzyX2xEQ/D4W+C5 P+MFrx4/+nV/UB569k+u/agQWSvC1vkoGks56u+20wVoUlB/fKscx6ZqLN9qXD7YDEghGri9O2d
 ziK7JiFq/1xbhRdpGmXkuq+LU02c9N+K8tVaKl9YnkbTOyOS7mUszbaz4N8GnvEDr8+DAfxn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_03,2025-05-20_03,2025-03-28_01

Resource virtualization unit (RVU) on Marvell's Octeon series of
silicons maps HW resources from the network, crypto and other functional
blocks into PCI-compatible physical and virtual functions. Each
functional block again has multiple local functions (LFs) for
provisioning to PCI devices. RVU supports multiple PCIe SRIOV physical
functions (PFs) and virtual functions (VFs). And RVU admin function (AF)
is the one which manages all the resources (local functions etc) in the
system.

Functionality of these PFs and VFs depends on which block LFs are
attached to them. Depending on usecase some PFs might support IO (ie LFs
attached) and some may not. For the usecases where PF doesn't (need to)
support IO, PF's driver will be limited to below functionality.

1. Creating and destroying of PCIe SRIOV VFs
2. Support mailbox communication between VFs and admin function
(RVU AF)
3. PCIe Function level reset (FLR) for VFs

For such PFs, this patch series adds a general purpose driver which
supports above functionality.  This will avoid duplicating same
functionality for different RVU PFs.

Next generation of Octeon silicon will have many new RVU blocks added.
Eg: ML, Octeon (connected as an EP card) to host network packet path etc
For such functionality there could be only userspace VF drivers hence
a generic PF driver in Kernel is needed to support these VF drivers.

For reference
RVU AF driver is at drivers/net/ethernet/marvell/octeontx2/af/

Example RVU PF drivers
drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
drivers/crypto/marvell/octeontx2/otx2_cptpf_main.c

Example RVU VF drivers
drivers/net/ethernet/marvell/octeontx2/nic/otx2_vf.c
drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c

Patch-1: This patch adds a generic PF driver with probe() and sriov()
capabilities.
Patch-2: This patch adds PF-AF mailbox support to the generic PF driver.
Patch-3: This patch adds PF-VF mailbox support to the generic PF driver.
Patch-4: This patch adds FLR handler to the generic PF driver.

Changes:
v2:
- Patch-1: Fixed indentation issues pointed out by Alexander Sverdlin
- Patch-4: In function rvu_gen_pf_flr_handler, added ~RVU_PFVF_FUNC_MASK 
  pointed out by Alexander Sverdlin
v3:
- Patches-1-4: added multiline comments as per coding style, pointed out
  by Krzysztof Kozlowski
v4:
- Just a reminder to review patches, no change from v3 to v4
v5:
- Adding Arnd Bergmann to the mailing list
v6:
- Rebase to latest kernel for re-submission.
- Add ealier received Reviewed-by to individual patches.

Anshumali Gaur (4):
  soc: marvell: Add a general purpose RVU PF driver
  soc: marvell: rvu-pf: Add PF to AF mailbox communication support.
  soc: marvell: rvu-pf: Add mailbox communication btw RVU VFs and PF.
  soc: marvell: rvu-pf: Handle function level reset (FLR) IRQs for VFs

 drivers/soc/Kconfig                     |    1 +
 drivers/soc/Makefile                    |    1 +
 drivers/soc/marvell/Kconfig             |   19 +
 drivers/soc/marvell/Makefile            |    2 +
 drivers/soc/marvell/rvu_gen_pf/Makefile |    5 +
 drivers/soc/marvell/rvu_gen_pf/gen_pf.c | 1090 +++++++++++++++++++++++
 drivers/soc/marvell/rvu_gen_pf/gen_pf.h |  152 ++++
 7 files changed, 1270 insertions(+)
 create mode 100644 drivers/soc/marvell/Kconfig
 create mode 100644 drivers/soc/marvell/Makefile
 create mode 100644 drivers/soc/marvell/rvu_gen_pf/Makefile
 create mode 100644 drivers/soc/marvell/rvu_gen_pf/gen_pf.c
 create mode 100644 drivers/soc/marvell/rvu_gen_pf/gen_pf.h

-- 
2.34.1

