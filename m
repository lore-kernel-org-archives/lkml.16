Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2089.outbound.protection.outlook.com [40.107.96.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625204C8E
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 01:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748569772; cv=fail; b=KgPe3poiw32XomX0iJQcMbNa8jUkKrl12GfXcWQ7uUi9FfAuqzQ65+JJ9k9kSp8PNspzcH9LIW98AqukiaSM5zOO6Qof7JvxzPIyntX7e95wFtTlFH4RMLBmd8Oh4DQSZjPG3IKPxCdR+PwXBCy1DmdjNzMgXHliNcL+Mk2iTlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748569772; c=relaxed/simple;
	bh=IwNABGRlPUpZp24sofjM3pklvplkcx/unYpOPFrM4MM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jh/kY7C162g5C3wuuTq+3KxUAbXrb0FScZuzE6AX93NYUjf9PHzHQdKwUL4Uc41ycj8Z2fcF9HB2DvI/qduXt3XCUXO8MkCCL0TD0gp1U4QuSQUFYoJuJdu8rN84o0IOAdk0TBH80HdJ5jVflACfSAY0itrEHKCDd9vRReEBw3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CCppjhTU; arc=fail smtp.client-ip=40.107.96.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CCppjhTU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vj+b6fqn4gszA5d/HxTxSLbrCcyYJqJRUBQhs/FW1O58cP6qvB4jFJqBTKWOoXLIxK+LVcgMcqgk84ZiGMwZ6z3IXPqx11dM1SC3iq8nLlwD8JOGmSUOUvuZApk2OefjFiyOekkual5mleFXrTi8JL6eWBemTCezNUxOTxyvYH2b2zv6q03rCP99JIRHUv9GpXCXUVRHrQU/9RPYdllhT5yfNAp8L0ZtXR+DtIBFa6uZBw7my1TwoaAQaq1A+Sw0Ma0n06zzoX8FOmDfGlk0HG3jCJp8Xc5GBPm7G1ImsS7iQr8K5Eqr18Vl2c9IB+/pq6ck73zmrr41OYjS8QRJqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4fiRcyYgBSpv4AQdWLF3DgNKd5DgXBqQNs1ZZzmBh4=;
 b=pJLjYpqsQf7WMEWeAdTakeAGsbivU8uCwKGOSCTknBPxtpgxBc7eUQj3p6MjqXaolpEFrBPr8SbD9Vw0kJaWOD4o1j/CAIfz4MJ0pcrte7K6f8p0MAOK5dtHzdnNDfEntzuyezzFHA+F0amKKVrlOZAQ+yntuE5Cy0utRyaxFc2HW5bmpgmczyGq8ZgHiJ4gm5y2RgvhKx8apGR7wetxNnaAMhTqD16DNd+/82v3LBWlJ2Ga4n93+UuryPGW28yVGplxgVr8DWuyGuIfOBE5BuD6YTmYiOMEKj2H16KgCzpX9hU0DqDcCZo0D+frVYh5GK1qk0Ms63tPiVFKgpRU+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4fiRcyYgBSpv4AQdWLF3DgNKd5DgXBqQNs1ZZzmBh4=;
 b=CCppjhTUbTgf3UoXqGtpOmefqkxruALDujmei17rBSXgZ0FYrTADdG+2aDKOXN1Q0Dwf3wpGns6YvPu7T3B8U2S7GdiUYNGbmHiHCVrplG4dredhmNzIm9ik5nkrwldGnXD6evkqdoGKRGQ0KajLK+Cgr2AtWcCdu3vlK18GyUwg2pKqucPzEkuOARTVlCdqeI4lK6ZTWmnPzxKTiQEDn+5WjcR2kT1nl/C6cD80QFsXaFPysmhW36hiPxg7zyMFEAfZei8mDPvai5gCWbMGX91Ez7APDP11OqFOExTaMNN03fHqGws3twXhyyENnNQts7eTNjhXbe3xsgF8mPZX8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9)
 by SN7PR12MB6959.namprd12.prod.outlook.com (2603:10b6:806:261::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Fri, 30 May
 2025 01:49:24 +0000
Received: from CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6]) by CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6%5]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 01:49:24 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	lorenzo.stoakes@oracle.com
Cc: david@redhat.com,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Alistair Popple <apopple@nvidia.com>
Subject: [PATCH] MAINTAINERS: add myself as reviewer of mm memory policy
Date: Fri, 30 May 2025 11:49:17 +1000
Message-ID: <20250530014917.2946940-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.47.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYCPR01CA0016.ausprd01.prod.outlook.com
 (2603:10c6:10:31::28) To CY8PR12MB7705.namprd12.prod.outlook.com
 (2603:10b6:930:84::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7705:EE_|SN7PR12MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: 36e2cb90-4ee1-4c24-faf2-08dd9f1c3475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Xxcap0TxnK4qsE2EENntjAcgoc7EBJFFM80bFAdL86/Mjfw/+ZeeG50VgOhq?=
 =?us-ascii?Q?LRJnLtGB5FBqa0M5Gw/16+XnSMt3R8rl6DG2Y/4vCOe09+VHMLow1ZDdZ8lb?=
 =?us-ascii?Q?KAiwXfbL7MlVrvy7Gzu7rcJDESdNbMCLMue523hdVr1+o7Ia2kDEBOXWbr5r?=
 =?us-ascii?Q?Kx3x7pAE01rxRw+n8okZFFSladl/HDUKMY9VQ/HxM52lJnfLC0yD56HGoEXn?=
 =?us-ascii?Q?W930zKKUgDwL4Y1yO+g2yQnIvL3xesP8GyawVAt88YCX1tP++WZbGTh0AfQ2?=
 =?us-ascii?Q?E2TN3PUMuKAWVIQgAVTJrmVDcJAzVTsZrxEdyKnJ/2BfCa9FLeWxG7Yj6ljx?=
 =?us-ascii?Q?a8Q70d/7q9G8vnZNDnqpEF68+QZROuevVCKP6Cqss2PIvpVuY8XqWXLatXtQ?=
 =?us-ascii?Q?VWFWAboOi9lBdMTcX5Cx2hi8JHXi7P6UwBRZMtthonxSwpfXmOtZyZO1yioR?=
 =?us-ascii?Q?7ns4ARS6+eE03Q/8SBRGI7mHDMyqwh6zMsredjfCWUwgk1F3NDBMp3LKOyeY?=
 =?us-ascii?Q?QLDSqsrcuVigVcBZz85pK3uNO6zdCvORiSOop4TRA4fuAhrGfXQpX0NHiSy5?=
 =?us-ascii?Q?TxgvbgXGQqc1v1nWnP2GEtTjMasvtk73NvIV6AzvtRmgy6bk7UpQuAJFSMZ/?=
 =?us-ascii?Q?5ZZxgRACirBbyJsFfFXDjWjwyEt0b2xHLiledhT9WOhCKnQdcHfBbhIl+8Zn?=
 =?us-ascii?Q?XvS7jPGyCYmDycEXxhLSpMt2U39lQSO6fMCWY2DFAFcyDcj/sk5s3Z3Pa14H?=
 =?us-ascii?Q?IZRAhsAdxc8TU5nbsFZQIfdGOFvupkH8JGj7ycnP4E353yMDJwXqYESPjcAk?=
 =?us-ascii?Q?Q/wY/OxjwwYRq/LBtphWfHo54FWi3uD1BYOWlgkq10+cE/bgQLUC/fCDZcVp?=
 =?us-ascii?Q?CRVRkWPOYfc4ViOSbQATa6z++y/RKfT3x4b3Vuib6oHoyudt/b6e1vYoqKpv?=
 =?us-ascii?Q?i/wbtajD1c/GHpCVtqXJLupDlMqTj+RvOkLEjSzxi12cR9rzWNPoipU/VyMG?=
 =?us-ascii?Q?GaaAGtnBFd/x+P9EW/+38RkOHyGW40lUGiVVjPTIdmQsQieJdClekl0ED96T?=
 =?us-ascii?Q?058vGKs1MeRcm417n8HjCyqkeJy8b7vuLpoDwYUIQRP6hcyj/sUaCLls2CtW?=
 =?us-ascii?Q?koz7hZIhoqz3vjTgzZbXLm6mBDrWu+Fc5ZXJLdC1SYELsM+W3fce3ZS3BVKF?=
 =?us-ascii?Q?xdX35/6egERvuFqhxBrRniWseRFgAb4GePTZD11fC+2VMiXsK3TrAr6jOLod?=
 =?us-ascii?Q?dS2sFrS8ua3kUZsv7TZIeyh7XdOLLZZQYiu3c7eLzJcTJsJIpjxujtQ482WL?=
 =?us-ascii?Q?Wgdi4/Qw41mPQw7MHjhwsuFRCLU7ldAm94RcdmXIcCLZ8ifkC7pUiGxFmAFm?=
 =?us-ascii?Q?4balCxQmi3Lhls8+alnXFh/4GsQmTjvkm5VoHf7mjwoLU5yPbr+EmC9SxAkc?=
 =?us-ascii?Q?kHO8c2I9NB0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7705.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2/l/eQG+GRbKonuNfP9/gPkA7RLYH4g5EfnFPuBWLaTWw8mrEL/oRPPulNo7?=
 =?us-ascii?Q?g7PYjtyAzYgrF+EuBtj8pUQFXZXOGlrlErYKdj61AMVsQAl9xn2i12H4tnh+?=
 =?us-ascii?Q?39dGZXJ2tgy2dryHDJ+ACQRPzf6O0hDKJ5zN8zDMG7K9lFq936QVPGoiMIlY?=
 =?us-ascii?Q?r3PA7JY0pPzMz4YlOFu3x+QqFhsXO6tR7I47JbtwlrcgKF1QWtgrgP6Tpn7b?=
 =?us-ascii?Q?kaDyqs1ZgEPQe/HfotfMOKCS4shm64G3E7MHBVlY/qmvhpg1W0B3/NJnkUUY?=
 =?us-ascii?Q?pzyNiDuxNsvHGeXv/3o8HH2nttcU58NVjogGyOzp+nWbwqTozCj7UqKtb33z?=
 =?us-ascii?Q?jk9WJT5JIDDTfFKhLsbIytdwv3w3+uxMpSfGVmlAiSxTnxsT9EfSkRCijfad?=
 =?us-ascii?Q?3WulOBAxxcb6uIVoR52DOgBOFs3OC/OwzZnj/oKaU39Uq/hWMRPsmt4DIu0Z?=
 =?us-ascii?Q?8o0L9OhBQeaH0/xTS6z7/5iCtBqL8y2uCsPZ7BIsCXORbA6VeX1haaVGBd0y?=
 =?us-ascii?Q?IxwpTg/ApgeO5aJfSj6oRHz0B0Wkc+/AEa5Z6HJntQ+GSY8h5+lyIZr2784E?=
 =?us-ascii?Q?Wxi3yvUCsD5USmP0SBazmDbosALWaVT7zGYeZ7zcRRWpnOczu1Ua6i/AL8F3?=
 =?us-ascii?Q?rCmNraZ9Gy5BeCN3eO5bRX8m7Vqoauj18NA4RxjCcwinUCxyeGTFT187K3zL?=
 =?us-ascii?Q?o7hccAy8Sa2C3b403DVB+2SJodjV17YaM2Hqm7k82DnGHiwhcbipwO4Lwq6T?=
 =?us-ascii?Q?YnGqqhoDTFM5xCebwi9whOHFODc5Y3PIH4fzDQ10LkadXwlEHCYUamorLv/x?=
 =?us-ascii?Q?01WiUHgmyeLp/uWdQB6zAPKNpiju1HRn1OaCdUYM29T2Ba/blsmGDwKFazMy?=
 =?us-ascii?Q?FHWlcRqwHsLM3XSIK9pJmGfQcpAqZyo3UeWlbV84H+DM/fdqgbWhR5Jyhjp8?=
 =?us-ascii?Q?XDOZ7R8BR6LatocnusLBwIJmKn3bDI9ewsGx1gvlgtaapw45bZyf1BdAUMLf?=
 =?us-ascii?Q?l92rRW/sFubmpMBTU6QSvYOQ7dZ27/kBoo/ABtmZuCXk+hijL2j7qhEil1/6?=
 =?us-ascii?Q?jAytwAdO7I55uaHAJlu4Q6cPd6g0NLEOMyoQYyasgRxx9OHdVaG14yKMnwxc?=
 =?us-ascii?Q?vNOrVDoR8YxMhe9sWTU7ursCfiW4fAAwLDAG4he/ywKKiAzZHThqu3gvjC0r?=
 =?us-ascii?Q?XqdADKPALdZko9D9CtvYoxL8ebgKQeuElXM34m4FOp7x6X6Sz7ofayHgO7HC?=
 =?us-ascii?Q?FePBtbSW7cjPOiMQqC1kgvEtArycExB/V8mhobuu73IVVeaWenbv2sWLPghO?=
 =?us-ascii?Q?aZ1AvP0zhjqlaEKNcCwhdAbbYREt6dK3LVNJoetNwxoMCCk196WEfNzRK/x/?=
 =?us-ascii?Q?XIQbWEf5aLKp17ihXd1Bb3dXovgeoE2Pma/GZuT/2nh3YeaefHGm1wlnLiaF?=
 =?us-ascii?Q?1mMCzLYoTGrZonLZwW43CA01x8dIt8Z98oioPVL2v5TYPTugeLHAiq662mkD?=
 =?us-ascii?Q?cuAhltXgUdNbPBeokf7cnjRJlYOMJcmtomYkqBw7Ri8Upi4MIfUKeEjrt2BU?=
 =?us-ascii?Q?cX90DsIaCUnX8a+J6Y4IuGNPV7j06Cyyg0hIYBnZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e2cb90-4ee1-4c24-faf2-08dd9f1c3475
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 01:49:24.6383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Z5GdCqtHZ6FFjjr3y8QupHWPFPDY8OhowUA1/ofd2I/PdzurNaHfE2OHOJDRpwRPBekQdmEVokCiE7RMY4UpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6959

I'm particularly familiar with mm/migrate.c and especially
mm/migrate_device.c so add myself to MAINTAINERS.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b8f1125f68da..219f887f810e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15713,6 +15713,7 @@ R:	Rakie Kim <rakie.kim@sk.com>
 R:	Byungchul Park <byungchul@sk.com>
 R:	Gregory Price <gourry@gourry.net>
 R:	Ying Huang <ying.huang@linux.alibaba.com>
+R:	Alistair Popple <apopple@nvidia.com>
 L:	linux-mm@kvack.org
 S:	Maintained
 W:	http://www.linux-mm.org
-- 
2.47.2

