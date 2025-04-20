Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BADA1362
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 21:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745182865; cv=fail; b=Km8KTUsjTcl1vRNa/+A4EtMLdhx6obuWIxHava8CPIUmsXnZE6fSbpJSbjgAFf+Os2H/SH97q9wHslGvK4sJA86A7v1fpkwyWwRjQwpUpHIn50XNXOShM6jtPtwo+S1Q0+TZz19MuKIe+Dy17NL6BfKNxvACtNGfOuzqykxh1Wc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745182865; c=relaxed/simple;
	bh=mHIdJDF35Vd0412v/FuF/uvQ37WUN9ccA+VdNG2ZTF4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kzShXmRnZT+KH84eaBdupsO/TqGfJzEuGcFJPdGApNUowfw/14yl51JEdcfCx6v9Pl6lkFp+A3j7Kp6ldShsCI2LqiPxsY6s7lrdjtY2zMU3ky3tRaUDTjaEwr4nF6tMyS7mLhkePBVfqRgt7Y7G7Plsj+GmlUSg6oeAhdyYr0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bkNMhzv3; arc=fail smtp.client-ip=40.107.223.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bkNMhzv3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IiLPcxKXOZQ/I+fFF0zxouo/OPdbeN9De6N0FsMjGyxWETNUGPg+fJV7v1qYZlZeuhaPtNFIM3dakKDI0WVHoOyjKbph/FSeF7KJ77MtlMpgfXZmYyXad79aC8iFrBb9HzD+NRjzVsvD7jRy8tN9VyY7KJoovuW3w4MaPzxUAmPwPptFGQyCVG4BojjSt58fBOW5o82MkUVO0rdeEfvv4smC/ETycYKduxBMy62PMPSxVnSRtjLC85i7sC6A2ivzvA561vfo+TLQD/Wcxpd9/UeTFYxeAmeLSkeKhIHY0bRnOEFJJ72RO/2NLymfsL+RtG5bAg6Geu55OD1+MQtwOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHIdJDF35Vd0412v/FuF/uvQ37WUN9ccA+VdNG2ZTF4=;
 b=fS6usOMJPHdI0vXOmjndPuADiUF/EzoKh/8Vr7kBVCQk7Rsl2CHI68xcjjd/2fzO2rkf1mh5+QshnKd5em474JnAstKrDjUXSoJnIfNj3o75PdMF8HqhljyYdJEYADHzyQS1BpLeELyzY+Sp4cOIwRsT+Gakwg8yDd2DrePPE6psAXn2PhmQNVov3vsZiuvEVlxTb2J9oulqXck41blLqjYTjbRLEwYkscwdyp2jSjVHMVjU5lje7X1d1iIiwqakAle0doo/Dwc+D+tNyTjJUmmCC1/PRswvlHwgg7Qmw04J4YJfU5dkoECdCjOj5YjjPgfJ0RS9lllNqO30iS+OrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHIdJDF35Vd0412v/FuF/uvQ37WUN9ccA+VdNG2ZTF4=;
 b=bkNMhzv3daFbtXR2KB0N1VJmaNgE3aQYglmWEbotPOupGVGTj0Y8os9LKjHI4L9pcJw2wCOB89AGkdtBL6RDwNzPg/MpCPFTILtuGMdeYtYnotGqVTzFGvMB4Ft8N6Evkgdz6249EvOFz6C95pigY02RqFnJdrNAsSpU2u0rP/s=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by CY8PR12MB7145.namprd12.prod.outlook.com (2603:10b6:930:5f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.27; Sun, 20 Apr
 2025 21:00:57 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%6]) with mapi id 15.20.8655.022; Sun, 20 Apr 2025
 21:00:56 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Borislav Petkov <bp@alien8.de>
CC: Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra
	<peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 01/16] x86/bugs: Restructure MDS mitigation
Thread-Topic: [PATCH v5 01/16] x86/bugs: Restructure MDS mitigation
Thread-Index: AQHbsKKBzwkbgMKk8021AI3EyLQfdrOtCo8w
Date: Sun, 20 Apr 2025 21:00:56 +0000
Message-ID:
 <LV3PR12MB9265B16CFC9D3E02C1159DEA94B92@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <20250418161721.1855190-2-david.kaplan@amd.com>
 <20250418204243.GQaAK5Q807BYWlABKV@fat_crate.local>
In-Reply-To: <20250418204243.GQaAK5Q807BYWlABKV@fat_crate.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=b754d38c-838a-4eef-9d32-5b2aa273c75f;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-20T20:50:56Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|CY8PR12MB7145:EE_
x-ms-office365-filtering-correlation-id: 3beb1dcc-59ca-46a8-971d-08dd804e71c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q2hqRW9MSDRQVnBpWENkL3FmcmpydTJCbElFVXRlUjNpSzhObUliUE5IbnQ5?=
 =?utf-8?B?dGdhb3pDUlNGc3NJUGJaUWxsbUdzS2R6Y2d5VXMwUzBuV1c2ZXpEUEVEOUZx?=
 =?utf-8?B?ZnQ0cFBDdTJJYzBQRU5wNWJ4K2pWTjNwYk9QT3FMU3RHYURUZnoyN3BOeXBl?=
 =?utf-8?B?YTU5K0pwb1YvTDhJa1Nmc21ydUt5SGxuSUFjTjJmdW4zYlpwcndQUm40WDdY?=
 =?utf-8?B?c1lJSHFkNzhZRXpPRUt5NHZrdlBsYTg4ZGFjM25EU09TNWJkREpoNFNCeU8x?=
 =?utf-8?B?aGNMOHFwTERYdFZXSUFxZ3VzZzRNcWRXR0FaMFRRT1Q1cHUyN081dkJOazFs?=
 =?utf-8?B?THh4ZE5mRmFEQmpxNXZCMnVrTmVob0hTNWFOQm9pR2QydEp6MXRNUGd3Q2xh?=
 =?utf-8?B?WXQ0RmwwWW1CaUJrSlU1NC82aFFJSHBnaFlVdVZ1TzQ1K0duVFpxemg3Q21W?=
 =?utf-8?B?d2hNRmFHbXhUOWZTS0pQQzNNaEFwNEtQYjN4ek8wd0hEcFJoTlRuR2U0bVNv?=
 =?utf-8?B?ODJOZ2FqYWg5R2VRMXhUaHAwdTVsK1BtQVFhYk90MHRtWnhaSWpVWDM1TkZM?=
 =?utf-8?B?eDVoRktUc1lBK09JdUZOTXM0S2liK1lNVWt4WU5jaEF2d3JuK2tha29HNWlz?=
 =?utf-8?B?b1BOMk90d0g2QVBBcWJZT2hBUFd0cjJaU24rLzNwcnFDaEF5Z0tnU3NVZnVB?=
 =?utf-8?B?UG44RGMzOWpISVdHeVRIS3h0VFZxVVBIQTZiMGxDYXdKYnYvV253Z0RkdUJj?=
 =?utf-8?B?RTZJTzVvWURYZWMxK2p0MFZ0MGhlR2ZEWW5zVy81eXlhZVBmLzJrUnpYZk4z?=
 =?utf-8?B?LzJnZWVBNFVvZDRuSjhTK3o4ZHVrS3dMcHkrcHB4ZlY3c014U1lBNUhua2RG?=
 =?utf-8?B?NG1scUoxdnV1RGVVTWdqTFlxTkFyZXdHdzU4V0ZTQXJyZVFUVmEzV3JGZ0s0?=
 =?utf-8?B?MzZnSWNIR01tQy9LOVJvejNDTkhvWUZ2ZVc4RFdoT011T001MkRHeWVTc2FT?=
 =?utf-8?B?dWxBZHhWUXJOZTJXNEZQK3VDRnFzdHdmSEI3d1phK25yTjZYdWhYY3ZLd2hK?=
 =?utf-8?B?NXJTb1Q1RHhCQmJLN1dRUzZxYmExYzNDaDNldUtOYXgraUVOYmRYeklMbEJr?=
 =?utf-8?B?dmV6TW1zWWF1ZmdIcVIxRUpBZWZiWWVFK0Jla3hPS1RjaHo3bW5Edk1Dc3Qr?=
 =?utf-8?B?RWNpN3VJUlM4WUxnZmpJOHlxY0pkY3h1cEg1cXV0ZEJyZkROUkZHeEhxd1da?=
 =?utf-8?B?Zlo4VlN0R1RNQzNlVmdSNWtkQW9jcGtmZk1seUNOVFpyamtEUHJWS2c1SWdE?=
 =?utf-8?B?czBmOWpXSmFhcDltby9JdWI4RUc2NzFtcGdyVTRCMDJ4dE96YkRuamNIMXdT?=
 =?utf-8?B?eHdueUZJSHhNeEpCd2d6VjBPUHc3dk9wVXNCVU41Q0hmbG9pZURjampiOWRN?=
 =?utf-8?B?aTQwL2xUTWwrTVBBWURNcW9aRmxZcEkzZy9udzNpdDBINlp0ZkJ4ZjZIdTM2?=
 =?utf-8?B?MXdFbk1SM1F3YmwrczJ2MysxSGJ2L2FwRDdjN1NTK1hIOVRmeVhHMGNxY1lE?=
 =?utf-8?B?RCs5UE5od1EvNnEvTWlyWGxmWDJyYXlUQ0srR1VVL3JDRG1NZ2xjUGlqZ3h6?=
 =?utf-8?B?ZHdVRUI5UGY4dDF3WDhsK0ZMUjkxVU5LVVpYd1ZBeVR2ZEFtZWVoVFNIMTJn?=
 =?utf-8?B?UkkvbVdwZDNPck9TbWVJT0NtOEl4aGk1aGFmRjBmRVUxc3F5RWpldkYyWndL?=
 =?utf-8?B?YlY4RGljQ2ljNmRwa3pnaXRWcXVZa25WNjBUa1hxamJ6TFlDbFhuVGZSaDVJ?=
 =?utf-8?B?SGZoYk1hVlArdjhpSjVXbk5SNUw1OGRlU2NVeUJIS2Z3ZXFMcnhVZHVybVc2?=
 =?utf-8?B?S3J5YmZGMEZibUV3QXdkSDV4blRHWVpydnhmelk3a1FuRUtuT0h3ZEYzZFd4?=
 =?utf-8?B?VStlU3JSYlphVVZ2WEtqQlEyQUhJSTFWSTg1L0NmUklIZDJDRlVwVXczN01Q?=
 =?utf-8?Q?k/g3QqMvuppTE8KpO60lTCZ9WPjitU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YlM0RFh3QmZSMExJT2t6NVRSSlNZeTBORVZpZmpNdWxGeHpyZitjd1g4OWlC?=
 =?utf-8?B?dDdvSHBKQzc1endqVnZIR2Yxcy9KQkdqVzRlMk1Beng1bk53R2ZYVnh5OVVh?=
 =?utf-8?B?SzZRM2ZicnBBUExWMVlXWVVxeHgxSXl5R3BkaDRhblI1RlMvZUViWDRHRHJt?=
 =?utf-8?B?QVhZK1ZWTEN1dk9Eb2N1M0hKekdGNWdsVUZ5c2xEVE5iUzd3bUtpZXM5eFp0?=
 =?utf-8?B?OVBkdStvWTAyMFpUcWNwb24zZVc4MWNRdEtyNThtMDlWNDdRYUQ4YkNBOW5K?=
 =?utf-8?B?Uy83Z3gvdXBkZnRrdWt0dHo5dTJST1J6ZS9RUW1nRTdsWERwUDVhTXY1K1BQ?=
 =?utf-8?B?NDFZdTZYbXgzeVBudXIzNWZxdy9PVS9DWExlTEgwaDNzSUxON3MrMU5LYys1?=
 =?utf-8?B?RXViT0FCcURadnh2TUdVay84R0JsVUtjdUxmNXVSKzNIeVFhVGh4NGtLdWRm?=
 =?utf-8?B?TnIySnFYUnJQaDAvZWZkWUxmR1kxc1NibVhnZHQvMWlnMjY2ME4vTCtmNE12?=
 =?utf-8?B?TW9xUkVlM0JuQUpaUmNjcXk1STd3Y2ZDN2dvN2gzYmNYTlgwV2FncS9QYi9k?=
 =?utf-8?B?S2lOcU9CL2VoUElmenBnamxMeklJZlQ5c2s4WWYxSFZoMm5zRjBIN2hwWU9r?=
 =?utf-8?B?akxoMjNJRVpwL0grMXFTU1VHQkxjbVk0Q05NM2txRHhIVHlYR1lYWFlBT3Bt?=
 =?utf-8?B?R0FwcE9NdGZZaEVwcWtkS2g4ZE8xSk5wWml2RHp1TDlLUW1IUE9uUUlpVXRR?=
 =?utf-8?B?SU5uVkFYeldDZnEzTjVFRlVqR2twRU9PNGVMRlNvL3BTb0xLY1BpT1ViSkd1?=
 =?utf-8?B?R0tjTmZOYkEza1U2MW9aakRLSm1hV3ZMSkFTSU05ZHhUSFRXSXhpb0tyN3hU?=
 =?utf-8?B?VFdWZXRJamhtRXNCelJ5N1lOSktyT1lzZU9ZQXB3UnQ1eEpzbFhPVWF0SG4r?=
 =?utf-8?B?eG0ySS9EN1QxajRsajgwVG41MysvaXZrNjk4b2pBNFRxdnB6R2kyRFhrNnZ3?=
 =?utf-8?B?dzNrM2ZCTFg1Z0kzOFlQaHJZditxOUwwZkpMNGZKZHdOTGhXSjJkNFVwV3pn?=
 =?utf-8?B?d0hUVFZsR1ZBNE11M3kxbWVybmlPb21naW9MVUxBbGFoSm1WWWpHSVlnTGNZ?=
 =?utf-8?B?b2VuTGx1L1k1d0JsNzJPLzhRU1FhK2xzaVQwcjNKTWJYeEpITHU0aTJWT2pm?=
 =?utf-8?B?WlFSQnJPVEw5ZUJtOUJRcTZSNU1HQ0RiNG8rV2VCV3VWRHpycEFyeS9xamVU?=
 =?utf-8?B?RW41Yjh6VFZxeGFsLzAvTWFibjFiTkJpVURPc1Z4ZFRZdFpuRS9iMkdPNE9y?=
 =?utf-8?B?SGdBQ1FxYzFRWlBCaWFSTXdsNmVxSTBaTTBtb2xENzE1cTczT1VHRWJtdzRL?=
 =?utf-8?B?ZEg2dm4rcXk3VFFGMnJCbjNLY3E2U2ZUVFIxYnErQkFTRWtjUXRzZzhuclpI?=
 =?utf-8?B?UGQ0cjJTTVpIODNUNk95ZlplZ20wZmYxWFpjZ3A0c0tsaCt0YWp1WGRyaE8w?=
 =?utf-8?B?VFo0VUFsTjh0cmoxZCsvZDNCcXJVTHpNZlFoK2czZ1o0dGZmQ0R3Y1h2Q25K?=
 =?utf-8?B?WXV4eXZEQ2tpYVNGT1dJYXpjM2ZuWHZ5US9yOE5MYVJVN1dFU00wSlBzbHJ4?=
 =?utf-8?B?RWJaOVQ0Q04wL0s4aTVaK01lL1U4VFRycWVZRzk1UlVQZzJXWHhaNldxWXFv?=
 =?utf-8?B?dkYySDhjZ21BT3hVdnpUQ05zdkxGODdPUUd1TlZ5dlZpSWhQUE92TmVTRjN3?=
 =?utf-8?B?cS9PMDYycyt4STRrQXk3cGwzNjlEYVBkSDJXTWlYb1d1UjhOYmFpWTQ1TTR2?=
 =?utf-8?B?eHJqMzRHd1RrbmdITFFPNWJBeklKa1dNUWhTYWtmS3hhMUNFaGxtcFVveWFC?=
 =?utf-8?B?MUllV052MkpodGJIUG1OQ0RKWmhGN0g0TlFFc0VvRzNQbTNhd2xmd2RVQkpN?=
 =?utf-8?B?MXQxSzhoRm0vRUkzdU45OEUwSTk4dVdsdmZCaDNZNk9tamVGQkpQU0NqcTVS?=
 =?utf-8?B?bFlod21jdXVNbzc3YWtOYkhrQTN6Z3pYNlAzejh0bVhPSTNlZE91dXR0b0c4?=
 =?utf-8?B?OEtzdEhFejNrYW1ieTR3dXowWWFzdFJFNGwwZHFsRkt6aWF0WnJ6UUs3UlZ2?=
 =?utf-8?Q?6egA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3beb1dcc-59ca-46a8-971d-08dd804e71c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2025 21:00:56.0907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pLj0JcVzcRYmDPDltL6vKmpj7GVC2pabheeZJXcFTP9kNaLWgXYYcn091jRo/GWD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7145

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCb3Jpc2xhdiBQZXRrb3Yg
PGJwQGFsaWVuOC5kZT4NCj4gU2VudDogRnJpZGF5LCBBcHJpbCAxOCwgMjAyNSAzOjQzIFBNDQo+
IFRvOiBLYXBsYW4sIERhdmlkIDxEYXZpZC5LYXBsYW5AYW1kLmNvbT4NCj4gQ2M6IFRob21hcyBH
bGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPjsgUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZy
YWRlYWQub3JnPjsNCj4gSm9zaCBQb2ltYm9ldWYgPGpwb2ltYm9lQGtlcm5lbC5vcmc+OyBQYXdh
biBHdXB0YQ0KPiA8cGF3YW4ua3VtYXIuZ3VwdGFAbGludXguaW50ZWwuY29tPjsgSW5nbyBNb2xu
YXIgPG1pbmdvQHJlZGhhdC5jb20+OyBEYXZlDQo+IEhhbnNlbiA8ZGF2ZS5oYW5zZW5AbGludXgu
aW50ZWwuY29tPjsgeDg2QGtlcm5lbC5vcmc7IEggLiBQZXRlciBBbnZpbg0KPiA8aHBhQHp5dG9y
LmNvbT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2NSAwMS8xNl0geDg2L2J1Z3M6IFJlc3RydWN0dXJlIE1EUyBtaXRpZ2F0aW9uDQo+DQo+IENh
dXRpb246IFRoaXMgbWVzc2FnZSBvcmlnaW5hdGVkIGZyb20gYW4gRXh0ZXJuYWwgU291cmNlLiBV
c2UgcHJvcGVyIGNhdXRpb24NCj4gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlja2luZyBs
aW5rcywgb3IgcmVzcG9uZGluZy4NCj4NCj4NCj4gT24gRnJpLCBBcHIgMTgsIDIwMjUgYXQgMTE6
MTc6MDZBTSAtMDUwMCwgRGF2aWQgS2FwbGFuIHdyb3RlOg0KPiA+IEBAIC0yODQsNiArMzE0LDkg
QEAgZW51bSByZmRzX21pdGlnYXRpb25zIHsgIHN0YXRpYyBlbnVtDQo+ID4gcmZkc19taXRpZ2F0
aW9ucyByZmRzX21pdGlnYXRpb24gX19yb19hZnRlcl9pbml0ID0NCj4gPiAgICAgICBJU19FTkFC
TEVEKENPTkZJR19NSVRJR0FUSU9OX1JGRFMpID8gUkZEU19NSVRJR0FUSU9OX0FVVE8NCj4gOg0K
PiA+IFJGRFNfTUlUSUdBVElPTl9PRkY7DQo+ID4NCj4gPiArLyogU2V0IGlmIGFueSBvZiBNRFMv
VEFBL01NSU8vUkZEUyBhcmUgZ29pbmcgdG8gZW5hYmxlIFZFUlcuICovDQo+ID4gK3N0YXRpYyBi
b29sIHZlcndfbWl0aWdhdGlvbl9zZWxlY3RlZCBfX3JvX2FmdGVyX2luaXQ7DQo+ID4gKw0KPg0K
PiBZZWFoLCBwbHMgcHVsbCB0aGF0IG9uZSB1cCAtIHNlZSBkaWZmIGF0IHRoZSBlbmQuDQo+DQo+
ID4gIHN0YXRpYyB2b2lkIF9faW5pdCBtZHNfc2VsZWN0X21pdGlnYXRpb24odm9pZCkgIHsNCj4g
PiAgICAgICBpZiAoIWJvb3RfY3B1X2hhc19idWcoWDg2X0JVR19NRFMpIHx8IGNwdV9taXRpZ2F0
aW9uc19vZmYoKSkgew0KPiA+IEBAIC0yOTQsMTIgKzMyNywzNCBAQCBzdGF0aWMgdm9pZCBfX2lu
aXQgbWRzX3NlbGVjdF9taXRpZ2F0aW9uKHZvaWQpDQo+ID4gICAgICAgaWYgKG1kc19taXRpZ2F0
aW9uID09IE1EU19NSVRJR0FUSU9OX0FVVE8pDQo+ID4gICAgICAgICAgICAgICBtZHNfbWl0aWdh
dGlvbiA9IE1EU19NSVRJR0FUSU9OX0ZVTEw7DQo+ID4NCj4gPiArICAgICBpZiAobWRzX21pdGln
YXRpb24gPT0gTURTX01JVElHQVRJT05fT0ZGKQ0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuOw0K
PiA+ICsNCj4gPiArICAgICB2ZXJ3X21pdGlnYXRpb25fc2VsZWN0ZWQgPSB0cnVlOyB9DQo+ID4g
Kw0KPiA+ICtzdGF0aWMgdm9pZCBfX2luaXQgbWRzX3VwZGF0ZV9taXRpZ2F0aW9uKHZvaWQpIHsN
Cj4gPiArICAgICBpZiAoIWJvb3RfY3B1X2hhc19idWcoWDg2X0JVR19NRFMpIHx8IGNwdV9taXRp
Z2F0aW9uc19vZmYoKSkNCj4gPiArICAgICAgICAgICAgIHJldHVybjsNCj4NCj4gQ2FuIHdlIHNp
bXBseSBkbw0KPg0KPiAgICAgICAgIGlmIChtZHNfbWl0aWdhdGlvbiA9PSBNRFNfTUlUSUdBVElP
Tl9PRkYpDQo+ICAgICAgICAgICAgICAgICByZXR1cm47DQo+DQo+IGhlcmU/DQo+DQo+IFdlIGFs
cmVhZHkgY2hlY2tlZCB0aGUgWDg2X0JVRyBhbmQgY3B1X21pdGlnYXRpb25zX29mZigpIGluIHRo
ZSBzZWxlY3QgZnVuY3Rpb24uDQoNCk5vLCB0aGUgcG9pbnQgb2YgbWRzX3VwZGF0ZV9taXRpZ2F0
aW9uKCkgaXMgdG8gZW5hYmxlIG1kcyBtaXRpZ2F0aW9ucyBpZiBvbmUgb2YgdGhlIG90aGVyIHNp
bWlsYXIgYnVncyAoVEFBL01NSU8vUkZEUykgaXMgYmVpbmcgbWl0aWdhdGVkLg0KDQpTbyBldmVu
IGlmIG1kc19taXRpZ2F0aW9uIHdhcyBNRFNfTUlUSUdBVElPTl9PRkYsIGl0IG1pZ2h0IG5lZWQg
dG8gY2hhbmdlIHRvIHNvbWV0aGluZyBlbHNlIGJlY2F1c2Ugb25lIG9mIHRoZSBvdGhlciBidWdz
IHdhcyBtaXRpZ2F0ZWQuDQoNCj4NCj4gPiArDQo+ID4gKyAgICAgLyogSWYgVEFBLCBNTUlPLCBv
ciBSRkRTIGFyZSBiZWluZyBtaXRpZ2F0ZWQsIE1EUyBnZXRzIG1pdGlnYXRlZA0KPiA+ICsgdG9v
LiAqLw0KPg0KPiBBIHZlcnNpb24gb2YgdGhhdCBjb21tZW50IGlzIGFscmVhZHkgb3ZlciB2ZXJ3
X21pdGlnYXRpb25fc2VsZWN0ZWQncyBkZWZpbml0aW9uLg0KDQpJIGNvdWxkIHJlbW92ZSBpdCBo
ZXJlLCBhbHRob3VnaCBJIHdvbmRlciBpZiBpdCdzIHdvcnRoIGtlZXBpbmcgZ2l2ZW4gdGhlIGNv
bmZ1c2lvbiBhYm92ZS4gIE9yIHBlcmhhcHMgaXQgY2FuIGJlIHJlcGhyYXNlZCB0byBzcGVjaWZp
Y2FsbHkgdGFsayBhYm91dCBob3cgbWRzIGdldHMgbWl0aWdhdGVkIGV2ZW4gaWYgaXQgaGFwcGVu
ZWQgdG8gYmUgZGlzYWJsZWQuDQoNCj4NCj4gPiArICAgICBpZiAodmVyd19taXRpZ2F0aW9uX3Nl
bGVjdGVkKQ0KPiA+ICsgICAgICAgICAgICAgbWRzX21pdGlnYXRpb24gPSBNRFNfTUlUSUdBVElP
Tl9GVUxMOw0KPg0KPiBTbyB3ZSBoYXZlIHRoaXMgaGVyZSBub3c6DQo+DQo+ICAgICAgICAgaWYg
KG1kc19taXRpZ2F0aW9uID09IE1EU19NSVRJR0FUSU9OX09GRikNCj4gICAgICAgICAgICAgICAg
IHJldHVybjsNCj4NCj4gICAgICAgICBpZiAodmVyd19taXRpZ2F0aW9uX3NlbGVjdGVkKQ0KPiAg
ICAgICAgICAgICAgICAgbWRzX21pdGlnYXRpb24gPSBNRFNfTUlUSUdBVElPTl9GVUxMOw0KPg0K
PiBvciB3aGF0IHlvdSBoYXZlOg0KPg0KPiAgICAgICAgIGlmICghYm9vdF9jcHVfaGFzX2J1ZyhY
ODZfQlVHX01EUykgfHwgY3B1X21pdGlnYXRpb25zX29mZigpKQ0KPiAgICAgICAgICAgICAgICAg
cmV0dXJuOw0KPg0KPiAgICAgICAgIC8qIElmIFRBQSwgTU1JTywgb3IgUkZEUyBhcmUgYmVpbmcg
bWl0aWdhdGVkLCBNRFMgZ2V0cyBtaXRpZ2F0ZWQgdG9vLiAqLw0KPiAgICAgICAgIGlmICh2ZXJ3
X21pdGlnYXRpb25fc2VsZWN0ZWQpDQo+ICAgICAgICAgICAgICAgICBtZHNfbWl0aWdhdGlvbiA9
IE1EU19NSVRJR0FUSU9OX0ZVTEw7DQo+DQo+DQo+DQo+IE5vdywgaWYgdGhlIENQVSBpcyBub3Qg
YWZmZWN0ZWQgYnkgTURTLCB0aGlzIHNlY29uZCBicmFuY2ggd29uJ3QgZXZlciBnZXQgc2V0DQo+
IGJlY2F1c2Ugd2Ugd2lsbCByZXR1cm4gZWFybGllci4NCj4NCj4gV2hpY2ggdGhlbiBtZWFucyB0
aGF0ICJJZiBUQUEsIE1NSU8sIG9yIFJGRFMgYXJlIGJlaW5nIG1pdGlnYXRlZCwgTURTIGdldHMN
Cj4gbWl0aWdhdGVkIHRvbyIgaXMgbm90IHJlYWxseSB0cnVlLg0KPg0KPiBJT1csIEknbSB3b25k
ZXJpbmcgaWYgdGhpcyB3b3VsZCBiZSB0aGUgbW9yZSBmaXR0aW5nIG9yZGVyOg0KPg0KPiBzdGF0
aWMgdm9pZCBfX2luaXQgbWRzX3VwZGF0ZV9taXRpZ2F0aW9uKHZvaWQpIHsNCj4gICAgICAgICBp
ZiAodmVyd19taXRpZ2F0aW9uX3NlbGVjdGVkKQ0KPiAgICAgICAgICAgICAgICAgbWRzX21pdGln
YXRpb24gPSBNRFNfTUlUSUdBVElPTl9GVUxMOw0KPg0KPiAgICAgICAgIGlmIChtZHNfbWl0aWdh
dGlvbiA9PSBNRFNfTUlUSUdBVElPTl9PRkYpDQo+ICAgICAgICAgICAgICAgICByZXR1cm47DQo+
DQo+IEkuZS4sIGlmICphbnkqIG1pdGlnYXRpb24gZGlkIHNldCB2ZXJ3X21pdGlnYXRpb25fc2Vs
ZWN0ZWQsIGV2ZW4gaWYgdGhlIENQVSBpcyBub3QNCj4gYWZmZWN0ZWQgYnkgTURTLCBpdCBtdXN0
IHNldCBtZHNfbWl0aWdhdGlvbiB0byBGVUxMIHRvby4NCj4NCj4gSG1tbT8NCj4NCg0KSSdtIG5v
dCBzdXJlIHRoaXMgaXMgcmlnaHQsIGl0IGNlcnRhaW5seSBkaXZlcmdlcyBmcm9tIHVwc3RyZWFt
IHdoZXJlIG1kcyBpcyBvbmx5IG1hcmtlZCBhcyBtaXRpZ2F0ZWQgaWYgdGhlIENQVSBpcyBhY3R1
YWxseSB2dWxuZXJhYmxlIHRvIG1kcy4gIEkgYWxzbyB0aGluayB0aGF0IGltbyBpdCBnZW5lcmFs
bHkgZG9lcyBub3QgbWFrZSBzZW5zZSB0byBtYXJrIGEgYnVnIGFzIG1pdGlnYXRlZCBpZiB0aGUg
Q1BVIGlzbid0IHZ1bG5lcmFibGUgKHNlZW1zIHRvIGluY3JlYXNlIHJpc2sgb2YgZnV0dXJlIGJ1
Z3MgaW4gdGhlIGxvZ2ljKS4NCg0KVGhhbmtzDQotLURhdmlkIEthcGxhbg0KDQo=
