Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010011.outbound.protection.outlook.com [52.101.84.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F79078F3A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 04:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.11
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751345134; cv=fail; b=OEBH4lq8xJgZ3E3oczpto07zo4rn1/0N2jRRlzW5Yv6DIdQPZNW15fW/b09R8J4ZCnrESERiuV1nqCAleSdcUfddLV4d60v6cZKr5aEfGzrpuRdVIOxX2oupAW5xsMc3SQpUsYwHFytLAZ8766sbpvYrXdF+27hEmnPiEW/p89E=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751345134; c=relaxed/simple;
	bh=0AgyxMUMC9pyuaAybVmLRyT7UICdfxyaSV09gAgUyhw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TUmOD504QULbiiqmFxJnXH14yFlgsdjbOnqOwi9YsS6hH8dl+5/flyrnKUpVhwZD1yGfl8Ea9/f2CFCMmsxcR2rVTVsLoLykGnViJbp64Yhk939wlu2/wHMVpSVdlon6ziX+BB6hgHHtlMvp9mHR46VRU/yxTTnMqGuqPULui2Q=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VNLDHD7F; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VNLDHD7F; arc=fail smtp.client-ip=52.101.84.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VNLDHD7F";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VNLDHD7F"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mUHdIA5UEGhQmMcsh6MPdWqhGBLsLpGvROZzgXCfHCL7P3iyky2NClq+YWKEi7tIx+wMAxy6MO0sl6UmA+3dYW00f6PW8NStR9/m2Grpa2+8SNupEw2wabFgEXbzePN1Ccw5p1AI6aXHcuvDbRqwEJ0lMDYYYBN17ys+kvpj+L+ovLeFDaZeEtMH6yA0cHCVgDXETrp0iN8TzM+Miln46KERijxsMPUGbElvr8r4yByAQIOHR/2o1AsWQU+hU/C829dt42EpgshlaRYx0jvLZpsbqjR5QwIAwd4CT9Y++VcLIzkm0M4qsBDpbJaAYf/0mOU3QduPoMu/r3zAfzm2sA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5gqa/nLreAkyzMAyTl2zoz694tTB3/4TpMIkg3tPZQ=;
 b=yfNIqLYjEBpw+bmX4BbkZj/UizChi1ukvl9l6/mv8KDELl+AfDrpCGKcL6Uwh6nmjwZJpv9oPyDJ68NcWAtXXDTAJ+G5mOQzIFVoxNvxMhIFBdWDHJF36mefYzM0YA1UESpDX3RBPGP6ht/QnojlaIZ2mkKWXcr2qC64CKoKYsPU7a2PPKDioMP/2JtUzSBW3dP6VcqtWPbADe6PtcRfJ4i/Bm+47iVVZ/xGAWFde4bVYwYab/rBQL0Mos/P/c9AaZvNmXNYr9uzYbp75S5Jd6hrdpoRm72LYOmuwmoyq5yfiih0y0Wncdao/Fi0Cppa7SG1R646CdBfOD5luqitxQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5gqa/nLreAkyzMAyTl2zoz694tTB3/4TpMIkg3tPZQ=;
 b=VNLDHD7FqZKEAxKrtsaGYoKVTtdtyzJRy0imFhrcK0VsCxRV3OWFTgfUm0red4H2mS70oT/b7dt5fsxz7nECWGOc5RgLMecI/KopF4SVT7G5y/mZPnE6DN3j2HYDV3cSLYorKYx5G6b4JwynUx//5gTn5PCeEWuZDI/aOKjhfvk=
Received: from DU7P251CA0023.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::16)
 by PAWPR08MB8816.eurprd08.prod.outlook.com (2603:10a6:102:338::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Tue, 1 Jul
 2025 04:45:28 +0000
Received: from DB1PEPF000509E2.eurprd03.prod.outlook.com
 (2603:10a6:10:551:cafe::f2) by DU7P251CA0023.outlook.office365.com
 (2603:10a6:10:551::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.32 via Frontend Transport; Tue,
 1 Jul 2025 04:45:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E2.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Tue, 1 Jul 2025 04:45:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0aDBKmqlaTf11inEYxBM7BQCBiFETCxy9OG7Pk8+AfGYLZ3b3jGbE1LzQrMmlSWsafF70xDyFLH1RlmTDFl3hLBqTdGWOJqfFwDC5Bp3Rv6JeT2ZQUfmBr/2JdmnPmt+vBqeHfn9961kcQ5EXnQDXOK7UJzCr1jDPz96+yto79GqItKS4MyMgJTHLaxuSAqEDcn0lJfpmECnOFFmxIJD45Vy9eixDvQT4Z4n84rCIbjjqK1j7KnE5GqCIfLAprU21JzHgODu0tSITBOCptm5iLa218BVPqiQIZEpg/+GJF7eo5qabLrs7WuF+7m2sDwWVhJ7EWmJgGJ7+vHOLzMmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5gqa/nLreAkyzMAyTl2zoz694tTB3/4TpMIkg3tPZQ=;
 b=yU5s6CrwRHtDRzXDjXZOF3xS5ktCQ7ec21xFPRf1SOcft2u3jVZr2EWcNN5X5tXib/tZi/PbiJ2amtal+Zu9Iz2rFfnaNDUW7+rX65NXAVEWKhe+gtAaBpGDW115bTPwUbo2YNz2dQK+Tc025bSna5HiOe6oeW/1IiUc/6NNxaqmTrdE7jge8rfWw2DUIQ5qxFmoHdEwvNXEv9OEoST8gQx7hn9dOfqPoZvt9A7armz+tK6iOCBDUVuZr4ay3BzdJ3ptQDOKw10BrlCK0uDouA5iaIDcW8JZjV2dVxTm5cELwr+9oliOEy5DA4kqxwCF1le6RbD37rDX+TYj0Cw9og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5gqa/nLreAkyzMAyTl2zoz694tTB3/4TpMIkg3tPZQ=;
 b=VNLDHD7FqZKEAxKrtsaGYoKVTtdtyzJRy0imFhrcK0VsCxRV3OWFTgfUm0red4H2mS70oT/b7dt5fsxz7nECWGOc5RgLMecI/KopF4SVT7G5y/mZPnE6DN3j2HYDV3cSLYorKYx5G6b4JwynUx//5gTn5PCeEWuZDI/aOKjhfvk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by GVXPR08MB7701.eurprd08.prod.outlook.com (2603:10a6:150:6d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.18; Tue, 1 Jul
 2025 04:44:51 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 04:44:51 +0000
Message-ID: <c12e2958-5a51-439d-aa86-e72d85699562@arm.com>
Date: Tue, 1 Jul 2025 10:14:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] mm: Add batched versions of
 ptep_modify_prot_start/commit
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
 willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
 vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
 peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
 baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-3-dev.jain@arm.com>
 <a305816d-7770-47ec-bb21-1572c7c7783b@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <a305816d-7770-47ec-bb21-1572c7c7783b@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::9) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|GVXPR08MB7701:EE_|DB1PEPF000509E2:EE_|PAWPR08MB8816:EE_
X-MS-Office365-Filtering-Correlation-Id: ded30ccc-1b88-44a4-9a63-08ddb85a19e0
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MWM2Z2VmQUtjNE1haSt5cUQ3SGkvSncxTFNZTy9EQ01uWStEdE9DTmYyVy9G?=
 =?utf-8?B?aENvMmJCWTBxMVRXWjhrMEY2UVVhd0V4Kzh0eXBGOEcwYWtEU3NDdmt2WEZM?=
 =?utf-8?B?YlZHc3N2THVFSFNtdDh3UFRVMm1xQmtGZU1XU2tTMy96U2g4c1BKNDVETmd0?=
 =?utf-8?B?UzEraE50SGkxZldNRnY5QlZzbXZnb2FMS2hJWitRSTlrK0VYQk5HeThzVWVo?=
 =?utf-8?B?Y3U3YlpjazlpUjcrenlxbCtMVHRyd0dKenBHckZGN2VLK1lxNUd5WGttTkds?=
 =?utf-8?B?ME1WS1ZpUXcvT1BabWozNm81SnN2M3RWLzJ1Y3JJR0VsdWdFMHpCVUE5VGVJ?=
 =?utf-8?B?V0dJUlZ4Y3h0bit5VEJsZGVvaFlCOUwxdW9ScURWU2ZEcDA1RWFNd0tiK0NY?=
 =?utf-8?B?WjRLd1R1cm9vVFk3ejJINUdTeG5MOU9TYnU1VjJ3aUlKQXN5ZGp1S0VTQUhB?=
 =?utf-8?B?SWROOE80dmFEeEdUQmhBbmo2V0NjZXRqUURrd0UzQ3RzclBXNVV0a29wQ3lJ?=
 =?utf-8?B?c0dubFkvQWxUZE4yOVM4cDcrVlgzT0FRWC9KbkhKdlRaekZHcjg3L3hYZ3p0?=
 =?utf-8?B?Y0dicjZySTF3OVplbHRKejdEUWU0bmFlb2NQMURNM0U3bE90MUE5UjdYNzUy?=
 =?utf-8?B?OThJTmNuRnVUc2hWbTZEYzJ3Vk1RUzBzRE1HbHc4V25tL0RvYm9EV1NVN2Ny?=
 =?utf-8?B?YU5MN204U3M0NFE4Y0VKNDdaTUFESXl5QVl2K243Zmh3OTZmcmJOQUFQdEtF?=
 =?utf-8?B?cW5oOGJ3UVczaU5yMXJ6NklRYTk4REVXUkovMDV3T2hSY2Fac0lQKzl5SXRK?=
 =?utf-8?B?WlhwRXh0Yi9mMG8vRXEwRDkxdkd1dDFjYjZlK3YxWU55dnF1MWlUMDdpU3By?=
 =?utf-8?B?RE9xOElBb0grRzhUQTdqKzB3am56V2dxTldBTG1hZnc0TXJweGxiV1VEczJs?=
 =?utf-8?B?RXZIR3dldWJiRVZ0eE56WDdlVkJ4LzNVcGRzVlVOL0xROTN5ajJvUm1IVkZK?=
 =?utf-8?B?VkM5SUVzNnpXT0Vqb2tQaHFKU0NaV3JjOHcxYlJHTU1ka1dlNEhPL05FYkk2?=
 =?utf-8?B?Nm1qMzZHdDd0dnVQZTE2UmdsMm81NmtKWTFDRHM1T1BVSVUzZ2ExNG83ZVdp?=
 =?utf-8?B?TU1vaS81aHhYelU5L28yajFTV29MazJVcG9QN1gzRjNYSmx0SUNNSGsvbDJs?=
 =?utf-8?B?SmNuZm9USmo5d1RWaVdnbVFneThCYkkxZHhLYXUyTHlESXlrY0FuZG9XS1Nj?=
 =?utf-8?B?ZDJ5bFpWN2lyY1FyMGJzMlA1V2tVOGxJdWphZjJ6Vy9QNXRpRHRMRERVRkgx?=
 =?utf-8?B?MnpUTy96YXVlVlRsWVpGTmVqQ0dLRzdFckpOMkYyOHZFUUZCYUNURTFFcjFG?=
 =?utf-8?B?NXdFd0JHMmw5REZTSEtUYzJvRUFaaEFpRWxTcHRBSVRucnZ0TURqNXp6Rllz?=
 =?utf-8?B?UkVuUmp1RjJqTVh0VnRjdU9sdkk0R0NDejFTZXl5R3R1OFA1dm5JRXVHcXQ5?=
 =?utf-8?B?YklUVWhHVDNsMnJqOXRnaFRlYkRFQVFRTkt1Q0UwSUl3MmFiUWw2aUNrK3dE?=
 =?utf-8?B?ZWlZaFVsMUo2djJhT1JWdU1nTjRWQ2pYeFQzQTZ1bnhmZGRyV0I4UXk2dHVT?=
 =?utf-8?B?TEhCK0R6M2t1M29wY09uTVJlYUhiQzZNV0Q2UXhObU5hbTluN1lLdzVMclU1?=
 =?utf-8?B?d1pBWktpcUgxY243NE4rQ3dXMyt5R2JBTWhaT2tKODdYSUczd1FkR0MrUHF0?=
 =?utf-8?B?R2Z5azM0SjV3akV0dktycE00UnozYXkwS1VJOEt6a3V6OUdaNEhXeGFWRDlK?=
 =?utf-8?B?VVF0VnNLemxiVUVvOXh2NU4ySGlFNTR1Tkd5M1lwbm5KVkpIQVYrQTNjTFNZ?=
 =?utf-8?B?a2IzVzNOSkIyMzR4YUlBaHkwZGNuVTdjQ2EycEFyZHU5U1E9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7701
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c0143f27-e374-4dde-d1cc-08ddb85a043f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|1800799024|7416014|376014|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkdZUE9JcU1nZmFjQTJZYVdpZDVWNUJnN2RPbDB5Y2wzZWphR2ZRaktoaGxk?=
 =?utf-8?B?WHhDMnlQa3JreWZ4dlY4YTFLQkZ4eEg5Rk9ZR1A0VXRkUlBySFNyQldVcEVO?=
 =?utf-8?B?WEc4UEp0elo0K3JyMDFNY1Jwd2M1c0c4Ym9UNmk2bXk3dmNNNHV4elNSbzFz?=
 =?utf-8?B?eFZTTWIrTHg5eFM1djBOVExBZDlJMXNwRVRzN0p2QWV5M0ZLdmxHODdrT29x?=
 =?utf-8?B?OWxDNVllWmtRcFRwZVUvZXRoU2hPYXJKUmRSWWRKNU41MStweU0wOUJUb3pj?=
 =?utf-8?B?cnZGbk4vWWx0T2tnc083Zzl6Z1BzQ3JucHFMN2J5QncralpHZ3c2UkJ2VTZk?=
 =?utf-8?B?NTlxeFJPU2ZhRkhRSmFEbXV2M0Z4ckJPbWJMRFg5cUlWai9NaUYrK0lqRjlj?=
 =?utf-8?B?OFUvdUp6Z2s4VGxMczJwYVJHckRHSGp1bDFwQXNqRVVma0FsalA4Z1pkMERT?=
 =?utf-8?B?MEhJNnluR2tVUHlpTCtpdG1QY0x2bnYwME9lS2c4eUM1TEszek9aREV4bGFP?=
 =?utf-8?B?QnhpWDJUUDMrdmVkR2J2QlNLVFVrQVJDWmprcnh4VlJrYWJVbUJtWDBtMXJr?=
 =?utf-8?B?Y0JRSDZ5aWhKT2RCSDNxcytiZld5NlhwYkxwQnVEZ3RpalpFWVQrd0I2YnZS?=
 =?utf-8?B?ZG5FYm9wNk5SWll2bm5KUnlReWlOSkRGVmN3cThUMkJiS0JscVhQQmdzSzYr?=
 =?utf-8?B?b2l6YjRyR0tIR3ZsTklHTGdvNVozSFZ5Q0JIVzRpVU5DaThvVkhFaTlVemNu?=
 =?utf-8?B?c3BoODFhTWVIZ21PcDJ3cWdSbHdDaTliWXI5VkZUdmtwa1lOOWJHVitmTFdJ?=
 =?utf-8?B?REt1RUJiTnRwREs0VDBQQzFQYWo2K2tJd290R1AwQlFCcWVsZk9TMEVRSW9B?=
 =?utf-8?B?ZVVSNGxqazRBeHQrNTQ1NVptWm9NSEhNMThDNW1KZEFrS05qZXJwQTk4cnBI?=
 =?utf-8?B?amxnYnRUMEhDd2p6bGdpbEFxTkxrcmErUG44RDRQbkdxZ25wcDJsQWo2NGZn?=
 =?utf-8?B?WkplTlduVUtJZFFjQ0lwUVlZRzdJSmZONTRUMWV2N05kQzBKT25oOXBYcjQx?=
 =?utf-8?B?b2l1TWM2dWxVQjdZa3o2T2UwZTdpay93MzJyckRLSjZ0VVFvVnI3Q0o5ZmIx?=
 =?utf-8?B?MjhSNTFtQnlBWGFhM3BiOGp0dWdOTjVJWFJzNkpiY215eGRTaHVSanE1enFl?=
 =?utf-8?B?UVdWc0xTNDh0cWcySERoS09xVjlscGJEaU1sMUc4ZUpRcWUwNUhyL0N4ZlVw?=
 =?utf-8?B?enBlWi9yZWJpenFoOG1OOWp4RWFDTDJHbGJkN2R0K0hMMU4wU2dFSHpkR2Rz?=
 =?utf-8?B?b0N2V0kwSWtSM0o5L0dBaC9GTDVZSDRxOFFMNU1YTTRzQS9CZDROL1cvOTdt?=
 =?utf-8?B?V2N0cStITysrY1NmYXNGanpMbUZhcHlzQ05KMHAvQU9xOWdCZCtoQm1MQzdI?=
 =?utf-8?B?NmZwVTNaUUIwdzBJbmJuVHk1MEZ4azVuTDZwVXFlVlNjR3R1WElqN2N3dmRv?=
 =?utf-8?B?QlFybHdrOFpvV2E2STA4ZXVFOGpPY3I1dWhzL2VqY1dZU3k1Q1V4UlJ0b1c4?=
 =?utf-8?B?YzVUZXY0WEdGZzBOcHFuNGFUS3Y0K2tKRlNJRGNmWnZVbzFqREZ0OW8zc1Q4?=
 =?utf-8?B?NEZBSDdrUG8wTXBYeDNnbjZVZlV2QU1PV1hISmU3cDRnaTR2MExJM3IzTlhx?=
 =?utf-8?B?YWc5UWx2ZnkxUVNOcVRUQVVNZ0JVVGIwNVR2V0R3eEJvekJqTDIrUXlYQVBP?=
 =?utf-8?B?S1ROSU5XKzV5bFIvZEVCZDZOVVBzVUc2SkpyTzQrNDZIb1hCa2l4N3BQdzFQ?=
 =?utf-8?B?V1BFQmVyYTBObHo5S3pmb3R3cGhFQ0NwUGhxdS8xU3RscFFwdm1vUTl3YzVE?=
 =?utf-8?B?VUpEOGlUV0pSSFBwaVppMHpqUzZGdmR0bVQ0dmx4M3RFQWlZVXdieWNPQ0xK?=
 =?utf-8?B?dHRnZVhSblRVVVptTnRuTDI4U3RNWmRPSlpIekN6dHIwZkRYeHJiTks2eXNQ?=
 =?utf-8?B?cVRrTUt6eFNWUjNNRXZFSE1mVEpyZXJBOC9zcTRTM1c4bkdWZmhWR2FwOU1X?=
 =?utf-8?Q?jbrzKR?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(1800799024)(7416014)(376014)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 04:45:27.6120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ded30ccc-1b88-44a4-9a63-08ddb85a19e0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8816


On 30/06/25 6:27 pm, Lorenzo Stoakes wrote:
> On Sat, Jun 28, 2025 at 05:04:33PM +0530, Dev Jain wrote:
>> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
>> Architecture can override these helpers; in case not, they are implemented
>> as a simple loop over the corresponding single pte helpers.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
> Looks generally sensible! Some comments below.
>
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
> Weird place to put this increment, maybe just stick it in the for loop.
>
>> +		addr += PAGE_SIZE;
> Same comment here.

Sure.

>
>> +		old_pte = pte_next_pfn(old_pte);
> Could be:
>
> 		old_pte = pte;
>
> No?

We will need to update old_pte also since that
is used by powerpc in radix__ptep_modify_prot_commit().

>
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
>> --
>> 2.30.2
>>
