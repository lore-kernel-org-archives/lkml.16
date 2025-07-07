Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010036.outbound.protection.outlook.com [52.101.69.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5870A292B22
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 12:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751889813; cv=fail; b=dX+afL7DNxM7l6bcf7Z8zy1TrtRkb7ilYWs40WQcxY7E88gm+TMIg+LpwQYhlWUpk6zLxZmkymyNFrhJEfw+QI1+3vKqD3Ppz6S1AipT/IqDX5ygovZVx2AV6lXZqg/lFOhZMWQ61KAxzoS9ZBe4eC9QaS8HxqVndDOiQTRYu8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751889813; c=relaxed/simple;
	bh=YGuEMAaQ8Pg8MRkvpeSV8BSNxVApfQ0TSqsKOWNnDLM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TzfxtOQuOzENiEoVdrTVooJ27155UEp3bKgSVX9t7dgKCBADT/jexe5n6BILe27yCkyGTkrW4HcviaFA7jnjSY4L3VFYQWckIXpIjkvi1HbIEcKczfO5hbj+jmhF59odG1w5FKd2R8OcPiHADtm0NrjacMcfBMQ6nMsHyvYHV7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bOLCkF3p; arc=fail smtp.client-ip=52.101.69.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bOLCkF3p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZHKJoT3ed5NOL9SQaP+KMdPkXBybbhQd2DWryC2GhBLi18BZDm9gQj1yyouYBdUexSKnBiAyIJKmKPh8C2hzkneCG387fjsRry7CtwBzPiACjvNf5ZQzPLq/YH1LtuJpWInUHe0ac3NLjg2n6q8pYlNYzUQxulATGRwbI533fUM7/WhhAwOl5y2VLYaN1eXJ4DgA8hS5hWw02V1v4yLArRn7osQBH0hIech+tveDvHJj9oLLUg7/bJaN94/D21wLO0OjBUc+oAvJhGbYg9c7hnrWr1QbIWFAnwQoinTXAHBlZjwQCqcoAwHMZxOoFMpfh9q0/Np9Zz5pgk1MaRa8pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qc8EmEVGU7QxahK5Vov86e7OIsupPB3XRdjJznAhZQ=;
 b=jZMdJQAWBfx6aIzqmI9CmVYvGBC4XfOD1ePPi0du5hiHyxRXSL3n4Kby6arnz6wM1MEc1W/PPExTrmama+K+aOl5X/Lx5H3oDWfgvrF5ulWGD7LTa3wbK63LlprPrMDOwzPzRbgHxe+/4SKhaiGuVBLlZJeI7BpQHZ2bv7qkJmHerQ77wLOBg4qZepqCTHEDZrB2TAPt/ahlZPS1/HJT9x04VI3f6M39dq0H1eqwZYRobpWX+LNrt5br401WcrL/aCx+0bDPCuD8mcS3P/q33Pc8VaPTGFNOg+nQx/OyOq+cl0WQwVB49sAIDYl5bVDMil/kB6y2gs+J/oYG2mUdng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qc8EmEVGU7QxahK5Vov86e7OIsupPB3XRdjJznAhZQ=;
 b=bOLCkF3plbMu9HqX7CUq/3EHKtFnvOLW0uaWd2/BfkgK1o9ShVrnUQcQqJQPaZLRczZhBlz6pLPHY58R1nm4aWUV7BLe0GE4MciM1T4d1LgsYoAgX9YL8W2YkXrrY4VRqbdXniqtIXSRhRto35seqXyfeQSRvtBMllzc2kHKkLXuMThQnheVZ7tq5LuF5Ov7msBBPshwX6kBTgYi6DVw1Xbsy/lCjwSduZUpzJldIH5ZV3DIWxpO394H0THamkKYvIVc2m2yVsNTpgcDUdDMN4AN6XCaZ4vIzgUNpV1k2jvpFudH4RFtGCSE0zsq+0EXGMm1PDqeARCsGgtmNGqtIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by VI0PR04MB10298.eurprd04.prod.outlook.com (2603:10a6:800:21b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Mon, 7 Jul
 2025 12:03:26 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%3]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 12:03:25 +0000
Message-ID: <ce59b709-0e2d-4c61-b77e-2594aa607b02@oss.nxp.com>
Date: Mon, 7 Jul 2025 15:03:23 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/20] clocksource/drivers/vf-pit: Encapsulate the macros
Content-Language: en-GB
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de
Cc: S32@nxp.com, linux-kernel@vger.kernel.org
References: <20250705160129.3688026-1-daniel.lezcano@linaro.org>
 <20250705160129.3688026-10-daniel.lezcano@linaro.org>
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <20250705160129.3688026-10-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0274.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::18) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|VI0PR04MB10298:EE_
X-MS-Office365-Filtering-Correlation-Id: b06bf348-a0f0-4908-4482-08ddbd4e4717
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dFVuYkxPRksxSVRPSW9VVmM0WWtLU055dC8wSnAydjhtclJuMi81b1VWdFcr?=
 =?utf-8?B?Q3RvcVZHUSs0TzRDMENZdjZTN2wwMXZOWHh5Q3NqTTltR2psS0pjcFJJZnpw?=
 =?utf-8?B?cHVHQkhVN3c0Z203aFd5T3hYYXZLMnUvT1RaQVY5RjdRQXZUUnNJbXBwdUJh?=
 =?utf-8?B?aVI1bDRnL2xFb2hlRkwwK0lNVG45QTNZcnF0Z0VQREdCRVFJcXJwNDlCQ2p0?=
 =?utf-8?B?dzVaWlFrd2NHUExuQ3VQNHZuWCtObVpuUGFYNk9Vei83SkFxbXFac0diRjlm?=
 =?utf-8?B?U3p4d3hkOVR1a1VkTG5USG44bm1MWVgrN3oxN1dpdkxyL2EybFFHU1hWYjMv?=
 =?utf-8?B?Vm9IOFN6UGU4N1FCM2hlYVlJaGFZRXdLMWwyc1ViR1VVTFdZODlhTnpibE96?=
 =?utf-8?B?RzB0Wkc5Q2pVVTBnSzJyQjJYSHhVekc5emZBbkpkd0tSUFpQb0RMem5mdmM4?=
 =?utf-8?B?cDUxL3pVdjR1eFVzN2ZwWE5mOUlDaEQ0d3pNYkVNay9sN2ZJR3owdkV4YzZu?=
 =?utf-8?B?RUYxUUFQMEdUWjY4ZHJBc00wazFzamNVUnJ6TDhKRnl2R0JwM1RYQWRweENu?=
 =?utf-8?B?YXFVYUh3SDAvWHl6clFwUGpnTTlscWJkV2sxcjBBcGI1ajF0cEZDbmhCWWI5?=
 =?utf-8?B?ZzFicjZ3RE1oUVRSc3JrSXN6Z3pMUGxFUS80Tzd2ZlVWUnh4K2J6VXRrK3Fx?=
 =?utf-8?B?UHkydmlrV1duVVNmZWEyZXZxZzMvZnpwanlKSlZ1bmdFeks4enlndDZXaVJQ?=
 =?utf-8?B?NE1DNVBJM1FlL2tBRlMzbjhWYmJOUjZyMEpLMDdyQW13VE4rUDJ6cVFzUFFw?=
 =?utf-8?B?RUNRaTNOOGo4aGZ2UXg5b2xxc0txRzNGRDRJSHpHbEFxSkJFQ2hFTnk4cThk?=
 =?utf-8?B?SHBrd0kzbTF4OUZhWmJ5QUgrRDQ5dXFKYzJ0MkN1b2wzdDMvZkJOOXQxL0dQ?=
 =?utf-8?B?VEYvV08xSjJhWWV4YkJuMmdtSU5yQlJIYWg4cmtiY1U1UHBkVDFxVjQxV0dW?=
 =?utf-8?B?SnFhR08ycFdaVHlnbEg2T0lzQktJdDkwYjFjUVlEaXhVZm5mQ21SWDE5UEJ4?=
 =?utf-8?B?c0tLdktSdkNjOFI4bGhldUlLODN2QmdxRVhxK0gxN1JqbmdxL1ZiNDV5K2Q5?=
 =?utf-8?B?c2ZEWUdlSU83MnRIbzN4QWJqcUJrUDRyWlJ4bHNuUExJK2dDeW03Ymd1cTFD?=
 =?utf-8?B?d2xpcnRnMDJUdXQxTUFQaDhYSER5K1IxS3IvaGFkNHI2MWVhTVdIN2tqWGkx?=
 =?utf-8?B?bFEvUXBqN1I2WnBJT1ZXMSt1N2lNVTBSRHVpZkRlNFRxWld4UTZXK2tWbzZh?=
 =?utf-8?B?eDRxQTZ0RkJManN6M0s0K2JuMklZdDV4NDdTbngyMTR6OXJXNVZld1E3VDkv?=
 =?utf-8?B?RkthcWQxYzlObWZmamlKaVFkS0d4bTIzdGZVc3VKOXZzaThINVZNTU5HS0Y4?=
 =?utf-8?B?dkp3UG9vR0VaS1VLd3Rxb0doY3RPdVBVS1kxMldwTHo0YlZDUjJUdUtOR2FP?=
 =?utf-8?B?UDd4ei9JbU5xci90ODd3V0VKbVhodVpCSE54bWQwM1BKM3F0c3FnMXZlL2dW?=
 =?utf-8?B?bmdqeHZxR2JNTTZkOEQraUQ0VVFiUGdValJCSDhiNUR4Q3dRSlJWWFNWcGdO?=
 =?utf-8?B?aXdQWjBGQWk0a0pnOEdpbnlHVXgvczhPWndXTk1rM3J3enhSTjZuWXQ2SzNC?=
 =?utf-8?B?djNmUkhMZURmTEZtck9IT1pJeUpHOVNYT1lsL0QraktDWTJsUy8wdEdjVUZN?=
 =?utf-8?B?K0JRZGtlWmw2Y2NIcGtaRlN0dmRad21vQU1laGxWTEcxWXJmV1h5Ky9BYWZt?=
 =?utf-8?B?a2ZPSC9PYTc5Z3lUZVByN1NObzNCTDBhNVRXWkhuUEd5dWpSOGRrcFpNYzFV?=
 =?utf-8?B?M1p4SWZFaFUrM0lMdVgwQlBIYlM3RmZHTGFicS9zMDhsMHNPaW5KVWxsU1hn?=
 =?utf-8?Q?wPgNX1os1LE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8582.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anFsdkZVNDU5RWtOSjRVdG1BMTVwYUlOa1FoUDNqWHlHVVcrZkFkZUNmN2Za?=
 =?utf-8?B?ZDl5YXl0M2s2ckVnOXZQTC9rMGNOc2ptWlhnYVI0SWpSNStVTnJiU09PeGJn?=
 =?utf-8?B?bGhDYWJYckZyVUN6SnVFcC90R2ZUTE1ncjZxSlRtNWp1aC9mbkttbEpXN0sx?=
 =?utf-8?B?am8zSDBTcVU1VnlITURtaFRNbU1QTFE2b2dmNmx3V3hLcHVvQkJ5SStCU1BJ?=
 =?utf-8?B?Mkw3Q2tNWVM3ekJ0RzJFWVdDMGFmKzRHL0ZvV3pFS2YwSCtWVTZnWkxxNHJi?=
 =?utf-8?B?WjNRTlhjK2dOaGkrTWZ0NSthN1pQemJjQm9qL2NSYTBOdGlHaTV6WDNheWJ1?=
 =?utf-8?B?ZEtFWkhMU2JaU0dicUtnT2lZeWxlaGZRZjZxVmN2K2NHeXdSaU1PZHVhQjFQ?=
 =?utf-8?B?WHZjT2U0ZDF5RzRjVEZIcDRIbGtPaXNYcGJRMUFWQjVNUnVQeVExWjdVS2FD?=
 =?utf-8?B?UGJGbWVNZFhicWJRNlQ4bjBudUVsQ0ducUlrbUplaTRGdnMreU5HSXMya0Jn?=
 =?utf-8?B?VHZjNnVscGhPN3BIWC9BejFsdGkzWk15Q2FhWTNJUUlwK0dEek5nbk5CYVFr?=
 =?utf-8?B?U1l1MlQycVRWU2liMEVqdC80c3hMUjF4eVdNNTh3cDFwWXh5VFl5eFpUcDRN?=
 =?utf-8?B?aWgxMzZ0WVpVcGdNNzJza1RDQ1lKMWQ1RGhyV1NLSU1yczFTdStLcUlFUXg4?=
 =?utf-8?B?bXJMSS9jMzV6U25xWjRLN1MzL0tjdWZYenNrMmNGVk1RWDh5K21aUVA5MFpX?=
 =?utf-8?B?b0hWSVp1QjJtL2RWbVVSaW14OGpKakU2WkZXMk84SVJ2ZnpsQTFOblpyZDkz?=
 =?utf-8?B?ZlFvOXM1ZWYwUEhSeWhTWDdoaGRBT1NNRTFyMkd6T0IrYWxLbTlncTdVSWZv?=
 =?utf-8?B?WDJQWE1wZ3FsRmp5Qkk0NlBaQ2ZoRzl2bnRYTzFZN0RFbUszYk1Qc2tvRmMr?=
 =?utf-8?B?TjFJdWJOZGhKazMyeFAybTB5QkliUEhkMTdPekhiMktnaWpNSU4vMW1RaFVD?=
 =?utf-8?B?ZG0ra0pCMlhmbUlHMC9KUjZ3WHB3eHpCOGdUcjM0ay9rU3pCdzFibGhOSWlu?=
 =?utf-8?B?ZnBvci94WEhwZnJReWVGMzk3M0c0SEJVY2hTKzNDckg1Z0NJcWpiOHJTNEtQ?=
 =?utf-8?B?SU5VQXNlamxjUUliUnQ4d2o5V05hNUFjR1ZvUWxndVd4bURGNGliMGszSjds?=
 =?utf-8?B?N01ncTZ0d1k0UzN1TmRKbkdxQ0Y4Qy9TbUNOaEJycHlrZWUzV2NGbGRqWWp1?=
 =?utf-8?B?QzM5K2E3M2FBaVJPV0oycU80TzZKR2loWmJ1cXBUTEFCWUVTVExNTFV1MVJo?=
 =?utf-8?B?Mkt5VHlseWoweHUwMlZkSWF2TmdlbWRmZ3Noay9YNm1xaUo3V0lNaDBpRjdM?=
 =?utf-8?B?Q2FDczNUUVhRemp1Q2puUFZTcGZGTzFyTlM2SktoMHZ1cXRhMm1MY2lYZjBp?=
 =?utf-8?B?TWVUcEMyQXpXZ1l4ZU9TZXNtZWJvejgyaVlPcXNvYS9Hc3NsTkFXQ3BQL3pF?=
 =?utf-8?B?Y2JmWTBkbnR6ZWRJeEZ1UUZkV29yd3B1bDAwY2huVHZrTEdqdml2cG9aRGRX?=
 =?utf-8?B?YWdTZ0JacWg3MUx3Z2ZiT3FGVVZabkw3RFVieElPbVlJTGRBcFVvTktUSGJG?=
 =?utf-8?B?Mm5kVUpONEZ1K1I1SnJyMEtKUnoyS1hnZTBTa2JIc0l0ayttbXhvdEhmZ2hS?=
 =?utf-8?B?T2lqcUtxU2tmdVJxc3dSY1VVVnZRcThYZjVWclcyY0JjcDdqWlpTL014YmU3?=
 =?utf-8?B?dXNxRTh0cW1BRGI4cUIzMERvMG9BOE1GNzZCekwwNWVLSG51a0loNmozV1lN?=
 =?utf-8?B?L3diOWM2VnNRR244eTVKV083UUpFdlArMmZJVkFDNGxGL1pXeTd3N204N3R0?=
 =?utf-8?B?V054SU1sVkRLbTE4OG5zV01UMEE2QUhGcnR4WnVTS21kNUdjZlM3eHN3MU5Z?=
 =?utf-8?B?T1V6UzUvNlg0ZWlHUUlHZEo1MngzQjNXelh6STZoazk2K2hFVUNOUGp1S1cz?=
 =?utf-8?B?VzdWNkxTQkEyVjI4Nkx1bEZRUDhQMVgvc1pSd2lzV2RZOGEyRnAxOS9GcjhZ?=
 =?utf-8?B?bFRmdGNLc25OU2N0UldFU01jT2RIZEl0bkhlYk5abGZBRXBYOWhmb1c1OXFX?=
 =?utf-8?B?VkRSb3dySlZodW5kem5oL0J4QUFhdnM4Y1BIbjFTYlZOblk3d3RHM01PbzlK?=
 =?utf-8?Q?7Tdx7Cj+YUhQSifWKVbfoP0=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b06bf348-a0f0-4908-4482-08ddbd4e4717
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 12:03:25.6513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+Yf8Mct/kgtTgbgFNlMFHt7axW/+75Z44RVXTwyp4WU3B92ggC05OqlBkm+dB1jJe/Dv2iKYsBr4VYFS0ZP18AKppM3/SXozVzVYdM9QQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10298

On 7/5/2025 7:01 PM, Daniel Lezcano wrote:
> Pass the base address to the macro, so we can use the macro with
> multiple instances of the timer because we deal with different base
> address. At the same time, change writes to the register to the
> existing corresponding functions.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  drivers/clocksource/timer-vf-pit.c | 35 ++++++++++++++++--------------
>  1 file changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-vf-pit.c b/drivers/clocksource/timer-vf-pit.c
> index 066d0d2600f4..9c5e06506c26 100644
> --- a/drivers/clocksource/timer-vf-pit.c
> +++ b/drivers/clocksource/timer-vf-pit.c
> @@ -16,18 +16,21 @@
>  #define PITMCR		0x00
>  #define PIT0_OFFSET	0x100
>  #define PIT_CH(n)       (PIT0_OFFSET + 0x10 * (n))
> -#define PITLDVAL	0x00
> +
>  #define PITCVAL		0x04
> -#define PITTCTRL	0x08
> -#define PITTFLG		0x0c

The registers PITLDVAL, PITCVAL, PITTCTRL, and PITTFLG refer to individual PIT channels rather than global PIT registers. Shouldn't this distinction be reflected in their naming? I would suggest prefixing them with PIT_CH_ to improve clarity and indicate their per-channel scope.

-- 
Regards,
Ghennadi
