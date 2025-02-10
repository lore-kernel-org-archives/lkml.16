Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A5925334A
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 22:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739226788; cv=fail; b=ZsSCHzXUR1bl5sUy5KVKzFpku6EStyjHopy5Eih7UHd9j2g1mYmBzzvHQF6/+Y46f4Vc0VhY73Pro7KcXKjquzsad8x6mRdQquPwm++DalL6VO0XxC+0IuJsGEGNujboCooPxueekZMRMQ45acVgjQBzmyAnbERuRuSDzTAoElQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739226788; c=relaxed/simple;
	bh=ZCzWljdr05n53b9YZB/hKPxLw/hLQt/WM13UboH3SEs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dd9QTxffQe9XI+r6vGLcEqXDcOrenuZB94ONKfwdtJQFwKHDjlKoV7YGNngMCGxZ42eYAiwGqCG+sPqF3hjeJ03FKeoMYo6cCYFuEPQZ5YHsaJtPFToU+Aq2lRFL0WRQMCuxVMhOsn8MWiqnfCsTOXkKJwHSmisMZZrMG790GXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KbWyCfNF; arc=fail smtp.client-ip=40.107.237.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KbWyCfNF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecknjQ61SGOatA5yaSl+CxRf6i34N8tN/wCukGFKPHjncyxswiWROsEPCMFU36PMHJOgAHtvAJv27Pwao+qRhZOPoUh+yHKGMrlkV6auUlsIAcYUSK27Uh0lI7ecY4XeXWk4Y5Hm7gZcrDik8PfM52COGLSeZsEO8aQhNh8MK+VcxLbpumS53rbWQy3qBCUX07hyP2GQQCUQnUgdgxqL0IHBiTAZ0GOmRh6UBOj2WgEM3g2rrZqoy6z6MlAWfsTkn79+ugt7T1KbxCxBysZq1CmuufeYy3wRWPf0R2dWIZpv7IkumQNZzg3X2vYnnVow1uUK/Hb/jEQlEWiRjm+2bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCzWljdr05n53b9YZB/hKPxLw/hLQt/WM13UboH3SEs=;
 b=P6iUx+d+Q93iMYVmfkb/aKE3P7lr6KiQj62lBsnIezDv0wv/VBvnklcs+Ms72a7nJjBtUpVmkPRLUWQ1AotaI6aGIDCK8h8RfmsEBSrmQQCG/yP/f0cQyHAZIXhNrg2QjHyEIc+WvBL0alNJncnL/DXrKHZA6IdVXo3T/m/OMeqDs3EzC73VPuS6a2MUnlV7tXTpcNyawBGRyuPzRds32nx7kuUyf4feBcsCVr3XjP0hIVC6hU1HzRCDoT2c4m8vFh0uzf74m8N8mDEJrrtslNeAjBTFowprcqfwLeM70JuSmPL96hqG5yuy4b/H8Hwtma2wghM13GtwWfTd6a1RJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCzWljdr05n53b9YZB/hKPxLw/hLQt/WM13UboH3SEs=;
 b=KbWyCfNFQyLqILhdREEb/Mi9bVres8tzjCKFWkI0UrNavLrnvIY3rXYZ4Gfs6ZdmEpMgtA4rJ3XMegpLmoG1pT13ocHiMMkTpLdXsMNL3hB3c9Y/6ASkWuxipAbRrJ4Sfitdi+09gr9ok22+HeSFmZETQ1JsdW2dStszazrtmaA=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by BL4PR12MB9479.namprd12.prod.outlook.com (2603:10b6:208:58e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 22:33:03 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 22:33:03 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 04/35] x86/bugs: Restructure mds mitigation
Thread-Topic: [PATCH v3 04/35] x86/bugs: Restructure mds mitigation
Thread-Index: AQHbfAqjkG1dok2MH0+eqOx6/0d3tLNBHrcQ
Date: Mon, 10 Feb 2025 22:33:03 +0000
Message-ID:
 <LV3PR12MB92655C851F23DC73AEC50B9E94F22@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-5-david.kaplan@amd.com>
 <20250210222508.4ezkw4g33i4j42u7@jpoimboe>
In-Reply-To: <20250210222508.4ezkw4g33i4j42u7@jpoimboe>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=23fbf86a-3be8-4e65-b420-1cbdac116a6d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-02-10T22:30:33Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|BL4PR12MB9479:EE_
x-ms-office365-filtering-correlation-id: 2c94937e-86da-4c0f-f42e-08dd4a22e1ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L1crWlZWbVBsNi9HZmJlT0YwMjNMZ0g2OGF4MkNiQkFXL094ajhBd3dpSms1?=
 =?utf-8?B?NmU5ZURpamp2enR2L3M0Um9yWmxxT1Y3THdnN3VGTVpnVUdWT1JRTXJPTTY0?=
 =?utf-8?B?Ymp0MDc3UDJVWkpzRDg0RU8zdUVTUkxUckowM0lJWi94UjRtNEpzS24zT1Vq?=
 =?utf-8?B?aW1XeE1Ma3A2V2hLaW56Y2NoL1pIOGVxeW1nWlVBTWZCMlAycldsazVCQTRq?=
 =?utf-8?B?Um9rYlgrdVZ4VlFiWFgvS1hPV3dHVmhYSWVUVzgvNHpobStGaFp3UUJBUnZp?=
 =?utf-8?B?QXNycWFWaGQvTzcvR1ZXWk9vdERsZTJsV0tuamdHZk43T2t6VXBjdlVjM3Zw?=
 =?utf-8?B?MFF1bnlGSEpaV2JpTHhva3ByWjk4WGJMZXFOektOWUxTOWk2R1dzcEJUZDBw?=
 =?utf-8?B?S2t1d2Nlc2k4bWZPTEpNU05Vc3Q4TGpUT2cwR3NvcWlsazZEeXU4U3Y5Vkd3?=
 =?utf-8?B?c1lKRU04ako0ODBwVFBSdktnL2s5WGMvNnBNZXJJcDBFc2pmMWJUSm9aY3li?=
 =?utf-8?B?SFRnbVAvQ05pdHFyWnBvUWJnTFQ4L2tQbzgrYTVHWEFjSUVJeDZDOHJXNXdX?=
 =?utf-8?B?ZWtsQmxsQnM4V3NiKzBvMC95dEtuZFNsL0psQk1MTlRxOVlkRE9wWjVoUERM?=
 =?utf-8?B?YWZPYkhsK2l5RU0ybFE3aVVTakZqeldZa2pKWnNFanZqczFBVWFsdFpIL0R5?=
 =?utf-8?B?WkZaN1lrTzFyem9aQ2JHcWRjcmRZTEVCZ01pUGFQVE8yaTRzNEtrVFZBc2NK?=
 =?utf-8?B?bjg3anNEZHVOUHFBcndYZmY1elVSVU9RekUrSmZhWTFzUGsrWThQTHVvdlZh?=
 =?utf-8?B?QzVQTDJyczdTUXQwNGpselpyazRxZ3Q2Um5EdWlNbmdJL1RKYWlDakdzQ0Rr?=
 =?utf-8?B?Wk9CSjhJd2dJUnd6TkRzbXVGS3BGQW1NUlQraTNwQ3VpSUYrZ1FOa1ZPMlRF?=
 =?utf-8?B?WjdQalhoempZYTB4SytaR3ljS2NZbVZiNndObnhZNThONitmZGVqZnNRUG1H?=
 =?utf-8?B?V0Npem5YNGhRVWZaeFRYblkrVWlTakpTaDF0TEo3TjZtQ2RBbU9HbjkvK2ZW?=
 =?utf-8?B?ekY5N1ZlcUFybnl1THBlc1RPME1RQzZwS2RSbXBpc1JGMDZJdFBPSjkwQit0?=
 =?utf-8?B?Zlk3WG5uNUFpeVFWcnpKUTByeGRIam03UU5COXp0T3ovMVVpNlhiV0N1MHkx?=
 =?utf-8?B?TzRzbGIxbWRmeWEzdmZxTkZnSXQwZlVyRys1NTYvSGNlUWpDZDJHYmI0Nitw?=
 =?utf-8?B?MVNmRnQraTZ1ZHFlK29oTTh5aGpVK1l3cUd2Wko3WE5lUFRYQkpzbWxGUnZR?=
 =?utf-8?B?VUVWM1kyUE8xRzlOd2dlcDlUMWVWSTBuYjB1VGRCMmFxcDVBMzlZOFIyR2px?=
 =?utf-8?B?M2JsYUdWZEZXcURxUHIreWRRNU5SNXBvRDFRR1lJdlVyNTVRTFhVenJJVkpE?=
 =?utf-8?B?ZEZoS2Qyb0tsRVBldCtpekV2N1lOVGRuVit2bEdTNE5FKzlrQlZRTUM5dlN5?=
 =?utf-8?B?NC90K1FKTEtPVXBpTlZTalFBRW8rc2htc3k2K2pBNHd2cEt2TlAzZVJYbU1B?=
 =?utf-8?B?dXBodGVBT0RaWFlZS1BobHNVZXh2UXlvTC9TQ0dwWUJZOUNNdTRFdGFwRzhH?=
 =?utf-8?B?eGlTa1pRMUFkQmxaM2x6ZE1iYW9yTENhVnNvUWRrbzFEL0ZxZi8rQk9MUktx?=
 =?utf-8?B?QVIyZlRzVmN2ZmRlQWdDdlBiRDNYcVJBNTI4c09xS3lEYkdwM3owcmZ5b2ts?=
 =?utf-8?B?bVNyN1NydWdjZ01jTDJjV2E3aVl1cEtsdjNFSTB3MnROaEtCeXNHZkFONG0x?=
 =?utf-8?B?QThJUDd2cXNocHM5M1prMVExRWZiNjJLazZwSHZ6UFVOM29JLy9FdktTZVd5?=
 =?utf-8?B?Ti9lT3NteUtBZU04dzREMERJNWpOMmplanFFblB0RXMxRS9JQVFqcnJCMmhU?=
 =?utf-8?Q?IE/HUddRuQO4ok/ji1u3L1qDyQ+N+eg3?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UUJyeXBrSlJwM2h5UGJDTGtsVWVuVnp0LzB5MzhkekdYRkxidGtOT1F4d0FT?=
 =?utf-8?B?TWYrMnA3cEROdEszcWl3RnJER0pWMWRuejJBWlJLWWdQaTZ6cWNsRTN4ckUz?=
 =?utf-8?B?bkVSNzB4YkJRU0x6Zmlra1d5NjNzZ1hxUlgxdzRUYWFwUDhPczFhZUlNVUF0?=
 =?utf-8?B?M1NGMG9jWm4zdnVLcHgyS3NYU2VRRUpWS1RibjNpWUZzakFrMDJlYU1tUGcw?=
 =?utf-8?B?djhpNjNmT0JyWnBXMGU3R3gxbXFoektKSFlRQkczWmFUQUpvR1B0YVlFU1NS?=
 =?utf-8?B?eE9JcGNlSkFmYm5RY21MVkZnRHJCM0huUVYvb2dhdVVXT1c4U2FqOXV3bFhO?=
 =?utf-8?B?MHBkdEhnNjRLTmJlWjFna2ZnQVRXNWlITEZ3UW9FNnUvcFdzbGk4QWl4Zlkz?=
 =?utf-8?B?cWNhU05qQWRCemZzSVZaejdoWGVFY1lEaWl3azZLZnE1RUp0Ukx0WUlEZXRm?=
 =?utf-8?B?K2U4ak9ERHM3cERrVXNxUVNoNUF0OVlyYkJxektkZkZtak05NGllT1lSeWFj?=
 =?utf-8?B?R3JrcnE5MkNqMDArclNja01McTBsMUhqUzN6L0hYOFNMZ1VwazQrU2dJLzcv?=
 =?utf-8?B?cUlWYjRYdVdFR0MrQjRDR3l2KzlOTHZnVFBDalh1MTBTdXkyWVBKcFZJM2Iw?=
 =?utf-8?B?NkN1MzZNNlpWSGFLemxCcTNkci9VSnJZOUQrcTRtWVRXV1p1NUxQbmFGV2g1?=
 =?utf-8?B?TGIramV5MU9lTzF5WTUybjVqYkN1bTRlQWYvS3NCNW5PTERRY0NrK3VyREVK?=
 =?utf-8?B?WHpyVnllckMzZXdKYjdHSGxwS2Nsbk9xZ2Q0K1g5Q0IybkpiWjlpaEVIM3dY?=
 =?utf-8?B?YnAyZVFza0xUcXNtaEQ0Q2VIbjQ0eXBEUXl2dWVTVzlTcHFpSldpYndmclJl?=
 =?utf-8?B?ZUc1ZlAxUEgyeUc5M2RySm9MR2diYnBFQW4wSitYbjVPa09KYXlJT2U1MnBL?=
 =?utf-8?B?N2tvdWV0Nys4WGxNNXRSMGNnMEVvWkdha2pxbXhVTWpncHY5V25SRzZwb1N0?=
 =?utf-8?B?T1VhZ3E2VGMrR01kNlR0cnN3Tyt5ZXAzaGtCdHVJcDh5WnQ0S2k1OEl2L1F4?=
 =?utf-8?B?cjFCMFhML3hnbjFxSGcyVkg2NndzdlIrOE1CdzFNUU1ybWhWRGlzWCtQMTh5?=
 =?utf-8?B?Ni9DUHVLSGtGSC8yOWJIVnRkd2NrNjNSZHZTZ2ZrMkdDaDhMUGxtMWcyeWEz?=
 =?utf-8?B?Q1I0dVNKRVJBK2lodHhMb0xNSVVVYmJlK1F0ME51dzU3TFNrblN2RGNuQXN2?=
 =?utf-8?B?WnpWeHQyUGkxSjlYQU9FVVJNRllGRlJ2bWhIbFNKMEhlRXhoY2tPNm9QSzhI?=
 =?utf-8?B?VklnbHEyQmdJL3NqYTlxbkE3bTkzWXY0bjZvRDZFcGpnZUg4M3BpNVJqWDV3?=
 =?utf-8?B?YkEwekhkK2xqeTNvVWZKWEU5cm95ck5GN21FcFFRQ2FhTk1RdldwYUxuMjFj?=
 =?utf-8?B?cW05bWhVdUxXYmhqUzRIeHBBV0ZUYml4MDZyb3AzajhvQUxNUHh3Snp4SXh0?=
 =?utf-8?B?MkdzV0xYNjRCVFZoY3NPVzc1cE9pQzZmUHRkdkppU1FWa0FaRm4vU0RVa21u?=
 =?utf-8?B?THFKUnBRUlRlbkRnV0hUK0hBY0NvcXdLcGJrcFJJQkgyekJRWmQ0eWdWczQz?=
 =?utf-8?B?K2NaY1g5Uys5aVVQN0tLOW55cmdObjBWSG9xc2hwNmtubkJ0aGoyTHRuVmpv?=
 =?utf-8?B?cUt0aEkxN2JHQ2dTdWRnSjVLT29uV2E2WHQ3VDNHOGtDU05ZNmNFaUNtcE4r?=
 =?utf-8?B?bnhNRzZTNGlhUlhSbk05bzhWdVlwZnVNYUtpbUMzSEkzVVUzK0ZSdWY1Wk41?=
 =?utf-8?B?NXI4SVFSYmNMS1FnWDRMVFBQWlFYMjNxWkFlOThGWjA1Ym10bXYyWnN1SjJu?=
 =?utf-8?B?SlUxaEs0NStKbFlTS0swU3pMM0x1MTE2Nms1WnQwWXpNR1VRdkRQMUdWb0tO?=
 =?utf-8?B?ZDBUWTl3OUFaZFdvdmxDdE9oZ2llalNSMGZZTkRNQ2Vsdy9zK1VzMGk1Rmto?=
 =?utf-8?B?RStnTmdDSVBJZDFKMTlRbXpCcy9memhDQjZISzRUQXVOd1UwNjRwVmFCQ1kv?=
 =?utf-8?B?cUxXaFBmNXU3UVBpMnR3VGJJT25mSW52ekV2Y2pWQm5Lc3c4ZjN1R2tuWjVJ?=
 =?utf-8?Q?Duxw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c94937e-86da-4c0f-f42e-08dd4a22e1ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 22:33:03.6127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: egrKAKBZnZ7HcW1TkMP7QIxaXTt9ANZ3z8yZ2b8LN9Ubol0Z5kSUsiycG3xNegty
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9479

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb3NoIFBvaW1ib2V1ZiA8
anBvaW1ib2VAa2VybmVsLm9yZz4NCj4gU2VudDogTW9uZGF5LCBGZWJydWFyeSAxMCwgMjAyNSA0
OjI1IFBNDQo+IFRvOiBLYXBsYW4sIERhdmlkIDxEYXZpZC5LYXBsYW5AYW1kLmNvbT4NCj4gQ2M6
IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPjsgQm9yaXNsYXYgUGV0a292IDxi
cEBhbGllbjguZGU+OyBQZXRlcg0KPiBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+OyBQ
YXdhbiBHdXB0YQ0KPiA8cGF3YW4ua3VtYXIuZ3VwdGFAbGludXguaW50ZWwuY29tPjsgSW5nbyBN
b2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+OyBEYXZlDQo+IEhhbnNlbiA8ZGF2ZS5oYW5zZW5AbGlu
dXguaW50ZWwuY29tPjsgeDg2QGtlcm5lbC5vcmc7IEggLiBQZXRlciBBbnZpbg0KPiA8aHBhQHp5
dG9yLmNvbT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MyAwNC8zNV0geDg2L2J1Z3M6IFJlc3RydWN0dXJlIG1kcyBtaXRpZ2F0aW9uDQo+DQo+
IENhdXRpb246IFRoaXMgbWVzc2FnZSBvcmlnaW5hdGVkIGZyb20gYW4gRXh0ZXJuYWwgU291cmNl
LiBVc2UgcHJvcGVyIGNhdXRpb24NCj4gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlja2lu
ZyBsaW5rcywgb3IgcmVzcG9uZGluZy4NCj4NCj4NCj4gT24gV2VkLCBKYW4gMDgsIDIwMjUgYXQg
MDI6MjQ6NDRQTSAtMDYwMCwgRGF2aWQgS2FwbGFuIHdyb3RlOg0KPiA+IEBAIC0yMjksOSArMjU5
LDYgQEAgc3RhdGljIHZvaWQgeDg2X2FtZF9zc2JfZGlzYWJsZSh2b2lkKQ0KPiA+ICAgICAgICAg
ICAgICAgd3Jtc3JsKE1TUl9BTUQ2NF9MU19DRkcsIG1zcnZhbCk7ICB9DQo+ID4NCj4gPiAtI3Vu
ZGVmIHByX2ZtdA0KPiA+IC0jZGVmaW5lIHByX2ZtdChmbXQpICAiTURTOiAiIGZtdA0KPiA+IC0N
Cj4NCj4gV2h5PyAgRm9yIGNvbnNpc3RlbmN5IHdpdGggdGhlIHJlc3Qgb2YgdGhlIGZpbGUgaXQn
cyBiZXN0IHRvIGxlYXZlIHRoZSBjb3JyZWN0IHByX2ZtdCgpDQo+IGluIHBsYWNlIGZvciBtZHNf
KigpLCB0YWFfKigpLCByZmRzXyooKSwgZXRjLg0KDQpJIGhhZCByZW1vdmVkIGl0IGJlY2F1c2Ug
aXQgd2Fzbid0IHVzZWQsIGJ1dCBpdCBhY3R1YWxseSBjYW4gYmUgdXNlZCBmb3IgdGhlIHByX2lu
Zm8gaW4gbWRzX3VwZGF0ZV9taXRpZ2F0aW9uIHNvIEknbGwgcHV0IGl0IGJhY2suDQoNCj4NCj4g
PiAgc3RhdGljIHZvaWQgX19pbml0IG1kc19zZWxlY3RfbWl0aWdhdGlvbih2b2lkKSAgew0KPiA+
IC0gICAgIGlmICghYm9vdF9jcHVfaGFzX2J1ZyhYODZfQlVHX01EUykgfHwgY3B1X21pdGlnYXRp
b25zX29mZigpKSB7DQo+ID4gKyAgICAgaWYgKCFib290X2NwdV9oYXNfYnVnKFg4Nl9CVUdfTURT
KSB8fCBjcHVfbWl0aWdhdGlvbnNfb2ZmKCkpDQo+ID4gICAgICAgICAgICAgICBtZHNfbWl0aWdh
dGlvbiA9IE1EU19NSVRJR0FUSU9OX09GRjsNCj4gPiAtICAgICAgICAgICAgIHJldHVybjsNCj4g
PiAtICAgICB9DQo+DQo+IEZvciBjbGFyaXR5IGl0IHNob3VsZCBzdGlsbCByZXR1cm4gaGVyZSwg
dGhhdCBtYWtlcyBpdCBvYnZpb3VzIG5vbmUgb2YgdGhlIHN1YnNlcXVlbnQNCj4gY29uZGl0aW9u
cyBhcHBseS4NCg0KT2sNCj4NCj4gPiArc3RhdGljIHZvaWQgX19pbml0IG1kc19hcHBseV9taXRp
Z2F0aW9uKHZvaWQpIHsNCj4gPiArICAgICBpZiAobWRzX21pdGlnYXRpb24gPT0gTURTX01JVElH
QVRJT05fRlVMTCkgew0KPiA+ICsgICAgICAgICAgICAgc2V0dXBfZm9yY2VfY3B1X2NhcChYODZf
RkVBVFVSRV9DTEVBUl9DUFVfQlVGKTsNCj4NCj4gVGhlIG1pdGlnYXRpb24gc3RpbGwgbmVlZHMg
dG8gYmUgYXR0ZW1wdGVkIGZvciB0aGUgTURTX01JVElHQVRJT05fVk1XRVJWDQo+IGNhc2UuDQo+
DQoNCkdvb2QgY2F0Y2gsIHdpbGwgZml4Lg0KDQpUaGFua3MgLS1EYXZpZCBLYXBsYW4NCg==
