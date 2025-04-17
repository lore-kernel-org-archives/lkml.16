Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FB2145355;
	Thu, 17 Apr 2025 09:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744881032; cv=none; b=Svh0qYk72nAhy2fjIBpRrpXOIQvPoGJ2zC0eBKhLNrMmtFdAbUOK4dYgfGuMkH65sWBhiJ29SvRC/sYG8j6gAIRDTw1hjN/MR43W9UYLgiKrGzxdEkxd0sexgmFmVm7fqOtW8hUacmigLD4pLgQ6HmlP1bvg5dcjK9hmQ7KL5Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744881032; c=relaxed/simple;
	bh=KqHU+hq3HbsSzafDT7vxpU6Suxp8dH6jbuuVA8bGmtk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Mk6tkVfKzuq+WWhjs1uVG5WFS8KtfCFm0Lbrhc/A2Ohxa1i2Qybmpa41sjbvTtTlchL262EBTgrIDvK2SsP6y2ewBFxpvAAy1XnHmCC9ZeFYEVq/bjDknaTgu0mXgbJ3f4AiVPu7ujgMiPtJW0vLMzK0MKWJdjGpmgFL1aW3uvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=Wxu0hpju; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="Wxu0hpju"
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H503lJ018418;
	Thu, 17 Apr 2025 10:10:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=dk201812; bh=D+h2TZ9lOvg86CwKBD1NqPP
	fMjTY1kN80xOtNUeXHzc=; b=Wxu0hpjuRqf0La5w+XDNluu+PEaBPV7DZ1s828k
	mrAS0qqoCrnpf1IuQGXKyuyBgiBrnCQBh74sT3nySS4PNARI/bZgUktJAZcv+vcT
	ANdQKmDH4rIvrKxo1uSujIo4c3X2POtG92oj6gy0sR1gpJwDuucg2UhJm6UWknPQ
	2bZSZEA4QCg+9tpVXcEUG03OGxJM0ge0u29KzL15s18f8uN2EjxMBFLhr/W5eU0I
	zohEkYw+aXRkJmgDton2U6Hw3hcwHwSgag7xZ87Wru0P1yv2G/Zu8QYDFLm8xp8x
	EPOyzTuqH8N8VduUcaZ8/xuEzdYEBs8+Z+d65RkYYAmLQDg==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 461y2mh4tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 17 Apr 2025 10:10:16 +0100 (BST)
Received: from Matts-MacBook-Pro.local (172.25.7.98) by HHMAIL05.hh.imgtec.org
 (10.100.10.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 17 Apr
 2025 10:10:15 +0100
From: Matt Coster <matt.coster@imgtec.com>
Subject: [PATCH v2 0/2] Imagination BXS-4-64 MC1 GPU support (DTS changes)
Date: Thu, 17 Apr 2025 10:10:01 +0100
Message-ID: <20250417-bxs-4-64-dts-v2-0-9f8c09233114@imgtec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGnFAGgC/3XMSw7CIBSF4a00d+w1gECrI/dhOqg82jvoI0BIT
 cPexc4d/ic53wHRBXIRHs0BwWWKtC41xKUBMw3L6JBsbRBMKCa5wvceUaKWaFNEc++kZV2rldJ
 QL1twnvaTe/W1J4ppDZ9Tz/y3/oEyR4a+tTc/MK2Fsk+ax+TM1awz9KWUL/UfaZSpAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1107;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=KqHU+hq3HbsSzafDT7vxpU6Suxp8dH6jbuuVA8bGmtk=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWQwHC3bz3blnbad22vdG/PXqx/jbt42/XC34C7HmxMn9
 7geMt6s0FHKwiDGwSArpsiyY4XlCrU/aloSN34Vw8xhZQIZwsDFKQATWaTO8D/BRMtAI///OffC
 W/s4f0XoqZ3ojNWfe85MTUtPKGnfXhaG/1nHojfeVlnRLttpFs/n5if7RekUo+ssgdXLVbi/fq6
 ZwAgA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=LbU86ifi c=1 sm=1 tr=0 ts=6800c578 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=6pm0VhuFVbIA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=sozttTNsAAAA:8
 a=-EETvfFteC8Pj7O1jf4A:9 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: gBBFZuUz9O6x1AC4vTTdtQYDAkS9rPPi
X-Proofpoint-ORIG-GUID: gBBFZuUz9O6x1AC4vTTdtQYDAkS9rPPi

Now that the binding and driver changes to support the Imagination
BXS-4-64 [1] have landed in a DRM tree, here are the corresponding DTS
changes without the [DO NOT MERGE] tag.

This GPU is found in the TI AM68 family of SoCs, with initial support
added to the k3-j721s2 devicetree and tested on a TI SK-AM68 board.

[1]: https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com

Reviewed-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>

---
Changes in v2:
- Add details of the source of the interrupt index
- Add Randolph's Rb
- Link to v1: https://lore.kernel.org/r/20250415-bxs-4-64-dts-v1-0-f7d3fa06625d@imgtec.com

---
Matt Coster (2):
      arm64: dts: ti: k3-am62: New GPU binding details
      arm64: dts: ti: k3-j721s2: Add GPU node

 arch/arm64/boot/dts/ti/k3-am62-main.dtsi   |  4 +++-
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 12 ++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)
---
base-commit: d6fe216caf15d196e1bf76591440f8f17d58e7ee
change-id: 20250415-bxs-4-64-dts-c984d0876556

