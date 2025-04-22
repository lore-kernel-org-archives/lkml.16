Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB2C28CF50;
	Tue, 22 Apr 2025 15:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745335639; cv=none; b=ALamL/OEfBYxC0e1TzVoGDSrehRk+G1P8BaAvfCFhEi1cZVwlm6qjoa54UaxmCD3g9+H3xeybm807SY9WrBK1MTksRVluxpCyHzr8MYn64C3qNNXt1fnSCwRAAdogCJ81/vkKIlVMnBibWUbhpNbrRDXFvkbMKT2nJdIGyC68O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745335639; c=relaxed/simple;
	bh=osF8SRCtVm7uYw0wV8+zhPfygDG1r4KTYhsXoYexelE=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=uafJcjq0hVjfZHlDZp9rqTtOMbATJTliUd3Urr+1YjT/L4jXDo3a0LkVxdWrma6oVabdFxV/jAqzSdTAAKJhu1y/HJS3/BAtfiG5oU2vcc4fxjOjFl4GpVOFy1b78Xb/z4T3mlRFU4xeDIdGejGINKYBYB95ox+uqv3TBzAT7wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=O7wPBaYt; arc=none smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="O7wPBaYt"
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7sLlD009013;
	Tue, 22 Apr 2025 16:26:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=dk201812; bh=2oGiXeRJ3zc5ZF+d499Pf2V
	ijeVDbIWsPwwy9McpzxY=; b=O7wPBaYtqRicm1+wJJKjQVjjU16RhdwbKObb2D0
	H7GJeCuq+73Kg9f/zFQ2LgkAe4BJw1JKYVCizI9ZQff8B7OrEbGCW5NrNYVSxdFw
	lfEglHuSoWuIjrYV8RPuaJdQT+PjVcBBl4HJ1dQR5Il84bGAPkLWLmKmrXeqaRo8
	HfAaETmfJ7++BJ5+sGaVKrj+RZcDvB2IcsWwj8B5jw9nth4GovjS/cKSI65p8smU
	InY1Ix4lfOnm2F26kojmSz4JfPWYe8dsBxIR4ICPDmzaDUiCApUyhbIFGhAzoBqm
	PPpgc8ms0XPaUfTYZ8r++9w3GPJrmmbPXpybXcqAYUIrykA==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 46423t1u0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 22 Apr 2025 16:26:51 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.7.98) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 22 Apr 2025 16:26:50 +0100
From: Matt Coster <matt.coster@imgtec.com>
Subject: [PATCH v3 0/2] Imagination BXS-4-64 MC1 GPU support (DTS changes)
Date: Tue, 22 Apr 2025 16:26:40 +0100
Message-ID: <20250422-bxs-4-64-dts-v3-0-ec6657bde135@imgtec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADC1B2gC/3XMSw6CMBSF4a2QO/aavgFH7sM4wD6gA8C0TYMh7
 N3CSE0cnpN8/wrRBm8jXKoVgs0++nkqg58q0EM39Ra9KRsYYZIIKvGxRBSoBJoUUbeNMKSplZQ
 KCnkG6/xy5G73sgcf0xxeRz3T/f0TyhQJutpw1xGlmDRXP/bJ6rOeR9hLmX3q+kezolvXaNIyz
 ikVX3rbtjdrsbSM5wAAAA==
X-Change-ID: 20250415-bxs-4-64-dts-c984d0876556
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Frank Binns <frank.binns@imgtec.com>,
        "Alessio Belle" <alessio.belle@imgtec.com>,
        Alexandru Dadu
	<alexandru.dadu@imgtec.com>,
        Luigi Santivetti <luigi.santivetti@imgtec.com>,
        Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>,
        Matt Coster
	<matt.coster@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1296;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=osF8SRCtVm7uYw0wV8+zhPfygDG1r4KTYhsXoYexelE=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWSwb7V8Njn2rNGfQ/v3hfRqu20R2tibu5L7fvEevxXRC
 +OWyF462VHKwiDGwSArpsiyY4XlCrU/aloSN34Vw8xhZQIZwsDFKQATMWxi+Gda5n/T/8eX2++/
 LWe0/7XFbnP1KxEh1Tfdbq2C6td+pUcwMkxQLwn5kXk/Ne1+4t6dYdLixwtWFm7//279381WBjL
 FtUwA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=L60dQ/T8 c=1 sm=1 tr=0 ts=6807b53b cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=6pm0VhuFVbIA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=sozttTNsAAAA:8
 a=_yRp58ONHCnQFu2M2WYA:9 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: pd8aAIL72NSechMn-Ap2aj1T9LbpDTOQ
X-Proofpoint-GUID: pd8aAIL72NSechMn-Ap2aj1T9LbpDTOQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIyMDExNyBTYWx0ZWRfXxbe5BKxbbxwi pkYBnpcgrtnbSxWQa8pFhkUmcM9LlTcEIiJDrW5QlDlIbtRHnq8Wlp2Mit3gYpk8GqCphMGM94R TGfVGKPNswwqy3uRevzYgVvNB0NYJ5qa3oaQ+ID3capvn8kqP+BpafxGqIadDccPMzn4LRMSMzB
 PRja5kHKjxo+0zkmba4aAke7rg5CDQfaFUwG+FqHi5M0U73JC1Qhg30loWD9LtHANhKS//5vr7A ldb0YIvUWHac5S9UBsdpuLYQmPaOWOmNTude+HLOO7iyMrT38zySPFX7RWsgHlpc22+FDQGA8OZ QQ+TmlcOnagQF4PiGabjYxRWmlftsqZqPZdWzNNInDXpUTHAHvYzKZ8UtSEIZAh41Eg9yDAgSbr
 AV5uaMjV9tcMp/JcsjZzKElj+xY9AOeUylCv9icqJeCO4gJAhKvIKNxpnK+imiMVvRhcRwqI

Now that the binding and driver changes to support the Imagination
BXS-4-64 [1] have landed in a DRM tree, here are the corresponding DTS
changes without the [DO NOT MERGE] tag.

This GPU is found in the TI AM68 family of SoCs, with initial support
added to the k3-j721s2 devicetree and tested on a TI SK-AM68 board.

[1]: https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com

Reviewed-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>

---
Changes in v3:
- Use assigned-clocks to pre-load the frequency of the core clock (P2)
- Link to v2: https://lore.kernel.org/r/20250417-bxs-4-64-dts-v2-0-9f8c09233114@imgtec.com

Changes in v2:
- Add details of the source of the interrupt index (P2)
- Add Randolph's Rb
- Link to v1: https://lore.kernel.org/r/20250415-bxs-4-64-dts-v1-0-f7d3fa06625d@imgtec.com

---
Matt Coster (2):
      arm64: dts: ti: k3-am62: New GPU binding details
      arm64: dts: ti: k3-j721s2: Add GPU node

 arch/arm64/boot/dts/ti/k3-am62-main.dtsi   |  4 +++-
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 14 ++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)
---
base-commit: dcbd5dcc956e2331414fd7020b4655df08deeb87
change-id: 20250415-bxs-4-64-dts-c984d0876556

