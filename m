Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230BC153836;
	Wed,  9 Apr 2025 01:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744162645; cv=none; b=u08Lldzw/e2Zz973GFNwXW7aQylzr+nVH+CMTLHkwo37iJNprDWM90J8GAQXLMq56nrtbHNDxcadHy9CcaMQ4y2ecgf/KJlQydJCCsdZtYih/KA+IEfDdH/8hYA12RkXi5490oA4QOPlayOokzKOc/+h+O4tBNthpKSgdMVSyPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744162645; c=relaxed/simple;
	bh=EGrCBvrJNmPnCF1RaG08Czz3QlE7QtPNQUX9fCvZE6o=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=qxK0p4F5D0WwbJxDqUQqOu8X3crFNnTd52UWjRj1p3FcS7zYFOTAbrFTDWUJcGkErBxSUY7mEeT2T9fEGF5SAhgTAXqd+4cBlF1D/M9Tkm7J/aa0ePRTTGellB8v0WSzSrG7yEjkbe8C+13mcwxn01EUPLcqpEkoqG8q+KVZT9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=bhjIDPWZ; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="bhjIDPWZ"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538N7vEF009349;
	Tue, 8 Apr 2025 21:37:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=VRHV7ZWFnjIFC9ZCah3RNzMhAmq
	etP84FetN86BF3s4=; b=bhjIDPWZRZ7ItLyYrv0qc7cDzYPdg/P4lQJJzaznej4
	OWmtEaz0LPMZh5OB1dYjY9bTv/kg0uh5O7qYsfOPonKivACSl/Yy6vQVwk78USXP
	F9+bRs8k9LVKpXZudR/vxKwWlYB+K5pDSvf23TH5CTHwCwGob7rcg5dsLNHmZHsH
	yyMUx08yrOjED0d+zvANctf2vzQ1vSdDFPx5nxZ+FGLUjEjqh2TvwaRIqfroyfCH
	RwmXSpWXDrTm0KwY+BX5KmMo+Km6obykjn/FaG7LjthXeQQ6PXq1MRqZtQsVTITD
	xYxGXZgvq1S4ErFNq1HIQaCQ0SZ2hObeIN1kSQXdXbw==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 45vvjqwxag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 21:37:19 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 5391bIZK008394
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Apr 2025 21:37:18 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 8 Apr 2025
 21:37:17 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 8 Apr 2025 21:37:17 -0400
Received: from ATORRENO-L02.ad.analog.com (ATORRENO-L02.ad.analog.com [10.116.44.203])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 5391b5Dp030146;
	Tue, 8 Apr 2025 21:37:08 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: [PATCH v6 0/2] Add support for ADP5055 triple buck regulator.
Date: Wed, 9 Apr 2025 09:34:27 +0800
Message-ID: <20250409-upstream-adp5055-v6-0-faa6e810deb1@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKPO9WcC/33OwWrDMAwG4FcpPs/DkS3b6WnvUXZQY7k1rEmwu
 9BR8u5zemlHwk7iF/yfdBeFc+Ii9ru7yDylkoa+Bvu2E92Z+hPLFGoWoAAVAMrvsVwz00VSGFE
 h1nlkCxZi642otTFzTLcHefis+ZzKdcg/jwtTs2z/waZGKklILno2tvX2g3r6Gk7v3XARizbBU
 9CgNgRYBOogaKfQK1gJ+ikYpTcEXQXPx8apaGJreCWYV8FtCKYKtgnBg7ZtjOsf8FXwGwJWIXT
 oQ+vJkQ5/hHmefwFbS7aXuQEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744162625; l=3640;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=EGrCBvrJNmPnCF1RaG08Czz3QlE7QtPNQUX9fCvZE6o=;
 b=GiaySU/oIq0Y0FeXxc7QMI0rEN5qLPnq5qFRDoly8F5NBxlCPlwY2gUraQ/SgVrngMpSEnr6A
 vnOZPsxnP8JAyXYkGgiwtS0WGkBfpEIHL3XC+ElyGAv199C3RQr4EvV
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=Var3PEp9 c=1 sm=1 tr=0 ts=67f5cf4f cx=c_pps a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=i18f-GKKc1N0n-IE89QA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: XCTRcbCEYpiyQojKgyKCtlmf4AGUsA2f
X-Proofpoint-GUID: XCTRcbCEYpiyQojKgyKCtlmf4AGUsA2f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 phishscore=0
 mlxscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090002

Introduce a regulator driver support for ADP5055. The device combines 3
high performance buck regulators in a 43-termminal land grid array
package. The device enables direct connection to high input voltages up
to 18V with no preregulator. Channel 1 and 2 deliver a programmable
output current of 3.5A or 7.5A or provide a single output with up to 14A
in parallel operation. Channel 3 has a programmable output current of
1.5A or 3A.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
Changes in v6:
- adp5055-regulator.c
   - Edited a for loop causing build error
- Link to v5: https://lore.kernel.org/r/20250408-upstream-adp5055-v5-0-dc58d98a7a3d@analog.com

Changes in v5:
- adp5055-regulator.c
   - Removed custom adp5055_enable and adp5055_disable function
- Link to v4: https://lore.kernel.org/r/20250407-upstream-adp5055-v4-0-61dd82369ff2@analog.com

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

 .../bindings/regulator/adi,adp5055-regulator.yaml  | 157 ++++++++
 MAINTAINERS                                        |   7 +
 drivers/regulator/Kconfig                          |  11 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/adp5055-regulator.c              | 430 +++++++++++++++++++++
 5 files changed, 606 insertions(+)
---
base-commit: 7fef39f0e82ff02282797d9ae2589b39b16ab614
change-id: 20250225-upstream-adp5055-adbe6262f984

Best regards,
-- 
Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

