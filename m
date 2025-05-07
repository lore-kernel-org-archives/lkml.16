Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2099.outbound.protection.outlook.com [40.107.20.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E220216E863;
	Wed,  7 May 2025 07:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746601233; cv=fail; b=jFVUTVigne+gIZGA1xn/9Nw5MRzSZGi/m28mA1kaFnZ0ZlRjDqr3CWWBm6NLyOEQR0nfibUn/gY/O6H/kuYjwKCk+hoCsW3oMEghASNV9ChjumvoulGVnXNgQbjx2Q82HM0UgtcUETKLi6mAUQTEKtmifhWsea+KLKQigywa8oY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746601233; c=relaxed/simple;
	bh=+aX50MwuVYNVByIONZJx9xLfFcsjO9sJ1WgyOUK868w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ISQRptbzGaStmf5StPfmIvJ3+QuTqLcVxEmH6g8LoOs1GDUvHfSbr2FmInAvfVqj5vuzXxtoOyWJQgVCmEJhcXvhj1mk02Njf8DZLNKMLfst4ZMdEtB++U7+jPfl6aP3KasTRoIdXC8SIeLU6IorhaTAc4uBxOYd7iIH7hLVtAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=afuVqDDu; arc=fail smtp.client-ip=40.107.20.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="afuVqDDu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MEcxAWVQgnDSxNyYNM1azhaXCHiPfUR1H6z4DIQIB4uUTJ0Wq50NwhH/Ac5jHw0k63OKpZ2Uh7XyPAfbZF6e/09osBTrZUvf34ULqigqCfnyf+K9pA/PmqB7ORJoOR+xyNfRVsFGCQ7eU9rsFLcjx5zAdVEJuvGPgwv1MMPEuKGsUrEGOr8m+T8/2b6ElhfgaPRFl6cSQ1nV5hZWSBMG+VezyhghkaNessKNlBIDzNQTvClS6IvHdgW+bz8wU3UF14nhqcuRWJPhytj2PLTmtwjkrCviJDBvuAdsu3Opiz4y1zelXytb8Oqd2clYIGx1d4F4Q0INwhqEIxJ6Z7wzFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fzd9QSA+6Ag1Co3onLp4RwqSDPICu5baCp5m+LC6EgI=;
 b=D84C6v8swWLVY3kBSURsnyuAoda0TNMyVvhDp72i8xXlzPw6IqTO0JrsXqcofzXPlFKuCM60JAXq6Av7yeRkvYc8PSzp5V/ekZILong8mqs7c7NPsQlWq1KqULUDUGDds4Xd1zd76p6zhKjgoxb3Qjk1QKTy+g4UgXA4XFioL3H2GIOArRdLIaZKdemz8Z6nMzd4RCBfNrv/r8Nm/DOu3v7sc0Y8vPk4K3p+28WgtguoYvTIXxLDogMbyRcT5el4dU/G67dNo3ViH3iuWOZ3kRFtXQtxmN7JZyMi+I+gwK/pYP/98MU37kHrnHbXKIm1RfWaGRvFFtq9qom2xrvlgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fzd9QSA+6Ag1Co3onLp4RwqSDPICu5baCp5m+LC6EgI=;
 b=afuVqDDuVDJVtAPePRYMOAndxcfIgw/XIvQZxhHubnrE9vUnNFRpA3dI04dMN5IP/yIsxnxRTtw5LGtrmqgB3TEl7H27c9Z9I6TUYW13B00lXb0wIut7JN8/jB+1H67H0ARH8A1+KldQh3fNLrTsd8WbXAbCBALavBdBXL3ApZNNvRBoHdXtLTgq58NJeQymgfrHIRUYEWxbZoy1JhvIqUtDJRUfm/y79vVN0Q+Nk+ZypVqJy8dic8c90a53HJPAXrgAuoxkeX7aSlpep9yZpwwdkA16w7q2kkiWx7Isd5A+1TiozpJ4B4T7URrx5f0N73UDlYpu8sbJJJXoNA20eA==
Received: from DU6P191CA0054.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::21)
 by GV2P195MB1989.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 07:00:24 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:53e:cafe::da) by DU6P191CA0054.outlook.office365.com
 (2603:10a6:10:53e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Wed,
 7 May 2025 07:00:24 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 07:00:23 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 7 May
 2025 09:00:23 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 7 May
 2025 09:00:20 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, <w.egorov@phytec.de>, Daniel Schultz
	<d.schultz@phytec.de>
Subject: [PATCH v3 0/4] {am62,am62a}-phycore-som: Add R5F and C7xv device nodes
Date: Wed, 7 May 2025 00:00:04 -0700
Message-ID: <20250507070008.1231611-1-d.schultz@phytec.de>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FE:EE_|GV2P195MB1989:EE_
X-MS-Office365-Filtering-Correlation-Id: e5b4553f-c58d-4541-99a5-08dd8d34d6e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XbKRR/RE5lgBSL+cEPxrpotXtfrscTmEgLg29V1mqgsISCXxRwImF4KGKen8?=
 =?us-ascii?Q?ReV2MifJVrkTv2pBfPWgFmQbDpHj5hatHy+JAOuw0VxNtLwn+1179JT/yqRE?=
 =?us-ascii?Q?SESmDfSGaKOeQwU2dppHorgbRuGxLMhIS8qJEFEAknj2qSnSn7ob66QKXZj/?=
 =?us-ascii?Q?J7baO5r+KFXKkMYAOF13ufeDWYTWp7KoPzPzPGzr0tgXhnfbR9FPINH05oCE?=
 =?us-ascii?Q?mKAwEMiofBkzUygHJc/+jnZURxFzHCM73jf0kN6O/+3JAp+ZtLzBUJSoBkNp?=
 =?us-ascii?Q?8B2Ka3/wmaaWt1ppXRCGV+Q2IWZCmV82Q6/RB3ir/E29CpXhuVXXIdAz08Eu?=
 =?us-ascii?Q?MZ5Y7CL3JSPrdqavqvUPxbQe9q1sxzXKvAxPmwX0IixPEGj+AE5QSzCMjEMV?=
 =?us-ascii?Q?B11vIdXFVmJtKSUU3MqM2Rls+s5PODq1aOBD6NbEiauuZx/VIlp//ryiTIFW?=
 =?us-ascii?Q?wSW6CbHEwb5ySCK0r2T0HbFx2IdOpSxBWhuLWrPURR31uIAwYYWT+KO3kLbU?=
 =?us-ascii?Q?LSYBrjHHmIwx0QOxX9fynUB4voc47OFsDM1paUH/1W7lbPn999FbVHBDY4wn?=
 =?us-ascii?Q?UVjqrirFOOnE3Vhayrsa4wLXzu6zenoTqdcRkbqR2huG0IYSkQ5B4UzfzulE?=
 =?us-ascii?Q?MOWJgwCzx/6X3UqYEkaGGN+eaUVh+MsRTU1QYTTg0cILjI8SH7ZHnqD+HeHq?=
 =?us-ascii?Q?CyaOdFymQxC0SOcOK7+nsWxVMYIKHZLmWmDHYjzkONZLBkz4PPj6fuHBx0Vv?=
 =?us-ascii?Q?axnSmoUe/I1r3PBz5ocPiLvkpBBgyvtEvA7+yrXIeXsorK3F4OutaaIsW0fk?=
 =?us-ascii?Q?eL3R6A1rCKdJALBslCPM9cgZXicDeeftq6zsonXraEvz6Asdwayrlw+kEdrf?=
 =?us-ascii?Q?Fc5vmUKJDaqEkgC+Jc4nHHAdG91+XzT9zb4DNBNhj+ZUiI8Z+LwFctWWbbtv?=
 =?us-ascii?Q?I3Fzp2sKPZJu6BdOYR8zrDbRg9u5oBNbC4eoHz7JrADBDv3RuvJI+8iFIwhp?=
 =?us-ascii?Q?mfR9ulKRLFgfv9bA8jN9+H8ZjwOJ4pqP+8JuKAPJxGvuxGttd/VyWC92hfJR?=
 =?us-ascii?Q?UXxPU1VPuWiMgIcceczrz1YTw5C3DZWmi8qkH5iLJvwihVS6e/eht3BD805z?=
 =?us-ascii?Q?Uvto490OSXyx96kuJ7rdtPcElrDQCr5aG9Wtckt5zqgQJ+cYYjbAwrkYcg7M?=
 =?us-ascii?Q?ImXJG4TRT3SgZwngSCunluR5XoZ8JLSnLET+wVOeJr+YyS/IF0bGl/8WswaP?=
 =?us-ascii?Q?i/NQhLXBGkolRg7cj1jAKKUpO6cr1WWze+lmjkldHUnJFsxWFFPcT9UCT/JE?=
 =?us-ascii?Q?NuIqhiF6K+sF9v36ZJE8pAigWFxEhRUOa7YoFKARH+SRqg4YL+sYoJbMBA3c?=
 =?us-ascii?Q?XvdvUmOKCxos9r2EgeBX6N+EQEmQ6sL3Wazqp1uxhP7tXFLxOlEuTYybhkCh?=
 =?us-ascii?Q?i3aqb41e1ZsfAH3we5LVJJ/3+Ni4WZ4eA7JCO/oQzllaP4l+BWgnLA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 07:00:23.9008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b4553f-c58d-4541-99a5-08dd8d34d6e6
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P195MB1989

This patch series is based on [1] and adds these R5F and C7xv device nodes
to the am62- and am62a-phycore-som device-trees. It also reserves main_timer2
as well as main_rti4 for the C7 DSP firmware.

1: https://lore.kernel.org/linux-arm-kernel/20250502220325.3230653-1-jm@ti.com/T/#t

Changes in v2:
  * Rebased to latest master branch.

Changes in v3:
  * Added Reviewed-by
  * Merged mboxes items for c7x and wkup+mcu rf5 nodes.

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

