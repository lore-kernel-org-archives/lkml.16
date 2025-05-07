Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020123.outbound.protection.outlook.com [52.101.69.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81152820AC;
	Wed,  7 May 2025 13:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623527; cv=fail; b=KAYeFfGRY/8D7X5LEboVKywGe+XVIegQ1vN8+ZjEa9CIbpozK7GBSaXlp5U5AWHsg239vW1wK872HXb6uwB8jw+f+TEdg3jwYMniqZzWIwxE6V3LUin/E/fU3zpY1MbVOciApnPRYQ6xbZqYAgDj61TMxFtLP9b/MmwVRV/en3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623527; c=relaxed/simple;
	bh=C41rI9aFmq3RUqAZ937AW+T8iFThLTlV2So12qL8vhU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Sm5OfXRjZHUBLDf1qeRuJjJa1YV5lr8RaovNt6NhxcqdPrtorO5Tz0DJrD5EG22/IRSsg2CrEMezhlC8eQb+4Sgn2DJFsIdN2WsbDn6igjEgJ+6Q02HCIsAkjwX6gXWE7JX2IuHXHFUES7CIwL9Uwvos0ioX4ok/KBcSMtrfDac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl; spf=pass smtp.mailfrom=topic.nl; dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=d81IQe2C; arc=fail smtp.client-ip=52.101.69.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="d81IQe2C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pyfzEOewlEtvhWwScYzTZ8CIPahFEcnPpJOYMCdEBmMozmL5oa17DtjpUtN6C5G4GHYPXKJ5v4gUfTJLRJtX0V4634lzMRVOiWPPPg651MFhUJx8ulNjuzoUPQs3LDSUptLjPYvcsUIlbnbGk5jriy8gxPDMOqAepbu3ltqOB+hjn3p9zDAlzYDKF2xCuP66r9iIdIrCsXEtcmmMiGfzTU6muMzxTe1vutscFp5ZmLXdT8XDRtNsMgp65ZI85+b/4bn8EmBL252zqUcXc8G3CuBzE7/74xgm4/5RW0wtHt5VrYe9wIItgYVFsHZUmoXchyKEW1WHxEXKDWBb91pENQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zn/p8fdyXB3HV36V73ktKknngPANxXcofucmvPvXjjE=;
 b=uGdrcYTfe+mqFyn/1z87zfbA6uiCmLR+0sZ/DWwoRb3fRPX62cZxYGlXYrvgK+UhnKf1x4DrILLw5Ktw90wcORU4OiShZKgRsGSirFKFdDucLUgaK8oq+vkElUmtfSMdkBqnjAwKTRRUNvs6fjXCL7GDylWzBNRIRyZ9F0/4uN11zqSJnHT08HE+DBhaO3GLGxMhPMPOK9mkEBWvKc4GW/TyXP3svY4vtoX1oNFCbD5s/R1uv5bMyCCX9R/Q0xjik/TNgO31WED08dYBqeRNyXdq8FmImkLepZ3s4mlakAaHBjL6mfwv8SsPkPmmR9rDgHNiH2aT1MMEbxBFChAk1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zn/p8fdyXB3HV36V73ktKknngPANxXcofucmvPvXjjE=;
 b=d81IQe2C7CoASdcGvh+xSoTWKKLLnMbhRcTNK5exulllgPVSCj27eaH5vTiYMNh/PmFEGa+UPBKqUUsGNnNwZnI9BQhAkubf/NKpdh1BKb4MpcoVTwoTgTQWMkXTafGLi2o48XnNLge0fYdm+jOiZ9E/gdVXXvElvUn5PrkJFdkgwKVNsub8kivtNdtJLKDVtmu9GDeoXtBr1B28rSRILd9W9LRNo2Xsl28PmX0D+uaGOdk6U+aVeoNxqK51e1GKwFPkXTK4JNtCSztnpZOSRP2m3id53V0ThlXO/2WStxDoUGLy3lwO4TAXZZsfJxqkTRp1w9puhy15Hnd7jJcsEQ==
Received: from AS9PR04CA0086.eurprd04.prod.outlook.com (2603:10a6:20b:50e::24)
 by GV2PR04MB11094.eurprd04.prod.outlook.com (2603:10a6:150:279::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 13:11:58 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e:cafe::85) by AS9PR04CA0086.outlook.office365.com
 (2603:10a6:20b:50e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Wed,
 7 May 2025 13:11:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 13:11:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (104.47.18.106) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 07 May 2025 13:11:57 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by DB9PR04MB9283.eurprd04.prod.outlook.com (2603:10a6:10:36d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Wed, 7 May
 2025 13:11:54 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%6]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 13:11:54 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: linux-usb@vger.kernel.org
CC: Mike Looijmans <mike.looijmans@topic.nl>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: usb: ti,usb8041: Add binding for TI USB8044 hub controller
Date: Wed, 7 May 2025 15:11:43 +0200
Message-ID: <20250507131143.2243079-2-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250507131143.2243079-1-mike.looijmans@topic.nl>
References: <20250507131143.2243079-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.3e03400f-766d-4690-8f43-cbea2cac93d8@emailsignatures365.codetwo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0008.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::19) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR04MB8644:EE_|DB9PR04MB9283:EE_|AMS1EPF00000045:EE_|GV2PR04MB11094:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f195857-2bb8-4c22-61d6-08dd8d68bf73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?Qi10+n8pGV8ZF4rCghY/M8PjvBeCpf+KF6KP/MtxLQcJPVDGyYF20lZuF7HO?=
 =?us-ascii?Q?hBonepVX1ZZMVVKO7dzs5hS94lNkKofp4rG1uVx9T7pPXFWRFEWrb64YPXDs?=
 =?us-ascii?Q?0bn7bdW6Ow5e1Ibg5Pqen+TUbU1vTb6csttxRapLpsQD7R9fz1jyTBAwG57b?=
 =?us-ascii?Q?7UqlQzG8rxIgOzBTaIozsjhXeRfH1O7+HqSELGrP2u14/T2yL7mHoQ8K0mog?=
 =?us-ascii?Q?Oa2aDX3Qq2EtF9SCZY7r3sNozjtyEHvRbw3m3hwpYc8vdgKbOXLxMLUWVQ6c?=
 =?us-ascii?Q?qUqbCg7KN0BhIDAya6kh/kAFzzFE1YBgt8dBlWWXqq5L1Aq49XBv9ljAY7Q4?=
 =?us-ascii?Q?J4Nh5JkO119dxmfBMOlJ6pH7qT8Xh2/WhBTtZOz1z5SmrAPmVZbhtXmBYT69?=
 =?us-ascii?Q?c7mB5Ynsj8FcA0pN91LAg1f2D8HXUfFGoCPB3mOyE8wMzh4aVNAsxZCGlDr5?=
 =?us-ascii?Q?fM3l1+VT+fZG3k+f2338M1xh9CPigP84OjoHdyQB7b9uI3kYqBKB4bLGyJHQ?=
 =?us-ascii?Q?f6jmAOrgTdGtGOTurMxBLpfoS4BSSwUu+8Ka0jluta4bQpAJJB3bMhM51Cut?=
 =?us-ascii?Q?rMMSKRqFzDcdeV7YsdH+9m8skqDK7vneQrH4ecKUHldchSZ3viP2ehRhrH6e?=
 =?us-ascii?Q?98DZrkah2A5Rdg4crC9nGa0xD09xzTEb+WjB113n1iHglF2KqkB2a079+MKg?=
 =?us-ascii?Q?wyGPWnHUUeniCTgvlykFx2rVEMrqV4LPq0OHoy6utaLsSULS20x43BmY2ewD?=
 =?us-ascii?Q?DeJwEjsCXcKpdNtWfRpjN4eeariq/zL3yuvjtv8xhS9PI62UCiyxpbUhcUvU?=
 =?us-ascii?Q?PKgzST4FZaDHRZGPaxlJH6DmTycZ8pQbeeBUUt9EPWaaN0Vh/6Vqd07AQJNI?=
 =?us-ascii?Q?rVxzNzku9oA41gVZ+QmrFEzxR0kKMy5dOIBCdWYOfAS1tKX8c9YQvfm4TWKe?=
 =?us-ascii?Q?13iZI1cdzqhuYQ486t6Nza0vkIcmXaYIlDTaJq3igCPqYo7ocibLpypaVNVy?=
 =?us-ascii?Q?aZuden1dvPuas2fh0LJBQ2FNsBK4bqGiyGkw2RAEgOUu+g4g2fB0EtZIm/yo?=
 =?us-ascii?Q?vzITHaRNysO4qaJzScUAI5MSyhqVYg/Sk2cv2cIUZw/UY5p+yPjWQOpZ445I?=
 =?us-ascii?Q?Bsgr5HZlyw2Y/5roKV0gjU8S4+YO9AZ94RL2IFOWTKps0haHCHal3j6i4m6n?=
 =?us-ascii?Q?Y5yuqrh9BJ05IcuvAvKBL7RJXlNoH0rCrH7PhD4HovPvGf2e8MaV56pefa1x?=
 =?us-ascii?Q?hzC/WgSD9oiU3jPVyh9HTMtplXQ0SFP1Mvzdu2dK2rqCJhCcOv4er1ZbprNP?=
 =?us-ascii?Q?qRdKaasnDXsUSJTH7aPM62ZxCKZURTndRWtePNHD/EgAj4YwNhul0k3eUsSD?=
 =?us-ascii?Q?A1K9eljs8OjFjkElYEOfPr4hKeioHYUNkxXDPj3DSHKJ0Acje/nPpIBr8ARW?=
 =?us-ascii?Q?/W9tnYJ4LNg=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9283
X-CodeTwo-MessageID: f875d1cf-8034-4870-90c9-890be63e53c2.20250507131157@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	be19f403-3fef-455c-b892-08dd8d68bca3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|35042699022|82310400026|376014|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PKwPIUuAqsZYuWsLZZc3oD3PItsIMCIVFV0awGQng+C1FllB7kntQssEJlv7?=
 =?us-ascii?Q?BUTx0EoG+HvmbFN0H/UxT1JQSQw7qYN6g/ZVxSmu4FHaa9+zd0yvvwyxgy/R?=
 =?us-ascii?Q?b4+iIzZA+Q1wfdeAKchTqVCQ2XsFEyaDa1hhwgQ204FJeaxWKEmmOpWGwgOY?=
 =?us-ascii?Q?ozl3pyi4VBa04XtF0W9elOiO3oz84vExeS4nL0x5G0xlPh+yTLAs4vbUAMgj?=
 =?us-ascii?Q?2IJZQwWVCoVwv5ocOLS3DXDf+ffkHxTW3MKv4wL8q2WXDbP1JqulRUUh4FCe?=
 =?us-ascii?Q?cWAjarPiGpAeu7C2pon2XPzqL9fNCZgpZIKJ5AX5HphIC7HPt6xkGsya0yu8?=
 =?us-ascii?Q?lHlZWfoqITLYgLGWdNxxxVGlBr7OzKbuvi+Jgyz8sWnIHBSWGdlsWFTVEJqz?=
 =?us-ascii?Q?9VqVwBkhKx8VFl/uVfz31ao2dP4BZSTHJRWO6W+qSCxhMFPLqE1tKIgSH+RM?=
 =?us-ascii?Q?VoZe8KI02oCAWlHmz3gJtcDUcICuokRXvRsKNyZ65KEu5yKYg+q2o5JcZZ4t?=
 =?us-ascii?Q?JMkBHPtNF0SJbO54BFZW64pxZ1SvcQzwLToWSadBMg11cXJ8VWN+jEiZt0lq?=
 =?us-ascii?Q?KrWn1pqZUeRMLtHNYL02RsQhFIMXS2uRSn8UIslNAgXWIe4/Efyvqk/I5FWr?=
 =?us-ascii?Q?w4nW7lkvOGrYyvoSzOeAzQpfWk9wpS7LzXYaVoXHOeqeXdldmgVHgv19QxNw?=
 =?us-ascii?Q?FZ4Pb9KwKGiA3MRl0OQMnIuVbS57V1mRTMybmW0+U5YUNn8kNwjkziO9hltb?=
 =?us-ascii?Q?4q6xlcHUNr5Thd3acsGB0hjLi5uo+DxICZextDPh9dcoMyXB1zaoVdllYoxH?=
 =?us-ascii?Q?mzrCRIO+ocnrzC1XMqrPKswExCmHXMtmDx7XnOawGt3O6JiNu8GED23Vy4Kh?=
 =?us-ascii?Q?YaIfGEy1Yhtlhlxhj5ZR+2kHNiYQmJpDQpZ8l6gdeHtEEJlhLCalFunqQ/FV?=
 =?us-ascii?Q?FCKy/ThswkuOjaerYSzXLLGv5i22NBxSCJvl30aQHNbA+hGmOw2WFPJAodbh?=
 =?us-ascii?Q?2cNWC29WHu40O43GlH6P/BtMohAqmm2yi0GJrYp/mP4s3F7RlNhOwX0MIJK3?=
 =?us-ascii?Q?OqNevwPgQ/nLa67KH0HYVI4iPPY6h0H3cC8Av+FBO+S5ErwFMHP1p9e8WEBf?=
 =?us-ascii?Q?0/Khy9c/eyR7WtQbEdseVFIziWBF8HklPOWVl5ZJv+s+2DgZjXSH6qIg/B64?=
 =?us-ascii?Q?vj7Be4uAtwPuoEDbewphu0stJL3eg+T3CUOvnfCIlYe1a9qeoHe4KfGeD4TT?=
 =?us-ascii?Q?L4GIDv5nU4Zn55mTqVVWc/JDYX0IwjkNMw9vnyVTdJ61P33YBB4K8/xVe8gd?=
 =?us-ascii?Q?2R+aPaCkM55a4p3u27Pv0g82eklcAWwkb+/SSpYHpkUbo/W5v1yWpBu5ly4X?=
 =?us-ascii?Q?chuihaBRURopWNMuUooD30f92zyHeWN0IK/RZwbY87o7brwrYE1ioiATr4N/?=
 =?us-ascii?Q?gvpQNwk6Mt7s8TCO5+TnOwKd2vZwTxNu?=
X-Forefront-Antispam-Report:
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(35042699022)(82310400026)(376014)(14060799003);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 13:11:58.4312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f195857-2bb8-4c22-61d6-08dd8d68bf73
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11094

The TI USB8044 is similar to the USB8041.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---

 Documentation/devicetree/bindings/usb/ti,usb8041.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml b/Docume=
ntation/devicetree/bindings/usb/ti,usb8041.yaml
index c2e29bd61e11..fd6b35a40a5b 100644
--- a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
=20
-title: TI USB8041 USB 3.0 hub controller
+title: TI USB8041 and USB8044 USB 3.0 hub controllers
=20
 maintainers:
   - Alexander Stein <alexander.stein@ew.tq-group.com>
@@ -17,6 +17,8 @@ properties:
     enum:
       - usb451,8140
       - usb451,8142
+      - usb451,8440
+      - usb451,8442
=20
   reg: true
=20
--=20
2.34.1


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
