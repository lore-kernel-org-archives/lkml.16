Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022077.outbound.protection.outlook.com [40.107.75.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8196218CBFC;
	Mon,  9 Jun 2025 03:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749438997; cv=fail; b=l+EpZT9X60IHos2W957A1pN3QasmCeVmBFyB3p9fejFBjZSP/aTodLcIg+UwdqS1jSPiNpGk/Oyw1K1tuy/uztoE3kvrZEDfe6EJcEYQeQ8yNrrLdaabpm7EESspvkFldkNyhrqQDASE+ZVTHiTOrKYfN9qCRcbmdwj1JkYYixU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749438997; c=relaxed/simple;
	bh=9kqRDfQTvm8v79//pI8ME5RfK7afM3tdJ1SanzknU0A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RxO7KxlWRS5lOJruprTSqoPFSyrgWNqjZhiuzp6PwjFU8M8nfS4F0+IHuRrDmkCfqrRMBJ9DDDykC3mKQAe+XJmg7Hrb1WJ6sJVTh3Cb/3i5Xw6jEC0Xi4WzbgnP+UBtpQdDYZLVtwh7vyqRUw6fpI8e8/s/6GNFXjlsQt/3wUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iNRmLhJoEl1+vkGBvyCEZ0GJOV79Bl6qDVSs40h1zS0oD1VbaUV7ZCd0hRzWcteosB+KTnJoWi92JGe7bkLXL1tlJLg85D8bJtG/7GKqfRhpYggThZI+U/8FoX4m0YEQsnjd50Z8kbFrbSqpJsena91r94wH+idlepW/VcrNLLhe2EEAS56nGSHUqLa5lTiiVgJXwbTy7mla7ME2DrmY2dZCD/BWhdQZxP0txWBL9UzgQhP7N8hvB4dKLYjyl3RGwp+y5c8xsKI/FWjvgxgH29cd81eDLWZVHGKUdJolh4Muwc3ZvO2v62ecsxy0A/s8GGQSxTiPz/n+J4WeuVY0zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xFO6SIchqCsiBZdpX9CLplf8tgp4KWzTEWUWlN78n4=;
 b=rIka/EFd3cYYK3CxPOA10VUzzX2WSwMOZ14DfVRsOw4kvtaePRjBarxoNHf5o+R/CwX2fnezmIdcZ4UhVd2Tb+0XtO6pKYUJ9ttommYUlxG4kXJbQ/mcGNKGw4ErjF9Ot+HnqX6jtOGG2uR3OoWYaTChH2VSH6Xm3442mLZ39JbHDGZSISgZv4h2S7yp3+GozvBq0ehL/7isygUdKeee57FBZwyQFBUiM4rkWe8sI/XQ6XlSkE4fch+4b5P+Wnp2LQrxakK8Sc//3c0lM7niR5Nrv7l0UnaiSfjAhOPvFy02BZJZ4fdu9w8CGUlJP+hl/sj1Rv9M7o2k0czoFn8bKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4P301CA0033.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:2be::13)
 by KL1PR06MB6791.apcprd06.prod.outlook.com (2603:1096:820:ff::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Mon, 9 Jun
 2025 03:16:29 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:405:2be:cafe::73) by TY4P301CA0033.outlook.office365.com
 (2603:1096:405:2be::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 03:16:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 03:16:28 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 7BA074160CA1;
	Mon,  9 Jun 2025 11:16:27 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	jassisinghbrar@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	maz@kernel.org,
	sudeep.holla@arm.com,
	kajetan.puchalski@arm.com,
	eballetb@redhat.com,
	Peter Chen <peter.chen@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v9 1/9] dt-bindings: vendor-prefixes: Add CIX Technology Group Co., Ltd.
Date: Mon,  9 Jun 2025 11:16:19 +0800
Message-Id: <20250609031627.1605851-2-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250609031627.1605851-1-peter.chen@cixtech.com>
References: <20250609031627.1605851-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|KL1PR06MB6791:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 366d968c-ea04-4327-680c-08dda7040674
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rg+EKiHywE4qmBd7N+CfNSAB5zCBubPrgugDA0dyxEWdgku8POKOahHbg+um?=
 =?us-ascii?Q?mIZQxUHEhh6WuDO+HooQJGr/imEAkmj5gauL1KhWN6cyZANeBO/CqlKwjQhB?=
 =?us-ascii?Q?Qbq3izkeUrzkbPOOlXEHChiUryvZ9+jW9dDb///0W1jgQv5RqJUOm6wdKY1A?=
 =?us-ascii?Q?mVE3HeiKJY6uAPaKhdudz9vXY07sOjT4POCMpNhcl0ML1UPMu6Obo6RU3q/D?=
 =?us-ascii?Q?PXeWsUu+/1Zxm7B5ncwLui7RPulh1b+zjviI6d+AvGrDmvSl5gnxwB+eflav?=
 =?us-ascii?Q?kXlfKMMnc4VgXZXLiHpAFRgzDAPuVbtMpxmw1aT42bQsiLU8cmKQ6akUr6S8?=
 =?us-ascii?Q?0rUrAdhqOXwiWa4dLTiZAqDBiG0MuItP2U5J41Gar9Qd78XC0NYGl4bCgKzG?=
 =?us-ascii?Q?zGYh50xsOqMmiQUzQmPa0PawZ67N6GbAa9u64GNAsNPSs6Mk+QTkNafu5HnO?=
 =?us-ascii?Q?9noIEp6zVVNXm047eVVOwZ+wGntiRYRcN7n0wpFcB+KFW/m7HIMkJnHSWbj6?=
 =?us-ascii?Q?ESy3dXDwNGplBkjlyARowFqWvTWNeWuyDKNeofIpoOrMOgu2Ia1xUCQz0Hfu?=
 =?us-ascii?Q?tCg6NNkm6DwbhjL5zoQOFL12IuFEbTNYQ3snJktlqf8d55Dy59jLz8uF7xpd?=
 =?us-ascii?Q?XZ/KfJPC+joKdjSsJFQEVP4gsZKJpxJ9Hs+ap6Nyd+kvL8M1Q5trzeAuLuzd?=
 =?us-ascii?Q?/oXNyyKvk72khkNCAcS3KCOsQz9Jl83+YLpUZgNym1XkWGTHWMpogcR/Evb9?=
 =?us-ascii?Q?rqzwwKEuFNIE6mMf5Z2ngtaQt2qndmFMCVQ4XnM4RfT5j0E0XWCj7eQK54OK?=
 =?us-ascii?Q?z17XsSmVadKRi4XgGqFq6YSBymzbmNwdfsz9JXek/yvDpYZ8lj5VgIk0OlEp?=
 =?us-ascii?Q?sIjqymsbXbqYlSP5WA4jAvYKfE643yL2f7Q9Oc+Lf8axxjm6sJsWfPz5DS3n?=
 =?us-ascii?Q?QiqDktaBLyIQBDREp1AWDnqbXnpnjsveCtRMrgGmu3hknkMOoYRvIw4qlvdI?=
 =?us-ascii?Q?S4JNoNMpnxJbiiuNPLXpLFchfX+Dvhy6vvsSxzdSZ/R3uPqD1veRjk7jAtvg?=
 =?us-ascii?Q?gh83I7dSc3BlKvme3+C8TNwBlZj8idJftyTlvzj3f6pc0Js9R9wj9Ck02+Ju?=
 =?us-ascii?Q?meQwVat2dgAbWMwvy/ttQuHM35KB55QhalQzWlpiBDIuq64tWHLwANA5MD0s?=
 =?us-ascii?Q?uKbNfLek3NtafCXCVYvkrnaCTdq/DfNQLcpkCBBVsFbfmpXl+1wOYDrFtXgY?=
 =?us-ascii?Q?10R8ecLximavE8rbn44KQKCxtgO9u4HYLHIsdLtc75j5220Dxys4ofyEzOIv?=
 =?us-ascii?Q?U36eRleK8aV/uPfuwex3pUUm+BhiZhmYcqhF744oqQOv54xgFXBwmFasoGqA?=
 =?us-ascii?Q?635uT6ZIXMjF7dT0vP/Ixo+SZ3llv0Odgz5g80qpxffAcJut5C0KUIp53TjX?=
 =?us-ascii?Q?lyPlfjJaA4X1Ytdkn02FOIVvVa/gjqqLdcofXN7Ca7t2At7qZU+4QA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 03:16:28.4007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 366d968c-ea04-4327-680c-08dda7040674
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6791

CIX Technology Group Co., Ltd. is a high performance Arm SoC design
company. Link: https://www.cixtech.com/.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6..f258c1f53b3c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -306,6 +306,8 @@ patternProperties:
     description: Cirrus Logic, Inc.
   "^cisco,.*":
     description: Cisco Systems, Inc.
+  "^cix,.*":
+    description: CIX Technology Group Co., Ltd.
   "^clockwork,.*":
     description: Clockwork Tech LLC
   "^cloos,.*":
-- 
2.25.1

