Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94699221733;
	Thu, 15 May 2025 16:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326556; cv=fail; b=bbLeK7zEFUfBSWdKOit1PVfkLB9kmU3KuChCoIRAURlStdSd+BgPlUCNCjipmNh/8zylVMQVQteQ+KXQn7/WzfuXF9wVpayk0vuCdBBrEAbHijWaMSfprgDluS9Q5wFxTx1zCw+ZfQNPpRAOTNw4w5sEZEDTYzOC7yUXYT/4HZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326556; c=relaxed/simple;
	bh=W1HnvW9A1MOI5Ghb/wQgFZ/mWHSK3TPu/Yi+RQLr5+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gk9JhuVrIhNtjGfNkEZ2h7z/mBE8MVUYrnzWeBE19XL598p9cs5suayyBPUQ4yH5LkaTxEOkw9vrAVt9MxFTyeq01zeSoEHriGBEGRc6RGDS5S3ZLTqM1Fs3eb+liEgYxMTCXvOp+WIXBXNLcbny8YxmEcUdYlbd2m3zqW5PSVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=UpsvI7DC; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=icdm7aa2; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="UpsvI7DC";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="icdm7aa2"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FErK5I029269;
	Thu, 15 May 2025 11:29:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=nEGLOaw71Hn+jxzy
	Y5xJ0iVKRTYK5Dl0+YHAakhS31k=; b=UpsvI7DCtxN/ueGMalBMcsQHYMoiFfXF
	+9cJgw0ktolcffPpb9ed4SK0cJCns14eUPUwc6iU8YA6vjII6drY24nX0oYZNIMI
	MpzSnTexpwWsbvbP76p1xT9q/KYz3dRX23fMDgYO5pOwY4CsAlPDQwv6xGW/2msX
	QVj1opjDXJR9nRB+mcXrm4oAubAyvnoQDPZOaX/8NaNp50D0D9xS8cmwsuO4bUY8
	Xi9u8Vbuch/o/J+/W6em2p2tI9/8AG2gDgNKUslWr8AZ2Wn+2+VFzxs51BV+yBga
	t9Yzb2sOowSz0MK4cgZPX4wYFzQqyVoTonMwIlnoEeud9KMkGuV3WQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46mbe5bbj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 11:29:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uIcqyLD3iRQEFAAlYIST1603o8A48QNcLN/WIW/viIt7jLe/fRaJvdyOTa8B2otPd8ea0v+MSDyN3TAQaI+ozdGPJm7tAIWwv+pQ+okFNpRXBrqkk3fF49WEdKAYCt9BCfbIFEOQ8EZj/JEh+3/Q5Ks+HouA5GD5sHLV8wUmQ1szKt7WsIaLwG5xeLFmOBdjvpFEEzTV7r1cuvoxxbmKGV/ETkZgfqe3+ozqwatdjysSDYPaHqmXGgbgqu0b15Hs9uQ9AUeNJMpe9+OowRMr7WOigw2kk/dOHAIufFBBBpvuTWs84uapV6TmeI89+P2exboj92GmCt8zo/h2Nk/ULQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nEGLOaw71Hn+jxzyY5xJ0iVKRTYK5Dl0+YHAakhS31k=;
 b=CKhiKf/1xKQWtV1JRiR24OKe3GmlBBqhJ9Kp5ijT6plyB8julv8EbhzGzOF0XJhELkCf1QBNYDYVhbgCewmmr0hR60UcDIcCbc2uuSxSIGCAx9RXJ7E6Ogqoaiz+PnzlPpzCqrlozlcq9SK7H4fIKr+u63gLH9A4yZptVSfAhPJAvdpfhLfFUw9Urbf7bxSvRt5+wTJUPccu3njgUklCT9Kh+KBBZzgHZKjweipkNAtfnFvHlOaZ4sadyJpveVD2NYtYhvKhquAKeyL49I0pTZCsojPced4Hi3kfTbAz+l11VsS9oHB0dZF2CZgrIVYa1axhEmhYcPMoiHiRYQyMZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nEGLOaw71Hn+jxzyY5xJ0iVKRTYK5Dl0+YHAakhS31k=;
 b=icdm7aa2b1xw+xS7rWgwcGdIl7yEoHnDN/cB3eI3wCycH/GTX4WpAFAib2sC9Cl8b7KmfHwRga39oZixeYaDCCHbsGKbaaXhH97OJMSEf5pFzjoFlWpF/MMFtGRw5C7Q6dZYrNDsRXGI6CR2P4psh5hZEfmsb8KwkIsPlLWQ0h4=
Received: from DS7PR03CA0205.namprd03.prod.outlook.com (2603:10b6:5:3b6::30)
 by SJ2PR19MB7577.namprd19.prod.outlook.com (2603:10b6:a03:4d2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 15 May
 2025 16:28:54 +0000
Received: from DS3PEPF000099D8.namprd04.prod.outlook.com
 (2603:10b6:5:3b6:cafe::b9) by DS7PR03CA0205.outlook.office365.com
 (2603:10b6:5:3b6::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.28 via Frontend Transport; Thu,
 15 May 2025 16:28:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099D8.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18 via
 Frontend Transport; Thu, 15 May 2025 16:28:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 26219406545;
	Thu, 15 May 2025 16:28:52 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id D6F7782026C;
	Thu, 15 May 2025 16:28:51 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 0/2] Add Support for three Acer laptops using CS35L41
Date: Thu, 15 May 2025 17:28:31 +0100
Message-ID: <20250515162848.405055-1-sbinding@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D8:EE_|SJ2PR19MB7577:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fab2d1ea-af3c-4c3b-f2dd-08dd93cd952b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cqiivhWr+y+sYH5ul3aXbotEHZFVGCxt8XePn3ym18QA9zu2gV3wtdtKTcjV?=
 =?us-ascii?Q?ElDAteBVMCyGGM2XL9dotds2wfVWtI2X30C2okiakX3cKivXzraTTBIYgtUp?=
 =?us-ascii?Q?e0DshZEx6uuCIn3VjVsJgLbqck+6yDjUwk1rAV+lhyfDwy4Sw69dJT6e0DJ4?=
 =?us-ascii?Q?SWms9e2H6VgzJAiC5OgZ4aSN56F8AzSvYVoIGo3E5jD6G3TVNA7eN1SLnLXn?=
 =?us-ascii?Q?CR2JoznOasmHJIGNCvaUHJTcB+l8T3rEUgx6n2jpT7nKrPZyx3sZk/5uag76?=
 =?us-ascii?Q?yMCxM21GKDaqpJPzDgZHLLmfeiLEV6nZq2n3XBVPkloxmBf6M0m81Vvqnby3?=
 =?us-ascii?Q?ApPDoz9DQ7CFJ6h4gToTh/xHBPaIOSFchnpSRPW5b4OMQnrv6MeJDFflkFQB?=
 =?us-ascii?Q?dTcUBuxnZr0h/Hu1rITHkfp6x87fO0wPB7orYjxXITQJt7nRutqN7k+/Gf4v?=
 =?us-ascii?Q?fI5EUVzFp49rdRdZA3d0Q8UxMYZ/xwQpjdH72YWKgbZalE6AmdHWv4+WlTXs?=
 =?us-ascii?Q?RWvvG6UA4pIjlpsno2LeVPd9Cu26ZFc0UPa63Gbe39JKs/bVddLUwCwnYIEw?=
 =?us-ascii?Q?kJcT1HcMJ3UC6MVHg+zjrqvwe5eM+wbWzimy4XmphivgO0qJv1t0fhbK3idm?=
 =?us-ascii?Q?KoSTWrtRcijFvAZwArlbe1fDWHgkP7fuWD1qZNvWdmgFvurzMPHB7fIRaSXN?=
 =?us-ascii?Q?ytj+s/M0en5PTRUXNS1VeXQ7bsn+m5BdbboR6BQyQK+X7zs75FM/Yz3uXQB5?=
 =?us-ascii?Q?DxJ3Wn9rU1F3uzBNSszT4Wok9P5oGRsmLuI3LoQYvRITVjExPm40nh5Zaq+7?=
 =?us-ascii?Q?Ir6bq4wLDD81qmIBL6il3YCkMoh/5hAYSiShRrf2ijwVDbdbTSl2uHlXB4fD?=
 =?us-ascii?Q?qb0fDB9QluW0kcFPcruvn9s4PJxi5tcDbmQsrQ3ine8FisP0ZJFryieKlv0y?=
 =?us-ascii?Q?XeD/dpGvx8PDrb4IFNkfPyyLFss0azPW9IMSj/pSr5h2dTsVA5G9Zms7l2Uc?=
 =?us-ascii?Q?OrODyksSBBQRdbt1Ae3vbpY/lNteeGJXEGtYeB7RQob99v2VIWb3wiOMDn6n?=
 =?us-ascii?Q?N11Lp1grLdEFJRiUJOlVDnuboA4Cm+Dy+KUhyraQUkkmV+lX5NCUyzNC2Zgp?=
 =?us-ascii?Q?erTNHNxfN5NeKqP2vCiuG0P5ZyhhZe7J5Q+SfNwckySiUHFzlucN9o/Knrf6?=
 =?us-ascii?Q?VzJshDqoKZrLl1zDqjJOnE+WkHNuD+avUmLQ9zCn+Gz5lhkMoROzCKPZx5SE?=
 =?us-ascii?Q?GenliAFR7bRyPdkt7SZuvacyxgn/536AgNMvT86uk66x4ol/4z5AK6rn8k5/?=
 =?us-ascii?Q?k6RICI6xNYAkDiDIG91jnKRgmwUXDOdzexKd7lL60rg7X8rsR4D1OXVXA932?=
 =?us-ascii?Q?qnL3T0NrckcOCrYa5HYx+tJMahXfVEthijym49L6IICv+FW1iXRW7Rvdv+XJ?=
 =?us-ascii?Q?D82tiiJGZOfQoiLrjKzP90BcV2K8frT1HljdMaRkyp9XkyjUCdN/W/YlD4n2?=
 =?us-ascii?Q?0xv9/IeHvzkUvvkt6HqeqXv86oXZlfNC3Ldo?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 16:28:53.3951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fab2d1ea-af3c-4c3b-f2dd-08dd93cd952b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB7577
X-Proofpoint-ORIG-GUID: LeY9brle1dkFUdnv7E5n2zUd0C0ZIxIp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2MyBTYWx0ZWRfX9knbs8XRjlF0 7pRQedQHrHTmBROiuL8zev36PJasFVgEhIBx6/RmikU7mRJ51eVCO9v5Z0WhF+hfZuWS+cGV5zF S8ZanxtHsUucMwO0lpL+qz1R24J7S5YLPqnOuxIe93JfBTNKP2Ef2Y0Sby1RY4drrdGWHl7bDxX
 2YfAZ1KoYntr6zUYyPWY1rC3XJbgE/y8g2bLlhkNy9YLUK/uuPS7Icf3J7dQAbLHnQaX7CHlcNX PtriuCiZSDATdc/serbq2nxjM7GGChQrlrUVaeJsPlIanWmTmSV9/qPLhDwzB3uchyzToXI+1QY zcK094sJNkh8X0OVBvs7XyaWAG7Fwq4JOh77fD/UCMzVhOu1rgT+F70y/vGLHgcw5/98s8hGr9Q
 qCulQ2RuUkPKemKHH5xkfggLE+27pmxBSeYZjtdpgovf6w8xoEn1Wzaaeo1Z35PSYz6ABu0r
X-Authority-Analysis: v=2.4 cv=eqLfzppX c=1 sm=1 tr=0 ts=6826164c cx=c_pps a=gaH0ZU3udx4N2M5FeSqnRg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=RWc_ulEos4gA:10
 a=Zjo8pFjcaZ4ocmjuABIA:9
X-Proofpoint-GUID: LeY9brle1dkFUdnv7E5n2zUd0C0ZIxIp
X-Proofpoint-Spam-Reason: safe

Add support for three Acer laptops using CS35L41 HDA.
These laptops use External boost with I2C.

Stefan Binding (2):
  ALSA: hda/realtek: Add support for Acer Helios Laptops using CS35L41
    HDA
  ALSA: hda: cs35l41: Fix swapped l/r audio channels for Acer Helios
    laptops

 sound/pci/hda/cs35l41_hda_property.c |  6 ++++++
 sound/pci/hda/patch_realtek.c        | 10 ++++++++++
 2 files changed, 16 insertions(+)

-- 
2.43.0

