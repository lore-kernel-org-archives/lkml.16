Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44F0288CA3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712961; cv=fail; b=RX8lh0B2T1ZirrcI/XXnqXdczUHHtFVpwYj2K1qsF2zUTl0j6KI9xOAR5MD6cYDOjXnPQOS65f1jgllYUZ8pdYNk1epFIeFOQFkIGWImjvXZFCQR2Y1nTnUaOH3dISHx1txCtVkckcPjDKfZrwnf5/iEyXcFgKv4YJa1njn40Nc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712961; c=relaxed/simple;
	bh=Mq9c7XZRiGDk1Q8D05cmRpFw07IBt9jH9RPQql+Y8eQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nXjPiNwW/8bTNjQJKESniDLPVXTyJWlxN7/euhwcMNXKORtAbAhgbJgJmaRFsw8nm2c1AV2vmVyJcula60b8gJeGBFoUjsdAUom25ODfFWJI3gazeeUtQVXzME1DSzfb1ntoM49MGzhlueSe0+JJvzjjCspVaX7Ffo1kUx9c61k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CF5Vaa7/; arc=fail smtp.client-ip=40.107.94.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CF5Vaa7/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpIEsPD4DOz0T57yzXfWiPRMaZDy7fVWvs3k4KKw0Z/UOHByucww7uzClHltYtDRB8p1MoTwQf+V1map1v2bzoeFGp5eK1NlxTqlhnD0icOTZmeAhF5ir7TeXFeNaH81S3sXlm/7u1weeuIfkxM/fzA5kGqrPHIU32z9CtKbLB+BKk2h9qNEnUKuun/DgT27aHewZym3ORl7hOE7laau6HEc1hrKxbThrggHlKT6pwGo8t00CA1D218nPNZhCobFItImmgBjx3JWlj+25PNfWo68DSoroFPsbSVdaAnIF6rK3rzFcxRVs36RNZH/Unj+nTHoTuvskMxDi3aZVrMw1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlGCXAWaMZ7urO50a2j1xjPlv6DjrjDWBvYWIda9f2Q=;
 b=ql5HpD1RVDJL3WLEWJKtApBeuLmZsUCgU79iH0gCekni9bEtlJITTqFTrDCvkTAKfYIwN+Ra+TGXj9UxA2Dl1ppYf0olczCePhxyC3HwiXMwIxY8XkrKbMMES/1Yksj3lTrocpFw6twwHbGgt2IJGJxBuxh1nbCTDN0aYWSrtHqDcjogAgI05poP5bZUb+YQY8cwZgpDJie4CHGV8LO//4dqZRmWcAuSCBsx14uoSvd11boVTMx6eQKALc9EQsIZGQS3MkALwIdGp+ZO8Birr80z5FBSIF0s5oCRMryU2q0DFZy4h9+frMDfxx+bo8QOEfbQzuXhC+KNEQEJz0npDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LlGCXAWaMZ7urO50a2j1xjPlv6DjrjDWBvYWIda9f2Q=;
 b=CF5Vaa7/+cluNZ6sv5dHutjKQXNyQaeUvlxff+RZq6F6M23lluED+XJFmPUxiJmq9NOY9rgm3/eHXXMeah5b5RYPm6Zl9+K3U6wcgdMo7ROUI3Jf6c1AtRu9vzWL/Nr6BJ/pg/v+3oYOEHm04SCPrqzJrs4inq9w4Yn3KW0y7DQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by PH8PR12MB6867.namprd12.prod.outlook.com (2603:10b6:510:1ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.44; Tue, 15 Apr
 2025 10:29:16 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 10:29:16 +0000
Message-ID: <8d83441f-9f67-4094-81b6-70cd5db88acb@amd.com>
Date: Tue, 15 Apr 2025 15:59:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] mm/vmalloc.c: optimize code in decay_va_pool_node() a
 little bit
To: Baoquan He <bhe@redhat.com>, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, urezki@gmail.com, linux-kernel@vger.kernel.org
References: <20250415023952.27850-1-bhe@redhat.com>
 <20250415023952.27850-4-bhe@redhat.com>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <20250415023952.27850-4-bhe@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0137.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::22) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|PH8PR12MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: f3e9f73f-0996-4f21-7aa7-08dd7c085ec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SUEzOVNCV2t6ekcvNlFSaHJWclRUMlZ4aFdFclJ1ejZvVEdiRW95YlVCckY1?=
 =?utf-8?B?YS9PcHRYTE9lclhTUlVXUUJINnlIVkdtRWFZYXBlajF1dmNpc01hLzRjRmpM?=
 =?utf-8?B?cXJIdk4wSm05Ri9NR21mV0Y0WTFtSWJidXdCV1FiV1V2Yk1rSlpLV2dCUzNm?=
 =?utf-8?B?RzdqaXZOb3piT1pOLzlkeEFKTHZSM1FrMHlQRW45ZUYwZTMxMWVDQ295YVd5?=
 =?utf-8?B?aG9hb01mSHdSVWZCMDA0S09XOXhQSnJzRjNOaGYrL2twbW9sS1hteC9hbnQv?=
 =?utf-8?B?M2hmRDQ2VHlLWXhEZWNhOERwSUQ5YmNCUlhVM0VoajlCUUdMeW4vdlYvQUFB?=
 =?utf-8?B?NDJLR0NuaEtMcUtDZlJEbnI5UUVybm54Vy8rZmg4TTRpVjZUY3F5L0Mxb1d1?=
 =?utf-8?B?WWdZcjg3WjJlZ01ZWkFEVCtPZ0RYM0VxRWFqOUFub0ZHbzlqZTQvdWNIZitu?=
 =?utf-8?B?cVFBUU9CZThpSVFyQ1NsalJMZER5Tzd1TnlkblM1TDRyczNOMHJDN00zMWZa?=
 =?utf-8?B?dDdnYmlVSkdmNXI2VWwxMkwzUHpZbUhMZW1OWm44eXlvdUc1LzdUazZhOE5a?=
 =?utf-8?B?ZjJZUXpNV29UVEtYR0VmcGZyNEZuZEtOU1FQY0hvUnIvZDhsaGk2L1paV3Ew?=
 =?utf-8?B?UjhxWlprcVZGRUUwSVBCT3ZkanB4Nk1TUXorMUtEYnpUb0ZROFJZMGw3N3dR?=
 =?utf-8?B?ekJncldra0dWTHY4THR2aWNodDRKUjc3NlRjQ213TGVvU296M0NLVk5TcWtO?=
 =?utf-8?B?K0hCMDhudnVCS3JDUGw1KzM0MG4wejRadlg3TWJET2VjN1RDejFsOVhnWHNp?=
 =?utf-8?B?YnBaVkErcm8wcElpcSs0VXBWUll0Wk1IK2w3MUszRW5RQVUxcHNXcEdMMVVK?=
 =?utf-8?B?c25ZZWJPck8wWG5zUTBxUzRWZGJUdjJRZGdrNkdXdHczSlZPODY3Mno0cEVs?=
 =?utf-8?B?Y3lGTlVoQ1JuVUsraVJMakN4MmZpQ3lJVFRhbXprTkhhVmVIU2hLMXYwSjcy?=
 =?utf-8?B?ZjlDWGhrUDFTdGk0Rm5ydWJUK281VFJvU3pUalo3bG16Rk5hMXdGZDB6RFM4?=
 =?utf-8?B?VE8yMm5abkdDaVV5eFVuMFVNK2JIcHJ0dW1qUzU3cHNPbHRMRWxCQTk1RzYw?=
 =?utf-8?B?ZURzSGJSVGN1M1o4VHpGQWlpOHNjUEVUZDNjTGw0Nnl4eUZXanRlREg4Rmlt?=
 =?utf-8?B?TzJxd1E2N3Y4VUtyL3RJNG1MQVk4VUVGazZTdXgwME9PSGtJRmd4bGdZdU85?=
 =?utf-8?B?UEhnTW9WZ1hWZ05YT0RjMmJNZEtHOGtybWlmRXhGRnc4TzNnR3FwRWpSWWFm?=
 =?utf-8?B?d2JRMDdYTlBaYlZrSHJ2VFpZRFMyNDNNdHE1alozZ2cwQjRGTWlWZndzR2sz?=
 =?utf-8?B?MmVYeXl6Z2R6WDRNcFFpczFjREtMeURuYVJkcHN6cjNWc1B3VGwwNEVyTUFJ?=
 =?utf-8?B?UWhzcS9BNm9hb1ZjcHlZYzZGZHM1bFIxdkRXR2lYY0M0UXZMM2lXL2xCd3JI?=
 =?utf-8?B?SmRBWGJqSW9MN0hUNFBpZURpUG14YjhaaWw5amp6am03OEYzV0RsZGRiaEtY?=
 =?utf-8?B?N0RuOC9zdm5KZjVuTXF3ck1sMzlnOFB3UDJoSWlEWkVUOTBrdmhSY25wdEZB?=
 =?utf-8?B?Si9Fcnk2U3JWR0lpb2pOMEt5Ry9IOHJkU01pdjJPOFRQT2wyT05BelgzWEZ4?=
 =?utf-8?B?NW8xWG1teUxFanF6Zmk1WEpBbk56SGxubVkvaXhGT1QvVE85RHhpK0FUVm1O?=
 =?utf-8?B?T2x6U0pCanExYU02WlJ2VmoxYi9zem5VK2RRTTdLZU1XUlIyQXhnck1kR2w4?=
 =?utf-8?B?UmMvR055NXI0SStxa1JIa2JQNERaZkRjcWJpa2tVemhSQUVPd0lCOFErMUxt?=
 =?utf-8?B?Q0ZqRGlFTS9LdEgvQjd5UkRPRXNLRTk2eStmeGg3d2o4SlNJcCtDam45N2JM?=
 =?utf-8?Q?SYGEDuT4VtE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXo2MmRzeUpTRGNGOUF4T0lnVENpN0grLzVtUnQxT0llYjIzbENiT1pVQWtm?=
 =?utf-8?B?OXVocmJHWks3WnRST1Ava0M2VmxYRVFpc2tJcHJPMmxMcHlab3YxSVM3Q20y?=
 =?utf-8?B?a3dDQUVOY0orY2ZCbm5Ja2hFRjQ2WVJ6MHhPbXN2am8vUTErK2xYcnRsNDZ4?=
 =?utf-8?B?WHY5MzI3eVBmNGhyUUhwREVOcjlzajVkNmt4YkpNSDdEdENyRlZMUmI4L21l?=
 =?utf-8?B?YmdGN05CbUxQRDBWU3FOWC8vVnJwQUhaTzZMMVN2YkdlcGtzT29mK2lNQjlI?=
 =?utf-8?B?LzhUM3VQUHllQklTSCtBK1VsVVBuVVlxOHhySEw4VDJ0WmxjMXE4RjY2VHZp?=
 =?utf-8?B?U3RwWjdsNDR5MDc5VkNKYXlpd20zM09GU3FyUEQ4NFcrZjNCQkc5VlZDQjUr?=
 =?utf-8?B?WmhDWUpVa3l3OGdNNHR6NTI0Uko1aEM5dldrRkZtUkZ3a1VQMnJkTGU1dTlF?=
 =?utf-8?B?Z0V3VEtzWmNVTVdZbXpDZzRoYXpvY3hlNDhHVGpUd0tSeENhT3FWLy9TVHdK?=
 =?utf-8?B?aFExbHRXVGVsYTh4UjVuR1pLaFdVR2lGVWlqb3lkc3p3ZHRVVDJwdlFtU1VI?=
 =?utf-8?B?WUhPYngwWU5td2VvSStNWFZZWHZ2bWpLOVpWNEtXVG5DL21HajBTUnRPWnZv?=
 =?utf-8?B?bklGanV4VStjaVVLdDZqVEMxb3hjYlo3Z2xYckh1a2NXaXNkcjBpek02Z0hs?=
 =?utf-8?B?T3hMWTV3bWNHUDhDMk1BZzR0MEVmRTFkbTIva0hvTXovSktWZ09XbzdqaDBH?=
 =?utf-8?B?cG5jaEt4dXg5NzV0VlFtVjZKNlJ3Q0VrR3JHQnZoMGdLTWhSRFpQTGdyOG9X?=
 =?utf-8?B?Qlo4UUNkVVo2K21DdVdJbTVtK0tpK1pFUlRvUFFId0RacXRjKzhTWUgxYzVV?=
 =?utf-8?B?VVkrT0ZEQXRpdisxZGw2UEt3VU5qNEx0aVhObzFaL0VUT1cvT1hOZjM2OHdZ?=
 =?utf-8?B?d2FnTElpbExPUDZqZXpUTXBWR3dzVW53QzVXdlhKREV6a3NRcUdHeDZPWWpM?=
 =?utf-8?B?bys5YVZzWnRrUDI3RkEydC8xVllSU0VDbGNaU3pTZkU4aW1hd2Z2d052dEh2?=
 =?utf-8?B?UXNGYzMyTzB5TUZGckZlNytuS3hzb1ZOdEFmWXZtMDR3VjhxYVVmemVOZ3Fm?=
 =?utf-8?B?TkdDbS92RUhzc0kycXBIVjNhWFlNdkNnbnNSMHM5UndZb3dnWENqbHpSVFpy?=
 =?utf-8?B?NUVkUTlKRmtUOVhBa0lrL0dSWm1vTzFaOGR1d3Rnck5Qb2FHWUZuOWpIWkJz?=
 =?utf-8?B?Z1dET0F2QWRMS3p6d0w1SUJLWHFHckdqMDB2YnppbzRGekUzMXNvQXJaOHNL?=
 =?utf-8?B?bWIxTVpYTHFqZENJMDNjZXNjL21PUjI1R2thVXFmWFY0Nm9PaXRQVHllYXRw?=
 =?utf-8?B?SC9lTFdGQ0V2RXhyWUVMd1lkeE5DNnJzc0tEN1FxcEdTVWQ0dFk2WHpBYUZK?=
 =?utf-8?B?UGhWaWlIemlocnlvTDdTcXRmWWNSWko1VTZuczJOcXdIbW1yTmhSZ2d2WEVr?=
 =?utf-8?B?NjNYeGtPdXZkU05WdnNxU0ZCVi9wRW0vUG5tclJ3T3BUZ3hNdGNjYTJRWFND?=
 =?utf-8?B?cjVPRVpqNlZkQ3oreTJaaHZ6c3B3NUpCVGlIWm9reGpFTEFmYjNJUFl3cnJU?=
 =?utf-8?B?VzdWQ3JTTUs5OGx3MzRvOVdleCt5OC9WUmxwcW1LY1dzaUwwTzJ3NSt2N1ZN?=
 =?utf-8?B?WUVwb1dJUE9ZSk11Z3JlMDl6dUZlUWFPQlNGMnR4NWZCTU1MMll0ODBrb2NB?=
 =?utf-8?B?UFliUjJhMWIzS0pxdkJ3SHFtUXBIK05VM2JpWjdiTWxmTHFaRWNpdkV4NXZI?=
 =?utf-8?B?YlRCem4yRDJXcUZ0alFvdzlGMGFLTTFmVi82MmVFTlhnVzhZRjY3ajlKZDdq?=
 =?utf-8?B?ZU1uRDh1QUx2NWg0L2Z6UEhjMFBoSU9BS2taSnN3OUpBR2pFVENJenhaWUZT?=
 =?utf-8?B?V21qL2JMcDVjVSs2SzR5OHdEc3FGSkx2QzNweTRuUFlPRlhrRTFQSC90a1ox?=
 =?utf-8?B?ZGtlQW9uSFdTMkJ6VXBsRkpyUk1aK2hIcWtDZVo4YUhPNEZhUjR2NG0rbG9O?=
 =?utf-8?B?REFGbFNnZ2x1L0pwazNrdXhqMngzdkcyQ0Q1SzZiK0xKSVlCTXQzbUxmcTBE?=
 =?utf-8?Q?ILCSi4V7FXMtOJYfEMOeSPYcv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e9f73f-0996-4f21-7aa7-08dd7c085ec9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 10:29:15.9814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WH/QFL2sWHbZcThFGP6sEXWdRxRWePZzI7ssR7hhi2mSqxzmCUcNbxrHKy4Usm5Ti2e5Czr+mqjO2iMvt1gOJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6867

On 4/15/2025 8:09 AM, Baoquan He wrote:
> When purge lazily freed vmap areas, VA stored in vn->pool[] will also be
> taken away into free vmap tree partially or completely accordingly, that
> is done in decay_va_pool_node(). When doing that, for each pool of node,
> the whole list is detached from the pool for handling. At this time,
> that pool is empty. It's not necessary to update the pool size each time
> when one VA is removed and addded into free vmap tree.
> 
> Here change code to update the pool size when attaching the pool back.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  mm/vmalloc.c | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 488d69b56765..bf735c890878 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2150,7 +2150,7 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
>  	LIST_HEAD(decay_list);
>  	struct rb_root decay_root = RB_ROOT;
>  	struct vmap_area *va, *nva;
> -	unsigned long n_decay;
> +	unsigned long n_decay, len;
>  	int i;
>  
>  	for (i = 0; i < MAX_VA_SIZE_PAGES; i++) {
> @@ -2164,22 +2164,20 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
>  		list_replace_init(&vn->pool[i].head, &tmp_list);
>  		spin_unlock(&vn->pool_lock);
>  
> -		if (full_decay)
> -			WRITE_ONCE(vn->pool[i].len, 0);
> +		len = n_decay = vn->pool[i].len;
> +		WRITE_ONCE(vn->pool[i].len, 0);
>  
>  		/* Decay a pool by ~25% out of left objects. */
> -		n_decay = vn->pool[i].len >> 2;
> +		if (!full_decay)
> +			n_decay >>= 2;
> +		len -= n_decay;
>  
>  		list_for_each_entry_safe(va, nva, &tmp_list, list) {
> +			if (!n_decay)
> +				break;
>  			list_del_init(&va->list);
>  			merge_or_add_vmap_area(va, &decay_root, &decay_list);
> -
> -			if (!full_decay) {
> -				WRITE_ONCE(vn->pool[i].len, vn->pool[i].len - 1);
> -
> -				if (!--n_decay)
> -					break;
> -			}
> +			n_decay--;
>  		}
>  
>  		/*
> @@ -2188,9 +2186,10 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
>  		 * can populate the pool therefore a simple list replace
>  		 * operation takes place here.
>  		 */
> -		if (!full_decay && !list_empty(&tmp_list)) {
> +		if (!list_empty(&tmp_list)) {
>  			spin_lock(&vn->pool_lock);
>  			list_replace_init(&tmp_list, &vn->pool[i].head);
> +			vn->pool[i].len = len;

Current logic uses WRITE_ONCE() to update vn->pool[i].len.
Could this lead to consistency issues?

>  			spin_unlock(&vn->pool_lock);
>  		}
>  	}

