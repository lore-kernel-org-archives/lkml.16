Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0089E2581;
	Thu,  3 Apr 2025 02:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743648411; cv=none; b=ht1lfkWhAzQUmkle7GeZKY+sSX4/r9coCB43axXOc2iH5yOiJ3oVC6OFFk6gSyMNf9WHDwE0gUIpOx4KC+jIjJlCaVxZ11EMThzilau98zNHpzGjmKrUtiEvT+/t+NLMAWvdOzXJAcQLuBhFm5KC+oIxGBAEmIgFAVRH0zgNz5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743648411; c=relaxed/simple;
	bh=j+/1UYNsq4n+kGzrKaYEN/yc62ghFdAAUEo8wG7406s=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=U7QDzUCvO4Gq53JgSxYav7iv74yjNCTJ7Tv246OKAb5uV5VA1xmaouElhaX0rCh4F4T69XgdSlI1ec7OTxvRzzr6Ce2JLZ8Pt5S/7Y8OJOdERv2R0WbmcF5ABl175TcvsujZH453Ba1I5t8zoinrJYKXdkcpJmjPBytdDe+vLSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=1h0uL+DU; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="1h0uL+DU"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5332TC4B023121;
	Wed, 2 Apr 2025 22:46:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=jyywwe6Uo26eBN5L68rt8SUtDga
	jQ+AF7rg1Z4V+2+c=; b=1h0uL+DU5EK46XWmPTYxZ3me2vvvqjtK+GX8Lj8PKPe
	HANn+KvNnq5+83PMpzs1ESwGqR9XcqhA1Tane+WE9D7LS6JFr7KQj5k2t8g+cKi/
	5UvqKgnO07jsPU2D6/P/jUfJD1n9Ss6wCzaFjVJaALWFAqL1brVcw5UIPHSP8m1Y
	Rl90H7wP78SO2nAJ/ae5OMPeKkdU8NRlc4SmlhsAtjy6W7il55HPRjZs2OYM/ONr
	vEcnrwjsWoIrn1i9l4xk3G+ZO0n3tnSot8sXJT5TpX65FnhZGlepUviK8YjTKb8+
	KRytnuf8GuZbiNN7NsqIZWaw9ekz11n/DeJDuSQgyMw==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 45shkd0222-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 22:46:39 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 5332kcqB035560
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Apr 2025 22:46:38 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Wed, 2 Apr 2025 22:46:38 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Wed, 2 Apr 2025 22:46:38 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 2 Apr 2025 22:46:38 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.117.223.13])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 5332kQpf031488;
	Wed, 2 Apr 2025 22:46:29 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: [PATCH v3 0/2] Add support for ADP5055 triple buck regulator.
Date: Thu, 3 Apr 2025 10:43:09 +0800
Message-ID: <20250403-upstream-adp5055-v3-0-8eb170f4f94e@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL317WcC/33NwQ6CMAyA4VchOzszChvDk+9hPFQosETYsuGiI
 by7g4sxMZ6av0m/LiyQNxTYKVuYp2iCsVOK4pCxZsCpJ27a1AwESAEg+cOF2ROOHFsnhZRp3ki
 Bgq7WJUtnzlNnnjt5uaYeTJitf+0fYr5t/2Ax54KjxKrTVKpaqzNOeLf9sbEj27QIH6EA8UOAT
 cAG2qISUgv4EtZ1fQMf235o8wAAAA==
X-Change-ID: 20250225-upstream-adp5055-adbe6262f984
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Alexis
 Czezar Torreno" <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743648386; l=2930;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=j+/1UYNsq4n+kGzrKaYEN/yc62ghFdAAUEo8wG7406s=;
 b=fa6o4VeqXZdcVO7gsgjdAQIPhOPK6F2gA2USsyzcrxqkuOwBCrxkyKx1tlSRDSFixXzQwEoe3
 YNgb70iKiK1Ctcx2bMyGc3thcAjZHhI3qOHseySUa6TQc+dJNcjGWT7
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=N8cpF39B c=1 sm=1 tr=0 ts=67edf68f cx=c_pps a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=Kpdrl5fn47ZIlBTKqEQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: JdF_HRLn-ZsE2z5yk7PdKXtpioACHYtE
X-Proofpoint-ORIG-GUID: JdF_HRLn-ZsE2z5yk7PdKXtpioACHYtE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_01,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 adultscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030012

Introduce a regulator driver support for ADP5055. The device combines 3
high performance buck regulators in a 43-termminal land grid array
package. The device enables direct connection to high input voltages up
to 18V with no preregulator. Channel 1 and 2 deliver a programmable
output current of 3.5A or 7.5A or provide a single output with up to 14A
in parallel operation. Channel 3 has a programmable output current of
1.5A or 3A.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
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
 drivers/regulator/adp5055-regulator.c              | 470 +++++++++++++++++++++
 5 files changed, 646 insertions(+)
---
base-commit: 7fef39f0e82ff02282797d9ae2589b39b16ab614
change-id: 20250225-upstream-adp5055-adbe6262f984

Best regards,
-- 
Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

