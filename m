Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2074.outbound.protection.outlook.com [40.107.21.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A871C8629
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377358; cv=fail; b=CR7Ahwxzj/LNRiYApKZTmBkIW5gRn7AvoUhMPBvDakBO4nrhnTfQZXr7Iq3C2dRfJaGVvoeGlnZsEcUNEcqE/iO/lb1enYbvk5PH0pUYaJakBFw00flFhfPvxidODQ6qLmliSkH2tnW29jtE0YG1/6wiw+HivjeoK/Ap7ZizWDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377358; c=relaxed/simple;
	bh=Fk++fHqkrShI0LskVt87YFOlB9TJVuI4wVwgxOH5+s4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lc7G7+RIFwzc///TOewoSGZu3E4dtE4MIttw28Z1rf6t2VNG4UyCBnNW1oFFX2pcxDru45kV2nlXAiW5qGR6XT0zR2U1Yy9OqYTcIzYUDE7k6vDlSits1vcFsbw9bsKfYWImF95lq9N+czCSF6ORq0hLL7QBMpyqys2CvubZ5js=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ffuUoZUb; arc=fail smtp.client-ip=40.107.21.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ffuUoZUb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0Z6gBEydAcs5yqUVelc0asmHCxrBz6CGS4hgoPnaPa1rvnLU0EkV0ABi9E+KYvg/hbN+6d7iUyCR0hqE2qENMAZOWu+Ak1TRfzeQe4cAe+BPZSYflCPC7S9+Og7HBUizfJ5BNHTkyzf4xC5whyxqp4arwscQP5UsqJJLrFLHcHtA+ktUwzNFHQsXXTXJ+Gn8kK1PCVbi/CJCeTCeHJOWQrHaU7HBL+h0fOeRDF+fJEeSn6DmqepVcM0SSIB8WJ8qFX+K2aBmgpQMztPc4MYoJEY2crfyy98dYy4QnNAvsUGsXvOjEyFJ61CcgomXYFsX+Uvp+fKPXdBEnXPtICpjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLKJZgDifmFu8LqPNN/gds1Lhy9QXXnXqE/mxi9AZJg=;
 b=i2VqJe3CEKkwZKu0wA5mHklPiJHk+ZVhzqVaZVV/lCWdQhbW1iT9760OLNgwt1PNniUZdLgi1JpjLwXd4sC0yLqzLH2V1aYtgbz2LWPr6rHQEbBX7ac1qbsJxgfKvtAeC5cF+/2IkCk4kw7x8K63ay8zvFm4TPs7mVrRjmaHOvksSMTHniEp820S8eX6sj4bLjMyudCpPxIXYRLbDm9T7BDoBZzQbBN/89y9jWRFGekmm2lIPuyaGWMFzH3N5hbczJCyc6Zh7nJBZOu2n7hRJynglF667qgdHBaEOru732Nt3pafbxkETeOroX6ZG7FRyT+3biTyTZfAADZCY7pP/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLKJZgDifmFu8LqPNN/gds1Lhy9QXXnXqE/mxi9AZJg=;
 b=ffuUoZUbnnqHvSC75+1odq24RNN87s0KcnXhLTwgF4C06zZd0LqCYrItwb+2Bc9LMNafFQodv0ZO4tbjQdCdWnviXUerSsY9Hy3f5wD78j+JsRG03q9e5qmQCdeGhy+E8elOz6VC2pRKJ90yPM/ULvTE8FIYvM2Lbm51knz9s8sQoeum2ek5okb2ueoyv9E3k9EnnYp+Wqk8u60EcN3cSUcB0OQoZt5GQoJZZkhqLytXoIE2+4EBhHjJ3J+DXhM3cB4bUFKc12CHOqF0XVBMtAAqPiLNDmV01YAN5fjcxop6M9F/6PAvHUJac4S0eZ9JY/R1odgLUuJn7dPRzaGqDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10674.eurprd04.prod.outlook.com (2603:10a6:102:483::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Fri, 11 Apr
 2025 13:15:52 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 13:15:52 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 11 Apr 2025 21:14:11 +0800
Subject: [PATCH 3/6] mailbox: Propagate correct error return value
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-mailbox-cleanup-v1-3-8db541394dc2@nxp.com>
References: <20250411-mailbox-cleanup-v1-0-8db541394dc2@nxp.com>
In-Reply-To: <20250411-mailbox-cleanup-v1-0-8db541394dc2@nxp.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Elliot Berman <quic_eberman@quicinc.com>, 
 Thierry Reding <treding@nvidia.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 linux-kernel@vger.kernel.org, mailbox@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744377279; l=833;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=kH4IpEQ9iZW8gePYNZciV4MQJ5zUzNHcIZREQLu2Q28=;
 b=Tnsak9jDyuUwEWWS2Bj9uMUSM4zavkCQOk1Mes2STYpLuAjEFdz/uLgOd5nvzeI/atrHEczGN
 ERXUgVP53+wBw6lOXl0ie+KTeYJo26BWd35ZBNh66tVfisdvz7GNjUA
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
X-MS-Office365-Filtering-Correlation-Id: fd53dd24-599c-4b64-d4a5-08dd78fafc31
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WHZvdGI1bEc3SUVrcUM2bEQrc3dGbk0vbS9hUkRERHcwVTFGZGR2WlBxeU9L?=
 =?utf-8?B?SDFzNTFVbEVnK050SXUybUNhNVFadzRjeEJBMnRNVTNqV0NISW9KS3lGdGFy?=
 =?utf-8?B?WmREN2pLWjg4TUdqZm1ocGsyaldRai9rY0xOZzhVdGs3cEZrMUVna29udGFo?=
 =?utf-8?B?VGRsQXdPL3dzci83Q0JzckU2TUNsQUlKalUxZi9KamxMd09qNlZqSXUwMzlO?=
 =?utf-8?B?UGNzaXF4cEV3NDhKSGFzenVkNTNkVFk0eFk5M0JYU3FsZGhmSVUyR2dmSTFB?=
 =?utf-8?B?MDR1eUJESGVTbWJyUGk1MU5wT2NrbElyMm4rTjc0YXJITFJuMGlqazVrZGZU?=
 =?utf-8?B?WU5DZ1hKdmFVTXhWQ1J5L0JmcDZ5RUYxUlVCbE0wRTQ2dncySGJwb05WYVlS?=
 =?utf-8?B?cG5RZDVEQVhiTHFnL2t2c3p0UFZqY3VDR080a1dXTWc4bGJxc1lFQkE4ckZ5?=
 =?utf-8?B?M3NEcWt6ZEcrRFUwRnhLeUkycXNNczduMC90RGdJbURBSU01ZFY4bkFFV0h6?=
 =?utf-8?B?TWxkWkQ5RFQvUlUzM3NrQ1FwYzdGeGVsUDBwU0pRY1NiTHdHSm9qdjkzWXYw?=
 =?utf-8?B?Zkx3emdCL3A3ZVRMMDhWU1FsdDNJMHBUbWt3Wnpsd1VncWQzcjc2MGVuSlp5?=
 =?utf-8?B?OHd0ZXNsZGJ1c2dkMk5PWDNRZEVSR2JuN0RjRGQ3dFovN3lnU0c2bE44bkhC?=
 =?utf-8?B?S2VPMWlYbVM1R2ZWamM3ekxtUDNHT1NSTFI1UkM3ZHRsUnE0ZlQzQVhkOFQz?=
 =?utf-8?B?UE5KdS9yNUZUQ0ZzVi9MZGJpTlFZNUhCTDhRZ0FmVzNFRXZYdWxLK1g3cW1h?=
 =?utf-8?B?RHdlclZwR0NIUFBiTVd3S2ZVOXBtczNObWpYdlI4eWJTcXRyN3FPV1IrRWlw?=
 =?utf-8?B?Q2lUTlhFWUlDL2FMZVppcys0bEFzd0lIZ08wMk5YelhMK3BoQksrbjljUjBW?=
 =?utf-8?B?K1NxVGV1K2VCU08xMmQ2NDkzc0VDZE84eU5BZmRMWStEazVNZ1duMENuR25B?=
 =?utf-8?B?a1ZLb3dUcUU0YTY5WEp1akx2emJEODNpYUxsY09aZGt2Y0lkZVFQMkJpVmV2?=
 =?utf-8?B?ZVRDM2ZLSWpjRHFrZDRML3UrNWxwZmxpS1hiL3ZPdU9GVHdZUkphOFpFc1o4?=
 =?utf-8?B?bktVRkhMZ2hWTmFrRFRRV2tGWlJiUWpLVU1OUWRMNk9WRE5tRi9hanlxVUJL?=
 =?utf-8?B?czUwVTZTNm4vQWlON3RYdURrYkg3U0Jnd0l4T0VhQ3JYcEQ2bk1PVnU4TVRZ?=
 =?utf-8?B?VHQ5aGt6SjI0bDBOWmhqQnhjRVdzSjBHY3pYM2o2OEJYQnhmcThjY2kwK0pV?=
 =?utf-8?B?ck9vR3VVUlF6aWRlZDkvWEhOOUZQejNuY3ZXalFYM0ROdFdzbWRMZDlsaGJD?=
 =?utf-8?B?ams0enBTWXM3NUlxY2JBY1ErZXJHU0NJOG14WHVZR0VZbXFldlliVmdtVjNh?=
 =?utf-8?B?bm1TemhwZ3VjMDNMR3A1cEtVRFgyemJ6NStiWnNKbUwzTms3cFRTM0pVc3FK?=
 =?utf-8?B?M3doYWc0YWJKUU1SV1l2SFlvbWRIeGNUNzExZGVITlhIalRBTEhRZWFmMHhl?=
 =?utf-8?B?QjJpTDVkckFYMTNCb3pmcTJCR0Vna1A4akx3TGU0eTFTTXdHSGpjYTM3TW0y?=
 =?utf-8?B?RUx6MjVKZXpGYUFUOUNJN2lPY1JXZTVSWFlFdGlQYlhXQnNveEZ3L1FvcGZO?=
 =?utf-8?B?S0Q4c2RqbUVkYllBeGZvbnd2TnZQWVdWNk9ZUW1YWUt6MzY4bnBxTnREVmJV?=
 =?utf-8?B?TzRxcE9QeTdxaWlPYWRiUTNLcnFhdkNuSjVEekVOdW9GeTdyOHdBK2d5c2t1?=
 =?utf-8?B?TUJIZVh0ZzVvSkNuanYvMm9TQVhhNy8zUXNnc3lhaXZmbXMzUzNnTllQbGVS?=
 =?utf-8?B?TnloUFRwT2ZkalovVHFQaEhib2xZNTBzeFVEZHNFeVZ6aTNVaHhyQUJ0cjdO?=
 =?utf-8?B?OVJGRE5ZS3FjQVp2OXBzWlIyOHBhNFczWk1TUHI2dG5CN0g4V25TYVJaenI0?=
 =?utf-8?B?YjE2VVpSWjhRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nm1XV2ZaVlRqR0crVEE1Y08wd3VYaHVBVjJrVkduamtDa1k5TC9CcldSWExX?=
 =?utf-8?B?QUEvS1NIbGZQUkFKcnpDbE5yME1wazZ6U3NPT29MNWJBREFEYWplNUNhZmFN?=
 =?utf-8?B?SDQzZE1NVk9seWZtcTAyelV1WDVqT1lVQ1lsUFVtNzdjRWp3SU9SNldzQzFw?=
 =?utf-8?B?UGN3N1FYbDMvdlRuaTlVUFZ0b0Y4bWp5VUY4RXh0TktuTmNhaS83VFdLbzh2?=
 =?utf-8?B?NWdtQkFHMllYS3lEU1BzbVVlMEUyK3QwODM1TUZKMUJ2c0Z5VjBmVFpjTjZG?=
 =?utf-8?B?N1FkanNXMVBPclNRUHVGUXVaM1VIdGRFbVR0b1lKQ3pmc0lWN1VsdTNIUGFH?=
 =?utf-8?B?ZitjZW5odkFaeHB5THJRTDFrWTUxaGdiWm9LSVR4THoweUNmUld0N1JnRW1y?=
 =?utf-8?B?QUpwWWt4Y1VQZXZvWVpGZ2lOeCtBYzVHWUNucUc3Z01lSy9wWkRHS0hLK2RS?=
 =?utf-8?B?aEVubkUzd2Evcmc0TWd1bUVMM0taMm4wTUxwblpsZnhrNTYwazR2U1MrOFRa?=
 =?utf-8?B?WXU4L2I2ajdhV3lML2sxM3pDQmZXbTNSS1VrWVVXbXQ1aU4veHF5bG9zc0dY?=
 =?utf-8?B?NFhZamhSc2NEQkhxQitscjh1ZEFYQ1lCWUtLV0FEOFk3bmxnQURJUUEwZFF1?=
 =?utf-8?B?Z0xUWE5tdi9iM25VK0EwT0NpZjB1TVNnUHJjUmNJTU1sQWpzbDN0ZWNOcHV5?=
 =?utf-8?B?MXFpbVQrVUJLWUZZaHdjTmt6bUtSc2dFVFNUb251WGJLZkhCMm9CajFOSjFu?=
 =?utf-8?B?L1VHR3k2NEE2Nlphc2pTaC9BY3dWY1RhcTVVa1VFRFpTTnpTMFkzbVUwTUxn?=
 =?utf-8?B?YjF2RWUrM0J2azFWTGozVVdWdFNYSDJjVWZvaEpLd3pnVWkxSkFCVndQdGVa?=
 =?utf-8?B?cmM3VjVETC93dkJkc0ZhZzNPaFl2YTNOTldjUm8ydTQ1djA1NlNua3RHZldC?=
 =?utf-8?B?aHlKQnhma3J5Vld2NXRLdFRLTjJIa2FQQmZHbnZHTVZXQ3JCYnVJVzNMODJn?=
 =?utf-8?B?L2IrTitRc0hURzdZM01Za3dJZFcxbjYzSEJmdEtQVFg4bk5VQkllWjZYaWpu?=
 =?utf-8?B?YjFaSVpNYlljekhnUVZSaVRnRU16bUx0OUJSamtub2tYb1RyTVRtQ0xoZTlh?=
 =?utf-8?B?bEVvVHlwWjJQR2VlQmhwS2M0K3F4NGJldSthMGtNVkdNcU1qUFR2a2QwSnFE?=
 =?utf-8?B?OUJjTURUcXRZSWoxUWlzOVBHMDR3LzVDRHpHMHMrTGczVEIyU2lhUnhNZzRq?=
 =?utf-8?B?UUZSZExON1RNOVIvNzJCVE9Qa0kyOStOZVcwQ2U4ZGw1R3RQclBTelhZWmdq?=
 =?utf-8?B?a1hjQU1veEFocUU4QmtZTElkZU1YT3BDajJBVkpPU3A3T251OUN1ajBBZUJW?=
 =?utf-8?B?RnBjVEFxcTViY3daYW4wS3hRMUcrMnBFWUhLZUo5aFNieUx5TkVDZHZMMFk0?=
 =?utf-8?B?TjVOOElPQ0c5djNVUUwyVVExNzZrMUtXeVVDaXJ2SUdtODN2YW9Kb3BDTlBQ?=
 =?utf-8?B?Wk5nanV3SlZSWDg3V0JhV29YZ0U1Qm9EVWpGRWpIQURmL0Z4L1JVY0hWOUhI?=
 =?utf-8?B?QTc2QW4yL2RwaUVVeXliTzVIWjJSYVJjcDgxTk41aysyRDJuQS9sRS94SjR6?=
 =?utf-8?B?bFZXS1RNb2NoZE9rZWVpckhoTnJCb1BnOENMQWw5bmVzSkZMdTczSTVCTm9q?=
 =?utf-8?B?NjNqWHJpQ3BlWElod0hvK0dGVTdVSEhaRmVZNUoxWXFxYjZMbmJTcVZsNUZl?=
 =?utf-8?B?MHJzSEJDdjZtUnBOdXY5a0llVjhxMmxtamhUbG1UejUyaXNjdG9IMjlDY1ZT?=
 =?utf-8?B?VVg0UzVvV0U0ZlNGV3RCT1VmVTZVc0c1dW1CbU15OUkwbFZVK3gxNXpEalY3?=
 =?utf-8?B?dnNnc29POExaWU5GTHJjd1lOM0pnMjBSZEZsZEFpQVVSNEZvS1Y3ZDN3b2k4?=
 =?utf-8?B?YnN5bVlRZTNxcWtWQzdKZFhZcVdpT3pWOGhOQ1RRQ3gxb1ljOU1adTFDK080?=
 =?utf-8?B?d0RJSDcyVE0wTWQrelhFcmIrcWNUcGNBYlIwVVdFMjE1aDhUamhDMld6Y3V6?=
 =?utf-8?B?QXhMVi9RT2JZK2VrQWxTM253UnBtd053dmR2VlBDNC9ZOVRXZzNUSWowSGtJ?=
 =?utf-8?Q?IUHPfk9tHeBhL2zzJ11/595AL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd53dd24-599c-4b64-d4a5-08dd78fafc31
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:15:52.6488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Th1H3lJe1lJ1pyQLRJKFfdOcttn5SXvGye8pqMmSoT67XrC2Qn0NsKp6sMbftQYsmmi5l43YyTPiuqXBgFA27Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10674

From: Peng Fan <peng.fan@nxp.com>

In case of_property_match_string fails, it makes more sense
to return its error value to caller, not force the value to
ERR_PTR(-EINVAL).

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/mailbox/mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 3ecf92a580fef031d8add5e4c2e4df494a34010a..3a58dc56f015b0bf0ebc7551713af38c16439e11 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -458,7 +458,7 @@ struct mbox_chan *mbox_request_channel_byname(struct mbox_client *cl,
 	if (index < 0) {
 		dev_err(cl->dev, "%s() could not locate channel named \"%s\"\n",
 			__func__, name);
-		return ERR_PTR(-EINVAL);
+		return ERR_PTR(index);
 	}
 	return mbox_request_channel(cl, index);
 }

-- 
2.37.1

