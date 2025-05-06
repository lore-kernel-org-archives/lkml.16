Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2134.outbound.protection.outlook.com [40.107.21.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CED280012;
	Tue,  6 May 2025 13:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538590; cv=fail; b=kDwxh36XihvoEXleRkqcRsNDPHkb89d5Jf8JW+3ltmHcO/29Gsx405xV0kZKy2YDTPsVNu0Qk+D0Y3Hg0hAE3q6pUjypPOL5ga9/q+bHhUeq+RwRMWNtYScC0yX25p4vadXq7TA04E3py7j2fbdT5gUpXf7axdNR78Mwg5Bf/5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538590; c=relaxed/simple;
	bh=XNy8yheaU4riy2PR+YWVVSkwABXKTFiW6K2jjgB9n0Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jAqwe2dOwP400HLbSl4dkufCAkgi7NM3sGkmOKWwutONVEKivhMan+zpTlS8n+Dfg+JImf/bMIy44yhYxDPzv5fXx37vWw3DsNJYxtnhyiPBpeKIOWG9JAWiXa0fauyO4QJ0Tb0+DylWrl4vzQK0MvawnfCdWSrnhdTR98RufkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=iulyWgB2; arc=fail smtp.client-ip=40.107.21.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="iulyWgB2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2+gUHT0Q7FXHuP7t6cBZIyVEZtOEy2rdzBfxPom3uQK/v2g101WZwtPnsXBjustlRfOM1BvPAWXpKiGaxUYLAcWQKQVIfsZzPH5KLwFN/3xba8l/HnhlwZcO2V4O/Ok4WWJ6vdYy1Tw5nVT0UoE19zwzhMfDJ5ReJFJGccd8yE5KCY7JJ3L5r08byFnmPpYREeUEmxpvH9Yh/Ah1aXqNrgs8LY6QEKVZsXXMSNnIhJi2T3rCGKxOMt1zA6ZwoJ4RrkzpwAuOdbynE4mmD6SBP73Yp8AMIflL90t1PDrK5ZyzeLP+jwmY3TI9VRyRBiKsJKwdHQ0/JRpEq/bVzHXiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNhlkNvADN2HaEqY4ACIZv/HkcW2vqwTbUYnIEYZOSg=;
 b=O/hX8ydlOmp6hZgUFQwC0zU7cg3U+h/vqmZYLODRFqcnBLFW0hCN2Fq700ZWyoCdEfohfffbwVeixaM6ZiUx6u8m+tulCqPmMb/JqfC0MjxGy5PDlVWyqIRmPjXMarxhOpN/Ar5+I4XiWI+s2W86252tfqax/qqCASrvHmNxiG1yYYgtcIl/MfcdVyUwx5CSNiCoMTXDBmaPOzT1cZ++O2BLjOrNB5+iuGcw37yadKgj0+rZvXlweBl24EGo2ovgZSKVxL9Hrct5OXQzgh+0IdJz7gpK173uyJMMmDehiLCFEUFtv2LQ2gGkV9E6F4J9kaH876lGH7t4ueDYC2vqZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNhlkNvADN2HaEqY4ACIZv/HkcW2vqwTbUYnIEYZOSg=;
 b=iulyWgB2STLiYEscFZOS+xLeCEii5Kk/cLedtuWWFRZyl9zVyL0SMv+AhaZi7/8dq5SEI6U6KP9J165IlwHzmC5HeABewrx2sIID+PXFD7LQzHIm5qWTOYMvx/UbB0DLt77qEsbqZCszdgi7C9GY85CqATqHDDv3auSL34JNajFSa2+TepDWN8X6qKHcJP31KT1VyuNJM19xX4j8fW1epdcFMP5EMFnotSYwb9vaOSv9vBqntj8s4+/vGiNfYfm1csJe5YtKNZamcPNJP9zGF0mxHVIvGslrcrE9Sbxkqw3NIOOu4Shbg/f/8lODCOm0ZeIJl6/gq5W0ASeDvMtx2A==
Received: from AM0P190CA0001.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::11)
 by DB9P195MB1354.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:295::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 13:36:24 +0000
Received: from AMS1EPF0000003F.eurprd04.prod.outlook.com
 (2603:10a6:208:190:cafe::55) by AM0P190CA0001.outlook.office365.com
 (2603:10a6:208:190::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Tue,
 6 May 2025 13:36:24 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS1EPF0000003F.mail.protection.outlook.com (10.167.16.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 13:36:23 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 15:36:23 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 15:36:20 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, <w.egorov@phytec.de>, Daniel Schultz
	<d.schultz@phytec.de>
Subject: [PATCH v2 0/4] {am62,am62a}-phycore-som: Add R5F and C7xv device nodes
Date: Tue, 6 May 2025 06:36:00 -0700
Message-ID: <20250506133604.294920-1-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000003F:EE_|DB9P195MB1354:EE_
X-MS-Office365-Filtering-Correlation-Id: 14225faa-d32e-4ca9-5852-08dd8ca2fe80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?izDcbK+IGoDqva0PrQgcYTtT4IaGAWCgyRtYxKA6BSv3U0SRkJpa+ICYhkzG?=
 =?us-ascii?Q?qnv/jNzoXgo44X851akUiinjaLy30AvcDPlmBxDopN6KNK0wCdb8XedEa4TO?=
 =?us-ascii?Q?L3UMlMlrRDWNT8088pbAGqQH5xDFzLGWuuw9JxdlrQ8i0RFiKQhEW3CFWr4J?=
 =?us-ascii?Q?tclVCuIEHJH8Hc/3obxq920F0T+Y/ZfKbztZ9S9YasL9mKxA2MfUV1NsY1u0?=
 =?us-ascii?Q?dk1K41br8ztgiaLEMsQNx+24PY8bCELrZ47Rd/BKOL1iTGSt0ZResz5/F7zC?=
 =?us-ascii?Q?Wef90ItXLCp89BQsh6dfiZC0xQuPqYcUoSkRBslob9Nkv0LVduTxUwasZ2s9?=
 =?us-ascii?Q?2oFzzWtgW1kMhc+RB73NzJ9i6HXfzrthJOl9ML95ETufbkurE+0XHiazpcol?=
 =?us-ascii?Q?AOmSuoapTl2qt6KjXkpKSPRhoxPOYZJyZyHxUyeMjaRG/d9/NwR4T+IDAZg4?=
 =?us-ascii?Q?B7O1q/Jd097dG1TkvuYLF/8Rs5Bd1ej/LihfgJGrMw7rjKdx7Kl+Ja+U2F0x?=
 =?us-ascii?Q?NCzzLjvUjsHqjONBOoCbIuq/5dSvY/mdbpqnT5iFPGvyqLA5OXdLbtnPSD3Z?=
 =?us-ascii?Q?Sh6IEIcMj8Gg9zUHop8zRCREkMEt4z2i8M7FmYKDrgs4R90fsqiNZgbwS683?=
 =?us-ascii?Q?GxugEvXviqbwi2O5z03AuHq+a5+SYw/mQW8K2vAHqy3BICoDLAhpJJr3WRw5?=
 =?us-ascii?Q?r9IHIkJ8jlqkdnGnP/8Ghmfeiv+HNV8TGX3pkgJC3yRvK7arMf9LGBLS1P5t?=
 =?us-ascii?Q?S+AmCc9TRFOynze6XUfQPOwI1lPkpVvHho5dgX4KjGPtW27j2JFM5rRUTbPg?=
 =?us-ascii?Q?g3pgU4HA02hZM8jE5/dUjFPL07LtsNaapn9E3Im0z2hW3AgRFWTmzn4p0VaM?=
 =?us-ascii?Q?FYrhTmL6IB5Ndmh8qf1MdywwNg9K31LF1Yxc4ICMs+EpOWofPka6ywa+V3I9?=
 =?us-ascii?Q?FV7OrkgHKWUJfSe1X4eYag/bml6AlXf1KHiKCJPXF02UPzfWqj/2QCxJxPOx?=
 =?us-ascii?Q?gNPFKHH7zCe3jlJk6V2GuFa2dQedSiI+U6QJeXedmg+KngEJ7cKqK2sXhe8B?=
 =?us-ascii?Q?kmkDyAwFSUMCQCP40vAWM/kQi/zXlWb5kTbUGIfRj7Hb1HWk5LVVPCGqERxU?=
 =?us-ascii?Q?x5cNQfe6ygKEin17slXr9j855si9IkzEMZjf4jM1/k7k1nzJY/YZium1g0gM?=
 =?us-ascii?Q?7ikQ9V1ZEQVuAsn58HUkzbMK2jKDTFxbVJ//pnU6e1y5vNvCj94JghW5G0Cb?=
 =?us-ascii?Q?r67D4dmEYm20HjAdsDn3M3tBh1u4uVuU2pDEfj2AD7Ki6+zqciTskzr137FQ?=
 =?us-ascii?Q?bLUhoKkhb3z9jt4G2O+X5DIasr/cdF2wO2DfWZCo3xUpaE/I8zQzy0sgWcS7?=
 =?us-ascii?Q?G9ZByHeLBmKlJM869opIopPUJF4kwpxF/c0CLGpKyDj+bm6Y6/3aNbeT4R8F?=
 =?us-ascii?Q?m6c94cqFgdCIDuVY+mV2mE0s+Umn6T3s/ADfeC+XVITkqcouLQBz8Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 13:36:23.8447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14225faa-d32e-4ca9-5852-08dd8ca2fe80
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB1354

This patch series is based on [1] and adds these R5F and C7xv device nodes
to the am62- and am62a-phycore-som device-trees. It also reserves main_timer2
as well as main_rti4 for the C7 DSP firmware.

1: https://lore.kernel.org/linux-arm-kernel/20250502220325.3230653-1-jm@ti.com/T/#t

Changes in v2:
  * Rebased to latest master branch.

Daniel Schultz (4):
  arm64: dts: ti: k3-am62-phycore-som: Enable Co-processors
  arm64: dts: ti: k3-am62a-phycore-som: Enable Co-processors
  arm64: dts: ti: k3-am62a-phycore-som: Reserve main_rti4 for C7x DSP
  arm64: dts: ti: k3-am62a-phycore-som: Reserve main_timer2 for C7x DSP

 .../boot/dts/ti/k3-am62-phycore-som.dtsi      |  35 +++++-
 .../boot/dts/ti/k3-am62a-phycore-som.dtsi     | 106 +++++++++++++++++-
 2 files changed, 129 insertions(+), 12 deletions(-)

-- 
2.25.1

