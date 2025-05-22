Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739E21A5BA8
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 06:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.54
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747895643; cv=fail; b=ENAzLEXxt5pr2Ommy6B0LEHKYYiuPCtsPGyDWVqUfUM7JSHZx2lQhhqZJa4R47gIXafmAA7deJWppFvKZvJkNIUjC+xbB14tUgGBmz/LeZM2Uv1OMm8BBEJ2YHk8sR2FPhsC4/GERW8Kij5sjAUsPTu5PT7Rq7Ud6LIzOpFTG3M=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747895643; c=relaxed/simple;
	bh=49Z0PA/vNDXTPO0OuNujgvtQN34ii/5wbgL6bJiVM/4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sFEp73S8hUAJvcb6FYVV+oTce/MduOWKmEfCYUBK15Qu8YAr/JXT5PoMsonCkYLbeMYrFoeYrzgzmhtPm7dZYQw63MRemLtWUXyM8Ch6s6Q3FoE7nfg7lnj36XET8xsCh82Va2QeV/DH6nsbrPgKWcebFtcLwVCCX+lyC8IVx0I=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=XKY1Qd68; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=XKY1Qd68; arc=fail smtp.client-ip=40.107.21.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XKY1Qd68";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XKY1Qd68"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yfN7uwfdQGMEZ9UC1FcDZ94MBO4mncI+Y+UlNEDPIZI9szbsQsKssR8BKPEQw9OP9Ej+KhvSevFO0dBd1y7lcfcX15eMxeDTrBpiT45ppqPzvnCq1kR8EteznmUqWK8REbQyOuHFRCdCWKCCduMv+xCP9KfkJQqkxneNbap2O3aJoN3Fm1E7j5AAj8z5KRHNGHXd5riD/syB76RMNrpu2UwLxaTztL4w1Nu5XlRKaFRT+eeNCpC1b4WIAVuHlJEyPwT2cY3nIGqa8Sv317EJmkeLyIXR8MOVRjpBvJDAwPrjM3zoWtHV1uykC863m+ivpUoK1sSTaS2tulCsh5owcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8zpH0f8MPZ0JOjLpLFwXs/q+HR7uTHZ3ZHUwTx9UEc=;
 b=GswmoSQZYbxVe3s8FQ2SGYd6J3PwXHqdNFs/LIaoVBc0NiKmu82pU4ujP9Tg+WrKi18NOCLqa7m9O3wAi4dyDqT6bexX2BzvAHxJMMZMpS2L2tXE2cR3ttpJ9jtrYR4Yr78gjqHechQkddHa9w9+xR9Ie/kVyPasL9bLO5J4NrldWmxeCjCWQSrYQIjqw9bHVaQn1Gamcf6jJxfeIp9mpZC6TQYJAUwhFfqXfvnOGV6XPWPgp+/FUviSrLBzzmj0vcoKVMzI81wJ1tZCMasbpAYvuUbyM/6hj3A2KeSp1TfF6fut6GQxdiccpIiL1O0Zt4+xVN+GJZV77y7+m7gb+A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8zpH0f8MPZ0JOjLpLFwXs/q+HR7uTHZ3ZHUwTx9UEc=;
 b=XKY1Qd68etRq6bb+AuSuJZDgOnzMlRkABDRlYJpWUzgJwLE4mYZjMKvO+z9PxtGc54DbIffGAF5fwXc9aBOjnPTWS4LG9nEhatN1rRQ9z4TD2B2F48ZVOxgJsmxWkrVCkvUh1KbU4VHpY7Zdrlw8QTIN8NZuSvrtDE4Zh3qH3PU=
Received: from DU6P191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::29)
 by AS8PR08MB6278.eurprd08.prod.outlook.com (2603:10a6:20b:29a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 06:33:55 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:10:540:cafe::91) by DU6P191CA0003.outlook.office365.com
 (2603:10a6:10:540::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 22 May 2025 06:33:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B622.mail.protection.outlook.com (10.167.8.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 06:33:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JxvN8SivYEy+P6THRun8kDDTxyEw+lW5iqya+g9aGVjy05lLGQFqgqB/8COuP5zOZtAAnP3dm8EaVK9KtpvGlwVaSeGuV3/UcTJwEJ7bSqvqAcDnv0phTx1cOxxkSWkV0V8gqkoF0Mm4hz0tlUk4v6dZr3nbXGZyWOdn7brq/55EiZkTnMZxDyVGpsTRO26Y23O9c0Ei0vC2eBwCIfZvbWHOiV7Lh0qgyQIJ7UqHK79wBr/OLHCl4X/G6yNZHZipGqA2LqTXvkGNDOVC4Sn1in9rChtvxVMwk7Z2Um5UCNFsHexulb2PgC8BF5UptdCmpA2SApJgCy8b+uDqETbGZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8zpH0f8MPZ0JOjLpLFwXs/q+HR7uTHZ3ZHUwTx9UEc=;
 b=jaQY154GQA8KjjBVgVGgnxbtA73nWqiRvDhBhjsf95GhSmWg+9+AedKEvkW5wZekDU7t2AYnUN6uX5XlnTsRO21CPjHDrVC5z28BJs0NEWZPy5eeg5IsHErnn8Si7sEDDyvJkzMmR9aZU9R7CDh+4X588ziheIjL7IiRtK1v8IFLIxXYnnPiRS+CxH/XLlL8sXXf7VMtF26ej7CKVNdEa77EKdzIrx+pYtQHaq0SjbxpNHyv67PPg0slWUN0QDTHrBazxsUJgPbkLyAF3xOqDjUpyuyyq9Jb6ElMPzRs+IaMMJQur+XlN7EklsfGpph2JdocRhPPnK9jshoB6mYSiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8zpH0f8MPZ0JOjLpLFwXs/q+HR7uTHZ3ZHUwTx9UEc=;
 b=XKY1Qd68etRq6bb+AuSuJZDgOnzMlRkABDRlYJpWUzgJwLE4mYZjMKvO+z9PxtGc54DbIffGAF5fwXc9aBOjnPTWS4LG9nEhatN1rRQ9z4TD2B2F48ZVOxgJsmxWkrVCkvUh1KbU4VHpY7Zdrlw8QTIN8NZuSvrtDE4Zh3qH3PU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PAWPR08MB11160.eurprd08.prod.outlook.com (2603:10a6:102:46e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Thu, 22 May
 2025 06:33:21 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 06:33:21 +0000
Message-ID: <fc219152-f771-41b0-8857-42de5e6dd35e@arm.com>
Date: Thu, 22 May 2025 12:03:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] mm: Add batched versions of
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
References: <20250519074824.42909-1-dev.jain@arm.com>
 <20250519074824.42909-3-dev.jain@arm.com>
 <59242559-5e90-4422-82f7-179a44eb968a@arm.com>
 <7a1ae902-d97c-41ae-a3e7-5b6258ced1c5@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <7a1ae902-d97c-41ae-a3e7-5b6258ced1c5@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::10) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|PAWPR08MB11160:EE_|DU6PEPF0000B622:EE_|AS8PR08MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: 351dc43c-d2c2-4119-cab6-08dd98fa9f9a
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?cWpDT2FLOEphNHdGSlVTSVJzMHlMeUtyQVdZVE9xRmc0dldoZFJRM2xsV25o?=
 =?utf-8?B?UnZ0cWpwSmt1dzB4b3NETCtsbFh5a3EvbFVzOGh1bGpBOVF3aHNXbEF5RXlN?=
 =?utf-8?B?cmJuamZPaGZzR0k1TWJWaFJNNUY0cjZRVitJVVpac0tHN2M1THRzWFBETTNL?=
 =?utf-8?B?NWd1UXlRVWZQQXMvb2wzOExzMFB5NlR5ZVozaU52UERsSG51dlJCMEptOUN3?=
 =?utf-8?B?aFBmMDB5WW9LckpFcmZIM0NxNlg3dlhZNnBpVjhSVTJNcnN6eTVyWmd0UE10?=
 =?utf-8?B?UDhEanczY0JtSWlCZHh5dzhQSzU3ME5GK0tlejN5VWI4TS9DTzY3VVRrZ3N0?=
 =?utf-8?B?bjhPUVlzMFl2eDV0R1dpRWJQd1BpSmtGSm1YUGhrN3NEMFJ1KzJFQmdtaHZY?=
 =?utf-8?B?aE1oUVFTMlM3aWpDSjBqL1hVYmFucm80SzVrTERpN3U0K0MyLzY2ZWJKT3B6?=
 =?utf-8?B?aStybmV1R0d5L2RlRzR3azlSZENNMW5aOTdnN0ZUTzZoZ3lIUHBrQm1ndDlU?=
 =?utf-8?B?NDlDZDBlbFV2Y3BVZVNoVG5XdmxsUVNTVGd3Mld6VUxSUHRtZW45TGdYREVt?=
 =?utf-8?B?RjlwUTF4ajBXQTlJdkFWeVh1TU9NYk5ycVdYenlYckhVd2x4eTlzMFRSS2sy?=
 =?utf-8?B?cVFTaHBFWVBmTm9uT0lPbzc3dHZPL3ZsQXlWN3Q1QUd6czR0OFlFYkNHemVS?=
 =?utf-8?B?b21Na215dUtLL1gxZjBuZ1hrczMrNFQvM0dCWDZwUXdTOGdhM0J1RGtmMDAx?=
 =?utf-8?B?R05qTzQ4RzBkcklPdmpBTkV1UTM3WnkxUjBJZkl2QU1CR09Bc3pMamtkSlNx?=
 =?utf-8?B?bkFsRTZ3UXg0Z3BDdHVkNlEveFNSWkpudHlNN3NkSHJHM0o1c2xzYnU0K3U3?=
 =?utf-8?B?ZVZVM29ydGZOTnd4Z3hITGUxUEtRQlBJWC9vajkxajhLRUZQZno3dEFKZGp5?=
 =?utf-8?B?LzVpVVlTNjdwQm5NeEJwZ0owRk9aR2h4Qi96cS9tdDcxMXNUUlFSOXlpelky?=
 =?utf-8?B?RFlhcG1mdHpKSVN1YUVYR1F0UFdFcmRuS3psVnVkdTRsVzdkdVF3UWo3Qk9z?=
 =?utf-8?B?Tm1VWXZZaUloZFNIQ2JGRnRsbHRuVVV6KzJlcFBieTJQblFaVDh4MERCV09G?=
 =?utf-8?B?UXp3a0llUHN4NmxpOWRLTkh3UHJRYWxRM0UwYkZxdXRsdE9tb3lmRFA2RWdh?=
 =?utf-8?B?VG5PRk5IaTQxNWxlS0RMMGtJZzBYRkJlSVpFMm1GNlFwczNkZXJFQW9LU3BO?=
 =?utf-8?B?QkFIc2RHbnd1bk5PcjZ6Mkw4eVptN20zU1A4UDM1V003QllvbDlKbS9UMmFt?=
 =?utf-8?B?Y3Yzc2VLVnA5R2UxdDVmczlyckliZlVMYUY3Y0d4TmdrbmZESEVjZjdxcCs5?=
 =?utf-8?B?eVRlMHFRQUhUTHp1NGNmemIyWFhWdTM5Q2tOL3ZiU2hmUkxTbzd5RTZqQTJD?=
 =?utf-8?B?NHV1UGg2Y1NZOVltenhLTlhaZC84WDdrQkV6Wk1UL1JiaTNZcktTNHVTVkNk?=
 =?utf-8?B?a2V5V0I4OVlzOW1qbXI3RlhOU05QZG1RWUJDdjk5VkZzU0pmSU9KTjFmS2xZ?=
 =?utf-8?B?MlVCaWRYZGpGM1NjUFJEUnJlaTVqeTQxMFp6UERmVld3anlLUEdRRVNkOTJP?=
 =?utf-8?B?aG1ZT3pvVmlOSzNhaWtQS3poRHdyUFdoRDBjcHZmQkZEWWdpUHJHc2VuQ0gy?=
 =?utf-8?B?OTVvNUZBbndUa3pQTmM4Y2M2TjUvWXJ1U0orcm1meTBCQ3NoNm5XK2p4NlJS?=
 =?utf-8?B?UUl0THJUMnI2L1JzdGtNbEVCek80d0tLRzNrWlJESVhJYXFVN05tbk43VldT?=
 =?utf-8?B?bXFyeDFWRnNlbDRWQVhndUdLQy9iWWZlWGtmWmhYUGpxOXRIckdJbEtqTFZn?=
 =?utf-8?B?ZWYxR3pzTUtoWmNyNHp5ODc3UDhJcWxMS1hseklzd0grZmc9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11160
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2b77c221-54bf-4dc5-29d7-08dd98fa8ba8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|1800799024|82310400026|36860700013|14060799003|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y25aU1pwYXlqTEkwWjJLVSt1dUNYeEhZTDJKZWsvdUlNbmorUG8yUU9mQ252?=
 =?utf-8?B?STBKeXpMMU9rNUNKZVR3eWdWeWw5U1ZOaUJFQXhvRER0Z2I4azVBbDd3SG05?=
 =?utf-8?B?b0l6Z1hOaVRsbWZxYXh3TGZtYlI5K0E2OGMvL2hGdTFCUHlyZmpUWUliRjdK?=
 =?utf-8?B?QXF1UjFTQUxoSHJDaEROWXhUY2llZkhBaWZlY05TdEJRK2xWWEJBM2RJVGJo?=
 =?utf-8?B?UEJPOVgrWXgwdzhwQzVtUjczZGxxZUovNDdmbDR0dHBJcVVRT0c5bVJvQnpo?=
 =?utf-8?B?aHc1R0U0YXdQaURyTkR2aCtIcnJZYkl5d3V6d0ZXMFI4N3JXOGRBRVFwTzdw?=
 =?utf-8?B?bW01ejNPeXhtVkx3bFE2KzlJNHNoczAyL2twcGNRd0cxaUV2VEJqNnNpTlBr?=
 =?utf-8?B?elZvVWU1WWtNc0g1SWIxaWZRK3FSNUFwdkh5YmNwd2tqaDM4MUtLK1R5c3ZU?=
 =?utf-8?B?alFrZEEvVzZjTVVoTzdzL3Y4ZGd3M1VhcFFBb04rSm5EeHNXMXZNZHd2OTdP?=
 =?utf-8?B?bC9lOUJURWdtRm14UEh4dHkrcHJ4V0hPUjI5eFBUVzJkSk5MR3BQUlJIV2h1?=
 =?utf-8?B?eXo0WDdHR3hwcmROYjkwKzFtc24wdnlJM0RGYmp6RXI4M1RNSzFlTklwL1px?=
 =?utf-8?B?UDVidGR1NmdGWWpZWFByTzhpR3hOSUovc2o2R0pPT3h6WTlRTnZUZ2JNMnpL?=
 =?utf-8?B?Mkc4bThNcXVvalZyNlU1WXFrRTFTbGVBZkl1WExoelFHK1RUMDNoUzh5b2Z4?=
 =?utf-8?B?NVFCRmljNlo3S0s4OXdDd3AxWlBBL3cwblhMWGVtWWtXTVlYQm9aVTV2V2FQ?=
 =?utf-8?B?TTAza2kwQlZjQXpqM21vWnhvTmVjY3FvVzZPWlR4REpOMU45QWV1bDg2STA5?=
 =?utf-8?B?RjdQNFBzSzFnZk16TFlZZG1iazFqL1FKT1pIdUxMNkxCU3IwUkRaRTZFOVBK?=
 =?utf-8?B?OVBnUVJ1THJMaTlmakV3UnlxZXdwTTB4UlRxaFdyNW9wS3pHSlZmcWUrdVJa?=
 =?utf-8?B?dGlZVUtYV3ZHUVFKWDI1cDhGQWwwcFg4S3Q2L0FPYmkyVml5N2hkRHdoRXpa?=
 =?utf-8?B?aHVMeVNqVnlhdXJHYkRMd2RTbWtsUk00cWQ0ajdjTUFZNHNFMm5OOWZxTHc4?=
 =?utf-8?B?dWRad1YwemV6ODl2d3JoUWt1SnRCd1JQLzRqWFdPeE9ETGFxSzUva2NHMXdT?=
 =?utf-8?B?dnQ4QXdsRWxkYzhaUnNlWWxMeUUwYU9EdEIzbElsOG1jSmVkSHBYT04xSDZQ?=
 =?utf-8?B?N2VKQ0tDN2RRaHRrVUsxd01YUTBNUmRVTStqNGF5aUFpaW5BNTRhWWc1MmJP?=
 =?utf-8?B?UWJpS21xMTN5VGJYTkgrT0V3QThKOXZDeFdLL0VOcFJsaVZJbUwyR284TGVm?=
 =?utf-8?B?dlJZSXkwcmYrekw3Tmx2YzZxbzZma2VXeU84UFUrZ1pNSUNDcnZIMnZuZEx1?=
 =?utf-8?B?SFNYRURJVVBsd0ozaTgrMGROOUxCbHJaYWZpUzFxYkRYRWRwMDRJWmZodDcy?=
 =?utf-8?B?TWQ5K3lIQWpEciszeXZJWnB4eWVCd3pySlUzci8xMFlCSHp2NVNBRmxGbUZJ?=
 =?utf-8?B?OEFBTUhuYitGVFRia3NqWWxwZkVBbDVtS3FEQ241Z3NoV3JlVXdNazlGVVJD?=
 =?utf-8?B?UUoxbTVINGJiamtLUmNaQkpnck9nNU16UEhUOFQ0YXRFU1ZkcUF0dXp2RzVU?=
 =?utf-8?B?bkJudDRZUFBsbjZEOHFiRndaUXJTb2xaMHNLOWYrckpiTm42MTNkR1lldHdW?=
 =?utf-8?B?SVRkNUNEbE15Vzh5VXduTVJRZU41cFA0M3M2WVN6ZEhFbldqSVo5RGpRVFpq?=
 =?utf-8?B?anB4djgvR3VQLy9QUWhaTWRDb2lKMTlXUHhRS3duUjBIeWpBK1o3SmxnbWZ2?=
 =?utf-8?B?Y25rZmVsSGgwYmRaeEdnd0xnQm12NDRubE00bW1vbUthL05pQ2dGOVV6VDMv?=
 =?utf-8?B?eXMzbmFzRzZ5SFdFN1QvbE1tNGtISFgwUC9GYXdRUitid2lmcXV1bzhJOEN3?=
 =?utf-8?B?Z0VwMG8wUGJ2YUNXUUlWMVRrbmRaMzVBV2ZKQ3gxM29KNXNXOHR0M0kyQTc4?=
 =?utf-8?Q?xw1Or+?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(1800799024)(82310400026)(36860700013)(14060799003)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 06:33:54.2432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 351dc43c-d2c2-4119-cab6-08dd98fa9f9a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6278


On 21/05/25 5:15 pm, Ryan Roberts wrote:
> On 21/05/2025 12:16, Ryan Roberts wrote:
>> On 19/05/2025 08:48, Dev Jain wrote:
>>> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
>>> Architecture can override these helpers; in case not, they are implemented
>>> as a simple loop over the corresponding single pte helpers.
>>>
>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
> [...]
>
>> I have some general concerns about the correctness of batching these functions.
>> The support was originally added by Commit 1ea0704e0da6 ("mm: add a
>> ptep_modify_prot transaction abstraction"), and the intent was to make it easier
>> to defer the pte updates for XEN on x86.
>>
>> Your default implementations of the batched versions will match the number of
>> ptep_modify_prot_start() calls with the same number of ptep_modify_prot_commit()
>> calls, even if modify_prot_commit_ptes() is called incrementally for sub-batches
>> of the batch used for modify_prot_start_ptes(). That's a requirement and you've
>> met it. But in the batched case, there are 2 differences;
>>
>>    - You can now have multiple PTEs within a start-commit block at one time. I
>> hope none of the specialized implementations care about that (i.e. XEN).
> I had a look; this isn't a problem.
>
>>    - when calling ptep_modify_prot_commit(), old_pte may not be exactly what
>> ptep_modify_prot_start() returned for that pte. You have collected the A/D bits,
>> and according to your docs "PTE bits in the PTE range besides the PFN can
>> differ" when calling modify_prot_start_ptes() so R/W and other things could
>> differ here.
> It looks like powerpc will break if you provide old_pte which has different
> permissions to the "real" old_pte, see radix__ptep_modify_prot_commit(). So I
> think you need to at least spec modify_prot_start_ptes() to require that all
> bits of the PTE except the PFN, access and dirty are identical. And perhaps you
> can VM_WARN if found to be otherwise? And perhaps modify
> ptep_modify_prot_commit()'s documentation to explcitly allow old_pte's
> access/dirty to be "upgraded" from what was actually read in
> ptep_modify_prot_start()?


Got it, so we just need to document that, the permissions for all ptes 
must be identical

when using modify_prot_start_ptes(). And that we may be smearing extra 
a/d bits in

modify_prot_commit_ptes().


>
> XEN/x86 and arm64 don't care about old_pte.
>
> Thanks,
> Ryan
>
>> I'm not sure if these are problems in practice; they probably are not. But have
>> you checked the XEN implementation (and any other specialized implementations)
>> are definitely compatible with your batched semantics?
>>
