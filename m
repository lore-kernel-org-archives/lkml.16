Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F53626215A
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 19:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739300689; cv=fail; b=kCnW6WXCSONCNiBaKsVqqenJlns01AT+UpNGO84W8iJSAylTWJ9gj7pAAWKHdqyLFYDgwnoGEMfDSI0zHOjDCC02XjuNKjYDerplZ4lW8roG+CS32w3L0SyPNiZxELhyLDUlv7Fnui3tL5gO7wlbjs8Ukr84CfpTVGjI/kJ5SKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739300689; c=relaxed/simple;
	bh=r2abGLNTd50ho8gjmDZdCHIQiqm6xzlKq05aLsx8VyY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JRup5eAxQcD2t8PeNhNDRsJNFDwJDs9avWDTPyDUVDheiHF+QSZA4+83juZGuEq+TxmHVgOveEnqRGAZOU/yAgxmfxmn9PQKkIbj6/I+yFz5rQIKCPp2DpWzfW1jeOM4CGSLIMG06K0sqEaHzWDgtkwANMvvOcmk9I9oJTxAhbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HKrHrd90; arc=fail smtp.client-ip=40.107.244.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HKrHrd90"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tvWeHyYo6VGgqBgmfgUhv1ZaQhZOElLpDRJotLUgIXZPYTSamduejamgnD8OVFu5qZRMN3EfCXPpwKlrombU7oVHH3mEFM9aTmTQgB2Bix/38KkshAU9szNu3LD7uWda6n+hM7yZBqDa7FvOTPZcaRY/Qp6cyiwtYtF4ZAidX0Z3hHkbIWG04pVQ7r8sKG3/oJxLzB2FHq1b5MdgJsVAFbvtlZ8jFb2nuGJTqZI0WZL5rxFfZeQEBo9q5W18KoiGqTlGl8vXr4TsvHueUrmGnWLaL3KJUgfeflhedT6RfeVQNztVq9h6sK41mFGG+j7tnJ5NxotQwHpLRrLNYMUV1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2abGLNTd50ho8gjmDZdCHIQiqm6xzlKq05aLsx8VyY=;
 b=d1ANwhPgZA+vKAWsHvVpKkmRlK4XtSuJbegmYXad7jtsoiG89r04nK7OcBYQ43oRzf1o+aBoQ7v6ITzUaXqAaJvpvKUFdKmnIsLCIM36/9C3b+hxKn+7TX3cPwMSFYXKmRBp0U48tFfHlNoGW26pZxOl09PgEeitDIcnu2LBzRJqAd1yd/btxbs8MHx6fJPZPUqm9dNfxAdC4jh2rB1IPqn1vWyFszcnc2fuSicWyZ5Ox5wYGDRWja4NWx5SwNKmmkiVEWtFintdOYroFXUVj09aWwTOJo+tMTujhSqIH3E9Oiuw4m+jlVJkMww9L7C5NPd/r2/edPSCJoa7iyU7tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2abGLNTd50ho8gjmDZdCHIQiqm6xzlKq05aLsx8VyY=;
 b=HKrHrd90ZBWK0ICfBL31ESSafNf5AjbzPsHQvB50YaE2U6Tdti+K1ivOW7jappc9ZB9bDvfhZzBaqvraNTTlqIkHjbuVHSPe29Ie91wcCalwclYYVy5DGRqNVdMHwmlEWZyPyA1T3Eh1nfUFsS6LfUauDePB99Z5boV8KwmPLtE=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by DM4PR12MB7765.namprd12.prod.outlook.com (2603:10b6:8:113::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 19:04:44 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%4]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 19:04:44 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 21/35] x86/bugs: Determine relevant vulnerabilities
 based on attack vector controls.
Thread-Topic: [PATCH v3 21/35] x86/bugs: Determine relevant vulnerabilities
 based on attack vector controls.
Thread-Index: AQHbfLSQUDPou+7NY0ixBqOC/d0dv7NCczYAgAAAWcA=
Date: Tue, 11 Feb 2025 19:04:44 +0000
Message-ID:
 <LV3PR12MB9265D7BF6446C2D84414E42C94FD2@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-22-david.kaplan@amd.com>
 <20250211184130.2fl4jvdwd4e5y32a@jpoimboe>
 <20250211185400.vwu3tkqr4gc2r5tu@jpoimboe>
In-Reply-To: <20250211185400.vwu3tkqr4gc2r5tu@jpoimboe>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=36c7fc83-bf8f-4f54-b806-3f4cf7c6aaef;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-02-11T18:55:14Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|DM4PR12MB7765:EE_
x-ms-office365-filtering-correlation-id: a1145fb2-134d-49f5-90ec-08dd4acef23e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QldYaDBNSDQ3WWtNaWFHYlFRR3I0OGs4VzFEaWxLTjNuYkpBSUEwaUZ6NU1V?=
 =?utf-8?B?TmQ4T3E4blZuZEViL2dMQmZUU3cwMEFnd2t6ZGJQdHZITkpOeS9GblRYcGox?=
 =?utf-8?B?M3U4Nm15Q1RtWGNBQW81VXF4MndMTUNKbk92K2Vndng3d1I3MzMvODhFenBW?=
 =?utf-8?B?RVdTd0pFN3RRcTB5NG8xanpsYmdWb0lGdGlMRDBUcVVTVnBZSTYyMkduajBq?=
 =?utf-8?B?RURUenpnSDRDaXZJd25sVEsxYXpGVE9sWlNseHNGdXFmbnEyV010c00wMXhi?=
 =?utf-8?B?L08vb2p0cGs4TFFycjM2ZWNXcktTQnU2TjNFNjFuYTZHbUs5WXVySk5OYnhr?=
 =?utf-8?B?R0FnTUVDcDF2VEY5OVVvc0JLMXlJNkozN0NaWXcxdHBoSS92Vk5WWkQ2LzJa?=
 =?utf-8?B?SCtMYUJWZ3NXMWF4OXU1U0ptWFVURkhRYlBlYmZpaEU3SjRxZ0FQdE5XRU4v?=
 =?utf-8?B?Q2VXSEpTTC8yNTJzVmxjR3o0d09XZm91WG1KejVTTVppelZsODBSTmZMN1Q2?=
 =?utf-8?B?SmdyUlpmcTA5SmF0eWV3Mnp3NWlzMStSRFdBdmJDSDdLcVNDSS81blROdnV0?=
 =?utf-8?B?RnE3NTAxU2lxRHBBdlVVSGltVW1kTkFQdjY4bUJISE05L3pUbXNzcDAyWlhD?=
 =?utf-8?B?MzBHdGY1QkdtOEpBVVdGNkZpNEUzSVpWcCt2T084RHZYQUlucW1GbGF4WVdL?=
 =?utf-8?B?b3l1c2hyUHhIdkcxaDFYckVUN2hZL2EwWmp2TndMR0J6SFBmc0ZlTDBlTjJY?=
 =?utf-8?B?bFJsVlFIVHFDZ1M2VHpWYk5VbUZnaXJuUi9ERGhuQktBY043RTIwcmZCMlls?=
 =?utf-8?B?UlM2VUtoNGhtNnhrSTd4YVJabVNJa1YvZWNUQkJaZHBvakdSam0zRWFrK0Ew?=
 =?utf-8?B?MkpwTEZoQzBuU3JyaFhxQTVldFNRcHBoTnpPL1hXK3JBcG4xdGFySCt2Ymdn?=
 =?utf-8?B?SFdCZitJa212SzVmREJKd3BVR2xkQ2ZRSnk5cjRjVk13eGZJcmFVVi9mU1ZI?=
 =?utf-8?B?RCtqS3NBWmhrRFZxVTNFRDlGWGJZWTV3WmxidEc4THJsVFBtQklWVm5xUG9a?=
 =?utf-8?B?OTJDQVhUOHh5dGZ3OXg2V0dFQ3h6RHhGc2Vpem5tWXJTWmsxZHRpWlNQcm5o?=
 =?utf-8?B?NGx3d1dybk5xVHhyK1M2ZTFPaU5JNXBKZTREVWdrYU42ZmFWVVhobGU5eUxr?=
 =?utf-8?B?UUYzNnZwZDBwOVR5TXpDNmFkMW1pdWxmVFNDTDlKQW5hSnpOZTVoeVhQQUtU?=
 =?utf-8?B?NFhwNVJ4bmxkUlVwZ3k3am53eXA1WmxJcFJaVnZrbzFLR2R1U1Rlc3huZklN?=
 =?utf-8?B?bHRlN2NnTUpVZE9xR1duWEg2ZW50eUJQbzQrTVJLeUFraVViMEVVaktSb1hR?=
 =?utf-8?B?VHJtQTV2U25uUENCTjZidWZaOFU0V2piVThNVy9GcElNUXh6Q3REL2Q1WmZo?=
 =?utf-8?B?c2VKMlhUUlVoT1RnbndvTisvbXJ5T3NnL1JwOVpsdjBhZEYrQVdtWFRPUGQ0?=
 =?utf-8?B?OXdwRG9OZCtQUFJHTlpaZ0Q0bUtPN1pReHJGUk1UZHJqc282RjJJMTB2Y01z?=
 =?utf-8?B?YnVrMFpGSlFld21sQmxGYkQ1TnBpNmlid0RUYndhL2tBZHFFcjVySGgwT0Nq?=
 =?utf-8?B?OUhobStHVHU3bjdaUDFTeHBMaDV3amU4eDc1UVVxM1VKaGliK0o0Rm1pdVpn?=
 =?utf-8?B?TEF5RjRFaVdCMWp6OURsanJKemZyRy81L1Nndm5IeDNZS0xtWU5BWDlYc21z?=
 =?utf-8?B?cjZNVml0YWdiQWJQQW1ob2E4NTFjQUtQWHMway95MnBFNHc3eXR2aEtxVXp6?=
 =?utf-8?B?N25JOEtOZ1Z3bzdSZE52bmVyUzU0U3NkMkNmalJFTHRoeURySUZab0lYVXdD?=
 =?utf-8?B?ZFNFTTVaZ0tZcFhaWGpvMXMvY0NqajYxUW5uSHh0ZVRFY3ZWcGxGVDV1c0dl?=
 =?utf-8?Q?PMRzHobzNc6Z0Vt7F9uHWKL2ZetvEuLQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T2lhUlA2WDVHREtkQ2hVTG15TURIcGhscHZ0Y2FmNjVHNmNlZUhpTm5DbUhH?=
 =?utf-8?B?N29ySlFrK3Q3eUN0UndzakovRXN6UXNXYWpjOWltdUdnaE1LM1l4UTVmZitr?=
 =?utf-8?B?cFhhOHhkL0N1ZnIxc0V2c2JtOW9EVXlvd21PM3VyUzU0M3hrd1N4d0MyQ0Ni?=
 =?utf-8?B?eGp6MnZKOHJHcFFpbTk3aGg2OTVpQTFYclo2SjBETXBsamhFSGdPODY2OS9q?=
 =?utf-8?B?K0tyZGRCY0c1ZExDaGdlMDBzZjEvVUdKVTQwNXBjSmZyTkNiYU8rUHZ5ZG43?=
 =?utf-8?B?OFZPNzZUUng5THdWZyt3Zkt0aTQ5cVpBMVJsTTB1cFIvZGhjS0RPZUs5aTFE?=
 =?utf-8?B?cjBXRENsUnJoNVJPaXZ1V1BYMUYwUnRwcy9MUE1oOFJQZnlOa01xemRPaXdw?=
 =?utf-8?B?QTFqcld3RXZZaWRub2gxbFRxU3EybXFjUUxPQi9XSUpIMnB3MjVqd1BrNHk5?=
 =?utf-8?B?aTd2MTc5R0ZTaklDc0ovRVdDOVg3NHBFazN3NnJrVVY4TFlUenp0dWVlZG9N?=
 =?utf-8?B?TE5EUVI0N29VeVplVGpPcTBnbXAveklXWnRlZ1hkdEFINHBlRWh1SEVrWitp?=
 =?utf-8?B?ZEVKZVJWSEE0RWJkZjRVclVocXlYVnFCZUxlODdwWGxJYU1RalBydFNQc01L?=
 =?utf-8?B?dTRuQWE3b25pTFhHZkN3ZGNJdWNrdnBETXdkbXVJWkxzWFZ2VWszYkR5bVZj?=
 =?utf-8?B?VCtlZ3ZqemI5cWJXaGZ1TWpVcmVJcTNiOWgweExpRngzcGZacm9NdjVrQ0hv?=
 =?utf-8?B?aFQwb2RsV1E0N1BKUCtYdWxCZjBjVzVncG8yUytnMU5LcmZVa0hOTXhTd3gr?=
 =?utf-8?B?anBxRDlxRGxsT3pBSmZFWGlQRTd4cHVaazVxYjBia3h1aFRpZllERXBHMDFv?=
 =?utf-8?B?Ky9WUVIzQVpQR3ZnR1pEOWs4ejZXNEcvazk5ekhKMVV4bU5mSGYweUU0RTBD?=
 =?utf-8?B?bXFQai9tdGNwVmZVVkswOWF1Ym55eG9wdHZ0Z1NvNGYrd0VhdVZPK25YUkdv?=
 =?utf-8?B?K2Qwd1YxaEFLTUVILzF2T055bWxQdzYySkpRVHgzaEdlVFVvZUZrWVgxdTBY?=
 =?utf-8?B?NXZpOEZRSEcxdFJZaFFTZlhhbCt4OU1FQ3lENWVxeVdPK3c0S29lNnRTWnJz?=
 =?utf-8?B?aC9qVWlXMnRtUVloRFk3UjN6WjNwUDBwcXk3UFFleFRETzJqSHBSeEQ0Q004?=
 =?utf-8?B?Skh5WlVYdndrVWE5RU1XdGxnQjk2Q1FXYzNVZjJQc3M0YkU0b1p4L1l6ZHFv?=
 =?utf-8?B?eHpvTVVVcWRKQnBSaVFWVll2VFN6VXY0T1owek5iQS9HKzVOS0lHS0duWWky?=
 =?utf-8?B?ZkdrTGFOMlh3VEF0b3pSVCtUL3VvMGJYTEVacWY4SXlrVmUrR2J0ME9KUWh3?=
 =?utf-8?B?ZVc2YzBxeTRrZEpEZ0Z6ZTZ3YzZDWkpzQlBybUhjbElWK1dVWkdlTXJIdlJ2?=
 =?utf-8?B?ZzFsRzZNZzFEazhsemMxWWRudmYrMDN1bGt3aFF1enR0YjlucHoyZ1hQSEV3?=
 =?utf-8?B?VkpMbWVLRUszQXFnblMvS0VsbmRFQUE2ODlKSGdnZTBpUVBsKy9XaHlvMVlz?=
 =?utf-8?B?UjlTVU4wT0cxS1o3UWEwQ0VNb2tQM3BvZkhBY2ZsbTJJOStETDhoa1U3K2Jk?=
 =?utf-8?B?Wm8wTjNmcHl6c1E1QVFHc3VGLzRobnJBUHBKdTF1aFMxTUF4bjFlVlZ6NDBt?=
 =?utf-8?B?bHdFNWt3NFk5ZnMrNGhlRkE5c3U4VkJsY1VDZWZLYnRnUjJkQkI5RkVOcC8r?=
 =?utf-8?B?a21zdUhNLy95bXdURURCRjFIKzU0MnV1UzBibWRuY2ZIR2FsVVdLRE0zT3dY?=
 =?utf-8?B?dGVaV2NIQktYaGR0SXVYNFFiTUpDTWtlZjJYL2pFWVBPUSs2QTU3Tit5VzRF?=
 =?utf-8?B?SzJLVlZwYVJQbFZGd1pYaHBsNFU2UHlVR21TT1A4WFdVdXExSTRTWVNnNU93?=
 =?utf-8?B?bklqb0ZSK2liWTdaMUJrUTlqeUczZUtCNEtNWmpaZU5SMElaaWF6cnVFZjlT?=
 =?utf-8?B?c2lValNCemRxckEvQ3RPVThzeUxVVldlb29Ec0JxbHJTRjlFcERpOEk5OUJ1?=
 =?utf-8?B?VkhTVUY1dXQzc1cwem1RcFVUM1ZiQjIyR0Y4UG1DaGcrYUtEWWNGNE53cmdk?=
 =?utf-8?Q?5g5g=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a1145fb2-134d-49f5-90ec-08dd4acef23e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 19:04:44.3814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pdeGqC4ECzdU5T+R15qtX0pvwrA3ZwvGAIhuhWtMnsIkil+nyHmiibqqNQ/P8eZe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7765

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb3NoIFBvaW1ib2V1ZiA8
anBvaW1ib2VAa2VybmVsLm9yZz4NCj4gU2VudDogVHVlc2RheSwgRmVicnVhcnkgMTEsIDIwMjUg
MTI6NTQgUE0NCj4gVG86IEthcGxhbiwgRGF2aWQgPERhdmlkLkthcGxhbkBhbWQuY29tPg0KPiBD
YzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+OyBCb3Jpc2xhdiBQZXRrb3Yg
PGJwQGFsaWVuOC5kZT47IFBldGVyDQo+IFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz47
IFBhd2FuIEd1cHRhDQo+IDxwYXdhbi5rdW1hci5ndXB0YUBsaW51eC5pbnRlbC5jb20+OyBJbmdv
IE1vbG5hciA8bWluZ29AcmVkaGF0LmNvbT47IERhdmUNCj4gSGFuc2VuIDxkYXZlLmhhbnNlbkBs
aW51eC5pbnRlbC5jb20+OyB4ODZAa2VybmVsLm9yZzsgSCAuIFBldGVyIEFudmluDQo+IDxocGFA
enl0b3IuY29tPjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHYzIDIxLzM1XSB4ODYvYnVnczogRGV0ZXJtaW5lIHJlbGV2YW50IHZ1bG5lcmFiaWxp
dGllcyBiYXNlZA0KPiBvbiBhdHRhY2sgdmVjdG9yIGNvbnRyb2xzLg0KPg0KPiBDYXV0aW9uOiBU
aGlzIG1lc3NhZ2Ugb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gVXNlIHByb3Bl
ciBjYXV0aW9uDQo+IHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcgbGlua3MsIG9y
IHJlc3BvbmRpbmcuDQo+DQo+DQo+IE9uIFR1ZSwgRmViIDExLCAyMDI1IGF0IDEwOjQxOjMzQU0g
LTA4MDAsIEpvc2ggUG9pbWJvZXVmIHdyb3RlOg0KPiA+IEknbSBjb25mdXNlZCBieSBDUFVfTUlU
SUdBVEVfQ1JPU1NfVEhSRUFEIGhlcmUsIGFzIHRoZSBHRFMNCj4gbWl0aWdhdGlvbg0KPiA+IGRv
ZXNuJ3Qgc2VlbSB0byBkaXNhYmxlIFNNVD8NCj4gPg0KPiA+IEFtIEkganVzdCBjb21wbGV0ZWx5
IG1pc3VuZGVyc3RhbmRpbmcgdGhlIG1lYW5pbmcgb2YNCj4gPiBDUFVfTUlUSUdBVEVfQ1JPU1Nf
VEhSRUFEPw0KPiA+DQo+ID4gSSBhc3N1bWVkIGl0J3Mgbm90IGEgdmVjdG9yIHBlciBzZSwgYnV0
IHJhdGhlciBpdCBtZWFucyB0byBmb3JjZSBub3NtdA0KPiA+IGlmIG9uZSBvZiB0aGUgb3RoZXIg
ZW5hYmxlZCBtaXRpZ2F0aW9ucyByZXF1aXJlcyBkb2luZyBzbyBmb3IgaXRzICJmdWxsIg0KPiA+
IG1pdGlnYXRpb24uICBCdXQgdGhlIGltcGxlbWVudGF0aW9uIGRvZXNuJ3Qgc2VlbSB0byBtYXRj
aCB0aGF0Lg0KPiA+DQo+ID4gT24gdGhlIG90aGVyIGhhbmQgaWYgaXQgcmVhbGx5IGlzIGNvbnNp
ZGVyZWQgdG8gYmUgaXRzIG93biB2ZWN0b3IsDQo+ID4gdGhhdCBkb2Vzbid0IG1ha2Ugc2Vuc2Ug
ZWl0aGVyLCBhcyAiY3Jvc3MtdGhyZWFkIGF0dGFjayIgaXMgcmVhbGx5IGENCj4gPiBzdWJzZXQg
b2YgZWFjaCBvZiB0aGUgb3RoZXIgdmVjdG9ycy4gIEZvciBleGFtcGxlLCBhIHVzZXItPmtlcm5l
bA0KPiA+IGF0dGFjayBjYW4gb2Z0ZW4gYmUgZG9uZSBlaXRoZXIgdmlhIHN5c2NhbGwvaXJxIG9y
IHZpYSBjcm9zcy10aHJlYWQuDQo+ID4NCj4gPiBTbyBJJ20gcmVhbGx5IGNvbmZ1c2VkLiAgQW0g
SSBtaXNzaW5nIHNvbWV0aGluZz8NCj4NCj4gU28gSSBsb29rZWQgYXQgdGhlIG5leHQgcGF0Y2gg
YW5kIG5vdyBJIHNlZSB3aGF0IEkgd2FzIG1pc3Npbmc6IHRoZSBpbmRpdmlkdWFsDQo+IG1pdGln
YXRpb25zIGFyZSBjaGVja2luZw0KPiBjcHVfbWl0aWdhdGVfYXR0YWNrX3ZlY3RvcihDUFVfTUlU
SUdBVEVfQ1JPU1NfVEhSRUFEKSBiZWZvcmUgZGVjaWRpbmcNCj4gd2hldGhlciB0byBkaXNhYmxl
IFNNVC4gIFNvIHRoZSBpbXBsZW1lbnRhdGlvbiBtb3N0bHkgbWFrZXMgc2Vuc2Ugbm93Lg0KPg0K
PiBzaG91bGRfbWl0aWdhdGVfdnVsbigpIHNob3VsZCBoYXZlIGEgY29tbWVudCBhdCB0aGUgdG9w
IGV4cGxhaW5pbmcgdGhhdCBpdCBkb2Vzbid0DQo+IGNoZWNrIENQVV9NSVRJR0FURV9DUk9TU19U
SFJFQUQgKHNpbmNlIGl0J3Mgbm90IGFjdHVhbGx5IGEgc3RhbmRhbG9uZQ0KPiB2ZWN0b3IgYnV0
IHJhdGhlciBkZXBlbmRlbnQgb24gdGhlIG90aGVycykgYW5kIHRoYXQgZWFjaCBpbmRpdmlkdWFs
IG1pdGlnYXRpb24gc2hvdWxkDQo+IGNoZWNrIENQVV9NSVRJR0FURV9DUk9TU19USFJFQUQgd2hl
biBkZWNpZGluZyB3aGV0aGVyIHRvIGRpc2FibGUgU01ULg0KPg0KPiBBbHNvLCBjaGVja2luZyBD
UFVfTUlUSUdBVEVfQ1JPU1NfVEhSRUFEIGZvciBHRFMgZG9lc24ndCBtYWtlIHNlbnNlDQo+IGJl
Y2F1c2UgYXMgSSBtZW50aW9uZWQgYWJvdmUsICJjcm9zcy10aHJlYWQiIGlzIHJlYWxseSBhIHN1
YnNldCBvZiB0aGUgb3RoZXINCj4gdmVjdG9ycy4gIElmIHRoZSB1c2VyIGlzbid0IGNvbmNlcm5l
ZCBhYm91dCBhbnkgb2YgdGhlIG90aGVyIGF0dGFjayB2ZWN0b3JzLA0KPiBtaXRpZ2F0ZV9jcm9z
c190aHJlYWQ9b24gc2hvdWxkIGp1c3QgYmUgaWdub3JlZC4NCj4NCj4gSSdtIGFsc28gdGhpbmtp
bmcgdGhhdCAibWl0aWdhdGVfY3Jvc3NfdGhyZWFkIiBpc24ndCBxdWl0ZSB0aGUgcmlnaHQgbmFt
ZSBmb3IgaXQsIGFzIGl0DQo+IHJlYWxseSBvbmx5IHJlbGF0ZXMgdG8gZGlzYWJsaW5nIFNNVCBy
YXRoZXIgdGhhbiBvdGhlciBjcm9zcy10aHJlYWQgbWl0aWdhdGlvbnMgbGlrZQ0KPiBTVElCUC4N
Cj4NCj4gU28gIm1pdGlnYXRlX2Rpc2FibGVfc210IiBvciAibWl0aWdhdGVfbm9zbXQiPw0KDQpJ
J20gZ2xhZCB0aGUgbmV4dCBwYXRjaCBoZWxwZWQsIEkgY2FuIGNlcnRhaW5seSBhZGQgYSBjb21t
ZW50IHRvIGhlbHAuICBBcyB5b3Ugbm90ZWQsIHNob3VsZF9taXRpZ2F0ZV92dWxuKCkgaXMgbm90
IHRoZSBvbmx5IGZ1bmN0aW9uIHRoYXQgZGV0ZXJtaW5lcyBtaXRpZ2F0aW9ucy4NCg0KVG8gZXhw
bGFpbiBteSB0aGlua2luZyBhIGJpdCBtb3JlLCBtaXRpZ2F0ZV9jcm9zc190aHJlYWQgaXMgaW50
ZW5kZWQgdG8gZW5hYmxlIGNyb3NzLXRocmVhZCBtaXRpZ2F0aW9ucyBmb3IgYW55IHZ1bG5lcmFi
aWxpdGllcyB0aGUgaGFyZHdhcmUgbWF5IGhhdmUuICBUaGF0IGRvZXMgbm90IG5lY2Vzc2FyaWx5
IHJlcXVpcmUgZGlzYWJsaW5nIFNNVC4gIFRoZSByZXF1aXJlZCBjcm9zcy10aHJlYWQgbWl0aWdh
dGlvbiBpcyBkZWZpbmVkIGJ5IGVhY2ggdnVsbmVyYWJpbGl0eS4NCg0KRm9yIG1hbnkgdnVsbmVy
YWJpbGl0aWVzIChsaWtlIE1EUyksIG1pdGlnYXRpb24gcmVxdWlyZXMgZGlzYWJsaW5nIFNNVC4g
IG1kc19hcHBseV9taXRpZ2F0aW9uKCkgcXVlcmllcyB0aGUgc3RhdHVzIG9mIHRoZSBjcm9zcy10
aHJlYWQgYXR0YWNrIHZlY3RvciBhbmQgd2lsbCBkaXNhYmxlIFNNVCBpZiBuZWVkZWQuDQoNCkZv
ciBHRFMsIG1pdGlnYXRpbmcgY3Jvc3MtdGhyZWFkIGF0dGFja3MgZG9lcyBub3QgcmVxdWlyZSBk
aXNhYmxpbmcgU01ULCBqdXN0IGVuYWJsaW5nIHRoZSBtaXRpZ2F0aW9uIGluIHRoZSBNU1IuDQoN
ClRvIGJlIGZhaXIsIGl0IGRvZXNuJ3QgbWFrZSBtdWNoIHNlbnNlIHRvIGRpc2FibGUgYWxsIHRo
ZSBhdHRhY2sgdmVjdG9ycyBleGNlcHQgbWl0aWdhdGVfY3Jvc3NfdGhyZWFkLCBidXQgZm9yIGNv
cnJlY3RuZXNzIGl0IHNlZW1lZCBsaWtlIGVuYWJsaW5nIHRoZSBtaXRpZ2F0aW9uIGluIHRoaXMg
Y2FzZSB3YXMgdGhlIHJpZ2h0IHRoaW5nLg0KDQpJIGRvbid0IHJlYWxseSB3YW50IHRvIHRpZSBt
aXRpZ2F0ZV9jcm9zc190aHJlYWQgdG8gU01UIGRpc2FibGUgYmVjYXVzZSBvZiBjYXNlcyBsaWtl
IHRoaXMgd2hlcmUgdGhlcmUgaXMgYSBjcm9zcy10aHJlYWQgYXR0YWNrIG1pdGlnYXRpb24gdGhh
dCBpcyBkaWZmZXJlbnQgZnJvbSBkaXNhYmxpbmcgU01ULiAgWW91IGNvdWxkIGFsc28gaW1hZ2lu
ZSBidWdzIHRoYXQgbWlnaHQgYmUgZXZlbiBtb3JlIGxpbWl0ZWQsIHdoZXJlIHBlcmhhcHMgdGhl
eSdyZSBvbmx5IHJlbGV2YW50IGZvciBzYXkgdXNlci0+a2VybmVsIGJ1dCBhbHNvIGhhdmUgYSBj
cm9zcy10aHJlYWQgY29tcG9uZW50Lg0KDQpTVElCUCBpcyBhbm90aGVyIGNhc2Ugd2hlcmUgdGhl
cmUgaXMgYSBjcm9zcy10aHJlYWQgbWl0aWdhdGlvbiB0aGF0IGlzIG5vdCBkaXNhYmxpbmcgU01U
IChidXQgdGhpcyBvbmUgaXMgaGFyZGVyIHRvIGRlYWwgd2l0aCBnaXZlbiB0aGUgaGlzdG9yaWNh
bCBwcmVjZWRlbnQgYXMgbm90ZWQgaW4gdGhlIG90aGVyIGVtYWlsKS4gIEJ1dCB0aGUgcG9pbnQg
aXMgdGhhdCB0aGVyZSBoYXZlIGJlZW4gY2FzZXMgd2hlcmUgY3Jvc3MtdGhyZWFkIG1pdGlnYXRp
b24gIT0gZGlzYWJsZSBTTVQuDQoNCi0tRGF2aWQgS2FwbGFuDQo=
