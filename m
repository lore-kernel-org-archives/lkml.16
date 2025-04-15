Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70EE1F4188;
	Tue, 15 Apr 2025 16:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744734061; cv=none; b=RfwogzfpYMiKnkUlDxxKkFk3FZNtUunRof2H+b6A+L/aeu+7/IqqNerwrNW6q6lcTeKItXaP4c7ugEq0DYADAusx1AFtRlRYLhf58QIMgwuU/8/LsKjBS6CZkM7KYU3eRtsjQXewthJRqCLol4uxc3iC1WKFIGXbWkfDRtrEZ4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744734061; c=relaxed/simple;
	bh=R6oJbOSdI93M6ihDGiGprnVl9fh+A4F0YVOXmGTzuEU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=kNfSvaConybwZV3Kjq7Cf2yj4Cv5VlWF4wUyKGMPe9ohidyMMYGHxoxrS2tlWw3CJ+ja4nVr7iZImPoobyBsyzIUvlFMC75qQ/hBKktjkkuqlGBaj6es29DUnq0IdduWylXQYMVzuc1h6S4qzqrb+Sn940EfvWoeih8dMxH4f3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=wY4dHVhd; arc=none smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="wY4dHVhd"
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F7w6Y5029858;
	Tue, 15 Apr 2025 17:20:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=dk201812; bh=MdbgZzGrpf3fbja1j7+Yz6F
	ptArFQVzlNAO/yRnhqUY=; b=wY4dHVhd2akXI4tZJ7bJZgQ2+D+3PgGbWhgfEGZ
	CToE39my81fTVmOj3uIQIxFRBfwOVQDjh0q37xL4tvoQYGlSr4W2zT9nl4YyVDy7
	sI3j1pUhvj4ehqHNrQfHXcCIljegyuzMycmX1r2w9eIlvEFKQpv6TE0MX/1/V1Un
	+x60AfY8IZr5eoM6ZFIUpneVcPHk32ahqgpI11hVSLbwTGNHVrjppIfeUamJ/LLp
	T5cqFtPMpSbrP1Ye4CnmvPGLH99x2m1vFFqxcRbJxYVJsMM1hOyW01i8tbqHmX3b
	lIQpExuhyB/xa9+hWVFhki1iZQYvzf7P4/Ks9zrXrRe2X3g==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 45yeeua1mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 15 Apr 2025 17:20:35 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.134) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 15 Apr 2025 17:20:34 +0100
From: Matt Coster <matt.coster@imgtec.com>
Subject: [PATCH 0/2] Imagination BXS-4-64 MC1 GPU support (DTS changes)
Date: Tue, 15 Apr 2025 17:20:23 +0100
Message-ID: <20250415-bxs-4-64-dts-v1-0-f7d3fa06625d@imgtec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEiH/mcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0NT3aSKYl0TXTMT3ZSSYt1kSwuTFAMLczNTUzMloJaCotS0zAqwcdG
 xtbUAQUia+F4AAAA=
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
        Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=824; i=matt.coster@imgtec.com;
 h=from:subject:message-id; bh=R6oJbOSdI93M6ihDGiGprnVl9fh+A4F0YVOXmGTzuEU=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaT/aw+80r1sosreTPHNq9bwXFbk+5AlFPjz/IQl/qd8u
 vdU39/6vKOUhUGMg0FWTJFlxwrLFWp/1LQkbvwqhpnDygQyhIGLUwAmMuEuwy9mZ47tLD/nqMSE
 Bf9kmHjw4Kt9Ir5VaU1vHht9km2Y7sjDyHD7pkccc77gwY25nCxsak+z1GP0GpVquVuWed1NP2y
 hzgkA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=Ga0XnRXL c=1 sm=1 tr=0 ts=67fe8753 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=UtEzwyU9vMAA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=zVSXwL2RMzKZDUOSOyAA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: 2SfXehZXwoaluiDtpteBdrc6yWZFut3X
X-Proofpoint-ORIG-GUID: 2SfXehZXwoaluiDtpteBdrc6yWZFut3X

Now that the binding and driver changes to support the Imagination
BXS-4-64 [1] have landed in a DRM tree, here are the corresponding DTS
changes without the [DO NOT MERGE] tag.

This GPU is found in the TI AM68 family of SoCs, with initial support
added to the k3-j721s2 devicetree and tested on a TI SK-AM68 board.

[1]: https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com

---
Matt Coster (2):
      arm64: dts: ti: k3-am62: New GPU binding details
      arm64: dts: ti: k3-j721s2: Add GPU node

 arch/arm64/boot/dts/ti/k3-am62-main.dtsi   |  4 +++-
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 12 ++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)
---
base-commit: 81f6e0e0f3505809dd78eab129106f1c0cf2baf1
change-id: 20250415-bxs-4-64-dts-c984d0876556

