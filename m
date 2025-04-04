Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011010.outbound.protection.outlook.com [52.101.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EDD1993B7;
	Fri,  4 Apr 2025 08:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743755821; cv=fail; b=mAPIF15TLkbPuxuz7pbgrMK3x9uyaTGxCs1JAgW5JMYNsslvf2Q5j3opnG+ASTgbfw+cozGbW49lQ7MrpbCWPMe9dH1xTI8u/wQP7eRtFRf9waaHUQQf2IQNM0u7ZyNN7Q94B7iAoxK9HQqyc6zjulp8CxjLfvtJv70OL1Pi9gI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743755821; c=relaxed/simple;
	bh=5+Xy5oJy6lrE5tDcwv2ho7KNjExl3HxE+AqU2RjTDVM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lKJqVYc3lw9viE22DeiQlaPwnLihVG9YGMN4lyFnjALBTQBvfe0F/ZsQjc4KtMw3pr/v7DayLOvZgTTXVuWGJhwi1Dl/l5HiswrJ72+Q3UIut6WidYW2eLSf5gcSJkYQdjX1QLKgzMp1255XiCbvfVP+Ixysq5KC0vrkdYwjpLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZHL4e3bs; arc=fail smtp.client-ip=52.101.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZHL4e3bs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eag2qwEZ8S5kk4jXDJ3HSc9eTn4/8ytw2VHiPT/OJJ7UPIYU4FM777Qc/5hvAEyXbuLuY324JRswEGTVy0BYlD3UhFIYt+ubyCDB++1dVUOhpnkkJIcBP+5xGWlYd/7W2XSIkzd3C7/WVCP613sezxarP3nCwelw5Ef3T1vgRQirIpnzYiOJIqABU6HGjwSXmB5ACDpnZpUEJbX4w85WI+kXCAgKTE6gI+zThaHlKq4cbZJc58C84LbDk2PyP2xEuSSMJMof1zaaHDGLLXNpnyBr+2NDWRgoVtQ3j66p9YSqXCINFN+d258JKX6IR2rg3h/p53ef3MYNI7+dLEjjMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17tZ0BT+5+D0Dm/4M+W9kPl0q+h4yGg/LctL4Y/bf2k=;
 b=lhLfXLrsnR0nucocB14G3KZj9FfQKsOmFfk69YMPdrd/sAgS4NaAJTyDv2mafOqOajaCjfFZrU6MB6ifcNi7g76GNxAGakIAtTYNFexRbUmKQOoW942OWYJE8lXD4XvtiJw4l7Li3AcyLolDiE5I9LUKXjY6HE2ybWx+ZV4BPX5xRbuuZvKW7TQF0BzcGMLW/si012O9CRHSfPyf4vErQC/NPbV0A3jsEcErlOTBKl0BjApP9XG+Gx/NzyMzvOd70iTORzerJh2H70xkUuLl2oUw5pKYqa3p6hoXBRrkyQctlmy8yQZe/JvhzFJKRqrrJ9J+ggPywaZUmHu3rQqAHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17tZ0BT+5+D0Dm/4M+W9kPl0q+h4yGg/LctL4Y/bf2k=;
 b=ZHL4e3bsA+Jdve0kANEgkseL8Dro9A3r4RUBiSaAiTFZQW2F7a3VdYx3PWfg0uUvN1un6gXb8zYepRl618KrzfURpB0K7/ouo+huUfsNkw0WorNwT3RuBruhVLh/hR9mjbRG5yikvQco2pXvy4EkeeCjn7afC4l9/5DZhZJ4DW4i4FzEeM/v9otRpMw59aQQDxkTC1U7QX9h19WXiOqZk3eejMr6am0ul76wd51nsxGPLIhW5JS3GNuKRGiH81pA8NKA6USQmdHrqIxRWtZyT0P1cYduHKdUXtyz2dMSYgqd/x5C2TD8wyiZdpXImF2wQZvvUWiquoBZ+vNrQLUAEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PA1PR04MB10359.eurprd04.prod.outlook.com (2603:10a6:102:449::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 08:36:56 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8534.043; Fri, 4 Apr 2025
 08:36:55 +0000
Message-ID: <1d7318bf-9971-41aa-a952-85367f001c9c@oss.nxp.com>
Date: Fri, 4 Apr 2025 11:36:51 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (ina2xx) make regulator 'vs' support optional
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, NXP S32 Linux <s32@nxp.com>,
 imx@lists.linux.dev, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>,
 Eric Chanudet <echanude@redhat.com>, Florin Buica <florin.buica@nxp.com>
References: <20250403101516.3047802-1-ciprianmarian.costea@oss.nxp.com>
 <dab2f459-240f-4e4c-9bf6-8c0285354cfb@roeck-us.net>
 <4efff19d-b5e6-49b5-9a15-e4af622c6ebf@oss.nxp.com>
 <2a12e6be-c253-4542-86a0-aacb71671ed6@roeck-us.net>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <2a12e6be-c253-4542-86a0-aacb71671ed6@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0066.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::19) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PA1PR04MB10359:EE_
X-MS-Office365-Filtering-Correlation-Id: ee46e594-553c-469e-d7f7-08dd7353db47
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y25VYjNLSjdGdGc2OUZJNndJYzUzcmMzdHczME91VEYyNFU1TmlJd3djbXFy?=
 =?utf-8?B?QkZQSnJVZmZrWmxhQi9CcUdlTm16YWUzNjlOTFl5Q2VZTysvc3c5eVZ6b3Qy?=
 =?utf-8?B?NjAvakRjU3diT2NKdlFBbUtWWWZHV0VaZFEvWG5KekE3U3V2VEsyeU10UXBV?=
 =?utf-8?B?RVZJdXJ6aUx5eE9PUUhuNzYxR0MwUVBLSGQ4Y05CN1ROZjZMUmoxQUl5Mitq?=
 =?utf-8?B?MmF0TGVvRFRrYlJiSjQwSHBxQVJIRENZc2dJYjl3alVjZXZsT1dGY1ZmS1pw?=
 =?utf-8?B?WXduMlJOR3Q3QmlHalQ2WWJLbjIzRm4xRENpTnd1ZHppSy8xNEdDRFJLTHZq?=
 =?utf-8?B?d3NuQm9IcGorci9NRnBFRld2MFRJT01yNFNXWFg5RDFKcnBFZnRsbXJGNk1P?=
 =?utf-8?B?LzFlemV5OXMxN3NpK1R1V3dPNGhjbTR6QlExcytDQ21qQWREYlZaSXNQSDd3?=
 =?utf-8?B?WXBSK1lPOTlvc0QxL2QrRVFMYUZ5Q2pCUDM4V3dpNWVLNVFCOHJMN2Z2eGFq?=
 =?utf-8?B?ZTZYQWhvVzl2WmZDUFFrWVFVQ2JNWDZqMG9nZ3dLWFRiUG5SYkw3WmYyazRY?=
 =?utf-8?B?N0hmV056T3RNNFVaK2ZoWTc3VTRlYWFuaGRMWVFEd2NWZ1Rycjh2bTkrTnZh?=
 =?utf-8?B?V0tFUm1XWEwxM2lsWU9TL2EyOVlDaWFKSm8vYU1QRDIyMFNGTzRXWHhSb2dI?=
 =?utf-8?B?UXlaSklVSkF6a1F1QWxQa3F0L05TalpiVERlV2pvQmZTV3ovTElrK2ZNOU9V?=
 =?utf-8?B?SmplVnVUWmllQzZSVVpSV1k4VnRDamNJamVxSExYdzY4K01GTlRtNG9DVG5l?=
 =?utf-8?B?cGxhVm9mMjR4RXF0QS9iNEY1ZXQxTG5ZR0JYNE56ZGoyWmEvTHJ5K0s1Ylly?=
 =?utf-8?B?ZnhzNFlYaDlTMlgrb1d1MXRaRlFwYWJ4aEk1ZDZOQmFqQUVmZGlJRU4wc0NB?=
 =?utf-8?B?aHkvTU9zOE1qcUV5N1FYTkpzU3FwSVA1V0dBYkFDUE9yUmxaY2hkU1RPNngz?=
 =?utf-8?B?VlF1WUVYNmJhaXNCM1BoVyt2Z2ZsVzk1WkltSEVMUmVEdGJ0OGFHY29YaU0v?=
 =?utf-8?B?T29CZitFWkpKWmpYL21MRWRHa1pOSGlIdkhhRW1Uc2h6ekFkNlltTTJONXdp?=
 =?utf-8?B?ZDgwV2JldHdseVE2Q1duckMrdmlGdDlpM3JyQjlvaGdCMXdlWGllYzNaUk4x?=
 =?utf-8?B?MWhDYWUwL0E1aUJDUkoyeGp5SlFRMGUrUGhFRlBqT1NXVUdNRlhOdVh1SzYr?=
 =?utf-8?B?Q3Z4Rzd2ekZsYjI4MUZxQXU2dExLajdZZFB3dy8ycDd1dnUwcWdqeGRjTFFl?=
 =?utf-8?B?RlBsNzhNcGFIUm55SnZ0SGhoMHl4MWZrdlkzMmRDcy9leUExZGZZdy9ZV0Nx?=
 =?utf-8?B?ZThDMnFLaDJIOEdHbVZYVGZpQktyZFk0bGFPTk1jTU10aVNJSlZ5VVZiOERE?=
 =?utf-8?B?dzFzSjZYZm9QblhCVE9nU0pINjdEa3VWbkZLeEdXUEF3ZnV6RmRPZk5YdVd4?=
 =?utf-8?B?RDBjMzlRSnB5Tk0yWjlkdngwYWZpT0lmeHhKNzVMWlROSDA5YWxjejcvQWtZ?=
 =?utf-8?B?ZVdvSDhIQmpMQXRZd0FCZG5LcE1PYjlTZFVMSXRKSGdIK3MwYThyRDN2ZmFR?=
 =?utf-8?B?QkZOaFFLVlYzdU5zS1Nqa1J4ODJMT3F5S0tML2hLNkt4VVN0cGtsL0xzNDJD?=
 =?utf-8?B?RnRkbmFKOHNWcVg2NWgvZXdaZ08vUGwyNTBWY0R3UGpEMm5TWEgwcTFDRVRB?=
 =?utf-8?B?L0FueXhoY1doMjBpMXppaTgxN3hRWForY0R4eGRBbVQ1a3N3b25ad0ZRZFRE?=
 =?utf-8?B?L2Fnc3pESGZLVXlPWGVBakJEcVBBZXB5Ni9OQ3JVZnYvcEZTQlRzbk9sYWxN?=
 =?utf-8?Q?S56+o44tVG0Wy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y29YS3RwV0dQNXdMZmxVbmNhdzVJVmFMb21Zc2M3cEpvOENOZ3dBY1pZZjZv?=
 =?utf-8?B?TXF0UjhLZ1hZc1hrTEx4Yzk5VWNsc201NktPUmdtUHVaUUlnV3NDTmR1K0Jz?=
 =?utf-8?B?b2p0cTBNZnBxTFl3K0Exck5reFlTVjFvcU1Nc21QU0k3MHh3VGo1SUxWSGRH?=
 =?utf-8?B?RjgwUDluVHVFNDRoUkxQakRsL3NGRklOR084NFNkNWx5anVOVmsxSlRXZU5C?=
 =?utf-8?B?ZzJ2TlhxK1NBbEt3YmQwOFlsR042ZmRucC8yY3Zmb1JpUEhLYmxQZC90cndH?=
 =?utf-8?B?dnBZNHRaZFhseVg5TW5aNnBEeExOdk4rSWpzaDJsaWRwS05XWkNJYS9EN04x?=
 =?utf-8?B?YUJ4ZTFLVGZqRTdCeWFGdHBHcEk1cXgrLy9RNXlhQjJaa2YwTnhjdC9hQ2J2?=
 =?utf-8?B?Tk0rOGxOK3JlMm54ZnBaWDRiTFNtRkhwR2NBSW9sT3ZTK3dzVDFtVmMrTTlt?=
 =?utf-8?B?ZlQ4b1Z5czVoL3pCdUN6Njk2VS82Q1lQV25jdGxwL2lHQ3VzTXpibUc3ODIx?=
 =?utf-8?B?bjYxTmJqUDlHek5hb2VGanRaMTYzMlNUR0V3YTlKSko1bStwLzF3eTRFUHFl?=
 =?utf-8?B?QkxkcE41MUFYNmd4YzJ2TVVwODYzbTVSZUJkWFROK21vNzc1Um5KYWJ5QWE4?=
 =?utf-8?B?cENRTHdiRXRRanFYUnBJeXQvaVJ0U2sxQXBVUVhYNXpWVFU1TFZ6Qk5xY2RI?=
 =?utf-8?B?WEFxSU4zeFFMNDh1RTlXTEJQZklwWjJ3MTVkTm5vbERUV3NTbm5yaFRMYWUr?=
 =?utf-8?B?eGZqRS90N0hwQ2lHWG9FTEVtZkhFTWpvRktnSEZOYkZzY205WFYrSllvakYz?=
 =?utf-8?B?cm9YaWIwOW04blgvbFFNUkJjQ1g0dWVYbnVVSXA1WWpJTDJCNGwyc2dTblYv?=
 =?utf-8?B?QlBUN1VBQmtyR3hnR0Fzb1BEa2JHQ2h1VE1aQ05la0JtMjQ2Z3dvSUhhYkNv?=
 =?utf-8?B?SHdJZ1hSV0VaZUtQZ2E5c1lWZCtqNWprUzcvbDJGQ29hYmlzRndLT2FrVzFS?=
 =?utf-8?B?VCtLTTRFZ3NTMUl1eTNydk5VMkc0MEJMMmVIeTk5aU9WSVNibGtGeGhaVnFB?=
 =?utf-8?B?OHgxVU5obVZWTkc4QzE5alFwd2lnZzdGSTBYckNNUTBvemdUNDFwYkhXTjJr?=
 =?utf-8?B?OUdTVHMyei8xWkZsZHJDakE2RFZyL0duaXVjSW4xT2t1N3A5OTdPMVlMR3RG?=
 =?utf-8?B?OTQyRkdHN01Fc2dhTGwvd2l4V1M5MVduSWxjYkdpUVFxRENxcE1aOUFYWjRk?=
 =?utf-8?B?djdQY2diYy95RE5HQlVNSGJ1YWhDaWFuaEZKUHI5WlFSWFZEM0k5QTJEalQ2?=
 =?utf-8?B?TkdaUlVwY1V1WXQ4U2VQb1JPbDcyTUNVeDk2ZFBNSUpjMi9WSU15WWtKaXdx?=
 =?utf-8?B?bEFUeUJRMjN5NXkyUUNNWS9FajErdnJ1WGJNMTA0U2ExR3JQeUduUEZmZmhK?=
 =?utf-8?B?Nk9XZ0pvK2YyTWZUcGliNlRaUExkVHNsNThtbU1RbkJkWkZRcEV6WE1WTmhB?=
 =?utf-8?B?cnEwZS9jekt5L25WM3JTbm1yQ21rZk94U1Q5MEV0L1RDeEpiSTliMDE3Mlc2?=
 =?utf-8?B?U29xank1bGFYaks4aGtQSkFUMDZUU2JKZ0lON0NuRUdrU0NpQloyTk5GeEM4?=
 =?utf-8?B?NlBqT1NrRW1wTVF4cDdvR09rbW9QaVMyS21tM1JLVm5vd0U3YWlSamoxL3NE?=
 =?utf-8?B?YmYyUWQ0QjBRdStQSC9wSGVRWWFIYkJIMTd6cDBrQzBCU1RGRTE4WlA1Njdl?=
 =?utf-8?B?QTRkOUJMVVBJWm9QRjc3TFF2Vk5VMlNQRzdqOHp1dnhaVW45K0tCdkNSUktr?=
 =?utf-8?B?ajhNWG4rdTVVMTJwNXFMaWlTNlNtYmlxWjlEdzRYQnVkTEJMNWM5bVVHMUV0?=
 =?utf-8?B?WVQ4RjJTV0Q0ZnFXdkIwTG5qcE5rYjltenFWRzBjNE1raDd1dDhTRWRrUHI2?=
 =?utf-8?B?cHc3QTVaamlVdG9WOEtMcHd4czFiYnBFSHZpamhtUzd5d1ZCdUgrSVpyaDJM?=
 =?utf-8?B?aFJpZXY5cnpBcEdWeVNZR3VhZDlka3QzWXVBVjR1T09CcDdWa2ZjUTNmTWdW?=
 =?utf-8?B?bDV1bjhDU3A5TmhRMnhyZnA4V1ZEc3NyT3ZYVHNxb2tWRHlrem9DY0MvbnJh?=
 =?utf-8?B?dzlkRnJ0M3ZjYnppOTYxR1BSa2JOdXhPWWYxUGw5ZlM1Lzh5d0IrUmI1SWVl?=
 =?utf-8?Q?RTpq8T+wi/r+kGA6SW7IRD0=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee46e594-553c-469e-d7f7-08dd7353db47
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 08:36:55.8398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Ol4rMXFNCOtd2fxs+B1qQwLbMNMtLGAKFfHVgCEDh0LZBd/2cE+U15OCd4fGOBlhqVLIYIeNSkqF+yLzbkJvmYmU5vtBv+IhqIgIQqs/hw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10359

On 4/3/2025 7:06 PM, Guenter Roeck wrote:
> On Thu, Apr 03, 2025 at 05:29:26PM +0300, Ciprian Marian Costea wrote:
>> On 4/3/2025 3:15 PM, Guenter Roeck wrote:
>>> On 4/3/25 03:15, Ciprian Costea wrote:
>>>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>>>
>>>> S32G2/S32G3 based boards which integrate the ina231 sensor do not have a
>>>> dedicated voltage regulator.
>>>>
>>>> Co-developed-by: Florin Buica <florin.buica@nxp.com>
>>>> Signed-off-by: Florin Buica <florin.buica@nxp.com>
>>>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>>> ---
>>>>    drivers/hwmon/ina2xx.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
>>>> index 345fe7db9de9..ab4972f94a8c 100644
>>>> --- a/drivers/hwmon/ina2xx.c
>>>> +++ b/drivers/hwmon/ina2xx.c
>>>> @@ -959,8 +959,8 @@ static int ina2xx_probe(struct i2c_client *client)
>>>>            return PTR_ERR(data->regmap);
>>>>        }
>>>> -    ret = (dev, "vs");
>>>> -    if (ret)
>>>> +    ret = devm_regulator_get_enable_optional(dev, "vs");
>>>
>>> devm_regulator_get_enable() should provide a dummy regulator if there is
>>> no explicit regulator. Why does this not work ?
>>>
>>>> +    if (ret < 0 && ret != -ENODEV)
>>>
>>> Why this added check ?
>>>
>>> I know it used to be necessary if regulator support is disabled,
>>> but that is no longer the case.
>>>
>>> Guenter
>>>
>>
>> Hello Guenter,
>>
>> I've just tested and devm_regulator_get_enable() does work as you've
>> described, providing a dummy regulator.
>>
>> But, according to the 'ti,ina2xx' binding [1] I see that the `vs-supply`
>> property is not required. Hence wouldn't it be correct for `vs-supply` to be
>> optional ? Using 'devm_regulator_get_enable_optional()'
>>
> Yes, but the reasoning you provided is different and suggested that the
> current code would not work. Since that is not the case, the change would
> be purely cosmetic. Also, I still don't see why the -ENODEV check would be
> necessary.
> 
> Guenter

For boards such as S32G274A-EVB, S32G274A-RDB2 and S32G399A-RDB3 which 
do not have a voltage regulator, 'devm_regulator_get_enable_optional()' 
would return error value -19 (-ENODEV). Also, other usages from the 
Linux Kernel seem to perform the same error check when using 
'devm_regulator_get_enable_optional()' [1], [2] and [3].

This patch would help in S32G2 and S32G3 to not print an unnecessary 
kernel log warning hinting usage of a dummy regulator when such a 
regulator is not required according to the binding.

Would you like me to send a V2 with the commit title updated as follows ?

"
hwmon: (ina2xx) make regulator 'vs' support optional

According to the 'ti,ina2xx' binding, the 'vs-supply' property is 
optional. Furthermore, S32G2/S32G3 based boards which integrate the 
ina231 sensor do not have a dedicated voltage regulator. Thus, making 
regulator support optional would help in avoiding any unnecessary kernel 
log warnings during boot.
"

[1] 
https://elixir.bootlin.com/linux/v6.13.7/source/drivers/iio/adc/ad7625.c#L524-L525
[2] 
https://elixir.bootlin.com/linux/v6.13.7/source/drivers/pci/controller/pcie-rcar-host.c#L982-L983
[3] 
https://elixir.bootlin.com/linux/v6.13.7/source/drivers/iio/adc/ad7944.c#L514-L515

Regards,
Ciprian

