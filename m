Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010055.outbound.protection.outlook.com [52.101.84.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9C7AD5A
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.55
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748363017; cv=fail; b=LlZUI1GYY9BW0xyXhG2HOfWs7Xe7LVytOraD+jLgewoLZPUNxrcLC4h9DGimmFdVONy35qvzufoe8OCcUZbP0+cWc3HDjjqYJtShi7klQDBMGuwaywul3CzhtphVgEaiZBFHCpk/ZVxdEnjL/48hpTJYFMebMuvNfkuUVBhK0mw=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748363017; c=relaxed/simple;
	bh=zHlt7ctU5dx6U6kTWn+P/Xb08lk7Iv5InODoFRafekw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mk0jde/v1XycEzoLfoKy9N0NqZnKNOrQ9XsT/e2MlWVCdWwzdWApKOfGwuSxNvllQNfbtGZ/8RJNWSqaQuPqTPl2VTloFWstmE27xHOlAGXHZeISWTNGFs3t7fB5eoC2+6rqrpm3GsvSHcJQ+B46CWfzSp/0V4zvJRxK11GOjaY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gzP63B4e; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gzP63B4e; arc=fail smtp.client-ip=52.101.84.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gzP63B4e";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gzP63B4e"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=P/NgaxrB05r9Aq/U6tZWx80mGQfeEhk+76CvcDwLkAqYBVYPrlUfLpmAuwJOwZbSxzcS/SpCP9FBk4FXePJBBG+VR+4hK5U20LDt0pxzwrEd9EV3RSyD+koq2gcx31/D9q6UWdCDRXUlf4vZFbHSLv9ynb3+KM3FqGLAKoS3unJH3DL3vb+LyH2eoGcQRLywJyN+Jjcl6DuYhzb70h11srE25BGKIa3oEN0DgPUWIt4VU/jTKYH2hpl+AohLXp1cWwqeCqJChlHSlG/9MQnp5vsNrRodbLGjR2ttAbcXg23LElHT57S6z+rwPQXKr36MgIIqopIEYwvnAAcVL5pX0A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oC8XIMhDaM9AfD/UZBajELr+J+5lf779x3c4MqYP5P8=;
 b=ChOdPv2dRU5B0rgjQY9i5oqvF+ynOTyuLWPGzS+Kg+cxe3fAsBi+MuEd83iEYuHlrSIlWm2FwkMeu4TMLhlQv9dgQb3rUOPcdzCJvBu184Lqw0OAmSf7qWYczojIamJWHIZL6UnPWCX3KSLHlEDF5I0xKueLdbim8dBFP3K+5ggdLa48A82wzp2Czq6tmsID5KJ54wmA8LMOhQpOvUD7Srmj76jgAh97+BE4JtFT5/QC1QPpAH9lGg0PELcI29idvJcq0iqbH6t+oKgclsm5Occ1Qus6+kYNGjdOHa46AjoHBvCzf4S7qCNkTOQFFHdBWS0gKhELyQAhchNXBcnbpg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oC8XIMhDaM9AfD/UZBajELr+J+5lf779x3c4MqYP5P8=;
 b=gzP63B4eOTwkjztioZXOG4aQkLbxABNFSee2yAee9xOrIIKXiDLKU5VpnaarLTpgpX79HYM1cYmFj/1rsHGTxunI+2cgjwi2tTpjGyeHP34vw6QH6H50UuHEPGHsR8KmTmj/phYDVlQ5LFcLd/ZmsAwGD86T5bKANu8nMRQbubc=
Received: from DUZPR01CA0073.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::11) by DU2PR08MB10188.eurprd08.prod.outlook.com
 (2603:10a6:10:46f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 16:23:30 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::7f) by DUZPR01CA0073.outlook.office365.com
 (2603:10a6:10:3c2::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.24 via Frontend Transport; Tue,
 27 May 2025 16:23:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Tue, 27 May 2025 16:23:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1FRnXg55kunm54RIXmpoRyPUIl4wgE6Gho+aQ6Qw7yYENKaQkavBd/LDeuLBe/8/n7iVVz9WUrnzsjMZBtJXkAujxS5+CiV4b780ApPHRuO4rnAp9CbT7NaaHr1HhfI5wRIzacXmNhANqdD0c+eR0Q3EPeYEcFOj+vxDBTo2GMlHoIw9kiQoBYyl15qG6MzYP2lwyUh3pCR0cvB4D60IdGdmhYJkblWsy7UVIkbmU+M4XPg1GAAh2fdvmWB2abIsHIkMLeg0DmNQzVHPbCm3hhAVFcV5n5zvdXPZsbs8X5QxcfiapeVjI8qN4ipFFY5iB0VpOQfk9vr8+sOvys3UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oC8XIMhDaM9AfD/UZBajELr+J+5lf779x3c4MqYP5P8=;
 b=a4SDp3syFuEYj/u9TWE1hkkkjO2XyTU+tFW+qfyQKjC0S3trHqxe/wnbXpdeVqP0D3T2oDcvtaQiMLPa6A2ijOXngLGc26DBfE3Gfn12ekKQooZUfZXTD/Y6BcfzGqX5W3VMLmdXfwDI7xFpy++rh1qKO4vL21fhLEtMeXhK2HgjRwaqK8QcwdcnF/5Kil4z4o2a5sSzz+3AyblpiQze4wKLzoMV3qGgoAfnJicWpl/yne/nZA3NaVHeyELOUALfeWFp7Hff8IGAVXJbgVZZwMo8dLyJFTwtJFRGDVtu7V83MhXu8VHsc+s0X0Bweth7d176m0JsUSeRybCY8ApmMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oC8XIMhDaM9AfD/UZBajELr+J+5lf779x3c4MqYP5P8=;
 b=gzP63B4eOTwkjztioZXOG4aQkLbxABNFSee2yAee9xOrIIKXiDLKU5VpnaarLTpgpX79HYM1cYmFj/1rsHGTxunI+2cgjwi2tTpjGyeHP34vw6QH6H50UuHEPGHsR8KmTmj/phYDVlQ5LFcLd/ZmsAwGD86T5bKANu8nMRQbubc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by VE1PR08MB5854.eurprd08.prod.outlook.com (2603:10a6:800:1b0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 27 May
 2025 16:22:56 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 16:22:56 +0000
Message-ID: <422a63ea-9211-4e4b-a37c-8d4c5e964b53@arm.com>
Date: Tue, 27 May 2025 21:52:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] mm: Optimize mremap() by PTE batching
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
 ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
 maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
 anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
 yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com, ziy@nvidia.com,
 hughd@google.com
References: <20250527075049.60215-1-dev.jain@arm.com>
 <20250527075049.60215-3-dev.jain@arm.com>
 <3d5d5813-7764-4667-937f-cec52f8b03c9@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <3d5d5813-7764-4667-937f-cec52f8b03c9@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::21) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|VE1PR08MB5854:EE_|DB5PEPF00014B90:EE_|DU2PR08MB10188:EE_
X-MS-Office365-Filtering-Correlation-Id: ac64738b-6b33-436d-a363-08dd9d3ad07b
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MGdsM1BHOFV5OGdPSzUzZzNJQWpKRS9NZmEyREZXc0dIdnpCZnhmRWk4My9t?=
 =?utf-8?B?ck5JN1VVdE1uM1d3dTcycmpzTHVQeHhLbkVkd2FqMlFWZTFRK0RqNDZ1eGdV?=
 =?utf-8?B?elk3dkZISUsvakd6U0hIQ1JWMnFBeDFNUlpuajVsWTFjbHM5L2FiVzFsZDNn?=
 =?utf-8?B?aHQ1bTM4UWZjdUNHelZIdW53NE1ZRFI3RVhJWTJZNW0xd0pmQkJSU1JhMjhH?=
 =?utf-8?B?cVpVU3l0b0l0eExQOS9za2FEYnFBVTEwRmxaWllENEhDdDdwNkVJWHVab3pp?=
 =?utf-8?B?dUp5RTBUWHd5L0FxV0pLSkZrWmVvd2tWMlNwTUxLQktFVWR3SW5TSXVvamRE?=
 =?utf-8?B?L0N2U29ZR3ErbVhwZG1xRHl6ZEFhZmMvNmtEdERxbUVJZG1WaFFnRFNQc1RM?=
 =?utf-8?B?V3lRQlpjZ2VObUtQUWlYMFR3V1FoZzJWZ3pNakFtcGhTVEY4Z1BneXZjekYw?=
 =?utf-8?B?OEdJT2pHRVpIY3NHeTlFMWg5Z2s3K3ZUMFFNQzRYOXhmYkhiV3d1c1RnSjEv?=
 =?utf-8?B?TFVvaWdjdDFVdXpKcWFLb1JwSVQzc0dQNXp6akhraENpcFN4YXRXcTdDMW5I?=
 =?utf-8?B?N0I1dGVha0hYT1dFSXhxNzEwT3JzM2pZMlpMaDhoektpOW1MR1JJWHNKbk0z?=
 =?utf-8?B?MTBNTmx0V040Q25ENS9QU0s0N2NDamo1dU1BekI5V3NuU1BOc21rVnkxZGo0?=
 =?utf-8?B?QWJUaXk0YXFMbTFaNWFKT2RWMDlmTFVlS3VuNG45WmNiL1pBTDZLZ3p4S3Iw?=
 =?utf-8?B?TnpHUUlMVE5pNGV2UHpFclpQdXBkcU43LzlVRmF5dDhlYk8rNWRrenBNU2xz?=
 =?utf-8?B?Z0RLRG5oU09obFgwWmR6WTZiU0VlelBOWm8zUUJVL0NkQnJwWktqK3hXQmpH?=
 =?utf-8?B?RXRwcEpDSjZFME5UalkxUTRQdllCaFg2MjdKSkw0bCtiYXhweUNQeGZJRmcz?=
 =?utf-8?B?YTAyVHd2bjlQV1dibFMxS0tObmROY1RUcWRXc2t5NVRuVzEzQmYxOGVhTWZu?=
 =?utf-8?B?emZSQmIxcXNNNThsMmZXZFJ3RXVGaVcxdDR0WTNrdnV1TlZNTXlpdEVyN3By?=
 =?utf-8?B?Umo3aUYwSDBLRXFjbitjeDV2Z0VvWUwwM2k0dEx3S2U1RjY4eWNubzBDb01C?=
 =?utf-8?B?SzU0bktOMGthZ2VVT3JTQ3dKQ05CVHQ1K3hCM3hTNFNYKzVReWVHY2NLeFYv?=
 =?utf-8?B?WWgyNDNTZk9yVXhLRWM0b1lRc01URWtwZHZrWXFSRVBhdm94MGY5OWp1SDNq?=
 =?utf-8?B?NitvOUFrY1RrRjV3eFozcFJKUkxNaXg4cWloQldTQkxxYjVxRS94UjBEeUpx?=
 =?utf-8?B?ZkUxYlltRkFBNkp5bTdWckFRMXI5b2RpcmMrdnVvM0lhNnhwaEoyOGlFR3Zr?=
 =?utf-8?B?TTdtaVZZMS83dmhURDZxYk9lVnBMd002QlY1U2xLQjZCRUpDa2MwSndRZVAx?=
 =?utf-8?B?dDJDNkxUTlA2L21yaTdzT3RKRjdvYmpQYWp2M2xEU0xmYjBXcGhmdzdzVkJ1?=
 =?utf-8?B?MmE1eWNyOXNQNmNRYWRzWWRMelpMNDFhSW1WcE5pQVZPWGJvNVJob0hxTXlw?=
 =?utf-8?B?b2FXWjFGeU1JTER4WW16NkUycU1RWWdURWx2Zy9Dd3h2NWxITEh3VXFOWFlD?=
 =?utf-8?B?d0EwVWZJdUZjWnFNeHE5UnVjaEl2cHBDeWR0RDh0TmNEb1B6VFdwdlhxck5V?=
 =?utf-8?B?OFkyTVlmcDNsQmxMNm9aVUNFd1hELzNCOERpRjhuNU1GY1FwdHY1UWxFS0x4?=
 =?utf-8?B?QWJWamhLZ3Y0b2RodWMzNDh6dUVOaTRvOERIZi8xZVZqUXVadkQ4NDJQZEFS?=
 =?utf-8?B?QkJETlFqUDZPZGU3ajArcVVReWE1SnFGOW52UEpVU2x2YS9mYS9ZNkVrbk80?=
 =?utf-8?B?cXR4Vzk1LzIvbVRpSWhwS1VUMVRiMHZKR0VVTVlrMll0S2c9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5854
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dc7cece0-f5ea-46b9-8782-08dd9d3abcbc
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|82310400026|36860700013|376014|14060799003|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M240aElCdDdKS0FsK29PaXlWWXhHTDArNmxvdFlqcDBIV3ZKSDNQWEI0V2Va?=
 =?utf-8?B?dmVhYitPdGpIUitFWGdVT2YrTE9XRmIrNHBxSnBpVFpYdHBTL2c3SjVYZnlQ?=
 =?utf-8?B?Rit6UjFnNDVoOTlIS2x4L0Q2c3lxV0lUdENYYTBsSnZ2TFhZUkJnRENBbnd4?=
 =?utf-8?B?bStEbDN6WUxzanJsZlZZTmJDZE5aWmQ5b21sREFiQiticDNHMzJJR3dVNnRT?=
 =?utf-8?B?bDlQYWNQYlROZmlXSUQxTXhuKy9nQ29oZFcvOTRmejFWZW9vaDdnbGM4ejJL?=
 =?utf-8?B?T0RwbVFDSkk3djBLQ2Fmem1tR093RmFJNUh2QXd1cWtVOC85SGhuNHhzK2c0?=
 =?utf-8?B?RXhSQlYrK3Z1K2o1QnhwZWUwMWhhbklYVU84MlBmWWVnTDdOTjZVMUd3ajR1?=
 =?utf-8?B?SUxaQkw0MkdoVXZKNTl1T1VuN21JTUkyRCtWMTI3VW9RU3pRMUVCNmxYWGEx?=
 =?utf-8?B?TFM3enNRbHpvNlFyT01SRzJvUUEvUFBJSGpiYkNadVAwc0cxNFBSTlNYVzR2?=
 =?utf-8?B?WVQvTnNyNkdXbzV4OWxHYnZzSlZ5bGpHdHZBbldDdDQ5RTNLeTdoSHFSOFVV?=
 =?utf-8?B?VUFqeWhxbmVzN25CTE9GQ2ZENlhjSXArZFNaUW12SU9lVXNlS3NTTnNwQXJu?=
 =?utf-8?B?enl6NlVTUUFGTWNkZE96ZWsrTW8rNmpoMUs4dUQyU2d6S1VxS0ZKZTRCQVNw?=
 =?utf-8?B?WnVvSFJrOUpXenFpVmNwY2N6RkxMS0gzamhIeG9NanVRSUg3cWlSUzBEcGdN?=
 =?utf-8?B?R0pPMERUZW1ZcU91bGx1OTlaU0dQK1l2dWk0VjBGeHNlTlBtdnpRdi84Qkti?=
 =?utf-8?B?czZ5a3JBY3YyZUgxM0lacjQ2blM4eVB3N2ZDdmxLQnJ4OGpNUWJnb3BrZ292?=
 =?utf-8?B?WDJsZCtoZkVlSURMZUVOSkdQN01OdVc1S0FFWThHMDF2aWRVN2hFZ1hoRGZp?=
 =?utf-8?B?NHR5TFQ3SWp5RFZZWHorckg1KzVSOUcxc2ZRdGJjMFJxT3FmYUxiKzFoeUlj?=
 =?utf-8?B?M1IwTTRkMUw2dDlzNXdCeXdQUXZ0MjJLUUtxaGZYVWRMQ05ZdXFXNHdpd2pi?=
 =?utf-8?B?MlFqaDlLcURPRUZ1OE5GV2tZOTlsYWJ5ek41OEhqVisyeURLZ3VETDBJaldQ?=
 =?utf-8?B?ZVZzZWlGMWdDcjFDT3lqVTdINncxaEloRTZnVUs2Ky9ySkpqQmFBM1kzUXpX?=
 =?utf-8?B?UnJjMjgzS3NtY3NBOWFMRStuYmZlWUFKTHZjQ2NrUHBLNzRvdTFKVXF5WG5F?=
 =?utf-8?B?eXNzb3B6MlI0SmhTbVAvQVlNRHdCNHJYVnRIVnNEOHJvV3hhYWNwWkRPM1RJ?=
 =?utf-8?B?TXFLaEpjUk5pK1dKUkF0SFNPWnFxSFhpWUFNd2RhZGFaT1BnV3dwMmpRTURS?=
 =?utf-8?B?djdXbXh2Yy9QRVErS0ZmaUtkLzl4VXNQOGQrcEhINGlBRWU1M01qc3YxZy9t?=
 =?utf-8?B?Wkk4TzN0MWFSalNnT2ppRUZkcG10QjdkUmRHd2RRcCs4WmhLY1dHbTZwSFl3?=
 =?utf-8?B?aGkzOXExT0IydzFGbWhyb2ZsVGdLWnUzTHliTmcyajRnMVVHTmdFWFg1eVhU?=
 =?utf-8?B?SFdoUHAzclBLaTdKSDBEaWhoZnhUMUlwcWJLRm1Kd3N6Rmx0WW1Lb2todDhX?=
 =?utf-8?B?TnM1L1FEL0lrWE1ieitLbnJvNDZIbG9pVnFZTUJlWHNjeVNWZFNHV01NTnFj?=
 =?utf-8?B?Mkx4NXQ1OHkzLzA5NnZ6K252TVl6azNVQUxuWjN1QXNQdGx1b1h0L1k0S2Zz?=
 =?utf-8?B?REpSaUFJUGR0QXBjWm5CcUJFd0JvdTFPcDc0Qy9uMlhjT09mYVZxV3hvMVRO?=
 =?utf-8?B?c0lmaGhSanNYTUdlRng4Q0xQekZEdGJwRGVDT1hnS0hIRFBETFA4RmVPcDNp?=
 =?utf-8?B?akhkODZmZ1NqcEZlYmJHRVYydWxHajJmdXpKRE9sQWpkL21LOWFYdHZXdzRS?=
 =?utf-8?B?Z3JlWGZ6VnMwUlNYcDYrMU5NbjQwb3ZDUEtWejNvTzVBdEtub2syLzJxRTFX?=
 =?utf-8?B?MXJreUhhenRNSXV3ZG82RFZoL1ByMnhHVS9QWmEyRC80d1UzNTlRZmhhejF4?=
 =?utf-8?Q?9LwFY3?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(82310400026)(36860700013)(376014)(14060799003)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 16:23:28.6742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac64738b-6b33-436d-a363-08dd9d3ad07b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10188


On 27/05/25 4:15 pm, Lorenzo Stoakes wrote:
> On Tue, May 27, 2025 at 01:20:49PM +0530, Dev Jain wrote:
>> Use folio_pte_batch() to optimize move_ptes(). On arm64, if the ptes
>> are painted with the contig bit, then ptep_get() will iterate through all 16
>> entries to collect a/d bits. Hence this optimization will result in a 16x
>> reduction in the number of ptep_get() calls. Next, ptep_get_and_clear()
>> will eventually call contpte_try_unfold() on every contig block, thus
>> flushing the TLB for the complete large folio range. Instead, use
>> get_and_clear_full_ptes() so as to elide TLBIs on each contig block, and only
>> do them on the starting and ending contig block.
> But you're also making this applicable to non-contpte cases?
>
> See below, but the commit message shoud clearly point out this is general
> for page table split large folios (unless I've missed something of course!
> :)
>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   mm/mremap.c | 40 +++++++++++++++++++++++++++++++++-------
>>   1 file changed, 33 insertions(+), 7 deletions(-)
>>
>> diff --git a/mm/mremap.c b/mm/mremap.c
>> index 0163e02e5aa8..580b41f8d169 100644
>> --- a/mm/mremap.c
>> +++ b/mm/mremap.c
>> @@ -170,6 +170,24 @@ static pte_t move_soft_dirty_pte(pte_t pte)
>>   	return pte;
>>   }
>>
>> +/* mremap a batch of PTEs mapping the same large folio */
> I think this comment is fairly useless, it basically spells out the function
> name.
>
> I'd prefer something like 'determine if a PTE contains physically contiguous
> entries which map the same large folio'.

I'd rather prefer dropping the comment altogether, the function is fairly obvious : )


>> +static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
>> +		pte_t *ptep, pte_t pte, int max_nr)
>> +{
>> +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +	struct folio *folio;
>> +
>> +	if (max_nr == 1)
>> +		return 1;
>> +
>> +	folio = vm_normal_folio(vma, addr, pte);
>> +	if (!folio || !folio_test_large(folio))
>> +		return 1;
>> +
>> +	return folio_pte_batch(folio, addr, ptep, pte, max_nr, flags, NULL,
>> +			       NULL, NULL);
>> +}
> The code is much better however! :)
>
>> +
>>   static int move_ptes(struct pagetable_move_control *pmc,
>>   		unsigned long extent, pmd_t *old_pmd, pmd_t *new_pmd)
>>   {
>> @@ -177,7 +195,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>   	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
>>   	struct mm_struct *mm = vma->vm_mm;
>>   	pte_t *old_ptep, *new_ptep;
>> -	pte_t pte;
>> +	pte_t old_pte, pte;
>>   	pmd_t dummy_pmdval;
>>   	spinlock_t *old_ptl, *new_ptl;
>>   	bool force_flush = false;
>> @@ -185,6 +203,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>   	unsigned long new_addr = pmc->new_addr;
>>   	unsigned long old_end = old_addr + extent;
>>   	unsigned long len = old_end - old_addr;
>> +	int max_nr_ptes;
>> +	int nr_ptes;
>>   	int err = 0;
>>
>>   	/*
>> @@ -236,12 +256,14 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>   	flush_tlb_batched_pending(vma->vm_mm);
>>   	arch_enter_lazy_mmu_mode();
>>
>> -	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
>> -				   new_ptep++, new_addr += PAGE_SIZE) {
>> -		if (pte_none(ptep_get(old_ptep)))
>> +	for (; old_addr < old_end; old_ptep += nr_ptes, old_addr += nr_ptes * PAGE_SIZE,
>> +		new_ptep += nr_ptes, new_addr += nr_ptes * PAGE_SIZE) {
>> +		nr_ptes = 1;
>> +		max_nr_ptes = (old_end - old_addr) >> PAGE_SHIFT;
>> +		old_pte = ptep_get(old_ptep);
>> +		if (pte_none(old_pte))
>>   			continue;
>>
>> -		pte = ptep_get_and_clear(mm, old_addr, old_ptep);
>>   		/*
>>   		 * If we are remapping a valid PTE, make sure
>>   		 * to flush TLB before we drop the PTL for the
>> @@ -253,8 +275,12 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>   		 * the TLB entry for the old mapping has been
>>   		 * flushed.
>>   		 */
>> -		if (pte_present(pte))
>> +		if (pte_present(old_pte)) {
>> +			nr_ptes = mremap_folio_pte_batch(vma, old_addr, old_ptep,
>> +							 old_pte, max_nr_ptes);
>>   			force_flush = true;
>> +		}
>> +		pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr_ptes, 0);
> Just to clarify, in the previous revision you said:
>
> "Split THPs won't be batched; you can use pte_batch() (from David's refactoring)
> and figure the split THP batch out, but then get_and_clear_full_ptes() will be
> gathering a/d bits and smearing them across the batch, which will be incorrect."
>
> But... this will be triggered for page table split large folio no?
>
> So is there something wrong here or not?

Since I am using folio_pte_batch (and not the hypothetical pte_batch() I was
saying in the other email), the batch must belong to the same folio. Since split
THP means a small folio, nr_ptes will be 1.



>
>>   		pte = move_pte(pte, old_addr, new_addr);
>>   		pte = move_soft_dirty_pte(pte);
>>
>> @@ -267,7 +293,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>>   				else if (is_swap_pte(pte))
>>   					pte = pte_swp_clear_uffd_wp(pte);
>>   			}
>> -			set_pte_at(mm, new_addr, new_ptep, pte);
>> +			set_ptes(mm, new_addr, new_ptep, pte, nr_ptes);
> The code looks much better here after refactoring, however!
>
>>   		}
>>   	}
>>
>> --
>> 2.30.2
>>
