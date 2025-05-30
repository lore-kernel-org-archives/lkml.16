Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641741E51E0;
	Fri, 30 May 2025 05:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748583915; cv=fail; b=HgoogbKZhlEU724KgqOiMnk/Sp6YofJxApDthYL9UNtWaDAWm+fBQf8AGkP86WoCWPtxUQStHh9ZaLibgkDFe1pAGC6lXoE5PLKz/ilgqjZTcBuOfRqdo5/QnNTE/3DsHhv5hqqKUt4x2JqAYkDR2J9BLWZp75jT4fFZl+qnuu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748583915; c=relaxed/simple;
	bh=zpkKVUhaO9JrLXJ5n+SGfJI0/fzViDO/Al38PPIPW34=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cJ56Iv7vLE81I13qfYIP3N4z22sVC9fYEm4CUU9tWOtEJ1EOwoyl6RddXPIcHnH0aUDzZEbL1Z/pFU7mJIEDXDV8uwk3JqpeS46PHWihpUfG5OqP8DAx+HjO7TR044Bnsn70wFn3waFlkw5PiQONqvE+Nf+znGLRKe3dtnaERnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MbXDBOKH; arc=fail smtp.client-ip=40.107.223.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MbXDBOKH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2g8XYSbPwCN9zRjfGcxK07tiZ7WShK3LqkW79fm4IG+C/+OsUq4QK9vo6/GXNaNNkQsrloFeyYLMXwO7//RlTtEFBnhtI6Rv28xrF09lRNbHNKpjG4q9EEHx3upfyBBEnLuEMZSTzF/R8YKUMTerqvS3twrZlW9XOXYNCb2mjyn9aYz1HGAY2aVjcNMjpWaskKAUKtBVRT1RMfqt1U3dbzYauyIG+pSdy0zitssB0usSXdXhyI/JnaKy2HW0axbgqxxdXtfk8DG3Yhd2/IkhIWkGG/yh2r+iYKVowZtwNWJ9klfotuShaUazgpGujGbOZ5zlmP6SkyVrNLnrUO+FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+91MjBCS/9tHDoYDWLrcjZ4nAdNFJXsXvo8SJds9OQ=;
 b=GLhO3Un1oAAzPNyK9wFnrTfKpWrrdR2FYhEN/GY3zAaApL3hxI/QkZcoIgSTNTYi91lmrIYa/6Vnv9nh8A2dMNbWWwl7CM5baKuEDCXNQASw+tt5wK2Nli6yKTvBwxEeygYKA1Hz8y72dI5rcNGl1fD6pSJyGgCyxnhnghMMF02swspf6JjxnOk6F8RGT9CHT7sD/UdfwPj71JCIdP7qqh0LQfAVxs978gkFm/y32NTBztCFe9lZu1itdHjU05aI0AMQ2AqFic+71Jab+S4qPmKgYfYhoQan1qYGszheNmChcATNcgq+Prtj2DeIPwOFQq78Ljt1wxwTHWKxhvGctA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+91MjBCS/9tHDoYDWLrcjZ4nAdNFJXsXvo8SJds9OQ=;
 b=MbXDBOKHhrsZVmdfSGB3bG1eRqAqF8Oo2MP0kuBGKqodQWEgMStzOTeqNqsj4uQAH/xnZ+xKVIgqRt7ACkN5ztinahj4i5OE1didH+i8is5gNXJot+sKMuGJ6q92OgKGvdlfEfnbCNLIGYiujcBaGHUWwyRYoyTYgHP1qtcFG+s=
Received: from BY5PR13CA0011.namprd13.prod.outlook.com (2603:10b6:a03:180::24)
 by CY5PR12MB6346.namprd12.prod.outlook.com (2603:10b6:930:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 30 May
 2025 05:45:04 +0000
Received: from MWH0EPF000989E6.namprd02.prod.outlook.com
 (2603:10b6:a03:180:cafe::7a) by BY5PR13CA0011.outlook.office365.com
 (2603:10b6:a03:180::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Fri,
 30 May 2025 05:45:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E6.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 05:45:04 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 00:44:59 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<sanyog.r.kale@intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 0/3] soundwire: amd: fixes and improvements
Date: Fri, 30 May 2025 11:13:38 +0530
Message-ID: <20250530054447.1645807-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E6:EE_|CY5PR12MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: e5cd827d-d39f-4b60-6d27-08dd9f3d2090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZOvYeivRzoheXE8lAzCG4S1iFtcg7mtN9JAjjFjABwgZ1gR9ppHArzjZMW1m?=
 =?us-ascii?Q?oH7CBpcdnPVm3Nu4M/UvJ8ZKOOU0/pKEHH5P+fcAHw/Ap3VSQJvHEctKWwVI?=
 =?us-ascii?Q?v5ToY6f845HZLbFd2iXFBHpmn2fhU4N5GSEdMlL7yBT77fOsulWZhcoY0CcM?=
 =?us-ascii?Q?4BvFHntlJ8dxXrnbU3o3lfubnbbxvlpsx/Xq64sm5ki/do9pBM0HpELpFI1R?=
 =?us-ascii?Q?m+NPUyeaZ3iH70WLOHyf0Macqc7IAz7+e45rcAZZ9/ox/NPc0CYhLQd8mJDU?=
 =?us-ascii?Q?WKg2Yxt1VMFWq0/bcmIWXwVdvzW4tgfBydEWtyauc4Smy0JNbIv0rZ7sTzT6?=
 =?us-ascii?Q?ZLNHBcLk7sofsQYZoPBE4vVATPbPcDFdJshqOoNOQxpr/4i/g2lxyhxLfCSY?=
 =?us-ascii?Q?JV66Ozc2OFMNSVjDIuRSUwJuQSgO5i48jh42OmbuqtCFsif9Wv3kMzUvcpCl?=
 =?us-ascii?Q?5a+0RB8drrIUP+V6ZF8RP2PubVPa++ubvKOAyhAMSueL76zZW3wlGhn5um7A?=
 =?us-ascii?Q?iZiulpsiqvhdrHe+tcTuIim5NCmDdlQL9PmvGe583t7zGreSWAbXzobe15vP?=
 =?us-ascii?Q?YUujjHusF7Tio+f690o8xlsb17uwjy8K6FBw6D3d2tq6Zt0CQEv3fmTSP7bk?=
 =?us-ascii?Q?309rIyNBSdoFNwHddj3xywd0iQV9MK4GrQQrQ1dUB2EgD/iOIX8Ei9hVptoD?=
 =?us-ascii?Q?adagq4wlpN4Iopt7Ji9XguB+56/ehFmXrIOjrkzfXIoGWsuFkK33hrOlXBGs?=
 =?us-ascii?Q?ys8VcmNEi34NVMi/w0wifaamtmsEjzm3vIwCSX8KjKIz60aTxkHXHpy5y7Rf?=
 =?us-ascii?Q?RLl/Dxkbttkhk9ijZLn0XyGCzlh01pqsms8gPpcSPNTXCpAA8tX8lZG5NnW2?=
 =?us-ascii?Q?zdPSAl/C0FlIzmSQseDYAOFLUASH5nN4h/Khpzjn31iTX3ThkCU7+flopNif?=
 =?us-ascii?Q?aW8FgNCoMAPMeY9RaqXmQOuG3VdDvq93ob8F9cm6TuI99OcMjRRVOiawHZ15?=
 =?us-ascii?Q?sy5kMhKV3iCuIwZwGK478Nszaj9JOVnF2Err9c0QBRgNbDr8ENJR4cMok/j2?=
 =?us-ascii?Q?bZXa6WFxeZgrl6C93p+PW1WSN6l8+1YYvKZez9996tHFzVwT6omgPGDyBOTJ?=
 =?us-ascii?Q?eXwVvP+fyTRyZW9AUDjW4yog9QkA1+5VHfufPSo5GTdrfPi0AAlRnQa0q1rc?=
 =?us-ascii?Q?ZeEh+wS2hCON/muAxHi90LA+1SIW0LSM5HRhnxqzR/CghVCHhpbmlt+bIhlT?=
 =?us-ascii?Q?C2mVfuWENwl72vVrlOyVnxE7NRAFGZkIk8T+3PVWybnpfx5THOIwouRFfAsp?=
 =?us-ascii?Q?9fWf5z9sdGq0rXgTpwWm9bWyR+L+S0bzI1enAokWMCdE1VOCYLWRw2Vpj9sB?=
 =?us-ascii?Q?yusYbFMp+p0u84GlMYs8d+y3k+DdmmcQjCSiTD5+6E79vy73TL3BUa245vWO?=
 =?us-ascii?Q?MmNN61ljAgglT+LQZIAfvUsCX0HanI/TiEs54Q7X76dmzBBVTMNaUaqagn7g?=
 =?us-ascii?Q?nviYOSLSOxni87NhfbcoLDsafI2AH0NKqwnj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 05:45:04.3131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5cd827d-d39f-4b60-6d27-08dd9f3d2090
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6346

This patch series consists of fixes and improvements for
AMD Soundwire stack.

Vijendar Mukunda (3):
  soundwire: amd: fix for handling slave alerts after link is down
  soundwire: amd: serialize amd manager resume sequence during
    pm_prepare
  soundwire: amd: cancel pending slave status handling workqueue during
    remove sequence

 drivers/soundwire/amd_manager.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
2.45.2

