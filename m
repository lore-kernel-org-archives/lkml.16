Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00528BF8;
	Mon, 10 Feb 2025 02:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739154714; cv=none; b=VCkcNPGnTB5XZP1OoKppWbYH4dTKlYmKhpdK4D90vOVN/Mgv+WgxZCHSaUewX+MpqbfopnV671aAdKbHikJhNm6uCt6KhhvzOqxRLWH6INxrNsU6Wd2szkX0oAcOEdYhVMXb+0Kg06XCHz3/z966v0xE4NfRoUvOXvl0Ez+sgnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739154714; c=relaxed/simple;
	bh=RfRn4yHmCdbcdAgn6neEc/fQvCypRVUpj5NmmDkJX5I=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=rJeLgb4EUMY7zp3OjC9IUqprVCDG0OQRQqEL9+TQ4NeMt8UrK93dAL1T6hkQCry0ra9O3yamtLGLlxdTkINzznLFo2QqXWP+c1luQeFdilQ7oJZfL2h+sqekGPB1XqOBfZlHNtuByn4363pbHCDhwYvxm5Cc0wN9uJmZgffs7Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=fkww/Sw8; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="fkww/Sw8"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A0oBp6029814;
	Sun, 9 Feb 2025 21:31:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=/7Vn7xWpWjfQWUIPUetHg1C2aR9
	U+nRPyjxJbbOvdjA=; b=fkww/Sw8qyEg3LF0csN7VmMXS4sy2XiL2nEjSezqQWE
	aG/W67mlQWE/PpUuD4579IzjUgl+UvEiEodVyNhwTNeOJTBZuevsOwBG7eqQmpN2
	PzD6jFejWVfqT0pnWD/nrtVVpPVVw0253zaV3CIOvKCmyPVKouwyS/pSzl5yxHUi
	DgXp40JPY0iZg8LIhH+gllqHAnUEgQJvg34Kjbmoa6q5J5Gp+w4DKp3lxXw7Yr9b
	RwkDfvQRZjSpeMnW/Usu1Dbm6OMYwbccavQNkLC1sKGAmEN/rYfMHDPAzkhp7YVa
	d5ZiRzz1MZvf485nv1yvlQAZkNioMZy8WdIoZ/FEEFQ==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 44ppfnarq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Feb 2025 21:31:37 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 51A2VaLQ018798
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 9 Feb 2025 21:31:36 -0500
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Sun, 9 Feb 2025 21:31:36 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Sun, 9 Feb 2025 21:31:36 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Sun, 9 Feb 2025 21:31:35 -0500
Received: from CCAPUA-L02.ad.analog.com (CCAPUA-L02.ad.analog.com [10.117.222.251])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 51A2VLiq017158;
	Sun, 9 Feb 2025 21:31:24 -0500
From: "Celine Joy A. Capua" <celinejoy.capua@analog.com>
Subject: [PATCH 0/2] Add support for the LTC7871 voltage regulator.
Date: Mon, 10 Feb 2025 10:30:51 +0800
Message-ID: <20250210-staging-ltc7871-v1-0-c593ad86aab2@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANtkqWcC/x3MTQqAIBBA4avErBNU8IeuEi3URhsIC40IpLsnL
 b/Few0qFsIK09Cg4E2VjtwhxgHC5nJCRms3SC4Vl4KzerlEObH9CsYawbiyzuuI1msFvToLRnr
 +47y87wfefi3iYQAAAA==
X-Change-ID: 20250210-staging-ltc7871-058ab6fe8b65
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Celine Joy
 A. Capua" <celinejoy.capua@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739154682; l=1022;
 i=celinejoy.capua@analog.com; s=20250210; h=from:subject:message-id;
 bh=RfRn4yHmCdbcdAgn6neEc/fQvCypRVUpj5NmmDkJX5I=;
 b=yY9YBcnJb4D6js1VvbbTKLqh9wl1MK22mjlIQ7etUvPTwloxtso8sJqfKFq36kUWb1Z5rAqel
 5yCU/rrby8hAfA2UQ0Rm5UV8Em7LKbh7qRALMK40vWC4IscouOcAQl1
X-Developer-Key: i=celinejoy.capua@analog.com; a=ed25519;
 pk=7kw4U3NQswQj33plajHOwzScUl5kbavfQVO78tcggn8=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: fE5dlYQQi82FSoqoqQC7nGFnzdfP5kNt
X-Authority-Analysis: v=2.4 cv=FcLNxI+6 c=1 sm=1 tr=0 ts=67a96509 cx=c_pps a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=gAnH3GRIAAAA:8 a=ln-BLy-ZXhMbQj3i0Y8A:9 a=QEXdDO2ut3YA:10
 a=oVHKYsEdi7-vN-J5QA_j:22
X-Proofpoint-ORIG-GUID: fE5dlYQQi82FSoqoqQC7nGFnzdfP5kNt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_01,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxlogscore=728
 clxscore=1011 priorityscore=1501 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502100019

The LTC7871 is a high performance bidirectional buck or
boost switching regulator controller that operates in
either buck or boost mode on demand. It regulates in buck
mode from VHIGH-to-VLOW and boost mode from VLOW-to-VHIGH
depending on a control signal, making it ideal for 48V/12V
automotive dual battery systems

Signed-off-by: Celine Joy A. Capua <celinejoy.capua@analog.com>
---
Celine Joy A. Capua (2):
      regulator: ltc7871: Add driver for LTC7871
      dt-bindings: regulator: Document the ltc7871 regulator

 .../bindings/regulator/adi,ltc7871-regulator.yaml  |  98 +++++
 drivers/regulator/Kconfig                          |  11 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/ltc7871-regulator.c              | 405 +++++++++++++++++++++
 4 files changed, 515 insertions(+)
---
base-commit: fff64b15e3d1e9bd9246db1f5e0b84e7e561b79f
change-id: 20250210-staging-ltc7871-058ab6fe8b65

Best regards,
-- 
Celine Joy A. Capua <celinejoy.capua@analog.com>

