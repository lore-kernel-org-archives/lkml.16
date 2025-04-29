Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBFC2BCF7E;
	Tue, 29 Apr 2025 10:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745922040; cv=fail; b=bxhSqhW8mnJmidWfcfvYVDnNr8/N92ezhS907lIfqE78ihETTEJmPgYK+slNbBNBuZuGyDdvj4hCx8n4CGIifdyS2sP69tGk40Bzf8XUUWhYG1VW8S/7KcgWQgXBnERqC9Q/SoFujZbVkl2I+DKN8AdBP/raJz1REXmCGA5fNX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745922040; c=relaxed/simple;
	bh=+OvTV5g9VULHq1l9axPJ5qrjgIiYnGka7btMEWTCRQE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=UkS1HxjWSsDvAvDZPXavfUKnOFQWWy7iyzIoWtMrqDVK0gVMT27qKn3HagPVCbr0eDmRDoth4U5ThZmngSqC6vM9CozDL61h+32tSIxhORKz87tbyzIaiXQRPmjDwhzvip4Y+TJ1zb3wYu7CzIiJfGHr0+EQsm714cPPMcpQb0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=T96GtDFU; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=N1aMNOIN; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="T96GtDFU";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="N1aMNOIN"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T4d24S007326;
	Tue, 29 Apr 2025 05:20:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=dNMwNvkEqCDpTgSQ
	kMqpVXxVSw61gJUdBeL2eIuKYus=; b=T96GtDFUKIsWgnRP5vnFoQFtJGqwPeQg
	uLewYNInddDa19NVS51NR7Mb2IbXeR37iYnQUpWa1O2AQhNW3uBHJAVLDRLlc/xr
	7+BLDWWPufEQhROpWmYTYNpUVNcPsAM4gE5jU6hnM0rTArV9B8vGOMEhyo39aksn
	f1sf8Ql+8g1AelVQSVQaY8qqrUVJQ3bz9JFJgTl8bd6ghSonTTPcTioZrL26RIkf
	1qG6WGNS7rJyI1DcTEPR3aJ59FTX8kG5ldvfgRhVTbgnvxjv2ZoAeslgOSVKJtQZ
	Ui6EED1VLFauTLW9mGsJNJ7PKezvTdppd05Tp9NAGj2+WgkxgMOOTA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 468vw1bf0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 05:20:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xL1YfSsEX+YN3CEoeezDoYVGh34fRJ4RUhpzqoqTVJeQQOUumRMzHIS0VdyWZpo0Q2hXg0q0WHIoeTff0JXY9KHTKp/LrIm6DNoePJBPOktZZIOGxFxmlmJbpm9mmSl7BZp5q6DY8o8UKMcKQD1ydDp2mWZS/46TR+lc4mAPn++jVX5pXG9z8PIZoNFYcQiVPB1wCkJvSvWXZtOccAkMacHF/7K0eu6ciLwaywJR18LDsCXyfJTo9qARXnsUgmbaHVdibw3pYhbSfEDVrdZcpWQTJlWsw73WAivRfQG0k75UFy6MXdLvPwUqtWynvkLuc4+2dJII+y/OaGIeEoVbkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNMwNvkEqCDpTgSQkMqpVXxVSw61gJUdBeL2eIuKYus=;
 b=ftRWuXri9yCiN2hC+gL/yDxUk+fz8CcYefUk2romvBJs6wG5WQKeFEZnWsgtunkFBPAUu4JioSc7fkU26qOBrYCi4V6gK9Hv3hWyxW04XDvthGAjxLD3cVku4N8kwqAh/Y3eeEn8FBUSccVsoojX/rA/qURjgvTTHyCAM0XDXWo5ZcTj7x19WJx+7l+UH2xtImQFsM5aBlWH3uDsZx1U7+6swbimPXmJV2yGMTujwzKAvFE09IJ1UE5+4oiNV9G1mxuvM5C58cEpaV/+whsXUXuIf5xFhhJuxCrseGWNYlJBIEIwzhdsb0rT+ZhCuWwfoAN1hLlBwUc2LbJenPU6ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNMwNvkEqCDpTgSQkMqpVXxVSw61gJUdBeL2eIuKYus=;
 b=N1aMNOINtuQ8vIxciR2PPDYyBmFEl8ZHiWf+TYeVDHQTBOq2cGkSnOZzl1MSFg+CpF6HS1SGkO3ncQmVX7XR25zGKD4dzz4h1kse3+IbS2eHbd//wF1xw/7YBY/ELvZkfsryxoEXfP6myekyPTY2YY/uvrfa+RRMDOXkS0I4Qwk=
Received: from SA1P222CA0131.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::12)
 by BL1PPF2C11DB8BC.namprd19.prod.outlook.com (2603:10b6:20f:fc04::e91) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 10:18:11 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:806:3c2:cafe::4e) by SA1P222CA0131.outlook.office365.com
 (2603:10b6:806:3c2::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.38 via Frontend Transport; Tue,
 29 Apr 2025 10:18:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.20
 via Frontend Transport; Tue, 29 Apr 2025 10:18:10 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0C709406543;
	Tue, 29 Apr 2025 10:18:09 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id ED7DE820244;
	Tue, 29 Apr 2025 10:18:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 0/2] Fix minor issue in SoundWire slave IRQ mapping
Date: Tue, 29 Apr 2025 11:18:06 +0100
Message-Id: <20250429101808.348462-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|BL1PPF2C11DB8BC:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c9f5298e-13a3-4bd8-957c-08dd870724c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WCOErA34pnW9lhb8MfPQYcdLxoGGAZFzL+dUGne9Y7G3e/eGQLfAYNILcFAm?=
 =?us-ascii?Q?ChcZWY/6K4X9ETywuG5RVMRrOiV+x4wEpZMqZvdvFf8Mf7jj6MJtGoZgMiB0?=
 =?us-ascii?Q?YQuAE06eJlEywWrAw/MgLMEfbngsAlwvD5qOY4EyIdaIusFNyoLZqzPsYDME?=
 =?us-ascii?Q?5MMqGemd8UXmQVrsDb/8BsyKxSYqE4GaHG10c/4GDJZLQfiT45hmXWdm3UAV?=
 =?us-ascii?Q?+ykpBurufCLhVNvjF6uB5tSyM7llFHZLzGkfHmQwvVrV/+NSpZGHoxqr84wa?=
 =?us-ascii?Q?TfKyq74Qo6eh1ZBz80Yw7oDkEIV3lSmzjgUrT485NRGypqIDApAqf2C0UMTL?=
 =?us-ascii?Q?J7UwpXWMbHPiLDOWcri4u0u8IsCD9/Klk7iRj8yTBIvnAGtyDMluwEhdy9EA?=
 =?us-ascii?Q?r9A9lW0PFHi8JszPBo76Y/NVMJ9s8gwvElIS+NRjjKsAntNOSGGNxTVffhD+?=
 =?us-ascii?Q?ZeoNcOF5Kpya/SvRJA/nR3U6hk2D0B2g6XTStBtRayvODNM7n7Ze4G8yWJON?=
 =?us-ascii?Q?HqjvMAWlIB7HatRz5qzg9VDvzPYFjbOeidkyB2wuSy2jbRm0IQdkBJGu0SAY?=
 =?us-ascii?Q?SEvN3yee8MAxDVOILBvJVNZje+mm6rQ45c5n9QNm8L0+SDUM0KjDre4J4yOZ?=
 =?us-ascii?Q?WNrrzyMYBq3YtFhHbyTBvqxnrW1D09j1fOBL5KiEOD4k6dpZ+R07SRtvyiwA?=
 =?us-ascii?Q?PNKNdsulyHLfCz3Yx9T7pqIAfZL/sBp+PFt58YTEa0/3v7RZ9UyeMi9nVwKZ?=
 =?us-ascii?Q?dxO0Amx/Vfjqwpa+uFXINLAsePZePEB1cWxYfrdKGzdvn6jZ+SuSBfX17z74?=
 =?us-ascii?Q?HE80liUH1LqKKE5oZvfjOoAl+Ix2iB+lvkIejN51R5HODpH/x2Evzhf00r+e?=
 =?us-ascii?Q?LRGSnE4MitWJuzY9QvniNORO+MMMglCAJI95st8SaHLXkdm2y76hfg/cAAgh?=
 =?us-ascii?Q?EZ9A0ppi5/LMu7jU/qcXgGdnm+Xg0sk0PsgI/MfgGcaqp7mqOw2B53A3mlkK?=
 =?us-ascii?Q?3YbR2s/qPwbV1zbojesyvH9nY1YA8hlEEUBmA98K39Cc1HMizxIGqIc6bMeP?=
 =?us-ascii?Q?qG3Q7VpgyJZI7gBb7pEJCmRPb/KUloqKVzNaYQfebpPat4rZMt31PVX3eGxv?=
 =?us-ascii?Q?C2EWWJ8JtQsgwMfuSVAQYw83Rvt0xirqx+f+PKT+bx6L5yfBFq/b0ga6+3aG?=
 =?us-ascii?Q?8GwIBpKooEea5KzYC0/OcibnFu0kw6tn9yOWSHynwCZ6VbXcwavBz/dPkj0U?=
 =?us-ascii?Q?9AqjlfuDl7tmPqzZ8RjKbio8+DXXQbNF7c+QydDHfqEQhyhT2gwFmsfn6SFg?=
 =?us-ascii?Q?rGYNpYmOoRYCv7HpWUMOdTUkOcgYYLg/Nmz6Ww5/7EZzGG1dXZoVyx2r4/pe?=
 =?us-ascii?Q?GSUGCRA4vfDm0xpDuea6ztPfdyK0qYFl3B+gJko8Y+tjh28Qzg0FHOrXSyfP?=
 =?us-ascii?Q?l9zQnh46/oIYL2snRFw085+Hz+DjM0NENIX9CFrAJGm3eFcOx4p287KS4A1W?=
 =?us-ascii?Q?O0NmRATp3ntev7L3DbOsckPNlxcg4dzAfFMU?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 10:18:10.5447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f5298e-13a3-4bd8-957c-08dd870724c9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF2C11DB8BC
X-Proofpoint-GUID: OMC0O2WTG0dZD9rkuqBinzuCv_97MYOq
X-Proofpoint-ORIG-GUID: OMC0O2WTG0dZD9rkuqBinzuCv_97MYOq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3NyBTYWx0ZWRfX1oydDy5rdP2d ETST95FR9qXEPNSw1PlmQ56BiMvi3gbLPBoKEypIDcHSgApjlpsKO0usLn92OHCNWiyax6p6WlQ 2QlDCC+gUt1ZcBQXkyiEPjhzVfSgTsG2ewTYwUxK8XAUQyLNrkp6dbqzrGlpMh6Ra31Bbi3cw5+
 i3NLvxFmvQ7xL88d63hl2RPUG2KZC0zCKPS4pbyuPpULkL7Jebk07jRt74dpzmsXBln/lpx4rOT jSfiy1611zejWiQngbDUia1O4NXlIT1zB2eJuB9phLCUvPi2L3SLLPWHbgv+GIfc0O7kVDfI0/f 8b/PkziHVunviOtE15oVU1Wkwpdwb/v1svJpsfeX9lGiALYgqLxCocs/SK0cMyRjOAUHZ4a+Kkb
 y8MEPm334QfRLXd/9031PtsGzOyUR9qQ5keb3ZRZ1KYt0Q8JPGJC05pMAjcHLPPCUr8Oe+nn
X-Authority-Analysis: v=2.4 cv=Dd4XqutW c=1 sm=1 tr=0 ts=6810a7f0 cx=c_pps a=oQ/SuO94mqEoePT5f2hFBg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=m0UY9JpATuysH05ubQMA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

Currently there would be problems if multiple devices on the same bus
attempted to use SoundWire IRQ handling rather than the IRQ callback
mechanism. So far only cs42l43 uses this system so this hasn't caused
any problems.

Thanks,
Charles

Changes since v1:
 - Don't reuse the new IDA for the dev_num
 - Expand the number of devices allowed on a bus to 16

Charles Keepax (2):
  soundwire: bus: Simplify sdw_assign_device_num()
  soundwire: bus: Add internal slave ID and use for IRQs

 drivers/soundwire/bus.c       | 31 ++++++++++++++-----------------
 drivers/soundwire/bus_type.c  | 10 ++++++++++
 drivers/soundwire/irq.c       |  6 +++---
 include/linux/soundwire/sdw.h |  6 ++++++
 4 files changed, 33 insertions(+), 20 deletions(-)

-- 
2.39.5

