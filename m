Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B944320AF6C;
	Mon,  3 Feb 2025 16:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738600136; cv=fail; b=T0DyJ7yQuHVGlRb2tjRIIxYh/FXEK78ejaBvcXLjvER1yKb1jTyzzpMSCBHMij7cwiokvZ00Heaq0DoesiDY+HEoHDk+Brb1+z5UgNXqUVoy77PUdoO9kc10tPe8X12ajvrqRQ+K/kf9E2qDAWkThZsfK15rKVTgOMW1F8f1A+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738600136; c=relaxed/simple;
	bh=OQxmJQKB/e68BiZhsGIhOOee1iuL82aZ9FwE3Wmxb+I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vj4hzdkPHJLk1PlXZ95Vp+W/J7AdaZmLRERmbLlmhAfjqkiJmrWoeJNRZIsnz/rx1XavuJlbPcLr7og80Xh2IwqLwuQPKLQSLAczOghVnoAhVuLgsypV648WaVXuNI2EL3tvuu438MKK4gRjxANaw2CsxbXp8f8exbMQyWbakEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ihDiA4wx; arc=fail smtp.client-ip=40.107.220.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ihDiA4wx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P7bOCShtRsHqB46BBNABWUe/cWY/KCg4kVzft4nqLxe7DjVqcGbkxV82WpTTvfXO8gysM8/QZYIBEc1SwV07mz1FGz/9odGSE+S1a2RzMTDetAR0pJt4erwhrsnttraJloi2h1NdTDjVzPdKG40iWHJbdF0IDWNqpIfFOJ0zkay9T5UvYGc11WnVXzFDhUVGN3VJ3A3tGCRDIxmI9OQMM9/obHP7HmUzESCENcnobPb9y8L+8JMiKmMZUJT64q76+BFteHuXPNvFt0iWKt6XR8RAzNTIh+gWG6fq5DLzAEIS7zgNwvDFuPm1hDvasoNAbGpGZHtTV5kUD7wkdyCRbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFWzXmwQ/ExPVev4NThikuTIcTHkHTtChwmcbERXbbg=;
 b=JZYjK3ZhgUDzyO0CoXpeBV2xkyPoTayvIDjPzaDASHgW0fQfLSPL3H1W6A6+X12A09HkaYKvahbiDUOvnXYIYPwKzU6jSlJNPVRA1HXPw+VHG1U5u4OA9KwtCLk0mTtnAZD1HMb/DuSMh8KNbS1754ENBTR9sSM+iWABaXGewgrYLGrsyBN74T/J6rtOaQ14OJgMEkF3I5fAnFu590GYn7Mi6Z08P/QCHsjm8lLhfUlXJEQutXHuYGOujcnJgJ0emRP0Um3nhtybc0mwAFZGJwftwZ1mcEUbsIt7pJo4oDGfwbjf7Zr7A1F4YAtaMohae/s1vOnQc8z7S/uD3ppWsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFWzXmwQ/ExPVev4NThikuTIcTHkHTtChwmcbERXbbg=;
 b=ihDiA4wxabFRZEEOwmxKjgtTi+nHX4ExQegicB2eZFRbQdT7C1rUuzLBccxu5R3WxAlYoUSMl7Q5zE+RFwtC24FDapSEbz/GmLfLDw0tWPcgBOYlAKLF1B+MyKDDViWMDnzKLhTANCF63KjQAOSA29An+/VARsImhtanXDR3v1o=
Received: from PH7P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::14)
 by DS7PR12MB8323.namprd12.prod.outlook.com (2603:10b6:8:da::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.24; Mon, 3 Feb 2025 16:28:49 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:510:33a:cafe::d0) by PH7P222CA0001.outlook.office365.com
 (2603:10b6:510:33a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.25 via Frontend Transport; Mon,
 3 Feb 2025 16:28:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Mon, 3 Feb 2025 16:28:47 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Feb
 2025 10:28:44 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Sean Anderson <sean.anderson@seco.com>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>, "moderated list:ARM/ZYNQ ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 0/3] dt-bindings: xilinx: Remove old descriptions
Date: Mon, 3 Feb 2025 17:28:37 +0100
Message-ID: <cover.1738600116.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=510; i=michal.simek@amd.com; h=from:subject:message-id; bh=OQxmJQKB/e68BiZhsGIhOOee1iuL82aZ9FwE3Wmxb+I=; b=owGbwMvMwCR4yjP1tKYXjyLjabUkhvQF77YxTNxUz7laYfZ+julrSp4+CxOPkUipvs7hVuS7a VOd5vbrHbEsDIJMDLJiiizSNlfO7K2cMUX44mE5mDmsTGBDuDgFYCJ3FzAsmPlueZ9jgsCvzdH6 zhm37NZJmt+xY5grOVk/tPGVuOe+d3Y/Cg7KapzZpLUAAA==
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|DS7PR12MB8323:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b88aa2c-f5e7-4560-dc5c-08dd446fd612
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yoMmPoJE9rgtDS6mDpN5R79RxfSlHXN40YVKHwkdp5YyDrgp2R0nxz9ww7M+?=
 =?us-ascii?Q?kQms+PorhaESTOpHg/wNRAjzSGexwaHRt77k7Xja+UTzcx45qkivCtNZfZty?=
 =?us-ascii?Q?GHb0kr6CZug4Kck6XD9uAMixuEIpCSirckZE/MoL9JPKKjNjk1J1UAUxthlG?=
 =?us-ascii?Q?+jdi03GeaF09gpilERJAuCfdwITX4cAeTRgAc+sbsQwW6wA3V8kpTMpCSu8Y?=
 =?us-ascii?Q?qBKAMNUbsKzZkAmEWDfCeCSY5KoQvxCW4sxn07SIUNTcZGV0ei04l9CPL6HP?=
 =?us-ascii?Q?VJ0C4+R/hTbb3tFsQXCV6Q+KYBbYWHKykujstk0VSwnRXtWMfaWIMUfVX/nH?=
 =?us-ascii?Q?ZdXLEky2Lk/M2wTZ/9G2+NPL/W9bz4eGZ97/bKsCmEhigW2TWE6Cc8PEjUuq?=
 =?us-ascii?Q?nnR1CiLkEebvRB73h9iCxn/K08E/ghscUag7TnZA+uKCx8rSxVgWgM2o3YCn?=
 =?us-ascii?Q?ym+h0hOEwWQ1Ie0kdsioGumjGA3/NRdNJC+GswcFFhFZAFL7r1dQSg66ferR?=
 =?us-ascii?Q?Sbo8QLri5ca6DR+hq4Ti8Cx0AmEimMqztcEi2nKzCN7ZIY0sHPf87tZXTC4p?=
 =?us-ascii?Q?8tCBUE2zYdLFMLzKZqm1VvoCEIFfH4qhpJC8xS+0gxMOo1z97G6my765ul99?=
 =?us-ascii?Q?ATvW7A+5Z8eKrLXsAKnxHrieyYUFeZJv7mHC/gfGBJ0xFTHeZcm4MzJO7Oby?=
 =?us-ascii?Q?fyv+51M97YNidWqm6RZVM1ldNQBkWDglg2P8zelodRiIjOhQiRZVD4csoGJG?=
 =?us-ascii?Q?jV5hoqYxb1045wH3/RhOcRnls+azR+oKhZi7naXX9f+EnH/8NLjMu8WNtVE7?=
 =?us-ascii?Q?BgQGXrGSX00JnivLkvqXNixBi8FJVDkkwah+0KXBufySHxjiVQabvHJvU/h5?=
 =?us-ascii?Q?tVzUPx1UKunbgz2e0s83XzQHv1V2WK9lfHTOyK0u4HaE9O7n1lc2totuOETw?=
 =?us-ascii?Q?h8SS/vCi4iU/g6751NzfNmG4bSEF8ugqo30vmy+plJRWj4fc4R3L6WdpMMJq?=
 =?us-ascii?Q?JdrkS/llogEEcNRSNSXKdiqtKnkJa1rk4Ma4ASrdcgpTp+CylDnA3rlWmsRK?=
 =?us-ascii?Q?MkYeAwDfMW2QC5tPav66+pX6zuHaS6zHfBpyPNFfNrjVknBsTC7eXkmzbCaj?=
 =?us-ascii?Q?yUql1ya6ssloZYKlEhjaSKvGvdAODFPEyRgDITgRv7cbZJtpb4pxzBqm+SIl?=
 =?us-ascii?Q?Vpzn9ViL4r95C7WCDEuO0koInLTHoEsR37P1wISbbj4xYXOiRcPK2713pO7O?=
 =?us-ascii?Q?tNq3dL2LlkWWxfWZlmbD3eVKnafNWV7klYfG/aPd2/NO9xS3t1kNcsp/FEae?=
 =?us-ascii?Q?NdMpEG4KbXgtTICfhoMl9XHRRyNWGpC3MfwGSyaEMZY42InJ1jSMgs4rVWJo?=
 =?us-ascii?Q?1/OJpvTbvr4IBNlZyotzahdw6L8q0QhX0agvi5KelntcvI3BdAyb2FlNsokd?=
 =?us-ascii?Q?ZnMB65BN2yV0wJurowbJtc4hLvlxdIPANcTxCoTwJHFEsNkSaFpVmw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 16:28:47.9316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b88aa2c-f5e7-4560-dc5c-08dd446fd612
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8323

Hi,

here are the first 3 patches to clean up old xilinx.txt file.
Likely the whole file should go away but one by one and this is the first
attempt to make it smaller.

Thanks,
Michal


Michal Simek (3):
  dt-bindings: xilinx: Remove uartlite from xilinx.txt
  dt-bindings: xilinx: Remove description for SystemACE
  dt-bindings: xilinx: Remove desciption for 16550 uart

 Documentation/devicetree/bindings/xilinx.txt | 26 --------------------
 1 file changed, 26 deletions(-)

-- 
2.43.0

