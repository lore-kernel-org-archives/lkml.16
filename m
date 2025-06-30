Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012051.outbound.protection.outlook.com [52.101.66.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C4D11185
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.51
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751278712; cv=fail; b=ORNmLxmrot3AX4bNqKKzYf0sg2HeFEK0+uMDlmtYgw04HF0vmH+ATojEPhd+GDOeVPySsbNEkPpxphg6PSVQCCZRGFKcd+HjpYCcSI8r7wVA8thky9F+QeUCZLLH5/be50/80K3blFKv2OwB+5Eqbb2lPeQkYqZ6+TS61Ej9Nh0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751278712; c=relaxed/simple;
	bh=MJh7p39ijDVVa5+dTaRE7lGEDNVqlVMEjyoCPD6TSso=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ns5zQh/ZXzFb39/ZvyJ93m6UWDERkwtuI97v8m2p5ZOfyfCwPCwUKuapEC28yFXpcqKe7xiTgJI3ioxVPATEloTxDNRH6198cLHxGKpdE124jSfthZjdZ8JcRizEEk+/5/mDkT1iPfzTthEUXYs13GSuMn5tK5qbp3ZgQGCrgiY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JDIaLwGD; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JDIaLwGD; arc=fail smtp.client-ip=52.101.66.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JDIaLwGD";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JDIaLwGD"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=k9z4gaATpdCVtD0ZRQtIeoT1seD7lLMFqX3TMdXRaGHaMvzSCfg6+bc2ObjYFkYx/I3G/fvLNy9F9OL9nZqfLDJ5Q52UJtTd7EOwE0Uu8/lQb9huZXP1jLtb5WYXNcmD4Su9fdYhFCHVVPzcZ9A6znnG3srl0Zp53dEyHqSAy3JO8QEJP4iovZPutn29RDIJtdekYIXYfkREae1o4g/MzOeUX0JHVDRCAZxVDe11bqDeDh3Av0Vnyvermam1zr/MUSzb55G9I0Q4kUnKTGFJ3v67ZmOtOjQXky20Ctkm+3Z6828Vnp3zS4KRHc+Tptqw8INoEqFuN37HPgJeh385gg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2MJex2reJYwy6qPQcHfKp5f/OMMeUIHKYyv89Bdwaw=;
 b=sW1y1Qvb/aQ1dE2bP2BmHc4yIkpvTUqI+UbTLqQ6YjSAJx2uxM7+S4ZBUIhQ2e40YtuYHTR1cRpPgwpVaY8KLMJqRz5p+oVs5ueIsmtz3nuyibHWWPHLMFxdHJK0j+zVuFX5QmQFoV1cJ5subTB00bH/fHSpwVzyPayRhK30zktpi8P8bYZ8pBOKSgZue6IN/0vekdP1k3N094XhRQMFjdK4uO+Z6ceY5y8kRKsWw5HdxNNSZFRQgNvTe/D2SI30uNWmKmIUJvCQuBbTsOG4NbRySoAohKeeLD7P3mUDsyG/rdaz9J7TzMGWqocliEDxd7MSPVCDYC2XKRyfqqGjfw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2MJex2reJYwy6qPQcHfKp5f/OMMeUIHKYyv89Bdwaw=;
 b=JDIaLwGDsRHFMWnY7GlVElf7WV2gdiO07kye42vq4Dsj5z+CM4yFUKeoBqWXjyV4yrCgv4Ex1BDXuxZz4x+Db4yycUm9UgxRY8N/J0oT/c0NAtGRqR0ifYyBELe/Px9OwScboMUrJFL8adpMQYpGyEqrgUMbUxk28gpzjwbHHnY=
Received: from AS4P251CA0017.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::6)
 by AM9PR08MB6706.eurprd08.prod.outlook.com (2603:10a6:20b:303::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 10:18:24 +0000
Received: from AM4PEPF00027A6B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::7f) by AS4P251CA0017.outlook.office365.com
 (2603:10a6:20b:5d3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.31 via Frontend Transport; Mon,
 30 Jun 2025 10:18:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A6B.mail.protection.outlook.com (10.167.16.89) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Mon, 30 Jun 2025 10:18:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NEYid/0IsqDIeN33e+0TVZiLjjfS9oIO4O1NFwktyo829wKzz2R3eoeg6Y9NCntmtf7RRvtslxag2nppkMPRsUZjnvWaayreEq2SztjP7pS7ZKDCs6Flqs4pvoBFUa07v7D0lg4aaGjaewz7o8pDjUlnZzCzc1DaRBe+ZIaNhDx7ZlXSE1YulNb4G7tVVcqGTfyBPEBztBR39ra6uzWyT/o/SMyQ9Nci9Zyh0CQ5fz4n8lxwgz8txa4gOT54JCTkIF2tEbeGoFXoOXpow5Rw9EA6hA7sRyOpKs8xdT+WtRTD9S39u3VuoQvvpKJFlzNXzwCe1/0m/KlBzekDRv77iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2MJex2reJYwy6qPQcHfKp5f/OMMeUIHKYyv89Bdwaw=;
 b=tE3rDE0gePoW6A4wr6tdmZbcHRt4SZjfSwvU3kU2gXhzoIhn7KldXMVhM+Caku1WPsHyr+slkpHnbRNiSEDh0jkDghAw4rPWjiUBZfOcC0x1oRDpVOihcdESsNlcecvDeyGaVm+yoTwPWafHb/TUlfqsLO1O1EWyXLRrR6OSlvf52pJOQonZv+5YMUuWQb1MEl/lNCT8JeI/QXVxikko14SugvS/nd2m2sXDN8KTBMdU93IbkHXibssJSWmE9Vg5AVDS4trz6Hfm6IoUkZcemCmTT14+2h4KF+pyxUyvKtq8GeUyGWHFwOjQQdgQjbpnvfzTDIVCH2xqrRTxOmjRJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2MJex2reJYwy6qPQcHfKp5f/OMMeUIHKYyv89Bdwaw=;
 b=JDIaLwGDsRHFMWnY7GlVElf7WV2gdiO07kye42vq4Dsj5z+CM4yFUKeoBqWXjyV4yrCgv4Ex1BDXuxZz4x+Db4yycUm9UgxRY8N/J0oT/c0NAtGRqR0ifYyBELe/Px9OwScboMUrJFL8adpMQYpGyEqrgUMbUxk28gpzjwbHHnY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AM8PR08MB6434.eurprd08.prod.outlook.com (2603:10a6:20b:369::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Mon, 30 Jun
 2025 10:17:48 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 10:17:48 +0000
Message-ID: <e1ce9e4e-03e2-4133-bbf6-9e0533dd13b1@arm.com>
Date: Mon, 30 Jun 2025 15:47:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] mm: Add batched versions of
 ptep_modify_prot_start/commit
To: Ryan Roberts <ryan.roberts@arm.com>, akpm@linux-foundation.org
Cc: david@redhat.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-3-dev.jain@arm.com>
 <5f2eb53d-5fce-411f-857b-2ac16295a9f9@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <5f2eb53d-5fce-411f-857b-2ac16295a9f9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::12) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AM8PR08MB6434:EE_|AM4PEPF00027A6B:EE_|AM9PR08MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: 23abb6ca-c25a-4839-7e01-08ddb7bf7175
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?L21Ob2NhUU95blFDWWhrL0s0b3lqNUxaZDhsWXpKRTIyNDFXR3FPTlpsbG43?=
 =?utf-8?B?Tit2bjByVnJhUWhzbnBPY3VaOG8rV21vck1CenpMdHd2K1dMdFloaXd1NlFm?=
 =?utf-8?B?UEU0MXd2UGFMTXMvMThreGUwZk9rdHNWbkJHM0NJM2dBeU1WRWN2c09KL1Fv?=
 =?utf-8?B?MGs2K2FGMUNLOEh0d1ZKdE9uWTJNdHlYYUx0Q2ppZWxNWHl2RU9wVk9KNDFs?=
 =?utf-8?B?WG8zMUt6UzZ2cTJheDl3S1dZREFyMi9kTEdLZFAwditPTzRGY1gxNUZndlpX?=
 =?utf-8?B?bllMMXJuUzlWalFvTGl3QmF3OU53WFBzaHJOYzd2ZUJjc1ErVGFyY1NjNnlU?=
 =?utf-8?B?V1BaL2VldXV4SmJ1UFRrZG1Ib2R2bG5veCtuKzRYNXRDemdMTStnVFk4MmIw?=
 =?utf-8?B?bXUxVENjZzNwL3VGYTA3aThGbzlkRkxsNEJZRVBCMU5sUkxxbnFHOW5JaXFw?=
 =?utf-8?B?ZHN3WlMrUGZpM1BUTi8zZkE5MnhJcG9nbFRaaU1aeW1kUjFHSHZ0VHorKzBh?=
 =?utf-8?B?dEo1YTNGKzU4NHF5dndSb2tEbVE3VW9oR3J4QmtySjlOeityMnNya1YxQytp?=
 =?utf-8?B?cmV4OUk4UTJWRms4YVlYUldtZ0VPQ1dXZG0veXNRVFk0K21CRDhGTlJBM2hM?=
 =?utf-8?B?Ny91SlljZ3Z5MzZsT3JoNUl2RjNLZmZlSUIzalRvV0VHbUdVSnRla3QwRm54?=
 =?utf-8?B?V0ZNMEcwUExmcjdkQlhCbVRGWjd1cU9raDA4OXdBcDk2QlpWbm1IOVVrMmVR?=
 =?utf-8?B?MWs5K0Jzd3lNQzNYNTFLSkhFQmhCZkMySFlHSnA2d2dwK1J5dkZ6S3BoRXFR?=
 =?utf-8?B?VXdjc3JGTURRYU5YbkZBMVlnWHVJZlV2a1lEUHhWV1NJcUw0TGNTaHIxenlS?=
 =?utf-8?B?OXZtZ0gxQW1wYTRKMGlrMWY1cDlRUDVKeTB0RWp3aEFTUWIyT0VyVXhocC8y?=
 =?utf-8?B?WmNtdlJLT0ZybGczU25ENUVta1FwZFlJd0hyT0tueWVlNElJQml1ZEhNeVFN?=
 =?utf-8?B?T2VXbnpOeFJPZEVxMUFRNkxtS29nSXdGNXVZUW5rRW04clhVd0szM1ZsRnU3?=
 =?utf-8?B?dWs2SXVsVkpYTGFiT2xQSGdKYUY3UWp4UnBiMm9jZU05a0pucEJ2Z2ZTY1J6?=
 =?utf-8?B?RGRRSzhDRHBwSERHdDBvQ0p3MkFVVHQ5ODdFY2dPNUhwNkdSNU5INktlZlVI?=
 =?utf-8?B?LzRZVUMzS1VJZHlZcGhmcFdpbFc3WStncHROTXFDMXN3Vy9EWjVFVGhLZnJX?=
 =?utf-8?B?UTljSnVCUzFkWTFtNmtQbjBMazhncER4d2NsUjExM1ZBTnNVY0t0VTd6M25p?=
 =?utf-8?B?SEV4bkJWcU1PZG42Vi9JRzdqZlVzZE1URTlhaURTQ0NDUkIybWNNVjdEMzNP?=
 =?utf-8?B?SlQwUC9xSEtaSUpLdnYzNjdiS1Y4SlNTUitaUlp3M1JLRjB1bjJTK2s5MVlT?=
 =?utf-8?B?MWxoalAzeW8vWlJ6cHBzUzZkVGo2SVJLQ1NCUHJxYWVtMy9ITnBuZEkwaEtj?=
 =?utf-8?B?VU1TdUVzaWQxR2dzSlp2RjFLaU0rVUpUV0N5aG42ZGJRWTkyUjI3dHRMbFhs?=
 =?utf-8?B?S0VBY0pHTFlZQ2FSMUxnY2lyeGhjakpERzBrZWJPRHArOHpYNVVkdEN1eENC?=
 =?utf-8?B?NmtLUVJEMnZjT05IMkk2SXdZdnRUdkFvOGFKNG5VeTRxaXZHNXE4eHZVYll3?=
 =?utf-8?B?UU5jUHlkbEJzZ3VJb0JVMnRQUWFuVndqZzJyb2tZSUQ2eFhJL2p6aVBkdWZw?=
 =?utf-8?B?dXlSTEFwZ3lvdGlnMHpWVWVPeVFIN2I2Q2JKSVBZNzFkSjR0dndCU3lTQ2o3?=
 =?utf-8?B?T1FqMFlFS2RJb0s1eHJtS1MxYkl0UjlZREZzL1pWWVF3SXdLejF5Q1JIbDVr?=
 =?utf-8?B?MWhLRHRYRHFVSmtMb3lRbzk2eHJva1RzSnBuRmNVOWt4QXc9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6434
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8b91664e-46ac-4937-9c95-08ddb7bf5cac
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|14060799003|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3ZtdFpqVk1wS2Q5dk1za2hlSEUvZjBGbVhta0pQRUo4ci83QkR2RXJtc1U5?=
 =?utf-8?B?dFU0ekZlSG1DeWxmYWRmV0p6OXYzZXgxdEV1bnBQVDFtLzJmNGM0UWlFTy9S?=
 =?utf-8?B?Ui9INmNrdnJOT05PUytRSGNVL2Nua2E0emdYaXI1bUZDcmF0RUtzK01vMFUv?=
 =?utf-8?B?NzQ5UDJnMjVzaEpSMU1DWk80Wkh1OTUrNmRpVmd3dko2aWxxemppc0RicXFL?=
 =?utf-8?B?TmpDd1hLY2p6elZGTzJoTzNoWWJjdnhDV1I1b1V6N3BiRUpGVnQxN2gxNEh6?=
 =?utf-8?B?R0tHR1M1UnpaejNZUFJLT25lRmdLVWVHdmRjSXo2NEh3VitvajVLN29pdXQ0?=
 =?utf-8?B?TXYzU3hMWEVhbWlLY0FOcUFyb3FZRDRnclJNbVVIUUZ0NWtmZklXMG82Q2Ra?=
 =?utf-8?B?VC9zcExHWHFvVG9yZlc3NmRSMXJ6SGRkNVVKWnA2TTM0YnYzUVBKbU1GcVRl?=
 =?utf-8?B?ZjFIZnJkNVVxQjZXT2M1cXdDY3oxWllwdkR6UlhaUkVJME1LZU9OSERDSXJI?=
 =?utf-8?B?cFIrNG5WV0VoUDlpb1ZvME5oU0M3ZUxBVk5WU2FyVmxJRXk0VXZlWW15R3pU?=
 =?utf-8?B?dTIwczZiWjdRSFVCeEJBVVg5aDhDODFSWHBFTHRiRi85ZXJYeVNUaHYrQnF0?=
 =?utf-8?B?QTk5cHd2WHRrUURGcGJwSzdDNDJld2pReFJIODhZaUFmMmYwY2NRaENDUkpL?=
 =?utf-8?B?dU1KV2l6OEM1dDZhYXllclpUNnA4RC9LY1hBWkdPeVM0OXVvUzhHV2pSdloz?=
 =?utf-8?B?djNyd1lKam0yeW9xTnA4dE1VbEd2b3JpUmU3ZDB2cWpHbjN0UzhwQ0lzV1ZI?=
 =?utf-8?B?VnJTcDNSRkZ5Z2IyelJXVnpKMzJSa0xNMkQwNHpjN0F4M0QrMVl5TGNDalpq?=
 =?utf-8?B?RFJrbXdvVjIzeVo0OTFMaWpYQmpQNlVIeC9hZ3VqdTg5Uno0WTFJUjhSMUls?=
 =?utf-8?B?RzFVSDNsaEFWc2hVejFKb3VtVU1NM0FzRXZPdExhd2YrM1NtcWZQYmJUNEw2?=
 =?utf-8?B?VTRwTTNhZGE0bDYwcksvTElkN3NwK0c4UHZyRUFhN3JUclFVTE44MFpDei96?=
 =?utf-8?B?MEZJQU96WExhMEFEV0hmTDRzaHMrVDFQK3oyM3FLMU9idHM4VHFkb2pXUTM3?=
 =?utf-8?B?YzROd3RTcXU0MXZybjduWTZncGJHeE1RZFEyalFVYk1TclQvZWJRem1XWmVK?=
 =?utf-8?B?SXF3ZWxnWHpqWlYwbVpQWWs4SFZCRk5vdTE2bmNNcHNnZjRuczRGbVhWSE5a?=
 =?utf-8?B?NkdhUEZwMkc4OE1FNTJWYUppSVVYdnYvWFRydDFBMjQ0MXZ6cGQ3QU5EcHBL?=
 =?utf-8?B?b3hnMjNwc0tIUlNBUDBwWVkwOEwrTVA1YVlCK0VDSlZmaFMrVWt4MnRmZVNH?=
 =?utf-8?B?MzZST05hTks5MlFGVnpLSE5Xem1aTDZQWWl2ZWdxb2l3NTdPQitaeFNSR0dP?=
 =?utf-8?B?Q0lNSG5WM3RZVGNsYkhJbXR3L1NzcUtnMDVCb2pvV2N5N29vZjd5dWlsTWJF?=
 =?utf-8?B?aUpIUENaaE1TVEZaeldRZ0xkaHBJdWxkU1BhN2ptTmZOcTNXMGpmUVNrUDhY?=
 =?utf-8?B?endRVk9ZSmNLaEprTWZOVlVKcS9oSXhvcDNKV0RjcDJJUUZaLzdrWDdYVUdG?=
 =?utf-8?B?WmJqeWNBekRmYU1vNlZVUW1VcUVBaC9hVmJydEtPSjl6Z1M4RFhrczBSKzFy?=
 =?utf-8?B?WEZQSGlaQWFJZXo4dUtXUjFhcEoyaDJJdVNrNVdBSU9HK2F6cTNCbFZldldj?=
 =?utf-8?B?UU9kV3I1M0wrcEg2NGU1V0MzSXc4MkN1cVNkaXJOWWlCb3ZkcWxsUUd3Mm9W?=
 =?utf-8?B?WnRtRHR3TDY1eDRrUFQyQ0V1ZXFaNERicVVBZmprTjJweXJBdmcwZ0NsSmVZ?=
 =?utf-8?B?UzRWcHFoZUZtSFQzaXU4MnJnRVM2aDVrSDNKNnJDbTJFY2pCVTMzUDZyaEox?=
 =?utf-8?B?ZjBpRG1VOGE4T1k0UWhhU3F1U214VjhrUyt3aG9hOGhwdFpFSXljdXRrdTlS?=
 =?utf-8?B?bTcrNllTNEtnNlRoYm1pa2Z5YUVJU0JhVk51Y3I1TGx0YjlDVVRJbndUUUhV?=
 =?utf-8?Q?ZJb9J4?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(14060799003)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 10:18:22.5695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23abb6ca-c25a-4839-7e01-08ddb7bf7175
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6706


On 30/06/25 3:40 pm, Ryan Roberts wrote:
> On 28/06/2025 12:34, Dev Jain wrote:
>> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
>> Architecture can override these helpers; in case not, they are implemented
>> as a simple loop over the corresponding single pte helpers.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   include/linux/pgtable.h | 83 ++++++++++++++++++++++++++++++++++++++++-
>>   mm/mprotect.c           |  4 +-
>>   2 files changed, 84 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index cf1515c163e2..662f39e7475a 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -1331,7 +1331,8 @@ static inline pte_t ptep_modify_prot_start(struct vm_area_struct *vma,
>>   
>>   /*
>>    * Commit an update to a pte, leaving any hardware-controlled bits in
>> - * the PTE unmodified.
>> + * the PTE unmodified. The pte may have been "upgraded" w.r.t a/d bits compared
>> + * to the old_pte, as in, it may have a/d bits on which were off in old_pte.
> I find this last sentance a bit confusing. I think what you are trying to say is
> somehthing like:
>
> """
> old_pte is the value returned from ptep_modify_prot_start() but may additionally
> have have young and/or dirty bits set where previously they were not.
> """

Thanks.

> ?
>
>>    */
>>   static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
>>   					   unsigned long addr,
>> @@ -1340,6 +1341,86 @@ static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
>>   	__ptep_modify_prot_commit(vma, addr, ptep, pte);
>>   }
>>   #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
>> +
>> +/**
>> + * modify_prot_start_ptes - Start a pte protection read-modify-write transaction
>> + * over a batch of ptes, which protects against asynchronous hardware
>> + * modifications to the ptes. The intention is not to prevent the hardware from
>> + * making pte updates, but to prevent any updates it may make from being lost.
>> + * Please see the comment above ptep_modify_prot_start() for full description.
>> + *
>> + * @vma: The virtual memory area the pages are mapped into.
>> + * @addr: Address the first page is mapped at.
>> + * @ptep: Page table pointer for the first entry.
>> + * @nr: Number of entries.
>> + *
>> + * May be overridden by the architecture; otherwise, implemented as a simple
>> + * loop over ptep_modify_prot_start(), collecting the a/d bits from each pte
>> + * in the batch.
>> + *
>> + * Note that PTE bits in the PTE batch besides the PFN can differ.
>> + *
>> + * Context: The caller holds the page table lock.  The PTEs map consecutive
>> + * pages that belong to the same folio.  The PTEs are all in the same PMD.
>> + * Since the batch is determined from folio_pte_batch, the PTEs must differ
>> + * only in a/d bits (and the soft dirty bit; see fpb_t flags in
>> + * mprotect_folio_pte_batch()).
> This last sentence is confusing... You had previous said the PFN can differ, but
> here you imply on a, d and sd bits are allowed to differ.

Forgot to mention the PFNs, kind of took them as implied. So mentioning the PFNs
also will do or do you suggest a better wording?

>
>> + */
>> +#ifndef modify_prot_start_ptes
>> +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
>> +		unsigned long addr, pte_t *ptep, unsigned int nr)
>> +{
>> +	pte_t pte, tmp_pte;
>> +
>> +	pte = ptep_modify_prot_start(vma, addr, ptep);
>> +	while (--nr) {
>> +		ptep++;
>> +		addr += PAGE_SIZE;
>> +		tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
>> +		if (pte_dirty(tmp_pte))
>> +			pte = pte_mkdirty(pte);
>> +		if (pte_young(tmp_pte))
>> +			pte = pte_mkyoung(pte);
>> +	}
>> +	return pte;
>> +}
>> +#endif
>> +
>> +/**
>> + * modify_prot_commit_ptes - Commit an update to a batch of ptes, leaving any
>> + * hardware-controlled bits in the PTE unmodified.
>> + *
>> + * @vma: The virtual memory area the pages are mapped into.
>> + * @addr: Address the first page is mapped at.
>> + * @ptep: Page table pointer for the first entry.
>> + * @old_pte: Old page table entry (for the first entry) which is now cleared.
>> + * @pte: New page table entry to be set.
>> + * @nr: Number of entries.
>> + *
>> + * May be overridden by the architecture; otherwise, implemented as a simple
>> + * loop over ptep_modify_prot_commit().
>> + *
>> + * Context: The caller holds the page table lock. The PTEs are all in the same
>> + * PMD. On exit, the set ptes in the batch map the same folio. The pte may have
>> + * been "upgraded" w.r.t a/d bits compared to the old_pte, as in, it may have
>> + * a/d bits on which were off in old_pte.
> Same comment as for ptep_modify_prot_start().
>
>> + */
>> +#ifndef modify_prot_commit_ptes
>> +static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
>> +		pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < nr; ++i) {
>> +		ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
>> +		ptep++;
>> +		addr += PAGE_SIZE;
>> +		old_pte = pte_next_pfn(old_pte);
>> +		pte = pte_next_pfn(pte);
>> +	}
>> +}
>> +#endif
>> +
>>   #endif /* CONFIG_MMU */
>>   
>>   /*
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index af10a7fbe6b8..627b0d67cc4a 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -206,7 +206,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   					continue;
>>   			}
>>   
>> -			oldpte = ptep_modify_prot_start(vma, addr, pte);
>> +			oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
> You're calling this with nr_ptes = 0 for the prot_numa case. But the
> implementation expects minimum nr_ptes == 1.

This will get fixed when I force nr_ptes = 1 in the previous patch right?

>
>>   			ptent = pte_modify(oldpte, newprot);
>>   
>>   			if (uffd_wp)
>> @@ -232,7 +232,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   			    can_change_pte_writable(vma, addr, ptent))
>>   				ptent = pte_mkwrite(ptent, vma);
>>   
>> -			ptep_modify_prot_commit(vma, addr, pte, oldpte, ptent);
>> +			modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
>>   			if (pte_needs_flush(oldpte, ptent))
>>   				tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
>>   			pages++;
