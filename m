Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA411C139;
	Mon,  3 Feb 2025 16:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738600136; cv=fail; b=jc+Pv4b8Eo45pp6TGqmFkLU6z0NiWh5WYDj5mLLoSH1GDhTobRZR8hiYO9tgVuNa2KL1TmcDJzZ1/XZugLIb1ntoOzetjRQPY/r90jitGbWXGDgwiTHiCzHpbNeYB17qpDmAYzKNX0vMlJtgE9PNN5XLwmfzbl0CQQlnnnlDYCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738600136; c=relaxed/simple;
	bh=C5hlIGdhOGQd1OaGR7kNMVe8tpjXO1KlhfoytQjc/VQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qeRqCKEQMzYZ3nfGg2jrgYpNLWMn+hK8OW8aggg0kui+S5BkHin96vJ5CNu0nVcX1RZFB4BiPUUONo+rJbITQfcqdeZN0TZMfuxHEIZarRkPxXq8xRXkEG7BxXKbhZro9yGp770OsNSoDhHavcFPtRGWXx65tRkS6VroCA8bI8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=c1VHUqpU; arc=fail smtp.client-ip=40.107.243.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="c1VHUqpU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VALuAUPj7rFyzICXphnGUU1H5BLNrp12LLl/l5qRkqM+T6GRtuVKlO46ofZJJ/4ZpQFh3xutqTsNu9pQiy9HJykoed+DEYI9+HwYntqIUIKozfgyYHkVESM8neBSOXkAStW3PsGd10LAIoWqzMV6Io3fR/Rag8swyG5SUAshMN6mi0N2BgXUlkN+12Od34VNQB4GzEtKdW/FHRIIuKSIZDFq34jj0Fz7PnjFnNJp1dAAKQnzSI5e5UEbDGMdeAjCYm3aPRMbtFNHEdZ2J1Ez+A8SHED08KYCjKEDsBXBxJNwN/j1+nC7i+3Ken+rXFLbVZvNXe7joIaLMFz3NKnXBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xa7hPsHbrr19gDZ8WIktwGpfxAZzfbgQrgcJQ7ZqjH0=;
 b=Zq1HVGxnj+QEJ0E7aJmg0HqkznvAbPIjhhBXnlNFbs3MgD+ESt/OmyftSEmccezDtonM+TF4a5VTnX41OyFTg1cBvk/XAFUjuLmbafXAdcLIFRPVScNRlRtPHoomTY5RLbCMvRK8O5w8PDbqg/qGS3nGAXrY/0inEIQRiG9gqFJokVVmtE9JiQKijepuinZSSYEGw8OQJixcI+IOPXmnfZJGssgd0QCC0CPstJAKrJox8xQum4669ecl0f0a55I99P0YJyBM4VxFt5L7azJzJ/cDPh4amgTGz46zsLnpF4hO5+too4BJLJ2WSPxJCiIei2BPdCXZRsWp0S6WVT8TCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xa7hPsHbrr19gDZ8WIktwGpfxAZzfbgQrgcJQ7ZqjH0=;
 b=c1VHUqpUmgVT1d/ej4ag22pHiEdS/4dMv+sST/a1PmxHMl6amJfvHHjjC+kW2seGquh1pLH4cLNXMGgPNjACPpt6cjuI91oU3pl3cjjnFGY16SdCdQG3MTKJI/Y21fmX9vf8aP67RCYENisvD8NyqZ40PcatpTRZSbwTHSGpizA=
Received: from PH7P222CA0008.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::35)
 by CH3PR12MB9394.namprd12.prod.outlook.com (2603:10b6:610:1cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 16:28:51 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:510:33a:cafe::89) by PH7P222CA0008.outlook.office365.com
 (2603:10b6:510:33a::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.26 via Frontend Transport; Mon,
 3 Feb 2025 16:28:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Mon, 3 Feb 2025 16:28:50 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Feb
 2025 10:28:48 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Sean Anderson <sean.anderson@seco.com>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>, "moderated list:ARM/ZYNQ ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 1/3] dt-bindings: xilinx: Remove uartlite from xilinx.txt
Date: Mon, 3 Feb 2025 17:28:38 +0100
Message-ID: <aa0b7f9a851c6b8d11f37050f84e0ec69cfa72a2.1738600116.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738600116.git.michal.simek@amd.com>
References: <cover.1738600116.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151; i=michal.simek@amd.com; h=from:subject:message-id; bh=C5hlIGdhOGQd1OaGR7kNMVe8tpjXO1KlhfoytQjc/VQ=; b=owGbwMvMwCR4yjP1tKYXjyLjabUkhvQF77ZrSx1um3nVt9wuUez8fqHZz/dMz1Gf1Hj1bwBL8 J89Lvu3d8SyMAgyMciKKbJI21w5s7dyxhThi4flYOawMoEMYeDiFICJuL1lmF/0/eyEDxfN1oQt OP703O53oc8E0tUZ5hdPMZ3xw/x7bFwqM6Nsd/iEU2KJSgA=
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|CH3PR12MB9394:EE_
X-MS-Office365-Filtering-Correlation-Id: bbab2835-57d9-47e8-2f4f-08dd446fd789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ie1Z+xYhANOBqSnfAqWgXA+QElIlUM3XtQo1o5pZop1NJh838rilO1OrUcFz?=
 =?us-ascii?Q?yUy+OcdNpWt0TRgojLHs0S23gWSfX+aD3cJaKFKzVJSsfVEaZSIMzwg9l9nQ?=
 =?us-ascii?Q?1EJumCOcBOqrRxBmUmNFI+nBtVoHyDIO+Z6JwRDVWh46xHZ7qKoOFoCuEytg?=
 =?us-ascii?Q?qzuMKdLTjeOhReT5nRRxOZTPXlJGmVT+iPDJ6PQcBxB92OPP/M0cHyMiN7Vp?=
 =?us-ascii?Q?p6NFcYbTzHrD2CQ/6v7sdn3h4S6gsyoXswh6OhSNiRIBn+VM3D3t+hrEouvi?=
 =?us-ascii?Q?1rgyZlpdMtq+NqJE2I87lhVdMyNao6RSi7PyOrjLw8MSmujms3X134HLSfm8?=
 =?us-ascii?Q?fHCOdcRG3Z8lWUE2snw6BDjbkVcLWmrMO/krbh4gkvPrcAiK/mQaYYtaWmxQ?=
 =?us-ascii?Q?vlgTNrA3SEUmy9KfHzRmLKhVTEtub9WMpjNkO5fTW18FPa8ad9FLt8qLuh9+?=
 =?us-ascii?Q?hCxt88uEwDSFVggq/BYr8WkCDB+fRwCbdBusmFaSUp4XQMcjZxn9/yX9xL0y?=
 =?us-ascii?Q?iyL3Xfq58QOVuhWd9MfdF2S+Ca8LCdppr7nNLiKvHnFN72MTiqyC1V0FcRyp?=
 =?us-ascii?Q?tUzIgvdmgYB2yvKazA5NusLtpIZ+U7KbP1I5hffDQMOFFubIPS7gumZlzl+7?=
 =?us-ascii?Q?wF53TnkZz9pWHgy/MIs6wWVJSoXPOeQV4r0wTAawBbcHYMmf2xvRps6T8qEc?=
 =?us-ascii?Q?6ubfBWYTRZkVXbcnNWwG+3RuLfiF0jBUVSHGiqQZHL0bWiEh2FnOD62cbWQK?=
 =?us-ascii?Q?MLfAwJvQdq3R1Fckea8ycUoGEA7vFUnj8q/11CUCPDckJnUxNayaDu7n9u0X?=
 =?us-ascii?Q?ek6jXT1aK/rLMt3uCJWEHYN2kBfLaQu6EsBqJhr5e3SsVnriWMsADLK90PD8?=
 =?us-ascii?Q?NwzMTxRooVl4j3LqdiW3MTJZnx5l3IPt+2v3AmG44JXOBx28NRqerRoyq0X7?=
 =?us-ascii?Q?WiJsJ1hDn8S652QkQ4GU5EIpK7HSjhsQxYL3gCps/ts7akmObajGOjS3z4Eh?=
 =?us-ascii?Q?Qhjdn8bPi50osgo8vhtOQ9lpilsCjbOMU7I3VFC1ZUIU2Syr56nB22kAGsfS?=
 =?us-ascii?Q?/fJ9xLzC5wZVcNAm4E5lBedpg7/UfCd5zdKlATjYpuwM4OYPKmMWG4ZUs+mK?=
 =?us-ascii?Q?95ZaAZJ5iHimy6LOhtxJSim9kmOEOptPfRzAKBVvyrjYgZmuAji/xU15D4dr?=
 =?us-ascii?Q?ayMvOe6V/Isv1NPNYrDZsgZrZ6Y4XeRcgGKFnx/gfnQ6+eALTbwlOwB4ZgFc?=
 =?us-ascii?Q?HwFNe0WhMAvsqKiNTT9rRIwjJ+0hssdMnOM8rM1IOLNiozvprTCQmgWZGt8l?=
 =?us-ascii?Q?gCnfdlDfu0MPjrH1oq/fBTchOJoXSp9me5lZPyvHGPFybT2jafz9YUAh103p?=
 =?us-ascii?Q?b26nmbMqrlxKNFpBC6vG4gWvSRciaQj6xi+warqgMWS7i9pCXFcFPXZNsxGY?=
 =?us-ascii?Q?mY11LT6TDUE7KcWqeCQB0RqSIgjb3IGBnPKzJGmH/v886p8sP/lvMAbbI5mr?=
 =?us-ascii?Q?kPKiyRlKmzJPOlI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 16:28:50.3847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbab2835-57d9-47e8-2f4f-08dd446fd789
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9394

current-speed description has been added to uartlite description by commit
3de536a8c365 ("dt-bindings: serial: uartlite: Add properties for
synthesis-time parameters") that's why no reason to have in xilinx.txt too.

Signed-off-by: Michal Simek <michal.simek@amd.com>

Fixes: 3de536a8c365 ("dt-bindings: serial: uartlite: Add properties for synthesis-time parameters")
---

 Documentation/devicetree/bindings/xilinx.txt | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/xilinx.txt b/Documentation/devicetree/bindings/xilinx.txt
index 28199b31fe5e..6af9b67f9252 100644
--- a/Documentation/devicetree/bindings/xilinx.txt
+++ b/Documentation/devicetree/bindings/xilinx.txt
@@ -118,13 +118,6 @@
       property, and may include other common network device properties
       like local-mac-address.
 
-      iv) Xilinx Uartlite
-
-      Xilinx uartlite devices are simple fixed speed serial ports.
-
-      Required properties:
-       - current-speed : Baud rate of uartlite
-
       v) Xilinx hwicap
 
 		Xilinx hwicap devices provide access to the configuration logic
-- 
2.43.0

