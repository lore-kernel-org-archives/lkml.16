Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E325680;
	Mon,  7 Apr 2025 04:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743998910; cv=none; b=kSctDkItiPac0orcRCP7Vi3oX2u1wudKLjNHa3w5uCKHu49DM64MkZLKHEtbztTfw1wP4QUomwnYhgQQ8K5RuXBNYyrc+iQRfLJvUfRfOpaNi8DrBvkz1k0Sr5SD6fn8WrZiFCT95eMfS4QUmwg4SbpEnpqXzYXkSGim1kA2ejg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743998910; c=relaxed/simple;
	bh=aamUROeH3Uwx1sFrRsU1NrG6C4lb/W+ctQtbRMeXdno=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=J6E2WDQ0tAqquRHPnuMDrfunimxfoKIDOXx38d8p2tZfDyX99zDSc8ArpQeoKaFJz1V8ys+Vhd6oujLWfixdrFn9P3rS7zWhzarbopJ0eio+Nvel2Wr6pcmpcwyKqR1wT0Eoh3YdKq6JZiChU3FLFMlhgeks7V4iG8Dq8sqmJYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=rD1yx3Y2; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="rD1yx3Y2"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5371ntD9020383;
	Mon, 7 Apr 2025 00:08:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=RE1nhoW+fGECsodZFONHc+jMLMk
	rbmRv8l927OCFXxQ=; b=rD1yx3Y2Ygn/9JAemjGEWQo6/6S1pW7pg+L03OEsh0e
	zfOwyw5aT5kmG0OYpKlZ3uqfcB22fZrC6dPkjEPZrrTI8hjlkaNfELF7aw83BJn5
	TblalZqphgfOHANf8Omi45p215DDFgHFd/xWQMPBycJyXLm85rFLM+IrwE8XOeae
	x16wXF2GDKUbQYIxVimTyifEvdAsvRYBZqEDmVjmmyR2LDo3rKV5b24cSMn6GRGQ
	WoRUHW0UtreGdrDdHzdEQzbJcvmE3XVDF6or1c6Cl89XbkPvp5L23/eVPAFo1G5A
	2OQ/dsEArzs2VohOOYqN+XItRV2r/cPPDqokF0litPg==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 45txc5qj1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 00:08:18 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 53748GCs044014
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 00:08:16 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 7 Apr 2025
 00:08:16 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 7 Apr 2025 00:08:16 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.117.223.24])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 537480ZH018549;
	Mon, 7 Apr 2025 00:08:03 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: [PATCH v4 0/2] Add support for ADP5055 triple buck regulator.
Date: Mon, 7 Apr 2025 12:07:49 +0800
Message-ID: <20250407-upstream-adp5055-v4-0-61dd82369ff2@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJVP82cC/33NwQ6CMAyA4VchOztTug2GJ9/DeJjQwRJhZEOiI
 by7w4sxGk/N36RfFxYpOIrskC0s0Oyi80MKuctY3ZmhJe6a1AwBFSAqfhvjFMj03DSjAqXSvFC
 BBdpKS5bOxkDW3V/k6Zy6c3Hy4fH6MOfb9g825xy4Uaa0mmRR6eJoBnP17b72Pdu0Gd+CQPgh4
 CaYGhtRgtKAX4J4CxLED0EkQdMlL8FKW0n6ENZ1fQKft1g0NQEAAA==
X-Change-ID: 20250225-upstream-adp5055-adbe6262f984
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Alexis
 Czezar Torreno <alexisczezar.torreno@analog.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743998880; l=3256;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=aamUROeH3Uwx1sFrRsU1NrG6C4lb/W+ctQtbRMeXdno=;
 b=Dxob8xFw8sbmuHtzXvydv/IOW/G4SpK3wKfxvzlVQdrYbd6dhzqDrusPrPU5akJttk15TfumK
 eart8SprnG9CcqMi+W3yVhMgHPLz5lw3rbZCN+91cnnp+f/32QD7GcR
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: mBChRaeEh6BgX6Ol8zuYB4hPUPaoGZ3g
X-Proofpoint-ORIG-GUID: mBChRaeEh6BgX6Ol8zuYB4hPUPaoGZ3g
X-Authority-Analysis: v=2.4 cv=KePSsRYD c=1 sm=1 tr=0 ts=67f34fb2 cx=c_pps a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=i18f-GKKc1N0n-IE89QA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_01,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1011 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070027

Introduce a regulator driver support for ADP5055. The device combines 3
high performance buck regulators in a 43-termminal land grid array
package. The device enables direct connection to high input voltages up
to 18V with no preregulator. Channel 1 and 2 deliver a programmable
output current of 3.5A or 7.5A or provide a single output with up to 14A
in parallel operation. Channel 3 has a programmable output current of
1.5A or 3A.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
Changes in v4:
- adp5055-regulator.c
   - Removed custom adp5055_is_enabled function and let core handle it
- adi,adp5055-regulator.yaml
   - Changed "" to '' for quotes consistency
   - Added a missing % in default value
- Link to v3: https://lore.kernel.org/r/20250403-upstream-adp5055-v3-0-8eb170f4f94e@analog.com

Changes in v3:
- Improved commit message,
- adp5055-regulator.c
    - Regulator node names are now lowercase 
    - Edited to support changes in bindings
- adi,adp5055-regulator.yaml
    - Improved property definitions
    - Improved text wrapping
    - Moved device 'adi,hw-en-array-gpios' to 'enable-gpios' per regulator
    - Changed 'channels' to regulators named buck[0-2]
    - Added missing ref to regulator schema
- Link to v2: https://lore.kernel.org/r/20250320-upstream-adp5055-v2-0-aac2d3705802@analog.com

Changes in v2:
- Kconfig - fixed indention problem, occured due to using spaces rather tabs
- adp5055-regulator.c
  - Turned initial comment block into c++ style, using // per line
  - Merged the similar read/write ranges variable called access_ranges_table
  - Set max_register value correctly to 0xE0 instead of 0xFF
  - Fixed issue where ndescs was an error code. replaced with -EINVAL
  - Enable/disable ops functions, now use helpers like regulator_enable_regmap
  - Added config.ena_gpiod for the regulator config  
  - Used of_parse_cb to do per regulator properties, new function added
  - Migrated some yaml properties to the core regulator function
-adi,adp5055-regulator.yaml
  - Moved property power_saving_mode to set/get mode under 'IDLE' mode
  - Moved property output-discharge-func to core func set_active_discharge
  - Moved property enable-delay-us to core function set_ramp_delay.
  - Removed property disable-delay-us, as suggested to not worry about
  - adjusted sample device tree to match changes due to use of of_parse_cb
- Link to v1: https://lore.kernel.org/r/20250225-upstream-adp5055-v1-0-a5a7f8e46986@analog.com

---
Alexis Czezar Torreno (2):
      regulator: dt-bindings: adi,adp5055-regulator: Add adp5055 support
      regulator: adp5055: Add driver for adp5055

 .../bindings/regulator/adi,adp5055-regulator.yaml  | 157 +++++++
 MAINTAINERS                                        |   7 +
 drivers/regulator/Kconfig                          |  11 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/adp5055-regulator.c              | 456 +++++++++++++++++++++
 5 files changed, 632 insertions(+)
---
base-commit: 7fef39f0e82ff02282797d9ae2589b39b16ab614
change-id: 20250225-upstream-adp5055-adbe6262f984

Best regards,
-- 
Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

