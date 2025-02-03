Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BEE20B20B;
	Mon,  3 Feb 2025 16:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738600141; cv=fail; b=k+4xzLE+4C3U4zCJNV6vFFEo15y+t7/VCA8O4a/qEQ5gXfj89eyAUKLlJ2VxF/+X80HbbQQxQPZAHdNF2Xs03JESYGTSjv8KhendMkaGSsC4ATVn6N2RAZt48zT+LcRTIrYgteFr5TdnB0ng4W6KhSPapeMYedTgZYQQYHzawrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738600141; c=relaxed/simple;
	bh=mJlDzxhjJs8N0fmdzh5x/eu7sR2L6QOGiKS183/ryuQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kjA2QK3M7qzHprFC/B6SpgTXpmrGnKtG2CGuD3UT3GLhmPZMNv2uZFreEZhCRNVR5ZqF4/0u2htp8omPoKdxhld/P+s3jC86+yIaKbVSF1Zm+oEm1RJ8eO02w3wWKKz+cZaE2qs7iRrUwNVX5krosOpIs7Mb2e0Mlj8lRAO9qdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nYN53bvL; arc=fail smtp.client-ip=40.107.94.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nYN53bvL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hXaDPOWcZ0GrVuXuEpXT873sjj+ULUXPDWFj7HIdJuAxjFG/JV8KPSqtAGyoVcQCrAB2OctKXgT8jWNgpFZoPw06y7ncn4MPXLsBZd/OobtwjCCv9H3Xg0exYEtEg7v7Q0tdrcBSwi+7LXzxfuZr8FeuSm0hyAdqSZZcOdyzfMeRL2p4Z9sIRGDKazd4vIKT1WYF11WQbn2gkfGFIsdGSEk6YWSHrsimkYmwgOv7gZHjzGg8+dUq1hrDWGZZ6lvPmAjgyj9qvxOjrFdqsiutMW2UOSKHQtPLXjl2Mj6Ul/T3v5vTdh4/5xbp0gw37Kl0WbSxvQJX0cyVeKLGrRgVdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UeQYILcfYip9FhCiCMG+KMdTiGtKK+RZvWF9OOu3CcY=;
 b=JJA3ased+G2WC0Lud0bnaj5rqAXFSa8Zq90ZFlYo+orpWdg+HilmXO0nUUmt2KMWj34UhpgmTYbxzjlLlJNewOBNEKbAWW1+E81oP7StvcvskiMZ7hbiOOC13XbGTmrSdHltfrRgRh1YOBAOhvwyCnMLWcxOBZ4+dbFtvyjj36RHXOUMWDHS4lZX2+ZLgqO7jlQzKSG4z3y8+UNHuNTZvVWYFBMKYOiFLYSrWaAGikjYAvAnni+I6OYOoI7ZKpdPZfUtjj6q63d4mCynGuxEMHa48bPjZX7zCjIzFbfDmQ9gjhHUXpnjOmwuI4pI2EReAKKPVygb2oFb/XgN3GmhMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeQYILcfYip9FhCiCMG+KMdTiGtKK+RZvWF9OOu3CcY=;
 b=nYN53bvLmYfZwewiQz47mfNa9lghvsSupeuxKSP2FCFFp0szZlLZN5iMsISgRtzFuggjHHrrhP9MiSXmL8sS2jYIS5UgHEKVDsfuwjA9MYixOvzjNLvfS5WGm6ZJiXF8QTIOCXsDV8jVARuxSXyUXCvoRm2mwRYzdzd/KauFVrE=
Received: from SN7PR04CA0234.namprd04.prod.outlook.com (2603:10b6:806:127::29)
 by DS0PR12MB7702.namprd12.prod.outlook.com (2603:10b6:8:130::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Mon, 3 Feb
 2025 16:28:57 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:806:127:cafe::62) by SN7PR04CA0234.outlook.office365.com
 (2603:10b6:806:127::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Mon,
 3 Feb 2025 16:28:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Mon, 3 Feb 2025 16:28:57 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Feb
 2025 10:28:55 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 3/3] dt-bindings: xilinx: Remove desciption for 16550 uart
Date: Mon, 3 Feb 2025 17:28:40 +0100
Message-ID: <d90a839566a56df6a0c3b203f701bd863108d047.1738600116.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738600116.git.michal.simek@amd.com>
References: <cover.1738600116.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1189; i=michal.simek@amd.com; h=from:subject:message-id; bh=mJlDzxhjJs8N0fmdzh5x/eu7sR2L6QOGiKS183/ryuQ=; b=owGbwMvMwCR4yjP1tKYXjyLjabUkhvQF73Zc4fRk09tiFx5jG+m/QfThRlHpaSqLV8ld+dNSH 72D3+NiRywLgyATg6yYIou0zZUzeytnTBG+eFgOZg4rE8gQBi5OAZhISC7D/IQ1Dmq35ebEFvF2 Lpu8Se7wMvXuWIb5WZN79v320atKW6XvpHrF9+cUTmUxAA==
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|DS0PR12MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: da573f1e-5372-45bf-9917-08dd446fdbc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/XagpagSyfqO5hPOgCJhqKYyxcrK9XQYIYckko7fKAxG5hCdZLqUdRD3AxNm?=
 =?us-ascii?Q?l8gNyXj02uGe0Ja/7RIY2DBvntxye4oLvl6kEa1WMPLK3iHFXpiT7rGxr7lT?=
 =?us-ascii?Q?xxfeMMTKVhSpa3ZPVTimnsSwaYQ9iiDaPQ9VbEPurGksW9XRJPWRi0nfZbVH?=
 =?us-ascii?Q?9Q/J3DOrA4MFQkXPaDtZ9yDOVKG6PFvsuLKv3HGcilZp5vdmU/AX8HH+NCDE?=
 =?us-ascii?Q?XxKdnDV8H2x/AGvJ4Hib086pjeFu2j6lQkMNJz6x8xobzYEEyza8AVFq05eG?=
 =?us-ascii?Q?r+dOExTWXgqHIqFFAAsSbnLv08s4HoW8K0Y7B8fVItkkWQTf0qUSYsb5/dya?=
 =?us-ascii?Q?hRSBJUqOaLuK/pbXyfso8Uceg2YVvv1T27XiRZXldn6t+7mlcS3ydOtuzsTz?=
 =?us-ascii?Q?gY3uHbXj3PX1mlv2IrtrfAPqpbkMDyDTeZMzmKszZNEDvcl4tNADITb67xaG?=
 =?us-ascii?Q?xBDZ2wJl6f9hf17DPwtH2mbz/u233UBPfZMUNaUpyYUcB5tAJEiwQHXTOOgE?=
 =?us-ascii?Q?sVRYGBp3SPloR+gvWrae8WTTnVYxJvzC2liVzHkVxdsOP4Tkia8wYTkZ8RqX?=
 =?us-ascii?Q?dJO7gI+LSfE8T5ed40oIbqC8zQAdMiPHLlvQlx+kjE1BeGrdlBpwIPf2lUk5?=
 =?us-ascii?Q?CJTIozxc1vL6/71JeJMvzGwcn2/FCJKSk/CsdAP0UB4aR/FqPRzc1fh6kwHZ?=
 =?us-ascii?Q?KXS++tSrQR9aVthaN48tbfpGcr66iePto/Rny2NN1GNPWUM2VOPf9mIIOIM8?=
 =?us-ascii?Q?WX6xapfdX9IvCZpC8+1DiRp8j/qe2Eqp5EmV11PdC6FdshiLOn3L9vm9hWFs?=
 =?us-ascii?Q?e12RGxE2kGvew5KB1zFdydBxbfjDKQS7uucHbu5u/yEAqGxCr40rKBxGSVhY?=
 =?us-ascii?Q?iD+WUEZkHzO5KWoeF8EpmLzYET+i9/9Xk6tN1tsbj+iuhQm86gprO2q/0bmQ?=
 =?us-ascii?Q?C0j1GwTRTFO9lAd5m+r7YIbdf4qBDb4Zwa2aBnjpCmKp87/SU8R/ZxxjaaZS?=
 =?us-ascii?Q?wqG77zLkh6dTY7O33E3pcmXdhrcQth2pDNYtkqn76Koqw3QvtQ4NGCbU3i0t?=
 =?us-ascii?Q?JA4Vqc5a7cYk3AIeBO4uwtNVOc/TbMHa/FJvUokijJkYwNFmjtFln/OTC0S2?=
 =?us-ascii?Q?BBAcY37KrGs9scWqRuhSa4DqxknFKH56ZQjNHRxW9aDAHQfbRwSi9wMvqz2b?=
 =?us-ascii?Q?dsxm9aBfhqLMo2FYXz1+R71vlQe0kDp5c3dmGYV7oPsFUZAhSYi0SwXbRa2z?=
 =?us-ascii?Q?zJPyNDCadjT1DEBLB1hFhyLZOWLibxanIyrFsAxv2DAvrBnTEk51d47gv+ZV?=
 =?us-ascii?Q?4l+aIECE0biKducNWRk+ckAFAR807alZ9diJsQJq6R1A3SyzNDpmu9npkYrC?=
 =?us-ascii?Q?M2mcWTV3vUpbfmXuaCaWUxOQ4DkWQKE8kuGLWOkNkD17jWF+Eu58nolkDz58?=
 =?us-ascii?Q?rLXvBQHsMk9tkUU3MZnDTV3QnSwi0ziQUj+Shjs5P+0W2ZF36jWVQinnJ5XN?=
 =?us-ascii?Q?9Vnkt9IG6QhpLwc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 16:28:57.5047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da573f1e-5372-45bf-9917-08dd446fdbc7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7702

Documentation/devicetree/bindings/serial/8250.yaml already contains
description for mentined 3 properties that's why remove them from
xilinx.txt file.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 Documentation/devicetree/bindings/xilinx.txt | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/xilinx.txt b/Documentation/devicetree/bindings/xilinx.txt
index b788c9928710..0ee9de99b3ae 100644
--- a/Documentation/devicetree/bindings/xilinx.txt
+++ b/Documentation/devicetree/bindings/xilinx.txt
@@ -125,16 +125,6 @@
 		- compatible : should contain "xlnx,xps-hwicap-1.00.a" or
 				"xlnx,opb-hwicap-1.00.b".
 
-      vi) Xilinx Uart 16550
-
-      Xilinx UART 16550 devices are very similar to the NS16550 but with
-      different register spacing and an offset from the base address.
-
-      Required properties:
-       - clock-frequency : Frequency of the clock input
-       - reg-offset : A value of 3 is required
-       - reg-shift : A value of 2 is required
-
       vii) Xilinx USB Host controller
 
       The Xilinx USB host controller is EHCI compatible but with a different
-- 
2.43.0

