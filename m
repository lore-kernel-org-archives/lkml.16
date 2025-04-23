Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A7028CF7C;
	Wed, 23 Apr 2025 19:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745436451; cv=fail; b=sUEdFpS8+v8sKQscK8FVIK8yoI1mvsR9nLDS5BTPVBxWOtn/Xm6fSS9aNas3T8C1TKKCUCdV/PP13o1zBhzxrLwMu07Bz80hmhDwqckyZ7eXaBGPX6UhSTYScm5esVydzqMGhbkorHQqCEb2E3HPzkiB0bPQbAllMt29cpt6CyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745436451; c=relaxed/simple;
	bh=wn0WzH2HuR4qow+jXZlY4n4qEQYgGp9qNvmJXBl5MyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cdLsWjXkxiGEfCG8FYCj7p+bCw619EJ5xRPgsGYciG6MslTqBisQmOTAb1uNPFnUXp0TAUD447Jtzc9ptMnSE0lGk5SEL5ilEA4pExSXGNrtQXVIONKVFF7wuqXmJTG4IOX2iMRYifN23TgZeGG104ke0OfoDAM/lBZrqxiASoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=TBZdCAmE; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=cSR057NF; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="TBZdCAmE";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="cSR057NF"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N50FRY012973;
	Wed, 23 Apr 2025 14:27:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=0b8BJnJd6Ofz1+1B
	ug4C/rdAF2ude9bfW9sT3f7mzsc=; b=TBZdCAmEfur0Jnb2xlbSwszST7OPsF++
	BU6U8o4BrJqSpXfUGRpZRB1OcMBnSYxp+SV+DoH2DOl2JcsXkkYcGlaTwle9AJOM
	WduP6RmqCLXynFYqKow+6OAtyx/7AnlPURjRTT1WkS3CKFENoqv9phw/AOGRDQWf
	g65suyYpdQHI0YtjYzLt4tIz6C63dhFuV0kLqtZFtLPStihxgHnIDXK47atWUvA5
	JAscBXLxacz2/X9slnsGa1pU4cZYeLiCdceK2arPH7zlcuR4JZXCEZ0Xdx/oW/wp
	QoAqZSMXMx6Z+QTtH1gpNGf5KQwcf0TBBATqbAkODNCSBUww/fikjA==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 466jjx1e6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 14:27:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yHRd6zE5fQ580UX1zhZOZ26Xvv5mFh7LZskpge3502liDIYbt9/HDAOsbvkdZNH3anDzo181mrze5ddMMGNBN6/XxIt7GdidU8OUdrMhWIieeRJz2Aimb6SayqELm6ugKIydyIxjL+LKUMhb8ugmStRnE4Y2QirlV7bxH8qxEG5CGthq7Enl8S8zyTe8PPDF0pwid43NSEyB5YEiwcyk4yYZrmQ514zpihR/8COD9oEDkmygYupdZPF9NH3xQMtkMscmyn2DCCT5QTQjV3KXe/LIgSUSlBnCZ1wFN50csF1Z1F/b0Z9OCcSwjymNSw5+WfR8AhWxyADWchYWlJ3BjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0b8BJnJd6Ofz1+1Bug4C/rdAF2ude9bfW9sT3f7mzsc=;
 b=LZ1x+jhgIgrGThhUqNhLO7jsopZNNQvQcPkqMCB+FuuxyJ+IlHRplsY86uB/VEJ1sW1H36403uLxNMp7ZonosaqV2LrsdWBQ14qeW6FkBCwc6zveOx9Du9utwe8vjeokH6mI0ieGnocpPg0RZsD3yLYWeX3CiBVTMUMvlyIlCje7xQIhq5IMBc6hXVmcf4cA63O5mQ8LxOUH5UhyoA6FHJRsOxxS5s43VACR2EtSW7UgdpxQGBBxYXosgJGipUa4kma/z7el8aQnJvAENHpEsEnBteFS332Uhn2eJ8ygxkgTPfD01aUp14U9qRPWtdiLV56kc8aH00Lf5dTlas+Iew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0b8BJnJd6Ofz1+1Bug4C/rdAF2ude9bfW9sT3f7mzsc=;
 b=cSR057NFBJTeIlgIVq6oyfyjIpiIoBF49/1NooAACWDNvoU8HJgXChpZt+UqslmHA4PN25df3ZGuOgUtRn3kL4XMyT762WMeZk+w15lHB24eamFbWbLgCahw+tVmw2XJNdEXIj6GD5TcP+aOL4GH+khBzp0dLjERcWUjiunvfHI=
Received: from MW4PR04CA0327.namprd04.prod.outlook.com (2603:10b6:303:82::32)
 by SA0PR19MB4556.namprd19.prod.outlook.com (2603:10b6:806:bb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 19:27:20 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:303:82:cafe::3) by MW4PR04CA0327.outlook.office365.com
 (2603:10b6:303:82::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Wed,
 23 Apr 2025 19:27:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Wed, 23 Apr 2025 19:27:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 882A0406543;
	Wed, 23 Apr 2025 19:27:17 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.68.186])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 0AA72820259;
	Wed, 23 Apr 2025 19:27:16 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH] MAINTAINERS: ASoC: Simplify references to Cirrus Logic include files
Date: Wed, 23 Apr 2025 20:27:13 +0100
Message-ID: <20250423192714.22158-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|SA0PR19MB4556:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dc6c0040-2c65-4a7d-e933-08dd829cdd55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JScp+a99Si+3LpSKwTYN7TiUVwHzxgmbopsf1Ox1wTpEVx/PDhm7owRGikCE?=
 =?us-ascii?Q?XKJ3AM8gs3puVEbP9dhWuxJFzf+c8fr/d6GiMec+bDYqmIUQr+NcGb3b0dLK?=
 =?us-ascii?Q?BMD/8h9hi+SJAN1S8UiMw4m7h0Ld4+pgzq9USB3MhMhHxqBRQMvbQ6IOmmzP?=
 =?us-ascii?Q?eNDCC069bR+SgYAElA8Oc73oYBRtic/khqf3yXVOeGHljVnOOrUeUVuQS3oS?=
 =?us-ascii?Q?nEAhzdLNS0c0c60tt1az5cB9wC2yO7L9/XivdICrHSemMHtdZ5IZjhtT5IXi?=
 =?us-ascii?Q?8Fj8Ypw0xWxyhNFukhwg8bAQWb00i0+0MBVItVerOidpMD5YFmldEv++TuEH?=
 =?us-ascii?Q?tPy0vVw5fpZh9bQTIrMGGd9I9a5HDSqvpVdNSmvbGt3Tbg75rX9rKhQcF7OZ?=
 =?us-ascii?Q?PNfnTSeCCPZkJsdQ5jYoK2pHZNXORPm92YxVcQqznAsTJTa5YgCPlFf8D51c?=
 =?us-ascii?Q?2hVqhwSGd/5r2Ir2DlCPmOmn3PTdY6mw5eT8Qdo6/Nhgf9vQxpFvQASNTdnx?=
 =?us-ascii?Q?WNZ6pMctEDYwVcGbIxxBf8lNIJoiThiqEAQT5t59AfLJTuYd75E00N5d4K5e?=
 =?us-ascii?Q?yI9AXH4uoSO238vMCj3XK9dTdv3KzvycWZ+La+X92ESLYRkG4US6dS78dTRW?=
 =?us-ascii?Q?4D0XTgWk0iBGE2hT0Zk05H0HWdnam2mxQ1u58bcuvvdvGrxKZoxTelGUuzj+?=
 =?us-ascii?Q?AAXS3FNScy25oA3SOkNDO4OS0UE+FHwPP+N5JNVs6ITbqLJ7694dX789zu1U?=
 =?us-ascii?Q?V3txW2MVwaK49Dx6x/I7bDQSiY13rfPo9NGH6j5MnE4i7tw3NVxasReecVKd?=
 =?us-ascii?Q?DHEECCDOA84o7KBbKLxGB9U3nZCf1AVwXVKSOrN/GpAekCD7U+6pRdedMpy7?=
 =?us-ascii?Q?DNB5j69vZDJ2C89nBmrBnRR2woSKXdyqoQaYJAmMbkYs0+uC4ieAbNpBMlw2?=
 =?us-ascii?Q?qg2oc4zEHcj9+M3o4Jx6G1BcNbeWiqNuXOA5jrzscysXiypxUHELVs65Cg8j?=
 =?us-ascii?Q?havqlGIPucI3lNdi+cQz/mTMFmZP/0Q9A0Ey1zup67V58+ZQOHsg2rjYH7rR?=
 =?us-ascii?Q?OVVnslc6N38KNDy00obg3xnDu6o61it+0QFQUCQ41JFjGAi6Ipa2WGZKVHiI?=
 =?us-ascii?Q?XDegjyXL07GoIJvblgZQSxTGKs4/yuzw9m/rqzj28tSI5wAt0j5m07Od7sUA?=
 =?us-ascii?Q?Bh9DNSlJdo0efL+RreFR6O57IEjtn9ZqZcw5u9Kxr/QiLImvSSN7vhzFbNKD?=
 =?us-ascii?Q?LDjUGPmXIEsTXLSsweC2oJyWIWKRBC9qqdX1jJ2YRos7SAwgc68QFARn3bMs?=
 =?us-ascii?Q?LJIqbVKGvD9ILTJ1NE+H18ENmu0jvhwpxGGcH+YbArsA4DZJyd7l20kFgiVQ?=
 =?us-ascii?Q?t5NxYSZu/tAOaQgs4XEcgHoJGYV6C9BQsG7unXmPzggw8Jd5TkLcsZEmmbxO?=
 =?us-ascii?Q?qd/mW79liae/J7IDbZ8vZ03xK3oIbp+J+xRUZz9INwYkoLxgWwCGeJCwfh0d?=
 =?us-ascii?Q?BMwOIgYbLjHpJ+1VC07W1M8zVbQY9MysEn4E?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 19:27:19.3101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc6c0040-2c65-4a7d-e933-08dd829cdd55
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4556
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEzNCBTYWx0ZWRfX3SnUQyKfaiLX 4kvGD65Au5Ug5uHsFiYMTox7tEqeLIjFQjKBn7tjZGxkT+6BqCow4UhreNUS9fjgBYBTD76NHlN jBMvraGm9w0smcoWg+2Z3ZBKm0sLeZ46C5SyZ9AR8UVbcV02P1AY+SRL89ULAwWy99c9FbK1E8W
 pYrQM7pmJ81rI3o2ZjLfrW+ngyCS3B4Rh/bBGQqhzv9zLkxRMLhqzRg+e99GA9rNX/a9I9dzOS9 0M8NNTfkNt3idHWBacocMf32E/36H64Hp5cM8YGvvZ6A0ikaixu0sPRAfNssZoQ79HAAURgsYIc sEhXb+2m+QMoziZ2wtMGLs8XJGOgRSqq2k3liIJwFgvIw9yKdwD0nU8LPX4BbZaEi4Etj1YqK/+
 tP7WzLFf28CXunmyYnV4kq7ddnegWuCvJAzJFwqOz91wioLk276Ig7HQbH4oPsrj+0h12fHj
X-Proofpoint-ORIG-GUID: 6jMIxtg089BDahVdu38QgBWcm8Znl-hx
X-Proofpoint-GUID: 6jMIxtg089BDahVdu38QgBWcm8Znl-hx
X-Authority-Analysis: v=2.4 cv=ItMecK/g c=1 sm=1 tr=0 ts=68093f1c cx=c_pps a=qvBKVd3KFl3zkoLf5jvq7Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=VwQbUJbxAAAA:8 a=3Aqenzv-4X21u9N0ePMA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

Change the references to Cirrus Logic files under include/sound to be a
wildcard of all cs* and use X: to exclude the three cs* files that are not
related to ASoC.

This means that new Cirrus Logic files added to include/sound will be
picked up automatically as an ASoC file without any changes to MAINTAINERS.
New files are most likely to be for ASoC drivers now.

It's also easier to manage than ranges of wildcarding for different sets of
files.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 MAINTAINERS | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ee4b262c82ab..6e1237af6ed4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22664,10 +22664,10 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
 F:	Documentation/devicetree/bindings/sound/
 F:	Documentation/sound/soc/
 F:	include/dt-bindings/sound/
-F:	include/sound/cs-amp-lib.h
-F:	include/sound/cs35l*
-F:	include/sound/cs4271.h
-F:	include/sound/cs42l*
+F:	include/sound/cs*
+X:	include/sound/cs4231-regs.h
+X:	include/sound/cs8403.h
+X:	include/sound/cs8427.h
 F:	include/sound/madera-pdata.h
 F:	include/sound/soc*
 F:	include/sound/sof.h
-- 
2.43.0

