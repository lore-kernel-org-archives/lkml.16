Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2061.outbound.protection.outlook.com [40.107.95.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E66151988
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 11:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738755177; cv=fail; b=YecOulsneoZHRV1zSx+nKcUx0NszhPVrhtIvJEcJpq1AQZ7jNcjI4+Nqkhac67ZjjvgiRHs1B3vnIPXJsE4wyWX4BJqH3+eAhLSjx6SOIWThrc5fH0phlUTdM17z4Dnkm/gewOwbLf/eFOCbTYeryygxdllbXMT5isQWQxcAHdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738755177; c=relaxed/simple;
	bh=e/ZqTm5nFuIlMTmfH3hW48QQWLIMDT8gvGIZFMNTyCs=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=olhuU1so+ukLbE8RFfUXD4jBF2sLuiLLfxzsKSLfsAU8VVWDoJ+50gV23k0ocWYq7xLIMEPcALSh6p0GbSMZdrdeUQULAjRH0gJ+9rY6VCpN7EwHvIAtUTxB3Sq7iyhx1/uK9wGTx0n8KbZxoZrYdQmEf7TKGHbu+02bzMryaSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Or6O9hGQ; arc=fail smtp.client-ip=40.107.95.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Or6O9hGQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UzO0qzgNA7uZOYPnM+RDbDLWt4IHnSShYbZB7n6Y6raY6oem4gck6l8xCd4yPTWvqsz5ymLcdeD72gIR9y6r7tWdt4CSVY4nvy4cz2KTCuxOghlKQ2ANdR0VMjgyYE8SHZ5s+N/DR2bzkNvRtGQL0HRmKUXXP6FJ+a7mjlC9DbOrSNYkaXZ+os2Pq1NHnRPVkIawhPoYAeGPa3hAVD7ET5SPofm2RcNoVe3mgmfjBb57Pnk8ptnDtI7a0enUc3IdSyaLvo+6dihnGyoMUUIBA/VyN9cUWI3WPhvUY8YA+ws+9ECy1m7ZKhWKnyYGmcfka7YFxYaIzXDptJJDfwhplg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/ZqTm5nFuIlMTmfH3hW48QQWLIMDT8gvGIZFMNTyCs=;
 b=w9ERu+cX0enxQmYplj/P6Lnh9dU/V1xCnKm4Wwnt+pFj9BFx3rKOF74596pdPUbGR0PyYCEQAxbs4p/co7oAcXZlM0PBSjkO0/QYZzuRfolZVMyCKV48nJF4xw1pU/tWstaRjRUrEmYbdObzVKt8fl1S+Vy9M19RKnZFnWE+PCYWBkeuvp5VbKu4LScG7YJxwq5v4+mcH+yGf3nNdEM1jhZxXDPy2Gt34k5BVaT1JOtoiYPagJNoxrOZkcst4JVqJvyzt9uDfGJjKPtRvp99krcXwGtb1/FTPXIdddwEm4losan7msuk8PtftQJoUNrF85JjhSaIi9KzIntF6uDwag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/ZqTm5nFuIlMTmfH3hW48QQWLIMDT8gvGIZFMNTyCs=;
 b=Or6O9hGQJ8MsHlaS4it8rzUnYchkHd4+DJvO3wrNFKQ3jNNsQxy/JbMx8+LnNUV/f3CXdhGYQlX0qOGAebukjOH4vVxGodZLb7dBMQmHF6asds4nfxL7hlzO2ote83zROo07WjaanwSIO+2kZ1g5z2nHwhoJMFMEL9GCPWQP3KQ=
Received: from DS7PR12MB6070.namprd12.prod.outlook.com (2603:10b6:8:9e::14) by
 CH3PR12MB7571.namprd12.prod.outlook.com (2603:10b6:610:147::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.25; Wed, 5 Feb 2025 11:32:53 +0000
Received: from DS7PR12MB6070.namprd12.prod.outlook.com
 ([fe80::b847:e013:8f93:f6e4]) by DS7PR12MB6070.namprd12.prod.outlook.com
 ([fe80::b847:e013:8f93:f6e4%6]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 11:32:53 +0000
From: "Manne, Nava kishore" <nava.kishore.manne@amd.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>, "Simek, Michal"
	<michal.simek@amd.com>, "Jain, Ronak" <ronak.jain@amd.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Buddhabhatti,
 Jay" <jay.buddhabhatti@amd.com>, "praveen.teja.kundanala@amd.com"
	<praveen.teja.kundanala@amd.com>, "Paladugu, Siva Durga Prasad"
	<siva.durga.prasad.paladugu@amd.com>, "u.kleine-koenig@baylibre.com"
	<u.kleine-koenig@baylibre.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] firmware: xilinx: Update the zynqmp_pm_load_pdi() API
Thread-Topic: [PATCH 1/2] firmware: xilinx: Update the zynqmp_pm_load_pdi()
 API
Thread-Index: AQHbbYKHLS7UQSuOqk2WIJJUUBnYtbMlb3SAgBM3QgA=
Date: Wed, 5 Feb 2025 11:32:53 +0000
Message-ID:
 <DS7PR12MB6070A83267558A7D545E3383CDF72@DS7PR12MB6070.namprd12.prod.outlook.com>
References: <20250123103522.1258499-1-nava.kishore.manne@amd.com>
 <20250123103522.1258499-2-nava.kishore.manne@amd.com>
 <2fd825ac-ea58-4acd-a27b-b104868bcc20@oss.qualcomm.com>
In-Reply-To: <2fd825ac-ea58-4acd-a27b-b104868bcc20@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB6070:EE_|CH3PR12MB7571:EE_
x-ms-office365-filtering-correlation-id: 065148e2-2389-4200-55a0-08dd45d8d43e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TnMyMS9jMWg5MkwrdE5zSjhxTnhXR1psb1FXUHBYOXQ4KzFDaE9wT0liWVlY?=
 =?utf-8?B?RDE3T2E1dElUNWo5cXJEbEp0RVN1MlM1VlpOVUNMOUwxMk5pZTV6L1lzYlVk?=
 =?utf-8?B?eTFQL3hvcCtCdlZFNXBqTW5lSFU1SFBtTXJvSWQwdk9IU1lPUFpNOEFDNnov?=
 =?utf-8?B?RU53eWNhYVVEKzYwRnJ3VzB0WmxxcVU0T3dsMDZrU01uRllHTEQyRFZVZGpF?=
 =?utf-8?B?MXlnblB0YUMycWxSNlJKanRoUnk3bDB6Q1NXSkNnbmVjeWtOUU5KYlpvcXkr?=
 =?utf-8?B?Ti91RmJHUmtLYmlzdjNKVTBMRVgvUlExbGpzL2ViMVR4SzZlUDV1Z09vMjJE?=
 =?utf-8?B?TWE5OG5EMHBnRjRUaVFub0cydEZ1cmtTaUMxVVBTSGV2eGdod1B1bmdMcWFv?=
 =?utf-8?B?dmZxR1YvcHhPQjhDQUJGN3NOS1dzNW1vYThJOVFZUE9mQU5iNU5peGh6K2RN?=
 =?utf-8?B?ZWFYd1ZBVUN0cEl2VGhOazMzcURkSlNNUnEwRHZ6TU1yNldneTN4VUlaenNN?=
 =?utf-8?B?RXNBUGNJampJZWZKeVRDV1VXWVl6Wll2NlFxTVpwZSs4OTRoR21PcllIejlU?=
 =?utf-8?B?N2Q4YWVpK1N5enZrVldWcWhkOHg5U1JLNURVNDNOWVphaEVXVkhFK0U0ZS9i?=
 =?utf-8?B?bTRaakRTZkp5VytJUm8vajdiMi9Wd09yczhuRFpGWVNkbTlaNVROM2U1clo2?=
 =?utf-8?B?VlBpY21Ib1NYaWp2eVFmNGE5UitiTTVla3BZdGZpdSsvVVFZMEJBTEphak1v?=
 =?utf-8?B?RXpSMExHMldKVElaZ2JmcjhNRE1zelVYdkNlYUc4UzhrdGUzUHpuZEl2bVJH?=
 =?utf-8?B?bkFHdmp6MGxZZE5JTkpobnFGNzdEM2hQVk5mUGlmU3Y4b2VrZjM0ZVhIbWF2?=
 =?utf-8?B?REMzdlZobWlzVHMzbjcxK2M0SWFpTlFFUlJVdDlvcHhjU1FZZG85S2RpK2o5?=
 =?utf-8?B?WUMrSTN5Q1NNcnZrTUFETWNBeFZXdldFKzN4TTFTeEFZTGd4aUNxYUFHby9W?=
 =?utf-8?B?ZnVyNWpMSnIyTXNLeEZsQXU1YWwvQVJSOFlMMTA2bHFvSXhqc1ROcVVBcTdC?=
 =?utf-8?B?RDJLcEZZZ01lSTZRRUk0Z2o0WjdteUFKeCtmN1dEQkx0ZVkrRW5DTU91UUYw?=
 =?utf-8?B?NzFKQjBaTlhVWCtEMkZjUFc0UzBkMHZkYksvRVM3U1R2dUdqSGUyaFk2U3hq?=
 =?utf-8?B?RFlEenU1b042TDJNdUdNNUptV2g4SWR3RTA2UGM5NTVrSFVyWXRTQmpvVy9N?=
 =?utf-8?B?bUt0UDM1MHVwN2ZBV0QxMmFqcWtZSTFpclo1eHRVRVNqbGJwL0MzK3VKcWhG?=
 =?utf-8?B?c3l5ZkhtN2UvL1U0R2oxQ0RVNnQwU3ZlRzFBaGdQa2d5d3dya2UwWlk4czRx?=
 =?utf-8?B?ak55YkU2VHNmN3Q2MUlKS2NGbDJjNUVMekN2NWc5NStQRW9mM0VjWXVibzda?=
 =?utf-8?B?N0FaaU9PNS92R2hnQjhtSlpiMVozdkdoajgxNE9YVU1WQ0JUT0J6KzJ0Rjcw?=
 =?utf-8?B?MVEvS3k0SjVnZUVIdnVMaitIUmkvR1M3eTdaams1K2MyempJREZrN3B4VDZX?=
 =?utf-8?B?TXhpenFyM3ZKS3k0bGpMMXhZWHpnWElTYzY0ak94Q2FQdlpaKy96bnhVUHVV?=
 =?utf-8?B?TGJNeG9JcGdHS0dEeWcrS3dpeVJKUDNMa25tQWlLR3VsSGlCZHRQZ1J5Q0Zp?=
 =?utf-8?B?K09XdTZxcUNMOXJvcDBCdzhKVGJoNzJOSmtPS1B1NVA1MXJKNGZ3ZXd5UE9C?=
 =?utf-8?B?MmpMaWdDaEVyaXNvQlZ2VExkUGh4T0FQdk1rcFVaS1ZXdTk2K3F6WWdQdTJT?=
 =?utf-8?B?anZIL3NVcmI1TlNQYS9ISWVHK3crZ20rVml1VGd6WHBUV1RQcWNmNFBBUmJ4?=
 =?utf-8?B?TDIybldqSkR1aVRmT3FOMWJqK2xDaTBmaTgyTzFRTVA2b0p1MWdlak5yKzBN?=
 =?utf-8?B?WUdTNm9vMFNSVHZjbHhmb0tPTFJCZHFON1FVNG40SDVMMU5LMHhvTk5yYVV2?=
 =?utf-8?B?dHloUG8yQ3NRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6070.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dzdwKzkwSkZTTVA1bjlJYktycXRTSHZhTXZBRkFIS29EUWtVNzV0d1g5ZXdk?=
 =?utf-8?B?R2swY0FWdVVXWXd4cTQvOUlQVkxyTlFmQldUZ3Z3ZEswc0ZyNm9VWGVQQmhp?=
 =?utf-8?B?SS9pV2VSdVpsNld2YVkxaTlLZWZLeHBYbHZCdmFROGlqMVhwRHZjeXRRUWlQ?=
 =?utf-8?B?cCtrdXVRUmFMTlZpK3dzSWRMVmlYMitzcm1ibE16Y01nazhOTDV3RGcvODg0?=
 =?utf-8?B?ZjlGQThwOVZPR3VSK003YWtKNzBCcnU2SjFDVStESStFOUVGSUNLYVpNL3Q1?=
 =?utf-8?B?TXVTeGxaNENKY1h3VVExMEJnUHFOTzQ4ZUk0L1U4bWxGVU0vQjlXNUpNNG96?=
 =?utf-8?B?R1d5VUJPUzgyRXI1b3gvWE92T0pLcVZPS0hsaU56R2FUNm1GSTJmQm5WaE1a?=
 =?utf-8?B?dFhZM1BWeWt1OGQ3ZUZOS0I4UXJvMkR0b1VreDRkVzkyWW1uMkZyQllmNEh2?=
 =?utf-8?B?dWdGRDFoVnFhc0padGJYRzJjTDJCQURFb2tuQ3FUcnVocVdmZ0wzOHRmdk5u?=
 =?utf-8?B?ZjZuZ09ZZzRIa1g3dmhMdHI1dHdwT2UxemFBejNSbzR6eGdyWjI3S3ZCV3RT?=
 =?utf-8?B?MXRTb0dndXR3T3JvVzhZVXlGeVJoWjV4d2drNERwUHdvZ3g2VXF0Z0dRc3hB?=
 =?utf-8?B?VmNLZ1VqOXZ5WlpBYXRzblpFaU0zeHp3dEdJMnErcEpWeGFpTVpzUW1TdXA5?=
 =?utf-8?B?VytYb1ZUdjVNWHM4c0xCQnFnNkNoUEVJZGw3dWdKRHExeDd1K2dYeDVSMTV4?=
 =?utf-8?B?VGNIZUVIVGNRaUpscXpVWHg2YUsyMlJPaXlkRWFPSnhmakdPVlVwMWMycTRP?=
 =?utf-8?B?cHMxQXhnZ3dneGplTkxsbmF3VmlXU3ZJTGFuNFVIOWNPajlMQUJwTkZuOUpZ?=
 =?utf-8?B?Z1dYTmo0cmJwVDhmc1dMYXVDQWZnYk1GelRBMGIvSjNsdmFhWmNCTW9Naks4?=
 =?utf-8?B?cGlVa3YySHFYbmNQVEo0NWFXRVdxTTZ1VzFiUmxaR3JmMkd1Q3pLZ2p0RDZY?=
 =?utf-8?B?SjBOdHVkS25WUlV1bTlrVk1KY3BQQjdsZDZWa25ya2xqcGhVUXRCcVp6ZnJx?=
 =?utf-8?B?VEVtcVhrSThoYVE2RlVpakhSWld4ckFhcmdpTW9WL09BeS9jWTBMMUxROUVH?=
 =?utf-8?B?VE82ZFJLRVVuUzVkdEVjenljRm9UWVFPYjdjWDhLZ2RGck5JYk1sTTlrQ2pP?=
 =?utf-8?B?QncwWGVrYi9NUGJrN1VlOG9VMlJxMFQ5RUNpUDVaTGxPdkNRSHVHS0x5c1Rz?=
 =?utf-8?B?eEc3K2VoZTRFR3BONlJ6Q01lYlJmc2wwSVliUnMxclVtY1Q0eWkweXpsMUhx?=
 =?utf-8?B?cU11UGt4aGtNZ1VwOFVqRGJHSjVmYUNnd25SclIzTlhubjRMU1NPQ1FHRDMr?=
 =?utf-8?B?WVg5OWIyWGg4VlAvbGtuL1FmNWhXTmZyZGVROFFKeENNSHlMMWc3MXplQ3o1?=
 =?utf-8?B?YjFXOFA0TzB4VmZraDAxU3czQ3QzQUZVaVlUb0UxQ25CbWVTZVYraE9NQ1RY?=
 =?utf-8?B?VXdETXZFNndsa2tzaUExdlQrR24rNjlZZUE1MEVTYXQ2RHQ5T2RqM3FQT0o4?=
 =?utf-8?B?ZERjRDBZTDFidlZLczNoM1NzUE1RVXJ3V01YSTNZN0ZvYnpFeGtDdzhNaUVB?=
 =?utf-8?B?aVJtRTMzVlBXczFFTndnL1YwZEhQUEFlM21EdlJKMU5pTGlYUW1CTS9JeGk2?=
 =?utf-8?B?M0E4RjZvQlo0dFc5WFdmOWpYRVA1bXMxcmNiblk4Vk5hNmpRWDFwLzluUmt2?=
 =?utf-8?B?d2VKMUtYY1pJbnpyWGxOOFZZMXpERlJlSk9LQ3JPZ2x1WkZHR2JpQytFRzha?=
 =?utf-8?B?TktzMUZneXorL2syTlVvTC96ZDBMZVlKc3NuSi85TXhCMjNDUXJNdXpBL2FW?=
 =?utf-8?B?VG9ua1ZJN3pvRWhDTk4vQ2VrczRsd0wzZnVHSWZwcW94cE9salNPTkdyVE4v?=
 =?utf-8?B?aFRHWnJvY0xINXM1YmxCcUxDY010YmFpVjhzRlcxcUpnYTVqaVp2Q3pLNTBw?=
 =?utf-8?B?NVgrTm5ka0RqR0o0emRuRk4vcHNpQzNYQ2s4TXBtdHJHRzMrNmFxZXo4MFFP?=
 =?utf-8?B?T2piY1dQWUpZTWRnZnBjU1hyTEhvSW11QjZiUHE1LzNPOTkvVnVhZWMrc3Fk?=
 =?utf-8?Q?EwOI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6070.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 065148e2-2389-4200-55a0-08dd45d8d43e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 11:32:53.2217
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PvE3oenmpSIXiiW6tbT+LbDhLgfKj6XXJuAz4oGBs+EHk2XaOFSe28krtKF47dtB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7571

SGkgSmllLA0KDQoJVGhhbmtzIGZvciBwcm92aWRpbmcgdGhlIHJldmlldyBjb21tZW50cy4NClBs
ZWFzZSBmaW5kIG15IHJlc3BvbnNlIGlubGluZS4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBKaWUgR2FuIDxqaWUuZ2FuQG9zcy5xdWFsY29tbS5jb20+DQo+IFNlbnQ6
IEZyaWRheSwgSmFudWFyeSAyNCwgMjAyNSAxMTozMCBBTQ0KPiBUbzogTWFubmUsIE5hdmEga2lz
aG9yZSA8bmF2YS5raXNob3JlLm1hbm5lQGFtZC5jb20+OyBTaW1laywgTWljaGFsDQo+IDxtaWNo
YWwuc2ltZWtAYW1kLmNvbT47IEphaW4sIFJvbmFrIDxyb25hay5qYWluQGFtZC5jb20+Ow0KPiBn
cmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsgQnVkZGhhYmhhdHRpLCBKYXkgPGpheS5idWRkaGFi
aGF0dGlAYW1kLmNvbT47DQo+IHByYXZlZW4udGVqYS5rdW5kYW5hbGFAYW1kLmNvbTsgUGFsYWR1
Z3UsIFNpdmEgRHVyZ2EgUHJhc2FkDQo+IDxzaXZhLmR1cmdhLnByYXNhZC5wYWxhZHVndUBhbWQu
Y29tPjsgdS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbTsgbGludXgtDQo+IGFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIDEvMl0gZmlybXdhcmU6IHhpbGlueDogVXBkYXRlIHRoZSB6eW5xbXBf
cG1fbG9hZF9wZGkoKSBBUEkNCj4gDQo+IA0KPiANCj4gT24gMS8yMy8yMDI1IDY6MzUgUE0sIE5h
dmEga2lzaG9yZSBNYW5uZSB3cm90ZToNCj4gPiBVcGRhdGUgdGhlIHp5bnFtcF9wbV9sb2FkX3Bk
aSgpIEFQSSB0byBoYW5kbGUgdGhlIGZpcm13YXJlIGVycm9y4oCZcw0KPiA+IHByb3Blcmx5Lg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTmF2YSBraXNob3JlIE1hbm5lIDxuYXZhLmtpc2hvcmUu
bWFubmVAYW1kLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZmlybXdhcmUveGlsaW54L3p5
bnFtcC5jIHwgMTIgKysrKysrKysrKy0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Zp
cm13YXJlL3hpbGlueC96eW5xbXAuYw0KPiA+IGIvZHJpdmVycy9maXJtd2FyZS94aWxpbngvenlu
cW1wLmMNCj4gPiBpbmRleCA3MjBmYThiNWQ4ZTkuLmVhMDRhNmFjNDAyZCAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL2Zpcm13YXJlL3hpbGlueC96eW5xbXAuYw0KPiA+ICsrKyBiL2RyaXZlcnMv
ZmlybXdhcmUveGlsaW54L3p5bnFtcC5jDQo+ID4gQEAgLTE0ODMsOCArMTQ4MywxNiBAQA0KPiBF
WFBPUlRfU1lNQk9MX0dQTCh6eW5xbXBfcG1fc2V0X3JlcXVpcmVtZW50KTsNCj4gPiAgICAqLw0K
PiA+ICAgaW50IHp5bnFtcF9wbV9sb2FkX3BkaShjb25zdCB1MzIgc3JjLCBjb25zdCB1NjQgYWRk
cmVzcykNCj4gPiAgIHsNCj4gPiAtCXJldHVybiB6eW5xbXBfcG1faW52b2tlX2ZuKFBNX0xPQURf
UERJLCBOVUxMLCAzLCBzcmMsDQo+IGxvd2VyXzMyX2JpdHMoYWRkcmVzcyksDQo+ID4gLQkJCQkg
ICB1cHBlcl8zMl9iaXRzKGFkZHJlc3MpKTsNCj4gPiArCXUzMiByZXRfcGF5bG9hZFtQQVlMT0FE
X0FSR19DTlRdOw0KPiA+ICsJaW50IHJldDsNCj4gPiArDQo+ID4gKwlyZXQgPSB6eW5xbXBfcG1f
aW52b2tlX2ZuKFBNX0xPQURfUERJLCByZXRfcGF5bG9hZCwgMywgc3JjLA0KPiA+ICsJCQkJICBs
b3dlcl8zMl9iaXRzKGFkZHJlc3MpLA0KPiA+ICsJCQkJICB1cHBlcl8zMl9iaXRzKGFkZHJlc3Mp
KTsNCj4gPiArCWlmIChyZXRfcGF5bG9hZFswXSkNCj4gPiArCQlyZXR1cm4gcmV0X3BheWxvYWRb
MF07DQo+IExvb2tzIGEgbGl0dGxlIGJpdCBoYWNraW5nLiBBcyB0aGUgcmV0X3BheWxvYWQgaXMg
dTMyLCByZXR1cm4gYXMgaW50LCBpdCBoYXMgcG9zc2liaWxpdHkgdG8NCj4gb3ZlcmZsb3c/DQo+
IA0KSSBhZ3JlZSB3aXRoIHlvdXIgY29uY2Vybi4NCkknbGwgZHJvcCB0aGlzIHBhdGNoIGFuZCBs
b29rIGludG8gYSBwcm9wZXIgc29sdXRpb24gdG8gYWRkcmVzcyB0aGUgaXNzdWUuDQoNClJlZ2Fy
ZHMsDQpOYXZha2lzaG9yZQ0K
