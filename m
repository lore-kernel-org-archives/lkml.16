Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010043.outbound.protection.outlook.com [52.101.69.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87080224B02
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.43
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748876107; cv=fail; b=j6uhgXXxcA0FW8ekhMg4VnkTAe8i9MrHR6K9+4UgKZTa+TFRPOvjhjxyVcKcyyJAASJjpikdm4+KKYlMvFy6Y9S+GNg0q0G64qab0DsxK66gn34ZdZoMapkkAoIQfH5ZN8Lv4uBD6B0W3Y5IdqWh88VJpZqfxkHNr7/ImF9W4rE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748876107; c=relaxed/simple;
	bh=wzeyjPhZ6bjiRI+f+vy3oAWDpgoKQWgGo2LUxi3Mgog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gQe3lXDJkwTwoES7v22gmJizT09QQBzyymQ0FkNxeWbE9U/vIQmUVlpa5JQAWLF4+HlWs7owMHz3VZSs0o7TmoANU1ggtakY0qIvWgxXMISOHrh4JEQbBN1+dBQv87IzQ9elYUmMRXUWx9cH2iw5E+M5XhYHBmE7MNTZsTSAwmo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bVOkVlHL; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bVOkVlHL; arc=fail smtp.client-ip=52.101.69.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bVOkVlHL";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bVOkVlHL"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yPWv0Rd7RtcPxjKIfXPlEM4a8DHJljt1t0a3tliJLdjNPHVASi9g0Kwst0UvdmmvIXGe7OGvZkaq4Z3OyGdPTLavgF5WRWgLEfQMktTx/OTZCL3vOCHdyyxjRg1RC9MUrTfHF2Z1i6aVkTy5bAa+09UbIPQ6C4qNrvr3L0u9t7e9/Vaq0NdH5DfHhaAI504X9KCCyPzM8cIWMZDOgto+FjGJaSEkLtW1Jf/dvJW3ruTC8HlBuaGrZPP535Fx2nKtzuO7ZysPsuJ6T1Xw5rtf/m907BlIlRBcCLbxX0Oa7cuRQdq9jCB+/4Lutm+N5aZQEg5aENnLhqP9T9o82Te/dA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMxbSWAgrnh2skjdSApToTua6bTF7DzfOMGH/fCDHEs=;
 b=TR5BBWjcl14t3jUqBtYxs1cuaBx4uaSLV8YChyPXaCkT6/h1+YM+YEobNe01D15zDfgPg+qxEWXcQ/sOJtFSHbZSlhLhHoTBJIsbaLB6YjQPs8unYHClvSKC/t4lYnWl4FyIcC3XKgoVDtrDnO+629zmWT4Sg9rsG9UnCWZ8NlCsv5llzk8sEh1oUatCZ09+LNz144vSv+CiFcZhmdVF4W4xzuvp1ULvJqJXp2uXSluJlZG6SINEs20nk7Y0qRMiDL+cotUDIiCD7u172oRq0sinrZQO48DM+aDydHQGTJ8ejJqtFz1pEOyVCLJfibFqRe7ArSzycXorMMDWjofYyQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMxbSWAgrnh2skjdSApToTua6bTF7DzfOMGH/fCDHEs=;
 b=bVOkVlHLfiQropULVOkvStRCg7hpScAxsOZ8q0XPYa5OCp+NDzJKO/ZOoKWg/Mb3avSxvVYUQil/nOlJUT/PG+iXI7MV0DE9PDnYX1mXIqaQwwUFfQJj/tgGGIFvJX0Qs6AUPbLkBAmyGQL3nua1YvVi8Atgjfh9VCeRbYpRj4I=
Received: from AS4P190CA0021.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::6)
 by PAVPR08MB9554.eurprd08.prod.outlook.com (2603:10a6:102:313::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Mon, 2 Jun
 2025 14:54:57 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::e2) by AS4P190CA0021.outlook.office365.com
 (2603:10a6:20b:5d0::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.31 via Frontend Transport; Mon,
 2 Jun 2025 14:54:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Mon, 2 Jun 2025 14:54:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFDq3vs/dWlO2mD9S9qp4GtT6vHbJ92FL3p8bex0Y/ZhhwFXkaPAsLdr3cYq1HtAQAqCWhDTUcCGPfwTNSa7qLDmqU+NnReIemulEzDVZl9wF+7kKgZkw1oQbpbF2/TJ368nEo54OD/svx7xHbs5eit6OxLpAaPAfuEl41hH62g72g99izFGnTO8VUtD6bYKKlOUYnjeOSIpYxizC2PgyITfBMObphhDbpJaFuctSFRuq4XogFGCW/e7jj8vPxtlVC0LOoZpZvDWRyV0/ppgfDHaQ0NqBv+8ncvbhj1Pwx9O0AhKRQATDXgA8pG1cEWhXtWwps3woVDKoGQb5itOzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMxbSWAgrnh2skjdSApToTua6bTF7DzfOMGH/fCDHEs=;
 b=JiQMHpImNDW8vQ04wavrkjW4JW6weOu7ldj4lyZBkObOB26y5Hzy59AL9yFsaIRayf/J8s8aB1py1dJU10uu7KQcMPnq0uGfq7cwJnVCgKoX8kOH9IMYAsmxjvQltfIpo7MxhxNV+iQd3JN0CnOzk5cHu/WQOrsT0oIHKxfxKTjdI1RnrelPMK+ffG8+TAhQpdWcjY+5zm/YLsRwzLfnJfaD0eeK2dxUbmDLWJX6OMAISzcjiIgB3Xwz2hk4GUSFN7GdF1VtGRmr6pJKSvtvrXUIFU+/M2rYWW3Pzp18jC5v27mMo8zrpldv2+lrppMRVk1Ev8EVuYkLLxPjJol9Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMxbSWAgrnh2skjdSApToTua6bTF7DzfOMGH/fCDHEs=;
 b=bVOkVlHLfiQropULVOkvStRCg7hpScAxsOZ8q0XPYa5OCp+NDzJKO/ZOoKWg/Mb3avSxvVYUQil/nOlJUT/PG+iXI7MV0DE9PDnYX1mXIqaQwwUFfQJj/tgGGIFvJX0Qs6AUPbLkBAmyGQL3nua1YvVi8Atgjfh9VCeRbYpRj4I=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DU5PR08MB10849.eurprd08.prod.outlook.com
 (2603:10a6:10:522::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Mon, 2 Jun
 2025 14:54:23 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8792.033; Mon, 2 Jun 2025
 14:54:23 +0000
Date: Mon, 2 Jun 2025 15:54:19 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, geert@linux-m68k.org, broonie@kernel.org,
	mcgrof@kernel.org, joey.gouly@arm.com, kristina.martsenko@arm.com,
	rppt@kernel.org, pcc@google.com, bigeasy@linutronix.de,
	ptosi@google.com, mark.rutland@arm.com, james.morse@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ada.coupriediaz@arm.com
Subject: Re: [PATCH] arm64/trap: fix broken ct->nmi_nesting when die() is
 called in a kthread
Message-ID: <aD27GxSWsFekORcy@e129823.arm.com>
References: <20250530092723.3307630-1-yeoreum.yun@arm.com>
 <20250602124738.GD1227@willie-the-truck>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250602124738.GD1227@willie-the-truck>
X-ClientProxiedBy: PR2P264CA0027.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::15) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|DU5PR08MB10849:EE_|AM3PEPF00009BA2:EE_|PAVPR08MB9554:EE_
X-MS-Office365-Filtering-Correlation-Id: aecb2215-0485-4424-24af-08dda1e57020
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?SGZrbDlGa0QrQVdGOGhXbU0xSUoveCtWa3N5U1FxMXBrVGZIVzNnRDhQdVpF?=
 =?utf-8?B?Y1dlVlhBd3BSTDZNd2ozc2tLTDZmMnh3YW0zcW5jekVvZXdvN0d6SlBqeEcz?=
 =?utf-8?B?RFd3RGo5K3Z3Q1pRL0R3RzRqbk5obS9iZ05RRElaeUNMeExjNVRJSC9DMVlr?=
 =?utf-8?B?L0VwOTllMnk4Yk12Wnh3SW1FTkJaMGN1alNYWnA5VmZmY0tBN2w5WXhLMEJ5?=
 =?utf-8?B?aFVmZS8zY3JqN2N1NHVudy8rNlgwZ1hGTWluNjdQNTNqQTZyYmV2NzZBekgz?=
 =?utf-8?B?U0ZzbXdlVUJjRFBLdHplMExFbVJyMnk2NDNMR1F6cytOKzBIWkkzdDJwSEVW?=
 =?utf-8?B?NDdPZ3dERkVZSmVWMkRrQzVoaHVadWZ2Sm9TMG5rRFNwdGhydHJhcUM3cVpK?=
 =?utf-8?B?UHVDY2hWZk5BWHZhemR6L1B0N0lJc2wxTEQ3SFpVTlZwcitteDNDdldibXBn?=
 =?utf-8?B?TCtqeG55clZob3YzTkdRUjhMQzRIWFBXNVZpVTBzZDg5Z1dHTFNOVmkrVkJw?=
 =?utf-8?B?RjZkdWZzSjRwMmg0SVhUaXpyRk9ZTkVIVTlFQzlYREhGODlBeEtheUgxVTNv?=
 =?utf-8?B?SUcxazhnNm1GZUMwejJUVzgrS1hZWlZUV25JTFVTd2UrMjNrajhYMWxxWGNH?=
 =?utf-8?B?WU03bG4wZW1ia3NGN2wxMUpLbXQwa1EvUHA5UHViU3poOHF3MjArMmlsRVg0?=
 =?utf-8?B?WVRUL3dEU204MXpyclg4ckpOV0FNYWxZa2xSakkvT3Z2bVRjbEV6THl4N2VR?=
 =?utf-8?B?Q25VTzBNT21UMHlJV0RPOFZGMS9NTmN0TmJxZy9DekMzTllKNEFHREt6Ynly?=
 =?utf-8?B?T04rcVUwMUsyVENzMzZBNnp4dnBQTU1rcjdRaVZEQTBVNTVjejZZM0pMOUlh?=
 =?utf-8?B?UnZuTzRZUmdJbUF3OVdtUHFaSzd5N0RGRnRNVWUxZnFGVzVhdmRISG1na3Z5?=
 =?utf-8?B?NlNXbmJ1V3FrZzlGMG9Nb2VrMlRQT2UwbW9ucHE0QnpqVERqQkU5THZvTW5D?=
 =?utf-8?B?bi8zL1cxL01zcklKVWxldEhxTHAxUHVsRk9RdDhQNlFWMTI5ZFliZ1BDVjQx?=
 =?utf-8?B?K3NHVlhSL21WbURVNEUzb2JCaUkrWG9FYzF5cDNieVVDSW9BQ0NiUHJOVDZs?=
 =?utf-8?B?QVNnOVppTnRYWGFtU1ZOQzc3WVNkbk44cm9rcnVYZTI3emJPd09DSnh5WXJL?=
 =?utf-8?B?WHJHaFhvYkZMdThscnNnMWUrS2pFeUM2eVptMC9wU2JZTHJoTHJ0UTA2REVT?=
 =?utf-8?B?Smh1SHQyazVEQkFKWStnWlA2MS9jVDJ5VUlSZEJlZ1k2Z1IxcDE3UGhuVzdk?=
 =?utf-8?B?cmRxajNEdmtqL2VhU0tJaDRMSGt1bEU2NEFrQmN4Qmt3TjdTcENUOUtsNEVF?=
 =?utf-8?B?K1FwSHg2amdCTThMWnVqYnU3SlYwNmpYTUtIOUZHb1A4NEJDME54ZmFodTZq?=
 =?utf-8?B?cWJkbWpXMkNEMkNWS2pwejF4b2VsbHN4cFZwQmZ0NUVzbk10a2JCZW5kQitH?=
 =?utf-8?B?TThZWXNBdGs4WmthOC83NE9sa0Vjb2hMTEpWOGFXZ0RObGt0QUU3cmwyaE0r?=
 =?utf-8?B?Znd2eEZkWWdZaTZ5aUhPT3dERUpKd283ZDlVMmRNM2d0VXdiUEwyb2RabTBE?=
 =?utf-8?B?MG5EdjVNWDZzUGJkYUJ4b1kzcE5UV3NGRU1UT291NEsyVDlMWlcxanh2UUxP?=
 =?utf-8?B?MWcwSUEyV0JFR3Y0SzdLZlpXRDg3ZkcwZ3RqQTJMWTFqYTJqOGVqbnBnZjZQ?=
 =?utf-8?B?YWJ0TFdJUHNQQk5VelV5RW9KTG05QU1PeW12SjM2RGlEUVRhZWxEdnR0a21u?=
 =?utf-8?B?K01PaGJTdHBiblFvdEtFR3ZCVnVQdGwwRldiT3dDODB0Z2k3bnVqUXB5Q21P?=
 =?utf-8?B?ZGFqOGUzc1VTVGc2S295Q1FZbjlMOE4zZ0hDYmNYY1NDWGc9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10849
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3bfd770a-b5d9-4794-febb-08dda1e55c86
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|35042699022|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TlNpaE1lOGVOekNZMmdHc1hHN2xzM2s0bFJXem5sR2ZIY2NmaTBQdW1oNEY3?=
 =?utf-8?B?T0ZSSjEyTXJCYmY4QWQvQytMMnh0V05kQ1FRKzVOdUxoM2dZVkI0RzRHdkNm?=
 =?utf-8?B?TFhZVkY4R3gzRXpmWnFwbkdmQ09CK2JLNk5yWGlKaGROQ01ZTWhHeUp4NDBu?=
 =?utf-8?B?dkRBMUFPUFQ3VGVEdytSajBCb0tBenU0RU80SHU4cnNhclZwWktFRElib1Ux?=
 =?utf-8?B?enVXb3BUN09GcTl3TlhmOUkzZUFER0xIakNmNjFMNXZaWjRHRGRkWmdZYXhU?=
 =?utf-8?B?Y0FEdFpYN3FveEJtdjJuNTVIS1NQTlFkN202WlpXQit2OW5yTzlOd1pBVHVB?=
 =?utf-8?B?bUw4RHdsYW1ldC9sSGo1YktTRzNTT2lsNnliWnJVTDlMSDV0elRoNS9BU3JQ?=
 =?utf-8?B?SXdZSU5RR09UMWFYaFdmTG5lYklwK2NQUUNxRzhwTlRXNzY2RTVyVXRiQkVw?=
 =?utf-8?B?Um1JcDA1RTMzR3U1V0Fra1ZmazFBZm1YYUVNVlZFYU1SOFZlSEptNlJGWHlB?=
 =?utf-8?B?V0xBYlNWM3A3UTlyL2xyQWZnN29sUWJ0YVhyTUZiamtLK0gyTGhWTk1kcG80?=
 =?utf-8?B?RFp0S3kvUDBwOHZlOTk2Y3IzYkJhYjBCWHZXcTJiaks5OWJKcFFJS3c3bW1k?=
 =?utf-8?B?TmE3ekhTQ081OCtuSjU3cVVPZEdDem0rTEp4b2c2NmZBSDRRR2JZWnRjdzVT?=
 =?utf-8?B?TUN2V0NyVDRYaFhJY3BEaDlWQ2V3d3JQdWxTMEtocVZHVitGYUwwLzJDcjNS?=
 =?utf-8?B?M0NWcVlYNDRDNDNSOFZucUtPaHpCSStVc0ZyMjlRczhiTjNWa1FYemIzbjcv?=
 =?utf-8?B?Zkl3L29CNE5zMHpybmw0N0s4cUFBcTNUZFE4Ymg1a2FpMndUT1k5MFhBeEto?=
 =?utf-8?B?WERPeFpOdThrR3hpQkFvSjR5SWpuQldNOWJTMHNYWW1WaHlaQ3cvbHBMQk5M?=
 =?utf-8?B?RW9JTlBZcWxWU2dWaUJuOEJ5TGU2bnBhSnZjSXAranBHTi9zQ0djclZ2emNY?=
 =?utf-8?B?aWVzakRTYUJSUTkwRk1aRjJ6d0JIWGFORzVVd0E0SExmSVlYQm44dHZ3YXZF?=
 =?utf-8?B?VVROSjlROFd4YU0yTlhMLzRyTk04citBME1JeDV3bGJDdFRVdThNSUtnV3RU?=
 =?utf-8?B?OTFKSGoxREJCTnNKRkZMbFdTcnk0T3BaSkJUYWRCYnA3UmhPbk55dFZhMXFu?=
 =?utf-8?B?Y3BJdkdmdzFSc0ZPeUZJZnVTaHVoSDBvamlHenoxMUxiZU8yaWErc3dkbm1t?=
 =?utf-8?B?aDVHUWdsc042dklBcUs1OXUxQndCRG5oRlBiRkwxQmNLOXMrRUJhSnh6eG9B?=
 =?utf-8?B?QWVvUVMxcDZKNE9BQ3luWnJuSWJFUHZZNVJJZExHQVp1L2NjK3lUeFRkKzNN?=
 =?utf-8?B?bGJUczFiRUErOTNpaXhiRUUzOEN0UzVVSmNJa3ROeTFxZWNBYTRhQXVXWGUr?=
 =?utf-8?B?UUgzb21BL0k5OEFIQWdBNkpXYy9oNFM5cEpIdWZkdnRCQVgrNVAxOWJvem56?=
 =?utf-8?B?RG01U0wyWWxPMXNWSTJQN0RKbWNkYTZQa1JKbUd3OVdkQk0yZnY4R2VXTnNT?=
 =?utf-8?B?VG5yOW1ZS2RFa2dEQ2ljWHNBUTQyemNIT3lKckFkRk1haGdSWEVtNW5sc2Mr?=
 =?utf-8?B?Uy8yWGtLKzRjd1M5Zit0UE1DWVpNeXNEK2tmRzJKQytsNGd2WThxd2tOeXVl?=
 =?utf-8?B?aHpDMlRVREZrZ0FFNitnaEZYRmlOYVFacW9zd2U0N1BFM2N6REJBemt5OTIr?=
 =?utf-8?B?Um1IS04wWmhjeWRSdGNacS80YVlVMmhEZnYva2s0U3F1c05GU21kcTVEcUtq?=
 =?utf-8?B?cTRnMGNLOTRMM2RPU0VkU283TlJueEJ5cG5sUDBYbkVkMitBS21vbGlvbHBG?=
 =?utf-8?B?dnQ4VlQrTkNJeFMyUFZRam5uU0FrdWhTQlgxVldkMkNyYWp3NWNPLyszYU5D?=
 =?utf-8?B?YTJ4U3E2Z0NtQnA2VTZhRnRNVlE0OVgvTXB2TU91V3QrendDSUpJOGxwQUNp?=
 =?utf-8?B?OXhnV3lESXJMVEJZUlBaTlI0YzB6QlliZ2IrcXE4MHZMN1dFUHlETEllUW9B?=
 =?utf-8?Q?LLL43H?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(35042699022)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:54:55.6261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aecb2215-0485-4424-24af-08dda1e57020
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9554

Hi Will,

> [+Ada]
>
> On Fri, May 30, 2025 at 10:27:23AM +0100, Yeoreum Yun wrote:
> > When a kernel thread hits BUG() outside of an interrupt handler and
> > panic_on_oops is not set, it exits via make_task_dead(), which is called by die().
> > In this case, the nmi_nesting value in context_tracking becomes
> > inconsistent because the proper context tracking exit functions are not reached.
> >
> > Here’s an example scenario on arm64:
> >   1. A kernel thread hits the BUG() macro outside an interrupt handler,
> >      and panic_on_oops is not set (ct->nmi_nesting == CT_NESTING_IRQ_NONIDLE).
> >
> >   2. The exception handler jumps to el1_dbg() and calls arm64_enter_el1_dbg(),
> >      which invokes ct_nmi_enter(). (ct->nmi_nesting == CT_NESTING_IRQ_NONIDLE + 2)
> >
> >   3. bug_handler() runs, and if the bug type is BUG_TRAP_TYPE_BUG, it calls die().
> >
> >   4. die() then calls make_task_dead(), which terminates the kernel thread and
> >      schedules another task—assume this is the idle_task.
>
> This sounds like there is a genuine imbalance, then, as we're scheduling
> in the context of an exception taken from EL1.

TBH, this "scheduling" is called in do_exit() to kill BUG()
happend task:

 el1_dbg()
    -> arm64_enter_el1_dbg()
      -> do_debug_exception()
        -> die()
         -> make_task_dead
           -> do_exit()
             -> schedule()
    // unreachable
    -> arm64_exit_el1_dbg()

Because arm64_enter_el1_dbg() always call ct_nmi_enter(),
If do_debug_exception determined to call die(), there is no point to
call ct_nmi_exit().

>
> >   5. The idle_task attempts to enter the idle state by calling ct_idle_enter().
> >      However, since the current ct->nmi_nesting value is CT_NESTING_IRQ_NONIDLE + 2,
> >      ct_kernel_exit() triggers a WARN_ON_ONCE() warning.
> >
> > Because the kernel thread couldn’t call the appropriate context tracking exit
> > function in step 3, the ct->nmi_nesting value remains incorrect.
> > This leads to warnings like the following:
> >
> > [    7.133093] ------------[ cut here ]------------
> > [    7.133129] WARNING: CPU: 2 PID: 0 at kernel/context_tracking.c:127 ct_kernel
> > [    7.134157] Modules linked in:
> > [    7.134158]     not ok 62 kasan_strings
> > [    7.134280]
> > [    7.134506] CPU: 2 UID: 0 PID: 0 Comm: swapper/2 Tainted: G    B D W        N
> > [    7.134930] Tainted: [B]=BAD_PAGE, [D]=DIE, [W]=WARN, [N]=TEST
> > [    7.135150] pstate: 204003c5 (nzCv DAIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > [    7.135441] pc : ct_kernel_exit+0xa4/0xb0
> > [    7.135656] lr : ct_kernel_exit+0x1c/0xb0
> > [    7.135866] sp : ffff8000829bbd90
> > [    7.136011] x29: ffff8000829bbd90 x28: ffff80008224ecf0 x27: 0000000000000004
> > [    7.136379] x26: ffff80008228ed30 x25: ffff80008228e000 x24: 0000000000000000
> > [    7.137016] x23: f3ff000800a52280 x22: 0000000000000000 x21: ffff00087b6c7408
> > [    7.137380] x20: ffff80008224b408 x19: 0000000000000005 x18: 0000000000000000
> > [    7.137741] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> > [    7.311316] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> > [    7.311673] x11: 0000000000000000 x10: 0000000000000000 x9 : 4000000000000000
> > [    7.312031] x8 : 4000000000000002 x7 : 0000000000000000 x6 : 0000000000000000
> > [    7.312387] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
> > [    7.312740] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff8007f947c000
> > [    7.313096] Call trace:
> > [    7.313210]  ct_kernel_exit+0xa4/0xb0 (P)
> > [    7.313445]  ct_idle_enter+0x14/0x28
> > [    7.313666]  default_idle_call+0x2c/0x60
> > [    7.313902]  do_idle+0xec/0x320
> > [    7.314104]  cpu_startup_entry+0x40/0x50
> > [    7.314331]  secondary_start_kernel+0x120/0x1a0
> >
> > This behavior is specific to the arm64 architecture, where ct_nmi_enter()
> > is called when handling a debug exception.
> > In contrast, on other architectures, ct_nmi_enter() is not called when
> > handling BUG().
> > (i.e) when handling X86_TRAP_UD via handle_invalid_op(), it doesn't call
> > ct_nmi_enter(). so it doesn’t cause any issues
> > (While irq_entry_enter() does call ct_nmi_enter() for idle tasks,
> > that doesn’t apply to debug exception handling).
>
> It sounds like you're suggesting that we don't update the
> context-tracking NMI state for BRK exceptions from EL1, to align
> with x86.

If el1_dbg() doesn't be called in idle_task(),
I think it doesn't need to call ct_nmi_enter() in arm64_enter_el1_debug()
since its nmi_nesting is always >= CT_NESTING_IRQ_NONIDLE and RCU wathcing this cpu.

But, it seems el1_dbg() could be called ct_idle_enter() and ct_idle_exit().
actually this situation seems be possible in theory when
some idle code have BUG() -- i.e) cpuidle driver's enter callback have BUG().
However, this case triggers another quetions. what happen if idle_task was
killed (I think it seems panic() case...)

So, If arm64_enter_el1_debug() doesn't need to call the ct_nmi_enter()
instead, __nmi_enter() should be called only for idle_task().

Am I wrong?

> I think Ada's pending series might make that easier, but then
> the patch you propose:
>
> > diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> > index 529cff825531..9cf03b9ce691 100644
> > --- a/arch/arm64/kernel/traps.c
> > +++ b/arch/arm64/kernel/traps.c
> > @@ -227,8 +227,14 @@ void die(const char *str, struct pt_regs *regs, long err)
> >
> >  	raw_spin_unlock_irqrestore(&die_lock, flags);
> >
> > -	if (ret != NOTIFY_STOP)
> > +	if (ret != NOTIFY_STOP) {
> > +#ifdef CONFIG_CONTEXT_TRACKING_IDLE
> > +		long nmi_nesting = ct_nmi_nesting();
> > +		if (nmi_nesting && nmi_nesting != CT_NESTING_IRQ_NONIDLE)
> > +			ct_nmi_exit();
> > +#endif
>
> tries to undo the context-tracking when we realise we're going to kill
> the task, which feels like a hack.

Although her patches is applied,
I think this problem still exist if arm64_enter_el1_dbg() calls ct_nmi_enter().
I agree it's a hacky way for handling kernel task die() in debug
exception since in case of user task will be killed via signal.
However, unless arm64_enter_el1_dbg() calls ct_nmi_enter(),
In my narrow view, it seems the best...

--
Sincerely,
Yeoreum Yun
