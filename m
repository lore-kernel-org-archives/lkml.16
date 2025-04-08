Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FDB264FB1;
	Tue,  8 Apr 2025 08:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102049; cv=fail; b=baHPB102KkZwZHN+NNv4uAOe1pUOW86HteC7in5GkVse4gh/okpN3SrxU28neJsRUhUazbSjQo9PThW7Vg/m8Dd7pMKp9StY+8vMfTw9Z9hHeL6nRyPnXwyMlF8tDrMqJxO3fe8hXXRUR7aGAdje//VsicBUamnwhkTdT0tNIs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102049; c=relaxed/simple;
	bh=c71fAxExodpcPFklQSxJZeiWOfeo6X3n87Mv7GymYT8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=MjBu8vhsVrCZFUS+N3Dtz3suGsHtvIHb9q6nLhQ5BPMcWgfP5D1SYLeVP6efpvOu1D27T5haHU0v0fxS+VdkYkHsqvkZhth3eZny3ElDQVBkJtjYKH/rOPIsTzLmoBxlzuBKemDnzMfRSalcjGRiFDtCYjPN9jGRNS/ijAlq2pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=W0cl4djF; arc=fail smtp.client-ip=40.107.22.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="W0cl4djF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQo5ELQZxEVoJyXXCxcae1EFUKpAPU79LEaT6WJ1nv3H4T5H4WA7tl/Jw4DMVwAqx7xZo1hzI0e4DO3CmpJ6lsYMwLv1YLIZbXTawn8YW1HP6os3byXrhD4J5bjYeflRsHZcmCKkHkhCN+oXUhkS3zgPRaRLYgSTVAhBOc6SNryoVTupp3O2Zx+vWUVtskIlffv8cXx6p8L/lXSD4+y7j6gl7P/fVTZL//Ra6W+ZxhJGyhZJQAbLfGJT7pBizZ1GGd71AUGtX8OCzz20gdpkxAWYK6d5F+zFHnrzjDb4wsO13hglnLW41FEIRRpybK4XvXY/Zavn/UAioY4x9Vi9Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pINGZrAn9qm9/Z1XYt+VpvV4QII9z+xGDPqXiadnp0=;
 b=X1Uekkfg3eorC67PUhTsFO2PI+QWdX5TaqxhLrcRERO4VZx0xSnfgXH+p2HmXZ6LXV1AYgOrDBUouHC81E/Mct9tyJBewn2c2Fcah/LJK3pmHfuwjEzk/QadpBedpjAnw9kkLxd6FO9IBFST0VIcjA6RZERed/QbioZaMzh26YkgBMluJk5HnqmVgiccnd7FBdB1jjo9xZ2fSSVCB7GjYviM4Z7HsjDTd5hUsNW5LOxyYJqcPBdewmJKQ0/dLWtM/wOLM3iUN+FJZTYwWxigoOGz3gADmGolay/albHkiXrrm7tEJ4w/Mjbl24/xZvoadLAC6+HiMQIB3PmZ+kYHsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pINGZrAn9qm9/Z1XYt+VpvV4QII9z+xGDPqXiadnp0=;
 b=W0cl4djFUPvBrdShQjIFlvTmLv4U3EjeKnvuSXCqcMAXcG1ShDpQ1VB9S/1xVfzHTbk31r6sdoVFMKQ0d17LmNpwMsnFHYzCrdkbabU/PGD7SrTKytNHbtDZJKVbcJEH+IUreL1uvALAO6pGtMw/yaJtVUuLaMsac5qmpMyYi78ZxeFOtvsh9lg321aeymCq6kJt/igwCgbPVQDh43mn073K+Y+5mMZt4cbQiDik5FYHlSc0nE9GsVnEtqLsls4cx0RMbk+ule9G8VG4RKCV/PGpH2GQgzoWK46gMmGbzOqBHp3p4PgR8k3LbUxZXhEyToYYbOmlRLiH6g33lKrhjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DUZPR04MB10063.eurprd04.prod.outlook.com (2603:10a6:10:4af::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Tue, 8 Apr
 2025 08:47:24 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 08:47:23 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 08 Apr 2025 16:44:27 +0800
Subject: [PATCH v4 3/7] firmware: arm_scmi: imx: Add i.MX95 LMM protocol
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-imx-lmm-cpu-v4-3-4c5f4a456e49@nxp.com>
References: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
In-Reply-To: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744101964; l=10734;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ROhx7H8nJHW9BRkOKk+9YW5w6vI42KKmT6k6GEjyQ1s=;
 b=Q+uvdcWQ/Z7ZAcapauHYcSWYSQd77yRTiNd/tP6xVvBb/ZNdxJqP7/J97wg2JPzmnjmV5QcQx
 L9qITCpVOtyAiWBgLoJ/ZkOna94nBdZjfSmNBpbsLNwNdPSldnnJMqa
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DUZPR04MB10063:EE_
X-MS-Office365-Filtering-Correlation-Id: bfe662ea-34be-49fd-a45b-08dd7679fb58
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTYxUXpJS3l3a1Q1Z0FldEFiM05TQ0M2ZjFNNG1KY3ZvS3hjeVBFbGMwNXhE?=
 =?utf-8?B?VlNYNENXMlVaUDVwZW81RGxVVlZyTDNYNXJYVEg1dEIyV0cvOXNLUG9EMlQz?=
 =?utf-8?B?RDVvYUY2ZXEyUzFEUjNwYTZpaUNmWU5TUXY3SVRMUEVzMjZZb0wySEVaWUk2?=
 =?utf-8?B?MXNxSWszbDQ3WnZBdjhNN0RxNEN0UmE0bzllaTlHUThHNmRrcEs1Y3BwQ0lM?=
 =?utf-8?B?Y1NYbThzTnMrV05PV0poQWRWemg1V0VkeHU3VStmSmhLRWxOSkI5dUlob1M1?=
 =?utf-8?B?T0tSZGZpM1R5elMreGFGMy8rRHlmQjRySlNtbWNaaml0eEs4eldOWDRMQVk2?=
 =?utf-8?B?blpvUytSQ0h0V1dWbFNERUp0SUVQT2FKOWRDVysxY0pVVVFRTjYvMS9ZMmhX?=
 =?utf-8?B?QmZScGkrU283WFhRNldmZThZeUpEUU8xUzlJNUV2a25yYW9aSU16NGhQRitM?=
 =?utf-8?B?c2FCMEFKQlJsUUZtSFlnTjhpT2dFZTBMRFhVY0YyWnBkZE10Q3hyZTBvQ2c0?=
 =?utf-8?B?eFZWZjkxNVQ5THdVLzRJcmF4VDhmUGhyc1hQMVFLN1gwOHJaTS9ZN24xZ0g5?=
 =?utf-8?B?SEV0ZFJ6RzQwZWxxL0dxZjZNdytXd0lRb2N0S2pBMmQyeGRRMUVkTFA0TUtl?=
 =?utf-8?B?UzdzZTg5WEhLdTI0NC85S1ZiODd5alpWeVRKZ3p0aFBTOWJnT0FlS0Y4VDRS?=
 =?utf-8?B?cmRSWk5kU2Z3Nnc5UDJVbXZUb3JCVTBRczhEeXVFSGtTeVpqanZORUZEM0lW?=
 =?utf-8?B?YXU1ODl3YnNJZHV5Wkc1Z3hucXRZUlVkU3dQQU5yaW9TR3dOUTVWOWVpUk9x?=
 =?utf-8?B?cldHb0c2TXBtUU4vM01MS2t3Q0RxeE1zMTNFZW95dUh4dS9iMER4RkZQWXps?=
 =?utf-8?B?ZVJVN3ZNYWtEZ1VnVUU5WmtqbE0yNjZCZEoySzZCclc3czhYR2grSk1raG5n?=
 =?utf-8?B?NDZSRWNEd21DenhzckxCVllhMDIvYUZhYmlDeWZGdFJGNkpmbXliQnc5b0Y0?=
 =?utf-8?B?RkljT0hvamh3bUVNVHlwMXpGUnZ2NUs0UitodzZIUTAxb1h6L0g4OU1MeGlt?=
 =?utf-8?B?UDJhY0xuTlBINmRKTzVLTjU5MVMreER6ajF4T3dXWjhlaS9vbUJhSmtOZHA2?=
 =?utf-8?B?TzM0alEwQjRRd2k0YnlwQm56Y1ZmWS9sTmlIemF4VzJCZ0VPV2NyQndhYnpk?=
 =?utf-8?B?QmxaQXlDSmVPM21YeVcvbmtLK292OVpjZGNwVFlyZ3RUZjhiU0svRk8zZUZO?=
 =?utf-8?B?UDY1YW42TG1hWkJ5QXd5MVFyWFpVM094VUg1TEZ4T1U4SUV2eXFyQlF4aHh0?=
 =?utf-8?B?YnYzbHp0NEszMkF2Z0tibWxzOFVwNW93MHA1UUpHU1FFc1lKVmJwRC9aOC9p?=
 =?utf-8?B?RVhsWm1aL0tFSE5wUVdCU0ZDeW5uc0haUGtpZUxYTGFMSzBDYU8yNEdLT0w1?=
 =?utf-8?B?NElIZmJpREVxZCs1V04wSGprRnRwekJuc215Q2dBWkN5RUNHU29KU2dhVWxO?=
 =?utf-8?B?VTdEaE5VYTFHQlRwWENEVnJvWGxoZktIZ1hreWhOcVRMdWdoUUpKWkFpYUx2?=
 =?utf-8?B?ZlZQbXpyMWQ1ZitqSmd6aVpUY1RXWXliRHBTUi9pSkNTRWxDNGM5dFRHdnk4?=
 =?utf-8?B?T3VsUjR6dHdtTUZmUTNSYy9DenE2VlVYbkxNbDNQQURVamVWSnNwMXJGdmRM?=
 =?utf-8?B?SmZZL2pmSUlFeXFYYVQ2NzlCWEE3K01Wc2RURGJhMkpvMUVBbFF5eWgySlBJ?=
 =?utf-8?B?TFg2MEF2dHhQWDFBcFphWWIyeTNyREwwTk85cW1hNCtoMU0rUFVuQVNZd2RV?=
 =?utf-8?B?eGFDdzU1WWdTWHBDem5HSHMyRFpuREtkaG5jYjZnekQ5Q1dNVDdnNS95V2Jh?=
 =?utf-8?B?T1VCOC9Ha05MVFZMUERoRWxSNjA4UktmUnVJeEIrS2NkNGhtUjVWZzIwMm5P?=
 =?utf-8?Q?sS7InrSX3JPouu92h8zn56TBX1ijXhZk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEYxbjdGcGNYNlNWYmN6ZnU3V3dsckdqcFlpTnh1QUtzOUxCc1hUUytSZTNk?=
 =?utf-8?B?VndXM1ArZUNBdG12WGcxZTVTd1BxTE9lcFR0d2I2YS9TNzd4VHNFVFZpank1?=
 =?utf-8?B?Y2dSN3dBUERoVkdpdDk4dWxmblpUbG51MFpCTm82QnZiVUp0R3NhN1psb0ZB?=
 =?utf-8?B?OGNqdVd0alVpbmoyWnR3eG9UTjlFbklrbURxTmVmVlpzSGszOFhWR1VqYnJP?=
 =?utf-8?B?VGpRZTUwUzBsMjBFQU1aYmFNbkhvSXRqZUJqc05QR0dmZ1locXJHRFhWLyt1?=
 =?utf-8?B?ME9xRkZNSmJHQ0xRNnlPUVJ4VDhueStoWTNHUUkvZXp6YjZ4UFRIamxtNXdG?=
 =?utf-8?B?d1MxZ050RTZqV1Iwa0JiNkErcDlzOHNIZ3huTXhpWVRKNjJSUVpVSjg1cXNO?=
 =?utf-8?B?N0tOcm5DRmZjOFZ0UTFTb3dFM2I3VmpjdXo1KzdhQWlVTVozMXYzOXM3RVp5?=
 =?utf-8?B?cy84TUlQK3psbUlPSVU5aHp6Ymc1UlVqSHJySDBIU29FRGpjMDVwbnp3V2xx?=
 =?utf-8?B?Yitrb3pLako3Wjg4RlNadUFxdUpoNkdiMVNWL0szSERrRGR6YTlCZ0sxVmJt?=
 =?utf-8?B?bmtFMnR6TjlqOHRKOGxkajFXek9Ic0pSSll5bENacGRUNldiZUdYWnFMVnZh?=
 =?utf-8?B?bEI4Zmt4Z2paM0lpMlFwUHJ5dUZPU1k3VWtxYjdHL2dqd0lteE9HMTBXQk5w?=
 =?utf-8?B?cUhvcUZZWU1uOFVqU3pkK2kxTmVYUGNYK0xKTFZKSm5SY2RVemVjU0hjVjhr?=
 =?utf-8?B?bytPcG81UjdKVVErSTVNdDQ4RU1ZTGlzUU9OOUU1NXBieVJqYWZkejEvSGgz?=
 =?utf-8?B?NGdwbGdiRVFjNjdoWm5CYThJOVNyS0JLQVJRcVV2OHZ5QmFPSGdFTW1TQlNz?=
 =?utf-8?B?eE1HSlhSTjIyMEgrcjMxV01halJGQld2ZzFBbkJFOHd6WUxmYWlNQ0g4NDEw?=
 =?utf-8?B?OU9ONHNaMlMyd3dQOURpK3lBYms1eGFQQWgvQ0lUMG1lVmpJTVh4Q3BpU3hX?=
 =?utf-8?B?bFliM1RQMnN3UEFFSnhjWE93L0ZNWkJUUWZmem1FZEZ0dVZ4M0djOWlXdGVO?=
 =?utf-8?B?bTNMRG42ZGZuSWFvTEZ2MTlYazdvSHlYOTZoMVh4RWdzd056SnEyNktRcldp?=
 =?utf-8?B?bnhZR1U4QU1pS2dYMkRIbU9ZTkgyTVBNbCs2akVXUWNvYWFOWGw3OW92RUpS?=
 =?utf-8?B?VS8zc1BGc3V2d0ZnT2kxUWZYelZxSFdaeUxEUmJWend2UTQveHJuNVA0bGZN?=
 =?utf-8?B?ODBJeFplVnZPRVVJNitIN21IenVGWDVBWWpVL0U5MW05R2JHTzNnQkd0Vmxq?=
 =?utf-8?B?K3ZXaElTMnRpcFE3WEdEVUpUVFpuRWxZWG5zNmIrK25mcEdmQzAzaW1kKzlQ?=
 =?utf-8?B?UzZrQlhaWjlYVmwwK3UzMTk4NVFGc0dFTnhma0xTQWFlS1hIa2VmRk1mUk9i?=
 =?utf-8?B?SmMzRDFKMUREWE5BN0RLUkdjRUkxTk1iNjZpRzZkQldOdHpFcm11MU0zQ25z?=
 =?utf-8?B?Q3RUNEV5dTBUVFJaclVicEJQZW4yRENTU1hQdnFJL3BnSTlLUnBVSzBnR2VH?=
 =?utf-8?B?YUg4T1U4VHJGUXVZWWVaZ0hsN0VQaEQ5TVRqM2dDb3dxVHJCRUdDZXExcklB?=
 =?utf-8?B?L2FKNHRhT3pYcnVqd0ZZYkVjcmF5c0ZyOHRGbmdaT29ZYkJueGsxbkZkQXdG?=
 =?utf-8?B?SForUElJcnkzLyt4c3J4U0IySjcrY1pZcFl2UkxQOXBxL3MvcXluY29xVkQ4?=
 =?utf-8?B?YUcyQnlvcUZ3VXdlTEx6bmZ0WjE5djdka3p3TXZtdnd0ZkFZcDcxSWtDUXpz?=
 =?utf-8?B?a3Zocno3WW9mNTE2M2FqQXc0RVBYRUp2L1AzbXM1ZnIxSFB6SlJKRStiRnJ0?=
 =?utf-8?B?V0xhRXlSWFplNkc3djd3ZU5ZOHRWYlVRK1FaK0svSzNsUklWa08rN2NQZkcr?=
 =?utf-8?B?RVUyelhTTU5ueU5keVh0cmM5SUpyWjFCUlhDSXMrcDRCaDZhSzlZalVYbkE4?=
 =?utf-8?B?TThLME42amdIYVdsa201NkFpbjBDQTd6Si9aZEpvZVlKb2RIODBGbWdGQjA1?=
 =?utf-8?B?VGsvTFk0aFJWbkRHaU9mMGtzb2wwSlp6TDU0TjF5U2lPZGFad2Q0VHBNU2V3?=
 =?utf-8?Q?DUXOJOE2YBIC7t6QMZ6Z9cIaZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfe662ea-34be-49fd-a45b-08dd7679fb58
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 08:47:23.7633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ciIYOiPte5wK7g60Qw5WxOqtBtBIeicmEIH6Rpbr3oIdr8yCvLpftrerCZGKjEucHHvOiKwtxomEHDcgJ0knhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10063

From: Peng Fan <peng.fan@nxp.com>

Add Logical Machine Management(LMM) protocol which is intended for boot,
shutdown, and reset of other logical machines (LM). It is usually used to
allow one LM to manager another used as an offload or accelerator engine.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/vendors/imx/Kconfig      |  11 +
 drivers/firmware/arm_scmi/vendors/imx/Makefile     |   1 +
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c | 262 +++++++++++++++++++++
 include/linux/scmi_imx_protocol.h                  |  32 +++
 4 files changed, 306 insertions(+)

diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
index a01bf5e47301d2f93c9bfc7eebc77e083ea4ed75..1a936fc87d2350e2a21bccd45dfbeebfa3b90286 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
+++ b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
@@ -12,6 +12,17 @@ config IMX_SCMI_BBM_EXT
 	  To compile this driver as a module, choose M here: the
 	  module will be called imx-sm-bbm.
 
+config IMX_SCMI_LMM_EXT
+	tristate "i.MX SCMI LMM EXTENSION"
+	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
+	default y if ARCH_MXC
+	help
+	  This enables i.MX System Logical Machine Protocol to
+	  manage Logical Machines boot, shutdown and etc.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called imx-sm-lmm.
+
 config IMX_SCMI_MISC_EXT
 	tristate "i.MX SCMI MISC EXTENSION"
 	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
diff --git a/drivers/firmware/arm_scmi/vendors/imx/Makefile b/drivers/firmware/arm_scmi/vendors/imx/Makefile
index d3ee6d5449244a4f5cdf6abcf1845f312c512325..f39a99ccaf9af757475e8b112d224669444d7ddc 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/Makefile
+++ b/drivers/firmware/arm_scmi/vendors/imx/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_IMX_SCMI_BBM_EXT) += imx-sm-bbm.o
+obj-$(CONFIG_IMX_SCMI_LMM_EXT) += imx-sm-lmm.o
 obj-$(CONFIG_IMX_SCMI_MISC_EXT) += imx-sm-misc.o
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c
new file mode 100644
index 0000000000000000000000000000000000000000..7f4febe2e17770d745f936dff25b556d8e4f20c8
--- /dev/null
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c
@@ -0,0 +1,262 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * System control and Management Interface (SCMI) NXP LMM Protocol
+ *
+ * Copyright 2025 NXP
+ */
+
+#include <linux/bits.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/scmi_protocol.h>
+#include <linux/scmi_imx_protocol.h>
+
+#include "../../protocols.h"
+#include "../../notify.h"
+
+#define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
+
+enum scmi_imx_lmm_protocol_cmd {
+	SCMI_IMX_LMM_ATTRIBUTES	= 0x3,
+	SCMI_IMX_LMM_BOOT = 0x4,
+	SCMI_IMX_LMM_RESET = 0x5,
+	SCMI_IMX_LMM_SHUTDOWN = 0x6,
+	SCMI_IMX_LMM_WAKE = 0x7,
+	SCMI_IMX_LMM_SUSPEND = 0x8,
+	SCMI_IMX_LMM_NOTIFY = 0x9,
+	SCMI_IMX_LMM_RESET_REASON = 0xA,
+	SCMI_IMX_LMM_POWER_ON = 0xB,
+	SCMI_IMX_LMM_RESET_VECTOR_SET = 0xC,
+};
+
+struct scmi_imx_lmm_priv {
+	u32 nr_lmm;
+};
+
+#define SCMI_IMX_LMM_NR_LM_MASK	GENMASK(5, 0)
+#define SCMI_IMX_LMM_NR_MAX	16
+struct scmi_msg_imx_lmm_protocol_attributes {
+	__le32 attributes;
+};
+
+struct scmi_msg_imx_lmm_attributes_out {
+	__le32 lmid;
+	__le32 attributes;
+	__le32 state;
+	__le32 errstatus;
+	u8 name[LMM_MAX_NAME];
+};
+
+struct scmi_imx_lmm_reset_vector_set_in {
+	__le32 lmid;
+	__le32 cpuid;
+	__le32 flags; /* reserved for future extension */
+	__le32 resetvectorlow;
+	__le32 resetvectorhigh;
+};
+
+struct scmi_imx_lmm_shutdown_in {
+	__le32 lmid;
+#define SCMI_IMX_LMM_SHUTDOWN_GRACEFUL	BIT(0)
+	__le32 flags;
+};
+
+static int scmi_imx_lmm_validate_lmid(const struct scmi_protocol_handle *ph, u32 lmid)
+{
+	struct scmi_imx_lmm_priv *priv = ph->get_priv(ph);
+
+	if (lmid >= priv->nr_lmm)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int scmi_imx_lmm_attributes(const struct scmi_protocol_handle *ph,
+				   u32 lmid, struct scmi_imx_lmm_info *info)
+{
+	struct scmi_msg_imx_lmm_attributes_out *out;
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_LMM_ATTRIBUTES, sizeof(u32), 0, &t);
+	if (ret)
+		return ret;
+
+	put_unaligned_le32(lmid, t->tx.buf);
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		out = t->rx.buf;
+		info->lmid = le32_to_cpu(out->lmid);
+		info->state = le32_to_cpu(out->state);
+		info->errstatus = le32_to_cpu(out->errstatus);
+		strscpy(info->name, out->name);
+		dev_dbg(ph->dev, "i.MX LMM: Logical Machine(%d), name: %s\n",
+			info->lmid, info->name);
+	} else {
+		dev_err(ph->dev, "i.MX LMM: Failed to get info of Logical Machine(%u)\n", lmid);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int
+scmi_imx_lmm_power_boot(const struct scmi_protocol_handle *ph, u32 lmid, bool boot)
+{
+	struct scmi_xfer *t;
+	u8 msg_id;
+	int ret;
+
+	ret = scmi_imx_lmm_validate_lmid(ph, lmid);
+	if (ret)
+		return ret;
+
+	if (boot)
+		msg_id = SCMI_IMX_LMM_BOOT;
+	else
+		msg_id = SCMI_IMX_LMM_POWER_ON;
+
+	ret = ph->xops->xfer_get_init(ph, msg_id, sizeof(u32), 0, &t);
+	if (ret)
+		return ret;
+
+	put_unaligned_le32(lmid, t->tx.buf);
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_lmm_reset_vector_set(const struct scmi_protocol_handle *ph,
+					 u32 lmid, u32 cpuid, u32 flags, u64 vector)
+{
+	struct scmi_imx_lmm_reset_vector_set_in *in;
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_LMM_RESET_VECTOR_SET, sizeof(*in),
+				      0, &t);
+	if (ret)
+		return ret;
+
+	in = t->tx.buf;
+	in->lmid = cpu_to_le32(lmid);
+	in->cpuid = cpu_to_le32(cpuid);
+	in->flags = cpu_to_le32(0);
+	in->resetvectorlow = cpu_to_le32(lower_32_bits(vector));
+	in->resetvectorhigh = cpu_to_le32(upper_32_bits(vector));
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_lmm_shutdown(const struct scmi_protocol_handle *ph, u32 lmid,
+				 u32 flags)
+{
+	struct scmi_imx_lmm_shutdown_in *in;
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = scmi_imx_lmm_validate_lmid(ph, lmid);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_LMM_SHUTDOWN, sizeof(*in),
+				      0, &t);
+	if (ret)
+		return ret;
+
+	in = t->tx.buf;
+	in->lmid = cpu_to_le32(lmid);
+	if (flags & SCMI_IMX_LMM_SHUTDOWN_GRACEFUL)
+		in->flags = cpu_to_le32(SCMI_IMX_LMM_SHUTDOWN_GRACEFUL);
+	else
+		in->flags = cpu_to_le32(0);
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static const struct scmi_imx_lmm_proto_ops scmi_imx_lmm_proto_ops = {
+	.lmm_power_boot = scmi_imx_lmm_power_boot,
+	.lmm_info = scmi_imx_lmm_attributes,
+	.lmm_reset_vector_set = scmi_imx_lmm_reset_vector_set,
+	.lmm_shutdown = scmi_imx_lmm_shutdown,
+};
+
+static int scmi_imx_lmm_protocol_attributes_get(const struct scmi_protocol_handle *ph,
+						struct scmi_imx_lmm_priv *priv)
+{
+	struct scmi_msg_imx_lmm_protocol_attributes *attr;
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0,
+				      sizeof(*attr), &t);
+	if (ret)
+		return ret;
+
+	attr = t->rx.buf;
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		priv->nr_lmm = le32_get_bits(attr->attributes, SCMI_IMX_LMM_NR_LM_MASK);
+		if (priv->nr_lmm > SCMI_IMX_LMM_NR_MAX) {
+			dev_err(ph->dev, "i.MX LMM: %d:Exceed max supported Logical Machines\n",
+				priv->nr_lmm);
+			return -EINVAL;
+		}
+		dev_info(ph->dev, "i.MX LMM: %d Logical Machines\n", priv->nr_lmm);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_lmm_protocol_init(const struct scmi_protocol_handle *ph)
+{
+	struct scmi_imx_lmm_priv *info;
+	u32 version;
+	int ret;
+
+	ret = ph->xops->version_get(ph, &version);
+	if (ret)
+		return ret;
+
+	dev_info(ph->dev, "NXP SM LMM Version %d.%d\n",
+		 PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+
+	info = devm_kzalloc(ph->dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	ret = scmi_imx_lmm_protocol_attributes_get(ph, info);
+	if (ret)
+		return ret;
+
+	return ph->set_priv(ph, info, version);
+}
+
+static const struct scmi_protocol scmi_imx_lmm = {
+	.id = SCMI_PROTOCOL_IMX_LMM,
+	.owner = THIS_MODULE,
+	.instance_init = &scmi_imx_lmm_protocol_init,
+	.ops = &scmi_imx_lmm_proto_ops,
+	.supported_version = SCMI_PROTOCOL_SUPPORTED_VERSION,
+	.vendor_id = SCMI_IMX_VENDOR,
+	.sub_vendor_id = SCMI_IMX_SUBVENDOR,
+};
+module_scmi_protocol(scmi_imx_lmm);
+
+MODULE_ALIAS("scmi-protocol-" __stringify(SCMI_PROTOCOL_IMX_LMM) "-" SCMI_IMX_VENDOR);
+MODULE_DESCRIPTION("i.MX SCMI LMM driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
index 53b356a26414279f4aaaa8287c32209ed1ad57b4..2a96fc29cb6f4dd1e4c29e0aaaa614ae9783da4a 100644
--- a/include/linux/scmi_imx_protocol.h
+++ b/include/linux/scmi_imx_protocol.h
@@ -11,8 +11,10 @@
 #include <linux/bitfield.h>
 #include <linux/device.h>
 #include <linux/notifier.h>
+#include <linux/scmi_protocol.h>
 #include <linux/types.h>
 
+#define SCMI_PROTOCOL_IMX_LMM	0x80
 #define	SCMI_PROTOCOL_IMX_BBM	0x81
 #define	SCMI_PROTOCOL_IMX_MISC	0x84
 
@@ -57,4 +59,34 @@ struct scmi_imx_misc_proto_ops {
 	int (*misc_ctrl_req_notify)(const struct scmi_protocol_handle *ph,
 				    u32 ctrl_id, u32 evt_id, u32 flags);
 };
+
+/* See LMM_ATTRIBUTES in imx95.rst */
+#define	LMM_ID_DISCOVER	0xFFFFFFFFU
+#define	LMM_MAX_NAME	16
+
+enum scmi_imx_lmm_state {
+	LMM_STATE_LM_OFF,
+	LMM_STATE_LM_ON,
+	LMM_STATE_LM_SUSPEND,
+	LMM_STATE_LM_POWERED,
+};
+
+struct scmi_imx_lmm_info {
+	u32 lmid;
+	enum scmi_imx_lmm_state state;
+	u32 errstatus;
+	u8 name[LMM_MAX_NAME];
+};
+
+struct scmi_imx_lmm_proto_ops {
+	int (*lmm_power_boot)(const struct scmi_protocol_handle *ph, u32 lmid,
+			      bool boot);
+	int (*lmm_info)(const struct scmi_protocol_handle *ph, u32 lmid,
+			struct scmi_imx_lmm_info *info);
+	int (*lmm_reset_vector_set)(const struct scmi_protocol_handle *ph,
+				    u32 lmid, u32 cpuid, u32 flags, u64 vector);
+	int (*lmm_shutdown)(const struct scmi_protocol_handle *ph, u32 lmid,
+			    u32 flags);
+};
+
 #endif

-- 
2.37.1

