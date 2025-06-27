Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011011.outbound.protection.outlook.com [52.101.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1DE1F0E56;
	Fri, 27 Jun 2025 06:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751004350; cv=fail; b=Q7QicU+KS7rfijf3AkjgnnDE/bOw877+KEdqZpTkdgmw8CmZUeXXm2xwIi3//TmPLxnqUBiJj24fnlQLRQt3g0ZLRFQpyNiBxx1+B+u/VazFrZ3ZiEHu6GIgh+LSEEr0+DxkCVC+7p6z4nQ55U0OZjB5LU8tPpVfpfh044ZcQjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751004350; c=relaxed/simple;
	bh=lUQGhA4w+2kuRXKoGVT7/f7cxgDACir2diva1G2Qg9Q=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LQ+DhOBKT8Y3DvhwmbyJKxg7gYAEZ64skSkiXskXT/0NHaxn4jvl4BP5In0iHNHNlPreW5JTEZoqnrokfPx8Rx+tMJry+KfEtUNC1o6pwvrFiNrPxKzZnsEi618s7QSXrojZV13XobJwZwrqgc2bMsUure1XnMvI9d/AVCoogH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HP+gxEuV; arc=fail smtp.client-ip=52.101.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HP+gxEuV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P32K1C2WqyX0VjgyL7bqL1Th6u5EENew/jwiLqmPcsnNm1kpdrEeMS4Tc7KVl8c5e/0KXMeTXuEFy4JeQM4EXAQgFyEAruodjSMaE1tdJo9brrf4E4hlggV7aggjZ5eaGKO8pjwXN9q/XOF+9rbcwEQroYc1Ou7karbK/++NeZiuVsfF7FbPkI4HvEBBx+qXlX+5ZG7mSjTmv3bOBkOm9eBsCnV4uIzW40EalzMlNfQPbXGFzTvZRouspnXPFIdojPsrqui6VvF0SjboeRYqz8XyXOvFUbdq1Kja92aO7sTtkklR6cjXEop9yoyxV4K9dLx3OOVASzXTy4UMDOHeOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAc0mc5xqX7nOhF4QFTJ8Z8B8pOYB+JzoysEb6dZRJ8=;
 b=expuTNzVIxyKvNj+Gfd1fugM3sDDFS8MqVFV6yWfv565rxYLQbqn/D39qYpeWdAASwLzBpUhuY9pvDHzdgECdDskioU/k9oKoV19ifjMecAL6C46x7o1CpGT0Cw+KQEkGPR6Dfu5SptdwThsLmEGW9xwPkJWa4qb9VscoiONeAOIDjuvpM+XQhi1WelMZVuhFEbpNBU7tO+CSv+3aBqUOVuJgwVFGQqVSqCDMrwpgv+7S9VgbpNnNNr4dykNF1Jm76/H6eoGmRNKDW6U9Xd8y8+9emgI1SUo76sA3Nv9j78zk0ixDgeqfCZMW4+Pi7GxXULXCwHX8RyJhupOHASElw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAc0mc5xqX7nOhF4QFTJ8Z8B8pOYB+JzoysEb6dZRJ8=;
 b=HP+gxEuVfm4mZSQ2ihUZ/Cpx+l4z5B7H7gAlive6xqhH3NZfYLq0rawJ6AQmHE41FCP91YTC2De99HiNAKLpv3QwmKd5WuMVomdakcy5CDg2reft+f0EjJUh90vrkHcc/UwBL/M3c/9VTOVB9TQ04GsyajVD06CE4uxG5oZw1cfthJhXOVt2VulfzjqnTtWyzmMt6UPc2J1mJslGGIs3zE9ENvVVik/Kodde/cDwzRm9wH7SfTP1F3nVNMA6XSQrvUIzyEuRh1/lCWDjFZ9O/mAeMpOCpX34G4EKRTx7xDFbbUqhamaKdC3SAySN2qvxqMhAiW+Nn7gydhkN1G5s4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Fri, 27 Jun
 2025 06:05:46 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 06:05:46 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 27 Jun 2025 14:03:45 +0800
Subject: [PATCH 2/7] firmware: arm_scmi: imx: Support discovering buildinfo
 of MISC protocol
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-sm-misc-api-v1-v1-2-2b99481fe825@nxp.com>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
In-Reply-To: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: arm-scmi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751004238; l=3614;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=lUQGhA4w+2kuRXKoGVT7/f7cxgDACir2diva1G2Qg9Q=;
 b=Hm6wlPh8YSs0i9f+MSrFUMnyFEzCstD/heapSa+xunAgdiPaL8G820HXI+JLQrd3bPSGJ9+r3
 ElTv6RWawKbAFKh96RfucxQNaSqQRyUk0vXwfHLupKftxj2uSw/ey6A
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXPR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::27) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8906:EE_
X-MS-Office365-Filtering-Correlation-Id: b9cc27aa-5e95-4a78-25f8-08ddb540a866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dU5Ma05UaFBEcms4ZUdheFE0aUR5dzhtMW9qNFZQb0JqaytycDVIT0l2MXph?=
 =?utf-8?B?c1M3UEtCbGZUdFAzVHpZc0N3Tk1QNUI5V1hYcCtYbDJSMXU5VkRqQ3p5Vkxk?=
 =?utf-8?B?aHFNMDlCbncxTmJmMTZlRG5VUU84SnlHYmQvVy9jWkxkT21wMmFoWVNiVUFN?=
 =?utf-8?B?WjY5bHo4YnVZVHEvV3RiY2JYUUthQ0Nic2E1Y0RQcnRIa3ZJblJXRVlpUVhq?=
 =?utf-8?B?SDQ2RUFvc09YMkFwY1RvcnB3M2xNVkh6emUxbzRobFpadHF0UFhtZVM4ZWVx?=
 =?utf-8?B?cFdOelFEMDVncWJaNC9va3RIVWpqc2dDVzJMeW5xOVQ4MW1ySnFXSitBOHdp?=
 =?utf-8?B?YjNCZG1TNkJtMmE1WHdjeDdCU2FsbXl6MmVUVDNlVDVBWm1jVHZvUGNDbEM4?=
 =?utf-8?B?ZWVBWTgreTR5bFBkdENGRjZsWE1qbFpGMXA4OUpodE5VMDFQbTh5MnYxMlFn?=
 =?utf-8?B?QnJyYzdocXJXNjNQS0pML1ZobGJ6bHBQQUNFbTZuNEZhQVRwd3drdVNOeXNI?=
 =?utf-8?B?OFQ4NTNINVhqRjBRSHo4OGV2OWsyc0g0M2hwcTBnQjdhTUlaNmJRSHM5cGlw?=
 =?utf-8?B?Q0Q1dzkrbjE5UGVMZzUrQ2RFV0JyVU5RTGU2Zkh6TG1YNEQrU0JWM2Z1OWQ3?=
 =?utf-8?B?NGpLSkhrSU51ajZmeUVSU1QyM1lseG9pTEYvL0NxZmRJZSsxSlBRdUdLSDc0?=
 =?utf-8?B?SVVwYlZDVjAvRTQyTmR1Nm5ucmdINW1Mdys2YWppeUsxajhQcVlFd0ZXeG91?=
 =?utf-8?B?RE9PNkZuQXEzMTJmVythZHZ4aG5UM2ZNZVhBSUtSdmk1eTZqZzY4ZWhIRkZm?=
 =?utf-8?B?MDZEYmN6NUJmNkVWL0ZiOGVUK1poeHlLendPZHk5TVBRbTYzT2ZZQ3UybG9D?=
 =?utf-8?B?czRxdUd6N0ZjU0FhM0c4c0V5L0w0TE1rejNDc2hmdXc5VXQrYys1OXloOVZE?=
 =?utf-8?B?dE1LenJRZkN2Zm1Nb1hQV1lkb3F0Q1d2OVpDazRlMEhDdUZseDY1bksrWmcy?=
 =?utf-8?B?Zm0zTEcvb0lIazFrR2JiQi9iQXBJNERnQm51RmZ6Z2w0dE1iNURmaHY5SHNt?=
 =?utf-8?B?SWxMV3B6aVQxaWNrV2ROZmdDUWN0TlloMS9BT3RYajZxUlE3cEVLL3AzSS91?=
 =?utf-8?B?NGhTR2hETjdSVjEyajlIT0ptSXpCWDZiUTQvT0tLdS8xN3lKYjdldjcrRk5B?=
 =?utf-8?B?cklxL1p1aCtKNGJJSUFqTllkN1J1QjduY1B0RUhvRkhOT1Nid2JBaENvS2M0?=
 =?utf-8?B?TUd4a0F1NVc2c2lldVVXSFhxSXZlTmt3OGhtalB1M1RZODJkZDFMMlFrM21t?=
 =?utf-8?B?OVpXUFFWZ3VkaDdUVUNYUnZ6REt6bk9uc3EyTXExd3RCT1dXQkUyRGkzQXRa?=
 =?utf-8?B?MjgzUHY3VzR4cXVJdzJhMC8zOTR3VlNyYkY1Y2JsR2hEZUxQRkM2NWkyMkxn?=
 =?utf-8?B?VjdXRzJ4OGxaQkkweEJZZ2lHbWp0M1c5enNkOVJkYnQzVjNFL0ZpZDZYZkVJ?=
 =?utf-8?B?cnBraE1LaTdVKzJORWxiSFh4TXNhUmZiWk4rSnJGOGp0My85RndFNUJvZFhR?=
 =?utf-8?B?UHM5YU12LzFFMlBiaGhxRGlLZEJSSGNFYml3ajZyOHdlS0lzeS9vYkVCY2VQ?=
 =?utf-8?B?SzNReE1WSGZwY01SUEhETlU1RUgvVXNiSzl2NFBTSkthc2lGMmpnUzhPVURu?=
 =?utf-8?B?WE9odzYrRGtSekRZWCtUYXl3SEtaa1ZsU3pkd0NqNFI0bWxoWXo0TFM5VTV0?=
 =?utf-8?B?YnF5R2FrUGdrQkVXYW1qMGdqQzJIOWEySjN4VHBMZHgzSlNRSWoyNWR5bVhT?=
 =?utf-8?B?a0JqRmZhZVppc3c3TXhwVHhFZVdJODdLanpPbjZ3OW9iRjlKdG1GRmdtdVVS?=
 =?utf-8?B?cVpwT2RyaUd2Vm4xUkwyZENnaVdUU1JNdHdveDExVWQvMUdxd25oMzUrZ052?=
 =?utf-8?B?WlYxTTZiZG9STmo3Mi9jaFZ2Mk5qZ0phT09SbWR4elZDKzhJYVBlWTBGaDJB?=
 =?utf-8?B?S3hpN1FFSDZBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlpXSkdQZjFrdG1wcnI5YndRVjFWbjZGS1FOSFJYaEJRMXVuV1lBOGs5V21O?=
 =?utf-8?B?S0pwL1E3UWpOYmZUTldDZ3MyeWZlREI4ejh2dFFSYmM4eWk0UFR1V1hQVUFJ?=
 =?utf-8?B?eEZNUG9QNU9CaDQrc3l3bTNtTExDdHB3RHpPenVMWlFKbHVGMDlSbmlEVDdC?=
 =?utf-8?B?UTFzUmFkb1BrajNHOFhwOTI0eVE2VkhaMmZvNDcyOVVQSUZORnRSbkVERjJ3?=
 =?utf-8?B?ODJoaTBodGVVcnBlejlaMk8xSXFSYWlJTzRVeVpvV3llSnhoVUY5V1RITEx5?=
 =?utf-8?B?OGhINGVDd1NLTGlXb2RZVjEzVlhDejg4YlpOVTZtM2xOZzNOUVpBbFpROW9K?=
 =?utf-8?B?bkhBS29EWkoxU3pvZXNyY2haRlcveDhuMkpuOFkxbXVBZ2laY1hjd3RmczdR?=
 =?utf-8?B?b1AzQmdRalFiMkprSk90WjFHNmdSRG9WQWs4dVRoQUNZZ3NOZWxQdjVVTDRC?=
 =?utf-8?B?K3BwaEdLUTNYc2U4TllEcU1XUFhPTUJ1djgvdXZ6Vm52MVhHUXNjU2pITmRV?=
 =?utf-8?B?SFJyeW92eVM5R09UN1ZDTVd1L3NPNnA4eTNqa1dnaVBFbkMzWmxUeS9vYi9j?=
 =?utf-8?B?aXY0Sk1WaEhpYm9mdnRhQlF3RUpUZHpaYVpNZEtxeEJMS1hZTEhkL25Tb1l4?=
 =?utf-8?B?dUVKRTJndFIwK09KbXhkakRTbFlmMnd1R05TcjNFZGRuc21kOWNiQm1QQ0Yz?=
 =?utf-8?B?QkNMRS9BeFpWeDh0S1lsdzE5R3RFZkE0UEFQSFhldFdRQ2VGTTZQZStCWUc1?=
 =?utf-8?B?bWJMcUxrQ1gwVXJHc3dQRFd1L3g1aVlieDh1VFVFamxScWl3YlduTWxlaUhF?=
 =?utf-8?B?N2FGVGVncTljd2hrM1dnZ2I0T2VZNitzUnM5Wko0b0t0ME1jMFFRNlJhQ0Fi?=
 =?utf-8?B?SVdld1NabGZNUCtXU0VPTTVwM1QzQlorb09SaVZ5bVY1KzdVOStNYnRqNjdj?=
 =?utf-8?B?ZHNnRmRDNE1nTUhOclNvd0FGRjV0WVhrdWoxaUNPZTlna3VPS2RVTmhkQTNw?=
 =?utf-8?B?dkY2bUE4WGN4VndiOUxNWnk4SXoyeWtrL3l1ZjN5TWVQeGUrNWJCYXJuWXAw?=
 =?utf-8?B?WG4xU0dWNFBLUEFaUTZ3Lzd5WUo5ZjE1bHIxcUVNVFNnTVg1OElYL0VqNDhB?=
 =?utf-8?B?c3BTMGRhWnAvTzE2VlFqZTFxWDZURldiY3BBUksrbWVJdFNQcDZhaHpjYlNn?=
 =?utf-8?B?dXJoOGtSUXRxTWhJMDNDd2VIWmpXV1JJQ1BGeEFsSEozbXFZRUhnWDIxUnpn?=
 =?utf-8?B?bWtzRVZ0ZzluNktTa0pFYW9uRGZIL29GeThwRXpTRFcrSjlBd29pTS8wclBD?=
 =?utf-8?B?Q2NFTXpjWi9jZ21NaURlSmRkaEcvaXNvR0JNOXlqOTdUVE0yNUs5ZnZTckJY?=
 =?utf-8?B?dktLREQ5c0pETVQ4ZFhVYWZqc2hPQ1lkSlZyTGJ0RHU3Q0NRZXovTkhkWFVI?=
 =?utf-8?B?WXBQd0NrMnEzMHJoYnZXYVh4Z002K1VQTk5Cd2FPdm5Ic3NZcEpPUjZXUEhP?=
 =?utf-8?B?UERsRS9aem5EN3JnWE0wdElscS9saGhqU2Zyd2tRNzJPNTY2V0lCOEliSHdi?=
 =?utf-8?B?SUR6ZUp0OWYvUlRxaWs0ZlFoazJ0U3hIeW5CemZYRFg2dThsQ01FbTJ1Yk9E?=
 =?utf-8?B?ZlhWOVRoUlNhc1BjWjA5SUp6TjZmVHVwaVg1K1ZBVjdpKzh4WWo3KzlDdVJv?=
 =?utf-8?B?M3VJR3pUQjRhd0JXQzU1THBzY0VxVmo3d3oxVTd6clNtTXM4NGNhd29xSE0v?=
 =?utf-8?B?VXI5NmxCZHZ5L1FQNUdBMTlnMDhZbEdQMXRZWWJTU3J5Y0JmUWt1dnpwczB2?=
 =?utf-8?B?a0s2b0hLRWJEQmJSVk8rdmQvOTFCTjlTVFE3QVN6RjJzU01kcHBKemJOOEhs?=
 =?utf-8?B?WUtqTzVOOU1VUEJwMUxaeUlJNGthd1B0ek1WS1pmY3cwY20zajVuRWhhNGJ3?=
 =?utf-8?B?eHNMNnZ1WEF1U1ZGOGlady9jc2tLUHhrdXE2OExVM0tmOU1qWlQyZFRBVGxQ?=
 =?utf-8?B?ekJheFFZL2lscnVkSkphcW1MY0w4dGpPaUk1Ykg2WjkzZytlSU9YSlZFcEVR?=
 =?utf-8?B?a0wyK1ZLL3MrbUlOSW1OVFI4SmNvcGZGQW9RVXpNbWJPblJOQ25nK084eE5K?=
 =?utf-8?Q?/+YJrYN/g9OrJCM0r28Nmh1G0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9cc27aa-5e95-4a78-25f8-08ddb540a866
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 06:05:46.5299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sWQBFk4WpfkIwlxoou0TqaMJHfj9sedeinjhoWTDeqFV/2yYfjxErqbZPT4IUDeNaOUWhTGivRAalTcNqbj/wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8906

MISC protocol supports discovering the System Manager(SM) build
information including build commit, build time and etc. Add the API
for user to retrieve the information from SM.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 35 ++++++++++++++++++++++
 include/linux/scmi_imx_protocol.h                  | 12 ++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
index a8915d3b4df518719d56bfff38922625ad9b70f6..1b24d070c6f4856b92f515fcdba5836fd6498ce6 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
@@ -25,6 +25,7 @@
 enum scmi_imx_misc_protocol_cmd {
 	SCMI_IMX_MISC_CTRL_SET	= 0x3,
 	SCMI_IMX_MISC_CTRL_GET	= 0x4,
+	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
 	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
 };
 
@@ -65,6 +66,13 @@ struct scmi_imx_misc_ctrl_get_out {
 	__le32 val[];
 };
 
+struct scmi_imx_misc_buildinfo_out {
+	__le32 buildnum;
+	__le32 buildcommit;
+	u8 builddate[MISC_MAX_BUILDDATE];
+	u8 buildtime[MISC_MAX_BUILDTIME];
+};
+
 static int scmi_imx_misc_attributes_get(const struct scmi_protocol_handle *ph,
 					struct scmi_imx_misc_info *mi)
 {
@@ -272,10 +280,37 @@ static int scmi_imx_misc_ctrl_set(const struct scmi_protocol_handle *ph,
 	return ret;
 }
 
+static int scmi_imx_discover_build_info(const struct scmi_protocol_handle *ph,
+					struct scmi_imx_misc_system_info *info)
+{
+	struct scmi_imx_misc_buildinfo_out *out;
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_DISCOVER_BUILDINFO, 0,
+				      sizeof(*out), &t);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		out = t->rx.buf;
+		info->buildnum = le32_to_cpu(out->buildnum);
+		info->buildcommit = le32_to_cpu(out->buildcommit);
+		strscpy(info->date, out->builddate, MISC_MAX_BUILDDATE);
+		strscpy(info->time, out->buildtime, MISC_MAX_BUILDTIME);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
 static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
 	.misc_ctrl_set = scmi_imx_misc_ctrl_set,
 	.misc_ctrl_get = scmi_imx_misc_ctrl_get,
 	.misc_ctrl_req_notify = scmi_imx_misc_ctrl_notify,
+	.misc_discover_build_info = scmi_imx_discover_build_info,
 };
 
 static int scmi_imx_misc_protocol_init(const struct scmi_protocol_handle *ph)
diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
index 27bd372cbfb142b6acb0b1cf4b82f061529d0d45..826402dfe6f4d3b9e6d2e93868d6699f989e9bcc 100644
--- a/include/linux/scmi_imx_protocol.h
+++ b/include/linux/scmi_imx_protocol.h
@@ -52,6 +52,16 @@ struct scmi_imx_misc_ctrl_notify_report {
 	unsigned int		flags;
 };
 
+#define MISC_MAX_BUILDDATE	16
+#define MISC_MAX_BUILDTIME	16
+
+struct scmi_imx_misc_system_info {
+	u32 buildnum;
+	u32 buildcommit;
+	u8 date[MISC_MAX_BUILDDATE];
+	u8 time[MISC_MAX_BUILDTIME];
+};
+
 struct scmi_imx_misc_proto_ops {
 	int (*misc_ctrl_set)(const struct scmi_protocol_handle *ph, u32 id,
 			     u32 num, u32 *val);
@@ -59,6 +69,8 @@ struct scmi_imx_misc_proto_ops {
 			     u32 *num, u32 *val);
 	int (*misc_ctrl_req_notify)(const struct scmi_protocol_handle *ph,
 				    u32 ctrl_id, u32 evt_id, u32 flags);
+	int (*misc_discover_build_info)(const struct scmi_protocol_handle *ph,
+					struct scmi_imx_misc_system_info *info);
 };
 
 /* See LMM_ATTRIBUTES in imx95.rst */

-- 
2.37.1

