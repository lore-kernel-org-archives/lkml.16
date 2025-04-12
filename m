Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054467FD
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 00:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744416659; cv=fail; b=QFCJvgODGO3OGMVvG8M5r4o/kC9JXCyAtYTDGMoZaVpascc/Axjets4z+O0N0GMhDJAGc9i0433Y5+tjBNj1uTytLnsayIxqWb2I6EuGYbJAoZVhi1jjW2awA5xP2Ar+0FPadbEhDwFWDqdKp9vYzEALNr8imsJKscPOdMUEdmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744416659; c=relaxed/simple;
	bh=fL1rE+k1u7pCyUNGzM2Hsel0ydvJ1ywCrl+xk2/GloM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PRGUpUEJ1D+b7XSfsuNvy5E45LBEz05MVzBTMOGcG1ISdcIMVplERR9YU6ZARNlq9WCzMm9cbt2ErXTdJEM903GQc6ETX3s0qcxkCnPvBp9TR69zPvRaEzRG1RUbC9ohVpga+2STYTbZUZ/44lLND7q3eJH3uIdzSXwIvYwKB2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QdCSiLO2; arc=fail smtp.client-ip=40.107.93.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QdCSiLO2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqzOTn2AXKgCUxc8wSLUZ4+24ANKlG8nnaAA1hG3uV34fBFWPbJ9Cr5tkvSvgoO5zDD7RC4vl/RtZT0SIr8SZKSaLlLYtul4wRMyreE27YjOvc6l3YbtIxPZkF97FIGaOYSchpqr3lFm4RVPGMvLo2CmRmB16EPOA9V0SrnATyQMnmLNwkNfsBu1yCeZxac4lqQQp+l8/j74BoyVEK0Fs05qubxRQElUP+SF9xGY4qtDNE4c/R8qAvqTxtd+BnCv0LtSuOXjCOOSH22Si6lTbocpKiiHGA9JbrqymBqX/rTRWdqqBydx8JylfC8AvDgvImWWzY8812OGpoPZaXqElw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dG8C1bx+ec42oODrZa8+EwlzfZuu6Noy4E2OlHdnmtk=;
 b=L8vBLLiQmioRjnNOgorFu3nVMTgrRIpB8Ffh0UTp8YOr3d3L5Vr1RQkXKQzNsiY7bRERV7qGL/B9Q7julR1Jtefauc6r1SOMMJq7KUkHRLTb1DyY8VVZIPxu+dO58b1ROiSgohQorPE5fZGxF3wnhONECC+Dbn/F2p/WqSlQZKqrE6MeC7P+cBQqqVcWZt5UeX44WTb9glZne4a0zWOSQ4m6bz3qzXeT04P6d0jFvfApMKg2NgOUSXRPuAKVaTwioFi9OxNqTQrml1XWm2XjbfgHczRIR2UTgQV4qB/XMEODh6n1K2VZ1YxfVaL7L+uiJxDMS37i6Ia/yxjsSfIN8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dG8C1bx+ec42oODrZa8+EwlzfZuu6Noy4E2OlHdnmtk=;
 b=QdCSiLO2JaBBlElGIgT6NyMvzI5/snyMZ8SoaiJW7GWfB74Q1yfnbPaW1ExQN7Ena+opJ+427maaIPgzKxn4CSG8M93Z43d7Pb56NVoatUhNaycF1rGphH8UEJF5sDxxXUlorIZotxOv9VQWCLxj9yr68UfOoXBNjn+BQdaQGKq2H9kABNWEwsJQWNDvMAOag8F02Llr8IX9exNOkRLrIdDPa/3VFzmGrz6vinHmcKJQ+2Fj+dlUY6zOJmtFkatvH829Une7TPV3wER4MF+4IkTtIH5YeG34NvKFwOYCWpnuJjhkkE7u2XGpOATX7L7GrBJjhK5i2fcyWNjW/e41/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 PH7PR12MB6636.namprd12.prod.outlook.com (2603:10b6:510:212::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Sat, 12 Apr
 2025 00:10:54 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%4]) with mapi id 15.20.8606.029; Sat, 12 Apr 2025
 00:10:53 +0000
Message-ID: <796dd5de-7a21-4e22-936e-550bcff5c7f6@nvidia.com>
Date: Fri, 11 Apr 2025 17:10:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/21] x86/resctrl: Fix rdtgroup_mkdir()'s unlocked use
 of kernfs_node::name
To: James Morse <james.morse@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>, shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Ingo Molnar <mingo@kernel.org>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-2-james.morse@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20250411164229.23413-2-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::15) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|PH7PR12MB6636:EE_
X-MS-Office365-Filtering-Correlation-Id: 44eaa428-d525-4f6e-b991-08dd79567d2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QkY1NGFseW5rcndLN292WlIxOXhZUVh6eGlacHd4TnB1d215amswbmYvYmdN?=
 =?utf-8?B?OWRKUUJlMm11QWRGUTB3MVYvN1Q3ZU5Nbml4RkxpSHpIbTk4Znc1c2xmRm5p?=
 =?utf-8?B?aThKc1hTekR5WVZoUVVyQVpPQzdJeWFoTW1hRUcyUkhuRS9raWswMmI2dVl5?=
 =?utf-8?B?TzlLczZYNEY2dTFxbG5xcmszOEdOSW9jNkcrTHdaQ2R2NUFzZXpHRVpvSVB0?=
 =?utf-8?B?SWxnK0IwZERvVGVyU3dIT0c3TkRSL0JBUkl2NWVWQ2xUYVZGYlpibUpiSG5x?=
 =?utf-8?B?RUFnUXJNd0QzaFA1U01vcEliZVlQRDQvSVVzS0pRZnQ3SXpwMEpxT2VEb1BO?=
 =?utf-8?B?M2FjYzJSa05HRW5WbXBIUUt3RFlxYXBsaHB5VDFEWW1CbjBiRldubTIzMlRi?=
 =?utf-8?B?YkcreEp0SXMwaWVTY1FFaGwwc3pCSDRpejhZcEJNSUpvSTBMVmtFMlJZb0w4?=
 =?utf-8?B?NGsxamVSOG8vNVMwYUJwRk1XSzZnT1dqWGhzcUp5RFZsdWM3ajNnb010VUhO?=
 =?utf-8?B?WTV1UHpScXVReUVsbGZUSjhDTmIxWXVlKzdhWkNnSnpJUTlUNGxkMXZsOGpM?=
 =?utf-8?B?cy9zL0NJRmJhdmN4UWtUVktNZUJud0ZMMm5EUSszU1AzNmZqTkZOQ0dTRWI2?=
 =?utf-8?B?dmlkR3c4SHV3OWhWZTJzRGpGeWhxVGVyYU1sMS9ZUklZOEI5RitmRzRRdXhh?=
 =?utf-8?B?aERYdzdyREJ0ZDVUZWZmQTJjUFZvV0haZlVDOVQvN1RFQVBLbnk1VjlqZzVj?=
 =?utf-8?B?YmNoQndNeGtzaUpLa1dBT0dPTnl5VW9RL1F3NmhTSXlhdjZUZy9uY21HVjJR?=
 =?utf-8?B?QWZnbEt5T0dZREVxZ1hSd1pSTlh5d00zMTUvbk5uajNVTE8yRlRNRUl6ekMw?=
 =?utf-8?B?YW12RlRHdG9PR1pRV0owc3VoSmg2THVqbHBqeDUwREVwSDhETGw2akRhNkhW?=
 =?utf-8?B?SWxXRDI1REdWYTliNVMyYmdCUVZOWUNOZWpuUnBWTERlMWJ0ZTZTQ0p6YVFC?=
 =?utf-8?B?a0lsdUtSRW9IdjhXVGl0UngybDIyS2NFSG5hZ3NLNUxGZGcyNGlySmxUcmh6?=
 =?utf-8?B?SDI2Q2hyOUdFNVlDc3A3YUZ2aDRrWE9wSzdwRTFKdW56VVlwakJrVlhram1C?=
 =?utf-8?B?NTZ1a1dZQ0ViRWxjVlI5Qy9wd1ArdEM2SDdlV1RXUktJbTJkOE1URmJybStt?=
 =?utf-8?B?N3NqMXFsdno1dE55bDN1Q3NXL2hIMXNqc0gzWUV4Q1dTQ2czSUNJZ3BDa2Qy?=
 =?utf-8?B?SkI0MmRzRUxSc2dLZmlFd2dabDNBdUUrV0l0aG10N2ZsWWlmTVZ3TlVGcDRO?=
 =?utf-8?B?b1daeDBMTnZ1LzNITWptS2NvMG5TL1RQQWJ0NWdDbDVIMUZNWmpRYzVheW9O?=
 =?utf-8?B?bEZHSUxzMlg1bEZZWnZnZGZqU1lxOG9rcnorS3ZFa2t4V1RXOEpDajU5bUcr?=
 =?utf-8?B?SzN5MzFoK091K1lHL1FXUmtKLytDbXNrQngzMitpbFFiWU1IRmN0cnY1VFZC?=
 =?utf-8?B?VVdiWUgxcitUNjQrZGVZaTYwSlBRamkwMGdBWE1wUU5aNjhJQ2dsWnR6T2JP?=
 =?utf-8?B?c21heDBTN1MwS2k5UHZhcmQvSnZTV1J3dDhlMkpFdFdkbmxsL0ZncjFEMnNM?=
 =?utf-8?B?U2ZHbnE0UnRzVERieGMyZWpYdFBJSEE2NVpOcEIxTWU4ejVsN2g5RU5wWXBi?=
 =?utf-8?B?RENUYWdkNGwzZmtDbk92Mmw1a2hWZUlqYzNqQTFoV3gzRS8xZTBLMmlOejQ1?=
 =?utf-8?B?dFdNaFVYckxvU3FIM1F0MUNiNVEzdDJWcGptSkw2OFdJNUV3S0sxZ21QWUY1?=
 =?utf-8?B?a3ZoR3BSaTRXRk5lZllhQ3ljQzhib1ViWlREQ3N6cXBzem12UVlZeEhtcXMy?=
 =?utf-8?B?R2lMQXlDcGg3bmxBT1hxV1AvTXJ2NmVQQ3hLS3ZCQ2Nkb1ZWb1ZtWkxpY0gx?=
 =?utf-8?Q?AWinanulRCQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGxvblIyL0NpTWZ0Z01QYVJVNzA2Yi9TNmxTNmlBMHloL1JKSkVJM0Zza1R1?=
 =?utf-8?B?aGdDWVp0dDNwZ3UrOGpldW82T3NTUWVPTEpzVXNaMjRXd21FeGxhYk9LSWR1?=
 =?utf-8?B?WUNZYnRQcDVMVWUyTG5JYTRmRG9ONjJuMExmdUFISDAwVlJUMHJicnNUTWVH?=
 =?utf-8?B?NzRFbDR5VEhGVWVUNFN1eUM1dnE3SlJFcDhNSFp2VllEb01YbTFMWkQwclRF?=
 =?utf-8?B?QVo1RUp1cnFDaERtVmhPbGFSWjhnKzdMWHRjNGc2NWoyTUpiNFNGVUZGUHhX?=
 =?utf-8?B?S3J1K2xCVkw4blJLMklGdDd5ZkFBeFBiU1g5Z0ZaRWJ4KzFrL3l3MkQ3UW93?=
 =?utf-8?B?VVBCVGtlNU9kREo2QlZZekl3QVZxK2tRSk9kNC93eEtnMUExOTZ3bEdWSGxJ?=
 =?utf-8?B?UXVvSFNqazdLM0diU2lodWJ0TTNjS1BMYmEwcEJpK3lKRFluOGoxYzJwOUtH?=
 =?utf-8?B?ODdENkFyVUFHRGxEMytPRS9YbFIyb3k4dmYyOUZhZ3VVU3hRK0gzbTZzTmRH?=
 =?utf-8?B?RWRuMy9TN3JCWEY2TThZZ25EN0thMXI2U3BXa1lwK1E0RFdpZ3U0RkNLdVRI?=
 =?utf-8?B?SzVJRnpnbmZxVW56cFRwRlpGc0s3WS9LZkVFZ09KckdsKzl4SHRWZEVGdGFk?=
 =?utf-8?B?eHdPY2xEYjBsUURVM3Y5N0JkUnNBNUhZWk1LZCtpWUMxcGVRdGYrZGNWM0E2?=
 =?utf-8?B?akF2K0ZDbFM5VXhGR1FhWHI1UjdXM24zK2Q2ZFNEdnBmM2dnQ2h3WXg2TWl0?=
 =?utf-8?B?dVhwLzYvcGIzaG5FdWw3UWdEZk5LUDYzS1o2anRTUkRWWVlBVndvbWFNb255?=
 =?utf-8?B?N2VOLzgrQ3FiVWZoc29va0JyTkNFN0Y5VzNPQ3FRTWZRVE1lcWRZQnlmcjM5?=
 =?utf-8?B?YkdTZjBEM3pqc2o5UE9SS0p2b1A5RnZ3T29vRUNQRk5oOE1jdCsxWjJwZ0x3?=
 =?utf-8?B?YVlabG9KMG1UWG5Vb0dXd0ttVGlEMi8rODVlYnh2OWFPZ3FjcUkwcVpRY2My?=
 =?utf-8?B?clhSYTdEVklBR3M4NzNETXVxeDNXanZnamFROElyaTRvTExUdHltSGY4ZzYw?=
 =?utf-8?B?SjRCUDBPUU1KRzRjckJjR2ZEemkwVUo3ZWF3WXdvck8vcG84RENjOVhBbm9o?=
 =?utf-8?B?amFaRU1JbGkwOE5tRjdEa3lSNmZabjVvelJXWkJSNkwvcDdIc2F2RkZFWmpw?=
 =?utf-8?B?UVg2YXNuV1pQSXNMV09PNExmK3dwWnRkVllGNGMrUWpTNEtTaVdocmFYQWhU?=
 =?utf-8?B?T1drQ3ExYnZIYm1FU2NDTXZ5d0J0WG1mc0krYUxIK2drc25qWUhZV0pNcG5i?=
 =?utf-8?B?VEpUSFRVU2FteHNtVEpPVlBzVnNrem53bjZlQnVQREV3eHRsK2puNkJBaXR1?=
 =?utf-8?B?YnBVL3djVjJvTm5sNkllazBtR1RxK3JOOUg5Rjh6ZytKU01xSGpXcVoyYTNZ?=
 =?utf-8?B?d05jZ2JqbjNVR2VGMVFsRGIraFNsQUhMbnpiOGFQQzdBVEpkWFFwWnYwZFU4?=
 =?utf-8?B?dTdIYW5TRndNdzViMFZ3aVVpOSt0dk5Na2g1V3ZsL3ExUk8vdGQzNXEyMWYx?=
 =?utf-8?B?UTFFNVFFUXF6MFJPQUp3UmMzbEJYRlpFTzJQNnFOMlZ1NllwRFo5NlFLbTlN?=
 =?utf-8?B?N2dlaDY2SHF3bE9qKzJSdTByK05uNXY3Q0tvakVjbmF2V1cxZ0RDb1Z3OHRW?=
 =?utf-8?B?clRSRGN3d1VHcFA2UXNWZGRXRGowamV1d0hkT0xCZGZCRFdRaTRZWTlJWXFn?=
 =?utf-8?B?MHVTRFlZT3NnR1kvUkh6NGRnUTl6UTk1NGN4SXhYYTZpUFM2THlqL2U4bFdl?=
 =?utf-8?B?RXNxRnBBbjdnNmo1THFsTHNMWUl6N20wR0lCQld6V2dXVW1RY1JGVmJSYVB2?=
 =?utf-8?B?a1RacEY1NDRZYldXVkQ0NG5ObmpIc1B4aWhIWThSRzVWRGVWdzVVekd4ZDZX?=
 =?utf-8?B?VU1xeGxTTU85NTk5WXU0dzliRGNGK0FjanNSYVhpQ1hPTVltZjQyRVFrRzFE?=
 =?utf-8?B?TUgzSDluYXcwTnowQzAyRTBJY3cwK3B2Rm5RZllPdnA4VkhOb2NYVWE5SVE3?=
 =?utf-8?B?cERpRXplNTMzNXpvNXA3YXhRYTFiZ094eFpuVVpOVVNhM0NDb2RLeG9Ec0dX?=
 =?utf-8?Q?rU1U/rLwYqD/ATrJTjT6Cj/wC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44eaa428-d525-4f6e-b991-08dd79567d2c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2025 00:10:53.4972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n7hfCDor3pYrU1K9sTGWg9qGPCN7oyUgyyYczUdO8ImyylIq4jbTwDzEEaEcyl2HW+rmkSJL4B80yiUV4xa7pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6636

Hi, James,

On 4/11/25 09:42, James Morse wrote:
> Since commit 741c10b096bc ("kernfs: Use RCU to access kernfs_node::name."),
> a helper rdt_kn_name() that checks that rdtgroup_mutex is held has been
> used for all accesses to the kernfs node name.
>
> rdtgroup_mkdir() uses the name to determine if a valid monitor group is
> being created by checking the parent name is "mon_groups". This is done
> without holding rdtgroup_mutex, and now triggers the following warning:
> | WARNING: suspicious RCU usage
> | 6.15.0-rc1 #4465 Tainted: G            E
> | -----------------------------
> | arch/x86/kernel/cpu/resctrl/internal.h:408 suspicious rcu_dereference_check() usage!
> [...]
> | Call Trace:
> |  <TASK>
> |  dump_stack_lvl+0x6c/0xa0
> |  lockdep_rcu_suspicious.cold+0x4e/0x96
> |  is_mon_groups+0xba/0xd0
> |  rdtgroup_mkdir+0x118/0x1970
> |  kernfs_iop_mkdir+0xfa/0x1a0
> |  vfs_mkdir+0x456/0x760
> |  do_mkdirat+0x257/0x310
> |  __x64_sys_mkdir+0xd4/0x120
> |  do_syscall_64+0x6d/0x150
> |  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> Creating a control or monitor group calls mkdir_rdt_prepare(), which uses
> rdtgroup_kn_lock_live() to take the rdtgroup_mutex.
>
> To avoid taking and dropping the lock, move the check for the monitor group
> name and position into mkdir_rdt_prepare() so that it occurs under
> rdtgroup_mutex. Hoist is_mon_groups() earlier in the file.
>
> CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Fixes: 741c10b096bc ("kernfs: Use RCU to access kernfs_node::name.")
> Signed-off-by: James Morse <james.morse@arm.com>
> Acked-by: Ingo Molnar <mingo@kernel.org>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
>
> ---
> Changes since v1:
>   * Add a word to a comment.
> ---
>   arch/x86/kernel/cpu/resctrl/rdtgroup.c | 48 +++++++++++++++-----------
>   1 file changed, 27 insertions(+), 21 deletions(-)
>
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index 93ec829015f1..776c8e347654 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -3553,6 +3553,22 @@ static void mkdir_rdt_prepare_rmid_free(struct rdtgroup *rgrp)
>   		free_rmid(rgrp->closid, rgrp->mon.rmid);
>   }
>   
> +/*
> + * We allow creating mon groups only with in a directory called "mon_groups"
> + * which is present in every ctrl_mon group. Check if this is a valid
> + * "mon_groups" directory.
> + *
> + * 1. The directory should be named "mon_groups".
> + * 2. The mon group itself should "not" be named "mon_groups".
> + *   This makes sure "mon_groups" directory always has a ctrl_mon group
> + *   as parent.
> + */
> +static bool is_mon_groups(struct kernfs_node *kn, const char *name)
> +{
> +	return (!strcmp(rdt_kn_name(kn), "mon_groups") &&
> +		strcmp(name, "mon_groups"));
> +}
> +
>   static int mkdir_rdt_prepare(struct kernfs_node *parent_kn,
>   			     const char *name, umode_t mode,
>   			     enum rdt_group_type rtype, struct rdtgroup **r)
> @@ -3568,6 +3584,15 @@ static int mkdir_rdt_prepare(struct kernfs_node *parent_kn,
>   		goto out_unlock;
>   	}
>   
> +	/*
> +	 * Check that the parent directory for a monitor group is a
> +	 * "mon_groups" directory.

This patch is in upstream now after 6.15-rc1. But the commit in upstream 
is slightly different from this patch:

+        * Check that the parent directory for a monitor group is a 
"mon_groups"
+        * directory.

This slight difference causes patch #17 merge conflict.

You may drop this patch and also fix patch #17 to fix the conflict? 
Please see my comment in patch #17.

> +	 */
> +	if (rtype == RDTMON_GROUP && !is_mon_groups(parent_kn, name)) {
> +		ret = -EPERM;
> +		goto out_unlock;
> +	}
> +
>   	if (rtype == RDTMON_GROUP &&
>   	    (prdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP ||
>   	     prdtgrp->mode == RDT_MODE_PSEUDO_LOCKED)) {
> @@ -3751,22 +3776,6 @@ static int rdtgroup_mkdir_ctrl_mon(struct kernfs_node *parent_kn,
>   	return ret;
>   }
>   
> -/*
> - * We allow creating mon groups only with in a directory called "mon_groups"
> - * which is present in every ctrl_mon group. Check if this is a valid
> - * "mon_groups" directory.
> - *
> - * 1. The directory should be named "mon_groups".
> - * 2. The mon group itself should "not" be named "mon_groups".
> - *   This makes sure "mon_groups" directory always has a ctrl_mon group
> - *   as parent.
> - */
> -static bool is_mon_groups(struct kernfs_node *kn, const char *name)
> -{
> -	return (!strcmp(rdt_kn_name(kn), "mon_groups") &&
> -		strcmp(name, "mon_groups"));
> -}
> -
>   static int rdtgroup_mkdir(struct kernfs_node *parent_kn, const char *name,
>   			  umode_t mode)
>   {
> @@ -3782,11 +3791,8 @@ static int rdtgroup_mkdir(struct kernfs_node *parent_kn, const char *name,
>   	if (resctrl_arch_alloc_capable() && parent_kn == rdtgroup_default.kn)
>   		return rdtgroup_mkdir_ctrl_mon(parent_kn, name, mode);
>   
> -	/*
> -	 * If RDT monitoring is supported and the parent directory is a valid
> -	 * "mon_groups" directory, add a monitoring subdirectory.
> -	 */
> -	if (resctrl_arch_mon_capable() && is_mon_groups(parent_kn, name))
> +	/* Else, attempt to add a monitoring subdirectory. */
> +	if (resctrl_arch_mon_capable())
>   		return rdtgroup_mkdir_mon(parent_kn, name, mode);
>   
>   	return -EPERM;

Thanks.

-Fenghua

