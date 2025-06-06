Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90A028852E;
	Fri,  6 Jun 2025 13:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749216128; cv=none; b=YZNffPTTlgygDIsw5UY/88DTAkuYQWMQZ2ksOkAIkZWE8PTJKaKQrODgrs0LzwCc1oRmg51TBwamM/R7bLEfrz4/aANjCzgmVPZV9inY5ciVAFIPhwUomKpUxxCYMGlCZgo2jK0p6Juii/iumhO4mtE6GyOzxGlmygvUgi2kU5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749216128; c=relaxed/simple;
	bh=HXUSPIeGfPlxzaXoYjQ3XjGGPG7eTsTGSFtIt+yUcBg=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=LTD705vI4O4Aa7zDxoYTxEcoZlauepa80N26AE/yMbB3RMaqxWBh8U9Kgfpvw9DVOUXIkyxXyMj57kDyO6TLfOYAulDjQIo2cKFbbWLMX5HGTRXwlyoxt1vx5uZm2k/hmLulhNJI/cC+/kwYgDk1LkD8z64WpQ/7kcb8K4zAXbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=ZiTrqzJJ; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="ZiTrqzJJ"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556A4CZE023305;
	Fri, 6 Jun 2025 09:21:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=ey1mPWftpv8vECIwHbLkr5qwFJ1
	ZZ9u9LuHvS5v4RzA=; b=ZiTrqzJJPsz8/MlMgre7blKD6nn94WSyGU0Iw2Bo+XY
	Q1pOmH4neC+LvoajNXnBeMxjW3QNu1wV8DBj/WQFJ7WlAg5nZAkimH4eMSCfpbCH
	n98Vg1JKqsXKpO03CMwIdx60tfqyZh2c1AGvbF3Dmk2qtdcpda4EoGqRGEUAagXs
	T2X2t5uv6tvMqsVFfQfWwBeO0i8AMjVb4LiLtM/W6kDh16o9q0J3PhGgU8FNgYfO
	RklbUZS9gdVZhih3UoGHPPYBP0bjigSBcpYUEetJMnRet5zVjqcwCzG6EoFPyQnI
	EoMUG8r4Fg+f8oou3TBcJTzzb+Bd0/PSr0wNPM0Yh4g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 472k2ucax2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 09:21:49 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 556DLmlZ020850
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Jun 2025 09:21:48 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 6 Jun 2025 09:21:48 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 6 Jun 2025 09:21:48 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Jun 2025 09:21:47 -0400
Received: from [127.0.1.1] ([10.44.3.40])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 556DLYfg019626;
	Fri, 6 Jun 2025 09:21:36 -0400
From: Jorge Marques <jorge.marques@analog.com>
Subject: [PATCH v2 0/2] Add ADI I3C Controller
Date: Fri, 6 Jun 2025 15:21:01 +0200
Message-ID: <20250606-adi-i3c-master-v2-0-e68b9aad2630@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD3rQmgC/3XMQQrCMBCF4auUWTuSxlSDK+8hXYzJtB2wjSQlK
 CV3N3bv8n/wvg0SR+EE12aDyFmShKWGPjTgJlpGRvG1QSvdqbMySF5QTg5nSitH1NS1xrrOOnO
 BenpFHuS9g/e+9iRpDfGz+7n9rX+p3KJCZaxlqzwN7nGjhZ5hPLowQ19K+QLKbL/frQAAAA==
X-Change-ID: 20250604-adi-i3c-master-2a5148c58c47
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Jorge Marques <jorge.marques@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749216066; l=1780;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=HXUSPIeGfPlxzaXoYjQ3XjGGPG7eTsTGSFtIt+yUcBg=;
 b=18wnOy8oGffhLR2PP5h7iu8RmNCmspFkVGdGkjM3ytor09e5nQ26iYmyw1ceIAuiJxhCFdRwX
 2lRNxhJKQsaDv+ewrFp2htGW9AM21glRU4bTNsRdPc8LnbBYfXWakEp
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: x2DARNsv_yv-LP4Jh0o8RUl5dYp9tw3y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEyMSBTYWx0ZWRfX8ylsvDl38fMu
 IUVhdVcq9bH8rot+FlnsAdoP+JUHVAvFbz9SgvaeeduGfvq8WICvzE1WQEoBBaUPDYALkY49PCE
 i5CqbJBjYC4ph6MI95shSUBeI1NSE9YaVspY0geQqEEk0w1886ho385XC6QNhesrCxVXhdlwLSd
 2Ngf9CHP+Ppoo/6sxiAePw41RTV7DsTlByz48/Bj6S0EP1WzrNqFs0Ptcjmpr9RCwXqX4ge87BV
 py4yEhc0uBRByQ5Cwzdvrmwaz1dI70AM8j87Z5fQm7dRfc+Wj95W8p4UbICqLQEDem6FLv1TdDx
 pS+i+xu9urEFV73maDvo3mu+kfcw+FKZxEoWaxRWTBYzLsKRihEUbTXxODfPlaar+HDMYRFLYEt
 DDbImcjDXD9JwecyqheEDD69a5XanTxf2w3FcPLXJOo+/ewV5ODHVYW0gFT1EuI1wjSUalFI
X-Proofpoint-ORIG-GUID: x2DARNsv_yv-LP4Jh0o8RUl5dYp9tw3y
X-Authority-Analysis: v=2.4 cv=Fv4F/3rq c=1 sm=1 tr=0 ts=6842eb6d cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=wI1k2SEZAAAA:8 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=AbWnsF95IPDzd2HxxOMA:9 a=QEXdDO2ut3YA:10
 a=6HWbV-4b7c7AdzY24d_u:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 mlxlogscore=963 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060121

I3C Controller is subset of the I3C-basic specification to interface
peripherals through I3C and I2C. The controller RTL is FPGA
synthesizable and documentation is provided at
https://analogdevicesinc.github.io/hdl/library/i3c_controller

The main target for the I3C Controller IP is low-cost FPGAs.
In this version the driver supports IBI (only the MDB), I3C and I2C
transfers.

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
Changes in v2:
Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml:
- Move allof
- Rename clocks to axi, i3c

adi-i3c-master.c:
- Update license year
- Rework regmap to use FIELD_GET, FIELD_PREP
- Reformat regmap to have FIELDS after REG, prefixed by reg name.
- Add overflow safeguards to cmd, tx fifos
- Fix macro related macros (mostly errondeous `| ~BITMASK`
- Use guard macros, remove goto.
- Simplify daa logic
- Replace devm_clk_get with devm_clk_get_enabled
- Solve 64bit->32bit warnings on x86_64 systems by casting to u32
- Link to v1: https://lore.kernel.org/r/20250604-adi-i3c-master-v1-0-0488e80dafcb@analog.com

---
Jorge Marques (2):
      dt-bindings: i3c: Add adi-i3c-master
      i3c: master: Add driver for Analog Devices I3C Controller IP

 .../devicetree/bindings/i3c/adi,i3c-master.yaml    |   63 ++
 MAINTAINERS                                        |    6 +
 drivers/i3c/master/Kconfig                         |   11 +
 drivers/i3c/master/Makefile                        |    1 +
 drivers/i3c/master/adi-i3c-master.c                | 1037 ++++++++++++++++++++
 5 files changed, 1118 insertions(+)
---
base-commit: 00286d7d643d3c98e48d9cc3a9f471b37154f462
change-id: 20250604-adi-i3c-master-2a5148c58c47

Best regards,
-- 
Jorge Marques <jorge.marques@analog.com>

