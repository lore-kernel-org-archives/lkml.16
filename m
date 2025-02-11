Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BA625EFAA
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 16:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739293094; cv=fail; b=bilsf+kOu8bDLmakCPxfvKuTwoVR8Xcw5sS79IZUnkBG+WTEylU2qdYPesC229AQemu0noto+ZEooYkdnhqGLzyMTJJWVoK/VYKzU3ddVrNqVOMFKAr+Df31NSIFLMe2eGWvSB51NtibZfl9Xz73oiVBHKZUuKN6o60dswAXGGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739293094; c=relaxed/simple;
	bh=PIhoGTpfaiWzPHdSRrxkJ+Uf8pqJXH8gdHNDeGpxjCs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NwkD1HQAx4IwJ/eu366k5aSNGd9mdb6EoVJgi6KiM4Vg/N9j2As4FfhcWLdQ/N/weuxECkwuD/ogLABjmNwSIWBvn2szr9/NfxOFxyCfOkQTHX4dj6Kx1yVXfLm3vKnrY2A7gPnzkzlBJFy0CI7RMA4Nj8x8/nEZ2ZPzm61+DHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mFzoYFLL; arc=fail smtp.client-ip=40.107.92.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mFzoYFLL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OhOdONuXc2pjcmmL+N003FlQAT6hAK2fki6fpB5O9cq2lDzoMx7o5NHBMBLQCgEQIyK0RGF4nSVsM1iMzgm9J26/EmtCyhPJHzL5pcMJgtCaNiS3APu7LMNQjy6c3Yf62uh9S2KBk8lO9PwalCGgKC7BrUyahFb9mw1Oq366uCNfi+NpUblN3NsFiFhkHbSxJ+z5rg85Ulg+7xf3gYqitFu7t683OsMwj4JbnVYthjYDhRAEizqbIioxE+eiGLrI0PUAXvJU9hngqenr1WpxcDUXM7agDQUyJ5S/XmmcGcBrjnlQecDNnhog3STWOco7EwmoVP/2N055WGU8igeI2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIhoGTpfaiWzPHdSRrxkJ+Uf8pqJXH8gdHNDeGpxjCs=;
 b=DO/QVvf2QkpJYGWBtowdYwK2g4jVdCSXJ24cu5F1E2pvAhOpdiIlempRGv7lhbrBHYmE5aPQN5fLHRQOLCqqbFLXEJWlCuKq1r+jjklL0g2Fch1wgeJJQZF/12oyLtxe5BZOTrYYMJ+oDDDf+FTKud2U/rpzYOX8ZznuB6hF8ggS3BSq+tVth1xCamyA6O8gVD80amhExguPU48QvfqK8Zjl0vWFA2IYO64xVEshiMpkLkXZAblO/I45feoMMJZ48CZ43cBOfLGTqr2/jpfIcZdsFqB1B6pyhqRnvYYliP86bKPibc94NgqpXxKxDREdevATGhiijBnIoirIPkAG0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIhoGTpfaiWzPHdSRrxkJ+Uf8pqJXH8gdHNDeGpxjCs=;
 b=mFzoYFLLRf56VH2nP1Ch0kYupMmir6jYuXRJ0GZVYsz435XP/5+oqhOE/p7lZOacb3MPNk47BwEhesXAkoy9VyduEMeXtbedPhWF3M+tJ3h3KN6QRSHayJsfIvTlRB8/5Xa+7VSmEAA6Jjp3NmrsfuxXfL4GvOWYoPl2z3YzwWw=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by LV3PR12MB9404.namprd12.prod.outlook.com (2603:10b6:408:219::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 16:58:00 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%4]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 16:57:59 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 19/35] Documentation/x86: Document the new attack
 vector controls
Thread-Topic: [PATCH v3 19/35] Documentation/x86: Document the new attack
 vector controls
Thread-Index: AQHbfKQqBd10Hlypfkmv44ME0/0yk7NCUBUg
Date: Tue, 11 Feb 2025 16:57:59 +0000
Message-ID:
 <LV3PR12MB92658C4F87BA9C4408457E2B94FD2@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-20-david.kaplan@amd.com>
 <20250211164355.abxlbqhm3gym2e7b@jpoimboe>
In-Reply-To: <20250211164355.abxlbqhm3gym2e7b@jpoimboe>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=0566169b-db96-4219-b6a7-8303f005c4f3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-02-11T16:47:49Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|LV3PR12MB9404:EE_
x-ms-office365-filtering-correlation-id: 7c0a7dae-9986-4c7f-9338-08dd4abd3d7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?alBBT0tyOEtlRjYxeWk4NC9iTnlHMlVGWVI2MlRoY2ZzMG5rNUN1cUpqejhF?=
 =?utf-8?B?TzJNR01mSElWZms2Mm9HcEk2SStSKzAyOXZzL1AybXVBUjMxMVV5RkFvdGE1?=
 =?utf-8?B?b1VqTEtramVCL1gyOTRTWTZtMHRjcWlwbmpreFVYYjkzT2lINCs3bGlMZC9z?=
 =?utf-8?B?YVlhcFVTcDJZTHRPREFvdmpIZ0dDRThMVUFZM0RyamZJRUJLYi9PY0toa1Ax?=
 =?utf-8?B?WlhaYndCd3VJWW5NRTVreEZzR1huWmlhWXhOSnFFVm93bXB0YitqWGN1TExW?=
 =?utf-8?B?Q3dzd2g0R0V2d2lWS0NIK0pCVGNTR2R1SzFKeSt6ZDFEbDh3eFFncXBSYk95?=
 =?utf-8?B?akRHQnhnTHJFSGUzVWVYSDFXVEljTzFkQ0pXU3duU01HbVdyR0lBZndQNENF?=
 =?utf-8?B?S0NYeXhyMHdxS2NDb0RRSGw0eXlZbFYzUko3QjhlTjdjTnlDTTJGeTJpQmZH?=
 =?utf-8?B?Vk1kTHlyQnpxYytoemNwTWFOeTdyanZDeDZEY05ienVEQlNjR1VabUd4bndt?=
 =?utf-8?B?V25nQXlWdytBQ1BMeWtGVE5zRHRkK3U4SHNmVnlKWkRSZmRKTXE3OUM4b0Ir?=
 =?utf-8?B?OVVSc1NEWjJrMjNwQWM1UnBodzhrTUhUL1pvL2srSUtoNDZBN3hDb3FiUHU4?=
 =?utf-8?B?L3pBZStVbWZjWDJtSU1nekNOZlVNa08zZTNsc3IzcXZsRndBVzZ6YXBXcGRz?=
 =?utf-8?B?OUF0dmVpN2lwZUhZWHUrWWljYWtjS0lNL2JDNjBqU2FFMEtGeVdVRVFJR1dP?=
 =?utf-8?B?TzU1UXJhdHR1K1BDcVpReGJ6MC80YTc1cmpuWW9QSXB4elUvVXlYSHZYWnFn?=
 =?utf-8?B?R1AzWVE5M0xPeXlVbWFONDZCelBQK2M1aTMvOXNNdkgxVEoxaXZJWktUdzNv?=
 =?utf-8?B?Vk9ROG90dXIvWUZnSnhYbzdOb3d2Yk0rSlRJYnlGYVdrSURES09tWE9GaWxj?=
 =?utf-8?B?aUtJSnlZM3JqUUVsZWg0bjRWc21Lb0xnWGZiSlllOTMvd0o2WXhTNnRuendx?=
 =?utf-8?B?ZTIwb0MrVXM3ZVpkdkZxZFdJbTVsSXp0UWFKYjIwSFdPbzQxNDhpcVRKVXp1?=
 =?utf-8?B?clo3OXdwU3dhVm81R0hGV2hhbjkyS0pOTTB6T2dHWWZqR0F4YVBBbWNjKzF2?=
 =?utf-8?B?UmdIVzY3cGpVUWtBMGdSbHNZSklnaFhJbzJqZDlEUm54am41UUNreVJFMG1H?=
 =?utf-8?B?Nmk2WEk3Nlc1OU1ZWW9MU05rdXRjbXFpVUhSVXRrUFlPOXgwckxhbFEwcVJ2?=
 =?utf-8?B?YWpoUDlrVGFwUXBpeTM5eWloVjY3ZEpGZ2RpSUphcStGbFl0YjVCVkpMUnZF?=
 =?utf-8?B?cktUaXdpbzJRQ0c3aGVwb0VBaktrRElpNGlOMU9pemRDYmljRG91UnpDUE52?=
 =?utf-8?B?aUpXKzNlK2x5VVlENzc1eEhJQUdjdjFiMHNFUmM3M1g1bDBQRUdnV0hPdWRo?=
 =?utf-8?B?R3hCVmRmOGFkeEdDT0pzcEJRTDhncHJaRFZkSktNcEJWTkNUMWNaYTFUNkVz?=
 =?utf-8?B?amR1c0dkZUVURk9Mb243ZzVpRUt5Y3FEVGx3Sk53NUUrcWR0OVowQ2ZJR2U3?=
 =?utf-8?B?Z0ZmUlBaS0Jha3hEM2lMVHJNNUdDRHBJZUh1MlFIZTc3SHJDanQ3WWhHbmpm?=
 =?utf-8?B?UUlFcVo0MUEvekQzNUpxZXFPVm9FNThhWjFZNTFsbHFVVkZrSDBSL25Vd2Y5?=
 =?utf-8?B?YlV3Zll0R1p2ai9OZmI4ZHVhanNZSWVwVXhZWWw3Smo2TDBUWGtjL2lGQTVC?=
 =?utf-8?B?NzVhTDlBaXhsVG56ay83Qm9tdXk5UjR6QkFMbnRMdzdlZXhOSnMzeVVkZ3Nw?=
 =?utf-8?B?UE9Gbkw1SWpyaVBhdytXcjZ5T3R1WUVtWlpWMGZWVGM1alJ0Z1ZITzR1MXQw?=
 =?utf-8?B?K05yL1VsYklTUDZGdnpnVVpQc0pQTXhybEx5QmlQdnBoc0RUSGpwdDFrY1Na?=
 =?utf-8?Q?lKRMWzzpVFIFp3ocPTW5TxLJJAzRG8nK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d1VmbGFNSkhOWHZlbWlCemdtYUVRK3J4VDY1SklreXhOM3FUYW9JMkNuM2Yx?=
 =?utf-8?B?UlVMVVNZaCszN3piV0JHQzRqeUdOODFHSnRpNlEzMTdxeEtxbERTQUU1T2N4?=
 =?utf-8?B?OVppMlhPTytEaGtvY0thVWhodkY4dDlwb2xMS1N1eTlmdUJSRi9peEE2Q3Ju?=
 =?utf-8?B?Q1pISks5WitoV1FEVkd3YUZPam9qb0cwMmVFVHR3djdVT2pHc25YaDhGU0hP?=
 =?utf-8?B?STdWMk1GRzhHRFllbjVPd0JsWm5uL3djZHZhTnZFTFdEb0hhNUhMNEV1SVJ0?=
 =?utf-8?B?a1lhbmxjNENzRVgzb0ZlL0tuL3pKaEsyT1IvSEE3TWxkSjlIVTZQcVJ5a1ZU?=
 =?utf-8?B?QlJQNVdtcDBRUHdINEt6alQxQ242VTJ4QWFvN1RkbkEzWFRrMTJuL1VGYVpp?=
 =?utf-8?B?M1lLbTl2V0dLRktXOXU4Vms1dkdhQVp1ZDMzQVprcHBvd1ZnZms1QUx1R3pB?=
 =?utf-8?B?MFlBL1J3ZlJaayt4VG50Y2hla2VMSWt5cXZRZ3ZuMkYxbnFOWms4RlYvdGJ5?=
 =?utf-8?B?VXk2WW9JU2VkNHlXdndmMHNORlcwWEVSWnIxOWFycldXNnVaaWhpOWk2QXV1?=
 =?utf-8?B?NnZQc3JIbkFwTTYyRmdvNmVTQVVXZFg4bHY0S1BMczhHS2ZjcnpXWDBlUjNJ?=
 =?utf-8?B?b01haWpFNllxdjhLRUFzcGtjNGVuRFliRlNLQlJTSzlXMWU1WHMzb09iQ2xo?=
 =?utf-8?B?ak9qNThKVHRST09lQjVGTXh3Z3JkNkZ0bi9vVlRvTEx2eWxqZzZFdCs2NjYw?=
 =?utf-8?B?WDBCS2Y0K0FPNThOTlhybmQ3RVdPcDkvZXBhVlFDUEk3WnpiT0QyRmZKcXJx?=
 =?utf-8?B?VDVVV2Y2ei96YlY2eTJiN005K1NjSjRRM0pERGs4cHp2NDR1Q0pqSzQ0a3lO?=
 =?utf-8?B?QXdlQlNadnJnTitrcHlVMkx3V3cvWXMzYmtJSDd5azJuZVYxOUFWRHhxSXJi?=
 =?utf-8?B?cEpSL3cwYmJkNGFibmZsNDhVeGt6WkpIaDViZjBWSk1ETTB0NVVMZjJmTHc2?=
 =?utf-8?B?VzNDUkxFMlJxSEtzWGMrUXQva1ZjcDRjNkgwUDcxcTE4VEcwZEl5S1JpNll1?=
 =?utf-8?B?K0w0SWFWV0Iyb0wrRnFGaFVONWtUK1NmcTZnaFZDa3hZRnhpVk1RWFJPaGRu?=
 =?utf-8?B?a1F6TUx1Ylo4QVhTRkRCKzBMSDVBZGFxR2J3UUZDWjE4YUc0S2Y5SXFvc2ZD?=
 =?utf-8?B?c09JUUhOWm9pV0VuelhYR1ovRktxZy82a2ZoSHk1ZXpmbEpnOVJrWml5NzE3?=
 =?utf-8?B?bDBvSnV5dWVJeDNIMkg5Q2Vvd3ZBeVN1L09JM0VCTzZHOS9WTDZLcStNYnFa?=
 =?utf-8?B?OExuVFRnVmp0Rnc1KzRhQ0pXVjFRUzM2TDkxZENFWEJXeXI5bndhYnIxTytV?=
 =?utf-8?B?cTRKMitMaEpROGI2T0V6ajg4Sldyd0VucFo0cjM5Qkh5dXRLLzNCY2N6V3lQ?=
 =?utf-8?B?T0laZFhJbUVXNU9WSHF0TExUdG52eUJnNmx5ZUhhdUhqRGl1S1dRS252VHlG?=
 =?utf-8?B?b3d5V0FBY0ZYKzhsVVJicVhJKzNhemg4b09XbDh5aWRya3doejBWcGNYN2Rx?=
 =?utf-8?B?dS8vTlgvaWdBUE5ZOHRMV0EzNFpFTXFuSlRDQ3NVTDJFSGk0Rlc4a1J4ekYv?=
 =?utf-8?B?bVdMejhtVG4zZ1laMDQ2bWZpeUoydTJSallPeVA4dDRXVlUvajlvL1k3eXE3?=
 =?utf-8?B?cUlOZ1FjZzJJTThqY3ZXSGVXQU9VQW1NR0ZLNEY5QzJ6QitHUExMdjRYbGs2?=
 =?utf-8?B?VXIxOHFBUVM3K1VpUkhwRGZkakF1b2lGRVhKNTFVT3cwaVhQbG9ueTNaWGov?=
 =?utf-8?B?bEE4VGF3cGRMcjZXV3RwK2luSzVmNk9xVEEvZE1JbnhmMGFGWm9qZlluSGlO?=
 =?utf-8?B?M1ZzSkY2QWNweHU0UmMvN3JhM3g5bzk3MXRKVGpOYUtnSUpMakhXdG5VV2NH?=
 =?utf-8?B?alllcDVaZVB1dXN6YzAzVk4yOW5jWkVsY2xtUFNIaFFRNkxhMGd0Q1lyeHpH?=
 =?utf-8?B?SUZLQXJteUVjUjFnUVVXQUFPRm8weUgzYkFGZ2RDTEZDOUpWMUY5bkFSeVpx?=
 =?utf-8?B?bVNnN2pCNS90b1ZvZzZEQmFOMmd6VFFYWEkxcTFQVnNyRVl2eTlIQjlFQThL?=
 =?utf-8?Q?S5CA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c0a7dae-9986-4c7f-9338-08dd4abd3d7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 16:57:59.6784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6D/viytZEZECWfBLwqBh1Ko87uY3L5Xn/NhhriAVrtZkDEW2MnBVeJHBF0W47ITW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9404

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb3NoIFBvaW1ib2V1ZiA8
anBvaW1ib2VAa2VybmVsLm9yZz4NCj4gU2VudDogVHVlc2RheSwgRmVicnVhcnkgMTEsIDIwMjUg
MTA6NDQgQU0NCj4gVG86IEthcGxhbiwgRGF2aWQgPERhdmlkLkthcGxhbkBhbWQuY29tPg0KPiBD
YzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+OyBCb3Jpc2xhdiBQZXRrb3Yg
PGJwQGFsaWVuOC5kZT47IFBldGVyDQo+IFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz47
IFBhd2FuIEd1cHRhDQo+IDxwYXdhbi5rdW1hci5ndXB0YUBsaW51eC5pbnRlbC5jb20+OyBJbmdv
IE1vbG5hciA8bWluZ29AcmVkaGF0LmNvbT47IERhdmUNCj4gSGFuc2VuIDxkYXZlLmhhbnNlbkBs
aW51eC5pbnRlbC5jb20+OyB4ODZAa2VybmVsLm9yZzsgSCAuIFBldGVyIEFudmluDQo+IDxocGFA
enl0b3IuY29tPjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHYzIDE5LzM1XSBEb2N1bWVudGF0aW9uL3g4NjogRG9jdW1lbnQgdGhlIG5ldyBhdHRh
Y2sNCj4gdmVjdG9yIGNvbnRyb2xzDQo+DQo+IENhdXRpb246IFRoaXMgbWVzc2FnZSBvcmlnaW5h
dGVkIGZyb20gYW4gRXh0ZXJuYWwgU291cmNlLiBVc2UgcHJvcGVyIGNhdXRpb24NCj4gd2hlbiBv
cGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZy4NCj4NCj4N
Cj4gT24gV2VkLCBKYW4gMDgsIDIwMjUgYXQgMDI6MjQ6NTlQTSAtMDYwMCwgRGF2aWQgS2FwbGFu
IHdyb3RlOg0KPiA+ICtDcm9zcy1UaHJlYWQNCj4gPiArXl5eXl5eXl5eXl5eDQo+ID4gKw0KPiA+
ICtUaGUgY3Jvc3MtdGhyZWFkIGF0dGFjayB2ZWN0b3IgaW52b2x2ZXMgYSBtYWxpY2lvdXMgdXNl
cnNwYWNlIHByb2dyYW0NCj4gPiArb3IgbWFsaWNpb3VzIFZNIGVpdGhlciBvYnNlcnZpbmcgb3Ig
YXR0ZW1wdGluZyB0byBpbmZsdWVuY2UgdGhlDQo+ID4gK2JlaGF2aW9yIG9mIGNvZGUgcnVubmlu
ZyBvbiB0aGUgU01UIHNpYmxpbmcgdGhyZWFkIGluIG9yZGVyIHRvIGV4ZmlsdHJhdGUgZGF0YS4N
Cj4gPiArDQo+ID4gK01hbnkgY3Jvc3MtdGhyZWFkIGF0dGFja3MgY2FuIG9ubHkgYmUgbWl0aWdh
dGVkIGlmIFNNVCBpcyBkaXNhYmxlZCwNCj4gPiArd2hpY2ggd2lsbCByZXN1bHQgaW4gcmVkdWNl
ZCBDUFUgY29yZSBjb3VudCBhbmQgcmVkdWNlZCBwZXJmb3JtYW5jZS4NCj4gPiArRW5hYmxpbmcg
bWl0aWdhdGlvbnMgZm9yIHRoZSBjcm9zcy10aHJlYWQgYXR0YWNrIHZlY3RvciBtYXkgcmVzdWx0
IGluDQo+ID4gK1NNVCBiZWluZyBkaXNhYmxlZCwgZGVwZW5kaW5nIG9uIHRoZSBDUFUgdnVsbmVy
YWJpbGl0aWVzIGRldGVjdGVkLg0KPiA+ICsNCj4gPiArKm1pdGlnYXRlX2Nyb3NzX3RocmVhZCBk
ZWZhdWx0cyB0byAnb2ZmJyoNCj4NCj4gSG93IGRvZXMgU1RJQlAgZml0IGludG8gdGhpcz8gIEl0
J3MgYSBjcm9zcy10aHJlYWQgbWl0aWdhdGlvbiwgYnV0IGl0J3MgbXVjaCBjaGVhcGVyDQo+IHRo
YW4sIHNheSwgZGlzYWJsaW5nIFNNVC4NCj4NCj4gVGhlIGRlZmF1bHQgaXMgZ2VuZXJhbGx5IHRv
IGVuYWJsZSBTVElCUCB3aGVyZSBhcHBsaWNhYmxlLCBidXQgKm5vdCogdG8gZGlzYWJsZSBTTVQu
DQo+DQoNClRoZSBjdXJyZW50IHBhdGNoIHNlcmllcyB0cmVhdHMgU1RJQlAgYW5kIElCUEIgc2lt
aWxhciBhbmQgd2lsbCBlbmFibGUgdGhlbSBpZiB0aGUgdXNlci0+dXNlciBvciBndWVzdC0+Z3Vl
c3QgYXR0YWNrIHZlY3RvcnMgYXJlIHNlbGVjdGVkLg0KDQpUZWNobmljYWxseSBTVElCUCBpcyBh
IGNyb3NzLXRocmVhZCBwcm90ZWN0aW9uIHRob3VnaCBhbmQgb25seSBuZWVkcyB0byBiZSBlbmFi
bGVkIGlmIGNyb3NzLXRocmVhZCBwcm90ZWN0aW9uIGlzIGRlc2lyZWQuICBUaGUgY2hhbGxlbmdl
IGhlcmUgaXMgdGhhdCBtaXRpZ2F0ZV9jcm9zc190aHJlYWQgZGVmYXVsdHMgdG8gJ29mZicsIHdo
aWxlIFNUSUJQIGhhcyBoaXN0b3JpY2FsbHkgZGVmYXVsdGVkIHRvICdvbicuICBUaGlzIGlzIGFy
Z3VhYmx5IGFuIGluY29uc2lzdGVuY3kgaW4gdGhlIGN1cnJlbnQgY29kZSwgYWx0aG91Z2ggaXQg
cHJlc3VtYWJseSBjb21lcyBmcm9tIHRoZSBmYWN0IHRoYXQgZW5hYmxpbmcgU1RJQlAgaXMgcmVs
YXRpdmVseSBjaGVhcCB3aGlsZSBkaXNhYmxpbmcgU01UIGlzIG5vdC4gIEJ1dCBmcm9tIGEgc2Vj
dXJpdHkgc3RhbmRwb2ludCwgb25seSBtaXRpZ2F0aW5nIHNvbWUgYXR0YWNrcyBkb2VzIG5vdCBh
Y3R1YWxseSBtaXRpZ2F0ZSB0aGUgYXR0YWNrIHZlY3Rvci4NCg0KT3BlbiB0byBmZWVkYmFjayBv
biBob3cgdG8gaGFuZGxlIHRoaXMuICBJIGNhbiBsZWF2ZSBpdCBhcyBpcywgYW5kIHBlcmhhcHMg
anVzdCBkb2N1bWVudCB0aGF0IFNUSUJQIGdldHMgZW5hYmxlZCB1bmRlciB0aGUgYXR0YWNrIHZl
Y3RvcnMgbWVudGlvbmVkIGFib3ZlLiAgSSBkbyBub3Qgd2FudCB0byBjaGFuZ2UgYW55IG9mIHRo
ZSBtaXRpZ2F0aW9uIGRlZmF1bHRzIHRob3VnaC4NCg0KVGhhbmtzIC0tRGF2aWQgS2FwbGFuDQoN
Cg0K
