Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D851ACED2
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 18:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745863604; cv=fail; b=XzqbRTtDk3REH926cMmTibhC3GimRAnjPoMvGp0NHtZ5VB9BBQ7f7r/Tbidv9h+iRLePvqy1WOf2klLaAXgrfJ3x0kLcTiZb9LTp/yKtKlIH1J3gl9FhEOpR4ZpDuaQ/4UXw+BgK3ritSOAWM7sfL3Q3vOOxmd1r8c8eXQE0McA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745863604; c=relaxed/simple;
	bh=d604cLEDQCY381rrbBtV4IpLeAzPPScIO1YXGCAQvLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FrmfEzo5AE7piHs+qkdKFPsPy4H2K2Eh6yNbmVFGVhoHf3NkscFZsdxzyf6AwLOQ2zv4E5eaxDxFLEU65NXStxZwlhqqnFzHYBSEUg0Bw9zYOeK9NfuFRCFoDr8mw0Ip/gApfnkcQuMzNTZgvuUI/UFgOG8DQ/8wfD3H73x+aYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=izJuRjnM; arc=fail smtp.client-ip=40.107.223.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="izJuRjnM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9wcVHsCRRn/F4FevOrz7L/zLB3XEs6WSnPa+F/iINq4kSCQ3KFTHYH2bytYIQYmRnhfBMedz6ZV+b/QB6EKpGJkpTiaTKmCfd/5FlmFqFnoxO1fKMLWj35ugAjeWEv4fayyi3JwUkF1om1gDiQCPQIvO5YXFUGvheKDuMO2ehLoIWQ4dWdcR0l3edQDZLIUl9v3eZ0g0JvPUzj/1VgrwFixtYNxnz+qnw3pTp+PODvzzgYP0uJvbzA9pyL4vkB1COYV2/e2awbtUg72Tw5iuKfOUI9c2aJxKrfAWm7UCeZLmWSBW5vnqL2A/01R8UN95lnwyjCDB43NUb/BjU6MBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEnr6Sx1gemJgvJzFSAlQy+xj13hfGTnYfOpiX8ykzg=;
 b=e7d8ZLwLfzQbrN1BJoJPjQY7sUC55RyPpCGdYUZOFPfM6K6HRomyhwsWad2lE6HPs8GXkZzV+0+SGeErQzdpozKRC6IZ6HSciiKL8J8czuu3njdOLftFNh9OZiMIxt0VLNwYT+QJKMQqMcaTvY8NAvr42wcTph2nEL6oEWusp9duv+44qNXCfyVIwBUEzYE/nz1B5BCAx9wmOZJrf8yJaXsXEB1DUNFseo1LTsig6fmSMgXOxZMs0JKHWk7PD/dETpJ/6+fMKpNYvxvYr05CX4DrJpmtBZUU7Iuqj2i8DHHsXSEiE3eG8V+AsbwKun6P3FVWF6yqeLG9/pEoZsiKKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEnr6Sx1gemJgvJzFSAlQy+xj13hfGTnYfOpiX8ykzg=;
 b=izJuRjnMiQstW7zM2CWQ+iX2DDosM/U1NbHzIt0Fwz4CyNmopfovf7z0XiCbGkN8rDMls0gE8tvE3P2SqhPNF6iKI4kO2zA2F6pN7swEmVp7rRstSgm6U5AAdskxzV4hmsdXati/dmUlTrY/ln8n5sIwmoUofRWk6FfUSpHdNweYBcbLK6qZMIhcp2oCR7EUY1aZhRkr7oFY2JFxitv8QPHFpc69fTGZND5F3KcdcieH7uh3YzuKEjoR2XEExyq0bf54ctq5hudXVmM1AiPbkTgHbC13Pi7jan4n+pENppk+NMa/WYnQaVLI0msE4kIyFnWAHD85kg9WySTboRH66w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CH3PR12MB9170.namprd12.prod.outlook.com (2603:10b6:610:199::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Mon, 28 Apr
 2025 18:06:38 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 18:06:38 +0000
From: Zi Yan <ziy@nvidia.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
 willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
 lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com,
 anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 namit@vmware.com, hughd@google.com, yang@os.amperecomputing.com
Subject: Re: [PATCH 4/7] arm64: Add batched version of ptep_modify_prot_start
Date: Mon, 28 Apr 2025 14:06:34 -0400
X-Mailer: MailMate (2.0r6245)
Message-ID: <3D9FEC39-98C8-435B-BEA0-BD30EBB05E79@nvidia.com>
In-Reply-To: <20250428120414.12101-5-dev.jain@arm.com>
References: <20250428120414.12101-1-dev.jain@arm.com>
 <20250428120414.12101-5-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR08CA0021.namprd08.prod.outlook.com
 (2603:10b6:208:239::26) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CH3PR12MB9170:EE_
X-MS-Office365-Filtering-Correlation-Id: 3494a15d-dc7d-4a25-9d89-08dd867f6bbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MTV6NXVEaGF2SGIxanhBVkQxQ0twNXA4bGhHWVZlamFZK1JHQlp5ZWR4WHk2?=
 =?utf-8?B?Nmp0VmFZZkZvY0hRZlQ3bDdJK0E3SjIvbmNhOHBtTTdIcVJyNERRVzRMa0Jm?=
 =?utf-8?B?enBnNlBDMTFXaWJQa2lPamNKSkZBbHNteGdvZzhMbzlpc05mL2dCRGJNVlZI?=
 =?utf-8?B?cTRvcjRVT0JnUTVRRkNzZG9MTi9yTFBuWkNRN3dXdkFGSmttQWtPdjZIMTlO?=
 =?utf-8?B?N0lIN3d3dU04dDR3Z3pyVTBGN09HM3ZRTU5CQkE3YUdRdng5WFVRaDYvTUcv?=
 =?utf-8?B?ampnZ2xwbGg3N2k1dXE3Mzd2VWQyZEVjaGFvYUM5RlMyaTNrY0kxVmd6Zk1J?=
 =?utf-8?B?MEZXSzQ1c3ZpRk41aFF3L2NOMS9ybGl2RjN4MGsvR3d2dzZHMWI0amFqOC9P?=
 =?utf-8?B?VjBSSkdSYTZRWDd6THp5Z0pjUmNGRWVQYnFWSGZIKzNNVGY1YTNnV0o2Vk5P?=
 =?utf-8?B?TVdJcE45VHZ1U2lkMDNpdm9OSDloUHppR3d6VU5DSWFlTnl4WGFZTit3cHln?=
 =?utf-8?B?REttQS92dXMyL2ZxdThPak1HODJPRU8rUldtUVFVdmdpZmh2V0greEo5N1dn?=
 =?utf-8?B?N1FUeFA2eXh1MFBQYjdiMFlPRWdOc1dBVnhsYlBUT2lNL1hta2lDKzc3M2I4?=
 =?utf-8?B?WHh5R2hzVnRVcTA0Mi94S1hhS1dOUUdETUQ2V0l5dzFIcXkvMWZmN2s0d1Bt?=
 =?utf-8?B?aFJnajJlejB5WU50N3FzeFl1RkZ3cnlNUXVyUCsvRld4TVFHV2ZyVE5JbnVB?=
 =?utf-8?B?ZTRVWDQreWJ4OTI5RHFvMnZWQkZkbVlvVlRhbUt3blE5NGhtN3p4Wm43TGtm?=
 =?utf-8?B?UGhQRnRSU2FSNGdzMlZDL1BFeFpWM3krTEN3YXRtWnMralRPWTAwVFIyd2NQ?=
 =?utf-8?B?S0g4NDViRlhXeUNacEZkWlRJb2RpY0cyUGF1SkllRjNLWDNVbFFtS21La0tK?=
 =?utf-8?B?WGNBOStrMTZUcEVCYVNpWVZRcVNpZUdlaWM5eWJUN3NrbXFqSUFHSnUyRkd1?=
 =?utf-8?B?U1M4STk1K3BldWxlTFh6MWx6aVpqcFlPcWZjbStLUVp1cnQzRUtZSkc2TE0x?=
 =?utf-8?B?NGtOYkhrZ3I3eGlyWGRpVEdqMEM1cUI2SUtTcXQyRTNheFVIZXp6L01EQ29m?=
 =?utf-8?B?ajhpVkNIam5rbzYxeGorMVdpSTJibjRQbUV5QVFZdlVxMVJUdTc2YTU3TGtQ?=
 =?utf-8?B?ZmpiY1VJWERlMEl6SEc1cmlTV3g1UGdZOGx2Rk95OTdGYXhhT3F0dmxhYzQ1?=
 =?utf-8?B?SE1NWCtrQmNtK3lrTUprekxBTklRN1ZNVi9TYmFBYlVoalZqTCtxNjhyMFo3?=
 =?utf-8?B?ZUVnL0d0QXBWcGk1TitEZ05xa3dlTDljQkFZeG4vNWVxMG8yQnhLZmdaelR1?=
 =?utf-8?B?UW1NMHlZUDl4b3pkK25DUWdXd2FiTWN3WitYQWU3SDlmbDhQVWJsQUZTS0hC?=
 =?utf-8?B?eGxGc2lkWFpkMkdsZlRmbExCZjZ5QjNYb1BDeXpQSk1HZjJHYjliYjNUbDh2?=
 =?utf-8?B?NlBwUm04U0pLeWdONldvbnFFYUZkOXl0WVVkSkhyYlI4cTFGUWdjUGY4TktZ?=
 =?utf-8?B?VGhZWjgzT0YvbFA0aXhsQ0hRVEN5OWl5WUZDQ2JhdG1kOEwzZVJWRWFMcGo4?=
 =?utf-8?B?VlFsV3M1R0ZlY0tyQWRmcG13V2IwTGl1VmRLdXI3SmJ5L3dXbWJpT3FFTE0v?=
 =?utf-8?B?UE00bXNpSnJFMXRFTytlbVA2dWJzTFFVOXpRdnlIelBlcm9Ia1Z4aXRsd0Nj?=
 =?utf-8?B?RVZpSjVrMmZRV3ZIcnhER0JqbTVFSDdnc1IxWjc0Zk9Sd1BMN2pVU0NqWlZs?=
 =?utf-8?B?UU1aOGgyeWh6bnVFbVpGMndwaUpBUEFaSUZFYjhuUDVmSXEzaEZqYTRlSWRl?=
 =?utf-8?B?VWNBcnZnWlBnOGJIK2hnM3I2bmJ5UDF1dm83MWlubXZsbUpCcEZqUHJ0VUt4?=
 =?utf-8?Q?v/nKKH2wYqg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGt6Nk00Sm5xalA2WTJCQVJLV08wdGEyUytPSHJlVDFEZnR0Yi8vZjJGQUF3?=
 =?utf-8?B?VEhCNHNHUE4yYit0bHJqN2VoN1RGWTQ2SGNhRFZZM2w1YjJaSU5ZU0R1Ylo5?=
 =?utf-8?B?ZTY3a0dmQ21QTjBLRlhjNlZYYWhrMGVnZUwrZDNMcSt6MWdOQXhreEtZRlY2?=
 =?utf-8?B?T01sMHl0bnFwb1hiUjVUNy93YzUwdVR4NGlDYkIvdG93QWtEQUpnY21ZajdT?=
 =?utf-8?B?bEhrcG52eE13TjNkZllBT3prcmk3YTdENkxocW9oa3VSMVdWNEx1bHdKNkd3?=
 =?utf-8?B?aGdYczgrR05QVVQvYktlWTllVTFodCtVd2NTZm1Od2pkdHhEVlIwK3R4NlNw?=
 =?utf-8?B?ampTZ2d3WWJwQVdGWkUwR1Q5dTYvVkdoeE1YNzEzRFo1UStuNEozekI3cmJT?=
 =?utf-8?B?ek1tZEpTZjhnYXVONEdoTTdja29vZDJhVzhlUjh4MEU4eWJwNUZDakRtMnV0?=
 =?utf-8?B?ZHB4a1ZvODNGQlVZUUd3MGpyNmp3bzdLeDBId1lDUlBzYkhyS3FGWDQrWDlx?=
 =?utf-8?B?eFVkYXd1THVlN1gzUVVHalJ1dG1obldqRWg0ckI5RG1veHFjd2c2SWdHWDVl?=
 =?utf-8?B?Y0Y1ckFyQ2F6eWFyalM0TUZ5bFlMUXc3ZE1SbzJ0M2szeFhxbCtLZTZYMUZt?=
 =?utf-8?B?UUh2akVRWUZRQVpGcjBVUm54MXVHcno4Q2VGRVJyZ1BFR1ZYeVczVkN3K09U?=
 =?utf-8?B?WWhpYVk3RFc0ZTNtOVFTejZ3cXVTL3ExUnYwMURWVFFBa0c3ZFlRSHRDZ1Ni?=
 =?utf-8?B?KzJaVWVNNGszZjFrejM0WFArQTZocEl2czd1dVVnN2w3Y2lLZGMvSFp5cDJk?=
 =?utf-8?B?UnVocCtyak10bk5ROFV3dVpIRnV5RTBjdlpQdXBBajJCWUs1ZlZPRDFUbTVk?=
 =?utf-8?B?TnM0L05BbEppMHZ0dzJvdGE1U05rekxZWWNYWnI4WW5wRGZVVlRqcVdQY29x?=
 =?utf-8?B?S3orcm9hemNBVGEwRm5SQ3Z1cUo4dDhMSUFLZ2VnZTEyTnJsWERJWDJqaVU4?=
 =?utf-8?B?SVNONmtWU011dTE4RGtxdy9IWEFlRmJmc0xEcTlGNE94UHVCSjEwRVdpNzBD?=
 =?utf-8?B?d2pQTWtHM2NJNHA2NzVMRDdBSGlOTzNFMGNNYURNUHVKRjN3c3FQd1lMcHJm?=
 =?utf-8?B?ODZLQzkvZWhvYnNSa3p1WFBqUVFYN0xldWtscVFBcS9PT0NHS3lYb3RoWFpa?=
 =?utf-8?B?c1d1MkJ5VnUxVW5IWGtsdUd4c1pNcTZRY2ZSVnd2Q0tUTU5hVUIvWTR5bDBn?=
 =?utf-8?B?THc4NUJzdUNJSDBWRExzQ01ESHRULzVaR0RTYlBaTlBDeURRa2p6NDFwd2lN?=
 =?utf-8?B?SVVJU3FMWXgxdTNXZEVZeEhFbjkyNkk5RmJMR25RU0xxWVAwS0JVVWsrSHI0?=
 =?utf-8?B?RllaM3dvZEJ6eFA3TzZmODBKT2hLcVdBSGxFdGRMdmdmaUpYNlVSNFVRem4x?=
 =?utf-8?B?ZVBYa21INUZ4VlMyYytzY2tuSmltNFQvZmhjZFQ1NXEvZm4rWnZhZUVhVlJH?=
 =?utf-8?B?cU9VN056S0dycUhCWHY2ZHdWQmhtdjc3Q0d5aDV6QzM5QnVyNmpiNWFiMDJC?=
 =?utf-8?B?dTlNYUJQSHN6Zml1dnozNnFwc3Vqckdmc003Qk1GN3cwVGdNcTkrSW9hNUpV?=
 =?utf-8?B?ajFSakxuOWYvSHg1MFI2ZC8zeTRZSWNHRXhTOGNmUFFLNE1iN1hIdGJzaWsz?=
 =?utf-8?B?K2pxVWQwMGd5Nms3SmYvZW9ldWtlWkF2a0ppS09GdU9FaVJ6MnlRak40WVM2?=
 =?utf-8?B?ekNhOGZpb1QxWU94VXRsT01KVkR2QzcwK1ZqNTZXYmMyQ0Fpb1R3Znp0WnZI?=
 =?utf-8?B?ZldUMkZWbjE4clBoNnNPQ0FsK2JBL2V2bzhrZ0lhSmllSEpLTWk5ZWtNRDR0?=
 =?utf-8?B?Z2RDbW53U1NXVUhGcVpCWUZsQVNwdFBoNUxDeVJ2RnpOWkdmV3VNTmVrYXFD?=
 =?utf-8?B?ZEJ4RGdNRFlEYjc5dHMzRXRoMVYzQkkrTDFKYThjN1Y1ckF2OVYxMHBldFRW?=
 =?utf-8?B?VGMzZ0puSThxSW5SeGJhWjJYWlQ0WkJlaWNaNzlkdTgwV0xyZ24rWCtEeTl3?=
 =?utf-8?B?VVYraVllUUZuRkp1TWlKbjJzTXRBQnlJbEl4WkVRVXRQanFzdWxaODU1Y0g2?=
 =?utf-8?Q?81CGz7Bzcdh5VyfdPgdB9ctBn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3494a15d-dc7d-4a25-9d89-08dd867f6bbf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 18:06:38.4752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jH+rO7xrLctgz5AVg48HxNqmI6YHuF1lnzlOu7QMb4UG5jvBbo097jsMeq2kWYP3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9170

On 28 Apr 2025, at 8:04, Dev Jain wrote:

> Override the generic definition to use get_and_clear_full_ptes(), so that
> we do a TLBI possibly only on the "contpte-edges" of the large PTE block,

What do you mean by =E2=80=9Ccontpte-edges=E2=80=9D? Can you provide an exa=
mple?

> instead of doing it for every contpte block, which happens for ptep_get_a=
nd_clear().
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h |  5 +++++
>  arch/arm64/mm/mmu.c              | 12 +++++++++---
>  include/linux/pgtable.h          |  4 ++++
>  mm/pgtable-generic.c             | 16 +++++++++++-----
>  4 files changed, 29 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pg=
table.h
> index 2a77f11b78d5..8872ea5f0642 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1553,6 +1553,11 @@ extern void ptep_modify_prot_commit(struct vm_area=
_struct *vma,
>  				    unsigned long addr, pte_t *ptep,
>  				    pte_t old_pte, pte_t new_pte);
>
> +#define modify_prot_start_ptes modify_prot_start_ptes
> +extern pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
> +				    unsigned long addr, pte_t *ptep,
> +				    unsigned int nr);
> +
>  #ifdef CONFIG_ARM64_CONTPTE
>
>  /*
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 8fcf59ba39db..fe60be8774f4 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1523,7 +1523,8 @@ static int __init prevent_bootmem_remove_init(void)
>  early_initcall(prevent_bootmem_remove_init);
>  #endif
>
> -pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long a=
ddr, pte_t *ptep)
> +pte_t modify_prot_start_ptes(struct vm_area_struct *vma, unsigned long a=
ddr,
> +			     pte_t *ptep, unsigned int nr)

Putting ptes at the end seems to break the naming convention. How about
ptep_modify_prot_range_start? ptes_modify_prot_start might be OK too.

>  {
>  	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_2645198)) {
>  		/*
> @@ -1532,9 +1533,14 @@ pte_t ptep_modify_prot_start(struct vm_area_struct=
 *vma, unsigned long addr, pte
>  		 * in cases where cpu is affected with errata #2645198.
>  		 */
>  		if (pte_user_exec(ptep_get(ptep)))
> -			return ptep_clear_flush(vma, addr, ptep);
> +			return clear_flush_ptes(vma, addr, ptep, nr);
>  	}
> -	return ptep_get_and_clear(vma->vm_mm, addr, ptep);
> +	return get_and_clear_full_ptes(vma->vm_mm, addr, ptep, nr, 0);
> +}
> +
> +pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long a=
ddr, pte_t *ptep)
> +{
> +	return modify_prot_start_ptes(vma, addr, ptep, 1);
>  }
>
>  void ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long a=
ddr, pte_t *ptep,
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index ed287289335f..10cdb87ccecf 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -828,6 +828,10 @@ extern pte_t ptep_clear_flush(struct vm_area_struct =
*vma,
>  			      pte_t *ptep);
>  #endif
>
> +extern pte_t clear_flush_ptes(struct vm_area_struct *vma,
> +			      unsigned long address,
> +			      pte_t *ptep, unsigned int nr);
> +
>  #ifndef __HAVE_ARCH_PMDP_HUGE_CLEAR_FLUSH
>  extern pmd_t pmdp_huge_clear_flush(struct vm_area_struct *vma,
>  			      unsigned long address,
> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> index 5a882f2b10f9..e238f88c3cac 100644
> --- a/mm/pgtable-generic.c
> +++ b/mm/pgtable-generic.c
> @@ -90,17 +90,23 @@ int ptep_clear_flush_young(struct vm_area_struct *vma=
,
>  }
>  #endif
>
> -#ifndef __HAVE_ARCH_PTEP_CLEAR_FLUSH
> -pte_t ptep_clear_flush(struct vm_area_struct *vma, unsigned long address=
,
> -		       pte_t *ptep)
> +pte_t clear_flush_ptes(struct vm_area_struct *vma, unsigned long address=
,
> +		       pte_t *ptep, unsigned int nr)
>  {

Ditto.

>  	struct mm_struct *mm =3D (vma)->vm_mm;
>  	pte_t pte;
> -	pte =3D ptep_get_and_clear(mm, address, ptep);
> +	pte =3D get_and_clear_full_ptes(mm, address, ptep, nr, 0);
>  	if (pte_accessible(mm, pte))
> -		flush_tlb_page(vma, address);
> +		flush_tlb_range(vma, address, address + nr * PAGE_SIZE);
>  	return pte;
>  }
> +
> +#ifndef __HAVE_ARCH_PTEP_CLEAR_FLUSH
> +pte_t ptep_clear_flush(struct vm_area_struct *vma, unsigned long address=
,
> +		       pte_t *ptep)
> +{
> +	return clear_flush_ptes(vma, address, ptep, 1);
> +}
>  #endif
>
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> --=20
> 2.30.2


Best Regards,
Yan, Zi
