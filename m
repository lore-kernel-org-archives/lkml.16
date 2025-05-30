Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011022.outbound.protection.outlook.com [52.101.70.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259891D9663
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.22
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748601788; cv=fail; b=AuuuzD81CrxkJ4HSlHLShI6DDAOTa3UViHKtUD2aRjp6tmRPzFatFlvgTqrRBTCEyLSfovEqJsCHNqxgPet+I3sUij8jx2Rq5BYskWGjh/EWsgZ7FcqPvsMknr39mLSj3Da/jtFeKXAdfnfgmihxvQX2dPW7Yr6rWeWXX9bcuvU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748601788; c=relaxed/simple;
	bh=sSlo3a0TyxWmi9Z9+f/cTPlQVUsSPzeB2JcnkntBsJ0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mPQQr+upDy8hurcnsCZYmkQKzhc+zyWh98ZXsbAgKqTHwKKMTmW82CXe/VHK0jhKrHEP0Dv5jzVp5LSoYmj7Qp0DtXasAIDydq1V9lNa2hG/lMiGrdlUcufh6tPHuV/BcP9hJVxLOsWYzYcsi4MItX/y8+JtaErXVuspppA3w6s=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GUM8sjWa; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GUM8sjWa; arc=fail smtp.client-ip=52.101.70.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GUM8sjWa";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GUM8sjWa"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cOhBtrpl6csguYF2Pz9ILCndXl2mgF2NI94y/mOIC/2kPdUrh7wcwV4jQW+ArxJ4Tr0UPP0QrNYUA6RZwSOEfkEXQC7x/iDKVLQYMiAe1PGCgCgQ0ndbcP4kJTz4ynCDfvYQBEabV9uiknQ4PNr6XveGOGNECXpZ7E9bmChK0uOppvK3mZ4beyJu4mChqKv+LFyHMi55bos/LXfkF6FwxJ2DCH8zQxsOsala+7F2q/tN75tb0D/AvDmclAzOSBbyck4K2g7PZiMXQpmUHjmL3/Aar62fe9CKaKPYFVkG5fXLP2nJ+M5vMSS+LuQy9x4dpy720FZU3CgG2bjlu/GoBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqFxlcaFWYhpcgY321gjK3lQY3Y0bykJ9pifXWeGPMc=;
 b=oh9dCnSfnUqDUb2PlNVCm1WK6W2bx6BvVCUy3pni/cpHE9uskjX303klMk8dylidiNbohS1r613hSbn/GYZiaWfhKK9WtCCyc3ropFin1jV8/F3C6KBgpUkkB8yOtWS+QQMN5Fo9g1N4JkTop+XMhfqjGxR6lSaP11aaVEp+F7ms/PBx5gn3iIrR8kb22LQBnQ2NWPJ/w+yixRGTJw3jsmt2ESMU2+RwVRGHvM9y5GMiwgFcxsFTpxRzVBSn3hr320SqEISM3wM/GVeXGDJ9QzEGhsyboUnR9YHZd8zl2Q6/MI1MwCSrTeCV0E2diXKaO7oKNGMUTLevJRBfKV1TfQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqFxlcaFWYhpcgY321gjK3lQY3Y0bykJ9pifXWeGPMc=;
 b=GUM8sjWaMyjD6xRZIux2lwFSDdsO1paBcbI8tBk6STo4zl4byvwCzG0Wh0kh/ybfE4Kbd+cDEmVFTcgcOGu1QKmh8SB5JmIwbg2onqoCQ5P2H+X7LQ+VeSk/OcxX6nlCFNDjMNclenZOwC28gRueBBwMowZ2waiiPsoJWuY7gwU=
Received: from AM6P191CA0035.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::48)
 by DU0PR08MB8929.eurprd08.prod.outlook.com (2603:10a6:10:464::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Fri, 30 May
 2025 10:43:02 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:209:8b:cafe::85) by AM6P191CA0035.outlook.office365.com
 (2603:10a6:209:8b::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.22 via Frontend Transport; Fri,
 30 May 2025 10:43:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Fri, 30 May 2025 10:43:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFrRWalvxRyxjrwyysgyk3u3XsgWSMWEQgwTHogd1VCX/QD12lTCyNOcX6TPrJPa4YFlvn2b3i9fPfl7UNzYjQsZ1iBvLdVtqDduJHf5UE2vtf/XxKIIqxlgh395iA0+RbKNPX9TPH6bn5Q7h0KrFOvObmTE0jN0lJ8LTAp2Vx1dsDFvn+dp9fBEvVzILlRgQwjbzfGUNpBo4WNpdKhf/G4PsX1pMaVDdzDNK9V9s9tKYlm8JjB/a8d8iLkmvpHsRDsbQaGLQ40s1+F3vsTszxk7Op5hNOERtZ641YKwslwTc2W8w4PvYbgZYq8IfogYEO1pMCmwJ54OL30JVgUXSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqFxlcaFWYhpcgY321gjK3lQY3Y0bykJ9pifXWeGPMc=;
 b=yOUgDNGA8UCrQq0KwqLvYY8oMtIi6YwV241NhMH2OXFqSK13KByC8NVzLX45YkUZVjWTx47gCtBnHHuolUIjQ7boVuz80yx0pe99PcEd9w+JLjePCJT2hrMO91UVEVT55zNysZgoVOq4Dcu0RsppfaglsJyQ+vgR2b+tXHXYhz494lYJnWu0hsNEeps67lb6BdaUhBxzWLfkfT++QIJq5AYnyDu2OBxcQGhFcq3zf6QOTuv+cvFya6IsTOpqjjZG8gABOj0OtoVPlQ+L7BLt0u2pOClkNEkztiYP4vxHs9+4Tv5nrKdv6nKbwsnvCXqI3tD8TZDDFmgQ5GavYSUUZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqFxlcaFWYhpcgY321gjK3lQY3Y0bykJ9pifXWeGPMc=;
 b=GUM8sjWaMyjD6xRZIux2lwFSDdsO1paBcbI8tBk6STo4zl4byvwCzG0Wh0kh/ybfE4Kbd+cDEmVFTcgcOGu1QKmh8SB5JmIwbg2onqoCQ5P2H+X7LQ+VeSk/OcxX6nlCFNDjMNclenZOwC28gRueBBwMowZ2waiiPsoJWuY7gwU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS2PR08MB8925.eurprd08.prod.outlook.com (2603:10a6:20b:5f8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Fri, 30 May
 2025 10:42:29 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 10:42:29 +0000
Message-ID: <6f8d893e-ddb9-4416-979f-eca3b0f9fb5b@arm.com>
Date: Fri, 30 May 2025 16:12:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Enable huge-vmalloc permission change
To: Ryan Roberts <ryan.roberts@arm.com>, akpm@linux-foundation.org,
 david@redhat.com, catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org
References: <20250530090407.19237-1-dev.jain@arm.com>
 <adfe981a-ec9a-4051-a26f-91b691230161@arm.com>
 <381fec11-0e05-4bf0-9cd8-f272fde7558f@arm.com>
 <090440b6-9501-4f29-8b9f-1f6e6f3a6fbc@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <090440b6-9501-4f29-8b9f-1f6e6f3a6fbc@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::22) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS2PR08MB8925:EE_|AMS1EPF00000040:EE_|DU0PR08MB8929:EE_
X-MS-Office365-Filtering-Correlation-Id: 863083f0-1823-4c9a-8081-08dd9f66bfc0
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?QXZEQmFZOTVFaCtabzlNOXhCYzJ1QVRzcGFvcXpWcGYyWlJ3ZDEwRkw3SGto?=
 =?utf-8?B?b0ordnlNdFJic2tMcWRQT2IzOVUvMW8yVEVuYUQ5TDBHbDIvbEdsSUdCb0Y1?=
 =?utf-8?B?dnJiR01jNzdQNHVDcDFFVHBkc0VYMjJrd0F4WldrbkNNNlYzOTBCUHBWVHl6?=
 =?utf-8?B?NTBQWXpkR0NBMkpsMEFUNStaVlgrczF2VHEvcjRPZ0YrTnpQSERzSU5Zdzhi?=
 =?utf-8?B?Zmp1YU5sY0pJLzQrc1ZTOE9icFYyL01Oc0RrNjEwWTNEK3FRRytIVjdaT1dD?=
 =?utf-8?B?TDdXUURCbUxXczdyZFB5TzZ5c2owcEdmcHNCOFp3NVR6WXhlazc2WXg3UWxK?=
 =?utf-8?B?eHcwcXlLYXhJTlBDTkFacStsL1NHTXhjQUJ1SGwvcDhIcmdDbzdSYUpFM0VZ?=
 =?utf-8?B?M1lRbTVTZkplNkpFMVd5NHN1MlBrL29pSkIvVi9leUQyWGd1OFlTNkNvNjVT?=
 =?utf-8?B?MmZPbkFIMGU4L05NU3NXSmZjSVl0U0lHM1YwRllYUytvNkJUN3ZsWmRjdEk1?=
 =?utf-8?B?RmRFUjBmZmszMXZqZXdNSVd1c3Z0aFdGVXdZc3JtT3ZvUGdKVG4vZWhYWGN5?=
 =?utf-8?B?RStYV2xqNTBHSDNZYkoxZnd3RW5VSFR5cUJrQXkxMHlKVFU4NGhhK01JQW02?=
 =?utf-8?B?bzRJbHNQNStPS2J2bWpNclhZbTNCd29sQ3NSWEx4RCtyaHpvTlc1bXQ0dFVM?=
 =?utf-8?B?MGFZa0dEZnMxNDRqVHU2aDkxdU1SUm5wbjVDbFBGY25lUFpKQ2d0bDJSOUJ2?=
 =?utf-8?B?R1g1d0NNeTRySlFSc2ZYSnVTR3E3QVhmbk85N1c3b1BJYS9LeVpEWDhsMlJi?=
 =?utf-8?B?RjduSDRhdWIxVzc5QlZ2SkFwV1dIazJSdlAxK2RuS1hDa1dhanR3by9xdkxq?=
 =?utf-8?B?M1FycHhkMWFndjhNczI0eEI4SHRzLys1Z0l5WjRVSjY3VW5xcFNHYUUxYkJF?=
 =?utf-8?B?MEowdThmWmFvcGxpaFh2VDFQY1RXWk4rVmx6anpMWFpJb2krQjRRQlhCU3FG?=
 =?utf-8?B?NDd4Um9LTVFIRnhoS2ttQVdrbDVCS0xUbjkwZXJ3cTNyKzRzcC9PS0I3QWsw?=
 =?utf-8?B?U09BK1NlVlpqRkRZVTdNOFFaK3dYRllyZndMbkxCc3hKN3FyS2V6TSs4SlhE?=
 =?utf-8?B?RzNyNkdpT3JFSjY3d1orWnUrUHZtNnNVbmRzRGsxOFlsczFJTE5EdEI2ZmxZ?=
 =?utf-8?B?MldKd0oyTWRnNDkzYnpxNzQzbnB6aUJyeXRVVElWb1pGelhGQllPWUJiQ01E?=
 =?utf-8?B?ZEFSQjNiTlFEejVvRUZMbjZ2QnJHSSthU3R5K0xCRzB2a3JialFIK0hsZ283?=
 =?utf-8?B?WFo2NktlWHd2VEVoNzFpbGJIdTNxQk04K09xQ2VsNHB4aGpsMlZDbkxYOGhQ?=
 =?utf-8?B?cS9LcUF0M2F6NDN6YnNGUjJ5Q09aUHNSSnlZcVBqeFU0YlMyU3pHZ09rVXBj?=
 =?utf-8?B?bkV2VEFCd1lRUko1eEFjRW9JNHE4TkZONTl3bnVVOGtxVTlBS2p0a2FUYWE0?=
 =?utf-8?B?ZVIvNkNvRVZXUHNjWVlDVmludEM3WHJhSEw2bXFkRzJZYnN3Vkpwam1XRGRR?=
 =?utf-8?B?ZDd2NnVOakFLYytKNWZHZzB6TmJ2V1ZTWUFDV29JbEx0NmhWcmFyMHdxRm1T?=
 =?utf-8?B?UElsS0t6Q3U4emNnZTZQbzJIdTRrTG5mVGI0bEtxcXVNY3FZNm1haVZLd25E?=
 =?utf-8?B?Z0VBdVNGcnNLZVVFM2Z6M1BOWEI5UFdVN005NndZbjJpQlhHVlpWZUpoQWht?=
 =?utf-8?B?TkpFQldQUXFZdURSOVZ4bUxJSTRjbDZWb1ZqbmJVNDdvYUZzZ3FqdlVQVHZ3?=
 =?utf-8?B?ZHJwaXB3dEZhZzUrdmlteVVlTDQvb1J6eGZRb3p4Ry9tSGZDNmYyNFFOTWEw?=
 =?utf-8?B?Y0lucWNsaWNZWmVqUDZxU29rUWxXYUhSU01pdzRWSGIrNnVKVlBrSm5XWDY4?=
 =?utf-8?Q?MRHPvLNJwUE=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8925
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	44253bc9-4a68-4feb-e88b-08dd9f66ac8a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|7416014|376014|14060799003|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVRnQi93RGZPZE1qOEY1dytueERsdVFNNUlDeUo0Ykd6djZpRU9MRkF6WklQ?=
 =?utf-8?B?NnlOSC9MSzNBbDBGMDNKUnpvdmEvWFUzdGhaMTVlNXhzTFZNbkJZSFRJK0JF?=
 =?utf-8?B?ZkhVVEtzbERZQ3o2cFF4cGxxVHhnTDI0R2dyVTNnNDlGbnJUV1prTFhqSGF1?=
 =?utf-8?B?MFBaZFdEMmtlM1BRNUNPUUgyRnh3amg4Zk8rQU82OHg5SGNrZlBVWlJRZUY3?=
 =?utf-8?B?Wjh0RkxsdGZIakRibE9nTEhZZ2NWNWE4akVkZlBxZWVpOFZNbGltZ09MUFZU?=
 =?utf-8?B?c1E5T1NHbWR0T3ZCektpSk1JMURjMGlBS1pQZ1RXUk93VFYrY1g1L0JLTFRV?=
 =?utf-8?B?SmVmV2FsaVJaWGJRY016SkhYZWFWZE1lRlhHTkI2THc4L3hlZW5lWFhQbXBG?=
 =?utf-8?B?TGRtS1MvbzVSckZkUzdyUW84MGQyOTdCMk1UNFFsdWJpQldhekZJRlJ5OGpK?=
 =?utf-8?B?K2lMeFhueHpIV09YTVMvM1NXSUUyVXA2M3R5czdFdnRLbDhSVU1sMHF6YzNn?=
 =?utf-8?B?MWxTcXd4Q0pGSUpHaEhhZ3l5QzYrQnhoaDBCU1RRY2FvUkRHMEdITk54R0lX?=
 =?utf-8?B?Z1NXblFleEVZSXlEandpTEdRdzZRRnV6UWxuaW1YalpicDViQW9BR3pmaDZK?=
 =?utf-8?B?NTFiQ01qQmRodVEyaEsxdHY5bktXMTlSaFRpdGZlQ3BnOTlTM040b3J3Y2hx?=
 =?utf-8?B?MkdtMEJjZ25Xdkd0Q1h6RnVidENPbmpFOTNhc3NqbmwyYVF3dThkM0JRWERK?=
 =?utf-8?B?VlRqbG9jK1hXSndUMFJ4TmZEM0RQWHB3YXVSbCtpUGJHWFcvV29uOUVxQzJB?=
 =?utf-8?B?NWgyN3VzbDhpN0Z1VVlpME9jODBiZXUzQXo0cVZ2QzFmSEVkNFhXcjc5QWpT?=
 =?utf-8?B?ditCWDdlSVduODQwUG1aL0hqeVRFRmd1OE00UCtSd2lnNDduWEs3RzJpM2d6?=
 =?utf-8?B?SSsvR3RuanlOMUFKVjJxT1c0ZHhVSzJQZE5DeDR3QklBOVlGWXQyTUM4YStQ?=
 =?utf-8?B?dFl5WW0yVkVHK2g2d1NObHRDM2s5blY0Vko4NmxIeThJejA0ZHdKTHBQN3ZH?=
 =?utf-8?B?ZVZmSXd4VDQzbmxpY0cxMDNlQlc1UWpTQlV0bUZ1aFM3SWREaS9VMEF4MXN2?=
 =?utf-8?B?VklwVmJyU2FXYUZJQngxaEdrQy8xSUlaaFpuaFlkMzJUeExxNUYxcEdMWVVn?=
 =?utf-8?B?dzQzRXM0L0RZZGg2ZzFCcGxjZ2RtRDNteG1hZG1Qa1J2ZnlGYXRmc1Azd0dM?=
 =?utf-8?B?OEpKVjU3SS9sWGJSVHk0MlFGWCtrVTJMeG5UWHBBeVNWclhPUHhzeXVEd2F0?=
 =?utf-8?B?OGg2dDZ2bUtHYlU5eU84Y29FYW9adGJzMG9HbXF5R3BuNmphb3R3a1RaNll1?=
 =?utf-8?B?SkRDWVVreVMydm9BQUZka2pLVEVoNEswR0NYWjhxeldBREJFWHNuWklHTFp5?=
 =?utf-8?B?Q29OUHlKUUhHb0RlNm9ZTEhVUU9HL1hYNEh1eVJvS0hxOHRLVytzYnNYQWN5?=
 =?utf-8?B?R2grdXByODllWDNyMmI5TkRYMFEwMnBjWWlwZGEycmY2aGl3NmhPbGZFKzVI?=
 =?utf-8?B?ekdOOXA1bzNOYTdrY2ZsR2EreDdnNzFwZjIwQnJKN1JvR1ZOdGJHQjk3WjdX?=
 =?utf-8?B?Y1dVeExvRmg4Tys0R0xtQmMyVVhLRE9XL0Q0c0w1SVd5SzhhZGRIRU9rYWJl?=
 =?utf-8?B?MEVUdWVFbGdRSTBDanl4c3dLUUt4b2hvTXhKdzlmWHNteGdwOUxvYVo4NzB5?=
 =?utf-8?B?YmcxaXV0cmMwUGgxOERvTlRxbERjK09iWjFhY2RjNFN0OUFMZ21MQkE5NWtP?=
 =?utf-8?B?L25GWjFTSzJnbmIzUVlEK0xpVW5nd2xOMWlKK0lJTHVGQ3AwUnA0d3YrUUFB?=
 =?utf-8?B?QVFZaXhoS0Vxb3p3OTVCOHI1ZjFXRDNVU2w4VTVMOXo2MUd5NEExandpRWdH?=
 =?utf-8?B?RERWNk92UzVJVURaUVpuU2FwVEtTbEt4d09aOVpBVVBtOCsybzFvRjZkNU9Z?=
 =?utf-8?B?SGFtWXdTdmVrdGF2aUZWejlRdlduNit2bFJRUnB5YTA3L0pGdnpxL0sydjFw?=
 =?utf-8?B?d3dQSlZtRndJdHdXTm0vaFRmUVRWeGsxRUIrdz09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(7416014)(376014)(14060799003)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 10:43:00.8140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 863083f0-1823-4c9a-8081-08dd9f66bfc0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8929


On 30/05/25 4:07 pm, Ryan Roberts wrote:
> On 30/05/2025 11:10, Dev Jain wrote:
>> On 30/05/25 3:33 pm, Ryan Roberts wrote:
>>> On 30/05/2025 10:04, Dev Jain wrote:
>>>> This series paves the path to enable huge mappings in vmalloc space by
>>>> default on arm64. > For this we must ensure that we can handle any permission
>>>> games on vmalloc space.
>>> And the linear map :)
>>>
>>>> Currently, __change_memory_common() uses
>>>> apply_to_page_range() which does not support changing permissions for
>>>> leaf mappings.
>>> nit: A "leaf mapping" is the lowest level entry in the page tables for a given
>>> address - i.e. it maps an address to some actual memory rather than to another
>>> pgtable. It includes what the Arm ARM calls "page mappings" (PTE level) and
>>> "block mappings" (PMD/PUD/.. level). apply_to_page_range() does support page
>>> mappings, so saying it doesn't support leaf mappings is incorrect. It doesn't
>>> support block mappings.
>> Sorry, again got confused by nomenclature : )
>>
>>>> We attempt to move away from this by using walk_page_range_novma(),
>>>> similar to what riscv does right now; however, it is the responsibility
>>>> of the caller to ensure that we do not pass a range, or split the range
>>>> covering a partial leaf mapping.
>>>>
>>>> This series is tied with Yang Shi's attempt [1] at using huge mappings
>>>> in the linear mapping in case the system supports BBML2, in which case
>>>> we will be able to split the linear mapping if needed without break-before-make.
>>>> Thus, Yang's series, IIUC, will be one such user of my series; suppose we
>>>> are changing permissions on a range of the linear map backed by PMD-hugepages,
>>>> then the sequence of operations should look like the following:
>>>>
>>>> split_range(start, (start + HPAGE_PMD_SIZE) & ~HPAGE_PMD_MASK);
>>>> split_range(end & ~HPAGE_PMD_MASK, end);
>>> I don't understand what the HPAGE_PMD_MASK twiddling is doing? That's not right.
>>> It's going to give you the offset within the 2M region. You just want:
>>>
>>> split_range(start)
>>> split_range(end)
>>>
>>> right?
>> Suppose start = 2M + 4K, end = 8M + 5K. Then my sequence will compute to
> 8M + 5K is not a valid split point. It has to be at least page aligned.

Sorry, so consider 8M + 4K.

>> split_range(2M + 4K, 3M)
>> split_range(8M, 8M + 5K)
> We just want to split at start and end. What are the 3M and 8M params supposed
> to be? Anyway, this is off-topic for this series.

I think we are both saying the same thing; yes we will split only the start and the end,
so if the address 2Mb + 4Kb is mapped as a PMD-hugepage, we need to split this PMD into
a PTE table, which will map 2Mb till 4Mb as base pages now.

>
>> __change_memory_common(2M + 4K, 8M + 5K)
>>
>> So now __change_memory_common() wouldn't have to deal with splitting the
>> starts and ends. Please correct me if I am wrong.
>>
>>>> __change_memory_common(start, end);
>>>>
>>>> However, this series can be used independently of Yang's; since currently
>>>> permission games are being played only on pte mappings (due to
>>>> apply_to_page_range
>>>> not supporting otherwise), this series provides the mechanism for enabling
>>>> huge mappings for various kernel mappings like linear map and vmalloc.
>>> In other words, you are saying that this series is a prerequisite for Yang's
>>> series (and both are prerequisites for huge vmalloc by default). Your series
>>> adds a new capability that Yang's series will rely on (the ability to change
>>> permissions on block mappings).
>> That's right.
>>
>>> Thanks,
>>> Ryan
>>>
>>>> [1] https://lore.kernel.org/all/20250304222018.615808-1-
>>>> yang@os.amperecomputing.com/
>>>>
>>>> Dev Jain (3):
>>>>     mm: Allow pagewalk without locks
>>>>     arm64: pageattr: Use walk_page_range_novma() to change memory
>>>>       permissions
>>>>     mm/pagewalk: Add pre/post_pte_table callback for lazy MMU on arm64
>>>>
>>>>    arch/arm64/mm/pageattr.c | 81 +++++++++++++++++++++++++++++++++++++---
>>>>    include/linux/pagewalk.h |  4 ++
>>>>    mm/pagewalk.c            | 18 +++++++--
>>>>    3 files changed, 94 insertions(+), 9 deletions(-)
>>>>
