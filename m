Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020107.outbound.protection.outlook.com [52.101.69.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFCA1D54FE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 06:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745822225; cv=fail; b=aA5ZuLItug7ODSUIMqor7NA8/ZJ0vOFbdaEkPyxKaOKCm9bX7EezafptoMN3wnWJr2hqdkYv9dUDBc+cr4Kpv7WTBtB/Nfp6FXEp1eMVFj4EW42wRsLynOlzzAuHwzk2GyvnjWq8zEyQ3ednMqiUmViQF3CfBYZu4mKuOT5lpl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745822225; c=relaxed/simple;
	bh=YFEHzUvXQ89l34+DgvXz5/5mOq2+C6pnFdBzgJMbDV4=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version:
	 References; b=VsF3lWfeM0Vqtm3a+HAvPfaRzyuCtlWGdZd1oKvVh5UxwbMUvhpaCnJwUBQLLXRhAAqtGqEmC602aWHJiqGQGx6PPGM2kAe5Jfu291VMziWDGriiHRBaHa207KwWkQjOtAqi/aIGoVy4cE6lsMzSJOW//Mp5Pn6TrLLfOfSpTx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl; spf=pass smtp.mailfrom=topic.nl; dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=A/OyIBWO; arc=fail smtp.client-ip=52.101.69.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="A/OyIBWO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eiigpx9GgJNYD/htqjBY7ZoYSYL6ao20gzEv2AFthahC/yzFsy4fNz9WCkP/M7BfdXXOjZQFq0cVYvFLd3Hs5O4ZpVXW51QfGl0yIpE0iCoOAeo1KqnE+7ub5dwTtrUUCCuc+TWoQ3rbtZiC4jTVI2yoC1SdSN30ENZbFiGnvUDOvccGiGnxd+CYKO02dnMHjOe0ZaZCZ3suu2NcN3gQ0WJqsES7MQOHPzYbjaYb6hOebJi2NHwYGoDDqp15NMPmtevl3wNaqONsoI3urlvYfC5XDdVzbtgN+bKd4DgO5WDVbFde9VCTvb28XoBNH8mb2Hhvh2wBmU7K7k8phDm5kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uQ/zQO/mAn1k2sH6o/Xsqpp/6ywJj9BatpTxDqlYn0=;
 b=RTVJPst3uStQ9Sd4h9ojRFkxQYSqoF9y29+/YNqPV1tn7c9qW2HtDbMclcX/bpJHOzx+dfymqYJWqx0wQWfBiH7UImZy/TgBexpVuOTnmPaaB06bKsCYaaCpABIxxe4FPQs+efjNJag/WFmNfwD25PeeiWiP2gQ/wXGaO5XDLm8GfRGbJRfNbTcOqgQVJd/G96wQqwQxD84wDtOPC16g4JKNRTMJ5TfPkirnD7aQfljsyyOjHg+fGxHNK/CodVBskHTuw4hqr8SQpnlt5A1oFxfC+QuXrxPkXmEzdBolI1Qn6t8QiYSUUZNI1tbRBY9OAcQfosJZ39dEm4MHY4q7MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uQ/zQO/mAn1k2sH6o/Xsqpp/6ywJj9BatpTxDqlYn0=;
 b=A/OyIBWOvOFJIUGWONkIhnrsUjZG0LVyjoLQfhPAmVtfVbFziAM8j+RDrzpSVypLzFEYnWDdjqXiFHEoHd0Jgcq35oIGGv0olqZ1PGleZLMBn46ValY5XXazmbpCHBGpEz56juvqgOWna1dD5AolHoHH70vFWPnQtDX2f4811dASGSgBErYK+7Na2FuWawAboEgawLgiv1ZNj415G8Sx4hFxh8GDxBPRMVc3/ymtcf6BkhdEmh284U3OO4oRRBBt7ohjRkE1laaBH0m0InklEWnffMPH9deSsA5f57rbyMWk7V+XvFl9JBXjVFHiDGfPrzj+jRaM4ez/UYyOQgSSDA==
Received: from AM9P250CA0021.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::26)
 by DU2PR04MB9050.eurprd04.prod.outlook.com (2603:10a6:10:2e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 06:36:57 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:20b:21c:cafe::b8) by AM9P250CA0021.outlook.office365.com
 (2603:10a6:20b:21c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Mon,
 28 Apr 2025 06:36:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 06:36:56 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (104.47.11.232) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 28 Apr 2025 06:36:56 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by PAWPR04MB9863.eurprd04.prod.outlook.com (2603:10a6:102:37f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 06:36:54 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 06:36:54 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: linux-phy@lists.infradead.org
CC: Mike Looijmans <mike.looijmans@topic.nl>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] phy-zynqmp: Postpone getting clock rate until actually needed
Date: Mon, 28 Apr 2025 08:35:47 +0200
Message-ID: <20250428063648.22034-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM9P195CA0022.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::27) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR04MB8644:EE_|PAWPR04MB9863:EE_|AMS0EPF000001A0:EE_|DU2PR04MB9050:EE_
X-MS-Office365-Filtering-Correlation-Id: e4415a08-3d6f-4266-b3c8-08dd861f1277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?RDxOGaIazsXIVDIgpiu+TSPbCOEmujbuqmnEtO/lbcq3k81YPEvU4kGtwgOm?=
 =?us-ascii?Q?L5ug74+3Lv16kulNzwDq4Uf4/CyfETF2GlU52tTB1ch6FA1QOTctye5p3F4O?=
 =?us-ascii?Q?7Z7IbO3bllz20u7lqtpYw/297gEKr1y4VHj0TnX3gSXhXnCzHE7qMHCBDGo/?=
 =?us-ascii?Q?jFG6R6ybjdhhXJu5SAgAV6srEoVM77gWEqdIN7fC646jUM9tpluGdcsonf8+?=
 =?us-ascii?Q?az/LsHyam8sk3ZmvXI25ITdLczE2DbXu4P/bZyvADJLmbQDmrFRn5Q09JGwv?=
 =?us-ascii?Q?Qd9F4/SEYEwBGFrNfcartBQthJxq5lZ8ftAbzNJWm7Infifw9orOJ2BcNL6a?=
 =?us-ascii?Q?mHL3ueLw8jamZUDh4+3+ZNgZv/k88/7dyvcjF9lTdx837CgkGxey0z+ek281?=
 =?us-ascii?Q?VG0pB5s8tkxm3E8+Ew5GuLPhgOv9q687V18cZmy9qEhrGiXZFhrfOxOXRmEG?=
 =?us-ascii?Q?bvi4+lathSY62ylW24byweWWWldHDvnbyDbCpgNqN9lF+VJkADsJZcnswh46?=
 =?us-ascii?Q?72qGKo9CymjGoqOW19L8dobLe10ILRJdruPyuc9JulmffBX5vjPKRJRGzNds?=
 =?us-ascii?Q?jcrn2au4Fc9B4K2qr/xa6wNKVfl5KCQ8jP/SePv9I08TniYLuyRwA9b9S40t?=
 =?us-ascii?Q?7IuK5wop6PmuPOu99z/uazIW3KDo/w+xWHN4QTFWf5WMlr89oVGjfAj8fYib?=
 =?us-ascii?Q?Sh9jkUQMqtnP3qeVdbtFcPS8/gSz2JceJ8s2WdY27IWPgD7SGdZ9xqYKcye8?=
 =?us-ascii?Q?Ul2DW1xGsKl4jB+Wy/MyfAr9op7Gj7j8ZfmGSL9Vfpj/lLsw1RqAUYgNWAIm?=
 =?us-ascii?Q?65UDjDHRlRlv/fO3bQkUBGu1iHhjO7fqOS02rkGOTgXdi039ODnYBHi3r2NE?=
 =?us-ascii?Q?NaaXjOmlVRYfoMpb0GJVYNDeOaq0Jh8Ns1hy7+p5t01vh2vZhTygw/8rsvrT?=
 =?us-ascii?Q?cRxl2RJKTIkqgFNnrfEE0eqRkcqp2ur/hd5RBNRRnfbmJ0pguLJ8wgK5FaKb?=
 =?us-ascii?Q?yT9hUwq9n/fnRiUID3gVAsEjAxOLG6KTRxVG3Svf98GLzeuTTnO3tu00xMpY?=
 =?us-ascii?Q?WvMzSwjrMPlrkd5syI8a50lOPUdplmO9lgqqJjy0fMv1u+oU8AzSL0V1iMdI?=
 =?us-ascii?Q?GNPHAQJcAQbAtHdGnYNv3wAwsI8isEhbU35ltuLL57vQ1vy5U3DhQRkTEgut?=
 =?us-ascii?Q?ixZKhgRj6PJxW55KPuSQVsZAjGr2wGJOumZJRa1Th0SaAkwAN3mHYBta3L7+?=
 =?us-ascii?Q?nKZUQqte9GJmx+IlpFOCPAJUaCPPbuW0CTpAxbSknesJxfvOkOP2TeRB2cYm?=
 =?us-ascii?Q?NW5SDykRJAY1iRTJdaJtQOpiD99zAptPta56vimOMm8HuajRAlEiBedV0uHN?=
 =?us-ascii?Q?1RS/+fF364BZRL6kJtSziagOLFYjT/Yk/xhBgNwMEjM4yflhBETNnqkTbfWm?=
 =?us-ascii?Q?MfWL06NCig9xHtqkObVP2k7EIWEieQXxarV+IT332vtPlWYsY/mOVg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9863
X-CodeTwo-MessageID: ec0ff9eb-3af8-450f-b11f-ba6313c7ed95.20250428063656@westeu12-emailsignatures-cloud.codetwo.com
References:
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.298e943d-5a80-491d-b36f-77b3b9a86df9@emailsignatures365.codetwo.com>
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	598cdd72-ebc4-4e32-0de5-08dd861f10d2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|36860700013|376014|35042699022|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f5bZY8RWza/9wh9+VzIJ1GkkGmeKMOiJ8+BXvQ5oPQpvUEamp4sqyINHIJzb?=
 =?us-ascii?Q?yP+RxdYipAuyWG8QEhxRqYXRcKJu0af7vp8KNp+Iy6psz1WG/sbyTfTL3OMA?=
 =?us-ascii?Q?fwOmf7e6+3rCOgdUDyj96z8DMeTh5ENoyF6h3DMQGmeuq99ObQ4nSL9j2CkT?=
 =?us-ascii?Q?7WeScXnRA27uiikVVnR3kMVkHWRNjuSphtft0Mt0VdwBtxG/nisSqTFTHrhi?=
 =?us-ascii?Q?IlO/bXn+61d6crOblTKce0L9JT0bKmA5+ocN55VhqKY2/7CN7O4aO/NFmn6s?=
 =?us-ascii?Q?p6DZkBoT3KSOZ5X2FYgR5bBpRtVow4NbvERYQtDPb2S4gzHsSTfosFJuoCrD?=
 =?us-ascii?Q?YAYGypt/n+SLiPWsOJlIg1Q1eSTkO6TxLPk2MUdcvKf5e+IBozYuegAY0Y04?=
 =?us-ascii?Q?K+g7o1r4lt4WEn2ljl9muWWL451oEuVDTKCU5hSH8qaBmKeivPZsi+sKCuIz?=
 =?us-ascii?Q?L5I/OzyuSKZshZ0PwZX2wjOl3coFh6uoiA3ZQZO5QTNa4dPr4ExS35kIV4Lz?=
 =?us-ascii?Q?yCWoZbBSalPE2tfP3ndgMozr81FB1g9+5idU7gjUYaMAct/+wXkuCYNo/qbB?=
 =?us-ascii?Q?PZl8Ava4WChcw+5K78FUUiPBLnA9Rp3y6pQ01nze8cJPG43FlidFS5egRJ/v?=
 =?us-ascii?Q?X8UCi/sA2k1ZY9+nDnlSaXfa2kcQ6aN/Z7a+BDyZ58Hl5vaUI3OXWnA3PkqX?=
 =?us-ascii?Q?6zmzTyuYIqFAIMfP4oZjAUUsdj381G6lcK4SgHWN+jlE0pVfK/d6W7NSNyRc?=
 =?us-ascii?Q?1o1fM7jG8fj9am4pZbA7JwpUFTxwAzsV1VSbAXLUMgW8PYpUbU/ePmjFvqti?=
 =?us-ascii?Q?qHp5VseOnhU6TCHbBB3Qjlo0WSbmWcsqAWEj03+ZvkygatN240ZW4XZ+KAy8?=
 =?us-ascii?Q?LvpnVZQOR+k9Xc+yGoxX28m9jP/6ePLzHaY1q0U7tSKzc96T2cTbJsomORSS?=
 =?us-ascii?Q?vS1tVmaCP1hgJ9g+5cSevBrWmIe2nwPsG6jxHFjHxE0xms6BtbwDl7OPEOzR?=
 =?us-ascii?Q?xbUFTEpdMz5mBAYQwbXJYBVqINMmNZwr4BxKQR0MmWzOU5ThiklDZtdoeCoB?=
 =?us-ascii?Q?auQJYTNQLXVYcdACoL+I+jNYVIoSWyVfUBgOuRjHU4cBfvGCWWdXLxkmrZTk?=
 =?us-ascii?Q?MixqdmvRzX8vX/LZY0qmInykdDsDillpHCpCIeDfbHSkYd3AqaLVTwEZvMHw?=
 =?us-ascii?Q?klvzdlORSnAXMivNxAiyVlbRVw0MOqcNxkBqPHYRBDUIMwFPTOBBijPoUwP/?=
 =?us-ascii?Q?hBEaupH/cxIoR/+O7+ywNfENN/sJSNJcmnuEN7aANHZZGaGjvWBDDqgGy/Wn?=
 =?us-ascii?Q?IL71MgZJMhPUZBC2WvRtKeg2wvGph8Ltwjq81T80cS2nhJMpShF24N7gSD4B?=
 =?us-ascii?Q?DD+rVy6Qefh/tcGqFQ8GBeA3rGq1l17kdc2Pocx+wFeBQX3XEorOrgVjYsUl?=
 =?us-ascii?Q?QVabEL89zAeAqIjs5CXkVUkl+JByPxBJtEZ46azNKNMfML4KXH4AUg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(36860700013)(376014)(35042699022)(1800799024)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 06:36:56.8138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4415a08-3d6f-4266-b3c8-08dd861f1277
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9050

At probe time the driver would display the following error and abort:
  xilinx-psgtr fd400000.phy: Invalid rate 0 for reference clock 0

At probe time, the associated GTR driver (e.g. SATA or PCIe) hasn't
initialized the clock yet, so clk_get_rate() likely returns 0 if the clock
is programmable. So this driver only works if the clock is fixed.

The PHY driver doesn't need to know the clock frequency at probe yet, so
wait until the associated driver initializes the lane before requesting the
clock rate setting.

In addition to allowing the driver to be used with programmable clocks,
this also reduces the driver's runtime memory footprint by removing an
array of pointers from struct xpsgtr_phy.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---

Changes in v2:
Explain the issue and the fix better in the commit text
Propagate errors (as reported by Laurent Pinchart)

 drivers/phy/xilinx/phy-zynqmp.c | 70 +++++++++++++++++----------------
 1 file changed, 37 insertions(+), 33 deletions(-)

diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zynqm=
p.c
index 05a4a59f7c40..fe6b4925d166 100644
--- a/drivers/phy/xilinx/phy-zynqmp.c
+++ b/drivers/phy/xilinx/phy-zynqmp.c
@@ -222,7 +222,6 @@ struct xpsgtr_phy {
  * @siou: siou base address
  * @gtr_mutex: mutex for locking
  * @phys: PHY lanes
- * @refclk_sscs: spread spectrum settings for the reference clocks
  * @clk: reference clocks
  * @tx_term_fix: fix for GT issue
  * @saved_icm_cfg0: stored value of ICM CFG0 register
@@ -235,7 +234,6 @@ struct xpsgtr_dev {
 	void __iomem *siou;
 	struct mutex gtr_mutex; /* mutex for locking */
 	struct xpsgtr_phy phys[NUM_LANES];
-	const struct xpsgtr_ssc *refclk_sscs[NUM_LANES];
 	struct clk *clk[NUM_LANES];
 	bool tx_term_fix;
 	unsigned int saved_icm_cfg0;
@@ -398,13 +396,40 @@ static int xpsgtr_wait_pll_lock(struct phy *phy)
 	return ret;
 }
=20
+/* Get the spread spectrum (SSC) settings for the reference clock rate */
+static const struct xpsgtr_ssc *xpsgtr_find_sscs(struct xpsgtr_phy *gtr_ph=
y)
+{
+	unsigned long rate;
+	struct clk *clk;
+	unsigned int i;
+
+	clk =3D gtr_phy->dev->clk[gtr_phy->refclk];
+	rate =3D clk_get_rate(clk);
+
+	for (i =3D 0 ; i < ARRAY_SIZE(ssc_lookup); i++) {
+		/* Allow an error of 100 ppm */
+		unsigned long error =3D ssc_lookup[i].refclk_rate / 10000;
+
+		if (abs(rate - ssc_lookup[i].refclk_rate) < error)
+			return &ssc_lookup[i];
+	}
+
+	dev_err(gtr_phy->dev->dev, "Invalid rate %lu for reference clock %u\n",
+		rate, gtr_phy->refclk);
+
+	return NULL;
+}
+
 /* Configure PLL and spread-sprectrum clock. */
-static void xpsgtr_configure_pll(struct xpsgtr_phy *gtr_phy)
+static int xpsgtr_configure_pll(struct xpsgtr_phy *gtr_phy)
 {
 	const struct xpsgtr_ssc *ssc;
 	u32 step_size;
=20
-	ssc =3D gtr_phy->dev->refclk_sscs[gtr_phy->refclk];
+	ssc =3D xpsgtr_find_sscs(gtr_phy);
+	if (!ssc)
+		return -EINVAL;
+
 	step_size =3D ssc->step_size;
=20
 	xpsgtr_clr_set(gtr_phy->dev, PLL_REF_SEL(gtr_phy->lane),
@@ -446,6 +471,8 @@ static void xpsgtr_configure_pll(struct xpsgtr_phy *gtr=
_phy)
 	xpsgtr_clr_set_phy(gtr_phy, L0_PLL_SS_STEP_SIZE_3_MSB,
 			   STEP_SIZE_3_MASK, (step_size & STEP_SIZE_3_MASK) |
 			   FORCE_STEP_SIZE | FORCE_STEPS);
+
+	return 0;
 }
=20
 /* Configure the lane protocol. */
@@ -658,7 +685,10 @@ static int xpsgtr_phy_init(struct phy *phy)
 	 * Configure the PLL, the lane protocol, and perform protocol-specific
 	 * initialization.
 	 */
-	xpsgtr_configure_pll(gtr_phy);
+	ret =3D xpsgtr_configure_pll(gtr_phy);
+	if (ret)
+		goto out;
+
 	xpsgtr_lane_set_protocol(gtr_phy);
=20
 	switch (gtr_phy->protocol) {
@@ -823,8 +853,7 @@ static struct phy *xpsgtr_xlate(struct device *dev,
 	}
=20
 	refclk =3D args->args[3];
-	if (refclk >=3D ARRAY_SIZE(gtr_dev->refclk_sscs) ||
-	    !gtr_dev->refclk_sscs[refclk]) {
+	if (refclk >=3D ARRAY_SIZE(gtr_dev->clk)) {
 		dev_err(dev, "Invalid reference clock number %u\n", refclk);
 		return ERR_PTR(-EINVAL);
 	}
@@ -928,9 +957,7 @@ static int xpsgtr_get_ref_clocks(struct xpsgtr_dev *gtr=
_dev)
 {
 	unsigned int refclk;
=20
-	for (refclk =3D 0; refclk < ARRAY_SIZE(gtr_dev->refclk_sscs); ++refclk) {
-		unsigned long rate;
-		unsigned int i;
+	for (refclk =3D 0; refclk < ARRAY_SIZE(gtr_dev->clk); ++refclk) {
 		struct clk *clk;
 		char name[8];
=20
@@ -946,29 +973,6 @@ static int xpsgtr_get_ref_clocks(struct xpsgtr_dev *gt=
r_dev)
 			continue;
=20
 		gtr_dev->clk[refclk] =3D clk;
-
-		/*
-		 * Get the spread spectrum (SSC) settings for the reference
-		 * clock rate.
-		 */
-		rate =3D clk_get_rate(clk);
-
-		for (i =3D 0 ; i < ARRAY_SIZE(ssc_lookup); i++) {
-			/* Allow an error of 100 ppm */
-			unsigned long error =3D ssc_lookup[i].refclk_rate / 10000;
-
-			if (abs(rate - ssc_lookup[i].refclk_rate) < error) {
-				gtr_dev->refclk_sscs[refclk] =3D &ssc_lookup[i];
-				break;
-			}
-		}
-
-		if (i =3D=3D ARRAY_SIZE(ssc_lookup)) {
-			dev_err(gtr_dev->dev,
-				"Invalid rate %lu for reference clock %u\n",
-				rate, refclk);
-			return -EINVAL;
-		}
 	}
=20
 	return 0;
--=20
2.43.0

base-commit: 8cc713032dae3b74742d90a35e2f93b6cb23684f
branch: linux-master-xilinx-pcie-reset

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
