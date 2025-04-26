Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B0C17E4
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 08:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745656349; cv=fail; b=RlkgIGyOO/SUUJmKGR0s5QN0D8hYgsSqLeYvHZSb2iAzKdM5alonF14Z7gO15YfyVQTXY70FTmwurPebH6vSLZ+g5UxSXBtaQltimIXPH9lcfY4APv8hXvnTR/gJq6tW9ab2zote+d6iVmx/kvXHVgrj5wH+MbN/q2rajrriiWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745656349; c=relaxed/simple;
	bh=oiru0oQzWf1nnI/zPLyH2YVVHuuzUEJk++2sQ6Yybig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QhrbpcOmNGyH6NDMf+VbMqQpQTEzmABbQzWd6I2ouzZrIdQdBclmyB/rDCkbsDuHzSc455WQhLi6TsUksaFd1dkQF5PLq5GobXwXZJqk9VAQeU/w0uEyuvXDETsvmBgfbWa5qBpOADEOvQM9NYzlBxUjbZDj7wvsLbCx9VYw6Pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=hTEk60NR; arc=fail smtp.client-ip=40.107.92.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="hTEk60NR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6d/6lC1M4NbepO/BRqeLMe7jU5f+l5lQrxQ8iyHWPwY3Vpr2jrT8j5GLKjGhNdfT69lz6uVjmJWtAZ2Q9NYDm02eZ6xPGI5TVMCXlXCiIdYgatIWEve2JP4xHPhsJnZAcVnBxDRO5AAigY2WLKsVXXdAqota7n1MKUHtO5YRaRgS8AHizS9V1zb9CzeFyl4swHlN4TpQKmotEcdObDAXJUwP3Tux/2RijW+2sM3e4cTiUH1gbad3B9PlsGWuIeDlett1Aph5eFSZG+o2xrOZ7gAMWIZPFq3WTULMTutcRnmcS/wAlFdWtCidKgisXlU7esSFajBhPwSgMmIqps4Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJe53mNxfAe4Ki3rGi+qWczVxMVev+ZZVnPZocPwXXc=;
 b=HMbGK3ggJaG0A7dCk9in5cn5UHGAYv8r5usi/eb4Ns67Y5tsk6WETHIFBctlqWH5s4DDX0aueBivltJ5TD0OoBZlKwQQ9uXQ/blhg7Z2SbYIMeqpFTvk47JFOnQB9tn02Onp2QDJwG1PaDIyI7t5bS7IbrLXGvrjxiJKGUVqN/QMqgMDLhT6e9nAwpHbcxIeODTsG/BhnOagr1NwPkHEe0NvPIszxy0Wc9XREu6t0S5999EBSm0vEZMMp6yWE3sPzIwSr1HKqJYJcukZlhzDHiJZaxEnngBYhPFl7nAy62Gm3GsDMaFkWFqHAold4owoJaQu6ORFwnkMCCqsgqVg3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJe53mNxfAe4Ki3rGi+qWczVxMVev+ZZVnPZocPwXXc=;
 b=hTEk60NR4FSYQz9HN6+ovYVzZbssoZKk0XPBnCJwsaTYYRiabSxeGBIbkNb4ec0acQ363VhRRVGdzpseTa1ic14m8HWMhMlbQs6zPMQxnSeVkhXQOvuIRFJaGS8Kud5XsNUZkbGDKjsZpM5iCFnylPYC61pGHgw/I++RDo//TWiFsU0nijMbLaaPB+3cpgKO5d1tk7AI74Ag2HuXtpZVgdDnNYeDtsSe7Uwzah6BR1ybZ3bzt67c6GdxsNFYuupYN6D0LVHPJQ/zRpQhz6TPeRLzf/yZdrsbeXsHDgumOLvn97vxozCRPBPH5nRxKNkr13KI1XBc1praDUzizkOSmQ==
Received: from BN0PR04CA0063.namprd04.prod.outlook.com (2603:10b6:408:ea::8)
 by SA1PR22MB3904.namprd22.prod.outlook.com (2603:10b6:806:325::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Sat, 26 Apr
 2025 08:32:24 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:408:ea:cafe::90) by BN0PR04CA0063.outlook.office365.com
 (2603:10b6:408:ea::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Sat,
 26 Apr 2025 08:32:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Sat, 26 Apr 2025 08:32:24 +0000
Received: from 56525d0f2b9b.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 50402CFB78;
	Sat, 26 Apr 2025 11:32:22 +0300 (EEST)
From: Ian Ray <ian.ray@gehealthcare.com>
To: linux-kernel@vger.kernel.org
Cc: ian.ray@gehealthcare.com,
	nandor.han@gehealthcare.com
Subject: [PATCH v2] MAINTAINERS: .mailmap: Update after GEHC spin-off
Date: Sat, 26 Apr 2025 11:32:20 +0300
Message-ID: <20250426083220.110-1-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|SA1PR22MB3904:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 49a494a0-a989-4f13-9ee6-08dd849cdeb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IhZLNlI5+CYiYmwKpodVA7IV62loUoDuAsEO2KJAzZbzXko1hA4ytOHPOVq2?=
 =?us-ascii?Q?WbolGTkaSae+u2vLZ1ts/LB7ufq1YDmGW7m3FZmL/U42sIBXCRNnVq4pnfAA?=
 =?us-ascii?Q?NQgWj9tAC4CcqOYNJhW4qkUxEBphAXfLCaTipd5V6XdKEaxVEC942uoDXM/Q?=
 =?us-ascii?Q?lKGdDiwapsWdZSRpOpJZIdrZWW8gZzcdGWJ6J+DwMzfwWB/PREPFYH1ErOir?=
 =?us-ascii?Q?Twzg4qMKxFRytiJtRT44RrXF2bhPwARtGrqM4p0OM34yWbKpDCQm06kVoe2+?=
 =?us-ascii?Q?3O/YOYZcppcdYfZkgR3ghvzQGvGiGQhCV58sfLqJZeCMF0roVHYTeIA2/MuZ?=
 =?us-ascii?Q?skYe5VUSF1ftUJSWrs0eM/Np8ie+UEy4Di2WHJlqDgEOtzp7B/RBgxG5buxU?=
 =?us-ascii?Q?O6aN3HXu6MPxcvd/qxRoKEBxmY6bBbWmDeSQEu4pt/ZTja+XuRpMMfPmUv4U?=
 =?us-ascii?Q?cSMTR8vR1W8csoPf7kgjOrM3SV6L15six4MMczZtOjsCS81/81F8P7y8XgqV?=
 =?us-ascii?Q?yunh5YNJXNDo5iOgr7ZJTOJUGPd3yuHFieGHf3XR2S2nQweHhX4btkHmHhGg?=
 =?us-ascii?Q?9dov9y0JRfXk9tWlzwB7E/QmjdWIbmpUuV09D/MIMGOvM0LR3oiweKrPbRy0?=
 =?us-ascii?Q?XSkVQGWGNGo6KcrQIBA/W/mH51ZpcGAnYMwrY+VTZ6VMoaw3SKFflJDD1jyq?=
 =?us-ascii?Q?dkDJdOValLu0oZwUVL+NGIsuhN8Oto840DWwnb77zf13URpsHN0e9P+5IOcD?=
 =?us-ascii?Q?duUS/ve+fg0tTkGhdmOkZs+8HY5e44zhvysYcsEvM3jMWtjg+Se4Lq6z3RRS?=
 =?us-ascii?Q?g8ln1rlCkJAjwPsObFtwRHAnA6CG16fsgji6LLqut5KamV2IpW6N7igEI/fc?=
 =?us-ascii?Q?atFzPKD5F5KZ+wvf3Vt5WbhGzXx5Z4050bdKzInPQOBCdN2Y9nzOsIuSKRoT?=
 =?us-ascii?Q?s1QlROWB3XrlBh81cJ2gNijBa9aZARCSzOTpw/uZfHYmH7CHj+uCc2fYmNA3?=
 =?us-ascii?Q?DKD0sZaR7r9Y/5ZA9TcczSc9okEIHdpaGu0Glw+aJLdR2/a2DBE7NMPpdVlM?=
 =?us-ascii?Q?wGfU2+E+xLlTaQKmn2/d7eYMU0gGU8HYyW7NRUINTeRK1IJVnmT8Ili026zI?=
 =?us-ascii?Q?LwJQO0bp6s76ASEr3RCHU19SKJlBvDtTbQ4IpgF/pcW9c7eePa+JmSxOydHE?=
 =?us-ascii?Q?CyDSTjMGgL3X41CLS7noGdsu1u/2taZ59tLRZ7u9UbzHzCr1ZaB3ZPO+v1d8?=
 =?us-ascii?Q?SWlFkft5+qoZqNvj9HNnulf6Wl4xAYmxn8Ad4nrWkw9SxE+Lwn0LEw2GqiPn?=
 =?us-ascii?Q?QmNLMBJ+TcJqXVJOocuRympq2Rbx0fpDHzvxhjoe2Ld82Mu5C4X7rAw4hllv?=
 =?us-ascii?Q?WM6b9hbuhf4f3ikiSrZcP1uE0K9FfAL40N7di0ttaRj6q3fWZIYjZXL1jhhi?=
 =?us-ascii?Q?Ev6C9Yx2EYxhIlJKZSXnxgC8Qzd4idS2EY0pAZcwgJrfQ5ZPOM+4Hg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2025 08:32:24.0590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a494a0-a989-4f13-9ee6-08dd849cdeb4
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR22MB3904

Update our email addresses, from @ge.com to @gehealthcare.com, after GE
HealthCare was spun-off from GE.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
Changes since v1:
 * Include mailmap.
---
 .mailmap    | 2 ++
 MAINTAINERS | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/.mailmap b/.mailmap
index 9afde79e1936..f8baaa6f49d7 100644
--- a/.mailmap
+++ b/.mailmap
@@ -289,6 +289,7 @@ Henrik Rydberg <rydberg@bitmath.org>
 Herbert Xu <herbert@gondor.apana.org.au>
 Huacai Chen <chenhuacai@kernel.org> <chenhc@lemote.com>
 Huacai Chen <chenhuacai@kernel.org> <chenhuacai@loongson.cn>
+Ian Ray <ian.ray@gehealthcare.com> <ian.ray@ge.com>
 Ike Panhc <ikepanhc@gmail.com> <ike.pan@canonical.com>
 J. Bruce Fields <bfields@fieldses.org> <bfields@redhat.com>
 J. Bruce Fields <bfields@fieldses.org> <bfields@citi.umich.edu>
@@ -531,6 +532,7 @@ Mythri P K <mythripk@ti.com>
 Nadav Amit <nadav.amit@gmail.com> <namit@vmware.com>
 Nadav Amit <nadav.amit@gmail.com> <namit@cs.technion.ac.il>
 Nadia Yvette Chambers <nyc@holomorphy.com> William Lee Irwin III <wli@holomorphy.com>
+Nandor Han <nandor.han@gehealthcare.com> <nandor.han@ge.com>
 Naoya Horiguchi <nao.horiguchi@gmail.com> <n-horiguchi@ah.jp.nec.com>
 Naoya Horiguchi <nao.horiguchi@gmail.com> <naoya.horiguchi@nec.com>
 Natalie Vock <natalie.vock@gmx.de> <friedrich.vock@gmx.de>
diff --git a/MAINTAINERS b/MAINTAINERS
index f31aeb6b452e..0767f0177536 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15237,7 +15237,7 @@ F:	drivers/usb/mtu3/
 
 MEGACHIPS STDPXXXX-GE-B850V3-FW LVDS/DP++ BRIDGES
 M:	Peter Senna Tschudin <peter.senna@gmail.com>
-M:	Ian Ray <ian.ray@ge.com>
+M:	Ian Ray <ian.ray@gehealthcare.com>
 M:	Martyn Welch <martyn.welch@collabora.co.uk>
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
@@ -26644,7 +26644,7 @@ W:	http://www.marvell.com
 F:	drivers/i2c/busses/i2c-xlp9xx.c
 
 XRA1403 GPIO EXPANDER
-M:	Nandor Han <nandor.han@ge.com>
+M:	Nandor Han <nandor.han@gehealthcare.com>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/gpio/gpio-xra1403.txt
-- 
2.39.5

