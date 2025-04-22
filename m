Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADA91BD01F;
	Tue, 22 Apr 2025 12:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745323934; cv=fail; b=H+DHZerK9iC1H7MavTWvglIeDV2cBkNCk9Kaqi4UapV7tPhlj1ur9Zziiz/q3SaEGAjKPHzBkGEUHdd0J1UPL1GFN04AYSCcAmnt7O89JX2XU3LPS7XZGzgcHYWqiFeFocGydjRYdisUMSRNAZKSpMHTjKn0IeWgUsWK5bHFdaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745323934; c=relaxed/simple;
	bh=rbtBUTW9b0GxlurslPav+CDKRoVYu3NNUgtGeSZNVI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+cd98Gz9x1F8MvLvJVmvHyxVdZRY/LGNosujAFcwvRAxq10BOrVfoQxPYHHIBoqRh3TvUH/dbmexoK+19PZA0LdZyzhIqR/iBAIdeaQMFtf+N8OPbdh5V3vgMWuPXTKv39aPmniLIcaAj3uEFiOwsziOIEDQPUCJdWtr+FYX38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=WCft//a1; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=FUCYu4mj; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="WCft//a1";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="FUCYu4mj"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M64OVV004540;
	Tue, 22 Apr 2025 07:11:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=rbtBUTW9b0GxlurslP
	av+CDKRoVYu3NNUgtGeSZNVI8=; b=WCft//a1OKNm9snIqBbbaf2LB15Q40bytj
	oRXWvP76rQsq6D8wUA2ZkfvUBITrQBxVRksW3ml9bvkUNb8MaY+UxHkJdnuCpx2R
	TqPkC0ucpWQU1YyVI9hxarNp5aY/YgPc7H4D2BPtqVp7+puboZcU+VZmdkmSBZ4v
	L3lnmEOhyP9Zq+5K5b7RGK+wCYOjSKEk5LvmwjNdsMqHrckHd4T15fQeSoFPV/YM
	OVx9AQ/tFK3yDTAeAOaX5OcM7rrx5vmC4t4Ik1r9O2Eg7EEx92Cd8UouQ7l/PaYs
	0puTRXdXWtlgSlZtrXz+dUZ0FFGUtbNlsms0BFHOTZgIKA0pnNBw==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46488hkchs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 07:11:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8nwpKK3y9IviY4gwRRP4VBmcL1Wi5jYdwPxPvfJD3wZ9wp7i/WLck+CPo386LpxhNPpxw4q63P9Wa8W+CxOyGr5QkTW4FxlKgpCuvwxqUOQoHJb1qtjHCx816vwhs+Fv1zGXfoVyo0i6AhqgmN4ZXMHpnjVbAiO/rq0vgoS62Vciimhpk1Pjnf+YHJXjh6yqFyLMVrXAzgTwUVza/hlgT9HO+t0s3IUQXm4nsuNUgFm8JcFgj2xwbXeeDOI30uX4YEpBSds0bsM7d/V7Uk8wqwJ4+4wxC8AbHdsHAQGurWIwt2mIeoZeNjyyPNbUZMJrDoOZiuKRQw+gOeWreI76w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbtBUTW9b0GxlurslPav+CDKRoVYu3NNUgtGeSZNVI8=;
 b=rSFDCyR75E3ix7XVU2safHK2qTdXUpQwxT/1D5UUrXeYPGJ6vXUDvNsWDtTr7d9XL3H2nqnEm7JkXDMFj60brWZFOSoHYG1M2kiSmOXINITGrjqJT+YW0GcR7QWoyWZPCL9mGNg+vzbjJqVmQSccBCmcth516gA3RQ2I+dydiobBLFTijiwLtT5w+WIvQ924a5DC10/UmJ4UxTl2tl9Q6qWE5zUpuXw/lXbuopu0MuRPfYwogSgy9EUNx9g8YKROj3Jdd/UpdL+QvdwCAvI0mQrHjCzJYb95WjIW8XBdUX3XCu4W8AeYdI0HvFmIiVwy/47EMj0TVZixIC2UNqn+eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbtBUTW9b0GxlurslPav+CDKRoVYu3NNUgtGeSZNVI8=;
 b=FUCYu4mjPHb0Kn9EGXvLp1E23tJpbcfD0PAvsNUdeDls3GXb4Ul2o/QJXs5+ZnNAkzN23cgMbVdjbT7FMjQEVswl0Me4DB6i9eIuiucpaufsqhZ3exQBw0Aaw65u2dp/xpwmFx01LG1MAZm+BRxPT3mBr3jdrBqFm/9iSTHTDRQ=
Received: from BL1P221CA0031.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::10)
 by MW4PR19MB6673.namprd19.prod.outlook.com (2603:10b6:303:1e9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Tue, 22 Apr
 2025 12:11:50 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:5b5:cafe::9c) by BL1P221CA0031.outlook.office365.com
 (2603:10b6:208:5b5::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Tue,
 22 Apr 2025 12:11:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Tue, 22 Apr 2025 12:11:48 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 840CE406541;
	Tue, 22 Apr 2025 12:11:47 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 6609A820244;
	Tue, 22 Apr 2025 12:11:47 +0000 (UTC)
Date: Tue, 22 Apr 2025 13:11:46 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 2/2] soundwire: bus: Add internal slave ID and use for
 IRQs
Message-ID: <aAeHgqcQCtuFKW/A@opensource.cirrus.com>
References: <20250422104245.958678-1-ckeepax@opensource.cirrus.com>
 <20250422104245.958678-3-ckeepax@opensource.cirrus.com>
 <b286bbf3-0da9-4e84-8d21-7720970833c3@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b286bbf3-0da9-4e84-8d21-7720970833c3@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|MW4PR19MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: 95922fb4-cb87-4a4f-86c7-08dd8196dbb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AW4RP6LPNDeJl0T6jWDqFXB3a/zm3Ea59IKBOuHVhVAd7yWs4Ice3rAB4KPl?=
 =?us-ascii?Q?0TneYT8cw/qkG0od6mwSBKpK6bUhgEGRF3/2s4QUZ1/J/O9o9ltfVQwmk2I1?=
 =?us-ascii?Q?H9lBRv8+Z4EggXo6dWm/d0Jj5ktdqTbG/S8i+GButqzFpJiZwniGbgKLFL5/?=
 =?us-ascii?Q?yM5OB3dQSUf1vv7FKomNPzA3Bq8O8pkOCqcFh9lngoZqbsGGrM7agm+vz/J1?=
 =?us-ascii?Q?Xiogxgw0pBPJSD+mV1xXSZQuNk5dJsZDx//VoO4bV0Jk9mBCnzcXbzFKQKWA?=
 =?us-ascii?Q?jYrGSADe2l5QZK8+80ng6/WohIPp7/DnlWXZ4UZOc+s2o56U4ImzzuBtpf15?=
 =?us-ascii?Q?5Mtwza9DgOck86lplxpV5LPlkU5X0ISprJBLmzMyeiLFCyB+4OyhjFP8r8WJ?=
 =?us-ascii?Q?WSzD1jVNsSR2nwNE7AZuMjSCfgjIYBveDBRNiu4+q3al3AO0Nfw3WBThlGlQ?=
 =?us-ascii?Q?e9QsvDY9RN166qRXQzYuAaIXO5woq3td9UVkiXNnySKQsBrB/AY69CXUQbPX?=
 =?us-ascii?Q?Ls5H0a8FCSwzVnuzD8nBqYZtw7rTvauEHbWZmH8Dq1+LYkijmtZrn2To3pg6?=
 =?us-ascii?Q?c6lsZq1KYAyK/f4Zew2YoMOaK7zGmkdQD9NidQojtFRMW3IrYsDHjt/w5gYx?=
 =?us-ascii?Q?NSGLNxKX8aODLi39b9vBSrsFpGhpvNpjrJPBtozGB7hZECd9gZ5AegAZtsk/?=
 =?us-ascii?Q?+phpulR02ner9N3Rl3ynvNl3qjH0SdCjZL4DuJLWlzZxt6kbkP+JxjWLEV++?=
 =?us-ascii?Q?X+dnquVx8FlZ/ZePnKCI9VwfQfa2Ei1mM/pfCnRgTdcMPIpMLL5d9hch+90L?=
 =?us-ascii?Q?WxY+qBDIrTFsdOsM6AUT1Qcz4Rbmqp56qWXSGm/qQxXPkFcXK3WLvQ1UDQ9Q?=
 =?us-ascii?Q?n9KgvCFtqarD1YWUEFeiv3tmLRtbdkFr0F94dB7m6PWEZygAqKJcEaOfkdkP?=
 =?us-ascii?Q?PICTMzFAxUiOxkfBFxgdmWDqKOgqg1TfzZENiEk7q8JAzjFA1b0DnxlG+CC2?=
 =?us-ascii?Q?FGHtJTCuME3ZBwSR/lc+ynNLi0PNMYWAFHYmS/6z47hKmIa4P55DWloJ5963?=
 =?us-ascii?Q?XPcUyNnm/BfiRCkKwfnHtkJahnT8hbDK5/Z/E+pr6JRQoq31FGD4rCZrXzjD?=
 =?us-ascii?Q?foumH5vAH7+c2ihrASeHsH+Xf201k7r6dkj9ujwiMymzQAMLpZHVGFGQYxTt?=
 =?us-ascii?Q?kVW7M06jeOGbZRMIEWf6irjUqI9BnEQEAsu1mJhHPI70aDLmblg04AkXEDmo?=
 =?us-ascii?Q?p7U/+ys2/rbjpqQGAWR36hTZ/Z8hJibyGOCQ19caxG68sVyn5Ehk0Zc/Wa0r?=
 =?us-ascii?Q?/8Tki6wpE9BV113Vxlt83F2UBzrGTfcnH45TDZKJWHhevbuyleJbRIgTbpuR?=
 =?us-ascii?Q?udOjY8C03hlq08uneIB9X8jpmIvNoUNIpTN0RzGM/iqM6NWIWs2So9GLkLB3?=
 =?us-ascii?Q?PAFdP6McUYTPzo9yHk7NnXxuuCagjxpTv0N7F624MEgofOagaGpZvkYRpN15?=
 =?us-ascii?Q?bvA6XGTIwSYfUJSCZvnVHkjvtJLF7dJVLqCQ?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 12:11:48.5565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95922fb4-cb87-4a4f-86c7-08dd8196dbb4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB6673
X-Proofpoint-ORIG-GUID: F1xw3IrWdeqwPUDU7x8LD4Jhhs2cor9Z
X-Proofpoint-GUID: F1xw3IrWdeqwPUDU7x8LD4Jhhs2cor9Z
X-Authority-Analysis: v=2.4 cv=K4siHzWI c=1 sm=1 tr=0 ts=6807878d cx=c_pps a=5b96o3JgDboJA9an2DnXiA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=uirywaaGSbJdB3pJcw0A:9 a=CjuIK1q_8ugA:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

On Tue, Apr 22, 2025 at 01:50:13PM +0200, Pierre-Louis Bossart wrote:
> On 4/22/25 12:42, Charles Keepax wrote:
> I see the patch add a limit during probe, so now that
> means the number of ACPI devices MUST be lower than 11. That
> doesn't sound right to me and could cause some configurations
> to fail. It's perfectly ok to have ghost devices and no limits
> on how many our BIOS colleagues decide to list.

Yeah it will limit the ACPI to 11 devices. I can't say I am a
huge fan of the "ghost" devices, like its ACPI it is for
describing the hardware, so it should describe the hardware.

That said my thinking on this was I have not seen a system with
more than 4 real devices on a single bus, and not more than a
couple ghosts in the ACPI. So this didn't look like a big issue.

> Using a dedicated IDA for IRQ mapping looks like a good
> idea to me, but I don't think you can really use the same IDA
> for dev_num

If you are really concerned about the ghost devices I could back
out the part that reuses the ID for the dev_num. However I do
need to know the maximum number of devices when the IRQ domain is
allocated. So I can't really see a way to avoid picking a maximum
number of devices for the bus. What number of real + ghosts would
you be comfortable with? Although I guess if not using it for the
dev_num it is then fairly easy to expand if needed so perhaps I
just back out the dev_num bit, but stick with 11 for now and we
can expand if necessary?

Thanks,
Charles
