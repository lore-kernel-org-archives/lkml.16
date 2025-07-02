Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC182F5082;
	Wed,  2 Jul 2025 16:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751474554; cv=fail; b=ZOt279zVoxsdtZaJZOSeQIWyEQfQ7+WO/0X1/xNkU+OmlBXXBBEp121qsY4fTieRSP345pWI/PcoRYmbD8DAZSeFhCFp43/M032pdDrC10dVYD/cuqvKG6eOMVy7NOLLhlS5ptBNRWYOUs4JdtzwKkCvZWixqXMucU2IBGG7uIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751474554; c=relaxed/simple;
	bh=lKmenS9zXc7YI+NEs+9kcLfO3VGykUs36Y1v1SZFfIs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gtBoX3lJePtlOb60FfvLpGoSgCmA9tb7X3YDORnoAQrroCBdSPcmebnbRylUPR5c9sdz7oH8Mst8nXWyRbyR8qLp3V8zUhS8Ph9bMTyogDzN3ML/YDqcxAhgf/QhvJ29+/Ux01xvj/hu8UBrfS1pibYMJGdX5+YjfjOca5y71fU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=imoLijzH; arc=fail smtp.client-ip=40.107.93.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="imoLijzH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmkOTR2kadBbNfh95yqab2/BO0Wbg0TpGBXmWSaTnpmM+jKTQ6c1KZ7953r+lhTxz6wcKQl0Y0tMtx4SkewBjTZpqf8+2Go1+vJZj9gRU9dCiYcbkvi0s+Z6nwSXgW4lCGPhHR5eTOUGWIAO6t7Z69cmiaDmBO8/eWbap1tJQI2SZD0wkIKuylomp3dLi89r+kit3YSyJ5aMIM4zgh9QRBRmvcZ7dbBOg+LzS88zmQ1F7nWN6cVHoSBepHu+aY/CRKI1KM4/Oqdk+3VuWa56jpwRPuaZKWfATzsmYa5lIVTTNRqAHKTlPX5oX3sgRjR4dfjAzIWsOKdavI+FVBUy4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6ZTjMOxDMLJZXN9TUzRQZ+taGPFsdmV4pF/Nmv6Pdo=;
 b=WMjF/BogT/D+iGF1wg7NSERj8E8NKOo/zicS8OCNChQSI+IBgXsv+TpXeZSEyUvHL4I0DvE4uj7v+KKEKLJyhq0YnHNjHCAgvsX3chut3F2iUb6zdaGDQEMZyl2nbuIqBGEaPR41rf2UXmcMWJhvhpFooTwJ9TWzOEWWPIRjNP3Nr13IeY/q2Q33ETydeelMU1EHlVPRFTF4AZUseGmYSKMLENjCB+zRjDNjfkm70ZhUQk9Su6Rprd0j1crs4aLOGmPHhMlKQE0rxw5hqf3zUIp9TdJiaZKI6Sz/QuFGs3rp0W5zik4jJsTlzAwzWIRUsJs2xzcu2T+4NZrI97R7Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6ZTjMOxDMLJZXN9TUzRQZ+taGPFsdmV4pF/Nmv6Pdo=;
 b=imoLijzHyZAFHxpUpBi1qFJJPHRxll0lpb/MJeU2EBqqfv7iJizUDwtG/H/Wotj7jB40sxYfc+22Cp6P+SBsfuB/wDZdnRJ/3swHCjya1V+zlaU22eShfsyXKHohcEYQOqmg71EBr6pkJCK22T4lHhDC6Qx7NISoWLQqvBy3qkY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by BY5PR12MB4193.namprd12.prod.outlook.com (2603:10b6:a03:20c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Wed, 2 Jul
 2025 16:42:28 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::d22d:666e:be69:117f]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::d22d:666e:be69:117f%3]) with mapi id 15.20.8880.034; Wed, 2 Jul 2025
 16:42:28 +0000
Message-ID: <f85e467a-1d17-4f34-98e3-512679baad47@amd.com>
Date: Wed, 2 Jul 2025 11:42:26 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v14 30/32] fs/resctrl: Hide the BMEC related files when
 mbm_event mode is enabled
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 rostedt@goodmis.org, paulmck@kernel.org, thuth@redhat.com, ardb@kernel.org,
 gregkh@linuxfoundation.org, seanjc@google.com, thomas.lendacky@amd.com,
 pawan.kumar.gupta@linux.intel.com, manali.shukla@amd.com,
 perry.yuan@amd.com, kai.huang@intel.com, peterz@infradead.org,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, mario.limonciello@amd.com,
 xin3.li@intel.com, gautham.shenoy@amd.com, xin@zytor.com,
 chang.seok.bae@intel.com, fenghuay@nvidia.com, peternewman@google.com,
 maciej.wieczor-retman@intel.com, eranian@google.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1749848714.git.babu.moger@amd.com>
 <4769751d1de7c4f66b1c7f3c5ea7eeeb49951363.1749848715.git.babu.moger@amd.com>
 <3c753f3c-e91b-4cfe-983d-efe8ff07b750@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <3c753f3c-e91b-4cfe-983d-efe8ff07b750@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9P221CA0004.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::9) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|BY5PR12MB4193:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a1be3a1-bcb8-4eb4-1ef5-08ddb9876e9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?alY5YWdMak5BZlRNLzZlZ3NYZTgzK25EQjkzVU1iNFlnanhQejFGcVRnU1RL?=
 =?utf-8?B?Y1BhVFQ2QWt3aDFNbzNoMDJ2MDM5TkdvdFF0d1ZTbVpRWUJWZGNMemY1Zit6?=
 =?utf-8?B?TFhuc3BSZUFnNVJmMjJKbUc5MUpWWXR6MlY1dm5aTGd2cU1yemZzSFJsZWMy?=
 =?utf-8?B?YWpMN0VaWDVLL3RiYnFqU0x2SG9Ic3lmYi9qcmJoT09QeXpMWUo0QUx2ME5J?=
 =?utf-8?B?NXhGVDhEVVhwODgvYVRydnhpbkhTeWFzUUlyNUhhRm1KM1N6VmlDNkFRYyty?=
 =?utf-8?B?b1FxVytVaGczTE10YkswdnlTRG45UjdYT0xERHk3VkErazBSVFFoZmR2M3Av?=
 =?utf-8?B?bE9hWFJiWmpCQTJMNTdyWC92cEdNZVJjQ2huTU1aWUpIaXNzdVBuOUlDa2FL?=
 =?utf-8?B?K3p0WVNMUmVqZnltQXFyT2FtOGRUckpOMWtFeDZJZGVORHpJSzFLRkU4WDZn?=
 =?utf-8?B?bXBxSG03cno0SGpVY0NQSXZONlpmOVM5SnUxakxsTVFqNHg4aXAxNTRmTStv?=
 =?utf-8?B?UHBxR1cwdmtUcjVvUEhwdVA0cStKd0ZOTkxzY1VDRmxWU0ZDZlJzZGNsZmNE?=
 =?utf-8?B?UEpZNTA1TjRmZGEyck5SZE5FZ1NFTjc0MExsWHZhdXV2bmZYSGN5TjZlNXl1?=
 =?utf-8?B?dlc1SGpBMVhRQ1A0Ymh6ZXBCa01kT3hzSmhEUGZIbzVRNVovSiswbVl2d2kx?=
 =?utf-8?B?TXFKS25JOVBlWGQ1bmg3VkF2UXdLdnc0SlVTOEppVkF3REk2alNMSndVYnZz?=
 =?utf-8?B?NGVzUWpiRWZucDRMLzZocUpxY2QxRXRXTGJvbUNkYW9UUGRBampyd1Q2dFdU?=
 =?utf-8?B?WlJvbkh5VUV0SGM0bmNsM3FoN0lCWGxqd05Zb3htSm10S2FSSTdVYURhamRK?=
 =?utf-8?B?MGlDWE95T1AzUTRFNW9JZlFvVWdaYTJYUW5FaGdPSmNsekF3WmtBcXNmbkhB?=
 =?utf-8?B?QW02bGJsZkdsQ0hESnlCRG1SRUwwR1NNOHhTZkpwRXVzbER4Rjd5ZS9mZCtw?=
 =?utf-8?B?UklCUnNWeThCczJjSjdoQmJmQWtjTmJvbHFxL2V1bXdaVVJsNjNmeDR4Kzlt?=
 =?utf-8?B?L2VxcitlUjczOWgrSndLVWtpMkxRRXpDTmc5VG9pbzdiekUzYnd1WGl0V2xI?=
 =?utf-8?B?RkJMeUhHa0hybk5iczd5Nkd5YUdNbUdUUWN0T0NRVUtmemVxVlVPZjJ5TStE?=
 =?utf-8?B?OHVvTFdhZ1ZVNytmUjBEYWZWaTcyMXNTbk1pNHc0TTNJWnYvUzlOSXpPYXI4?=
 =?utf-8?B?bGliQ2k0YXo2dDlJNVdYTUxSaTh0RFF4T0p1ZVhtYVBvNndkK01UbUFta2p4?=
 =?utf-8?B?WHBDdDZpcFlpNTFVZzVlc0wxaXB1WkxJMGwzNTFya3lIU3A2RWduWlZtdTVC?=
 =?utf-8?B?TGVhaEQ0Sk1IZmlWOTdrUlFiTDRnMHFiQnlodVZvb1RjL3JkUlp1TGhWQ2to?=
 =?utf-8?B?b05ablVHTVByek1Wc2ptbWwvRTRJa0poRUhaZHZxa0RSeTR4UFdwNGgyYlBB?=
 =?utf-8?B?QWQrcGZna0kvZVQ2Z2ViTjVtOExOR2lIaWtkcjQzcm5EbDJLQXdPNlJvYXhD?=
 =?utf-8?B?enZzcThMS2psbnphMm9PN2lGRUNtdnZMcWlvTjNjMUlHempkNWFOYmNZZktu?=
 =?utf-8?B?cXd6VEZUYXZWRGh4VUNOTDlDYjJ6R3FFQmdyNm1UTFo4aVliN1pkdTVYNXZi?=
 =?utf-8?B?eVlZUEI0bnZsYmIzU1ZKYUJlaFJlWWVDcXFpNENKcy9DaDN0ZHZTSFdaZUVT?=
 =?utf-8?B?QVhaOE85TlZMTmJSa1ZKdkU5WVowYzBjdkNQSGNuckE1MjVIdXgzWTRaMDhy?=
 =?utf-8?B?dytLdlU1cGZQNjBnZGdTN1NjRWdaNWpsdWdCWmhjbmY2cHZaUUVXVnlZYTMz?=
 =?utf-8?B?cVBDUEliR05vajNtejErMTZaRXREcVV1ZXV5OVRxTUozQ2Y0OWkzMzB2MEZH?=
 =?utf-8?Q?/luUtjVyhSo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXhaNkpyTkRvSWk5RjZXUDdXZithLytyNGx1Vk9qM0RmSzN2dXVqV01rUFUv?=
 =?utf-8?B?RFBHODdFWjR6TFpUWDVkbmVsTGpzY0k0OGN0ejNtU0tTbXhTQ3UyeURKeFVn?=
 =?utf-8?B?aUY1Q05obnZna0loQyt4VEt3Z0RrNjNReW82MTJ4S1F6eDh5Mmh0WjBHM1Q2?=
 =?utf-8?B?THpqQ3pFcitHbUJWNzB4UVpqZU8rRW5EM2RlWGVKMFFEVDJJOW41anREWlQ4?=
 =?utf-8?B?c2M4dWdCdkc5bTVrR2tBNnpxampld3pYbkJ4clBMem5CYWV4QURWL3Q5STRa?=
 =?utf-8?B?RXkrUlhTakc4RVVpOWhKWnBKMnFqam1vUVRnQ3c1endNc3FCclRKRllGNnlQ?=
 =?utf-8?B?UGtHaWFxVnRDQlVLNUxwYnZndDlmV2pXVDJobXdoSXNhUHl5cm52TjlSYkJK?=
 =?utf-8?B?VkM2dHJ6aGhJd3ZPREI1WjRUSmdzdlc2Y29OZHFKVkx0VHRGK2MyNHZMeGYx?=
 =?utf-8?B?OXNxVG4yVEJYN2liS1dCZmZVOFRzakl0UFRpbFV3S3NJRWNzcldtV1JkUnJD?=
 =?utf-8?B?b1JkYlJwdzV0Y3ByN0Z1Y21CS3AzcXBZRmZoMDlkR3AyaVpPdnAzSTVSZ2Zu?=
 =?utf-8?B?UGtITEhUWTlTZlNUVk1UMnFXMVNFRWl3M3l5blkzUWl4U0FDS1dUNVRST0hG?=
 =?utf-8?B?Uzl2UUsybkFuZkltblkrN0xtNFQvS3NySFJsTlYrVU9kMWVjZTdXTU5kOWlV?=
 =?utf-8?B?YlM4SGUrQjRKVitDV3kvcVArQnlja2FtdXRBMHF4WGxDc21wQ2tkK2FRaXZZ?=
 =?utf-8?B?Q0NzK0RMc05yL0RmZzBZcytNU3MxWjVnemNNcTRia1d3ZDBRS1lDWk1MZWQ3?=
 =?utf-8?B?ZDk5TDdOL2JQK1N3L293Y0tnY01mdlN0VVhmZ284QzU5bDFyYTNSamVBZ1po?=
 =?utf-8?B?cGo4cUdDK2lDc3pYN3Y1WVA0V0VVRTkyM2d3ZkZMQjhkUmtURFR3a2xjcnlv?=
 =?utf-8?B?TVNZN1lXN3FTQVplaVpoVnZheDVoLzV6VFdIWjVTMVFCaGszeGUvTm9Nak1M?=
 =?utf-8?B?blpaRGVkOWRWWVZWWGwwbDBBRUhMNk4xY1Q2Qi9MYU94U0NKemZGSUkwZVFk?=
 =?utf-8?B?dTNRMVhUemFpdy8vRlk1WjU5U3kzZitaQ1I4S1cranJETitXZGtqQXBuYmFI?=
 =?utf-8?B?NXhhTWdjWEhDSndEcFA2ckw0L0g0RVMxSWNwcmc0M21JTUkwRnMvQVVFVlBU?=
 =?utf-8?B?Q2NFV3hHakxuSThTdVlOQ2k4L0swbzFjMEdlZGNUV21FV0FLK0g3emhMWHVW?=
 =?utf-8?B?cTJSYkFuQmFLbEluTmVGQVljU2s4SUkrV1pZSDdnTkdkSjdJcUU5WkJJeHdJ?=
 =?utf-8?B?TjVaK2ErSnNjdytkWG9uUDNWaWdhejM1Vlo5bGFtRTg1MG9OTWQyRVdmdEJ3?=
 =?utf-8?B?c1U1S1BTblVoU0ZYQ0pwVEdWSWxkaGlGRXcxZk15VXkvcC84STVNc2ZGMWlB?=
 =?utf-8?B?Mk1tVEtaYytvOEplVUxMMG5MR3QrR2huOU03aG9SYnNzcUVWV1R1dEtKZTNE?=
 =?utf-8?B?aERzMHRiRXRjTVNSTzlXdnNBTlo0TlN4bm1ieENRTTJUSkJleDZ5UmUxMEM1?=
 =?utf-8?B?c3d2ZlZiKzVUVXlycFRCT3hxOGV6dlVyUkxIVXRyZ2dGQVR3a2I3cU90bnJ2?=
 =?utf-8?B?dnpDZ3BPMzNUQUwwdVZyRHBtdFpEZTI2V1lWZW5lVGhOUnZOMW9VUmhjN1JS?=
 =?utf-8?B?YUlwU25COHBzNWMxY1gvNkd0VThnSy8rRncvUWV6aTljWG9lWitZTkdBUmNT?=
 =?utf-8?B?Q1p0d0k0QnpCblgwdW5jcFFCZ2trS3RuRXJQbm83aXFLbVZJczA5UlY3S0xi?=
 =?utf-8?B?S3ZRWlJMN2gxcCtZNEVvN25oRDk1VFhwelkvMDRZVk15eFlHSmdxQzN2Z0dk?=
 =?utf-8?B?U3FFd0djY0pRS2pXSTY4ZU1xa21uOE40ZUxGK2FGdld0OHJvTjhzb2tWNlFH?=
 =?utf-8?B?ZC9wRXFmek1VK1ppeXpDUTVBWXVUc3BSa3QwME1sNkNpRmsvNGtQeVJtWU00?=
 =?utf-8?B?NzNSQzNLbk1LM0dqTFVnMC9MMHlWLzB4T2o2VUpYV2lzUFhmZmdUZmIyVldD?=
 =?utf-8?B?Nnd6eDJMaG16UkVVWFpVRFNleis5cE10dFBUZlA2THhxdkx5UkpLSnk1VHFa?=
 =?utf-8?Q?/hl4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1be3a1-bcb8-4eb4-1ef5-08ddb9876e9b
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 16:42:28.7541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqzoQxWsDMPnqEmiyNj4DG4xgSO9w1n59eUzOstaiQmljspJRGhsO28RwaYjXtnW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4193

Hi Reinette,


On 6/25/25 18:39, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/13/25 2:05 PM, Babu Moger wrote:
>> BMEC (Bandwidth Monitoring Event Configuration) and mbm_event mode do not
>> work simultaneously.
> 
> Could you please elaborate why they do not work simultaneously?

Changed the changelog.

When mbm_event counter assignment mode is enabled, events are configured
through the "event_filter" files under
/sys/fs/resctrl/info/L3_MON/event_configs/.

The default monitoring mode and with BMEC (Bandwidth Monitoring Event
Configuration) support, events are configured using the files
mbm_total_bytes_config or mbm_local_bytes_config in
/sys/fs/resctrl/info/L3_MON/.

To avoid the confusion, hide BMEC-related files when mbm_event counter
assignment mode is enabled and update the mon_features display accordingly.

> 
>>
>> When mbm_event mode is enabled, hide BMEC-related files to avoid confusion
>> and update the mon_features display accordingly.
>>
>> The files /sys/fs/resctrl/info/L3_MON/mbm_total_bytes_config and
>> /sys/fs/resctrl/info/L3_MON/mbm_local_bytes_config will not be visible
>> when mbm_event mode is enabled.
>>
>> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v14: Updated the changelog for change in mbm_assign_modes.
>>      Added check in rdt_mon_features_show to hide bmec related feature.
>>
>> v13: New patch to hide BMEC related files.
>> ---
>>  fs/resctrl/rdtgroup.c | 42 +++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 41 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 92bb8f3adfae..8c67e0897f25 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -1164,7 +1164,8 @@ static int rdt_mon_features_show(struct kernfs_open_file *of,
>>  		if (mevt->rid != r->rid || !mevt->enabled)
>>  			continue;
>>  		seq_printf(seq, "%s\n", mevt->name);
>> -		if (mevt->configurable)
>> +		if (mevt->configurable &&
>> +		    !resctrl_arch_mbm_cntr_assign_enabled(r))
>>  			seq_printf(seq, "%s_config\n", mevt->name);
>>  	}
>>  
>> @@ -1813,6 +1814,38 @@ static ssize_t mbm_local_bytes_config_write(struct kernfs_open_file *of,
>>  	return ret ?: nbytes;
>>  }
>>  
>> +/**
>> + * resctrl_bmec_files_show() — Controls the visibility of BMEC-related resctrl
>> + * files. When @show is true, the files are displayed; when false, the files
>> + * are hidden.
>> + */
>> +static void resctrl_bmec_files_show(struct rdt_resource *r, bool show)
>> +{
>> +	struct kernfs_node *kn_config, *l3_mon_kn;
>> +	char name[32];
>> +
>> +	sprintf(name, "%s_MON", r->name);
>> +	l3_mon_kn = kernfs_find_and_get(kn_info, name);
> 
> Similar to comment about resctrl_mkdir_counter_configs() (resctrl_mkdir_event_configs())
> I think this can be avoided by calling resctrl_bmec_files_show() from 
> rdtgroup_mkdir_info_resdir().

Sure.

> 
>> +	if (!l3_mon_kn)
>> +		return;
>> +
>> +	kn_config = kernfs_find_and_get(l3_mon_kn, "mbm_total_bytes_config");
>> +	if (kn_config) {
>> +		kernfs_get(kn_config);
> 
> Be careful ... kernfs_find_and_get() already took a reference. Additional
> kernfs_get() is not needed.

Sure.

> 
>> +		kernfs_show(kn_config, show);
>> +		kernfs_put(kn_config);
>> +	}
>> +
>> +	kn_config = kernfs_find_and_get(l3_mon_kn, "mbm_local_bytes_config");
>> +	if (kn_config) {
>> +		kernfs_get(kn_config);
>> +		kernfs_show(kn_config, show);
>> +		kernfs_put(kn_config);
>> +	}
>> +
>> +	kernfs_put(l3_mon_kn);
>> +}
>> +
>>  static int resctrl_mbm_assign_mode_show(struct kernfs_open_file *of,
>>  					struct seq_file *s, void *v)
>>  {
>> @@ -2808,6 +2841,13 @@ static int rdtgroup_create_info_dir(struct kernfs_node *parent_kn)
>>  			ret = resctrl_mkdir_counter_configs(r, name);
>>  			if (ret)
>>  				goto out_destroy;
>> +
>> +			/*
>> +			 * Hide BMEC related files if mbm_event mode
>> +			 * is enabled.
>> +			 */
>> +			if (resctrl_arch_mbm_cntr_assign_enabled(r))
>> +				resctrl_bmec_files_show(r, false);
>>  		}
>>  	}
>>  
> 
> Reinette
> 

-- 
Thanks
Babu Moger
