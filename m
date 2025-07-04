Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013033.outbound.protection.outlook.com [40.107.162.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8130519C546;
	Fri,  4 Jul 2025 03:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751598703; cv=fail; b=heb+XhYR+I9HkwTAohgpDNYUnl1L9Nh0QjvFzT1VUmC0SRoXh5vhNPzTxQx8bQfEavf1sH6uZQKUCm8Py2dXo3aExJ6mlqUsFUp7IE+q8iUrIBJ0B6AYco0YJk6SxE1ywJug2h1Rh/itae4A6WwH//Bf+qr/j/AciQaZXThVZf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751598703; c=relaxed/simple;
	bh=jKRKOzp+9DRliafsCZdSn0odii4pB5/CsXnhzBjbkaw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IBTXuzT8AEvb020qa0DcE3/RJexQ6SYh57/RINx0C9+SxyKrqqhu/s7ZqzNqwZCLbHa8qg+pXo2Xm1FdYXNBOFS+ajBWPsOpmZPjv/3f7GrLR9O500J3dg9ntmgE9++FfLtYYjZDP8TfoWsrLdnE9Hq/DQpv7yW8RsdV7YyP4Ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JRq2TvYt; arc=fail smtp.client-ip=40.107.162.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JRq2TvYt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CapqYuWcSP315wjbbQ0cDy+ada9ntKA5G0iHyNRzsgCMnRHssvAcdDYajxN801zTzTnuOfPNdV1/K9d9EUSb7WK1ljxuF1gkvE1BNez3YwXwd6N4B2OlYMNQwNtR6pFns23VoUTCICr6NovlNQMMbjUyTI7uOJSDA7Q8m/2AhQnaesAHvZ3Kydk8PE5Fcs56ZsypnqXO8qgsID35QN4nV1lpZLp7iqQFBlCBEqNawZP4l6I4DMtVmjqQ2u+qPPpU5UspBEdvrsZdhcpXBoSYdQdFLtQbfYSrcpDdlvLlx8pfQjW5LEMjxtitnZqng4o8H6wMbHNLbj9jKWWgSXdsUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxW6sPkTSITgoYwZQEaVbV0P06HnI4AlCbzM/Uly+pE=;
 b=OLB574XieJY4WOuZFdmzt1larnbeLwmZacWy9Hf8P+qHslJFbLsZDQ/Ud7a2AK5XafmkpzH/46SS48h3eqQP+T/peRbZdV5DGRs7mCwVeLSniZPO6iu6d7TMbL9dASmBQBVNRVzsUShj5oMh8CgQcL+w0wuc+VexBYor+IuVp3rpZpfGUOWWJO4MoJiu5uOHLxIuvhWQyboQRYVG4QZr75TICoCLBv1TKU9qZ10L1agc8A4iXI7XlHE4/RE7ON5Eh4yRila1AFAtE7hQe3ulqnHTUT5sBN11yHGKrwc/HTylGoKMdlLqIHG4Ya2z9TRdjTHyWTK/AKIQ2nVO5larnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxW6sPkTSITgoYwZQEaVbV0P06HnI4AlCbzM/Uly+pE=;
 b=JRq2TvYtkSU+eX38o7WA6mPdLQcnRZYjQ5UAWLanCo2M/Y/oz7jXCgiqr+T5hgAUEKT4sEdvhPfu7VbMpEgpRRF7l/PtKN/yvSIFfoRl4oyKtY7XBTpKRiNmzlzNVQtBJwfypq+q254DAYzAz6C6WRP1iptMkK/8aut5b7J+u7sIHez3HMNFp6LJPQA/SvavVXOIU8dI6Bt5KTYN3ocFngc2W9jqSD/QbMf+LGoOJU5Gw44mfImsSrqC3Rz5cNGJrNs63OnkDB0K3l976jTDgQg6tytgtRYwoPBcwA07v7fMA2zScGy46nIxgSImUXACVzo3YXcViDKfEO3M5pGi8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AM9PR04MB7634.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 03:11:38 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%3]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 03:11:38 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 04 Jul 2025 11:09:35 +0800
Subject: [PATCH v2 1/2] firmware: arm_scmi: bus: Add pm ops
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-scmi-pm-v2-1-9316cec2f9cc@nxp.com>
References: <20250704-scmi-pm-v2-0-9316cec2f9cc@nxp.com>
In-Reply-To: <20250704-scmi-pm-v2-0-9316cec2f9cc@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>, 
 Chuck Cannon <chuck.cannon@nxp.com>, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751598594; l=1736;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=jKRKOzp+9DRliafsCZdSn0odii4pB5/CsXnhzBjbkaw=;
 b=oA4OtE1+51HWMXyJyK8AGUoCuQ5K8Q9dKXWp9iOPuR/BUXSsrY8lLiRwvmQ+T/e/LDTI38266
 xDQUxFvu3uwCMSoJOzIi6tq55/rFQsvd3ZuO/jl3U03P2qhX183/vGd
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXPR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::21) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|AM9PR04MB7634:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c5398ab-8fed-45b1-c0c9-08ddbaa87db9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YkNYVXZyNitXRXN0Q2l5dVVmSThVWlMwcnNYTVlOTW9jR2xQRWZVMlBndGlY?=
 =?utf-8?B?YVpYRnNad2EyN2tBU0h6Zk9Bb1gwVFFmLzRNUlpmME5EOThlSjBWYm54RjJK?=
 =?utf-8?B?NWY2eWtWLzNRR04wK05yM01kNStpMXZ5b25yMk9qSHIzVmJhSVNiWUxHSVRI?=
 =?utf-8?B?K2tDQS8xK1lXWTBVbHA0T0t0UzhYRmhxa0FrVVZ6MlZ1aWd3bVFWUGZNNURH?=
 =?utf-8?B?TnVzQk83V253eVdVamEzUUtGNVJnczRFejBmaEp6azQ0cGY3d2VQUHZzSzQ0?=
 =?utf-8?B?elBKVXJIUlo0Z1ExbmU2aWE4NVNXOFVmMWdmeFIyZE5yREtMVkJPOElSc1ZS?=
 =?utf-8?B?Y1VlQnk0SU5ZNzFCcFI2RnV6WFB0ZGN0MkJPNTRnQ0xZdzRJZnRDK1FUbHlj?=
 =?utf-8?B?OEdXN0RCNkFxUnNQSHhpNnROamswK2dobE9DWDZnazB2WVRsbTlrdFR5Skha?=
 =?utf-8?B?SkR0QVJaOERHc1JtTGxkUXM5a1BlZUhabzVOeEhRSktQeWNRcFRQcEVBOVlM?=
 =?utf-8?B?c21HK3BVVEd6TGZDbkY3UHNsR0c1Z1NLUXBkMHFNSFNXY2xXZEhtSm9uZXZS?=
 =?utf-8?B?c0Y3VnM3dHY0RlJYNHEwMzlkMmlHL2F2bUZTQSs2TWZXT3ZpVmVqZmNzTEM2?=
 =?utf-8?B?NTVlbmx0MWpiSmJHRTM0WEVMRmFNSkVVWSt2cHIxUlV3Q1B6R0tLRzZZQ1B0?=
 =?utf-8?B?V3h6Znk3N3FEU0JENGRuL3M5blhFSVFCem1Cd2Qxdm5BWjNSVkpRMk5FUnVk?=
 =?utf-8?B?bllDR3ZKUmU5L0V2LzJiaUtwWmFlZUhSNHViMlI3eEhGNVpEL2IzdXc2elA5?=
 =?utf-8?B?QWNLbWN3YzRvZjBtcTNvMGxCejFpdEZIYS9keWJYV29BdnN5eHM1ZGpMZXdY?=
 =?utf-8?B?eUpBSUExNVF3MzRjeGJwN0FKQVFiRHpweWkraVZOSEdNemM1YU5oMVY2MGlJ?=
 =?utf-8?B?ZTJLUmNaRk1TNTRIQ0Z2alFTK2s1WmRhZ25JOTFJbytjY0xEUTB5YnlWZnA4?=
 =?utf-8?B?akI1ck9uc2lLSm85bnM5M1ZyU04xOExVRUlwMGx6UzBPaThlU3U3RW45N1VH?=
 =?utf-8?B?bk4wUmtnNjF0UVg2eldBb05VNG1HWUl4cjc4Y1l5Z3hTSGp0VDZrMlFDMEI5?=
 =?utf-8?B?dUVQem1wZDROMk1FNVFPTlBVWHZuMG8vZjk1QThJZDlJcnFRVG8yenZxZXZ0?=
 =?utf-8?B?cUwxRVJlZ2pTZWN1dWl4eGdGejNiQ3hFSnZPQWNocURDSGNpc3RpTnRobWQy?=
 =?utf-8?B?UU1YRm9kdjFYUEVwM1B6OGpIZnVQTzNyM1hMMi9VNktrN1JTdUw1N0k1OHJv?=
 =?utf-8?B?S0g5Qzk0N01tWFFFclNPcmd5ZmhHSU9ReWJ2bDloaGdGK3YrK0o4RkNzSHE2?=
 =?utf-8?B?aUxwTCtDT1dnVGtXcXduUTlnN1dRSkQ5UmRyek1IbFUxOEZpUUorT0VSaFdz?=
 =?utf-8?B?THErb0g3S1I5dFRkSVdCNTlCMGdYNDhkVW1JUk5NM0JYZXBmeUY5eUVwUGlw?=
 =?utf-8?B?bnlCa2ZhcW83dzhqT0xNc3c2TTVjVEdpZ2xadjh5c2hlb2FVVmlvNDlkd2xn?=
 =?utf-8?B?dWpiQ2x3ZGpOU2Nqa1UrcXBBZGtnSklvc2VUZUpDd2VsYURQczR3YlRzTkRD?=
 =?utf-8?B?QnJwMUVYS1pkUWxDZ0V6MWZCTXdNbGFjYjlGWUtBSFg0VUlDcEVIcTFCeGhT?=
 =?utf-8?B?ZWNoSXNLV3c5WS8zUUVRRXVKZmZUYk5oNkdUY1g1c2JoMkZFN2hEcCtXUmsv?=
 =?utf-8?B?eUJWN3pTTDZvNUFaWXZ5dUU4Z1JlQW8zb0xrMHJtRnRPLzkzMHNCMWFDditD?=
 =?utf-8?B?Y0pIQ1o5Y2lyUEJDM3FuQWtENVpNN2tpdmFYYWVwalZPdXJQUFB3NmxXNE9a?=
 =?utf-8?B?c1pJOGdSYytJdWxkMU5MaWdyQWJieWlXVHY5ZkZnN3FYS1VwZGx5K1VrT3lO?=
 =?utf-8?B?L2NKc1lPNHhRQmN5ZDZ6NWZ5YUhVbVVDVkttYjNjblFCM2ZONFB1bjRzOWg1?=
 =?utf-8?B?RWVJb2VlRk5nPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2lIdWlZcGNVY2lZRG9iMTY4cVVOdXlocUJLMGwzZC9Zc3JVa0t2NGZqUnlE?=
 =?utf-8?B?NUdxWTBKSVJrbHNmWjBabnZ4VkpJSERkM3NSdjJNZXFLTmUzeHlTVTlxR2pZ?=
 =?utf-8?B?NFZqTGZyR01WOFVzby9rOGsybHdIVDdLOGFMTjN2d2tIR3Z2T0V5c0I1cEcw?=
 =?utf-8?B?SjAvZUFaMEV4STdhL0k3OExMelduVVVTa3pQd3BOdmFwOElML3c2WlV4NmZ3?=
 =?utf-8?B?RGx1Wk0xM29CR3hvb2N2OTdLUDU0bkpzWkhxVlEvVG1vekFMclo2a0dFRHJ1?=
 =?utf-8?B?elN1ZHVlSFlFMWVnaU9XazBFWjBLRm9KV0loNXY0UHExWlFOQWlHRTNjUXk3?=
 =?utf-8?B?b1lwbjZmeFJYTENRNG5iaHVDN05BS08rYWc0dE00QVhqWGlDZUNJTFltNVVN?=
 =?utf-8?B?RGRaVlFIREgyOTluMmkvZm42b2dvYk5XRmZ4QXFxZnNNM2xmUEkxQnQ3cks4?=
 =?utf-8?B?WEZSdmNMdGFqOElaWThXWmd3Y3pHZ3RXOTh6b2tiRlBnMU43RmR3SlRNVXFx?=
 =?utf-8?B?WjF6WjEwc3NtTlNpSEJXcUZ0TFQzZmV3eEE3NzRzTklpd0Fnd1V6dVlnWkRr?=
 =?utf-8?B?TWZtSFBWV0hQYlR4ZDZQbEk4WGNRS2RIcytiSUNHQUJ5TFk0RjB6cHJxQlZY?=
 =?utf-8?B?TXlsUWJ2SHpOSWxHYlM4aXltZitlYkN3c2h6QkNiTVhEekF6dXFyS2oxUERQ?=
 =?utf-8?B?M3o5V0hvL2QrUzRibHRXL256OHFqUkh6UndNVUR0Q0NVbGhYU2hlTDFsNDUr?=
 =?utf-8?B?OURaSUIxY2JzTkdwZURjUVBUZnpZUnU1a0NrV2oxMFAwenlLYUNZazlXZU1B?=
 =?utf-8?B?bUUxM0VqK3JQOFZSVm9nVlRCeGdrbjNPRmdXczBCT3VzSXpVN0xuZmhPM25Y?=
 =?utf-8?B?T3BsU2ZFamhQRXpQMnJ2Vmk1QWZnNjFqRWZrai9kcko4VEFQSjlINFlSUnVq?=
 =?utf-8?B?K2F5Z0s0NS8xaE1IS0lQYk00ZVBKdFExdXovbUlmcVV5NnNZOFAzbCtYR1g4?=
 =?utf-8?B?STh6VmppM1RNVTNlRWRpQmtvb1NlcyszKzRpKzRlbkJQQ3dCbEZ1cmdtY1BX?=
 =?utf-8?B?R0tZWWRXS2t5bm4zMHpTK3N1S3RNTTFhSDhLQkIzUXRjWXRFU2dzdnNoeGlZ?=
 =?utf-8?B?Uno0M0VNK3lYYnQ2WU9DSThBU2dQdElUQklpMExiSzdhVzA5S1EwaHJ3ejZR?=
 =?utf-8?B?dkZaaWJGWCtxTnhldkZ3Q2NNQVNMeXIvNm5ESk9TSnd1ZGRiNTduSGNGSDNO?=
 =?utf-8?B?UG83T0E3aTVpTFRZSERuNHpZUFJQc1hsaThHT1FmdjBPRFpmaUpIS2pGbWdM?=
 =?utf-8?B?MUdBcVA2bFBGMzlsWEhSb1pWSnhNUnBxbGFja3F3TjJyRzZ3UmRyLy9JejhC?=
 =?utf-8?B?VnNLWXZ1dXdOV1dsZ05QczViajRPaU1RNllBaTVUZ0lwclpZdHRKWTlHTEZE?=
 =?utf-8?B?aXdwVmlQT3lUaTdyNWUydlZXVk1ZNmVjeWNWelYxZGR1QzFMenZYT2lBYU5R?=
 =?utf-8?B?S3RVcUhwYjd1Q0RNL3dIWUY4bmxTTXhHZWlmL1Q1UHRWaE8xNG1TZnBubWRS?=
 =?utf-8?B?MHQ4YlVMVUI4MjRENGcvU21xQktYaXF3YWdaSmF3S1RaRHJkZjJiRjNma1d3?=
 =?utf-8?B?UVFTTjhjU2hTeWRWaERwc25Zd2FnSis1bnhoZ0FBRzdHdFE4MTBKRDNPTUkz?=
 =?utf-8?B?VVdYMEZnZmR2dks0eXRybmdrVHB3UGNqdW84cmFXeW5iU3dIU3g4RkdlaGFX?=
 =?utf-8?B?TDBUNXZMOUdOWWFrV0o4dzVYa1JON3owQ3IwL1drb2pSUm5TVFNkTjFvZkF5?=
 =?utf-8?B?dXZ6aVJSVFp1cCs5alBFU3BEUjdDanp0cHF3dzFXdkxCbk1VczFXNWFoOHdN?=
 =?utf-8?B?OWFrU0ZnRFZjeVZzbEYwV25xdXJmaUpEMy8rV1d1QXE2OEdDbklwelc3TmRD?=
 =?utf-8?B?UW1DQVk4ZzZLSkJmSXEzMEs3b05lVkZPVzBJRmhQWnpvb3NRMXR2UlpiaFFE?=
 =?utf-8?B?blJpY0ErRWJPZW4rU25ZTk9DNFNSOXNxb2hWSlFGMyt6T1J6NWJYSlpiaTZk?=
 =?utf-8?B?YklPS3p3ekExenFrc1ZSY0JxUE5vTSs1NSswRGFaSzE4akdQTVZ0TzFaSHRz?=
 =?utf-8?Q?84Qpk9kYVNO+KGhmZPJJ2hz6L?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c5398ab-8fed-45b1-c0c9-08ddbaa87db9
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 03:11:38.3934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GbViZi32z55C5MgOjeej8nirizeNwbZMANyUCvQWaz5tkELbmncXzlqC7EzQ1TBZ8BjUq8HwW7mx+Zl8S/ZIoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7634

Take platform_pm_ops as reference. Add pm ops for scmi_bus_type,
then the scmi devices under scmi bus could have their own hooks for
suspend, resume function.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/bus.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 1adef03894751dae9bb752b8c7f86e5d01c5d4fd..b6ade837ecea34f147fc1b734c55eafecca5ae0c 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -323,6 +323,38 @@ static struct attribute *scmi_device_attributes_attrs[] = {
 };
 ATTRIBUTE_GROUPS(scmi_device_attributes);
 
+#ifdef CONFIG_SUSPEND
+static int scmi_pm_suspend(struct device *dev)
+{
+	const struct device_driver *drv = dev->driver;
+
+	if (drv && drv->pm && drv->pm->suspend)
+		return drv->pm->suspend(dev);
+
+	return 0;
+}
+
+static int scmi_pm_resume(struct device *dev)
+{
+	const struct device_driver *drv = dev->driver;
+
+	if (drv && drv->pm && drv->pm->resume)
+		return drv->pm->resume(dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops scmi_dev_pm_ops = {
+	.suspend = scmi_pm_suspend,
+	.resume = scmi_pm_resume,
+};
+#else
+static const struct dev_pm_ops scmi_dev_pm_ops = {
+	.suspend = NULL,
+	.resume = NULL,
+};
+#endif
+
 const struct bus_type scmi_bus_type = {
 	.name =	"scmi_protocol",
 	.match = scmi_dev_match,
@@ -330,6 +362,7 @@ const struct bus_type scmi_bus_type = {
 	.remove = scmi_dev_remove,
 	.uevent	= scmi_device_uevent,
 	.dev_groups = scmi_device_attributes_groups,
+	.pm = &scmi_dev_pm_ops,
 };
 EXPORT_SYMBOL_GPL(scmi_bus_type);
 

-- 
2.37.1

