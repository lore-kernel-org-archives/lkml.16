Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC66514A4CC;
	Fri,  4 Jul 2025 12:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751632456; cv=fail; b=urU/0AT/LAFMn3FF2CcOrTxfeRLQJHMmr7sC9vu5ynQRQRLVG0EYWbkW6kO7lbk+xU1GjvwTSSwIpd2HVwuy5xmRLMMi7W6haksulmEW0+zf479qjj4KuZeG+mAaZjTyOsntFk3SHndOmCvx9s0iJgkWKbf3LYJdma9ffeiBUTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751632456; c=relaxed/simple;
	bh=oNS/pbChRapBZd0yH8Kq1LphBh5DXn0FF4WSdctOu90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cspTidj49UXzPolJGEgleDTeS0XGBpXS5fWFLD3VXFciFPLF52KvOCxn7BRO5gANrNjDbdUirIcIRHg8lLdWTP3ZDsMUUJ/+YRNA5ZQrpk5/IRRNeM+1HRCrUp0TPFd+sGVe0kIpuWnMAUzC+jxJCrCKf1gBiAOZwYca40xP9sU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QYVPkSb0; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=delWKJQE; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QYVPkSb0";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="delWKJQE"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564BTcpF031670;
	Fri, 4 Jul 2025 07:33:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=RtdMTQ4mrZIyv6WDFSkW8EU0AaFolEl13YZbhUDaEWM=; b=
	QYVPkSb0fyB0JjsuuyMub/HMcvpcwXxrBe4XK/C5XzuN2Lo5WRowfcODnQv3q2hI
	CZdOvITmzZFx3v1EZxC1sTaZ/gR34S0MBEYl1YV0Ip+YDw1R5X+cvN1xHIS+fosb
	4gpM+WA4SuQ/6NHCB4x2yRZiIZfgQelBJKN5qqlLHm49+9KvzFwnCBaDlt89xCH2
	6/AChaYlD2cPWy5GFxb76bihJ3X6SJvW/gGr34XeXlvoAPbhzThtDvPvotiy0vUx
	EZWFJvAWdTnd+CVhcIqoLDBd5tE3bN42Pr3KxZ0SsrEI1cmGhc4/3LrTjooeonZ4
	w+eZsChFsV0eOqhgbAs8hg==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2112.outbound.protection.outlook.com [40.107.243.112])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47jcth8y3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 07:33:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzsROnznWNA25dFRrm+hkxLQzyXM+u2V8JjVUX0fbrXPEjMcrqahUtW3vkbI1NXb+XZT3A+SQMzhsZOBOOCuTThzooRXZYb6hP4QyQNwI2nJ7GHq3lBvrU/VqNKjpM8p7HOM+J1Zv1WMU/QBUc8JFVBXBEMNcNyRHQQcI15jclUKS1smaUEa2CD0SItpzbw7KxS6jKzbUs26CHORY4EEOd1tcsvE5SVip3yHae3hM9pn8xVkX3g+RjxGxF/QrEueqayvuasg01CqZYPQXejbAEssLW+0nLkAQrkloLcYeaPxyj8pOMDO9Cvua4PwqozzKV8kUg2jTJdgrNNDsv7apA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtdMTQ4mrZIyv6WDFSkW8EU0AaFolEl13YZbhUDaEWM=;
 b=JCkVJ1n7Pn2FDeH6cg9rYVGohKeAuRjoJWhmR6l2GN/iAWMUPcEGGh40v/4sHQtoP/cSCSvkE20M4T2b+RBAlNvlsrHOo5wPFkQwMl3Nnq5t/zQmmncaOmmbXi3+onmbo5BYRjshqrYS19NurDbT6M+LnoxsHNNdvmupz/t2HmIuTyOrqHWEjIblKqAt+r8x7QQSfCZ725aJRqJkV17joRWQUPyDbpNdpOdCtwrYzNn8Wlp7hy1V7VMUxp1D2iwb7BzBrsJUdjoevAsKAdqEolHhR4Cl8dnGrKlrSw5JCPQi7JaBMGp37QVNBAtrbS++pGOfcEwfh1PAx5bhW5Eqjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtdMTQ4mrZIyv6WDFSkW8EU0AaFolEl13YZbhUDaEWM=;
 b=delWKJQEu+4cY7mvjgufZlMHBjT4mAUYXxaRejLuyws9cGZjSdY5SoMrJiB0st48IeAU1rY/2f7UwGFc3PQ8aqn/f0taXPIKnDC6Ybv0b3Wuzf0GweX4qlUlS8hy5WdUnia+H0pXX3uvUTnyAn1v2+WEfsFwmH6b6CWplCRFTns=
Received: from BN9PR03CA0324.namprd03.prod.outlook.com (2603:10b6:408:112::29)
 by PH7PR19MB6954.namprd19.prod.outlook.com (2603:10b6:510:1ee::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 12:33:47 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:112:cafe::71) by BN9PR03CA0324.outlook.office365.com
 (2603:10b6:408:112::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Fri,
 4 Jul 2025 12:33:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Fri, 4 Jul 2025 12:33:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E2C4E406542;
	Fri,  4 Jul 2025 12:33:44 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C65DD82024B;
	Fri,  4 Jul 2025 12:33:44 +0000 (UTC)
Message-ID: <07369447-2b90-4174-8c77-a406cc57c055@opensource.cirrus.com>
Date: Fri, 4 Jul 2025 13:33:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ALSA: hda: add MODULE_FIRMWARE for cs35l41/cs35l56
To: GalaxySnail <me@glxys.nl>, simont@opensource.cirrus.com
Cc: david.rhodes@cirrus.com, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, lkp@intel.com,
        oe-kbuild-all@lists.linux.dev, patches@opensource.cirrus.com,
        perex@perex.cz, tiwai@suse.com
References: <002901dbe4ef$57d0cce0$077266a0$@opensource.cirrus.com>
 <20250624101716.2365302-2-me@glxys.nl>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20250624101716.2365302-2-me@glxys.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|PH7PR19MB6954:EE_
X-MS-Office365-Filtering-Correlation-Id: f90b02a0-271d-4523-b845-08ddbaf70524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V3crLzBHNEZoTEZvd3dmVFRjaHRYeDM4VGN5aCtJeVV0dk5hVE1LNlBFNXJU?=
 =?utf-8?B?ZGh4Wm5peWF2ZDdoblhLMG5TWXA2Q2xnL0o5ZVRVd1JvWkQ1MHJPcHBzSHAr?=
 =?utf-8?B?VkczbDduZlJiUERNaXAzcUpqM1hTWS9JK1hvZUl0ZHpPNEJzZFIyOFNpa0R0?=
 =?utf-8?B?QkRoY3NXQ2xxMFRnMCtXWjZpcHkyMWFKT3dXVkVpTjFvTzFwSGxsaEFpR3VU?=
 =?utf-8?B?MHRoOTg4L1pFOEo4UXpNdmRCZUVmbHZXTnByRDlWRk9panB2L2VUTEpNYVBO?=
 =?utf-8?B?djJtdjZZRmgvNk92RmN4SGlMUC92THpxT1VPQzdIWDNaa0s1YVE2Qm9iUkEr?=
 =?utf-8?B?VC9LNHlFTkgwVEtQc2N5V3BYYnJVTlVpZzJIOXpPL2x2NkN4d2hQdHZkVjgv?=
 =?utf-8?B?UEtIaVNoVDVPU3pwbUVkb2pNcWE5U3piRlFHNndIZVBZcitBMGpEbzcyTXNX?=
 =?utf-8?B?eEJJOHNJR1ZxR2dybEpSNnlyUDBPT2dKWUc5UDI5SnZuQVBORFIvT0ZLSWho?=
 =?utf-8?B?dEVSOFJ4STZVaXNLQkVoUWFwZVhtNFFkSUF3K050QjNMSVZ0MHMwbHViWjVC?=
 =?utf-8?B?bzJ4MUlKUDh6QjQzMWpOWHNyRW4xTEpCTFRyOVcrNW4vQWt2ZmxvZXN1a2lo?=
 =?utf-8?B?NWNWaG9Gb3A4em5naEU3MnhPQ0lmdmhJcWxxWTNtSjhWZ0pSRnFXS1RqeTA1?=
 =?utf-8?B?cm5TUFJYNWxuOUtEYUhQY3NQRWMvVFQ2ZGhpN3JNa1Z1NG5CdWJrakxBTWJO?=
 =?utf-8?B?SzM4cWlmYUYxM2VYeDI1eVQ1RDJUSERzRkhwYllxVGVkVXJUeFU5cU1GZkdn?=
 =?utf-8?B?Q2pIWUVjazNxd2QvV3E3ek0rcytVUHRPTVR6REU2NXlZWGV5aDBoaWRoT1dF?=
 =?utf-8?B?ZTYweVZBWHpDZXJWdGVObDlaQXMxK0lOcktpYjJvdEZhcE5HdStTbDR4YTB1?=
 =?utf-8?B?ckI1VWJua1I5MGZJcVVTWjkzTnBMV0tLbzNBUGNkeVp1Zi9xYjNLMm9pVFkz?=
 =?utf-8?B?UEhoMHZkdnhRSnBDNlRTeVJZZWx4QjlhVmdwSXBPVldoQ3ZqekFFTWpCcnFu?=
 =?utf-8?B?QlJQcU5LOEtnMFNyUHpqOWVKYUdYN0k5NDBtbkJYL2FFemk4ZHV4aHRSNFBa?=
 =?utf-8?B?cU1zbHBxN3pjQlJjcEJLa2V2V3U0QVdwMzZSUjJzeGFXMVUwQnJaV2FqRS9q?=
 =?utf-8?B?cEg0eC94dDdlVlp4N1Q1a1FPNXRLVFMzb0NlL0x0alRZZmJiZmw3Y1ZKTkdp?=
 =?utf-8?B?M1JIMVFSeU1MbnhsZFRpM3NkZHJLamFnMEVFL2JRU2lVM2ZNQ1FlbTdkeFBD?=
 =?utf-8?B?VzgrM2JRaTF0dkg4Y1hEUitybVYvNis0WnkrQXZldWhjUWlYWExhQkUvcjRK?=
 =?utf-8?B?R1ZJcG9NNjJ0NTZpSC9xTkl3Syt4WWh5YVYyUURjSjgzVDgrT2JsUFJ0MFdB?=
 =?utf-8?B?TWdQMHVZdktOVVA2QnJPaElmZ3cvWGdGT0FCUUtZekpEMHIyR2IxVlYway81?=
 =?utf-8?B?VzZRbDZWTE82aks5WGNLVWVUbGZwaHB2NHFiT1dEanF3UUpRNnVQUm9JblNS?=
 =?utf-8?B?akk4SjN2UFlEYk1rbUVHS2xiRFJua3FjeURKanl2ZmlXSFcxTzZnUGxjaFp6?=
 =?utf-8?B?MFVQbzdJd3JuaHpuOHcxWmVaYWtoQ1locUZvYlk2dm0zOTB0SDZZUS8rVDJD?=
 =?utf-8?B?M0V0bldMY0NQRWs0SWVjL29VYVRzSEswMVFFa21pcW8yUEN1bVRzbm4wY24w?=
 =?utf-8?B?OWhUUUpuZVRtSGtDeFV6Qk5QMHBmQjF2L05uT1owTTJMS1hHUEMwbFM0c2VC?=
 =?utf-8?B?SENvRTFSb0RuQUVRQ085SlNDcTlHY2UzUlp5NFVjZnpFMjNvVWlqWVRDSkJX?=
 =?utf-8?B?SndYSDRzakRKajZLcFU1ZGNCUVBvcCtkNlNMV3RFUkpxZlFoYW5LNWdIVHZ2?=
 =?utf-8?B?Y0VVMnFMS051SDVhbm54NVJiS3BjUFVNZ1Z2SU1LUjVDdUxLY2JHOWwrTzdB?=
 =?utf-8?B?UEJRdXpOM2NiclRFZkZTYkNBbm8vS3VPK1YwWnlWMFlCOFBPZk10U2l4TW40?=
 =?utf-8?Q?OExj6K?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 12:33:46.0307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f90b02a0-271d-4523-b845-08ddbaf70524
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6954
X-Proofpoint-GUID: Nc3E8YBbH0NJ2sXjJ8AYimZUDQvrx97X
X-Authority-Analysis: v=2.4 cv=Qste3Uyd c=1 sm=1 tr=0 ts=6867ca32 cx=c_pps a=+PpozFyv/4R/82JvxB1TJw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=WQ8EOYzDAAAA:8 a=w1d2syhTAAAA:8 a=O-k8r4oReYX8Ux8VZZsA:9 a=QEXdDO2ut3YA:10 a=bEXPBjZyhGo07VioVuGW:22
X-Proofpoint-ORIG-GUID: Nc3E8YBbH0NJ2sXjJ8AYimZUDQvrx97X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA5NSBTYWx0ZWRfX+XG3VYYigxmV Sl7JaFAdpCCiMOf8CabTCV0auaT5+ht/7S4Mo9a4WHxqwgN/x9pv5+yncGZNqoDWcxvECpyu1y4 AABvGlEa9JopdqhfE5p/NwKvWYegsS3Q8b7FNOtBkrjA9ZD/7/ec8/VWZvJyCEBE6stic4qp/O2
 pOEMG7T9aqxWxFFEwhMZDpHoqE7vbCto3epTkhAGBCJPjpUOzXtTJhmC+pZsmkEP+rB1N65exsI DK3NCY7rVc5+Uk4ilibc6bXb95sR3+Y1V2/KnMckzxrtrEyFAc+AwJaPEFqywQyCChzFuEm6YsO BgCfncmJgOQ66ECb2KggC///mxd2W4Qre1kwJIniuctsegOkRJ3k8z8AlIt1KhJWC1m+J96PFsd
 nyrhcaER4GVfDp8loQfYuNVPO/29Z2H0kCZI1TGyO8T+RZvZ6nIuTRaW2c9vDkymzzMYHaCd
X-Proofpoint-Spam-Reason: safe

On 24/06/2025 11:17 am, GalaxySnail wrote:
> add firmware information in the .modinfo section, so that userspace
> tools can find out firmware required by cs35l41/cs35l56 kernel module
> 
> Signed-off-by: GalaxySnail <me@glxys.nl>
> ---
> Thanks for your review!
> 
> v2 -> v3: fixed typo
> v1 -> v2: fixed missing ';' in the previous patch
> 
>   sound/pci/hda/cs35l41_hda.c | 2 ++
>   sound/pci/hda/cs35l56_hda.c | 4 ++++
>   2 files changed, 6 insertions(+)
> 
> diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
> index d5bc81099d0d..17cdce91fdbf 100644
> --- a/sound/pci/hda/cs35l41_hda.c
> +++ b/sound/pci/hda/cs35l41_hda.c
> @@ -2085,3 +2085,5 @@ MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
>   MODULE_AUTHOR("Lucas Tanure, Cirrus Logic Inc, <tanureal@opensource.cirrus.com>");
>   MODULE_LICENSE("GPL");
>   MODULE_IMPORT_NS("FW_CS_DSP");
> +MODULE_FIRMWARE("cirrus/cs35l41-*.wmfw");
> +MODULE_FIRMWARE("cirrus/cs35l41-*.bin");
> diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
> index 3f2fd32f4ad9..eedd8fdd3b8b 100644
> --- a/sound/pci/hda/cs35l56_hda.c
> +++ b/sound/pci/hda/cs35l56_hda.c
> @@ -1122,3 +1122,7 @@ MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
>   MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
>   MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
>   MODULE_LICENSE("GPL");
> +MODULE_FIRMWARE("cirrus/cs35l54-*.wmfw");
> +MODULE_FIRMWARE("cirrus/cs35l54-*.bin");
> +MODULE_FIRMWARE("cirrus/cs35l56-*.wmfw");
> +MODULE_FIRMWARE("cirrus/cs35l56-*.bin");

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
