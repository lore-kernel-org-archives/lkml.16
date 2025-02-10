Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08020199FBA
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 06:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739170776; cv=fail; b=n3Prhu06QyMgyvanP5YehczZ8svruAQeuqrobxjpM36Uf+clvm6DS4jK+rpQwbUMtecD2mSZFuT94+XICXefJLhxTOTpn3EqmxjHM0gva4b5GA447ViBn2zrQtw4DGvAcq73HeVMOVK2+zCm3Tb1zJCxgvLTSm2+GXfbHceBFxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739170776; c=relaxed/simple;
	bh=O0XAGRpr+n1ls7+WkC5dbWtBSKb9VVRPdadeWujdag8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oTfagQEHcCXGCQLcwbO4v+vYYqYQGi7vUjpZBb33OBMKrlVEhQgSmLuOyqhkQc6xxtABFsvv/3Tm+Km8ZfHfr6zihu77uHcstyk8abVkv21xJ1FfpV6r7z+PZSjAy9JG1jtDVMt5206dGaJy8PUfN6yB7GX6397zHRjcGLTZ3HA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AbSAEENW; arc=fail smtp.client-ip=40.107.220.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AbSAEENW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0+E/YHWM7rRU5w40Js+ReeUQdM6UJUgPqGW7oO83cmPcyc3G92ZeoICunepe6sK9U+OvVeG9FKRZRu4m8KMCxetGoqXYun83Xmla7lOrUnFoj47G4BuymEfvktWN6EKVQQlF3m+lE50/dwKyiZKn0AydvN9fmWT1yEdof2LsREN9VP6r2ao8PjscXUjOhIES5eRizsYuZ5hokNIoWLUdS/vHf6d8o2W2JMs0sWeFT3YhVvieGdxbb/FbMyCe3KWBk/9caoXQ9xQXWfdDN5FYNoZyMUDMlL71UXH5pzg8qmk0FfD+FnrPuv3Dt70whAlTrQN3qmlJJDe+Vs3GMV1Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Xo9GNzCmAbNTTw2J7NmzCWs/tjHmvvn13yyWIPWwlk=;
 b=KVTYHAoodi1IoQtcR8+zu+9ScdmK2v9T02+lAGUUiluav3AotY9t+insssZlG8d80VQu8XQiZV0kSTLe3nLbDnYq2HKMscj+1WDphMJi5Zzk4bgVtD1zAjRyKbdUrt+gCJjboLCIoF1S8nhTM9yxZcZmcpZtsYCdOzY4iVRYHNZmUluGG/RkUq4ddPzoxzyWMDxn/Bg6VccaHd0xNUdSZcLljch/fVu98juAcoQZn2x4ONEOVEtb8G36odV/ASiV/bFhuerAQuKMVrEmbdJ5xvTqnSCxZU9W1x6iT2rnYplVCByJe/YCB56BkdwIJhIUufAVkyZV+7lAAy57A/+z6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Xo9GNzCmAbNTTw2J7NmzCWs/tjHmvvn13yyWIPWwlk=;
 b=AbSAEENWSKP52EahflsKbJG7CPVnz4FokhRb4jcrAkplj3ex9LXtudsBWmRagNcnRwJyftU5KSTaeOyitSQ5kh3Mddq7pSyOwTh0hiK+EezIhllPKE6O0yl3QgQJvSiUHEKUA+bs16yPWt/5GekapoEY38iTvZl/OVPc42U4JzY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6588.namprd12.prod.outlook.com (2603:10b6:510:210::10)
 by BY5PR12MB4289.namprd12.prod.outlook.com (2603:10b6:a03:204::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 06:59:30 +0000
Received: from PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::5e9c:4117:b5e0:cf39]) by PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::5e9c:4117:b5e0:cf39%6]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 06:59:30 +0000
Message-ID: <50723a74-7d7c-4613-97fa-f4ee4ae0bbee@amd.com>
Date: Mon, 10 Feb 2025 12:29:21 +0530
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
X-ClientProxiedBy: PN3PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::9) To PH7PR12MB6588.namprd12.prod.outlook.com
 (2603:10b6:510:210::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6588:EE_|BY5PR12MB4289:EE_
X-MS-Office365-Filtering-Correlation-Id: d9800000-7fd8-4101-6510-08dd49a0776d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y01jdTFoSXdZaWhQc0ROcWJncUhQQ2VIT21wV0psTk9sV0NLNldMdER4d0RF?=
 =?utf-8?B?TGhlZWF0Ny85ck10MjFTaEliYWdlbVh0eitJZFVlUlNoRzBDb0FqV2xRQU94?=
 =?utf-8?B?TkJ1NkRvNEhxcjMvR3N0MGt5WDZlbGtFaVlXVzZnRENKdmdMS0N2c3BnWVJL?=
 =?utf-8?B?WnRNWkpBcU1iWGFEV1lyNE9OUk1tdVo3aGxBV1h0VEZETUd6TGRtMDZkMFQ2?=
 =?utf-8?B?SXRjS1pIN2svL2dtRWtycmhQaW55dllTemQrUVdTeklnZm1XNjJ2aEhGdmRz?=
 =?utf-8?B?eWRTSnlkVXcyaWNCV2pzSjF2VWpiVnF3bVJzd05HMFhCYzJWS21hUEw3Rjlu?=
 =?utf-8?B?M1huU1dZRUFpM1RmWTNkNWRxdkp0MTVlazJOV3E2UmZDb2NMdUR2aVlCZjJZ?=
 =?utf-8?B?Y2ZBNFh2bUlnR3JhTkFIK0MzZUp0ZGtxM2JWejBET294bXZrRzFOMGFkeG05?=
 =?utf-8?B?c3haTjdLRGdLSDQ4SldndFZrRVNlVnk3a1RqL3F1bmNrL1QxQjNPSU96UW1C?=
 =?utf-8?B?KyszOXZLSGp2ellzWjJlTUlpRkJrRjZ0RDZrWDNYQzgvYzlWMEpPeTduM0Rz?=
 =?utf-8?B?bzViaDM0N2NHUXdrcTY4a1FjQlN0TUZpdE9MM2JPMEQxb1pjekJqekNuTUhN?=
 =?utf-8?B?VUM4Vm54dXMveE1QaHBpUWZCS3FCek10eFpXTTJpOCt0NTJFOTl5aDNpZFVp?=
 =?utf-8?B?K0R3eGhtVWRoblNHdFVUMFR5MnBiSmxQQ3V0N0Q0NEdZdjQrYjQ0UVdWZ1J4?=
 =?utf-8?B?VHIraGdvMjB0SnNwZ2pGeThmTjRpZlkxUlU2M2hMZHp2b1haRmJITHQrb1pn?=
 =?utf-8?B?TTRySTRNbGNDOEpYenpoVGJ5dzdaOFZRcXZzN3V4ZDZFMXNtdW85RWdYVVZj?=
 =?utf-8?B?czVUVEF4MXN5UWlReGVkdWw0VzZGME55NDBxd0RxSXBpNG5zbnFFZXFYdk9E?=
 =?utf-8?B?bTNrdTJwQWlYY1JuV3FxanY4YWxzc3hGRVp2eFNVYTVmY2tiNkphb3NBT2da?=
 =?utf-8?B?SUszaGN1Lys3dG03aFJjc0kydzVnQUNTSWtpMkRTTnFuYjkxRm9wTy9sSDlL?=
 =?utf-8?B?ZkJuTXlKM3h4WWw5SkhqdVZkaU1IWUFHZ29BR3VQbTlSV0QwakN2eVdiZDd0?=
 =?utf-8?B?T282c2ExRzY3bkVIbXZMWGtxTEg4UENiK2dmWjNLdEZnbFI5a2U4V3N4ejd0?=
 =?utf-8?B?ejBPRCtBZVg5d1BwZUNXakdYVU55bHQ0aTRpTXJlajBSdzdlUnJsUGNFS1Qr?=
 =?utf-8?B?M0JTbVYxOVpvcTJwQUdjL1FnT3pPR1B6bm9FcGZYTWVqUXIrc1F4cTU0WlNy?=
 =?utf-8?B?R29yMnpZZ1FRSU1CMjZabHVFTGNUZVFoNGMvVys3Z2ptTmQvUldYUm9vY2FE?=
 =?utf-8?B?bmJiRXQ1alljSkZZTXlKRGJ3ZVI4T0VhajMwOC9mQ0hzZE9pdHcvRnlrNHRw?=
 =?utf-8?B?OXcxWHdZTlZReVdyNmhLTmpaV1FKanhxWERVQTBWN1ZYS0Y0TWxQZFNIbnMy?=
 =?utf-8?B?VnlGZzdmOUJwbnlLbldEM0RLSkRYeGZhVVgrWndJbkxiZzRMeHcrTTlSMVRr?=
 =?utf-8?B?QWJqQlpLaisyTzBYbkVYSnlpQWdJcDlZdmxqOCs5OWlSdWVmUTdrSW1uZEds?=
 =?utf-8?B?aklTS29NcGVtRHlNL293TUhlMHNoOWRxcWZvSmxvbDR4YTNEVHBnQ0E1QVE5?=
 =?utf-8?B?NDAyVHJRNnA4Vkt3bEFnYnJYT3hkOUhIdk9Gc3BoQ3FySWRKcVZRZjJUUElS?=
 =?utf-8?B?TXRmaHBuTi85cHhUNzY2cURpTjlXaXE0Ymc1TFRXbWpMVU5LSjdES2dMelFx?=
 =?utf-8?B?UTdJZGVKaUNycHBEVjBSOUR1b3ZQWGl2WHh2UUw5VDFYYkl5Nm42Q25HWU4w?=
 =?utf-8?Q?46gDwICb4Coc/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6588.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0Y3aGZwWmhIdlZvdlM3b080ckk3WWROeU9ZRjZTNlBOaUxERVRvU2ZiUi9p?=
 =?utf-8?B?eEZhb2NhL243c1dBYnlnR1VOcHh6UGZVT2E1dTh2aEpCbmNnWUpTZFF5blJn?=
 =?utf-8?B?WjhzVHVTTGZGSFhFU0NtdGY5NlZLbm4zSXJ5cHlTSy80L3l1bDVWU0hUcndm?=
 =?utf-8?B?ZFlRZy9SR1I4K1N6YTA2MTdoa0NrWWZhV2FyOVdRQnNNeUFUTVpHMEI2ektv?=
 =?utf-8?B?bzZGclNzVWswRlRSaXdMOWR6MlliQWJPS0VsbGJiMmR3dWtobmpiY3RWMWRF?=
 =?utf-8?B?b1ZiQzRlWjZIa0h6WFhYblFzNjF2OTVTQzhQRkpENTMrc3ZnblpHeS8yY1pr?=
 =?utf-8?B?b0RKYXduTStmc1hROWJZTkt0RHo1RXQwTk9wWStQRXFEL1cyTDF4VXFwbTQw?=
 =?utf-8?B?SVBQSVRabU9jWk81YzQ5NUJramNtSWFRbnZ1NWdIZnNLY0pmWGk3RFl3N2Vv?=
 =?utf-8?B?SkxFbEx6ZXg5TlNFWUtkaHhuckI4cStKNHNxSk1vcmZWQWNDampnNTJMeE02?=
 =?utf-8?B?NkU0cXJRL2IwMWc0TjFpa1RUT3pQdEhXTC81NTVPMWFhZnJPWU9jamxpcGhN?=
 =?utf-8?B?dEVQQ1ZtTzFPWTFyUHJEYU5XbFl1Tk5CVmZZRkxWR0o5UnZOQmYxbEdxd04r?=
 =?utf-8?B?MnVYOHVLbSs3QXkvZGw5M21wQ3YwalR5MjN1S3dLdjF1ZHB3ZU4vK2M1K0Jz?=
 =?utf-8?B?QnhndHR5SCtlMkN1SUVBR1BMYWI5blJaYUkxdVUzS0FqdVh4cS8wTEdQTmJa?=
 =?utf-8?B?L0NIN3o5cWkvRnRPSmFZQmYvM2U1N3lvTFFtbWNUQW9KUTc5ODJlTExRSjNu?=
 =?utf-8?B?eXAvclFlVUxtNllVVVNUVzZXVkVtZ3EyUFFuVnJ0aXVBdkw3cno5UjYyb1F0?=
 =?utf-8?B?L3diZEtnZ1VpeHpQZ2poWjVWMTYrd2hUVDlOeE55RGF1b2tIWjdEQU1sb3RV?=
 =?utf-8?B?YUt5ZFhjTXRxMGw4anc4RTRZUkhWUWRtdXh0aEZTdjdvNnczZU1LVXFHcmlB?=
 =?utf-8?B?bEJTSklSWGxLVFlKVktVRnc3RjlVQUEveENOZmRHVC9QTnhua3J1c2piYlY2?=
 =?utf-8?B?RTR6ZXEzdzVRemowUWw4ZXNMTzlQd3gxYlNYVEFqc2JTWnhranozeHpjeldQ?=
 =?utf-8?B?bXphNGZPSXA4R2Q4V28xREFleGt6WnhBM3VSaEp0RWhzR1RNUkRES24yRnUw?=
 =?utf-8?B?c3VwM2pXNW9qQ3FqUVRUMEZ6dGg4WDlwUitmdllIZ3lZL3hQY3duaDNNMlJM?=
 =?utf-8?B?MytsSGZSWTZhMC9QYStpV01sRjhYL3dJSFB3TDNPZFVCRWVqOS9JZHptaGk3?=
 =?utf-8?B?Uk9vdHIwRisvSFluWWdYZHZxR296NWlGM3FtZS9jUVI5WWd2QWt6VkNyZlR2?=
 =?utf-8?B?RExGTFZJRVFpRHYxZ1VTSkhGaXl6UEw5MHJJOC9oS1lLaTNGWEVJckpoQzhF?=
 =?utf-8?B?SXNIQTdoaDhsZnNSaEJ4ZHM0dmRnODRnQ0FzZmJDQStSUXRCbGNnMUtMNUxD?=
 =?utf-8?B?ZW9vRHNSalZxamNtTkJCZmVLcXRXUDdTRTA1ZUVGOXFQWGdsS2VtRkpGY2JQ?=
 =?utf-8?B?NWNBZE8xbmM3WW91dFJYbTNKdzlJV25RTkdjdHhYZFNiS25zSmdFSXFiVDcw?=
 =?utf-8?B?dWZ3OExadkVBdVdyZFFuZ01XK2xwTGlhelZRamRIOXJ5L1RGSUV4b3ptR2VZ?=
 =?utf-8?B?VllqaUtYdkt0MUQ5b1hHWEMwc2JNNGk5Z0NHbDdnaEd2RDZsa005V3I5cWJr?=
 =?utf-8?B?aEpnSndKMlQ5ZVNBQ3ArVStjSnoxMVdQbjZUc2FlWlIzODRuUXhlT0w3RFhK?=
 =?utf-8?B?bWFQcDJ3dFJyQmovczBlQ21sZVAxNTVhNDBLV1VxN25NSVZxbkdkaEpzOGpN?=
 =?utf-8?B?MUlER25mUGY5SzUyVDJUbXZVd2dsK1R1VnZpQmFTalBvTSs5cE5vUzVONzhW?=
 =?utf-8?B?ZVBRRzRSWHZWR09qL2J5VEQ2cnZzak1VbTc3UkduVFMzYWhSTEt5cG9pTkIy?=
 =?utf-8?B?cGxMaGUzZVpENHNKVVVISzRCaFRuaDlzMlRFSlFOUGZsMXdvUEZzeFQ2MTFX?=
 =?utf-8?B?eUZUQ3RMRVdRZXV2V3ZHUkl4b0kyTnZ6ZFJrRjk1YVp2NnBiRmVNTjNEZ2E2?=
 =?utf-8?Q?RJdQHMRaqoxKx1B32gT71yPnL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9800000-7fd8-4101-6510-08dd49a0776d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6588.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 06:59:30.7296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fpw6qezLuVuspoQ5LGwS1PrKryTAkN+4OrL575Zy5nhP6tJMQ7fAoPifUoPef/whrfmvMccVX1ZBnPUelT8IBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4289

On 05-Feb-25 3:51 PM, Peter Zijlstra wrote:
> Previously it was only safe to call perf_pmu_unregister() if there
> were no active events of that pmu around -- which was impossible to
> guarantee since it races all sorts against perf_init_event().
> 
> Rework the whole thing by:
> 
>  - keeping track of all events for a given pmu
> 
>  - 'hiding' the pmu from perf_init_event()
> 
>  - waiting for the appropriate (s)rcu grace periods such that all
>    prior references to the PMU will be completed
> 
>  - detaching all still existing events of that pmu (see first point)
>    and moving them to a new REVOKED state.
> 
>  - actually freeing the pmu data.
> 
> Where notably the new REVOKED state must inhibit all event actions
> from reaching code that wants to use event->pmu.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Another race between perf_event_init_task() failure path and
perf_pmu_unregister():

        CPU 1                                          CPU 2

  perf_event_init_task()
    perf_event_free_task()
      perf_free_event(event1)
      /* event1->refcount is 1 */
                                                  perf_pmu_unregister()
                                                    pmu_detach_events()
                                                      pmu_get_event(pmu) /* Picks event1 */
                                                        atomic_long_inc_not_zero(&event1->refcount) /* event1 */
      /* event1->refcount became 2 (by CPU 2) */
        free_event(event1)
          WARN()

Thanks,
Ravi
