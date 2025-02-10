Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D251124339A
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 06:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739169773; cv=fail; b=Jve9HptAG4ZDehnPqdr6SeB1cZnLn58VNTUi5OAz3UbMMt2shylHaz0LAY6yBRPBkf6gBRiC9zGQCL6bB5cEw3iZYyU59+OX1mwYTClIwocxDJ0AMVByllIOJQNRhshEFTUxPG2yanRFhXD7luTUprmxqMVkVH95diCgXzGeFcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739169773; c=relaxed/simple;
	bh=ZqE1FU49vbDdDrcYJusrxF6Q8PK4WS3pYfW1XyZN/Fk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P0LiLZgd7o7IwPd+O/sE0Oj8jgywFfDlmt9lVw/IS0MDq9zXzN3HJYmnb9VAO0DkG0iJ+j2rJ9Ep7w2UVbqAqvuM/Qq9yOrV4NjEK4ZUKCsQuuxuWVgGdKOhh5bKXJrVpBU2gXu7sZlBGvZQ/DKtTCsuqDJjU90/RyOAZSRj6eo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=i2kaEgaK; arc=fail smtp.client-ip=40.107.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="i2kaEgaK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nCP6r1WGdFjUBgb0UWHjoq1dTFKFQMyTOVQ5xmnwvyHSQZk5hRK/E144byPm/hwWL/EqpJPF3bZST0lORwtdcXaiypYNlSbkMPRhpU1vMjIbPTXA3a85fM2fQSOHdh3pxqLWjvtI0IBbJI2CVwL7qcPaGIp7wh2zp4GcDZyHnpG7lGFxptKYD4gaaZS9hZPqJQTZMNknUvTnpxGbNPE+RQ7+6EokdKI8MbpJiVNwDYcpURpezx7k0dIoLmeG4fyA3QHYx5bd5JyHasB5yNceLiJiVkyYlGz5lRd8GsTfXTvK/LRIiCGOjSr2PDtKcPDQY+/Ob37xdkt0Frxm8L3aOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GUscnMCVx5ZcMpR0H5RarBkK+2i1zH3OdOL7d8jjuo=;
 b=ENnx8nJfQ2aOkSvJjgOTetPYq+b2B32qmJLDGM4KikI64xTb4agWhWX2OBJNx0GHCwAHvq3OfrFOQbQPz5uS8t52Lh4FoOHhspEibH1K0/kIXmgOXzbFz0du1tS2+Yc8YRCjPDTcOSw2FS3s29ueIFyWRoPcLMpp5IrCIWYtq/2HdzMqV1wcSmioiTtDcaApLmDaS8R+jKeQKG0wFgDYCmHuAffiZGNjHa/IDXs/3aaENA0WqKJF8ywm9hU5VJ0s6bCdn+DkkudV56FuekmH+CT2ccOAiHQXZ786l9gvmLzJGFf1IouKiHvzCpRl2tqwdyeumZesNa9m71CUKNkweg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GUscnMCVx5ZcMpR0H5RarBkK+2i1zH3OdOL7d8jjuo=;
 b=i2kaEgaKsa7Xx8gp21CyAKkeIItIv6QNHm1W0h6TnQ8n6oMGeKA2TuyC2OKU3KQLCUQd7Tpi2AOccDdP04BGX6XR7ET6+71Wb5XCez91MXnI1NqYTWDB1JUcwZs04RMwxjoy6i5JdPOSV0L8jjiw9mRUgxXGJ2xLGBCeYsoaO3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6588.namprd12.prod.outlook.com (2603:10b6:510:210::10)
 by MW4PR12MB7141.namprd12.prod.outlook.com (2603:10b6:303:213::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 06:42:49 +0000
Received: from PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::5e9c:4117:b5e0:cf39]) by PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::5e9c:4117:b5e0:cf39%6]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 06:42:49 +0000
Message-ID: <1f4e4bb1-ba5e-4e5f-b6e3-e7603e3d6b0e@amd.com>
Date: Mon, 10 Feb 2025 12:12:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/24] perf: Make perf_pmu_unregister() useable
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, lucas.demarchi@intel.com, linux-kernel@vger.kernel.org,
 willy@infradead.org, acme@kernel.org, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
 Ravi Bangoria <ravi.bangoria@amd.com>
References: <20250205102120.531585416@infradead.org>
 <20250205102450.888979808@infradead.org>
Content-Language: en-US
From: Ravi Bangoria <ravi.bangoria@amd.com>
In-Reply-To: <20250205102450.888979808@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0248.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::19) To PH7PR12MB6588.namprd12.prod.outlook.com
 (2603:10b6:510:210::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6588:EE_|MW4PR12MB7141:EE_
X-MS-Office365-Filtering-Correlation-Id: ca979fff-1e34-45fd-6d9f-08dd499e22a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXlFSVhObCtyUVM5M3BuOVROd1ZUUWZNRFVkVWpyZ1Q1cGUyYjd5L21haUlJ?=
 =?utf-8?B?V2Nidlp4OWJMREhYcHpodFZyVUIyVDI2dXVEOTBqaHk3a0xBRXQ0ak44bTFD?=
 =?utf-8?B?NU5HQldiaS9Ib0UzVFVNYkxCLzFvcVhLbUJKc0RqUnJ1bi9URkRyYmVPNmY2?=
 =?utf-8?B?cm9oemhZNVpUTEJvQ0FnQnV5MWhYTkpiMDd4OE1RMHoxUHJvVG9LVWYwTEZU?=
 =?utf-8?B?dm1ibVpNcjI2NnZpM21qRS9YK25RMTdiNmE3VDhiaVk5L1o2L0h5UkhFVXpQ?=
 =?utf-8?B?U1JhR1dHSmE1SmRzMFpWRU5RSk9FcmEyL0NXS2I2eTVzS3BKOFVYWWpQbEhz?=
 =?utf-8?B?YU9oN2xtcHQ0dklGZ05PczI0cTByazVwL25iL0dtL2lHWWYvR3UvdHlqTkIz?=
 =?utf-8?B?UFpKSC9uVzJiWDVJSE94NmVYM29rVUR1djRyL1V5OWw0d2xRaktDM0ZiM1ZV?=
 =?utf-8?B?dWg5NDBCVHJmc2ROMFd6bG1odWQ4cjg4a2VwSHdaZHFvTGoyVzVXS1JJblVR?=
 =?utf-8?B?RWs4S24zN2tBUUUzK3liVDNESTRqTmNXaWpCaVViM2t0Y2Z2RSt0SmpnQm5D?=
 =?utf-8?B?Qk11eVpRT1pCYlNCNzU5M2txL3JZWFdZYkJXR3dkMkpxVHJIbkxmVStidXFp?=
 =?utf-8?B?SGZxVHpBZnNzSTJTaTl3cWJTZXc5TVdvYVRJeWVUZEhLanV3dGRsNFVKM2RW?=
 =?utf-8?B?MmxYS1Jtbll0ZVhHb3NZc0U2QTE1NkdZNTdTakZ5WmlGcXZFY2JQbVh2ZVB1?=
 =?utf-8?B?aWlCWGlRNFR5SkQyZFVkTGJLOGxTdDZaZXJvZnF5YWFvdkhsUTlkQll1cFk4?=
 =?utf-8?B?ZFh1RDRHUDJPME8wZ2tVeks2VW02M202aGw2bGtxbnlEVWV5OGI1Zk16cnBs?=
 =?utf-8?B?K203N0tHU0x4Z2VuMUg0RkxDM2FJajVkd3RaWGQva0NQZEhuM2FEQUR4VDdn?=
 =?utf-8?B?dUhTUExxeUptNWF2L3ZyK3FmWHhDZXpKK0pXQVpsQU1ZNVl3NWtVR3ZQR3lr?=
 =?utf-8?B?MHJBSjRKWkpCaldvUG9WZjgyQklJWUNhTXdLdnFXZFQ2d2FiNTBnSkF1MGg1?=
 =?utf-8?B?MklwSkdsN2lyd3JQWk9TYkRMRmNQamxDeFlOcWhobE1lbjk3QXZmRThQdSsw?=
 =?utf-8?B?L1VMaVZVc1lLN3BYWTA2cy8vSWwwQkNSUDFaQnRmUTJ3MDNwQjF5d1I0dFBP?=
 =?utf-8?B?MCtWZUx5cDNKY21qckltdDF0dVA0MEE4QjdlUXByWnJhaVZEdmtRY1ZLdUc4?=
 =?utf-8?B?a1ZUTk5GSE82Tnpndkt5b3ZnVGo0QU5SaVB5eThPUGhIM29hSlpndzNuc1Jo?=
 =?utf-8?B?UHNDU2U2WnlDYTlPanVLNExiSmUzc1VNR1VhTVVoSk9jVDU3OVZNaFhSWDM4?=
 =?utf-8?B?dGVpU1MvN1lYanBta3ZVemVibXE3ZWUzdUY0WDZRb3Rtby9EUFFaRllYMm50?=
 =?utf-8?B?TC8vNVlheDVuZ2Fva0p5WXVDYkxxNnBhbXc0MHpEMlJTOHBFT2hldE5HU29R?=
 =?utf-8?B?QTBVdVJBdWRuQm9JSEF5Z0wwV2o4cWkvQ2hrRHVGdDZpQnpYUkw0c2x2K3Fx?=
 =?utf-8?B?L2U3YVhhVFhHVjNWT3VsYy80bDNmdnYraFVXQzBKcDFLNTFhZndERjdRTTFQ?=
 =?utf-8?B?UGZ2VU1WY3hUSDBVOUxiSzhmam1Na1Q0bGYzWlM5YzA1TDB5aHQzVkJSNmRQ?=
 =?utf-8?B?eWNCVDZHZFgzUmNhUlA2SnhhemhNTEh4ZWh0Z1UrbjVtWEZyMHgxU3FNZnpF?=
 =?utf-8?B?NjBRVWtGYW5KTnZTanBaTjZoWFhxVmZack1NZGs5NUJOMDFTTUx3dG05ZnNx?=
 =?utf-8?B?bzJNckNyeHoraHBYdGdQMEFSSGhTVGJQREo3K1loejB4eUxENlc5b2pPdmlh?=
 =?utf-8?Q?Lwm3FhrmqOznz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6588.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHJOZFprUk9aQ3Y3QnhKcWFZUVM2TjFCYUYrTVRDT1F6RCtuNDBkSnNIRGEr?=
 =?utf-8?B?WDR3ajRqMjVRUnNoY1lvVzJrVTBMQTVnOVI0V2MvcjhQVFkwZmR0WWl3V0tN?=
 =?utf-8?B?ODQ3OEZEanF5N0lIeUQwTlZhaWZ2WnZZOTNndTduUzlKaUVaTVpSVXJEbytx?=
 =?utf-8?B?QS93TXhyUTZsMmRydjVjYnBjWUE4ZXJVWUFuOWpUS2xLQlBBMmRHdHBiTEZq?=
 =?utf-8?B?QUQ1QnZFL3hLNFRiWDRHQzNCVUZFckc4TUJBMFlaQi9UNGlxVTNRcXJMcnd1?=
 =?utf-8?B?YUhMMmdwcHdMWkp3VXprL0xnU2R0WnIwRXF4REZONzNZbXhGNElmdTErVDJB?=
 =?utf-8?B?UllTdW5NOHZKUzVDSXZEUWhMbFB6ZXlJNHlUYVFYYjcvK1E5dytMVkpOUFB2?=
 =?utf-8?B?OVR5SzljZmROT3IvTlc1MWhibzRSeDRjZGR6b0NoOTFtOGtIaTZET2pVR09I?=
 =?utf-8?B?V2E5ZkVUR1RibFM5ZnJpMVY2V1hoSmQvVHhPSWRuTUpNWVN4bnB6UkR4T1Nn?=
 =?utf-8?B?a05kd2JlNmJ3RXlWUVU4aDdQOHRlUzJmWTdWRDJ6ZmtFcmxzRWhaU2krbDgr?=
 =?utf-8?B?RTRtRHdRWmxBb3k1dytzU1NQdFdDUThLYWc1S1NvUytCLzJ0Y0xPUUV0MkZF?=
 =?utf-8?B?djBlTFQ3VTJESWxTTmpXaXRRRDhUMlJyQkV3SjZPclBIaVA0bUFWYlJpbGVx?=
 =?utf-8?B?M1ZzVERLUlcxWHRQN2RqeHFvRHpMbCtkbHFOOGVYWTNneERwNGJnazUxVHh0?=
 =?utf-8?B?YVdjYnZlSmhYU0V4bG42azJDSkJlT3I5dTZ4YmNzcnVvU1FYNHhMT1hPNkxl?=
 =?utf-8?B?Y2pvUkVaSkVPa2NnY0dlTEVvZllkaE81L2RhT01XWWFyWno4SFpXMlc0K3Bl?=
 =?utf-8?B?eUw1RDlXcSt1bkhtblJCcEVqcCtiUG9mSE1kUEZ0YjVtZkZWOUtma1ZRT0ll?=
 =?utf-8?B?bHhUa3pVMm5JT29Jd0c2SnB0dG4yejBkMWZ1QzljU2xBcXNnK0VBMVcyTXFz?=
 =?utf-8?B?aGx4OVBnQ29sWGdLYmJlNVkwYmtpM3Z3UEhySEFCSVVSMlBnNXJVS2R2c3Mw?=
 =?utf-8?B?ZnJUdGZycVp3Y2F6ZTNpbG9iZ1MvRXRyaXRpOW1hdXVWZGRGN3ZjMEpYS2lJ?=
 =?utf-8?B?RjRuVkJLTGt1YlZQMHUzNVQ2SEw0L013YXdTSmZVK0ZBUmFaUEJRenFpSzlj?=
 =?utf-8?B?QW43Vzd1b2ZWTnJOQ0xVSmhOWGUxQTdCb2tLbW1BUnpJa2l5SC94cHQ1TDFE?=
 =?utf-8?B?VDBENVdZL1doVU9EWCsyVXVhVHpIdzZteFd5YXFLOHJ1bDEwVU9FQk5ZbHpi?=
 =?utf-8?B?aXM2c05QMVlNbEJqYVVOTkxkUk5pTWhvcEdid2NSUkwxbC9MeGRoTmk2aG96?=
 =?utf-8?B?NzFRNE1zVzJYOTNqWFBvREIyNFBVb3hXR2wrR3kwdWZDWFNKWjROWXYzek8r?=
 =?utf-8?B?NlBzYzdhUERBYy9oYXhGVzdaY0JkZy9FVFZCZDVHNzNaeHo5WDY5aWhZUmFR?=
 =?utf-8?B?Y3E3THZYYW1UdFlMQW1yekowM3kxZkFDWGxEMHVLTDlxUWVUSThnd2VINkUr?=
 =?utf-8?B?TjNvWEFnRTN2aFVYS1NSOFZlTDY2cU9maDZobHpPZ3ZscTg5TW92WHpWU0t2?=
 =?utf-8?B?dWwyZW9sbVhSUGZIVzhsdzAxSWdZTWtiRkJtaCtpYkFWbmJCRjZTaUZmTG9n?=
 =?utf-8?B?UC9GaWJiZDJ1K1VMNWYweU9XT3BzWmdVZnYwOEJ0TFZnZTB4aSsyZThFRmxr?=
 =?utf-8?B?bmxsMHVVREJsV3ZoKzkwVktUOE5JTE00MnJlVEJLZHkwMHAvWThXc1hCSjdp?=
 =?utf-8?B?blZyYktKOWs0ck9iRWdRNnEvaUo5TmdFTUhaMTc4RGoySG43Y1NDc2ZkeWJ1?=
 =?utf-8?B?SGFuZUJuMTB5VHhrWFY3OEZNVFlhbEhpcGFLYklqNm43WjE3VzRoaUhEaGRQ?=
 =?utf-8?B?K0hnNmd6dXVETVJXaFQya2w3SUtpdGtGOWlrYkhCbzYzRWpIc1R6Q2tkdnVH?=
 =?utf-8?B?Y1ErN1JkejRqa29XY0JqSzRtZlROeFZkejlEVkJNQ05YaC9VdmFyU2JFRmJu?=
 =?utf-8?B?cEF3T3FFSGxKdlZFQnptVlhFT1B2cmxnUGF0WUNqUlUrcXdNU2dkaWI0dHlI?=
 =?utf-8?Q?ETLo1eB2/sRAb7iQDW4Bd9Ngk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca979fff-1e34-45fd-6d9f-08dd499e22a2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6588.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 06:42:49.4433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kDLsbh7V3wuN+Ww2qg3dkqcS1qvC8q9/QvDfpsXD5HlaAifrugs6vXnAqoUEJDMNg1qKwyhdz9oACcu3vPBDLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7141

> @@ -13467,7 +13665,13 @@ perf_event_exit_event(struct perf_event
>  		 * Kick perf_poll() for is_event_hup();
>  		 */
>  		perf_event_wakeup(parent_event);
> -		free_event(event);
> +		/*
> +		 * pmu_detach_event() will have an extra refcount.
> +		 */
> +		if (revoke)
> +			put_event(event);
> +		else
> +			free_event(event);
>  		put_event(parent_event);
>  		return;
>  	}

There is a race between do_exit() and perf_pmu_unregister():

Assume: a Parent process with 'event1' and a Child process with an
inherited 'event2'.

                  CPU 1                                                       CPU 2

      Child process exiting ...
   1  do_exit()
   2    perf_event_exit_task()
   3      perf_event_exit_task_context()
   4        mutex_lock(&child_ctx->mutex);
   5        list_for_each_entry_safe(&child_ctx->event_list)
   6        /* picks event2. event2->refcount is 1 */
   7                                                             perf_pmu_unregister()
   8                                                               pmu_detach_events()
   9                                                                 pmu_get_event(pmu) /* Picks event2 */
  10                                                                   atomic_long_inc_not_zero(&event->refcount) /* event2 */
  11                                                                   /* event2->refcount becomes 2 */
  12                                                                 pmu_detach_event() /* event2 */
  13                                                                   perf_event_ctx_lock(); /* event2 */
  14        /* event2->refcount became 2 (by CPU 2) */                 .
  15      perf_event_exit_event() /* event2 */                         . /* CPU 1 is holding ctx->mutex of
  16        if (parent_event) { /* true */                             .    child process. Waiting ... */
  17          if (revoke) /* false */                                  .
  18          else                                                     .
  19              free_event();  /* event2 */                          .
  20                  WARN()                                           .

                      ^^^^^^

This race manifests as:

  unexpected event refcount: 2; ptr=00000000c6ca2049
  WARNING: CPU: 57 PID: 9729 at kernel/events/core.c:5439 free_event+0x48/0x60
  RIP: 0010:free_event+0x48/0x60
  Call Trace:
   ? free_event+0x48/0x60
   perf_event_exit_event.isra.0+0x60/0xf0
   perf_event_exit_task+0x1e1/0x280
   do_exit+0x327/0xb00

The race continues... now, with the stale child2->parent pointer:

                  CPU 1                                                       CPU 2

  15      perf_event_exit_event() /* event2 */                         . /* CPU 1 is holding ctx->mutex of
  16        if (parent_event) { /* true */                             .    child process. Waiting ... */
  17          if (revoke) /* false */                                  .
  18          else                                                     .
  19              free_event();  /* event2 */                          .
  20                  WARN()                                           .
  21          put_event(parent_event); /* event1 */                    .
  22          /* event1->refcount becomes 1 */                         .
  23        }                                                          .
  24        +- mutex_unlock(&child_ctx->mutex);                        . /* Acquired child's ctx->mutex */
  25                                                                   __pmu_detach_event() /* event2 */
  26                                                                     perf_event_exit_event() /* event2 */
  27                                                                       if (parent_event) { /* true, BUT FALSE POSITIVE. */
  28                                                                         if (revoke) /* true */
  29                                                                             put_event(); /* event2 */
  30                                                                             /* event2->refcount becomes 1 */
  31                                                                         put_event(parent_event); /* event1 */
  32                                                                         /* event1->refcount becomes 0 */

                                                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^

This can manifest as some random bug. I guess, perf_event_exit_event()
should also check for (event->attach_state & PERF_ATTACH_CHILD) when
event->parent != NULL.

Thanks,
Ravi
