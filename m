Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010048.outbound.protection.outlook.com [52.101.69.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4118202F83;
	Sat, 14 Jun 2025 22:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749939246; cv=fail; b=oAW7n5OJ+7atS5fmsmIaDMVRcEKC5xADXV2YWvNr1LCZJ0U7VIpv0y0NpweQbD0YldlS+H7OQJielM/OiCzXrKJXflfXKTyjjcm9k10xoopVA4CkY2LvcgnxMl2727y8MY1vgrn9tvKUL+Vzm75DtLGK1yd2lMSj6C1s8eO07Dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749939246; c=relaxed/simple;
	bh=8Cvqt+DlgCs6UfMI57DwJDOmtXwSFov8YMFlws4Jcf8=;
	h=From:To:CC:Subject:In-Reply-To:Message-ID:Date:MIME-Version:
	 Content-Type; b=b9SE0AjgQ/r+u7LhaP5yg87JaVv9tMrus8oQb1X1cnAqM1LYhwaIQyMKX7fub6eFFzUaPR9icztJPbzhwinWyJ0K7Xxnnl6tQ6DieSiqbACluoqe5S2V1SJ3V2L9F9C7bsegXiImilxDHqiHdGr+cRED5hRFZeTKizEgMkrztoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=BosixLYN; arc=fail smtp.client-ip=52.101.69.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="BosixLYN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXdUUeJSEUGuB8rmzSi6zg/mSR9a8Uk7quQcmDp0yt0o7kbgOi8OhBYgAffgV0YglD5wJjwP7peABWs+51wOO5FVgvMV+zY6Jln1z7b5Y6tcUYzfDdV4M71z6yT7uAU2CRZXACcwfOc9T5Dbr3hV6K56PBePoR2uDENG/t25BMTwhv/3i9hQ2eymmcop1gygPcd0ZjHtYtzTnuoGl/dkpND4w7IHiTsdszCr99rKgaimKeNdrgAVK2hxez7Xvu9tcQrYnzIVRu9hBPjbrXX20EybFP1I0Eq1/hOl3mcUF7LIa6agHRC/G8sgCQaE0+DK6+0odYhjKVNxrHwmxMOA7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVwEoEC0fY+Em7C9JXGqVPn3fxBq3rC+HEuONmSmGOQ=;
 b=VEBYE15ncPRRxwqL66Qj5vjvQU+WfFzwdd4c19E+NoUU7/bqNEuVh6q+Xl18EThOQIHKMIMc6uIPoBu1ALvmvRN2U4YbIvLFMPLUkuFRfMA8ReWrsxVVg4b4yB0mvBQ67wqJ49AXpwWHspADArbJLNosbsKbmSwa09isuumxpeR96DLGMsEwBr4R9X6jsAmXn+pvVvSb8ZZnxX8Y2yaYEbx+GQ4x40MnCcYpvYgqYzEM9qgGe4AyVUA/FEMFClcNROp/VQnn4XYH80NfTDFiJzR9NrqXgfhqXjlZnSxwwofET1BIluP0FoA0y4ZKtvhDjigo8serrTvKhl0lePj6IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVwEoEC0fY+Em7C9JXGqVPn3fxBq3rC+HEuONmSmGOQ=;
 b=BosixLYNPDvFCPMXKGwciw2sXd7G7suxBCxFNI3CgP7vUjzTc342w12wv+2RYe6cY0L2CxrnzZ9APEyikkmmbdEUXvz8QyFE5GT5LQP8VSKRzUDV7hv43+rbWaPZQKemuU2qkZUw+fNMzMmU4duCigEDeMpqD4gFLZBFHhWuxWg=
Received: from DUZPR01CA0109.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::28) by DU0PR02MB9146.eurprd02.prod.outlook.com
 (2603:10a6:10:465::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.22; Sat, 14 Jun
 2025 22:14:01 +0000
Received: from DU6PEPF0000B61E.eurprd02.prod.outlook.com
 (2603:10a6:10:4bb:cafe::61) by DUZPR01CA0109.outlook.office365.com
 (2603:10a6:10:4bb::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.26 via Frontend Transport; Sat,
 14 Jun 2025 22:14:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B61E.mail.protection.outlook.com (10.167.8.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Sat, 14 Jun 2025 22:14:00 +0000
Received: from pc52311-2249 (10.4.0.13) by se-mail01w.axis.com (10.20.40.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Sun, 15 Jun
 2025 00:13:58 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: <kernel@axis.com>, Rob Herring <robh@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Nicera
In-Reply-To: <cover.1749938844.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <6d6705440a3c28ed4c6746dd570c7a7d8b6d3641.1749938844.git.waqar.hameed@axis.com>
Date: Sun, 15 Jun 2025 00:13:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61E:EE_|DU0PR02MB9146:EE_
X-MS-Office365-Filtering-Correlation-Id: bae99492-e944-4033-b2f9-08ddab90c40b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Sp7jG6zY8yrbpPlrXXcyWoVUuJjzGGyBTI98Ei8iq7g+NhLr8K1WiNt8RBQO?=
 =?us-ascii?Q?S6DroRlxvn5ou0dN2yjCqsNwrIszXTby1fZqmGpClZDWiHI04AG68Cy11LWU?=
 =?us-ascii?Q?tAhXOjmh6rctTdmW49HWNUPBoVTgsjhA4iR1VUsw/noIH8Q8R3ctKiMJ+aTK?=
 =?us-ascii?Q?Lq4L7sFlxucVO0qFnfEBv8ytuWrKjg5fj2oJfCh19b1lWfZcNSpH+tcaqSfC?=
 =?us-ascii?Q?tNywq8zCmwbKac+aTpjeGQA7SDmIypCd4kvBokIv35nE997l2trwfrc9XSaA?=
 =?us-ascii?Q?JiVz2n80f+6j3WwL51YFH02RXUATBhnR82jPiLJMsyng2SIqO+I3kMiR1Jtp?=
 =?us-ascii?Q?CyAn4AVi+2VmH8kPwKhPHfSt6/nPpZa4J2EIxS5hpwBfPhfKEtSmipjP+GRh?=
 =?us-ascii?Q?RxPjI2SKTnT7B+gtsmLyB3M1faQWew9qPcF3ns8ArbFLK8CxTXan6qO00vNw?=
 =?us-ascii?Q?ncrwn2xUaEamSpg3AKJ4GmDKlgLCdUcRMvORKaO1PS29G6L4yOrfY3+ROtiC?=
 =?us-ascii?Q?D7wu9NDyo4iKtrM+nVbEozl1hXlMyKXLCiQPaeiaue02kKZu8ngI8F7QZFb/?=
 =?us-ascii?Q?oDnmOc6jOkmQlfNG6VvAEZPRo814XTOFUN2ftZdB51Jn10rKWC3ujcyqhsE5?=
 =?us-ascii?Q?wN1P3BkbsGFJJLaWJTnbtx8MOHeSdgtbjwp7Yvlg8/HltC8tszLkNkL2f35V?=
 =?us-ascii?Q?dtOIBzTj1wRr0LD4YulPCHHULle5eIh732EAAErW1rvFSQh067G7HQ6B4+AI?=
 =?us-ascii?Q?4+vTnh76W/dRPEV4YQB0NE8Xwg/kS5pe0XQ1CM2qft92oxBAvAh5AKHRXui9?=
 =?us-ascii?Q?XFRSgN/OYeSOJy4pzO63bUMfmOy/Cl8eKSRKdRRcKVBlsAH2LQqYcjmRfnfk?=
 =?us-ascii?Q?zT9wzTHZ1yy2+cY3f6t+GTGC+B6+EyOCQaEYeJpRvBODgQVOvM0Jgez22wCC?=
 =?us-ascii?Q?GPId/3WwU3Jw0nJYHVBhCQ9HjQCxmQTcuNMQVwoVwE6oTRHLMecfW4k/q4Mg?=
 =?us-ascii?Q?h0A666bLW2RDtHdLZvApysofhGH8zrRrIRA9p6Qzmuw+lCQ+cyl3gOXYoU5f?=
 =?us-ascii?Q?IfutRR1WGF26sJTSP2KhfccKseyUB8t/vgh+e+p2dlTjqR/uRU/mKofinjWD?=
 =?us-ascii?Q?8rCE6x5gbz7s3BfpeEtEFkXT55eR+qeBiYq53IDOAL43Jjjq9qf9xZ6meAz/?=
 =?us-ascii?Q?39Y2zRMo94miwXKkZUKtLCSbVjCQ2vVFgjPLlhVh2kAMQkjmabxT4tBa+ol0?=
 =?us-ascii?Q?co4uwOZcEv5HP/36a0DxmrO1P5quOmWyceNVg+/AlYfb5LRofhnMkf7TV00e?=
 =?us-ascii?Q?Hh8oQadjKZRSXVh7nqPLjtcAmDi2Za95cdQt+N4aofFq60SzwE+olaHd2FWF?=
 =?us-ascii?Q?DfVx4C6ufe/AfCqPKMcu24kv7RM92GvoxfBs9JL8RKFjzm8kzL5UxhBOfXhP?=
 =?us-ascii?Q?7yd/08zW9KDa93BXx+xYbd9LMaaIYBplozDQmfZfuPqEFsJdfDj2XYVZcbuS?=
 =?us-ascii?Q?rFSJaSYSmiF8Bza2n41m14p/8RvWtJBHMS7d?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2025 22:14:00.8675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bae99492-e944-4033-b2f9-08ddab90c40b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9146

Nicera (Nippon Ceramic Co.) is a manufacturer of a wide range of
sensors. For example infrared, ultrasonic, gas sensors and much more.

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c01adbaacbbb..b41cf7ba1b04 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1067,6 +1067,8 @@ patternProperties:
     description: Next Thing Co.
   "^ni,.*":
     description: National Instruments
+  "^nicera,.*":
+    description: Nippon Ceramic Co., Ltd.
   "^nintendo,.*":
     description: Nintendo
   "^nlt,.*":
-- 
2.39.5

