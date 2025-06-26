Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBED1219315;
	Thu, 26 Jun 2025 10:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750932489; cv=none; b=JrgXFzysOvJINq8Nc2Qq8YkUZhG9i21aNdMfSrLwJhg2kW6jaAijD5ZAzz1u9jmTStFOdbgTRWqzj2YbYxjthzPbUqOO0pszGacGfPlhaTv65PCVYqzfS0h90KyG4BhvreM5CDEhxGJTyrnY4MnNIrfPJnEbNyPUjERam2m5nWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750932489; c=relaxed/simple;
	bh=KCVIqY/H6Cb3+9qGeATZvAcECB2AadW5bP6m//H60NI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=OCtCqgOYcuy420Ci0wCCXLjmrdrypM74BoZF3jocBnlBexVws2LJjL69xdKat58C1/mW2/IVHVRxRZiQrM0sNQA8D6yh7zVK+mIT7jdZkG261T912Y9055Yd9g6hwsV6zkme+8CweQEGsDXXnYXVVJgPtbX77H6B8PYBaRIrjkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=I5GTs5hD; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="I5GTs5hD"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q8geKM015146;
	Thu, 26 Jun 2025 06:07:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=FsB7C9gg/y1ZuOesLehJ9Kdgf1q
	iTPF5AHHNJL80PDQ=; b=I5GTs5hDz8t/7JJ1oQMu2U0P8ZNrKYy4uEyqCFB5qVr
	O9yhBDAububKRu2lEqlVB72mWGQRVNhaH4/D++gMBrVbRhV3oAnUyEQ1bJWzsK9H
	WUsiEU6N3ckpmDybLHQh74wt6ExgbYyjJunCyT741lLU20TRnEKej2/oGKe6czsD
	aL5TtBSnxyLrQHxv2wgVxVDsBFdOr7QCw/dAUZsSIpGBheRkKS6UP9MchfGxfNyw
	ivITP/j9NGRmbRKK/EbfnisnrwfPPCxrrVgKoC1kGBSLKzwvf9vsn/3B8ucRRXB6
	tS6JdefTJGy0hDi1Z038CqTOLHPAqHrNaefwefxNoGg==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 47h2xcgcne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 06:07:56 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 55QA7txb043550
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Jun 2025 06:07:55 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 26 Jun
 2025 06:07:55 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 26 Jun 2025 06:07:55 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.62])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 55QA7huv031419;
	Thu, 26 Jun 2025 06:07:45 -0400
From: Jorge Marques <jorge.marques@analog.com>
Subject: [PATCH v4 0/2] Add ADI I3C Controller
Date: Thu, 26 Jun 2025 12:07:35 +0200
Message-ID: <20250626-adi-i3c-master-v4-0-3846a1f66d5e@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOgbXWgC/3WQ3U7EIBBGX6XhWgx/pdAY43sYLwaY7pJsW4VaN
 Zt9dym9qdl4RT4y52Tmu5KMKWImfXMlCdeY4zyVoB4a4s8wnZDGUDIRTLRMM0UhRBqlpyPkBRM
 V0HJlfGu86kiB3hMO8bsKX99KPse8zOmn+le+/f6rWjlllClj0LAAg3cvMMFlPj36eSSbaxVHX
 t/xovCojbMAQWjJ7nh54Lm542XlNe8YaO9s+4e/7ccl/PgsJS37hWTEnKGW1DdPu1iIKv1K29C
 FJoRQnrqcgCFIhb7spg/y5604BxlpCWNc+qblVsvOSGc6DWJQVoJE8AzBogPRce+0YRbKWrdfs
 z6MPsMBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750932463; l=3728;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=KCVIqY/H6Cb3+9qGeATZvAcECB2AadW5bP6m//H60NI=;
 b=1eDjg0WpXtAeE2MoSeLX5hrrhrwidDK1tYey/DxjbyACxCvU/88wpnpNxjyiscLQSNgfnfiTs
 CW1uemvjk2bAMHr9nkHqPPs5YpYFRCLv1SWfTH19M2W3wAEuw+SgoJI
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 379QYbKZW9SL1SOFMkD6aHT6LBgLTEuX
X-Proofpoint-GUID: 379QYbKZW9SL1SOFMkD6aHT6LBgLTEuX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA4NCBTYWx0ZWRfXw83gK7AGFbmU
 CpJ1Q+pANwgrKwGTZ9LXzSpcHfdt/5XG4yLW9ZdcxT1fkd3FP72wvQplOSr6aHBhBQZwusVcP26
 1pP8+dVRL8BSPSpEN3PYCoyJDPbnfW5BTqUjoY7llpKyL4pMvmhyXjC2vyX2sRNalhIc2xyphHT
 JrdtTsHW9Ku8GASidp6er1g2GceUcBL9Ppe3lrKvq8W4b3yZIWejf5Ea10GvtHfxS4voGzXg+bD
 DSeVkWeC86X5x+dMLaR9OlGUB7AxLgGW6bvBl/Fb7TAprZu01o4EVjL1VkFuV8oUw6h8dP5kcgs
 mspLN6KK/nLehZjs7POfz8zLLrQmc18uPPNEBM/FQJ2ckWtFI4WrN98NpokyW9orJgK0adj2Uyv
 2H3lPV58Rt5TS6sAGblBxEcxLjt4Azi3qEs6gsB7iGVV/jBv0yR5GTzAiaDiUUOR1q9s17d/
X-Authority-Analysis: v=2.4 cv=OoRPyz/t c=1 sm=1 tr=0 ts=685d1bfc cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=wI1k2SEZAAAA:8 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=WdL4MNNltIHT4c5TAFEA:9 a=QEXdDO2ut3YA:10
 a=6HWbV-4b7c7AdzY24d_u:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260084

I3C Controller is subset of the I3C-basic specification to interface
peripherals through I3C and I2C. The controller RTL is FPGA
synthesizable and documentation is provided at
https://analogdevicesinc.github.io/hdl/library/i3c_controller

The main target for the I3C Controller IP is low-cost FPGAs.
In this version the driver supports IBI (only the MDB), I3C and I2C
transfers.

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
Changes in v4:
Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml:
- Add -1.00.a suffix where missing
- Extend clocks descriptions
- Add minItems to clock-names, to match clocks
- Use header in example
- 

adi-i3c-master.c:
- Regmap:
  - Add new controller info registers (dyn_addr, dcr, bcr, pid)
  - Always decreasing fields
  - Add line break between registers
  - Reformat REG_DEV_CHAR_BSCR_IBI to use easier to read FIELD_GET,
    FIELD_PREP
- Read controller info from regmap with explanation comment
- Use linux/fpga/adi-axi-common.h macros
- Use __counter_by macro on ncmds
- Use __free macro
- Use new i3c_writel_fifo and i3c_readl_fifo macros
- Rename bytes to buf when nbytes is present
- Use scoped_guard instead of spin_lock, spin_unlock
- Reformat loops to read fifo status, use while single line alternative
- Drop adi_i3c_master.max_devs, use MAX_DEVS directly
- Use devm_clk_bulk_get_all_enabled, dropping clock name match (CHECK_DTB does it)
- Init spin_lock
- Init list head
- Link to v3: https://lore.kernel.org/r/20250618-adi-i3c-master-v3-0-e66170a6cb95@analog.com

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

 .../bindings/i3c/adi,i3c-master-1.00.a.yaml        |   66 ++
 MAINTAINERS                                        |    6 +
 drivers/i3c/master/Kconfig                         |   11 +
 drivers/i3c/master/Makefile                        |    1 +
 drivers/i3c/master/adi-i3c-master.c                | 1017 ++++++++++++++++++++
 5 files changed, 1101 insertions(+)
---
base-commit: 51963783b876a2f493a3eac0ea9eba271cb6809a
change-id: 20250604-adi-i3c-master-2a5148c58c47
prerequisite-message-id: <20250622-i3c-writesl-readsl-v2-0-2afd34ec6306@analog.com>
prerequisite-patch-id: 5443f14ca82fc08593960fafdb43488cce56f7d9
prerequisite-patch-id: 647084f5fe09f4887f633b0b02b306912a156672
prerequisite-patch-id: 6f582bb2ef1aafb66f26c515a19d5efa06ab8968

Best regards,
-- 
Jorge Marques <jorge.marques@analog.com>

