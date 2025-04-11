Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2066.outbound.protection.outlook.com [40.107.22.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0EB2D7BF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377348; cv=fail; b=NJphiFv5/cRbRaErahZRUTgLeoVRL1fWIJlyHSYGfmvApBpcZB1r62IpGdL3EVKBE2UjRJSG64EgOE37vazrsqYJ/6Hwpzui6R9pnjTwRTj5YHfP8lDjx/h47j9NHWkxgZSH/DggUGpcdf/rilcLclWPIt9oMZcCAbQm2216vX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377348; c=relaxed/simple;
	bh=wBwuAHTmmfIFd2noZNXutfKwlQPK4Ld0YSgpMnXmfug=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=nadhJVv5C6YjuT/z1jNP92iz0evbEczFTFh6Qy/qLkF2jPToT5NoJ+t68KwoUgdkEFSHhwgYxx6tSnbRYnsNR4nQhRpgAecgFlu/CRcR8iJ4Wfrl4osBqL9eVs1r8qlEBOluZQ54s5md81A6inJlvYNdN1lXGT1cHu/e6//b6vU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RmK8wTsi; arc=fail smtp.client-ip=40.107.22.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RmK8wTsi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ipz1iiAJgO3tevc9/kibrcf9oKF2jaIv+V9CqRvrv1bidf2Eqiprh0Phbu1RS4iqm01gl4vLCT+qFkf8A7U0K7jUgvo3teFfCKqNZ5NUqpZOJmqO0oBco1aBBl6gNRX3+OTY8yiTaVSG+hfrDH+1nYMhVgR94QPjG/O3M6fFbYwuBYyhDdV+f2a+4KHl7Rgm5tv5O68jq48TZn1HenG8hUmNJ6K1qgIHw/lEcH5zGwyktX3WfSe/s8fmLqBOZ+OZdIzjlkkO6Hi4uCSgp7TrDvv/o+b4EMJmMsqOCdIgPUgpNOG2NkF2u1YZ/imG6jtizWRQm2Oe+oDquW5LZ48ByA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RO6LiDADqYGX8oOE8UId6vj3RZQf5GfL0Z0+n2uIce8=;
 b=RwzYUaj/9aCCfh6wcLh7sRwbCeIP1BrXVrG1FLQ16KoElj6ZfFeX+wpR9KWRbT+Lsl0FF9cDw9yO5MX8IV4ZBBqLMrtxJhHx3oRRR9DVDCD7WuEzxpLxCsgYQ/ct+TsoS+KdbUVA0ZodldlusfZ+/zFa/EUTI6p3HNa31rVNZD4wrZ2A0LCfA8tYuiMOPQp6FcF7C5Jg6LWCaHIJfV9EY33X2WFtQgmW/4MA9tHXV0v5ufZ+tlhhCKgqeZkC3/2KX2gNz0b7gQjGDdOt91aIcU/PBpW1BwMMWZPBKaSZrfooA1NzXgnLImDLQtT77vppaGIPN3VpB292pv1giToG1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RO6LiDADqYGX8oOE8UId6vj3RZQf5GfL0Z0+n2uIce8=;
 b=RmK8wTsiunurDtX6TUxYnZCZLq4Vgo8228eEO3szVVp/xiRU+eSQ1gb+zdoO6482SphVIVEwrhJCfOxuIBpLt0OzqRDO9AezkuD/IfKsOU8MOrOcNmr8GSHDcYbwe914hWtLkT4cBFQ7ojkH+wlfqHAxvg1l3774pcd4WMHi4DV8gRBgUb5pXJmPnMMwkcrgVOVa9AyrXqeGXr1aeFaCpAzDD3tgnL96RasOFW3b0TIJgBdrjG+v7lqdXvkovMyyKBPl+rw63V+Rr/Wyjyn2DRtfpgGjHo8n6cGO2PzuxWEdsT46NuNQRsuZ55vTBU9AqwqmhgesZi5U1LOhcw9Wpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10674.eurprd04.prod.outlook.com (2603:10a6:102:483::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Fri, 11 Apr
 2025 13:15:43 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 13:15:42 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/6] mailbox: Trivial updates
Date: Fri, 11 Apr 2025 21:14:08 +0800
Message-Id: <20250411-mailbox-cleanup-v1-0-8db541394dc2@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKAV+WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwNL3dzEzJyk/Ard5JzUxLzSAl1TsxRLI4M0Q+PkJAsloK6CotS0zAq
 widGxtbUAy88FJ2EAAAA=
X-Change-ID: 20250409-mailbox-cleanup-56d920f13cb8
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Elliot Berman <quic_eberman@quicinc.com>, 
 Thierry Reding <treding@nvidia.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 linux-kernel@vger.kernel.org, mailbox@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744377279; l=962;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=wBwuAHTmmfIFd2noZNXutfKwlQPK4Ld0YSgpMnXmfug=;
 b=j7T7q28ONf6/WjXRWZOmOl9kzLZe+uQ8KA7K49u5Av7sLy6vrSBZL8DqQMGjaGAUhEdO8Zfwf
 lJIrKM9EoP6BR5KqfzvkskUx6rxLAYsZAB5SkXqvUZ81NXjlngGp5Sc
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXPR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::22) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10674:EE_
X-MS-Office365-Filtering-Correlation-Id: 66ea61c9-bbae-4ce9-3a43-08dd78faf656
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFJrU3ZORVZPM0VqV0xmUjk3UEhMQ2o2QjJtdEcvV3pNRlRBS2NLZVV5cStK?=
 =?utf-8?B?NFgyWko4Zm1zTjZmSEtTdDY2UU9ldEtROFAxdE12VTlhNHpOV2l4RkRkZ1d5?=
 =?utf-8?B?cE8wUnVhNXgzT2tNbHRvby91OUFBMVNMRFVhaktPZFFsckpBMFVrRXZtbjMr?=
 =?utf-8?B?RWt1dGlSdmV2NWd0VytSU3MrU3pvdUlJMFRFNjFBYlhMVTdWVVg1bEJJbnlT?=
 =?utf-8?B?R2prZWtoMC9JWE9OTHp2S0Q5U3AwVUZjUkVzM3FTUSt0bGlGKzU4VHM5d2ZV?=
 =?utf-8?B?ZVpqZ2lpMDIxOEw3Z1UrMGloaVlDeHJEOTVPYmhiTmdQNFZZVkpHRTk4TU9j?=
 =?utf-8?B?dlREa1hIMnFKbENQakhiVFJDM09kOGRyVjA2TFpaNEFrMURhdTFuVkNPa3pJ?=
 =?utf-8?B?cm1xOXhNU2pxMWJaNHpFMTg1QmpMUzZCNENWWlpPZ28rQ0I3ZUNxcldBUG9I?=
 =?utf-8?B?NG91dTNLeVMyL2M2R0lsemQ4WUhpUnQ0Q2dCTEZVcDhBbEhyMWhQSUxZQk00?=
 =?utf-8?B?SzdWVkx0cE9qRjV0bG8wOXNZVXdYT3RCcmdDMXh6Snh4U1UvSWMyeDhIUFRT?=
 =?utf-8?B?NXA5b3BzNTV4RXl5SytsckVPWUtaaHVlNURXRlpzQUxyK0RlLzlDR3JIOVZZ?=
 =?utf-8?B?SUo4VTg5WGpYeElGLzArZjZrZGhIV1FEd1NUR3MxL295K3FCL3NINHpYS0Jq?=
 =?utf-8?B?OTlGYzJVejRJdnBpeWd2aVc0bUpxempEWDNsTktSajIxOFR6THAzeERaL0pC?=
 =?utf-8?B?c05yWlA2cU1TT2ViR2o0czNkK3QrUjVaSUJCbzIzOXFHa2xkRWM4THBML3B2?=
 =?utf-8?B?OEcwcnRDRXJoZklmMFhGa25PSXRHbi9OYUNJWVJMVHF3TE44dXYrK05kNjhO?=
 =?utf-8?B?WUtRTUxrakJrbDQxR0FCc3h5YmxXMDZ1YmdCZDIxNEtscnFaQjFEcWdkMlAw?=
 =?utf-8?B?WlNYb3VQckx2a1dkTmRySjJ3UGlKMkFJdHlseXM5bWVBUkc3ZzBKYlNnWjF1?=
 =?utf-8?B?S2pxMlBuSkJQVXZlV3Z2L2U0RGxIN0JCd1JzTEIxZE9xck9LYWx0YzZrckNa?=
 =?utf-8?B?WWxPWUxNVFg5ZDFyV1FSNzBNZzBEUDZVejhHNm1HOWNpa1c4MlpsN0ZwUmh5?=
 =?utf-8?B?NFk0K0VVNGJTUE11Y0Vnb1FwRUZSenFPdHdjK0UvMEw2eTNuWXkyQ1pRWjha?=
 =?utf-8?B?b01Wc0RzRG5OOFV0Y2Foc0VtZDNIcFduL2MyR2g5OUJtRjcwR0lKckozUFJh?=
 =?utf-8?B?L09nRXNaM25RQVdTOVZnZnlYOEovUGV2WEd2VUkvQnFOK29RTmtxMGIveDRC?=
 =?utf-8?B?SDZEQWZDY1d0ZkRmaVZROXRodHA5bUswWC9NL0xBZUZ0c3ZlMjVoME5BMUtW?=
 =?utf-8?B?TVpUdXR4Qnc3UTM2a1B0RWY2MTJXWUpuekpsMlVpWk1PSkxTcUQrdXpWN3FC?=
 =?utf-8?B?QmpteHlxVW5qbWwxRHdCMFVpVUJ1eXdKVUdGQlBpWW1DMWQ1U2laYTR3ejRu?=
 =?utf-8?B?ZytjUVVTRGgyUlRTdmU2MXpXdCtlUmh2eG05T05WMDg0alN2NHVkNkdvK0xF?=
 =?utf-8?B?RUQra2JXQzVHKzFYMXZpdkJQVi9MZ0VpaXZHL1ZIdWs2ZFllMjY2Vm1zSXVv?=
 =?utf-8?B?cXJKOUxmL20xc1pVMXdKNXh2M0syQVFtbnYvUnlRbThlb3k1c0NWRjZrUEJo?=
 =?utf-8?B?YzY2V3hyTWFwSHpROEJJTm9VYnhLVG9OTnVMS0FpUlF6OEJzZlluWWN3L2hx?=
 =?utf-8?B?TnczY01SUUlTbGpaTERJWTZlelZQVElJWkpMV09nSnVHSDIzaWhQamRIR2o1?=
 =?utf-8?B?SFhoVFBucldmVFpPWStWVUtPR3d1WHowZDFOUlorNkxkM0pyWmkyRml0cGh2?=
 =?utf-8?B?eXZ6RUZDWTBJQ0tCaFdSa2lQdHQ0Y29kbmcyeitxc2NQQzNtZWxvOWI4TjJ5?=
 =?utf-8?B?MGFySGgvMldqRVpwYkNYNnk2NXRCUXZHcUFZTksxbVp1OHZxaU1ydithZHdU?=
 =?utf-8?Q?cz2Z4Nz+srZvHDCkVjaNgJKhHFhNg0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REZTR2xDenRoZWRtWWVOS3VpZjFuUHd5SFJGd1JZY0lzakVZY210N0l5Qlc0?=
 =?utf-8?B?N1NNL3RYcFF2aTR0c1luYndwRy95OVdrOTduZHZOSHc0M3IySnFvMzRxYkpJ?=
 =?utf-8?B?Yk1iK0IrK3V4Y1IvT0FiNVd1RHF2WWJSV0VDdWp3b2grTVpxN2tVZ2YrSXpi?=
 =?utf-8?B?eHlwOUFuZ3JJbTFqUVVsNWFIWUhrV1FoeDFxNFZSNUlpSnB6NDBYc2ZuVjU4?=
 =?utf-8?B?T1E5dkp0OXdBNFpkV1FETGF6VEthMTNsOTNuTnZrc3gxbEwvZXppVGVUT3hq?=
 =?utf-8?B?alFndTRjSzBkWEJrb2E1QXRHbldZTWZ6OFpDcXJNNmFlbEpwelc5UFJLWDcx?=
 =?utf-8?B?eUhNZi9CQkdvVmI3K1Q5bmxNbG8wNE5uK09paWdNYVE3K21kTGhCejdHbDRv?=
 =?utf-8?B?d0hYNzVQTm9hNjdnVklTWEErd3Q5bDd6NDdrZTk1SG1JWUxwQmcrcExKRk5S?=
 =?utf-8?B?VWdRYWhmOHNkam9NUDZqS01vTmpiSEFONm5YM28yd3lML2xMN01MTjZXb3M3?=
 =?utf-8?B?VEErL0djK1F0VkIyNDhvaW5oYTYwVFRGNldXL0EvSUVNNm5nUEFoVXdocVdk?=
 =?utf-8?B?b1BUL00za2pOcE1tWWN2bUZaWExIQ2ZGejJEZW9YVUtEQ3E3YnlscHlmTzkr?=
 =?utf-8?B?YitsN1NlbEtKR000THFvekhralMzODlVTHRqVFFhNXZid0VtOTRMV2Y5MzI3?=
 =?utf-8?B?RlVBYmdKOUJTVEJFb1BxM2dqOTZDQmlSQXpkR1ZzSEg2NHR4bnEwbzR3Q2ZF?=
 =?utf-8?B?UitFUjc2ZVlzVDkzSStuYThMNTFtMzBSdmZHakVLZWl5ZVpHQUpYZy9pVjQw?=
 =?utf-8?B?M2c2L1ZneTM3bmVCRnM0VnBmeE93aWVPOGVnUUhwSUkvT0lhemVXU3RvR2FE?=
 =?utf-8?B?aElNRUlNUTFZczNTeFhMNTZRd1M2cGtUeCszZ05hTENXRENVdWdUWDNSOUFK?=
 =?utf-8?B?ajR0bWRKaWVmR1RyS012MDRudnB6bUtOY20zckV1STNLb3NOL2VyK0FNd2Uy?=
 =?utf-8?B?MkttZWZLa3lNY0ZMVVhHWTRsWlE2akpuUG95ZG9vMlYxMSt3QWkyR2FoYnUy?=
 =?utf-8?B?bUxhbjVMejhlYzNPcnc1d2w0KzFvR0lMRjYvaFJzM0NCcE84RndjZFUzL05o?=
 =?utf-8?B?cEV6U0dEM3ZRUXIwNXl5MFQvZC85MjRGMHdoczI3eDRoU0pCMHhYSXhCeVcv?=
 =?utf-8?B?Y05wRCtzbmYycmlwcWx0RlN0RkU2cWc3QUd3b0doZGVJVkFrVkZqUEk0a29N?=
 =?utf-8?B?bVVZd2tVK0k4aFR5b0wxZ1Q3dlBhb2J2TTR0U0xTVkVhUW9TcTRxOW5adjJO?=
 =?utf-8?B?Y2pNZmxZTlQ4YW1Fb0xGb3JWNHRrcDkwbW5FTkZieVdsbHRTQnYzV1paNWo5?=
 =?utf-8?B?VmdaU2VFM0tySnoxQUJZZXdQSUlYQ05vTHdMUHp0RGlXeklCVkx4WjhFbEVU?=
 =?utf-8?B?OE9jcTBSbUUzTVdQNHRaWlJDQUdjbEJVQ1Zyejc0TThZRHoyL1BUQVAzYk9K?=
 =?utf-8?B?bFBZRk5ZOFp3a1VNSTdua1pvbkxzNnl6SndvQnI3amMrbGpZWXNYMlRRZUlY?=
 =?utf-8?B?ZDkxRmZzemFFTnJCVG5FY3Y2djNDSElqTUp6emdWcm40bHB4elV6TU1QS3Mw?=
 =?utf-8?B?YWtNZ3RtaitzS3l0QXkvVWhySWNxUVByenJ0N3Y4OHd6MTFDUys0WU9iOFI1?=
 =?utf-8?B?RzgxaEE3RXUwVlh6YisyUTEzUTBUR2NpS0M2VXJxMXBqejJtMWI2NTRPNTdm?=
 =?utf-8?B?b3hjZFdRSWhqRGVNYktRVElCbGpPVTdnVmVodnQvNVk1U0MxQk52MGcxemY4?=
 =?utf-8?B?cElrWnBUc3M2Wmh4ZEc2OUZzRlFFTGFmdldMTVpmN2JMaVNZTEVsV1JRT2NM?=
 =?utf-8?B?bDZrNHcxNGpldXE2Mld6NkZtL3NEd2RuelRwNVc0Z3BUK1d1TWZPR2Fqckw4?=
 =?utf-8?B?eTZjdWdNN2VhSnAzcEtnNmZXUWdFbXpmWmMrUDNrbjl3SnZTdmJ4UVNlR2dH?=
 =?utf-8?B?enl2dWRqYk1IMldqdk5BdG45OEdzSzNjenUwU2xnUGd4REJoc1llaCt3dnM2?=
 =?utf-8?B?b2I3Y1Y5M1FkanRjQTdPWWo5aFRiZUtJa2tVZ1VhN1hqSjUyS3AvWTdkWDdT?=
 =?utf-8?Q?XpeIQjxQcFgyYMFQmoVMzzHJ7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ea61c9-bbae-4ce9-3a43-08dd78faf656
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:15:42.9058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3qdDwNLw45lncUST3DNYwX0sA3zuCL72HViiDwL6VychEtsYqmHgS+WzVV8vUHyvH6M+wzvoe+m6gNpkJ4EDFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10674

Several trivial updates to cleanup code.
- use dev_err for print err information
- propagate correct error value
- use guard/scoped_guard
- drop devm_mbox_controller_unregister

Tested on i.MX95 with SCMI mailbox Transport

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (6):
      mailbox: Use dev_err when there is error
      mailbox: Not protect module_put with spin_lock_irqsave
      mailbox: Propagate correct error return value
      mailbox: Remove devm_mbox_controller_unregister
      mailbox: Use guard/scoped_guard for con_mutex
      mailbox: Use guard/scoped_guard for spinlock

 drivers/mailbox/mailbox.c          | 199 ++++++++++++++-----------------------
 include/linux/mailbox_controller.h |   3 -
 2 files changed, 74 insertions(+), 128 deletions(-)
---
base-commit: c10fe6005a47b49097119488ebb0cc80301623a8
change-id: 20250409-mailbox-cleanup-56d920f13cb8

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

