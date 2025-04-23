Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010001.outbound.protection.outlook.com [52.101.69.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518B127F4F4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745419128; cv=fail; b=uCedEbPMuLQjFPs+pMP698G157NvyqIto5hc9mVSrUYPXRUKUf4P+iP/cX3HrTVXWGbp2XfJ3UQFf3huVNdHHErSw6eFSTtl+O75lXXRI8R3l0O6S5GoN0bj2xKwSgAFhJJwQtvbYnneAGNdzAxHHYujYSIiXR70DSByYhsYnzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745419128; c=relaxed/simple;
	bh=OOS5pr8YaH/+sDxf2KhLZL+9QvYo2sMGBDBWkTYy62I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=q2J+rds7/2ygkPAwiMTURMald2sgNkNW83xZIN9kN5/zRoI5NZrg+MK7w3EQE6arLCdLw6KARcXSZfCTlGhXF0JHIkGzKb86NZviwaIInC0CWsoE7nvla2K4XnGe7JLIXyE7kBgP2wbnpVKoupKd9st4yf4CRyPA2P8wlAQIZeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=coDMYU9u; arc=fail smtp.client-ip=52.101.69.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="coDMYU9u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVILs1Bhc630OHpfEK3AfP1xz2wboPSKPPesjAVxB/tx8UMp3DNMboq1Ez8v3zGK+Dn4jvWshOKokWULGVrof5AC6JPPB8CQ63cn2v6gEv8Ssm81F3xYTmovIey6dJKASU+8HRtutbwMh8wB498N6xHH3tGICpqCvjgdiEuZz22Tdz+RPIcfxwGFxgFjHnhWzQpkHSxneCBUXiXx3K1ui+pfDu6aT7YPiP8xXT9+jp0YX5NUiav7D7cd1z9e1J1jZ49Sa3c/UBtP9R8W7m810Vl7zkeqB/y0FFmxFxuxa/RlEvjo1FkooxZOu7Tmy9Bfbb06/SJ/7Aj+l6ochnrCeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIMf3Z5UWA6qBlE9ZrHnvTkM+ZkkzDPJtcr7ku98T7o=;
 b=Dg+C0Q+q52YQHkwWjdZpoBhA/X6Y31Pe+UsThlAznWoJGGHx96Brp/KugOY4WYYhchzvLeudQrQmRQPVGn6uOckBvmHKkSUOmun1lGj+QRWihj51tVthqPvaMfhgNP/1idsPorQv7I8CU7O/LbMsjufFlk7QCWlGcuMceeSaw/6mLJ1Q2ObE8zEjIAe8q63k3/rrdAlZChNzdo2WYy9cAKmT4K1CNBvm8J8M+bax8KEsIfsIG/hbU584JsUL3r0d4ZV3h5nSYr5XpUIo1rvA/dmUb7B24qSGY4N18IkfOExZ8TCeUrKfYzazxQsrUEzwmh8ddjUCnJ+4vNUJyiPWXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIMf3Z5UWA6qBlE9ZrHnvTkM+ZkkzDPJtcr7ku98T7o=;
 b=coDMYU9uMXi24lE6ZaT2RuqCTBJv+eYgTK3omLnKi3CsP6qGiw6A6h9fGkrEE5uzy7U4nnNKF0tasEsPhehAB1CWJ/hfzkL2DutDkL7feABAwtZqX6o+RZCLtov6s0RxkVsN2VeN6UKH9YXhFGQ5/MRk2zJYX+Y58HzeVHhOMF3n9EWugywmLcMrm/nak45bxE6CSG/6salywIDLKuP7ZXot1AJX9d0WIIn8cuF6fJdvzJ7bOyAnpURytwtGQUPSoOBZjuAZ+XYEVnxKmHbZmplm5CBYWKV1IHbNh8fXV6VCyNVt8q19h5zgNleS7NAG6FDXmCWZSZwx2kUvgQx4Qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8413.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 23 Apr
 2025 14:38:42 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 14:38:42 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 23 Apr 2025 22:37:06 +0800
Subject: [PATCH v2 3/3] soc: imx8m: Dump higher 64bits UID
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-uid-128-v2-3-327c30fe59a9@nxp.com>
References: <20250423-uid-128-v2-0-327c30fe59a9@nxp.com>
In-Reply-To: <20250423-uid-128-v2-0-327c30fe59a9@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745419041; l=2721;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=EeNVbZ1d2ZQPinLPwL17gDHGCnfNGqAukbnqhNMzlZY=;
 b=LYXyztay4JyQ7jBdFZ5rlSm7mVyTCW4QXvdb+0oQm5dzHtzhCPXxx1WlqN6kyO/jG9TlcLbAw
 +OwTcDc6jSXBNaAJxxnWOG/DuT60ab3oGGWvBE3p51Qno15yq1Q0//g
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fbbd944-da6a-4f2c-5495-08dd82748ba2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2gybzNXT2E3cXowM3pLL0s4a2RPcVdkd0dyaHR4c3A2UlJLTnZ4YnZwSkw5?=
 =?utf-8?B?Z0R2THlFVUwxaXE0MnZPMnVjZ3dQT05NQ0QrcEZUTWhnbDI4cWkzV3JrZno2?=
 =?utf-8?B?SkdwRDRiaE5yaWFxWDhrK1ErYzAvYUczeGRIVURjMzlCdjNnc253V05XSnF1?=
 =?utf-8?B?RlNKMkdiNDFURTh6L1JuTnhDd3FzSWNIeEFjRjUvK2VjaHpURlM1N2N3YWRY?=
 =?utf-8?B?bkFvSjBITzU5ak9jbG14VkNXRUwzT1NrMTV4VmxBa0E5NDBVRTRQZ1Y3ek9o?=
 =?utf-8?B?NkFiVmlkL2gybURPZ0dwUzNTWkkycS95MlhmRUNVbWMzcnZRaW51b1NlUjBv?=
 =?utf-8?B?cExBaTl0K2x5c0FJdGUxaVV1VjhRdXQwU1U4Tk5FZGhtdWhqQkd5clBNMEJu?=
 =?utf-8?B?cGhxTUp1Z3pBQnBHOEZSZFFQa2k0bExrbFE1VExJSHdWNkUySlZWOWtQM1VY?=
 =?utf-8?B?Wm9GU0c2QWFjTnVIazlaSzFHd2xXRko4bmIxeHRrRWZkdW5LbUVYeUc5dDZQ?=
 =?utf-8?B?SGxubHNmN1VzSDltT0ExcHhlL2xOd3BucUh6UzR4Q2JOc05mSCtJUFgvTTRw?=
 =?utf-8?B?T1R4S0RnaDlRYXRLV3NpMW1PQXRKMWtYK2tGVTk0TlV6NmptWGFiOE5PZ2Ny?=
 =?utf-8?B?cnZoZ0prdnhZR3ZKSUNiUEJidnQvWURuaGtqZ0EyaVkwTHBveExZeEJ0MUIx?=
 =?utf-8?B?NDZpZFUweCtHbzhGTEtTRUpJaEZWc25Ncmo2YVdCZlhnODJuTlRsRzE4ejlm?=
 =?utf-8?B?SXRjSDZkdGV2d1Q3eTRMNk5zUGxYVTRic092dm5sa2xwMmVlaU40NEFzR0lN?=
 =?utf-8?B?RjJLelp6QXpWTkhoaHZxcTBVNlZOQnVLd295RlFBdkIxRlR2R1JLbmFrQ2Qr?=
 =?utf-8?B?VXJTWkJZMXAzOWlDREZ0bTVFYmI5K2ZjK1FqZ3FDVEd0dlJyNHJvNFY5UHZi?=
 =?utf-8?B?VXJqa2VlOFk2Mi9hYTJWRTEzMzhLSTk4SUFKbC83dEo3T3hNQWNQZVUvcEJS?=
 =?utf-8?B?QVBobWtURVZvcSs0S3A0ZjA5elNwMEVaWG9oOVdicEJsRndQanhGRVJVZjFN?=
 =?utf-8?B?UFBIMFBwQ0FoMWdYTFVSazhOOGpGQmZFdk5ScTZlOVU1TjdkSkhxdVNDYmhu?=
 =?utf-8?B?a1Ayd0JRTU9PbTVIVWtiRk5SUkVGN0ZlbmJVR08zbVJHcU9Ja0Iwc3d3UExS?=
 =?utf-8?B?QlFERktKS0J3NFNKdTFxRk53NjFjaDVqRXdNSlFuRHNZUU5SZnJDNU9NM2cx?=
 =?utf-8?B?RkFLZUp6TlVFNUdXemkwZmN3dlZKQ1o0VGdaWlRaUHRObkdFMmhxbzhVMmpJ?=
 =?utf-8?B?eDRSM0dHVkNCOTJVM0ZHYXlGVkIxZmM1cDdoMHdaMUJoYXovOGQwUGxsT0VM?=
 =?utf-8?B?TzRUTzVabkN2dFFvL0trS1R3Uk1TdnlHdUkyZ2NONHZqa2tQWEVHQmpFNFEw?=
 =?utf-8?B?VFcrUWJ2YTl4WWJYNkZuYThPUWRJOTQxSk5CUmtiamdsMjNNYlVHQ0RnT29L?=
 =?utf-8?B?b2tqelJ6LzFuVzZQdDVGK2ZJbFUvaUU3MmxJZ1VjbmZIbXREeXl6aW9OTW1i?=
 =?utf-8?B?ODFBSVRKQXFoaWJpUFNGWWFBWGo1MXZQbDk5a2x4dkE2Q01ldVNrVnhML3Mv?=
 =?utf-8?B?TlJvNzMyUWt5YWFpRVBKK3lpLzFYTkZ4ZU9HbktzbkFiNEFIOUo3T25Zb2ts?=
 =?utf-8?B?TlV0bjFLQWpUVXJXTVREVllUT0gzSlB0QVI2VmJJQlMzcGRRRGY0MmxLL0Vn?=
 =?utf-8?B?VnZLSHVrdWlCOVI1QTRVZmFPV1Z5NTRWNVhmVHcvQzNZcnJLYk5XMUpCQjN5?=
 =?utf-8?B?cnR6K09WMUNFbHpmWTRJT2s1dUlSd3VXSFp2KytoR0drSEx0R2g4SytVdkNk?=
 =?utf-8?B?VWhYNG5TOVVET0ZQREhmY1dKcGdCWityb3o5VHVJd2ZqWjYzckErbERMdVl2?=
 =?utf-8?B?dU5acVFNOC8zZWMwZitRMTJ1ekhaRFZYd3dnSTczZnFVUjU0dUZvMWxjR1Nm?=
 =?utf-8?Q?uzWNugjsFWnybJRGqpVV9xR+vPRc9A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2RCenZxWkZzUlRPWWg2eHZZR1NDbnZHMm9OQ2VVWXNkbjNSNDJmRXlZMjkr?=
 =?utf-8?B?MlZBdzlkeGw1TFBRSVRDSmk1YkJnVUZaL1VJVDg2K3ltYzJCai9yWU81Q21V?=
 =?utf-8?B?UEMxNGVqb3JNN25tejZyUnR1WkJ6eXN5cU1NSnBnVUV2NThLK3Y4TlpSVlRN?=
 =?utf-8?B?SHVVWElnZXluL3pNZDhGKzNwekVkMDR6eGh4ZmtnOTllR3FzWTlOKzIrY3Z2?=
 =?utf-8?B?d0tWZEZ1MGxodjVTSWhLcHRRdnNBWVRBcjMzK3BNU2VoK3VMMVlIY05mVHph?=
 =?utf-8?B?VE85RlpmUTlDZG9jYVR0U294djFOM1J2M1JORjN5QnBCL2RJRVY5eU1wbHJK?=
 =?utf-8?B?bjFzeUlOUUNPRTFIbm80b2JRVHlVV3pmaWxjMFlzeXpla3I0WU5tY3M2RTl5?=
 =?utf-8?B?UnptcDRLNFYvbXBTWUZaVWxqa0luTHk5aWRNcHo0S2RTSWZHbm5VcHRlUGJD?=
 =?utf-8?B?VGZDRnc0dnFhNDZndDhieCs1WWp4dHE2MmlIUUJqS3MydE50R2NzNUoxZWVU?=
 =?utf-8?B?Rkl3eWZoY1ZYYXRtM3FXOWMzb25kbVc0MVFLajNVblpJd3c0YzBWTy90dnh5?=
 =?utf-8?B?Q2pYRE1MWWRld0VWVjNpb0xucFVMT2RqWDFZVEJ1Y2VKNDVUaVVqQnJnWUlr?=
 =?utf-8?B?UEJZK3hxVEFJeHdGeW9LRDVRQTZUU09MSXpJNXAxY1JUS0FKWnZwOTd5WFpz?=
 =?utf-8?B?NTJ5QzNSVWJnbWFoeUpBYnJFa2NLdnRtd1RpYkJ5T2Q2c3Vib3dyd1FDZEhk?=
 =?utf-8?B?U1pGZEdGZGxmcm1aaDZaUlhuV2FYRVJIN0NiRVE0am04SjNZWEJJZ1owVlh4?=
 =?utf-8?B?T1hmZnpicHNoK3p1R1BaQ24vUVZGQmpMTlFBalp4bjRndVgrSU8vSzRwU1VC?=
 =?utf-8?B?Z1gyRUZKMVJsQVFTTFJ4SzEzeXFNcFhrbVZmWEFTcHAybGx2akhPeVhUbEhu?=
 =?utf-8?B?QlFnWkRsSFJGNmptbTF5NjN4UURFaHJ2M2pBT3oxMndoNjI1WG5oaTZYR0xk?=
 =?utf-8?B?TGVsZTZGaWNCSTVnT0RKNEJGc05JcEl4Y3dObHEzeVkyNU1ETktPRGNic1RQ?=
 =?utf-8?B?azg1MXVkMlNNaXhQcWNwSVJvNXhMcUNkS2NTeXN5ejFpN0hMK0gveXQxbU5X?=
 =?utf-8?B?SWxsNyt1SmhBbFhuZHV2YTZuNElYUXFTd0g2RlJWcUxlYkNTeGpRU21sWTlr?=
 =?utf-8?B?S1hSWFdSQTJ3R3lQZit0S1pCKzE3ZWt2eWt3UXhteG9PZ3NVNkY3VjIyQ2Yr?=
 =?utf-8?B?V3dJOTM2c1M3S0luQ1ZNVXN5VTFHS3pVT3lFeGs1L3ZadUhIUTdGU1o4YUdF?=
 =?utf-8?B?cXNmZGszQ2w5bVB2YklJSjg3MjhabDNPazFrdzZ6ZFd6ekdDY1MweGFZTlJ3?=
 =?utf-8?B?c1RNSmdRSGlpTXVKNW44aWt5MmhxU1pzM1hXRXhDcGI0NUNZV1lkSStLYmZO?=
 =?utf-8?B?d0FUK3Zpbnd0bFA5VXZmcnlTL3RuVjd4bjFZVUlnSTB4ejFoN3NGSVlYNG5K?=
 =?utf-8?B?S21ZMnBuNld6dFNiZTVaZmF1WjlVRUhKcmp4bjZJUVFTUVNjSFlObEZhbVJ0?=
 =?utf-8?B?NGRMcHRLeHljNFpIVzNKaThxSHM0VldqaU52Qkk4cDFWZnpjWjNXTVhBK3Jn?=
 =?utf-8?B?ditoS3FjMThZNWJFNGM3VTlNcXZFdjAwcVRkbVFEaDJTZGhxVUU5SW0rSys5?=
 =?utf-8?B?ZUVaTklST2pKWHl5VnhZelJjcFdoRHo4TW1pMU5nZHBWLzErd3M4Rk91R3Yr?=
 =?utf-8?B?c2RWaEZwUkVUVmFEMmZsMC9uRm8zamh4QlhTYjVxdGI0cGYzTmZXakFlT01T?=
 =?utf-8?B?TytkcUJUTE5YemNlb1lwNDAzNW9maGROVnhXenNyblkvak5yN2F4ZnNOWTNL?=
 =?utf-8?B?N2dqZkJmVmtCL01qVGhwc05WeVBNUTRDN0xMbFpWR0R5SmRPa1Z6MmFkNXBk?=
 =?utf-8?B?bXZQQmg1S3pFWDlQKytJSGIxQ2RtUHNlRTZ2ZmVpMWxXNjcwZGk2ZWRYV3Jj?=
 =?utf-8?B?UjNlek8yRzRqcHlqdE14SEkrR3lOdVNlQXlhQVFmUWNkV0N6eXorMkMrU1lO?=
 =?utf-8?B?STBub1hwdnZVaTZsY2NBaTJMbDE1SGdiM0NWWEllMC8veXZKRURZZnhabEZ4?=
 =?utf-8?Q?7mMGIgsYjurke/+fYf7EkrQN7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fbbd944-da6a-4f2c-5495-08dd82748ba2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 14:38:42.8093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RG6i+By99uzKn8DAjYAqo+pBmFF0IJjpjzQ6D4kr+cGCrj3iDYRagkOHnJAzibHcUOEeb1miyovhbZO/ap/KMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8413

From: Peng Fan <peng.fan@nxp.com>

i.MX8MP UID is actually 128bits and partitioned into two parts.
The 1st 64bits are at 0x410 and 0x420, and 2nd 64bits are at 0xE00
and 0xE10.

Dump the whole 128bits for i.MX8MP, by set soc_uid as an array with two
u64.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/soc/imx/soc-imx8m.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
index 2186f6ab3eddd6c9369c691c845b3b78acaabe23..04a1b60f2f2b52cc374714f9a1205496c1762f39 100644
--- a/drivers/soc/imx/soc-imx8m.c
+++ b/drivers/soc/imx/soc-imx8m.c
@@ -24,6 +24,7 @@
 #define OCOTP_UID_HIGH			0x420
 
 #define IMX8MP_OCOTP_UID_OFFSET		0x10
+#define IMX8MP_OCOTP_UID_HIGH		0xE00
 
 /* Same as ANADIG_DIGPROG_IMX7D */
 #define ANADIG_DIGPROG_IMX8MM	0x800
@@ -96,9 +97,13 @@ static int imx8mp_soc_uid(struct platform_device *pdev, u64 *socuid)
 	struct imx8_soc_drvdata *drvdata = platform_get_drvdata(pdev);
 	void __iomem *ocotp_base = drvdata->ocotp_base;
 
-	*socuid = readl_relaxed(ocotp_base + OCOTP_UID_HIGH + IMX8MP_OCOTP_UID_OFFSET);
-	*socuid <<= 32;
-	*socuid |= readl_relaxed(ocotp_base + OCOTP_UID_LOW + IMX8MP_OCOTP_UID_OFFSET);
+	socuid[0] = readl_relaxed(ocotp_base + OCOTP_UID_HIGH + IMX8MP_OCOTP_UID_OFFSET);
+	socuid[0] <<= 32;
+	socuid[0] |= readl_relaxed(ocotp_base + OCOTP_UID_LOW + IMX8MP_OCOTP_UID_OFFSET);
+
+	socuid[1] = readl_relaxed(ocotp_base + IMX8MP_OCOTP_UID_HIGH + 0x10);
+	socuid[1] <<= 32;
+	socuid[1] |= readl_relaxed(ocotp_base + IMX8MP_OCOTP_UID_HIGH);
 
 	return 0;
 }
@@ -220,7 +225,7 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 	const struct of_device_id *id;
 	struct soc_device *soc_dev;
 	u32 soc_rev = 0;
-	u64 soc_uid = 0;
+	u64 soc_uid[2] = {0, 0};
 	int ret;
 
 	soc_dev_attr = devm_kzalloc(dev, sizeof(*soc_dev_attr), GFP_KERNEL);
@@ -258,7 +263,7 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 			}
 		}
 		if (data->soc_uid) {
-			ret = data->soc_uid(pdev, &soc_uid);
+			ret = data->soc_uid(pdev, soc_uid);
 			if (ret) {
 				imx8m_soc_unprepare(pdev);
 				return ret;
@@ -271,7 +276,12 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 	if (!soc_dev_attr->revision)
 		return -ENOMEM;
 
-	soc_dev_attr->serial_number = devm_kasprintf(dev, GFP_KERNEL, "%016llX", soc_uid);
+	if (soc_uid[1])
+		soc_dev_attr->serial_number = devm_kasprintf(dev, GFP_KERNEL, "%016llX%016llX",
+							     soc_uid[1], soc_uid[0]);
+	else
+		soc_dev_attr->serial_number = devm_kasprintf(dev, GFP_KERNEL, "%016llX",
+							     soc_uid[0]);
 	if (!soc_dev_attr->serial_number)
 		return -ENOMEM;
 

-- 
2.37.1

