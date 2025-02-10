Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A33F1F4629
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739207849; cv=fail; b=Za6cZhaFX8pbnh0NbpyvhaPR1xTxnr+6onrBOFns57iZo2hColkzflaLubRzELtHl+KLenYUtpZP+9jdLQvoAiOd3WoQR+OQBMuGDLzFlhhR1hhM/x1r/2wvs0ZvV7wq82Uag+VT/4LyNWh9Pis0Qb4t7GeyIQHfSxZOD4SsTZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739207849; c=relaxed/simple;
	bh=XLJdoZt69mS6h/UBeNSyFacfaQyQSuFxEA6Vvob51ek=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ptvekyW5nrtzAkUjo8h7zt085olUcFFpQtyB0vnCbFL0YsAyyBxrXapKUSMffzTsEMcWITTuBCbttpoK/Gfdxy0Sz4sNjhUL5dN9BaLrUNQYGWbhcjMDsexNTqvxXQ13fZc8ENPk8n9hGyte072VTDOB5dUHDC14O3CGPojqGNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lsLfbtFd; arc=fail smtp.client-ip=40.107.220.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lsLfbtFd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=coOOvmbmved6KomESGQ9EmPb6N+B1Ae8mQZCRFmoHcFyfUchsLIYU71Nfjkh7gZ3gwOWLgGKj/UxkKIvC6J/XD6OHDENrhlzkpNZjyxGzGrr08gmfFHhsL7zrs6k1nmHpBsapQgmM0gG8YqHQdL99zYiX19NDL9qwurm9V99hm+t0aaDr8F5dzBmPfO16N4KpwCieb/UQiFeeg9SyAKJYqboWXX29T9C2a5pmof3W6K71v0nOI90+R/coWO7266HLpETyRG4+xBwxMtSNhCNv2gFLAaS1ZPfiztE8xtUWhsQrOjEwDG6y0ET3XgTypBa1Kl1GlCD6aMTCqR0ABuTjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLJdoZt69mS6h/UBeNSyFacfaQyQSuFxEA6Vvob51ek=;
 b=UmAu+jiyRqjc7fXCWtHmnPZHUvgQDYqVKjqaY5ChWh9csHS8JVrw88p2bp2kTE/Yzs7UlrSrl42Suza3AAsHZnkKPjVisF2j3dZ8V5MQIYAlNAnepG9JiwGjaqgsJvxj9fz7sEpLmczB7uOhDstCGz6SaX71fOB00NvA10VJW1VRuQES2d6qYaM6dMbldCnxrm6k/KGLBM09ga4ehHVH/xPYL5Cg7rbAj2HAl27B55yvwx97tVb5iGqNtPk0dGROyr6t1LZWYz1S7r3ESaNldO6Nw/s144Qex09pVhaP5Sw0vO/UBpKqWM0qH7Y6z2dl8u3HFBYOS+XtQeV55CC1EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLJdoZt69mS6h/UBeNSyFacfaQyQSuFxEA6Vvob51ek=;
 b=lsLfbtFdp8XlH41ft5h0zEBfAZKdjoWo+pN+tgOZZW16aybC9Eilp8V7da9X+rGVjUTTNP3gQInDVZaQEKi4bLmPoQE/aHBWoUZ+3YrOLLNd03cZxLw69ojTF8ks3o9oYAbakw96iP/7oIJQ6lxz2z1hb985rrxOsyl1HoYtp/o=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by BL3PR12MB6569.namprd12.prod.outlook.com (2603:10b6:208:38c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 17:17:23 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 17:17:23 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Brendan Jackman <jackmanb@google.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 04/35] x86/bugs: Restructure mds mitigation
Thread-Topic: [PATCH v3 04/35] x86/bugs: Restructure mds mitigation
Thread-Index: AQHbe9bPkG1dok2MH0+eqOx6/0d3tLNAxYzQ
Date: Mon, 10 Feb 2025 17:17:22 +0000
Message-ID:
 <LV3PR12MB926547CDEDCFAE3612F0AC2494F22@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-5-david.kaplan@amd.com>
 <CA+i-1C2B-xupi4cRT-AGMegYepUxhaJ89iG_J+Toa6z-Axp3uQ@mail.gmail.com>
In-Reply-To:
 <CA+i-1C2B-xupi4cRT-AGMegYepUxhaJ89iG_J+Toa6z-Axp3uQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=9f75c0d6-b8db-42f1-afc8-e6a69583e50f;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-02-10T17:09:58Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|BL3PR12MB6569:EE_
x-ms-office365-filtering-correlation-id: 37ab8685-d8ce-4167-9e3f-08dd49f6c872
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?V1g2QXRUTEFZQ25BTkordTloVzZsTGNwOG1JbXFad3ljdTZscnhaUW1WYTdY?=
 =?utf-8?B?NVI1T3hveTJzdE5JWFdNNHU3UitnTE5rdnhON3NsaVhtTUhPVjVRN1p5TEVH?=
 =?utf-8?B?ZkRFY1JGZm5aWUJibkxYVWJSWUxKS3VUWWNJeW5WVkwyUW9kQVhUcm1SenFi?=
 =?utf-8?B?UWMwSjFjV25WYVcrbGloTlVOQVhEY1hrVzhGRVp2VWpnU0FGdXo0QWV6QjhK?=
 =?utf-8?B?ZVVWdTlLMVUrL1F2VW0rbU1NMDVpSjRDZTgxMnVncHlaa1pTbGE1dUNYQmRz?=
 =?utf-8?B?RFVrbU1ZNStrVU5nbzI1NHpEelhHVEE3Q3cxc1FVQ0pPZytoUUw3bFdlQmVM?=
 =?utf-8?B?WjBkR0k1Tnd1cklwcnVCWTcxbmZTcTdVODdNbmxhd3F6QktmNWRXdlFJbHk4?=
 =?utf-8?B?SXZVdDlUS1lvMlVCUzZpZGlEdlhOcHhXVlcwZVJUT0ZDVGxUS2loM0kzMWFU?=
 =?utf-8?B?T1pSWURiQTEwcTZaeWhJNXZLMEtsSkZxeGlsTWpyZ2ZYODFFdmsyYTdRNE01?=
 =?utf-8?B?aUNNZjNUV0lHSGZDWkNWSEZTN0JPRXpBeVQxaFo1QTRRTG1laTdCWU9FSE00?=
 =?utf-8?B?U3NzZk1oYnBTSnduaERmZmR6dzB1OFBudTZBMXFWQk5kc0orV2tkR2diRGF0?=
 =?utf-8?B?dXlsQzgyR0VFSFAweWZlUGZINm56L0xyUkV6QUxnYnpyZ3huUHd4RjYxVnFR?=
 =?utf-8?B?RVhwek5FR1VONExZbEQxQXlLUDFLQVJPYng2alBwRXRmZjNjSWZpbVFlMEZ6?=
 =?utf-8?B?aDFsOXdNcGpsTmtnMlgxaU03NjVnOTNWQjFXbzVraDI2Si9YeDJSaWNQOExs?=
 =?utf-8?B?ekNmdVJvSytEVEZSS3pyMHNvd2s1OWpDeW1MNlhUUUYxYVpsb3pRSjNNc2d2?=
 =?utf-8?B?cmVQTmxOQUNoa2Z3dHNuSGlWU0wzNEFjeUhtS28yaUNmREVxZGVuNGp2aElH?=
 =?utf-8?B?bFJuSVB0QXVUTGxJOUlnYTZaanJxY0dXb0o4R3BtZDZvNzRaZUMvUWt0Yzd2?=
 =?utf-8?B?WS9BRlNjZU5lV2Uyb2VIZThLTWVud0FpM3hJZFcwM0xkeEpiY2lWYm9MZ01y?=
 =?utf-8?B?S2F4QVlxL2gzNlYxbkpUSGg2a3hKbXZlU2QySzRuc05TRDIzeWVlYjZkRW8z?=
 =?utf-8?B?Y2hLRGJMcktENkQ4OVJPeUw5SHFjdlZlRE1ZOVBsczZENVpRK1RiNUJZWHBo?=
 =?utf-8?B?WWRUOS9mUW9TRVpwYW9iQnRid3VWdlNTaUQzcHozUG91Y1BtV0J2U0ZJVWZs?=
 =?utf-8?B?NjM3djkwcGtMdzJJa0dwMExvT0xzWVN5aE1BQi91UVROQWNjQmZ1ZUhKV2U5?=
 =?utf-8?B?K3VjcW5YOWs4bm01bnZIRmJSNzRiVzlUc0pmUitZUGdJL3A1OWdDQkVIakdV?=
 =?utf-8?B?WDVERmZJL3VUZHVGUEtGQWtmbGxoRGtDbVVVOFdUUFo2R2F4bzlvdUVjM01F?=
 =?utf-8?B?VkZFK1B0OFd3blU2OHFyek1QMVZhSi9jQ1pCTjVrTDAyd2x0c3NlejFEdE84?=
 =?utf-8?B?eW1OUmZqa2V4eUl0dzFUekhmaGZYV2ZCekViZU10VDEyUGVqMjNueDczM01T?=
 =?utf-8?B?WnhzdEdCdzlFWHI5cFE5WnFuazFBTXZPMFZDbG9kSHBWTnIyY3RLRGR2Y1Bj?=
 =?utf-8?B?TWJGaWtnZ0tMaU1KM3FqUFhRTTV4Tk1mMVNLcEpGZDZPUUgyemJLRG5hZDE1?=
 =?utf-8?B?WkhBUUVtUTdrbTRTbHFZQkl3M1RpaXNVSWFMQ01FUmRnSmFQQ1FBb0NNRUdv?=
 =?utf-8?B?OEhxMG9FcXM3bjBuSXY3cmsyc1daNUhEQUVhTzEvNG8vc0tadExJUFYvSUVv?=
 =?utf-8?B?SW5GOVdjWFB5RDYzVkZwUDBNOGFDWjkySDNRWVN2UEltdWRjc3FYL01rS3da?=
 =?utf-8?B?RDdoU3ZjZlR3bGtlWEpJbGRtMFJpVCt6NXR5UGpZRHE4OFloVnR2SWsrMTFq?=
 =?utf-8?Q?tNamiofmw3LIeIuY81P5iDP44Wjhh13i?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aXJLVWpYYVhCODZyV1NBdlhMRVBLNU1rY1kzeUszdEZDeHIzYm1aRGRTSnE1?=
 =?utf-8?B?YjBQTnpmZUZjdnF1S3pEU2FaSHdId211dExiU3RQTjhjZUFySGhMYW5oS3lJ?=
 =?utf-8?B?VklxT0tuZ2ladm5ldUx6MllPbjg1OXo1THNYeHdaOE84aE5YVlRpYUlvMDd0?=
 =?utf-8?B?bldJTnRpVzdjUjltbW1tZ0dkQU9ySmpRMVRMM2VKYkhRRXg3ak5zRTFOeEcv?=
 =?utf-8?B?YnVxOVI4TGM5TVp1Q2E2K1dRVVhjbUlDaytQZTJkb2JzMlovend6V2N6Njlz?=
 =?utf-8?B?eEpua1FFWlpQYWJuQmc2cFRZUWFFNjlvTGxxWC9maGFLYzZrWXRGMXh2N1hK?=
 =?utf-8?B?RnBCM1FCS0ZkTHJVK3gwYVJ0QVozbk1HWnBsaCtNUVlVcFp4RkFvSHE4NWRC?=
 =?utf-8?B?STFPaHFzM3VkZlBJbGR0dmN3NjZ5Y3NXckh4ZzRqMlc0ZVdSVFlhK09JTFZn?=
 =?utf-8?B?SkMwMGNWdnpWWHlma1U4T0hxdE1reUhSRGdvMGtGalczbWFBTGUySDBKT1Fu?=
 =?utf-8?B?aXlsdU5HQURkbCtMODZDeEJhdkdZbHkxMm9aWUVpd3BYVHVnL1pXOUVXbk1D?=
 =?utf-8?B?aGNhOGRsQ3BibEZJR1RRanFtZHg3M1RjMHkwTXJaNXY1REVadW90bml6ZXB6?=
 =?utf-8?B?eTN3eGpIRVBLc3FwVk9jTWo0WFZVNDJYQTFQb3AzbkdsVXJPbjdXcHJuYWEx?=
 =?utf-8?B?SEtPc2JrZXJncUxSaXYrUnFLc0tBNm9MQ0IvK0Y2WEFadDBKWUdtY2JrQXZR?=
 =?utf-8?B?V1N3OEUxRTlZY2xMeVd1UzhyUWRGckMvRit6RkpaV2lSYy9VUzFJN1VibWlO?=
 =?utf-8?B?U2dOVWF4ZHMxemMxckxVNUNwYldLTjhiaFlMNnh4UWg5WWg5ZjROenoxWFM2?=
 =?utf-8?B?TlJpMG1SaDlCbHFiVlZZeWdQQi8xeGJ4RVh2VTZWOXVsbWJKZ1ViNTlBOGYr?=
 =?utf-8?B?Y2twYWZ4YkszWVdnZDdQaVZWYnVCelQrZWg0U3IrbzM0Y2tFSytlaGx6V3Vr?=
 =?utf-8?B?cXhqR2pTeC9HRlN1dm10bWFETlFCdE1KRHhFeStKbE1Ka1VHZG84ZjNQWldC?=
 =?utf-8?B?aHFKTFFUK3ovY1A0a3ZSekVYTUc1K2NRKzBtQjNvS3BBcGdmVWNjUnFYNmRL?=
 =?utf-8?B?dWVEMFplbHhMUkpRZ2JCQjYrMFZGV2N3NkFKWCtRK3Vhck9IQTZiT2s0RjY1?=
 =?utf-8?B?c281K0tkZlBKQVdNLzhCekZNLzQ0eElkeDNNK0o2SmRJWkhZK2NFMVdxQ216?=
 =?utf-8?B?OTh5bzljWjJqVTRSQkErQzlMZnBvSWZqQURyakswbDZqajlpa0JYbEd3TDJr?=
 =?utf-8?B?VktpbW9zR2FYem4wN3V0ZUl3d2hLOXYrcm03WkxmcC83V281WXRId3IwYmNR?=
 =?utf-8?B?eVR3TU5xVElCaUlxc1RzSzNCSTNrUXJya0UzVGF2Q3hzMmxjbHMwcjJkVEJ4?=
 =?utf-8?B?TWRJd0E3QWIwcWVoMHhJNnc2ZzFHWStiVTF6ZkpPTDV2MFhxS3E5dXlDRk4r?=
 =?utf-8?B?K0FZZ0NBZ205SUJXUGJWc3pBaXFlTWNqNkhCaHhVQjgrc3hWSmpWaXNrVm5s?=
 =?utf-8?B?Vmdvc3M1SGdERUM1Ujd4ODNNVjJGbnZVZGZxTW1rcDFGVHFyZ0lhYkRnSG1m?=
 =?utf-8?B?SU9TTHdQQmF2R0VKRDczT0dNRHg1MG1mWlNhTEUwc2xLSldpTzE2Yk5sdDVR?=
 =?utf-8?B?ZDlKV2kreDNGb25icThQSTlwUTkvY1MxMTdjbGZUMWJucHpGbUdEZ1pZYVpB?=
 =?utf-8?B?UUVMcENLZjdlOHM5Q2d5NnNrTHhaYU5RSDVmOHVtMHk0Slp1M3EwSnptWVc4?=
 =?utf-8?B?bzMvN1dIeWtscDZLL1l0N1lNSDd0NzZZLzZyajJVYTk3MDZMcUpiMk5qTFg1?=
 =?utf-8?B?aC9Yc1ZwQm5nSHQ0ejZBOHk2UVFoRTU2M01ZL3YwMCs1NzNaZ21odllEV0Jl?=
 =?utf-8?B?QVpiYmRXNUdDVGZoL2Y0V25nRDlEdjhzVjI1QXdZMEtLRkpLVlBHWktuUnZB?=
 =?utf-8?B?MUw5bzY0am05RlpmQkFCTlg4emxXbjBPWFdSRWZaVVh5OUsxU1FFSVFVYTN3?=
 =?utf-8?B?OXlmN3l6clFoa3kyM0ZkTzIwc3ZJTTRuOUVqSjQvZlRqc0dyTHljYjVEK1dK?=
 =?utf-8?Q?5H2o=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ab8685-d8ce-4167-9e3f-08dd49f6c872
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 17:17:22.9706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D+1nF4XKBAPzTgkVjkalyhuP3UeYgPj/qg48o8XV4F1eTzmiHoAwGat9dktWGXaC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6569

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcmVuZGFuIEphY2ttYW4g
PGphY2ttYW5iQGdvb2dsZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgRmVicnVhcnkgMTAsIDIwMjUg
MTA6MTQgQU0NCj4gVG86IEthcGxhbiwgRGF2aWQgPERhdmlkLkthcGxhbkBhbWQuY29tPg0KPiBD
YzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+OyBCb3Jpc2xhdiBQZXRrb3Yg
PGJwQGFsaWVuOC5kZT47IFBldGVyDQo+IFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz47
IEpvc2ggUG9pbWJvZXVmIDxqcG9pbWJvZUBrZXJuZWwub3JnPjsgUGF3YW4NCj4gR3VwdGEgPHBh
d2FuLmt1bWFyLmd1cHRhQGxpbnV4LmludGVsLmNvbT47IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRo
YXQuY29tPjsNCj4gRGF2ZSBIYW5zZW4gPGRhdmUuaGFuc2VuQGxpbnV4LmludGVsLmNvbT47IHg4
NkBrZXJuZWwub3JnOyBIIC4gUGV0ZXIgQW52aW4NCj4gPGhwYUB6eXRvci5jb20+OyBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMDQvMzVdIHg4
Ni9idWdzOiBSZXN0cnVjdHVyZSBtZHMgbWl0aWdhdGlvbg0KPg0KPiBDYXV0aW9uOiBUaGlzIG1l
c3NhZ2Ugb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gVXNlIHByb3BlciBjYXV0
aW9uDQo+IHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcgbGlua3MsIG9yIHJlc3Bv
bmRpbmcuDQo+DQo+DQo+IE9uIFdlZCwgOCBKYW4gMjAyNSBhdCAyMToyNywgRGF2aWQgS2FwbGFu
IDxkYXZpZC5rYXBsYW5AYW1kLmNvbT4gd3JvdGU6DQo+ID4gKy8qDQo+ID4gKyAqIFNwZWN1bGF0
aW9uIFZ1bG5lcmFiaWxpdHkgSGFuZGxpbmcNCj4gPiArICoNCj4gPiArICogRWFjaCB2dWxuZXJh
YmlsaXR5IGlzIGhhbmRsZWQgd2l0aCB0aGUgZm9sbG93aW5nIGZ1bmN0aW9uczoNCj4gPiArICog
ICA8dnVsbj5fc2VsZWN0X21pdGlnYXRpb24oKSAtLSBTZWxlY3RzIGEgbWl0aWdhdGlvbiB0byB1
c2UuICBUaGlzIHNob3VsZA0KPiA+ICsgKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dGFrZSBpbnRvIGFjY291bnQgYWxsIHJlbGV2YW50IGNvbW1hbmQgbGluZQ0KPiA+ICsgKiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgb3B0aW9ucy4NCj4gPiArICogICA8dnVsbj5fdXBk
YXRlX21pdGlnYXRpb24oKSAtLSBUaGlzIGlzIGNhbGxlZCBhZnRlciBhbGwgdnVsbmVyYWJpbGl0
aWVzIGhhdmUNCj4gPiArICogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNlbGVjdGVk
IGEgbWl0aWdhdGlvbiwgaW4gY2FzZSB0aGUgc2VsZWN0aW9uDQo+ID4gKyAqICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBtYXkgd2FudCB0byBjaGFuZ2UgYmFzZWQgb24gb3RoZXIgY2hv
aWNlcw0KPiA+ICsgKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWFkZS4gIFRoaXMg
ZnVuY3Rpb24gaXMgb3B0aW9uYWwuDQo+ID4gKyAqICAgPHZ1bG4+X2FwcGx5X21pdGlnYXRpb24o
KSAtLSBFbmFibGUgdGhlIHNlbGVjdGVkIG1pdGlnYXRpb24uDQo+DQo+IE1heWJlIGFsc28gd29y
dGggY2FsbGluZyBvdXQgY3B1X2J1Z3Nfc210X3VwZGF0ZSgpIGhlcmU/DQoNCkhtbSwgaG93IHdl
cmUgeW91IHRoaW5raW5nPyAgVGhlIDMgZnVuY3Rpb25zIGFib3ZlIGFyZSBkZWZpbmVkIGZvciBl
YWNoIHZ1bG5lcmFiaWxpdHkuICBTbyB0aGlzIGlzIG1vcmUgaW50ZW5kZWQgYXMgYSBndWlkZSB3
aGVyZSBpZiBhZGRpbmcgYSBuZXcgdnVsbmVyYWJpbGl0eSwgeW91IHNob3VsZCBkZWZpbmUgdGhl
IGZ1bmN0aW9ucyBhYm92ZSBhcyBuZWVkZWQuDQoNCj4NCj4gPiArLyogUmV0dXJuIFRSVUUgaWYg
YW55IFZFUlctYmFzZWQgbWl0aWdhdGlvbiBpcyBlbmFibGVkLiAqLyBzdGF0aWMNCj4gPiArYm9v
bCBfX2luaXQgdmVyd19taXRpZ2F0aW9uX2VuYWJsZWQodm9pZCkgew0KPiA+ICsgICAgICAgcmV0
dXJuIChtZHNfbWl0aWdhdGlvbiAhPSBNRFNfTUlUSUdBVElPTl9PRkYgfHwNCj4gPiArICAgICAg
ICAgICAgICAgKHRhYV9taXRpZ2F0aW9uICE9IFRBQV9NSVRJR0FUSU9OX09GRiAmJg0KPiA+ICsg
ICAgICAgICAgICAgICAgdGFhX21pdGlnYXRpb24gIT0gVEFBX01JVElHQVRJT05fVFNYX0RJU0FC
TEVEKSB8fA0KPiA+ICsgICAgICAgICAgICAgICBtbWlvX21pdGlnYXRpb24gIT0gTU1JT19NSVRJ
R0FUSU9OX09GRiB8fA0KPiA+ICsgICAgICAgICAgICAgICByZmRzX21pdGlnYXRpb24gIT0gUkZE
U19NSVRJR0FUSU9OX09GRik7IH0NCj4NCj4gU2luY2UgeW91IGRlZmluZWQgc3VjaCBuaWNlIHRl
cm1pbm9sb2d5IGFib3ZlLCB3aHkgbm90IHVzZSBpdCBoZXJlIGFuZCBzYXkNCj4gdmVyd19taXRp
Z2F0aW9uX3NlbGVjdGVkKCk/DQo+DQo+IChPYnZpb3VzbHkgaWYgdGhlIGFsdGVybmF0aXZlIHdh
cyBhIHJlc3BpbiBmb3IgdGhpcyB0cml2aWFsIGlzc3VlIGFsb25lIEkgd291bGQgcHJlZmVyIHRv
DQo+IG1lcmdlIHdpdGggdGhlIGN1cnJlbnQgbmFtZSEpDQoNCkkgZG8gbGlrZSB0aGF0IG5hbWUg
YmV0dGVyLCBJJ2xsIHVzZSB0aGF0IHVubGVzcyBhbnlvbmUgZWxzZSBvYmplY3RzLg0KDQo+DQo+
ID4gK3N0YXRpYyB2b2lkIF9faW5pdCBtZHNfdXBkYXRlX21pdGlnYXRpb24odm9pZCkgew0KPiA+
ICsgICAgICAgaWYgKCFib290X2NwdV9oYXNfYnVnKFg4Nl9CVUdfTURTKSB8fCBjcHVfbWl0aWdh
dGlvbnNfb2ZmKCkpDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybjsNCj4gPiArDQo+ID4gKyAg
ICAgICAvKiBJZiBUQUEsIE1NSU8sIG9yIFJGRFMgYXJlIGJlaW5nIG1pdGlnYXRlZCwgTURTIGdl
dHMgbWl0aWdhdGVkIHRvby4gKi8NCj4gPiArICAgICAgIGlmICh2ZXJ3X21pdGlnYXRpb25fZW5h
YmxlZCgpKSB7DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChib290X2NwdV9oYXMoWDg2X0ZFQVRV
UkVfTURfQ0xFQVIpKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIG1kc19taXRpZ2F0aW9u
ID0gTURTX01JVElHQVRJT05fRlVMTDsNCj4gPiArICAgICAgICAgICAgICAgZWxzZQ0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIG1kc19taXRpZ2F0aW9uID0gTURTX01JVElHQVRJT05fVk1X
RVJWOw0KPiA+ICsgICAgICAgfQ0KPg0KPiBUaGlzIGlzIGNoYW5naW5nIHdoYXQgdGhlIHVzZXIg
d2lsbCBzZWUgaW4gc3lzZnMuIFRoaXMgc2VlbXMgZ29vZCB0byBtZSwgYnV0IGl0DQo+IHdvdWxk
IGJlIHdvcnRoIGNhbGxpbmcgaXQgb3V0IGluIHRoZSBjb21taXQgbG9nIEkgdGhpbmsuDQoNCkRv
ZXMgaXQ/ICBXaGF0IGlzIHRoZSBjYXNlIHlvdSdyZSB0aGlua2luZyBvZiB3aGVyZSBpdCBpcyBk
aWZmZXJlbnQgdnMgdGlwPw0KDQotLURhdmlkIEthcGxhbg0K
