Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2064.outbound.protection.outlook.com [40.107.101.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9B81D63EF
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873721; cv=fail; b=cgy7Hfxj/w778XYq4h2nUyrtTkeqOAedzay8Roqvg7h5qzeYh/c46U5MDovzFXVGdEGcU2ikEu9th4KuPJe3gRM5xsAzBQTBHV5XpXFeSi6b0ba1bW4g56nCe0zRsjvnQsH7dNbs5x0HNnazmdesnrV3684HVl/SKDqBcbd3Myg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873721; c=relaxed/simple;
	bh=YvqX2t7Zpk6/VtionIYBZpefZ9qZkm978V8hRyQIf5g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oTC6STce5osrqoY7Pz50Jx0Yezu6+zuiJh1YVxEAup7b7vMmdDQg8D3QW39eJ4XGc9jnlBwdS4s0jMwP8I4jxeoJkxwq6mq9Hz6QDLfG+BeMxujgiJo4Q7eiqkqGg83vXMxOhe79vz2VBTxQyGWaQUk25FPbe1YIOr04aMv7HK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bDU/kazb; arc=fail smtp.client-ip=40.107.101.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bDU/kazb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQO/1EWQYv3OFghrbWFEBYzi97AH2/H8CnuWbgScNBt/40zpWt6cUdYvuCAAecgXENq55D7E8tY7ELjnuLKL56MU5cbTuxes9ECYZaA6qHNTrB93kKyN3ZnGIi7dlwKZciLjhD3So5yqh+x6kGk1Os7xw7UP12qurjtOViRWpzcm/uAIYHT9XDXkQGcU3sOwxGsAUpOpUSJX1qUCJA5hrqG4o3VQeiAJCBnWYD/5LWkC3HK7SQ6B+b5NtqJpMtrT6Utnz7gAbeiJq8GFPg+M2WRqdYXC2J1LBHC3GXNU8N0ymJwL8faDtiyF+3w8l94uadxI7zXORgEkOifz19KkRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvqX2t7Zpk6/VtionIYBZpefZ9qZkm978V8hRyQIf5g=;
 b=iSrg7YlhildrD0Zga0ms60TmlthQ7nrIhmZ48iEXpL3ICq35U6SNqBm/phErnxUJhgLdSGMvwzSbucBrzIUM8szT9mFdLzGwN/OCvAxw2Gc1DYh9K6A2Y0u81t/JgnIVLKTFPzMJiiNgI8CxicYtJL7GVe0ypVu6vC5FP5TC62KtQmBeg0wiZeICfsvSH6quPDIBdivQtF7FFoz9pn02n0W52pb/avPrMK5oN2b4qX3DJIs9bSOahIqQWClz4rgauvU2HOrS/0eq3YjT20gG8SkDNlaK+1XEeHgkdTURQNYsIHiakpyOwNz7WZvwS/H4af7UOqheFiLw0W0bDlzgyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvqX2t7Zpk6/VtionIYBZpefZ9qZkm978V8hRyQIf5g=;
 b=bDU/kazbSaFWvsBEbwPUoXIN6ReODm7uuG87Sh95X+ZHcmRE2DGEpfw0YKgJDMw8mg3WtBuNzlGcIbkxdzRSwXVT5uzt74NjNf+H2u6Z/tCNPonQ2SXSoQNlqiJawwTJyd2P2CwF/w+ciz9g53zHovWebqjHEj+H9z+oESg4byM=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by SJ2PR12MB9163.namprd12.prod.outlook.com (2603:10b6:a03:559::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 20:55:13 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%3]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 20:55:13 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Borislav Petkov <bp@alien8.de>
CC: Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra
	<peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 10/16] x86/bugs: Restructure retbleed mitigation
Thread-Topic: [PATCH v5 10/16] x86/bugs: Restructure retbleed mitigation
Thread-Index: AQHbuG/FZa04IRrYIkSWc2SaWb0strO5jeBg
Date: Mon, 28 Apr 2025 20:55:13 +0000
Message-ID:
 <LV3PR12MB9265CC8CA5922E081A5BDAD394812@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <20250418161721.1855190-11-david.kaplan@amd.com>
 <20250428185939.GBaA_QG-bWQ7WQ3vlY@fat_crate.local>
In-Reply-To: <20250428185939.GBaA_QG-bWQ7WQ3vlY@fat_crate.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=5aa02f11-9abd-4267-aab6-cc579264f5d2;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-28T20:51:54Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|SJ2PR12MB9163:EE_
x-ms-office365-filtering-correlation-id: 2772715d-9286-486e-7eb5-08dd8696f8ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MWM5bGxxVnptakJURVB4ZDFobUR6ZjByMStrenc0N3dMT2R3L2VHeEEvUzRG?=
 =?utf-8?B?dzNZWEVnQS94SHhFKy9ucTUyRjVhQWNyeUswNk5RVmM2VzVEeitIR0V2YUYy?=
 =?utf-8?B?K3lFSEtuUWs3YjhhcTVVTWkrNXBsS24zczl3TnA5UzMxcGY5WlYyZFltSEg5?=
 =?utf-8?B?alA4UGZOdk4xME5CenJSS3BheUZPMmZaUkNUV2E0V3NHWXA4RnJPYjluSzlX?=
 =?utf-8?B?ZHdHeTJBeGhTdWcwWE5VaTF5UnUyN0xoWERreVZuVmh2OElsSVZzK2VPcFhG?=
 =?utf-8?B?NUltYkc5OEZ3TWVNZkVJUU9VY2kvS0dkUUR2NWNKUXJQVVFXQWYzNXNnV0Rm?=
 =?utf-8?B?THNVQlJJUXZmSlZvb2tEZHhESFA5MU9VdTZnMi9XbHdaSTlMR0FMOHdvSUd0?=
 =?utf-8?B?SEs1TDBkekE5VWJzdFhVL3N3eHVQc2tkQysvZnVtSVZxZit5dDFaeEk1NkhF?=
 =?utf-8?B?V0wxTk4venFmY3p0dWFoMU9zSFBOTGJHTSswTnB1eFg4d2hLRHZ5WmxEMmpP?=
 =?utf-8?B?VlJHL293TFdubTA0VW9wUlNDQXdyUjlYb3hsY0VmZkdNbGM1MlpQNGxoeEh6?=
 =?utf-8?B?aUFJK0RRRjNQajQxb0tRTjQ2M2tocEFjREZJZTVFVExhM2Z3MUlpOHV1UnE2?=
 =?utf-8?B?SG9yeUdBQ0pmK01uQXFuVXlCVk1yZWJMS2xGUVpQdUlzMUFZT090NThmNzF4?=
 =?utf-8?B?aWs3Q0Facmw1c1hHcnFoUDBjTFdSOWRtd09aSFpVbjFqMGYvN0tXTEZpVFYr?=
 =?utf-8?B?Si85b2ZGbS9ETzBYUXg1bnBHR0FDK3dyWmttQ2tyVFB2OFZVVk1wbC84UGVw?=
 =?utf-8?B?VXJmK0ZGVmpSajg2UEVZcXJnaWkxTFAvRVhlTVAwVXJDank4VUs3M2hMSDkx?=
 =?utf-8?B?VmpiODRWaEVYNmlnMXdhanc2cmJlMHNyUWhMN0hMUk96UWtRZ1RUb0NHOXdq?=
 =?utf-8?B?N3RMN1JILzB2cGFDUlBLMTBZb2NhNUpuNm9wNW95N2xtc2hYWHBBMTQrb1dn?=
 =?utf-8?B?MnJoMGQranBzM3Vpc3ZSNUEwSE83b3ZXcEZ1K250bTYwQzNTVVJ1Z2JUSVo4?=
 =?utf-8?B?cnNGQlRIZXJTcTFYaC9heUZjYjNubXBMK24wOWcyQmhtMmRMTUlGaEV0YVZN?=
 =?utf-8?B?NXlxaWxrc2E3Zzd5TTFnOWo0akUzcFRKejVxZjU4L2pwMUFkUGV2NmpNZThx?=
 =?utf-8?B?enpRRlFnNnY0OXV1WjRBV0lwVzNhOSt3NW9HTXViSmtLZUlhMko2RkFWczJ2?=
 =?utf-8?B?UW90SENCc3h6Q2cwUU9yMndlRDVvMmNTbmF4QlczallyZ3RhdGwzZUhaeDgw?=
 =?utf-8?B?ak5zVTV1cGdLeE5MYWlRMlRMQXRyOTdMUEIrSGtMN1M5R1hLM2dGWUthTGNw?=
 =?utf-8?B?UDNML0dYWEUvSDY0ekVMQ1JvMGpBTWNWTnVnOUNjZkswMzRyTXdGakNZSGZI?=
 =?utf-8?B?WUFVb05ESHk2RGpueHhvTUpZSFFVRVhEcVNzZU9CeFZ5WWttQTdMOUVBRXZF?=
 =?utf-8?B?MnpBMlE2UnlDYnpVUFVRdDNUaFlLQSt1UHpweXZYMmFZeFVxNnk5djZBNVcv?=
 =?utf-8?B?SWpUMWx4YXN0dW1OenFJeVAzeXVKREhRd2U4NXhCUkt5SGdjQnpraXRqN21D?=
 =?utf-8?B?RDBBZ0M0S2JYVkVzaWdDMDVQWitCN0hHSWlsTkFQd0hrNHBaUWJZMG1na0lk?=
 =?utf-8?B?ZmlKdDQwUzNQSHZMZGJyb1BrSlRzekZqQTJIRityeW1YNndIRVpkQkRGWStF?=
 =?utf-8?B?c0wzYTJFcmtPbmk4dFVEbGlMdUZNK3l4RXk5bDZ2MEpyeVFjTVRERGNlSUt6?=
 =?utf-8?B?MTJMT2NMbEFaTkI4OXJBaTJMN1VEWHJscUJiNHp5b254L0wvaTFwOHZoaEp4?=
 =?utf-8?B?aHpwWk42RmZTUGhMQUhxaVVWY3dDdUd0QkxQL1hvcVd0RmVCeFVkMVk0WjFx?=
 =?utf-8?B?TGtSSE1zN3dzRHZhV0p3c3cvcm5VRmpHUkpxbnNkNlphVlRaeDNsM2RONCtk?=
 =?utf-8?Q?N3S2j9pzEf662Zl3SxWVB74PXnfdto=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eSs5UnhaL2pNekh2c2pyOXpNWUZLOXZQVHlpNkV5RDMxYlJ3V3U0UTVoVlhP?=
 =?utf-8?B?VmxkWHFiaGFzNmwrQk5SeHZHU2plTStGYml4Uitha3VINmpyMUZuWmJVSXV6?=
 =?utf-8?B?TkN5K1hVbGVhYTY5eHc3ZGY2aWwyUEc0RE1nRTA4ME00UVVGdkpOL2dIRnVq?=
 =?utf-8?B?ajBqZnBRalhGYmdZWmQxRHhzS3JkaEtrdml1Wk9lVjMxQ1piQ1FlcTA4Qmd2?=
 =?utf-8?B?Y0FRbkpvT3UxVGJFeFpXMy94dVF1UmVYVGJZRVdHN2poMXRPZ1NwZWxERjRT?=
 =?utf-8?B?YUloOE1KKzV4VzlmN2crQkVVVTJSYSs0WmhhZW01VHZqVGowUnVOYUZVSFo2?=
 =?utf-8?B?UVhUNFZ1SW5oREU1cFhWeUlLZ2pFYUU1SlFJdTBVNUJsdkt3OXpvSmlSVHJU?=
 =?utf-8?B?Z1pXOGZSaDdiM0k3WHZVQ0dTZUpDUGVLR1lPcFlWZjNDbW1pemxsZ3hLZVZP?=
 =?utf-8?B?SDN5SklNRVpZZVhCVWJlNXFhOG5mRHc5TUViWDdCQzRxbUkxaFRzV1FBTlVk?=
 =?utf-8?B?NVVQL3dxTXRBS2xzNUdWblV6N3VlZm81OUZkdVQvSXJESEwrRS9ESGRUMFNv?=
 =?utf-8?B?R0Q4YnlnckUzak5haEUyN1BaeTNxR2gySzBIcjBzYitwUEZQbExmcHg2U3lr?=
 =?utf-8?B?cUZEQkZxQ202dlVHbkpidGU3dDBlOXpIbVZDa210NnhrN2dDbXc4Q3hqUjBw?=
 =?utf-8?B?aUdpdHVZMHNPUEMwUkdhSmRIYmVUaGFtdktiNzhTd0RyNmdIeDFCdkpCazJT?=
 =?utf-8?B?dUNnQnRBOGtKSU9oUW1DUFRSak85T1gxeDhJajE5bFRpaS92MzdrVEJheWpW?=
 =?utf-8?B?OGdZa0NDSnBITlJYdmV6VHQrSnorZmtzcXVYcDhDWUk2TWtGemRiNWg1L2Jy?=
 =?utf-8?B?NlhwT0hxNjdDUk5EaFBOdndIU0kwZDNNd0V3aTRxYUFNTzZhOTJZL2pPVkVW?=
 =?utf-8?B?Y3hhQmxIL284cHRydkxEVUZXSWFZWW5CQU0vM08zM0ZXYXB0am9icisxckFm?=
 =?utf-8?B?Z2FybkJCUko5Yk1hM2E4RW0yRmswZENJRGJRcTgwYTdTWk9NUEszb0E1dEF6?=
 =?utf-8?B?VE9qcnVyR29Jc1JndmdZSjBjYTdMRnd5WjZKSlBPc1VKNVJobVE2UnBzekRa?=
 =?utf-8?B?MS9Kemx2RitEallXY3oxQXYrS3pxRXFQRnhZVy9RcER0dGhCZDFNejkxVkNw?=
 =?utf-8?B?RDZkb0o2YjdMTWFCby9nUmZzSDRySXNDVXArVFlMMXpVNmpOeGo3Q3ZwZFVB?=
 =?utf-8?B?akcwSTFTWS9QQllWQzdxVE5DMisxWklScVRWbDhuS2lEaVk3dEpkV1d1V293?=
 =?utf-8?B?Z1hSOE0rb2ZOK1gyUGxaakFLM21zcFNRM2dwellqb1lTemZBRFYyYy9TRHVh?=
 =?utf-8?B?dmdIVHZLb2dxZGxEa2ZOZy9Sa1pCenVrT0M2SFA1OTFVeFNGZHorRE13VFNm?=
 =?utf-8?B?bkFZenpZQkxwSWhPeWxMekQ2UWRLbU9XbTVoT2hRREZ1Z3FvSFBwNmdmcHND?=
 =?utf-8?B?VFBVUzVVVnhhakM1ZW9MdUZNZnBvb3prU1hvSmdreXB1cXAvWVlxOGl0cUpR?=
 =?utf-8?B?QTJPbEgwNVp2ZjJ5bHpRSDNDTXJrMW5qQVMvSXJEUEkyOHBTeWl1UU5FR05V?=
 =?utf-8?B?bCt2bjJZS1k0L3JkWUFRdjNieUNiRk4vQk85K1dad3BpQnRCNFNvb3ExNTd0?=
 =?utf-8?B?S2VBa2FZaWs2OHk1MEVieDBBZzZUVXN1RWJNRy9wWTRVcVlqS1ZGbVhmcWRK?=
 =?utf-8?B?dmdPS3E2T2VqMVI2WHhXbWRKUnAyRi9UQU9Db3NlbjZBRkJCclJpYUVEMFN6?=
 =?utf-8?B?UmswY0ZSanZqWmdGRFh2YUt6RU9mZm5sdWg0TzRaU3lLRzMwc1ZVZU9sNXRa?=
 =?utf-8?B?YXB5eEFRZzhXMXdySTFlZStSQ3lndlh2blA2U2d3cXdkNlk5TFJYemNkbHIz?=
 =?utf-8?B?Uk5RQlNaZ0htYnpnTE5ITWxrb001VVB6Q0Y2RHpNSjJYZUFRV3p4V1YvK1JH?=
 =?utf-8?B?bW9Dd01WeDJVN0ZHMU9ITnUvMDJwSW0yTTdWZk5HSWcrSW92ZWlTa2ppdmRG?=
 =?utf-8?B?MVVLdE0zV1RLTk54TXJjTS8ydno5VTcrTENZbGFFNDY1bGhjb0d3N3FtNndQ?=
 =?utf-8?Q?ita0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2772715d-9286-486e-7eb5-08dd8696f8ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 20:55:13.5599
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BIS8VT9Dyoz3sSVx7P4UjH9YoxCX/mEm9Pdp/J4pAWSZbTKCfMt8MdSmq7uW9fe7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9163

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCb3Jpc2xhdiBQZXRrb3Yg
PGJwQGFsaWVuOC5kZT4NCj4gU2VudDogTW9uZGF5LCBBcHJpbCAyOCwgMjAyNSAyOjAwIFBNDQo+
IFRvOiBLYXBsYW4sIERhdmlkIDxEYXZpZC5LYXBsYW5AYW1kLmNvbT4NCj4gQ2M6IFRob21hcyBH
bGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPjsgUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZy
YWRlYWQub3JnPjsNCj4gSm9zaCBQb2ltYm9ldWYgPGpwb2ltYm9lQGtlcm5lbC5vcmc+OyBQYXdh
biBHdXB0YQ0KPiA8cGF3YW4ua3VtYXIuZ3VwdGFAbGludXguaW50ZWwuY29tPjsgSW5nbyBNb2xu
YXIgPG1pbmdvQHJlZGhhdC5jb20+OyBEYXZlDQo+IEhhbnNlbiA8ZGF2ZS5oYW5zZW5AbGludXgu
aW50ZWwuY29tPjsgeDg2QGtlcm5lbC5vcmc7IEggLiBQZXRlciBBbnZpbg0KPiA8aHBhQHp5dG9y
LmNvbT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2NSAxMC8xNl0geDg2L2J1Z3M6IFJlc3RydWN0dXJlIHJldGJsZWVkIG1pdGlnYXRpb24NCj4N
Cj4gQ2F1dGlvbjogVGhpcyBtZXNzYWdlIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3Vy
Y2UuIFVzZSBwcm9wZXIgY2F1dGlvbg0KPiB3aGVuIG9wZW5pbmcgYXR0YWNobWVudHMsIGNsaWNr
aW5nIGxpbmtzLCBvciByZXNwb25kaW5nLg0KPg0KPg0KPiBPbiBGcmksIEFwciAxOCwgMjAyNSBh
dCAxMToxNzoxNUFNIC0wNTAwLCBEYXZpZCBLYXBsYW4gd3JvdGU6DQo+ID4gQEAgLTE4NywxMSAr
MTg5LDYgQEAgdm9pZCBfX2luaXQgY3B1X3NlbGVjdF9taXRpZ2F0aW9ucyh2b2lkKQ0KPiA+ICAg
ICAgIC8qIFNlbGVjdCB0aGUgcHJvcGVyIENQVSBtaXRpZ2F0aW9ucyBiZWZvcmUgcGF0Y2hpbmcg
YWx0ZXJuYXRpdmVzOiAqLw0KPiA+ICAgICAgIHNwZWN0cmVfdjFfc2VsZWN0X21pdGlnYXRpb24o
KTsNCj4gPiAgICAgICBzcGVjdHJlX3YyX3NlbGVjdF9taXRpZ2F0aW9uKCk7DQo+ID4gLSAgICAg
LyoNCj4gPiAtICAgICAgKiByZXRibGVlZF9zZWxlY3RfbWl0aWdhdGlvbigpIHJlbGllcyBvbiB0
aGUgc3RhdGUgc2V0IGJ5DQo+ID4gLSAgICAgICogc3BlY3RyZV92Ml9zZWxlY3RfbWl0aWdhdGlv
bigpOyBzcGVjaWZpY2FsbHkgaXQgd2FudHMgdG8ga25vdyBhYm91dA0KPiA+IC0gICAgICAqIHNw
ZWN0cmVfdjI9aWJycy4NCj4gPiAtICAgICAgKi8NCj4gPiAgICAgICByZXRibGVlZF9zZWxlY3Rf
bWl0aWdhdGlvbigpOw0KPiA+ICAgICAgIC8qDQo+ID4gICAgICAgICogc3BlY3RyZV92Ml91c2Vy
X3NlbGVjdF9taXRpZ2F0aW9uKCkgcmVsaWVzIG9uIHRoZSBzdGF0ZSBzZXQNCj4gPiBieSBAQCAt
MjE5LDEyICsyMTYsMTQgQEAgdm9pZCBfX2luaXQgY3B1X3NlbGVjdF9taXRpZ2F0aW9ucyh2b2lk
KQ0KPiA+ICAgICAgICAqIEFmdGVyIG1pdGlnYXRpb25zIGFyZSBzZWxlY3RlZCwgc29tZSBtYXkg
bmVlZCB0byB1cGRhdGUgdGhlaXINCj4gPiAgICAgICAgKiBjaG9pY2VzLg0KPiA+ICAgICAgICAq
Lw0KPiA+ICsgICAgIHJldGJsZWVkX3VwZGF0ZV9taXRpZ2F0aW9uKCk7DQo+DQo+IElzIHRoZXJl
IGFueSBwYXJ0aWN1bGFyIHJlYXNvbiBmb3IgdGhlIHJldGJsZWVkIHVwZGF0ZSBmdW5jdGlvbiB0
byBnbyBmaXJzdC4uLg0KPg0KPiA+ICAgICAgIG1kc191cGRhdGVfbWl0aWdhdGlvbigpOw0KPiA+
ICAgICAgIHRhYV91cGRhdGVfbWl0aWdhdGlvbigpOw0KPiA+ICAgICAgIG1taW9fdXBkYXRlX21p
dGlnYXRpb24oKTsNCj4gPiAgICAgICByZmRzX3VwZGF0ZV9taXRpZ2F0aW9uKCk7DQo+DQo+IC4u
LiBiZWZvcmUgdGhvc2U/DQoNCkl0J3MgcmVhbGx5IGp1c3QgZm9sbG93aW5nIHRoZSBzYW1lIG9y
ZGVyIGFzIHRoZSBvcmRlciB0aGF0IHRoZSBzZWxlY3QgZnVuY3Rpb25zIGFyZSBjYWxsZWQsIHdo
aWNoIGxhcmdlbHkgbWF0Y2hlcyB0aGUgb3JkZXIgaW4gZXhpc3RpbmcgY29kZS4NCg0KPg0KPiBJ
J20gdW5kZXIgdGhlIGFzc3VtcHRpb24gdGhhdCB0aGUgbmV3IHNjaGVtZSB3b3VsZCBnZXQgcmlk
IG9mIHRoaXMgbWFnaWNhbA0KPiBvcmRlcmluZyByZXF1aXJlbWVudCBiZXR3ZWVuIHRoZSBtaXRp
Z2F0aW9ucy4uLg0KDQpXaGlsZSB0aGlzIGlzIG1vc3RseSB0cnVlLCB0aGVyZSdzIHN0aWxsIGEg
ZmV3IGRlcGVuZGVuY2llcyB3aXRoIHRoZSB1cGRhdGUgZnVuY3Rpb25zIHdoaWNoIGFyZSBjbGVh
cmx5IG5vdGVkIHdpdGggY29tbWVudHMuDQoNCj4NCj4gWW91ciBjb21taXQgbWVzc2FnZSBpcyBh
bGx1ZGluZyB0byB0aGF0IGJ1dCB3ZSBuZWVkIHRvIHNwZWNpZnkgdGhpcyBjbGVhcmx5IGZvciBm
dXR1cmUNCj4gY2xlYW51cHMvY2hhbmdlcyBoZXJlLg0KPg0KPiA+ICAgICAgIHNwZWN0cmVfdjFf
YXBwbHlfbWl0aWdhdGlvbigpOw0KPiA+ICsgICAgIHJldGJsZWVkX2FwcGx5X21pdGlnYXRpb24o
KTsNCj4NCj4gVGhpcyB0b28uDQo+DQo+ID4gICAgICAgbWRzX2FwcGx5X21pdGlnYXRpb24oKTsN
Cj4gPiAgICAgICB0YWFfYXBwbHlfbWl0aWdhdGlvbigpOw0KPiA+ICAgICAgIG1taW9fYXBwbHlf
bWl0aWdhdGlvbigpOw0KPg0KPiAuLi4NCj4NCj4gPiAtZG9fY21kX2F1dG86DQo+ID4gLSAgICAg
Y2FzZSBSRVRCTEVFRF9DTURfQVVUTzoNCj4gPiArICAgICBpZiAocmV0YmxlZWRfbWl0aWdhdGlv
biA9PSBSRVRCTEVFRF9NSVRJR0FUSU9OX0FVVE8pIHsNCj4gPiArICAgICAgICAgICAgIC8qIElu
dGVsIG1pdGlnYXRpb24gc2VsZWN0ZWQgaW4NCj4gPiArIHJldGJsZWVkX3VwZGF0ZV9taXRpZ2F0
aW9uKCkgKi8NCj4gPiAgICAgICAgICAgICAgIGlmIChib290X2NwdV9kYXRhLng4Nl92ZW5kb3Ig
PT0gWDg2X1ZFTkRPUl9BTUQgfHwNCj4gPiAgICAgICAgICAgICAgICAgICBib290X2NwdV9kYXRh
Lng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9IWUdPTikgew0KPiA+ICAgICAgICAgICAgICAgICAg
ICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfTUlUSUdBVElPTl9VTlJFVF9FTlRSWSkpDQo+ID4g
QEAgLTEyMTIsMTggKzExODcsNjUgQEAgc3RhdGljIHZvaWQgX19pbml0IHJldGJsZWVkX3NlbGVj
dF9taXRpZ2F0aW9uKHZvaWQpDQo+ID4gICAgICAgICAgICAgICAgICAgICAgIGVsc2UgaWYgKElT
X0VOQUJMRUQoQ09ORklHX01JVElHQVRJT05fSUJQQl9FTlRSWSkgJiYNCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX0lCUEIpKQ0KPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldGJsZWVkX21pdGlnYXRpb24gPQ0KPiA+
IFJFVEJMRUVEX01JVElHQVRJT05fSUJQQjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgZWxz
ZQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldGJsZWVkX21pdGlnYXRpb24g
PQ0KPiA+ICsgUkVUQkxFRURfTUlUSUdBVElPTl9OT05FOw0KPiA+ICAgICAgICAgICAgICAgfQ0K
PiA+ICsgICAgIH0NCj4gPiArfQ0KPg0KPiBJJ2QgZmxpcCB0aGF0IG91dGVyIGNoZWNrIGluIG9y
ZGVyIHRvIHNhdmUgYW4gaW5kZW50YXRpb24gbGV2ZWwgaGVyZToNCj4NCj4gZGlmZiAtLWdpdCBh
L2FyY2gveDg2L2tlcm5lbC9jcHUvYnVncy5jIGIvYXJjaC94ODYva2VybmVsL2NwdS9idWdzLmMg
aW5kZXgNCj4gOWQ2Y2U0YTE2N2JlLi4yMDdhNDcyZDFhNmUgMTAwNjQ0DQo+IC0tLSBhL2FyY2gv
eDg2L2tlcm5lbC9jcHUvYnVncy5jDQo+ICsrKyBiL2FyY2gveDg2L2tlcm5lbC9jcHUvYnVncy5j
DQo+IEBAIC0xMTgyLDE4ICsxMTgyLDE5IEBAIHN0YXRpYyB2b2lkIF9faW5pdCByZXRibGVlZF9z
ZWxlY3RfbWl0aWdhdGlvbih2b2lkKQ0KPiAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ICAgICAg
ICAgfQ0KPg0KPiAtICAgICAgIGlmIChyZXRibGVlZF9taXRpZ2F0aW9uID09IFJFVEJMRUVEX01J
VElHQVRJT05fQVVUTykgew0KPiAtICAgICAgICAgICAgICAgLyogSW50ZWwgbWl0aWdhdGlvbiBz
ZWxlY3RlZCBpbiByZXRibGVlZF91cGRhdGVfbWl0aWdhdGlvbigpICovDQo+IC0gICAgICAgICAg
ICAgICBpZiAoYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yID09IFg4Nl9WRU5ET1JfQU1EIHx8DQo+
IC0gICAgICAgICAgICAgICAgICAgYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yID09IFg4Nl9WRU5E
T1JfSFlHT04pIHsNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgaWYgKElTX0VOQUJMRUQoQ09O
RklHX01JVElHQVRJT05fVU5SRVRfRU5UUlkpKQ0KPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJldGJsZWVkX21pdGlnYXRpb24gPSBSRVRCTEVFRF9NSVRJR0FUSU9OX1VOUkVUOw0K
PiAtICAgICAgICAgICAgICAgICAgICAgICBlbHNlIGlmIChJU19FTkFCTEVEKENPTkZJR19NSVRJ
R0FUSU9OX0lCUEJfRU5UUlkpICYmDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9JQlBCKSkNCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZXRibGVlZF9taXRpZ2F0aW9uID0gUkVUQkxFRURfTUlUSUdBVElPTl9JQlBC
Ow0KPiAtICAgICAgICAgICAgICAgICAgICAgICBlbHNlDQo+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmV0YmxlZWRfbWl0aWdhdGlvbiA9IFJFVEJMRUVEX01JVElHQVRJT05fTk9O
RTsNCj4gLSAgICAgICAgICAgICAgIH0NCj4gKyAgICAgICBpZiAocmV0YmxlZWRfbWl0aWdhdGlv
biAhPSBSRVRCTEVFRF9NSVRJR0FUSU9OX0FVVE8pDQo+ICsgICAgICAgICAgICAgICByZXR1cm47
DQo+ICsNCj4gKyAgICAgICAvKiBJbnRlbCBtaXRpZ2F0aW9uIHNlbGVjdGVkIGluIHJldGJsZWVk
X3VwZGF0ZV9taXRpZ2F0aW9uKCkgKi8NCj4gKyAgICAgICBpZiAoYm9vdF9jcHVfZGF0YS54ODZf
dmVuZG9yID09IFg4Nl9WRU5ET1JfQU1EIHx8DQo+ICsgICAgICAgICAgIGJvb3RfY3B1X2RhdGEu
eDg2X3ZlbmRvciA9PSBYODZfVkVORE9SX0hZR09OKSB7DQo+ICsgICAgICAgICAgICAgICBpZiAo
SVNfRU5BQkxFRChDT05GSUdfTUlUSUdBVElPTl9VTlJFVF9FTlRSWSkpDQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHJldGJsZWVkX21pdGlnYXRpb24gPSBSRVRCTEVFRF9NSVRJR0FUSU9OX1VO
UkVUOw0KPiArICAgICAgICAgICAgICAgZWxzZSBpZiAoSVNfRU5BQkxFRChDT05GSUdfTUlUSUdB
VElPTl9JQlBCX0VOVFJZKSAmJg0KPiArICAgICAgICAgICAgICAgICAgICAgICAgYm9vdF9jcHVf
aGFzKFg4Nl9GRUFUVVJFX0lCUEIpKQ0KPiArICAgICAgICAgICAgICAgICAgICAgICByZXRibGVl
ZF9taXRpZ2F0aW9uID0gUkVUQkxFRURfTUlUSUdBVElPTl9JQlBCOw0KPiArICAgICAgICAgICAg
ICAgZWxzZQ0KPiArICAgICAgICAgICAgICAgICAgICAgICByZXRibGVlZF9taXRpZ2F0aW9uID0g
UkVUQkxFRURfTUlUSUdBVElPTl9OT05FOw0KPiAgICAgICAgIH0NCj4gIH0NCj4NCg0KWWVhaCB0
aGlzIG1ha2VzIHNlbnNlLg0KDQpUaGFua3MgLS1EYXZpZCBLYXBsYW4NCg==
