Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959803BBF2;
	Wed, 18 Jun 2025 07:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750231047; cv=none; b=TDAZQW9WQpmQ6Ur5rWFRAHf4zEgMlY5YhkDB5BIsiz4sszBef5TB8+KOcvi4RlEzJnjlw8JIokpgDOnH/81TVk9b2buRh+58lXrfyHyvHGIK4Q53aJ+w75jByhBdiu4u14MS6JKt1fGQkkGUOAats2ShLr654KRH5KVDY3sbwiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750231047; c=relaxed/simple;
	bh=Ien8JIYHGNL5X9LLCr5Rx52JCUxh6saVyb5rnnTYT6A=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=uue5V6255UMgG+hPVrxe737G/3cZIfMqD48npG9zdl6eJIU72JMIWduIYwPWU+txbuC7BFuC6X+awViw/+7iK+jtUdyVrC/wV5Tj4jiVsd+dodLpYaKOU7XzXRdtELd4QC0H6IwstUTKMbKzl9vYROcr1ghEFIMsovB5gDKDj4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=qN4wc4XX; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="qN4wc4XX"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I5snrQ032110;
	Wed, 18 Jun 2025 03:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=xpEAYvZLAh3gR76m6/qRao45ed8
	Isl8God5610JbqLE=; b=qN4wc4XXCXt2sPZQXWoUuQhk1ku7Ht2CNBz1XiZEpol
	s0RopwDq8hwN/q5jwi91xd1TrvUP4KA9SBxIsUKjzkLZc1Vn7/qlXBwLgpMDjQcu
	n23S9oEJrn2fXX5q/ilaDKqU7cPadNSwxMVpjIQu48JcaRYQXwnhVOH/51LWlKgG
	WPpU+lToi5D/zCswBV21ZpqLPerlC3bWJXDMLIugNsNhBzYIUmQPoktCMp+HmiDR
	PupciDym3byEJZV/ETwjfKDrxKU7f3fAMeXCeMdznaw3MswVm/Yv5Tje2kA3zA8y
	GUyxmCmfEDWKTD/dZ0Em4pHaw2aHM7fNwlKgy0ilDyg==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 47bfshaeq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 03:17:01 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 55I7H0Qx037088
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 18 Jun 2025 03:17:00 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 18 Jun 2025 03:17:00 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 18 Jun 2025 03:17:00 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 18 Jun 2025 03:17:00 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.56] (may be forged))
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 55I7GkPe027550;
	Wed, 18 Jun 2025 03:16:48 -0400
From: Jorge Marques <jorge.marques@analog.com>
Subject: [PATCH v3 0/2] Add ADI I3C Controller
Date: Wed, 18 Jun 2025 09:16:42 +0200
Message-ID: <20250618-adi-i3c-master-v3-0-e66170a6cb95@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANpnUmgC/3XMQQ6CMBCF4auQrq0ppdTqynsYF0M7wCRCSUsaD
 eHuFlYa4/K95PsXFjEQRnYpFhYwUSQ/5lEdCmZ7GDvk5PJmUshaaKE4OOJUWT5AnDFwCXWpjK2
 NVSeW0RSwpecevN3z7inOPrz2fiq3928qlVxwoYxBIxy0trnCCA/fHa0f2NZK8tPrHy+zR22aM
 4CTuhJffl3XNzlo51/tAAAA
X-Change-ID: 20250604-adi-i3c-master-2a5148c58c47
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <gastmaier@gmail.com>,
        Jorge Marques
	<jorge.marques@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750231006; l=2324;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=Ien8JIYHGNL5X9LLCr5Rx52JCUxh6saVyb5rnnTYT6A=;
 b=VHvCqbVxJVVuKcCIgbiwFLjMYONjHpn2RhKRqQfhpRS9Hl1a8C3RFS0La6yvwPfC3shpefbIx
 hLANmzJUM6OD3uUiDhqiekhJZZPHMVr1Bj0BcuqvBVJP6rZbzjKUOWL
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: G2roF2RkUwpr_wxd-zUKabprrgpFIutW
X-Authority-Analysis: v=2.4 cv=SKhCVPvH c=1 sm=1 tr=0 ts=685267ed cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=wI1k2SEZAAAA:8 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=Au82MslZ5VMqyGn2ihwA:9 a=QEXdDO2ut3YA:10
 a=6HWbV-4b7c7AdzY24d_u:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA2MiBTYWx0ZWRfX6mL8myALvm0Z
 Qkgph8kxruPUuvfBZGcj66e7tD/N32/RgpMeyjrCJYdZz3R8Bw2h2pclmELh0cXm/In6COcrTNI
 oOqbc6Wtk/lBm9++52BcY1mbug+a4uVOkBpCxdp7/mFQMv0MyfjPwY9ARK9iE1irURfn0H1zfLR
 4qL7WQ6LsRI2OlfY4zLxrwBCUsK8Dx9gEMcGmq094uIxNPixeooBAmTEN/s1VvBnJpB64Fc8yYa
 5zkZtRYmFJZRgSfjlGV+tBY3eXqfbBmGNkUUova8aLuRbs99/1WWLrjwkGTjaKN67/CfRMOOBuq
 k5LXBRSio9FZkPZn0R4AkMjago5RVMUljdkywUvtRxjGn/8KBl8GjyVi9MtKJQFrShFba4wxie/
 Ty6w1pZsDpSiOaNvldJlwpQRqDRhTWy7tagwVkWt3A3H7ehnhEGohfk1Mltgw3BA/7tu3/su
X-Proofpoint-GUID: G2roF2RkUwpr_wxd-zUKabprrgpFIutW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 clxscore=1011
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180062

I3C Controller is subset of the I3C-basic specification to interface
peripherals through I3C and I2C. The controller RTL is FPGA
synthesizable and documentation is provided at
https://analogdevicesinc.github.io/hdl/library/i3c_controller

The main target for the I3C Controller IP is low-cost FPGAs.
In this version the driver supports IBI (only the MDB), I3C and I2C
transfers.

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
Changes in v3:
Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml:
- Small reworking of the description
- Add -1.00.a suffix to compatible

adi-i3c-master.c:
- Misspelling
- Remove REG_CMD_FIFO_0_LEN_MAX since it is a HDL parameter
- Use adapter timeout value for I2C transfers, as in
  https://lore.kernel.org/linux-i3c/aEBd%2FFIKADYr%2F631@lizhi-Precision-Tower-5810/T/#t

- Link to v2: https://lore.kernel.org/r/20250606-adi-i3c-master-v2-0-e68b9aad2630@analog.com

Changes in v2:
Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml:
- Move allof
- Rename clocks to axi, i3c

adi-i3c-master.c:
- Update license year
- Rework regmap to use FIELD_GET, FIELD_PREP
- Reformat regmap to have FIELDS after REG, prefixed by reg name.
- Add overflow safeguards to cmd, tx fifos
- Fix macro related macros (mostly erroneous `| ~BITMASK`
- Use guard macros, remove goto.
- Simplify daa logic
- Replace devm_clk_get with devm_clk_get_enabled
- Solve 64bit->32bit warnings on x86_64 systems by casting to u32
- Immediate clear irq request flags, then handle it.

- Link to v1: https://lore.kernel.org/r/20250604-adi-i3c-master-v1-0-0488e80dafcb@analog.com

---
Jorge Marques (2):
      dt-bindings: i3c: Add adi-i3c-master
      i3c: master: Add driver for Analog Devices I3C Controller IP

 .../devicetree/bindings/i3c/adi,i3c-master.yaml    |   63 ++
 MAINTAINERS                                        |    6 +
 drivers/i3c/master/Kconfig                         |   11 +
 drivers/i3c/master/Makefile                        |    1 +
 drivers/i3c/master/adi-i3c-master.c                | 1026 ++++++++++++++++++++
 5 files changed, 1107 insertions(+)
---
base-commit: 00286d7d643d3c98e48d9cc3a9f471b37154f462
change-id: 20250604-adi-i3c-master-2a5148c58c47

Best regards,
-- 
Jorge Marques <jorge.marques@analog.com>

