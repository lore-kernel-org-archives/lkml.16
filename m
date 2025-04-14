Received: from mx0b-000eb902.pphosted.com (mx0b-000eb902.pphosted.com [205.220.177.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89822DFA34
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.212
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637565; cv=fail; b=cITVvBce26nH28Q6KHUHoc50ZQBUM83vBgAg8cjEDlmwczNo9jlwzydwpNJLZWT7YkNQ7S5hDltkFunyeYwglY1vUS2XqMLtuBGKoD38guDY/0BCu4eB/M+Q0x4rDpCNYmXptR7uNUualuV3mHIrwao8MDUhPWlej3SMmzawamo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637565; c=relaxed/simple;
	bh=FY0vtuwPh2dZKvLHZf+cbLt3N1uy89athAnCoEZZSGU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=smWjaQ7AOAc6TEcjitCGd9ogQ5QOtHYlAJUNQEy++5mG4PfCUMRieOGzVakEqve3bK9i8b0R7Sl88O6gZw3I7WXe2CohLoPutxwiPf2c7SHLJFAbnjrhpgX25o6S1+uxikRg1cGkJXgLH47nVRNRFtLhfQavzsF5ei+HFOXH4vU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=garmin.com; spf=pass smtp.mailfrom=garmin.com; dkim=pass (2048-bit key) header.d=garmin.com header.i=@garmin.com header.b=gUmar9Lw; dkim=pass (2048-bit key) header.d=garmin.com header.i=@garmin.com header.b=i36VjkO+; arc=fail smtp.client-ip=205.220.177.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=garmin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garmin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=garmin.com header.i=@garmin.com header.b="gUmar9Lw";
	dkim=pass (2048-bit key) header.d=garmin.com header.i=@garmin.com header.b="i36VjkO+"
Received: from pps.filterd (m0220298.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E8sDqH019758;
	Mon, 14 Apr 2025 08:32:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps1; bh=hgtk1bpwQrA8Bf51qDQ1JUbKGid
	3DFvodUQfha1eRpI=; b=gUmar9LwyfWp4eYwa3SGOSpJsk/4j6+rx4xjHX98vcT
	jJCZxHX/aNIEjoD8ZQ8i/+1W9b/o2Glony2MZA3JfCtt+8s95WhddRcWnX0i3FyV
	K2ViFMUfYwxB0Ie0d2RsNys+W0So+5D7g7JVhtkwqfeHlx8LCNz4WJQBiW8sdwhr
	MzVVrMlwfJ1rCyARyDl3TElnpz7RStjxk8Jw0n0bW4FZvS04pPNQKcCiuSuaEnhs
	6h0wHduR+ufPmzRWe0XEQF0b4PCD/YAYUg0Vfe2tFVIKLqIQ/STZGQAV8PT41SAR
	1sN3XRI5+K/jVtj6qIvf9nbvima16ICJPoH0I/A7PNQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazlp17013062.outbound.protection.outlook.com [40.93.20.62])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 460y8bgkgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 08:32:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Chi6unV41Zv6W6rH3X0qTJk4abePLqGN+nnIHPMoUNrt1HdyW7JS70tuQrNpjMWMLCHfMYfibuZE1GZJ3yuspL8pD3i7rZg776c9l4q4SNCHIDRv6T5I7qJ27kl8p1WmUazo4RhIry+jlWvGtAqQuwJTRRZzDUv/GhH1KPg7ckE3BFTVzWdQZFO+WxrAzSxsx3i3LDTmXLSi1x6Ak6+yldeV26jjRi7ZzKeOmmEDhNZ9eLcQhsnoYe8CeU736o8R8qY09As9emZ/3AxpZh7Ip6ko8TgSP2f30Mq/L9vdYYXzzyo9SSu4aQFllmqlDeIKDT4xB5utUbn3wn+Hba/pEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgtk1bpwQrA8Bf51qDQ1JUbKGid3DFvodUQfha1eRpI=;
 b=fK8N4KzS1YJTkdArhn5LYKHQBFbPOqjQ1XMfTPXqR064m6hjNzKiPgC96YKzYerV92eOjUY29lKQ8ls/TYqbQzKcTwCzoresJFuwLSigVGO/wd4t4v+EN56tyJMGL9le0Tu9OKvNF538UMNGq3H8t+XNE81spssebEypn0HWQ4UW3+SAKEuR0HyU+II1Je1VJWB4Kd2NOoKOZ0ab9x8s9gHwTbejuTgKlwtDK8Pr1sLyiXSDJg+P7CdwO/A1G8ovmCmpLU3hg0/TQzdyvPpBwBtsDkkDfi/DQWWy7FycQDnAGFx1XlLDNsJYahDItusSzWiUIn+opDM02KrKe7P7Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=reject sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgtk1bpwQrA8Bf51qDQ1JUbKGid3DFvodUQfha1eRpI=;
 b=i36VjkO+g8Xrynbd36CAvBAyajQtXelWd4VliJPk6KN+vudgpcT0LdXGh05VrptGDlQrLw+ff4KoREwuWW+eTu+iUtfVvgWiWjZPdau3xe4xzHc+AA4I7FQAVwny1dPuKnjurffNKrVPdPjP+86sqha5Ai5+sE5uA7OW6Zpm8q7q/zRwqWTX03F7bJVcCvqWqB+c2TBzdip+SIpo487vdM/ntkeZqiXnwqG/tObMVdiqr6Vq811f03sWm7RH9ZErn4TIOeZ700OBNsZ0Bw+gQFHW8FoLf7oVhENFjc4VFwQz9EiaDJd8NHz8nKHFubygyPbMritdkbKXdONP0dwgDA==
Received: from SJ0PR03CA0010.namprd03.prod.outlook.com (2603:10b6:a03:33a::15)
 by CH7PR04MB9546.namprd04.prod.outlook.com (2603:10b6:610:24b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 13:32:25 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::90) by SJ0PR03CA0010.outlook.office365.com
 (2603:10b6:a03:33a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.32 via Frontend Transport; Mon,
 14 Apr 2025 13:32:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 13:32:24 +0000
Received: from OLAWPA-EXMB2.ad.garmin.com (10.5.144.14) by cv1wpa-edge3
 (10.60.4.253) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 14 Apr
 2025 08:32:23 -0500
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 OLAWPA-EXMB2.ad.garmin.com (10.5.144.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Apr 2025 08:32:23 -0500
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 CV1WPA-EXMB1.ad.garmin.com (10.5.144.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Apr 2025 08:32:23 -0500
Received: from OLA-9X4GN34.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.71) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 14 Apr 2025 08:32:23 -0500
From: Ross Stutterheim <ross.stutterheim@garmin.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ross.stutterheim@garmin.com>, <ross.sweng@gmail.com>
Subject: [PATCH] arm[64]/memremap: fix arch_memremap_can_ram_remap()
Date: Mon, 14 Apr 2025 08:32:19 -0500
Message-ID: <20250414133219.107455-1-ross.stutterheim@garmin.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|CH7PR04MB9546:EE_
X-MS-Office365-Filtering-Correlation-Id: ea1356ad-5bd4-453b-651a-08dd7b58cad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Esqd9USmBr0IPBTldH7OR28rwQELyBMiipdYrx6uRSG1d3pei2nqZ358Z/iS?=
 =?us-ascii?Q?PKVMGpHmnPhpi6BKhg/TaMFEIEpUvsuK22hBXlwF3CRPnxZNgIW5GozJzNdd?=
 =?us-ascii?Q?czf6INC4ATTdr2uN7zEsddeAOxE07OlKjtQIr6CUnC/kYDP9TvMBDfx1Zfnd?=
 =?us-ascii?Q?Aki99FVk5DLxWv7TLaKogFrUF8KMSzZA3pXX8PGBhms/G8QDAfZeq7wd8qzg?=
 =?us-ascii?Q?oh67GpOqhWKEudq5u4kd8Z52NGuaTWThZhX77Npzd2d1lQOQ5ZidoKmaD5Bs?=
 =?us-ascii?Q?0mdaEsziKxziWxA5uIuBrpr90TVlFDgWNcyBHx0Tfj637Am9SuGm/AQ4KoeK?=
 =?us-ascii?Q?01e0RTbbvRwMag3MQE/oanhiDPolCa8jGc3V24BMZ0pHlr+9/LE69Js/rpzW?=
 =?us-ascii?Q?1irO2VuuxmocyXyxMJ7mK0wI7y73lYnIJpynyDrT1cSB+STxuW+kuOYFkzXj?=
 =?us-ascii?Q?s8y3CaxD4LdYZ6cUqlJWyZWnR2nUW1ZSb0ZMCbU5YR0vz+51QmnyIsZB8yq7?=
 =?us-ascii?Q?3Kh81J87JZ0VlYI1fLjw2BxlosU3ftra9tPyK/Js1GUnt4IxVbcjytOvWKFG?=
 =?us-ascii?Q?o+DoqvhkN/c4JOyXnKG1HzJMgNoh8B6b2on/xU+coti7pyEPPKLRSwdH6+o4?=
 =?us-ascii?Q?1nlZ8hseEjv3zv331K+4LwggIdVP49b3MFdW+Wuj8rkatxsHgBicJZDKA+dj?=
 =?us-ascii?Q?Kp4TjTlzBeQKeuh76FLJ/maIn0GAZRIe5oVzuIu85UjiyCyGWcly/jQv9UmD?=
 =?us-ascii?Q?oQD0rOlQmh7zWEmzgKNPoVWIo6j7j6H/q813B2bcH7AGHCIxXg8Wv4qDulR4?=
 =?us-ascii?Q?0REAOGv0Ptrc38/kXllrwD33FG2dFoC57gkQYItg+mFnQcELzn4BMfCANBs7?=
 =?us-ascii?Q?Ez/XE4+k+d/G83TgDf1VQXCXAewhBuvtiARrtz8J/M5w149naiBX43Bc3C5p?=
 =?us-ascii?Q?6bofxsaTqEkIR8k59KeZxgVwoMNusbpJPotIFkRHxkIv9f5YlqlDpXiD5Oqx?=
 =?us-ascii?Q?dB5zFBJWzC86PG+GDJdzMwcMOXTZgHz68LkkPo5Yh4eqUqJPdRUnggUuM36p?=
 =?us-ascii?Q?JfHn9dFLsmTv3rlalITN+NrNQIy1W+4Acl0htpt5sasJozo6UB5I9f1zlDun?=
 =?us-ascii?Q?6f54A0mjeWt0EGvhWyBtyIqHnUrw0iVHYP7yZTfnw1q/HVg9GYgh5GPvJKT4?=
 =?us-ascii?Q?h8wAQz+H4qz9S9Psw8ADxNqJWxCyOomgQdG0jKRC8GeJIsp/bSHJ/M7zi9Fw?=
 =?us-ascii?Q?gze/pfQmPyAE1d41DokM9eW18A6NYzTzW7k+/dIniDYX1DewqH19EUKpQVwh?=
 =?us-ascii?Q?wBjhvP7NlPOEA48EDwzPEutdOnxUyCQmfJB78LvuikfxwGQmEzgsg0X67PQq?=
 =?us-ascii?Q?SVURpWLxL4q7bkoLgSXgjZbrw9jicCHC6aTY5wCncZXbhPBG/l2jkny1JouK?=
 =?us-ascii?Q?BBGRsUFiOo3Qlms/XiMg2OqypcT9g9C4q6W7mmsysE0AZTUc78qWl10kxJ5T?=
 =?us-ascii?Q?OkaPcYRjYvgfVB8o3x0VslcFjy5xeJ+TovsM?=
X-Forefront-Antispam-Report:
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 13:32:24.5746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea1356ad-5bd4-453b-651a-08dd7b58cad8
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR04MB9546
X-Authority-Analysis: v=2.4 cv=LoOSymdc c=1 sm=1 tr=0 ts=67fd0e6b cx=c_pps a=/rOuTbX+ZjzKyBIGvUmkrA==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10
 a=qm69fr9Wx_0A:10 a=NbHB2C0EAAAA:8 a=CsUgSEAaGNCeCqanHHUA:9 cc=ntf
X-Proofpoint-GUID: 4RY-TQZ7tpsgnhCOm01yXkoZqnXkcsBy
X-Proofpoint-ORIG-GUID: 4RY-TQZ7tpsgnhCOm01yXkoZqnXkcsBy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=927 malwarescore=0
 spamscore=0 adultscore=0 mlxscore=0 suspectscore=0 impostorscore=0
 clxscore=1011 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc=notification route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502280000 definitions=main-2504140098

commit 260364d112bc ("arm[64]/memremap: don't abuse pfn_valid() to ensure
presence of linear map") added the definition of
arch_memremap_can_ram_remap() for arm[64] specific filtering of what pages
can be used from the linear mapping. memblock_is_map_memory() was called
with the pfn of the address given to arch_memremap_can_ram_remap();
however, memblock_is_map_memory() expects to be given an address, not a
pfn.

This results in calls to memremap() returning a newly mapped area when
it should return an address in the existing linear mapping.

Fix this by removing the address to pfn translation and pass the
address directly.

Fixes: 260364d112bc ("arm[64]/memremap: don't abuse pfn_valid() to ensure presence of linear map")
Signed-off-by: Ross Stutterheim <ross.stutterheim@garmin.com>
---
 arch/arm/mm/ioremap.c   | 4 +---
 arch/arm64/mm/ioremap.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mm/ioremap.c b/arch/arm/mm/ioremap.c
index 748698e91a4b..27e64f782cb3 100644
--- a/arch/arm/mm/ioremap.c
+++ b/arch/arm/mm/ioremap.c
@@ -515,7 +515,5 @@ void __init early_ioremap_init(void)
 bool arch_memremap_can_ram_remap(resource_size_t offset, size_t size,
 				 unsigned long flags)
 {
-	unsigned long pfn = PHYS_PFN(offset);
-
-	return memblock_is_map_memory(pfn);
+	return memblock_is_map_memory(offset);
 }
diff --git a/arch/arm64/mm/ioremap.c b/arch/arm64/mm/ioremap.c
index 10e246f11271..48c38c986b95 100644
--- a/arch/arm64/mm/ioremap.c
+++ b/arch/arm64/mm/ioremap.c
@@ -51,7 +51,5 @@ void __init early_ioremap_init(void)
 bool arch_memremap_can_ram_remap(resource_size_t offset, size_t size,
 				 unsigned long flags)
 {
-	unsigned long pfn = PHYS_PFN(offset);
-
-	return pfn_is_map_memory(pfn);
+	return pfn_is_map_memory(offset);
 }
-- 
2.49.0

