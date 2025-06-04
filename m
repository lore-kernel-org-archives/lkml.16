Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021117.outbound.protection.outlook.com [52.101.65.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DEC1EDA04;
	Wed,  4 Jun 2025 08:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749027534; cv=fail; b=lYAkgqo6g473LBQjF86O4epDktBkz+9Uf1C47kdXmTMaDBboAFGG8SvLxMMat8C+4U81CLKX/mON69gNZyTQIaa7MNIactYHkxHFJztNXxUxi94v/9dvoW/pxzXkMz50MBUBViWWhXbz9/gnM6ObhRBGR5ObQ6XxpCryW41b5tI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749027534; c=relaxed/simple;
	bh=6QgzJfS3yoMvWzpAZopNiSX4c1llHMCxcVWXHQ+XGt8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=km6gMCAQtETaWHUp6PvilN3ncpH9G8OsVVEGD1kRU9aXdCisfj+aM+GhJHvrQ8Y88EEy2pOQvmU899BVKwoIZlZ/NJgLzqAFNKJ/bGVx9bg+B2F5LrIFNU/dY/BMr7yRCKInjZdyIaVjND07FKurxp3hz6QR2qzUzoZVqF+McQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com; spf=pass smtp.mailfrom=prodrive-technologies.com; dkim=pass (1024-bit key) header.d=prodrive-technologies.com header.i=@prodrive-technologies.com header.b=T4E0U5s9; arc=fail smtp.client-ip=52.101.65.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=prodrive-technologies.com header.i=@prodrive-technologies.com header.b="T4E0U5s9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfW5A2VOP/dcFo4V0o3785YhUxCCdkmDNY+iKWE/gR6y4Lmx7jrWYR8Nt92skllZp2GR5YlU0saiXPejFCn9lgX2U4yTbcTHTboexFX6RBKEBNln8Y+CD4+JOkKJnd2kTtX1dsIyHmF1YeElcZWoTeKM5mMBV5c4AYc3qIIIqFXjrX4BpVLWU+v9B9aAEICp9X3W5ywHo7UcvHGFCqjrjJlbWl/jlgIoTtc8oWmn0dFFlZnjxClpe5zbU3DVzqHj/NSw3AVN4ZnXm239DgWpjeePBucVvyv0mE+SivV0GtGniB8XT9bgWWsdZ472MrEVe1OTGqgSjG0Zs9qrfCDafg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/vOjvSONNgXu3mdGQd0qlUcsKlul/lLzXd5QKYbmpU=;
 b=xCMScpjC+vpNd4TpvW6FzGj7d0aGuEr9M+uSQOEykyLg6HEVMw853AovEzhIdiLyXHgf3JL/8x6QbgIilmX2wJCBupNmUFp4qXqy9ky2o672G5ijRFFL0FJAl+Zqqs2iJc/8rpcnhHxEOlH4xSHsLvdckGm7ZW46YWWl/S7HWFB23ZYA4ts+PQmvz803SNEaDRf1WqnqrzVmsc2ZqxqGTBMDBA8yIFbnivK6jxxAz+XqbNik+RNTqGeEqgyAOuDKjl6y4huX87X2y7Yz+VeQ+QY+xfWEzrgeA8R1YJ2gk2hVoFZ3MpnY1QKZW0Mmh/6qI2ALn6v9zxAvL4do8fiAgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=prodrive-technologies.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/vOjvSONNgXu3mdGQd0qlUcsKlul/lLzXd5QKYbmpU=;
 b=T4E0U5s9CbKoIBr7G31/SCefZQG03n2bwirFtAMb63VwDNr6QLaeOuD1L9Kiw/hBBthbMWH+7QvDmJUpdafP5zogux1hJfVypGGao0iqI5qwePhy3/hAU1jtCIIJOjEHbFZ3qMzfpNbEtnGbT6U46LDLEIknJAR5qc7CKt/app4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prodrive-technologies.com;
Received: from AS8PR02MB9532.eurprd02.prod.outlook.com (2603:10a6:20b:5a8::17)
 by PAVPR02MB9428.eurprd02.prod.outlook.com (2603:10a6:102:306::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Wed, 4 Jun
 2025 08:58:43 +0000
Received: from AS8PR02MB9532.eurprd02.prod.outlook.com
 ([fe80::4636:d263:14f1:bced]) by AS8PR02MB9532.eurprd02.prod.outlook.com
 ([fe80::4636:d263:14f1:bced%4]) with mapi id 15.20.8792.026; Wed, 4 Jun 2025
 08:58:42 +0000
Message-ID: <194f6c85-ad28-4217-b014-54bc64c6a9ca@prodrive-technologies.com>
Date: Wed, 4 Jun 2025 10:58:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: regulator: add pca9450: Add
 regulator-allowed-modes
To: Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Robin Gong <yibin.gong@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250525071823.819342-1-martijn.de.gouw@prodrive-technologies.com>
 <aced65a2-937e-494d-a3bd-aa9b295f73b7@prodrive-technologies.com>
 <5ea091c6-7e78-4945-81b4-9b5c427d2e4d@kernel.org>
Content-Language: en-US
From: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
In-Reply-To: <5ea091c6-7e78-4945-81b4-9b5c427d2e4d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P250CA0030.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::20) To AS8PR02MB9532.eurprd02.prod.outlook.com
 (2603:10a6:20b:5a8::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9532:EE_|PAVPR02MB9428:EE_
X-MS-Office365-Filtering-Correlation-Id: 582b7c56-2836-41a4-7cdd-08dda34601a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGZ5NWdvU1N0bzFoRlZ2RjBqVXBOZ2xKdEdpemgvU3Uwb3dSdmpaOG1DbFhU?=
 =?utf-8?B?a0NENmFvUlZMMTZnazE2LzZkQ3NhbGtXd0RqbHgwSTNma2NSalFXN01QZjBI?=
 =?utf-8?B?dWc3V3pLSTIxdzFKUXROZE15Vm9HRVFtaURGUERFT0dESnRFVnIrcGQrcCtz?=
 =?utf-8?B?NzhNNGVhTHlNVHdDV3EvNytaQzdxUTBneDdpMGhMcUNFa2NmaStpUXVzODh5?=
 =?utf-8?B?THdMQnJHN0dEcThiK3NjMTAwamhjR282YlVqVVVYYU9aREFRWWQ5eU9ONDhJ?=
 =?utf-8?B?ankrMXhTbXQrUHdsalN6R0VTaUlYb2hBYVhRa0Y4ZEN2RjdnN3JRZFozRTlN?=
 =?utf-8?B?bUV4ZGx6d3lhejV1U3ozTUdJbFVKd3RTQThHL09kV05BQTlaMXJISVdLMFlZ?=
 =?utf-8?B?RkoxWGwvbzVEdGFtTnQ1RHdIUGswNkxIRmFZUm9HYzlMbERuUVVxS3loa2k2?=
 =?utf-8?B?N3lodGNsTzJIZkk4bVkwL0lwNlJieTAvVVRZQ0Nnem9zc0RqYVVpWjY4RVNZ?=
 =?utf-8?B?NE1hRE1YKzdTUzFLZFM3UUhuamczQ2R0U3QxNFRZQTlYbHRpYm5ibHY3TVZx?=
 =?utf-8?B?SzhzWXg1bkNDZ3RDMGNMNWpTUHE1RTM5TjVBZGRxQXpHazRIT1dZb1ZNQnp3?=
 =?utf-8?B?R2pHT0I5bjdOajFYeW9OOWJKR2t4MTIyWnlBVWZ2MUZyVGdnbkpDNktyalNV?=
 =?utf-8?B?cW1FbUxqemtBbk0rZW5zQXVlMHVJUEtmMEpPUnJRcHpBU2tzQStadStpc3BZ?=
 =?utf-8?B?REdQN1paa255S0xkRFE4elRFOHdqZjJMcXZCSURWY3Y1Tjg4a1NmNHBOUzBy?=
 =?utf-8?B?cW9RQW4rUmVlR1JHMUt6UXlYLzM3d3BzYVBYWERNbWM3dFJsYnhNbmtZR2h1?=
 =?utf-8?B?UkRYSGxRNW9EZFRRWGE2NHlhdjhoSTI3SGtBbTNxTzErb1BTdHNRQVVlcnNv?=
 =?utf-8?B?OW9FMVppZWl2Q2JNNG44Q1VzcitrdmhwRVAzcDFYemFOUzJ3RVlNcW1samZz?=
 =?utf-8?B?VjNzTE9LTFdMR3lWREhJN0diS1ozWkVoWHhrbmJHdmk4Ymd6REN0SFp2ekIr?=
 =?utf-8?B?Z2hiNm5tSGFyL0NNUWRmWVluNW5uRHpCYUZEdVJFOG9laVIwdFNrZVRKa2ls?=
 =?utf-8?B?bWs5czN2VkR4Q3NZaXpBbHhqT1V4UDRHUDRQaVFzbWoxTUw5cmxpeExUR29B?=
 =?utf-8?B?eTc4WHR1OGtPcmlEcFl1UFJUMU5sNFdGVTBHdjhzMGFScTMwbE9nci9SQzYz?=
 =?utf-8?B?SmJmYktER2FMQWtOWFMrSWdsRUJpWUpnWUpkcStGcHJSZGhSVit3Tmh4cjFE?=
 =?utf-8?B?VjVYdVRIVmE3bGEyUjNrMXRITkxGSG8xNkovbjJLcFlZZkgxZ0NFTGJSMEVn?=
 =?utf-8?B?ZjNTSGVBQm1VQUZ3Zi9BUnhRN05ueC8rVEJuRm1seE5tbkk3R0djajJsa3NR?=
 =?utf-8?B?djNYTW0zSWdxR3kzN01HT09jVUNLMko0N3lONzM3NlMzUVl6WUxHNUEvNGNo?=
 =?utf-8?B?T0VqYklhYVlpL0dNZFoySGNIVWljOWE5Vk00akpzZXVNMGJCanZ6REVHZ0tH?=
 =?utf-8?B?WUR2azBTOXJ0angrbXNtK0d5RXJXZDNtRXJpb3pjeFkrL2hiZGhHcnFoQlBC?=
 =?utf-8?B?ZlBadERsZWlKamNUTVk2VlRGTHFPcDJsS3FYdE42R1g2MG4vRmZ6TSs1THJW?=
 =?utf-8?B?SmUvRmNOcUZZUmF2Tm9WT0hpS0djc1ErT0Z5QnpSOG8xRkNTT2RjMXF6YlpZ?=
 =?utf-8?B?VkdHZ1BtMTRhWGJ3bXlvQTBaV1BnRTR0T2cyTThnckZ3YVRSV3gwYUV0Yy9G?=
 =?utf-8?B?Z1RpMWxxWWZJUWxPcjhjZnM3RTR4cTRVRUJWMlloakFoclFGNWFHamFSOXRY?=
 =?utf-8?B?OHAvR1UrQmNyT2wxTURsbG5TMGROc1Z6UG0zdWN6aE05NitlRnpYRlp6NkNw?=
 =?utf-8?Q?+Hw7oEFQLl4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9532.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVVsUzduNjNYcmc0LzB5bHFCMGZQWTVqajBsa2JkUU9oVXlKRlYvVFNxbTF2?=
 =?utf-8?B?TFRTM3VkZnlJZVkyaTFIVFp1UWZzN1VOa2d1MTFRQzU0MHZMWjBDMkFsM0pT?=
 =?utf-8?B?Ni9kVUZBZ1Y4enVTdFdCRlJmeHNrQzRXT2d3QTA3S0pUeWloaXdJRE44UGo0?=
 =?utf-8?B?c1hwWU9xeXhhZStNdU54eXFreEJ4Z2lBVkZvc1ZhL1B0bSsyOFcyTHNqWEN6?=
 =?utf-8?B?THl6MGxVRVltVm50aktBZ3I5T1dHYUFJNC9NMVYyUE9nQWt4T1ZXWmZCMXNI?=
 =?utf-8?B?R0RhL0s5c3EzQ1FEdVFKdUpzN0pzbUxobGxyWEZlZjZGWWRaTVBNVWU1S3M5?=
 =?utf-8?B?YnB3dFlxWHFRRCtRTjNzOVphQ0tleDc1VFIrSEkyMU81SytmUUNvRjlLdm40?=
 =?utf-8?B?UTB2Y0FBL1EzREN1S2paS3Z2VUdBcWR6QUlaaW1TaGRkOEh6ZVU2cmFmNmZI?=
 =?utf-8?B?SUIwMjRCMDlZeXJacnBFRVI5S2xWanI4U1dKZlFKRHBZcHJ3THZYYnN6S3NZ?=
 =?utf-8?B?UGt5K1JRdVl6alhyQ0RCS2s0OFZpelhLNEhJejBuSXZ5ZW9IRHVnbHp1Vldl?=
 =?utf-8?B?U1ZGRjI0akRBSmhrYkNMUjFaUjRwRWlLYU14SUxRcmlpYjM1VFhaSXJXNEZt?=
 =?utf-8?B?c2dHTW9wWW9jM3JxbXpxQWllaFpUSnRqaG9UV3pNOXBTcTlrdWxKa2JTRERS?=
 =?utf-8?B?YUhraUEvZ2xSTGt0OGJBY1Q3UE9iMjlmeEVsckIxVTliQ2doWjN0MjRyMHVs?=
 =?utf-8?B?WjVDaTQ1L1RmUGthdzdPWktJYm43ZUlJRERWQ3pMREV5K1VQL0wzZ29UNXpR?=
 =?utf-8?B?N1hBZmp2bzVMVjVCNUFQZFh6bGc5UEg4dnNiRTdpR0xFaTlkTFhWWTYrZWR5?=
 =?utf-8?B?M3J0RzkzcGdzUzZJQTFaQ0VKSmhJM0I4UEJoZGpHT25tN0x6UDNKUCsvd3JT?=
 =?utf-8?B?dFMvMlBzc1VBc1dOREdwb0hCK3dPRUg5Z2VJUGJYNVBYUkRYSXFSUXpGckxx?=
 =?utf-8?B?Zm9oZHd3L08wUFpUZXlhaktRSzF3YTJFeE5seVF2eHh4M0xRUUY5UEdxR0tD?=
 =?utf-8?B?aVh2N3hBWkpMa09QVjk0VlQ0eTZia3JhNzVYcXEvRTIvdWlKdVNIbVlDWjlL?=
 =?utf-8?B?WmR5YWxCekIxQ1ZBeXppSHJwWHdyYTRzaWVrU25RYUVjTlB5RHpJTXZtK3RQ?=
 =?utf-8?B?dWZicWFacGNqVDNkV3FRek94QUVxcU45YndIRUNmUUpBVVNIL1lKSTJ0NUMv?=
 =?utf-8?B?Z0xzay9QVDN0ODZYVFovL05HN1lMbWtJSERFRXpCclRDMGJCQlhJTlU0VUo5?=
 =?utf-8?B?TlFnd29tbFovNGRhR0NscHlVc2F4VXZueGNKbVJWa284VDZFME5TZ0VwQXRt?=
 =?utf-8?B?ajNzNHhyUlRTNmhkUU5GcnVPWklvSkxWdzV0emc1ckE5YmdQT1FJYk5jM24x?=
 =?utf-8?B?U1NqOVJxT2NWZlpsZjFpRng0eEZpMk1UQU9RSCtPWEo5MjBTV0I3akJpK0tn?=
 =?utf-8?B?QWd3bDhZQVEyTWFLaStaRjN1VUhScGdhQ2tNVVFLR05wVXdvdXpMRWxmM2dW?=
 =?utf-8?B?UUhZQkNyLytPYXhodnVoZDZQd3NoQmY1U0VrdFFCcmFIMXB3S29PQUNTb0FO?=
 =?utf-8?B?aTRBdDZZdzBVRzB4VzhWb2xoVlZnZ2JTYkJYOXZyVWNLVjBKWklNanpzc3ZY?=
 =?utf-8?B?aWQ3QmRIa2kxUG9Na1NOckpDSHhnOFF6a0k0UWY2MHhRRmhaVzNia2Vpb2p6?=
 =?utf-8?B?ajZMRjJKOVJqNStzVGZQckJqQTROb1V6Q2RRNFFZTW12WEMyVHAvcUdkckdz?=
 =?utf-8?B?bUM3cHVUU3M1S3NFLy91OVEvOE5HZGNwTk84b3lrZzV1ZGVXK2dQdnBSbmRo?=
 =?utf-8?B?YXFhMitkYUZac1BuNEFTcEx3cUNQL21jc3pkY214UUJxYlhIQUg2NGJNcVdr?=
 =?utf-8?B?bVgwSE14dEJRalFweGZ4V1dRV0FoS2wzOXBVRFVYWnU0K21TeHovL2dWdzVQ?=
 =?utf-8?B?dEg1cUJieFZQNmsvSTJGK0ZTUkpHbzIzZkxVaWpWWE5hc3pQNG1Gd2x3OUtl?=
 =?utf-8?B?WnhKYncxcjU1YnlZZXJRcCtFcU5lNFRsQnJCWmtLMDVJdktFYis4SXBIVE9V?=
 =?utf-8?B?U1liMW5XMDlkaTNuU2UxdnZEa01ySVYwR3JvZWRDMXN4dmw4SzdKd0x6RXZV?=
 =?utf-8?Q?y6sBl2CLzmdUvLGyCetdpJpb3idbMLkkzB8S5H8KEjIK?=
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 582b7c56-2836-41a4-7cdd-08dda34601a7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9532.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 08:58:42.9060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xSnmrnQLEFTk0HPVDNfSIZAeXmDX2aRGJf5dmJMBr14jP46a/DeZSfgkWAgYPLU5S4Tqj0ciVjNePsYdyuoxiKJN0Mrx/oQFgjk6LywR9dH7lP++267tN7cu5T3C5TngK4KEIYYc4tCAMt+Js6Aruw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9428



On 6/4/2025 10:27 AM, Krzysztof Kozlowski wrote:
> On 04/06/2025 09:04, Martijn de Gouw wrote:
>> Hi,
>>
>> On 5/25/2025 9:18 AM, Martijn de Gouw wrote:
>>> Make the PWM mode on the buck controllers configurable from devicetree.
>>> Some boards require forced PWM mode to keep the supply ripple within
>>> acceptable limits under light load conditions.
>>>
>>> Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
>>> ---
>>> Changes in v3:
>>>   - Fix typo in the examples
>>> Changes in v2:
>>>   - Add the header to the binding patch
>>>   - Improve commit message
>>>
>>>  .../regulator/nxp,pca9450-regulator.yaml       | 14 ++++++++++++++
>>>  .../regulator/nxp,pca9450-regulator.h          | 18 ++++++++++++++++++
>>>  2 files changed, 32 insertions(+)
>>
>> Does this patch need additional changes?
> 
> What is wrong with the email you already received? What do you exactly
> need from us?

V2 was merged rather quickly, on V3 there was only the Acked-by: Conor Dooley. So it's safe to assume V3 is now waiting to be merged?

Regards, Martijn
