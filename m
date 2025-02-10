Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2096.outbound.protection.outlook.com [40.107.105.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6209E1BEF71
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739175681; cv=fail; b=CeGbkhhxLle1fYOmd8qwObuu2+hD0dZMPm8JrsUu45J+swUh7S3JPvsnXC+bAIHzVWiJ/jHRGCN4O9muwEr2dtxqVw/kgz2OCYdrhbAPJiEa/f8MjyJDar6hY9/0Se1Okw38JvYHqzJ8+R80KQ1skaNDwmudQ4O6bEM3DoH8i1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739175681; c=relaxed/simple;
	bh=ETU8tZV9gLCVtK6THTxB6RK/z4dOJi2Lqu2numkMCyI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fBomJxK7R4a4yvxOVXbcPjp4ZJsDOcM2MJ9ZMQl/x49e+9OWilsOGj4jJEnIbCfX3hU6yikqP2sZ4Ibsqu+7lRJccLBSA0w0Wo8Wd9cgbroVx26Fe4Y8oNojfe7QAmmMozamSM7EWiP7A5vuAEYUh/pzTHP7VxfqMKFJBVDnGfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=KjHHRlFT; arc=fail smtp.client-ip=40.107.105.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="KjHHRlFT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jh3I1P3XQPKRcYnHG+oY/0OGGUc6eIhXhyAfFlMCgBkrxthWQ71kGD/JLXn7/sUe4SlFCv/4AZBvbClw5d3N6kuK+UewNGiLQbR4RsQY2c3OOblp9MDxCxKbqu11YqocS+7LHF18BOt17WsLkP/dUY9jviY4tx2EYxNGgmRJu7Of7PoA13DFdlfQgAhnt+bRkOM/aAU9NZpM1/3wzRcQevCOEoHKbQvTAWL9Je7eE/ZeeJJSLY6++iuO1hyCuEyKyx3hCU7hs2VFqweWefJ8OpCvsW0sGhBKeh3KryHvtUnnNe5C0jDhKmXpU1ZU/xcRSwuutJotiI5vX6ZBWkjAeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMQFW82B89VfXw6megBboBi4zYqLYLisDBCyrfYk2iE=;
 b=Fxl5Rot1JFqi3C88Nk7vOQe9WJj0jeT1/t13mV8LyPshhYyf/5UhmSqiS02y0SHoUebMlIZe+arb1wT5ItoogG4IFP19pRqQHrmnYsymapFmkZLQI9RH9BG5P7NMGBlIf7g98k8+DBHDo9mURP1jlsnMOtc9Kh8ZwW1ipGk0eNsXwU2tvOgOJfKfROVD+SI61t2ymnCMRRovjCkAfRIGHFnmQ5mIcxA6ilMjYManjv5fzXXc7NQPmMt1ZrjQAlXeFxJm97JVscimslRPvBUp/7GLULn81mZjO+EQHdGEQ1znqhluoQmc2QErOW/tddUJS7htTbHLw/0+26hpXjzBGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMQFW82B89VfXw6megBboBi4zYqLYLisDBCyrfYk2iE=;
 b=KjHHRlFTYeHd+sZb/CjwN00J9m7HMBJhL+96V2Ahx4n7AzXkYL/SqghpJMBBPd6JDq2CjAx88VWw2eSqeVCN4kljnO2pBDNe5S2PnujOSpJWTZmqMf72y1+3X3uwMC7vJbjxpINxsouLmA2Gqpmyh8ABWGFx1XEZfH/foU8IxI8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS8PR08MB7306.eurprd08.prod.outlook.com (2603:10a6:20b:441::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 08:21:13 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 08:21:13 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Mon, 10 Feb 2025 09:21:01 +0100
Subject: [PATCH 2/2] clang-format: align consecutive macros
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-clang-format-fixes-v1-2-9bcf43a4b4b2@wolfvision.net>
References: <20250210-clang-format-fixes-v1-0-9bcf43a4b4b2@wolfvision.net>
In-Reply-To: <20250210-clang-format-fixes-v1-0-9bcf43a4b4b2@wolfvision.net>
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Michael Riesch <michael.riesch@wolfvision.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739175670; l=1257;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=ETU8tZV9gLCVtK6THTxB6RK/z4dOJi2Lqu2numkMCyI=;
 b=JG9Kn9hxtatktCyMxWnrim9dSl50S9nKlFYi72jV142mQXJKoxUg7LhinGGPMMsdAP7tgUwbJ
 fPXPJy5e5dHALs7LkZkdTNLdLz3GWtdNnfLhaLIEEOpHdy8EY1kJT6b
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: VI1PR0102CA0055.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::32) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS8PR08MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: f93156f1-2bef-4ebe-5a05-08dd49abe1a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aFFTQjNCUUo1cGc2ZjF3SWJnZ0JoeEJjeTZqNmU1dW5rV3k1RCtIemE3ZFpu?=
 =?utf-8?B?K3ZpT0FTTW9tRk15ZnZVMHoxU2QxUjU1UGJTajN4M2E1MkY5bURQUi9tbnpO?=
 =?utf-8?B?ek1zTnJmZDdyZStnak8wQUVRWStlMHZkK0RwbnBNVTJaK2tFbXVoSTRpTXVx?=
 =?utf-8?B?aEd0cUkvY2Z1YW5RK3cxcVltZnVWWDBRU0tENlJCZ3p4Z3dlQ1ZKMVJiNndN?=
 =?utf-8?B?cnVhVzhPWUxUeFBsNnJMR0E0V3NmZVliTjF1dm5zSWhyV1ZXbEd2TTNDMkJB?=
 =?utf-8?B?Nm51WVQvcGlYYVlMRERuY2dFbmVDRVJhYjgwaFVrT3NCS1RkaXV0VjViV2Js?=
 =?utf-8?B?aGRJK2V2T1RubTZETVJMYkxGLzNPZm9UOEV6aTNGeEN4VS9oOGhDOFNhcUFw?=
 =?utf-8?B?R0dESXFGREFxSkFJNUY5M2ltN1pmSnZTWWZrWW4yalNSVExGS3lmTCtYUVNL?=
 =?utf-8?B?Q1h3RzhGTUI5YXYvR1VXNGM1MlhuNk83cU5rZ2FwK1VHMGd4TWExNHdET05Q?=
 =?utf-8?B?dXErdW9VRno5K2lQQk1WUVZhUi8zdmExMmY0VnFYc05WaTRiblJoRE5udW5Y?=
 =?utf-8?B?R1lOUis5bkdNcjVvZUEyREx0a09UdGNabkN5WU90bVVyTVVrd2VzNDlxRXhu?=
 =?utf-8?B?VmR2VUY3WDVVb2RPV01ETWtJYW9seUZhZ3p2SkZwUXdTSXJETDlTQ2Ruc0Jy?=
 =?utf-8?B?ME9Za3pIZ1hqUFZlc0lITUFVSHp4cTNvRDF0N2dSNzhhc1Nud2xZeHRyK2Z5?=
 =?utf-8?B?OUJJL2pIbjRaa1Z6ZkRVUEIrYkNGQ1NXMUV0b1lnWWtpem95bWxRZ0puWG1W?=
 =?utf-8?B?RWpOc3B1TVJCVnlROGc5MTVXcmRUdE9Xa1BreHh2dE0zUXNYQmJCYlBpN21h?=
 =?utf-8?B?dXF5WiswZW1YblRDUXhXOFU5RHZVTHlPaUYzT3lEOThRR29Gd1VJZXQrTVJX?=
 =?utf-8?B?ejRkOXlyam1XRW83aHIrbXI3OTZoSEtPVjZpdmxybnFMK2UwbzBsaWFzS3V4?=
 =?utf-8?B?NnlHVGc2a0ZUcitGckl5UFhreGJGS3FLQVlGU2V1OHdCbTJoaHVHRXJGanJs?=
 =?utf-8?B?M0FMbGo3SXN6MEoxcUZGdWxYSkd4NXc5Tlp5elpwazZvUXloN21XSnRrVTBB?=
 =?utf-8?B?MXV6MXJoZFRRZ0JlTTdZU1JoWmxtamxuTEp5M3krVUNUWmJxSWVIOENBdXRW?=
 =?utf-8?B?bm44VnRRTXIrVlVERXViMUdXakt5cVVHZlZqT3ZHR0kvem5OWnJValFSQ0kx?=
 =?utf-8?B?M2srTVhldDZMZVBYOEIxcDlQYXIwSUI5dFp5WUhtSUczY1RCY1FOMnY3ZEdz?=
 =?utf-8?B?THFNbW9PT1RZZCtMSXE3aVR1R3kra0R6UGdkYjMrT0kzR0MvVHl5L29lMEk2?=
 =?utf-8?B?emNMWmJnNWR6N1dxWDVaVUp0ZE5aVkdLNVlySE9QYmpWZ0JnV2dZNjFIM3B5?=
 =?utf-8?B?ZERKbEFoWnJQeUJ2WjVVc3NoUXVNdmJCejUrU0hEQTV6eEhJWWpEQVF3RERB?=
 =?utf-8?B?SFFYdlNKNTFJMEFiR00vRmVRaTVNT2k1QjNkZGlIUW0vRi9lR1NMMEthTThI?=
 =?utf-8?B?aVZNQnVyMFplQUVIR1haNWlqa3FzdkVhM1crMHBOMy9XQVBGaWpuL0Z1c3JD?=
 =?utf-8?B?Y09OZXBhaXJjMDUweHhMT3NDV3M2bElNUlgxK3cwOStKSkxWaVNVM0FVOGZ0?=
 =?utf-8?B?S0paUUxJWnNlL1Fka21oNEluV0QvNnBhZ2lZU3B2OHNWbjRqTmh6dGt1ZEtL?=
 =?utf-8?B?Z3k2aWFibG04eXhCMkhPMDRsQTh1NVVSa2hhcXM5UEI3UkJKN2FvSjg1NVpJ?=
 =?utf-8?B?MktIeGhuaFZ3Z254RitoMUN4V1ZNRktOeGRWMDIxRGFLR2ZJYXFIWGQrVTA4?=
 =?utf-8?B?K2srU0g2anRBMnQ4NUlVQVAveWRPSmNoV0Yzb2U5MmxIYXRwOEhkb3JzNlE4?=
 =?utf-8?Q?+Et0bti1ulf4AUGRF5rpvdAZfx/uR/Ir?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yk85RFNPdE4rYS8yeGJybW9sZXl6bmJENUwzY0c5OUhXbDJTQVFOMXFtdU5K?=
 =?utf-8?B?OUZOekR1MmNzS0psdVpEdFZ5TkRjcUprckZnamJacytXSy8zWTN6US9SZHNs?=
 =?utf-8?B?STd3QnpvRHVJaEdTRFRRdTNPMkhqQ3RUampZMWVvaTJLU0k1amFzVHBTc3ZN?=
 =?utf-8?B?NW1EMDAxeWdSb0o3dkkySG1xa2h1SjFaeC8rN0tmenZISHEwOU9VbXBDeHB1?=
 =?utf-8?B?d1JxVFZ1OHk3RmNIK2h5MTVwTm1MV0RQcUMzV0FUcStOekp3RjBMYUdVL0xD?=
 =?utf-8?B?NVo2bnp3MjVBSkFnVEFzT2dVRVVBOEtVN3NFYTUwSGpObkJ5M25jTWxkVmZE?=
 =?utf-8?B?b1lySVhpWHJFRlJDYXBCQmdXYk5pUURzR2NBUnQ3WkpBRmdzUHNRN1I0Y2ha?=
 =?utf-8?B?VXYvYnA4WHJrclRNekhlTjEyL2t3RTFVT0xha3crQmRSSEUxQWNIN3NEeWMx?=
 =?utf-8?B?Q1ZLSXlFSUZKUERtamsxWnJ5aXJLV25tRWhnbGZRSjVJQ0h4OHNsN3RZSUVN?=
 =?utf-8?B?Yk50TG5uektVdFVUaW9kS25hK2pHSGVkTENzNWUwc2d0RGppY29GdlNYa05u?=
 =?utf-8?B?R2lBWW5abWU2cTI5QWFFYUtvWVFWa1JEeExWcXpwRDgrbHc3T3lialh6Vy9H?=
 =?utf-8?B?YXh4cVcwV0dLc0NaTUFSbEFyWUNJZ0Uwb3hPK0JxQmNHeWYvb2pKSUJoZ2dP?=
 =?utf-8?B?U3lGVXhEWlNQYlo3MDluWWp1UTVabDZTOWtESVhZY0FNb1lZQlk5aHAreCtx?=
 =?utf-8?B?cERaY3JwR2d2c1ZFR3d1YU8yMDBtdUJ6M0pFaXZaOW9mS0Y2L1BMdExHWXAy?=
 =?utf-8?B?Rm1qd1RhV0FrNkFLVjRqMFpWSERBZDRwbkVHR3YvRkd3V0JxTjI1S3FXWTVr?=
 =?utf-8?B?S21nUkhieWxweUhoQVowUW5mZDRjZlhpR2FFTzl0bXZMMkc5WTNVZmlpcllE?=
 =?utf-8?B?Z0J0ZitRZDJJU3M3MDQ4ZDhWb3BYbEhLM2VOVkdEL2lkU1FjcUtGdXBIUjdU?=
 =?utf-8?B?RVQyNmsva3dJbnA3bWkvd1h1a250OVZaTzIyMUdNV2FPejhIdldRZ0ZUVFpa?=
 =?utf-8?B?K2xnYVBUcXltbHhnRjY4bzh0Wlp6ajV1OXFRTmRkdlVhSXErKytDZ0lYbzlC?=
 =?utf-8?B?LzlaTitHeXVqMUM3d0t2NDVCeS9WeUhmUm9KRlgvenl0bURITmJDeEFta1pW?=
 =?utf-8?B?U0txRzBlbkVKZzdobHc4aFF5akNpcUhZbGFLcWFqZ3NKNzIwVzQ2WVBZQ1Jp?=
 =?utf-8?B?ejFESHlYSUN1emxIOFRTK1pYalZlNGVhZDJWZjhhcFhwODYwWktGOXA5RVl5?=
 =?utf-8?B?bklnd3Z6NWhwM0FFb2VSQVk5YU1KeG5uZFBwNllBbmRrRkdhNHBzUWNrYUQw?=
 =?utf-8?B?RDMxTWoxQVh6c1lhWlNpZWFPZ0lhRmljeUwraXVzdERoR2h1cnFMakg4bldr?=
 =?utf-8?B?MTBidzg2N1J3NWx5elpuWmtHQnJoZUdZWktsVmFoTWJ1RVUxcWFyTUY0cEFz?=
 =?utf-8?B?NnlvTUdyMkRiejBpN1I4WjZ0M1ZNWWsrQ25qbkFFczBHdnoyRHhzdldML0Zw?=
 =?utf-8?B?c1VxdGxqbUlCSUVJQ2pYZDhxNHJWNzJ6c1ZMbklLeEUzV1JtUGpNY0MrQjdp?=
 =?utf-8?B?RmJoSjg2NHZtYUJNcldkdEdEK3FIcW5JSW9OdUZpVkhEUHJ2RmU1clV2OEZX?=
 =?utf-8?B?NDVod3Y4c3d0VlF5KzRwa2h3cjNHVFR2VnRNYkI1NStjckUvZE5vOU5Hc01P?=
 =?utf-8?B?VnZDaWFRbEo4MkN5TGgzQjlBQlp4TGdKN0c3SGM2VzliZEdlTXR5Uk5ER0NO?=
 =?utf-8?B?a2U1UGdDa1ZWdU5JVWVWcEJSMDI1TTBXYWNWTW9SWm1QK1ZGeGRuM3p4K21G?=
 =?utf-8?B?Tlkvdy9wbFZiTm5odWFIUElpY2N3WW1VclVxUndEU2c4S0V0bFd2dGFsVSsx?=
 =?utf-8?B?azlSUmpyNDNnazJ6UjIwNmNFOUtOZDNxUldrMzI0dHI5ZDJYcTRydEltSm8w?=
 =?utf-8?B?V3VkSlFmYTMvTWs2cTY1QmNLYWtpWWVPS3kwcVpwYytMenJXTVFQcDBrNXV4?=
 =?utf-8?B?WnhHdzF0U002all3MUtBUzU3QnJONjlwQlEyYXJFRnZoaVBBSXNISXNpS2tG?=
 =?utf-8?B?VThGWWtPWnYvQmtJLytROWVsSDJqZU40YVJzY2ZaVDJqMnJHM29iWE94Z052?=
 =?utf-8?B?T3c9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f93156f1-2bef-4ebe-5a05-08dd49abe1a9
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 08:21:13.4404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OWeeqKkA9lJVL6xZlxVJ3IW1xo8jbnjmhfQ5ymfsix3FA5Q07JRbLKq3MNloEHen6nIdh/IDEol4lL+pUwsM7ji7Q4AfzCmxqufOMMWQ55U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7306

clang-format 9 introduced the option "AlignConsecutiveMacros".
Set it to "AcrossEmptyLinesAndComments" in order to avoid macro
definitions of the form:

    #define MAGIC_REGISTER_1 0x42
    #define MAGIC_REGISTER_BIT_FLIP BIT(2)
    /* important comment */
    #define MAGIC_REGISTER_BIT_ENABLE BIT(12)

    #define MAGIC_REGISTER_2 0x43

With the option set to "AcrossEmptyLinesAndComments", they will
be converted to

    #define MAGIC_REGISTER_1	      0x42
    #define MAGIC_REGISTER_BIT_FLIP   BIT(2)
    /* important comment */
    #define MAGIC_REGISTER_BIT_ENABLE BIT(12)

    #define MAGIC_REGISTER_2	      0x43

which seems to be the convention in the kernel code base.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 .clang-format | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.clang-format b/.clang-format
index 8040b516185b..30d09cb88170 100644
--- a/.clang-format
+++ b/.clang-format
@@ -13,6 +13,7 @@ AccessModifierOffset: -4
 AlignAfterOpenBracket: Align
 AlignConsecutiveAssignments: false
 AlignConsecutiveDeclarations: false
+AlignConsecutiveMacros: AcrossEmptyLinesAndComments
 AlignEscapedNewlines: Left
 AlignOperands: true
 AlignTrailingComments: false

-- 
2.34.1

