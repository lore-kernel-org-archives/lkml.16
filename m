Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63A21ACED9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 21:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744665156; cv=fail; b=Ut1IeEdtwXkcTQT37YOVkbiS/MMxjDQp+ie0UruxSRU/esk4j1MfrKe306NGgasJkRu53As+E1flQLeouw5XrAp1aZOspqBIOZNBxhXVxjQfgrVI6R9QZ3Lr+ekupcH/oMi2qNGa8LV3C32DVM0EAuRNiUxlsvRTGWu3sxfLyFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744665156; c=relaxed/simple;
	bh=N/feKGZXdhOVtE4qQrwazWqdkDccWxaBpxsqm3KADok=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=t5T8W+eyUvkp0gEbSIb6QlaF6exkio8Vn3jYvDsVPbmDsf/HcVZ2M7u4uBd8f9DmZgOrS9booNNWaUmyO2yYRXz8HezUE/I0e+o1/7FizYZd9f3+IHUiq9+RTKAr5aW9jHFgZ+E2ts8XVkTeo7/Lt2loxiYoyS0NI2kD4xZRBD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=c/GKDi7y; arc=fail smtp.client-ip=40.107.244.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="c/GKDi7y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d5gZe0CXpRArO/Uyg2j9LCs23Hu74RDCpF3eZ5svDGCWJH+upNUiMAz6Ktz3hoJLPjbpquRNk8VjkOPJftcoIsk0s/cnQjsH8YEssckMFryJW6NcrFiQ3E+LsC7tRCT7dZgs4jd/4Qaltc89L+DQIpHd1CvMwEBBdP7t/fI1FLYEA3Si4DkZg0SHHTPrwKFxeHHCJxn9badWLMzbHbzE3CFTlBwke+GT6Tf0dpEowSOCy+QRxX1H3Mry4xxa/KDfEV96F84uv0ZbjbTv+B2pETFkyXvrVp6x3RHpNB9MtRUv2cQ7Ni9wauQCOZ/r0i8XLP3Qni3cAulR7sGdpMC5/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/feKGZXdhOVtE4qQrwazWqdkDccWxaBpxsqm3KADok=;
 b=IjrRpj+e1l/RgHaw8bRjqE2FTHnw5RX8mkJmSV2MBkZIMSfqNbyQ9ObXsdZViYvHkVas4fw8anCPm/MwTKLH++Y3AmpfqvMJgw2lPPoYtN0b5bE531EScEJbqB8XlebYoS2T7AAhm0yIkrn3SYXxvDODIHkb+BBwjvxSbkGinajyzhO8XnFepWhwKAZ6Q7tL++Kg/N8pd218Uzyhe5pgXpa1s5vK2i8stxqQgwaFoWKcBsF5L1bi0ZrTYz/kCYxs66vBPKdkiHT5BcJrReSW8iHqNt+Wzl2wfgBD1REeSJ2JSXvltc4rQpmuYf72rOgq5HePim1PPfdRTZHyx0ZzUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/feKGZXdhOVtE4qQrwazWqdkDccWxaBpxsqm3KADok=;
 b=c/GKDi7yV45eEuCpqCXx5H4PEmeLpHnVkVahbZisBsAYL5Emevy4O+xuRS7l3eioz69UQnUeR4Db+qmuyKvdcpeXhmCwLEF5a+T+oGZ0eyjxpMB3EhFwDqxjsbg5+dDMm1TxIV4VejNc+kOW+TH4UI7ff4gWtYWHGBW79iNHMx8=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by SA5PPF6407DD448.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8ce) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 21:12:32 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%6]) with mapi id 15.20.8632.025; Mon, 14 Apr 2025
 21:12:32 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Brendan Jackman <jackmanb@google.com>, Derek
 Manwaring <derekmn@amazon.com>
Subject: RE: [PATCH v4 16/36] x86/bugs: Restructure srso mitigation
Thread-Topic: [PATCH v4 16/36] x86/bugs: Restructure srso mitigation
Thread-Index: AQHbqj9oI3fyUMFIbEq/KXZoSI5XmrOjrypQ
Date: Mon, 14 Apr 2025 21:12:31 +0000
Message-ID:
 <LV3PR12MB9265D4474B492C8409776AD994B32@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250310164023.779191-1-david.kaplan@amd.com>
 <20250310164023.779191-17-david.kaplan@amd.com>
 <korid5xgajulsxxbxwyyqkhqihulxqbdbucjzcom6ej7tw52xy@doi7d5tejiuj>
In-Reply-To: <korid5xgajulsxxbxwyyqkhqihulxqbdbucjzcom6ej7tw52xy@doi7d5tejiuj>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=f1d0f9a0-6d41-4e72-a671-7343cfb1dfd8;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-14T21:11:46Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|SA5PPF6407DD448:EE_
x-ms-office365-filtering-correlation-id: 0e9973bc-d5cd-493f-61fd-08dd7b991219
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SHVSWk52REMrSE9XMVI5T2lnNWljWStEWDlJYUtyaDZyRVk0UHVTSUZHZGhS?=
 =?utf-8?B?OEFyRmdvTDRGL0ZqdGk5MDNYWEQ0bEh0Y3FxaTROTFJsQ3VuaDhiUXM5dktm?=
 =?utf-8?B?TEVHTldYOEkzQUQzY2tBN1RkSnRZa2hKUDZiZFdTeHhHQ09oYXdJQjZHSzVi?=
 =?utf-8?B?UVYvaDZyckpaSTVtTXo3M2JPbXNFc3hsUGszNEk5d0hPc0x4UXdqNm5UOG5r?=
 =?utf-8?B?Wk50Vi9Fc24wRFBSb0hpM1ZqZDRjdE9zVkNsZzJYRCtVS3djUHlTWk1SK2FR?=
 =?utf-8?B?QkpmY2kxek8wcVZNWmhJQ3Q0R3djbUtHMXFTeWRuSStXM21obTVVKzlCM3Bv?=
 =?utf-8?B?U1pyekZIRnF5dStURmZuYWlPeUsvQmVBWVRiUThUcTVyRklsaDhUU1JtaFpl?=
 =?utf-8?B?K1FMVURoYWlCVW5WOXVmNWVwZ0o5RkQrL3c0dXhEc2ZyOS9NWmtiak1NdFZR?=
 =?utf-8?B?RWI1c3NCUzhJTHlBVWIyQThxTDVOdTBvdkd6Rko1b2k0dWNUdS95cDRDcGFo?=
 =?utf-8?B?M3NTd3BENUJlSlVrMEU5SVM5bHlWWWxGRFE2eDhKR215OWVydmhVRmV1cWlt?=
 =?utf-8?B?aWJtZXArTEw3NU5EdFZockdDd3VPSE5qbzFkTStWWnhSUUEweGlQNGl0Rmp5?=
 =?utf-8?B?eER4MVNiQ0Q4bng5WmVyMmxYdzUrMmhqRjJOTndEWDZ5cGpGMUY4RVJHdGhV?=
 =?utf-8?B?ejVhenJFVk9nVWNqRndqb2Mra1ViL3ZaUkwray9TZzc3bEhnaTQ2c28zUFRL?=
 =?utf-8?B?ZjcwTEpsVDl5L1hLR2RySVFKdWZ3YjZXR3c2QS9Ma29QUU94RWNadGg3dlVj?=
 =?utf-8?B?bC82YldnZERIbEdKOHRad0FmRnlMWDV1aG0rUGxxUGU1ajVjT1VIMDd6clNT?=
 =?utf-8?B?R1VHRXNSbTVkUWRWaUFGVndGS1pTMDB4R3JHS1FOSGVteXVFM2R2NkxpNHJN?=
 =?utf-8?B?WWU1NlFpelNrRzZpcmhtWGMrOWl0L2xYRUxWYzU0YlY2Znc2V3BnLzE5cDc3?=
 =?utf-8?B?WjdjNXIvb1hoME5HODdnWlNqb1NCamt3Tms5VFloZVFRZ3VXKzlJOUEyWWxX?=
 =?utf-8?B?WDN5bDM5OWRuY1Y3L3p2aVUveTZTbllPZXRnVS9LajBlNUNJU0RZTVFBNUJm?=
 =?utf-8?B?ajZpM3pFSGZxQXlGSTB5UE9TODQ2SGM4UG4xa0RyOC9YMUFwMVd0aC9yYVUy?=
 =?utf-8?B?em1wS3ZNeTNHVW5Hc04vZklWRkg3T1BmTTBuQTFPY04zYTVXeE5PaGI4UEFJ?=
 =?utf-8?B?NVprN3RLY21PZ3F2cUJEQzZodWh6TEFpTkIrQzV1cDZlWHdCYktnUzBGK0NM?=
 =?utf-8?B?aFlsRjNabXdEYm9MMjVYWHEvaFNzMWJvQVYzNU5tSndNZDJ2NVBDMWd1SmNn?=
 =?utf-8?B?R0Nobm9xZTVNZGZhMWY4WmxDajBmN1lWRlhwamR5alVVYnpEQWhvMTVoclZ5?=
 =?utf-8?B?eEl2RkkrNUxVeVB6SVk1MWx2KzFpeGk1T1ZyTi9GRndjUWJJV3NYa09ZSG9V?=
 =?utf-8?B?VzhYNmZicFdoUHpEU1pCTk9ER244bHdRZU8xSkNlRW1BczNsanA1RHZSYWkr?=
 =?utf-8?B?TW9qaGRFZlNtMEY1U0tjVDNzSEFqYlVkdlNOaGFtV09HdGZYZENiUDV6SmhZ?=
 =?utf-8?B?NWcrTkdCeVFOQkdMT1lGY0dVKys5a3NSY0dQclhWR3plUVpsT0lvSmZadU5Y?=
 =?utf-8?B?eDd0aGZUZ083US9raGREQlFDK09wbEdERVNQUTZBYW4xQ0krM3E1TGk3Vi8v?=
 =?utf-8?B?Q1RaanNZS0J0UEtObVhQMGdSTFVyS0VJanBYTjZkNnNncUh1VEExNWNwaXp6?=
 =?utf-8?B?VXlPK0xmODY4RThSQmQwM3NLT1FVRi8yenMzckRnYXNYMHl1Sm41dHBnS1Nm?=
 =?utf-8?B?cDhoSktYcTJpYmpzY0pkcjk5L0VibHplRFRON0FKV1VBM3YyZiswU0hQUERj?=
 =?utf-8?B?RldINitnY2hSUnVMWUhucVZ5ZUJGMm9NRlVUQlBoMUFOWnJDMEZ5elJWZ2F6?=
 =?utf-8?B?TE15dWV3RVRRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MFdDUFIvWE1IcXExRGpCdFlJS1BXYkx4d1g4UDh4NjhhaENzNlluUk56SDdn?=
 =?utf-8?B?WUc3L3MzMTBZbzhWQkZ2c25NOFdaMXBSaHBTTXFhYWZPa1VldDlDcFVsT3Jr?=
 =?utf-8?B?OGd2REE2RmF5Zy9ZM05MNFhJRk41cXVKRlVhaDB0OTBoM2YxSWJYL1FVRDVO?=
 =?utf-8?B?M2ZDZUdwdDZkdmNFUXlmMVMyVzczakhXVnppQkt3TU4zNkdjVEFhV1lXTFU5?=
 =?utf-8?B?bHlsby81SkthTngwTFdyS0NHWk5sY1BpTzNsWmJBWU1oV1F5M2FwRnFkdGRJ?=
 =?utf-8?B?ajdsSU5KSEsveityQXphSTRJUWFES2Q3bFEwQXRPYkxyUnNsVDhEL3l5dmN2?=
 =?utf-8?B?ZmlTY2ZBU3JBT0dOenFaSmQzL1krWW52ZXdNQW80U3dQN1RDakxvVzliOGRP?=
 =?utf-8?B?RTNMVkJYcTdod0xlUUdhREliWldSbStwZy9UTjZGOFk5ODJYbjY4V0lKWUsv?=
 =?utf-8?B?M2QvRVdFVVB1ZDFFSjBWY2k4YzJmTVBQbXJoQXVzNWJFQ3M5WC8vVkI4Q3M5?=
 =?utf-8?B?eWRQZ1dod2diTXU5VnFKaFNwZCtBdkt6bHg1bTdIRTVRYWNyQnhmL3l2T1lB?=
 =?utf-8?B?Uk82NnR3anhRZ3JSUzdJM2EvQTM0L3VyVlBMZ1FRNkdJaUkwRXVyTzBFTkkr?=
 =?utf-8?B?WDRiaWl2NmhkMU5zYnpubmlVNHJMVVMrTWJ2cjVTSjJzQ0puNXk4Mkl2RjJh?=
 =?utf-8?B?YXFnT05OenlmMHB2SXZYRFoyUkNoQityQ01qRFlRT2N5bjlka28wZ0NVUTFa?=
 =?utf-8?B?YThFczF6UjY2QXl3NHRtQjFTSGQ1UDR5VVFKZ1E3cFB6S05CZ1FzTGJObzhD?=
 =?utf-8?B?Wk1nUEh0L2xMNHVtMytpL0tpdjREcFZwWlo4bVJhTWdXeUdxNVppRXg0VnZz?=
 =?utf-8?B?ZDN4Slk4YlRPb2NxeDcxQnlIcmNHWkxLcVFDZ3ZvSE4yNHlaRWpxbGlxM2Vh?=
 =?utf-8?B?TjQybzJCWml2M1NrbkFoZEYvK1J1dVBLN0I3cy9FL3U0WnpFYVRkSHFHRHRG?=
 =?utf-8?B?bnFSek44aFFHKzdqVHJPY3p0MDl6SWx4QnRBTGxVM202cXZJd05Id3VKbW9w?=
 =?utf-8?B?SFNCdGM0dFhwbjZiUTgvY0VibFlQZ0x4TVNFV0tWUTJRbndHMklQZkFlcTVR?=
 =?utf-8?B?d3lhK21ueWNLUHI5cFhsek9MdlRJaC9sVzRDNHdLVkppMVl6SGNxdVdzZDkz?=
 =?utf-8?B?d0J4R2cyR05SWlpQSjQ1OHdDa2ZieDFqRFNHL1NOajdyVnhMeXNCRjcxaUgv?=
 =?utf-8?B?TmpJTmN3NWhZVi9OZFBBY0JYOFBWS21ubXF5c21KUGx0RkE2Z1UwN1pFckZv?=
 =?utf-8?B?OGd6Mk9BYUlYZUtYQnRESTczajdaclVQL1hibE9ZYjc3WGV6Yno1cGh4MkQ5?=
 =?utf-8?B?NUx4eU9IMFU5Y3VubWVJcW16a2tENzhudHNrbmxwTEtZSzRyazFGampJcHVi?=
 =?utf-8?B?MmV6d3c3NjY4d1lrbndyM3NkYlp6NkowZjdrTlpUaFlraG5nNm5xbjlzL2gw?=
 =?utf-8?B?bmZlYUovbUxLb2NEU0tvSGxsM3NtNnFVYm40OTgrV2ZQTXBteDZpelMzL1RO?=
 =?utf-8?B?NE5LWXJQSmY3TGd5aW9RUlY2ZGJjRXlDVGg5YVFGcWJDQnJMVG1qejcxVTZO?=
 =?utf-8?B?dFlNb2tZajhyL3ZoNUk2MjR6cDFzdWhLL251aDFTNjhYdzhZVzQ3WitYdmpw?=
 =?utf-8?B?aUg2QUR0REtwbXFQdkpZaFEvZXJuT2Fqa3pVYnlBNW11QU5XQ1ZuSjlMRXli?=
 =?utf-8?B?cktYM1JxY0ZwM0pWNzJmNnJhekwrMmp0cGxWRHY2TEJTUGNXWEk1WExaRExJ?=
 =?utf-8?B?QzA3bXpoY2JsOHhGWlhQZmEwcnhWZldkVDFzRmtDanFPeUI4NHVPbVFZdWd4?=
 =?utf-8?B?Mk82b3Fjdm1JWTRTRU0wK0hjcjhkbmdvYzVJQlVyaDlxMDZEUWxpbmRrSHNT?=
 =?utf-8?B?QUtxUWJ0ckNiRVAwYUcweTJsREJ1ZHY1eXJKOWl5WTVuWUJaUnVWQWFTR25P?=
 =?utf-8?B?YWZyWElaT3lVUktoV0E5b0JNV1hkNEFHUDUvbHZPL0VQQ1pYTXNZeFprVjE1?=
 =?utf-8?B?SmM0ZTUxYmVQOUllSGhHQ2o3NWpRM3hBTTFLU2RsSFMwNnF5ZVU3bzgxWVYx?=
 =?utf-8?Q?8tnQ=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9265.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9973bc-d5cd-493f-61fd-08dd7b991219
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 21:12:31.9960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DkugHxuM+81OvmAauWmOS9y0RRDvFdctqgtQyOLEMWpLhHQD1e5XdxZ1WQit0CjA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF6407DD448

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb3NoIFBvaW1ib2V1ZiA8
anBvaW1ib2VAa2VybmVsLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIEFwcmlsIDEwLCAyMDI1IDEy
OjM5IFBNDQo+IFRvOiBLYXBsYW4sIERhdmlkIDxEYXZpZC5LYXBsYW5AYW1kLmNvbT4NCj4gQ2M6
IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPjsgQm9yaXNsYXYgUGV0a292IDxi
cEBhbGllbjguZGU+Ow0KPiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+OyBQ
YXdhbiBHdXB0YQ0KPiA8cGF3YW4ua3VtYXIuZ3VwdGFAbGludXguaW50ZWwuY29tPjsgSW5nbyBN
b2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+OyBEYXZlDQo+IEhhbnNlbiA8ZGF2ZS5oYW5zZW5AbGlu
dXguaW50ZWwuY29tPjsgeDg2QGtlcm5lbC5vcmc7IEggLiBQZXRlciBBbnZpbg0KPiA8aHBhQHp5
dG9yLmNvbT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEJyZW5kYW4gSmFja21hbg0K
PiA8amFja21hbmJAZ29vZ2xlLmNvbT47IERlcmVrIE1hbndhcmluZyA8ZGVyZWttbkBhbWF6b24u
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDE2LzM2XSB4ODYvYnVnczogUmVzdHJ1Y3R1
cmUgc3JzbyBtaXRpZ2F0aW9uDQo+DQo+IENhdXRpb246IFRoaXMgbWVzc2FnZSBvcmlnaW5hdGVk
IGZyb20gYW4gRXh0ZXJuYWwgU291cmNlLiBVc2UgcHJvcGVyIGNhdXRpb24NCj4gd2hlbiBvcGVu
aW5nIGF0dGFjaG1lbnRzLCBjbGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZy4NCj4NCj4NCj4g
T24gTW9uLCBNYXIgMTAsIDIwMjUgYXQgMTE6NDA6MDNBTSAtMDUwMCwgRGF2aWQgS2FwbGFuIHdy
b3RlOg0KPiA+IEBAIC0yMjksNiArMjI2LDggQEAgdm9pZCBfX2luaXQgY3B1X3NlbGVjdF9taXRp
Z2F0aW9ucyh2b2lkKQ0KPiA+ICAgICAgIHRhYV91cGRhdGVfbWl0aWdhdGlvbigpOw0KPiA+ICAg
ICAgIG1taW9fdXBkYXRlX21pdGlnYXRpb24oKTsNCj4gPiAgICAgICByZmRzX3VwZGF0ZV9taXRp
Z2F0aW9uKCk7DQo+ID4gKyAgICAgLyogc3Jzb191cGRhdGVfbWl0aWdhdGlvbigpIHJlbGllcyBv
biByZXRibGVlZF9taXRpZ2F0aW9uLiAqLw0KPiA+ICsgICAgIHNyc29fdXBkYXRlX21pdGlnYXRp
b24oKTsNCj4NCj4gInJlbGllcyBvbiIgLT4gImRlcGVuZHMgb24iIGZvciBjb25zaXN0ZW5jeSB3
aXRoIHRoZSBvdGhlciBjb21tZW50cy4NCj4gQWxzbyBpdCdzICJyZXRibGVlZF91cGRhdGVfbWl0
aWdhdGlvbiIuICBBbHNvIG5lZWRzIHBhcmVudGhlc2VzOg0KDQpBY2suICBJIHdhcyByZWZlcnJp
bmcgdG8gdGhlIHZhcmlhYmxlIGhlcmUsIGJ1dCBJIGNhbiByZWZlciB0byB0aGUgZnVuY3Rpb24g
d2hpY2ggcHJvYmFibHkgbWFrZXMgbW9yZSBzZW5zZSBnaXZlbiB0aGF0IGlzIHdoYXQgaXMgY2Fs
bGVkIGhlcmUuDQoNCj4NCj4gICAgICAgICAvKiBzcnNvX3VwZGF0ZV9taXRpZ2F0aW9uKCkgZGVw
ZW5kcyBvbiByZXRibGVlZF91cGRhdGVfbWl0aWdhdGlvbigpICovDQo+DQo+ID4gKyAgICAgc3dp
dGNoIChzcnNvX21pdGlnYXRpb24pIHsNCj4gPiArICAgICBjYXNlIFNSU09fTUlUSUdBVElPTl9T
QUZFX1JFVDoNCj4gPiArICAgICAgICAgICAgIGlmICghSVNfRU5BQkxFRChDT05GSUdfTUlUSUdB
VElPTl9TUlNPKSkNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgcHJfZXJyKCJXQVJOSU5HOiBr
ZXJuZWwgbm90IGNvbXBpbGVkIHdpdGgNCj4gTUlUSUdBVElPTl9TUlNPLlxuIik7DQo+DQo+IHNy
c29fbWl0aWdhdGlvbiBzaG91bGQgYmUgcmVzZXQgdG8gTk9ORSBoZXJlPw0KPg0KPiA+IC0gICAg
ICAgICAgICAgfSBlbHNlIHsNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgcHJfZXJyKCJXQVJO
SU5HOiBrZXJuZWwgbm90IGNvbXBpbGVkIHdpdGgNCj4gTUlUSUdBVElPTl9JQlBCX0VOVFJZLlxu
Iik7DQo+DQo+IFNhbWUgaGVyZS4NCj4NCg0KQWNrIHRvIGJvdGguDQoNClRoYW5rcyAtLURhdmlk
IEthcGxhbg0K
