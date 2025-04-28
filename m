Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C4717BA6;
	Mon, 28 Apr 2025 09:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745830841; cv=none; b=S/Q5Y3gapi9WbmB0R7Gl7EHXFiFhDr7LhdZc59q7tVPws4hTuOjTdgZo6EskboCLIRZb+n2LPE4UzXROx8FNJ8aJcseescyvGioM9L0mubKXy2r0urG8B5hQP6+kS/Q1lKzJd6gBQ3KNhnAEvfrDQGuN0tkGvztGMVvXJs3ThpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745830841; c=relaxed/simple;
	bh=Zs203QeTDzagVcMqG9QnN8e4AgxzfnJBc0cf5D0lj0w=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=IBgPE/59PhK+el7E2DzBJfaTx2l+mOt1Vsd2i6DMPDAbl2L/0Hym3jkVRqPc8F4i4o2ciK3Q/Rih2ixvw0iNxunP/fMSxyjTqeAGin7sfJlapnaOHVd2eb9t+OY3BAJQQOccopv+TIJM8cLxjwCOMoMyxQi/IynoHwememHW6dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=dbASW07G; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="dbASW07G"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S110Bq021410;
	Mon, 28 Apr 2025 11:00:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=94GaAp5IT+0nfZI1KhpMoi
	6ddXqkPRsHTzLkhfBtKK0=; b=dbASW07GxQztoLy9FsEcZXQWu1OSefGLLrOKd8
	motbCQlyWiWT0HoYG3UEeGShSIZt94n+/KHTDwVABav8Kr8N72+VXl+IpyVodkag
	wtX0uBTggyZv/B1jll17sPTCo72vmUqjDIUQ19nhO9625TNu0hZyh9zjnTPfOQW5
	ZbfGSOldL20QUnKdE74CJSv8G1N1w9q/7gw7WRuvoZrC1RtNHZPBYC93jr/R+3Rs
	nUj46RdRuDRLF2PyVx1uJxg0INRVZB32fts7OC6/jFLDmBlqRdcRl8Q9a+/EJRhW
	8xi/tvOOKD0jHHqVpStzEHQZ4DmtqGceerBCJDqv2tzJqqYA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 468mm9dxde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 11:00:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8A6E84002D;
	Mon, 28 Apr 2025 10:59:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 78F1EA4130C;
	Mon, 28 Apr 2025 10:58:33 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 10:58:33 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH v11 0/3] Add STM32MP25 SPI NOR support
Date: Mon, 28 Apr 2025 10:58:29 +0200
Message-ID: <20250428-upstream_ospi_v6-v11-0-1548736fd9d2@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADVDD2gC/23Q3YrDIBAF4FcpXtcyo8afXvU9lqUYo60XrUFT2
 aXk3dcWls2SwNycA/MNzJMUn6Mv5Lh7kuxrLDHdW0Dc74i72vvF0zi0gjBgHXAG9DGWKXt7O6c
 yxnOVdBCcWY2KIXSkrY3Zh/j1Nj8+W77GMqX8/T5R5av9xXCNtQHKVd872wsuuDmFVMqhTAeXb
 uTFVfVHCNgiVCPAB6Y75H7QuCb0klAbhG6E6pVC6dBhkGvCLAjc+Eo1jXAB0XSgtdB2TSAsDMY
 2jAYDlUEYwSwIj/Afmef5B1L4OKLBAQAA
X-Change-ID: 20250320-upstream_ospi_v6-d432a8172105
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <christophe.kerello@foss.st.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01

This series adds SPI NOR support for STM32MP25 SoCs from STMicroelectronics.

On STM32MP25 SoCs family, an Octo Memory Manager block manages the muxing,
the memory area split, the chip select override and the time constraint
between its 2 Octo SPI children.

Due to these depedencies, this series adds support for:
  - Octo Memory Manager driver.
  - Octo SPI driver.
  - yaml schema for Octo Memory Manager and Octo SPI drivers.

The device tree files adds Octo Memory Manager and its 2 associated Octo
SPI chidren in stm32mp251.dtsi and adds SPI NOR support in stm32mp257f-ev1
board.
    
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Changes in v11:
  - Add stm32_omm_toggle_child_clock(dev, false) in stm32_omm_disable_child() in case of error.
  - Check MUXEN bit in stm32_omm_probe() to check if child clock must be disabled.
  - Add dev_err_probe() in stm32_omm_probe().
  - Link to v10: https://lore.kernel.org/r/20250422-upstream_ospi_v6-v10-0-6f4942a04e10@foss.st.com

Changes in v10:
  - Add of_node_put() in stm32_omm_set_amcr().
  - Link to v9: https://lore.kernel.org/r/20250410-upstream_ospi_v6-v9-0-cf119508848a@foss.st.com

Changes in v9:
  - split patchset by susbsystem, current one include only OMM related
    patches.
  - Update SPDX Identifiers to "GPL-2.0-only".
  - Add of_node_put)() instm32_omm_set_amcr().
  - Rework error path in stm32_omm_toggle_child_clock().
  - Make usage of reset_control_acquire/release() in stm32_omm_disable_child()
    and move reset_control_get in probe().
  - Rename error label in stm32_omm_configure().
  - Remove child compatible check in stm32_omm_probe().
  - Make usage of devm_of_platform_populate().
  - Link to v8: https://lore.kernel.org/r/20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com

Changes in v8:
  - update OMM's dt-bindings:
    - Remove minItems for clocks and resets properties.
    - Fix st,syscfg-amcr items declaration.
    - move power-domains property before vendor specific properties.
  - Update compatible check wrongly introduced during internal tests in
    stm32_omm.c.
  - Move ommanager's node outside bus@42080000's node in stm32mp251.dtsi.
  - Link to v7: https://lore.kernel.org/r/20250401-upstream_ospi_v6-v7-0-0ef28513ed81@foss.st.com

Changes in v7:
  - update OMM's dt-bindings by updating :
    - clock-names and reset-names properties.
    - spi unit-address node.
    - example.
  - update stm32mp251.dtsi to match with OMM's bindings update.
  - update stm32mp257f-ev1.dts to match with OMM's bindings update.
  - Link to v6: https://lore.kernel.org/r/20250321-upstream_ospi_v6-v6-0-37bbcab43439@foss.st.com

Changes in v6:
  - Update MAINTAINERS file.
  - Remove previous patch 1/8 and 2/8, merged by Mark Brown in spi git tree.
  - Fix Signed-off-by order for patch 3.
  - OMM driver:
    - Add dev_err_probe() in error path.
    - Rename stm32_omm_enable_child_clock() to stm32_omm_toggle_child_clock().
    - Reorder initialised/non-initialized variable in stm32_omm_configure()
          and stm32_omm_probe().
    - Move pm_runtime_disable() calls from stm32_omm_configure() to
      stm32_omm_probe().
    - Update children's clocks and reset management.
    - Use of_platform_populate() to probe children.
    - Add missing pm_runtime_disable().
    - Remove useless stm32_omm_check_access's first parameter.
  - Update OMM's dt-bindings by adding OSPI's clocks and resets.
  - Update stm32mp251.dtsi by adding OSPI's clock and reset in OMM's node.

Changes in v5:
  - Add Reviewed-by Krzysztof Kozlowski for patch 1 and 3.

Changes in v4:
  - Add default value requested by Krzysztof for st,omm-req2ack-ns,
    st,omm-cssel-ovr and st,omm-mux properties in st,stm32mp25-omm.yaml
  - Remove constraint in free form test for st,omm-mux property.
  - Fix drivers/memory/Kconfig by replacing TEST_COMPILE_ by COMPILE_TEST.
  - Fix SPDX-License-Identifier for stm32-omm.c.
  - Fix Kernel test robot by fixing dev_err() format in stm32-omm.c.
  - Add missing pm_runtime_disable() in the error handling path in
    stm32-omm.c.
  - Replace an int by an unsigned int in stm32-omm.c
  - Remove uneeded "," after terminator in stm32-omm.c.
  - Update cover letter description to explain dependecies between
Octo Memory Manager and its 2 Octo SPI children.

Changes in v3:
  - Squash defconfig patches 8 and 9.
  - Update STM32 Octo Memory Manager controller bindings.
  - Rename st,stm32-omm.yaml to st,stm32mp25-omm.yaml.
  - Update STM32 OSPI controller bindings.
  - Reorder DT properties in .dtsi and .dts files.
  - Replace devm_reset_control_get_optional() by
    devm_reset_control_get_optional_exclusive() in stm32_omm.c.
  - Reintroduce region-memory-names management in stm32_omm.c.
  - Rename stm32_ospi_tx_poll() and stm32_ospi_tx() to respectively to
    stm32_ospi_poll() and stm32_ospi_xfer() in spi-stm32-ospi.c.
  - Set SPI_CONTROLLER_HALF_DUPLEX in controller flags in spi-stm32-ospi.c.

Changes in v2:
  - Move STM32 Octo Memory Manager controller driver and bindings from
    misc to memory-controllers.
  - Update STM32 OSPI controller bindings.
  - Update STM32 Octo Memory Manager controller bindings.
  - Update STM32 Octo Memory Manager driver to match bindings update.
  - Update DT to match bindings update.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Patrice Chotard (3):
      dt-bindings: memory-controllers: Add STM32 Octo Memory Manager controller
      memory: Add STM32 Octo Memory Manager driver
      MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver

 .../memory-controllers/st,stm32mp25-omm.yaml       | 226 ++++++++++
 MAINTAINERS                                        |   6 +
 drivers/memory/Kconfig                             |  17 +
 drivers/memory/Makefile                            |   1 +
 drivers/memory/stm32_omm.c                         | 476 +++++++++++++++++++++
 5 files changed, 726 insertions(+)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250320-upstream_ospi_v6-d432a8172105

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

