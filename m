Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2DA1CAB3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 03:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751340479; cv=fail; b=FJn1Stq1uNYWt0ojz8WcxS4IH7ET0sqXcVjB+zTO6x+190FXmFtpbaLYG22WO2tpy0ls9Tfi0i50d25wax6Yj0eLjh61ZaAj+uZP+uDQHj+mnHZHtAFQykFNXi+SvSXz+j7ZJ3Z0Yn2Obfwu3/8ERsUu/pVxXsVSMUihFnwlgJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751340479; c=relaxed/simple;
	bh=GJhEz5Y/KlfGpOvJHbXnq4DSWTPpBs2ynQW+2KJ48IQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j7YEp5T8MiLZKihpafByx5peG9aiOR7Ab+B/XIa0lriD6LSLsNMGVLGJKgPUjNb+jkJJuIvcMRVU2DIm/03071bAO97oD+ASwvADYAqfKhLnjYcXima3l9A1f5j+sCJBs0NqhwOijULsVsYMfg0DY1b3k0MGlEykphrCueh6qOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CZETt8NB; arc=fail smtp.client-ip=40.107.237.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CZETt8NB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D1YgItooeMMY6JNKEIz4+pQJa6KwnYDLhW9W90dOnpZ8VnQi3RAjtuxm4o3rR1hJMOFv7CFiaSIjl6TlJ8wPUQ7igzF5pqpHzTCtOVvT14dFs12albtsSvwwXQJPs+/TKE77wTeW4QBuBDaD+wc4LgGEM2GSGipEps5D6kfrkFhoZ1XgLDZJDJd0tLFanSqTA2FL+AEYK6HexCJjQqFWARgpFZZsYOs0Q9fKfY/LCSBwEmwSYfP4qJuhqB3e24xjS+tszr333rMjGIAqJmb3FX7xecJu5ol2qnM+2N26qDpahZ3vIwA3MqI13246Be/3UUvNtHG8rusSiTcU0Y2ykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJhEz5Y/KlfGpOvJHbXnq4DSWTPpBs2ynQW+2KJ48IQ=;
 b=mA+4r1eFDDYhD6SOLO5HvFFl+ogmOS0JYwosC/iBsmBGL/8UwQ8eoRgRAR0EkCmGvrdZ37tjw+PNl7wyFH50uGnWclMx04VVkHFCN2iQFH77wZH/dTMBY4YBixz/RmQhgbrurjL2syDZFKrLCUkOZwiFka8k9jle8dglO9g/d1LXcIBWc1m2imfuZJW+6tjXKylS5C3lIXZC/SYtPrOlsXHYJ64/lKUiz6486A8BxCksT1A+KmHnF0RaS04WSlIBzBj76MX5aLy5nIiIUxD/+jM/zF6+Yc97PoPvZpSLkBqLTErYOs6Nm6ywz2lwjBC2zyQyf7ZcioI5PriW3u6YRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJhEz5Y/KlfGpOvJHbXnq4DSWTPpBs2ynQW+2KJ48IQ=;
 b=CZETt8NBnkZmcfHN/Qe4D7O4HvbjsV6Wv9INlwFNePV5jttKtZtOeqjXuUiN5FYI8HaMvP4LQlNh8nFMO/aUvUrIbB5DowtRJ/tDvthY45OH53U3r2Aocv6//WO9KbVfp7CiKRNVaRtoblvvWwdRdT4pnyyVG62+e9nSXJ2CWXk=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by BL3PR12MB6380.namprd12.prod.outlook.com (2603:10b6:208:38d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Tue, 1 Jul
 2025 03:27:55 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::2202:1a7e:2dd:ad1d]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::2202:1a7e:2dd:ad1d%6]) with mapi id 15.20.8880.030; Tue, 1 Jul 2025
 03:27:55 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Borislav Petkov <bp@alien8.de>
CC: Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra
	<peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 00/20] Attack vector controls (part 2)
Thread-Topic: [PATCH v5 00/20] Attack vector controls (part 2)
Thread-Index: AQHb6d2uvB1RPRdWV0mtJZ11sG0qurQcnFDw
Date: Tue, 1 Jul 2025 03:27:55 +0000
Message-ID:
 <LV3PR12MB926594EF4D386749428033CB9441A@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250509162839.3057217-1-david.kaplan@amd.com>
 <20250630164003.GHaGK945bgZlMdRtq_@fat_crate.local>
In-Reply-To: <20250630164003.GHaGK945bgZlMdRtq_@fat_crate.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-01T03:27:07.0000000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|BL3PR12MB6380:EE_
x-ms-office365-filtering-correlation-id: 002840a7-63d6-43e8-73c0-08ddb84f44b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dE0zKzNmdVNlNy9DelppaEJwcUhYVEwrVEJTK1NIbWF2MHpMVXF0dXpwaElF?=
 =?utf-8?B?SGVKanAzS0JpRGhVMFVvSzlIYVJDNTl6b3MzcVFUQ2VCWEJuRGNseS92bFM3?=
 =?utf-8?B?cWFsU3hhVnMzME1aUnFPSDYzUGpBVXRCWDBWUVE0cUpFNW1QdVAwT1E1RFFR?=
 =?utf-8?B?Z2NMRy9pRW5PV2l6ejlWUnhDbks2eXZUUXpEWTU0MGdWRU9BWk5BRHdXTE9S?=
 =?utf-8?B?RVczQk1lT1hCaW1CejdDRnVpZWoxTE5Qd0hXcmZja3YvR3dQYkN4R0VMMlJm?=
 =?utf-8?B?OXFxOWxncEtRMk94U2k4NVF4bFFQMzhYOC84dFp4TmpLdThKVDFRS0NGcnB0?=
 =?utf-8?B?RlpNbnlsNEUxSGFSa25ndjJZUFpodEpjV3YwanRBUXdJdEc3eXhBZHplNDFH?=
 =?utf-8?B?dlRVYm1QbE9qazNOYmg4VVhzVXU1UWtBcUFVckl6S0t0MmhTREh2U0ZTcndN?=
 =?utf-8?B?UGZPN1llL2Z3aDJqckJtZTFBWTd6eENISXRkbnVxWnJva2N1UmlnY3FzUU9E?=
 =?utf-8?B?VmVHZXRZYlVzVVJzNGd5V0Vhc0RWazY1YUs1UWgrTXRVVk5yeHIyYTJkS0JT?=
 =?utf-8?B?ejRYc2VPRHRudFlxcmZxR3QwM1JsR0Ivd3hJb0t2NFRIOFNnbnl5R2Z2YzNt?=
 =?utf-8?B?a3VJMTZhMlIvT09FNGxNZUN2eE1JeEtoaE91b3JMVFM4VzlsRlVrMjFjOTZ4?=
 =?utf-8?B?aFRnMmhCS0lIYjdGdDVYNjlHY2RiaCtWODNyL056bHhxcTZHMmI1Z1hiNkpK?=
 =?utf-8?B?WGFRbHZGOW1RaFgzNzU1S1pPZFZROVBOZWt6RlZrejNVdjRCRG13Vyt6djc2?=
 =?utf-8?B?azRGZ0FNdkNyb2xxT0M3WjlEQWxrak5qR0dPRXhXZkFHekhXT1c0Q2xwTEZu?=
 =?utf-8?B?RWwyV1ZabWhlZk8zdGQvT0ZiR0V5YU1lcHBFRWY1dG8vVXdjOWEyd0I4UEtz?=
 =?utf-8?B?MkJ4ZmczM1UvRjEyR2QyajIwUTg5TGltZGkzM1k5R2RNZEV4OHA2NG9iN0Vl?=
 =?utf-8?B?YVBVdStXaTVuV09EVEMvMklTOW9qa01CUEM0MHNybW5PTlNtY0lybkN0b0Zx?=
 =?utf-8?B?cG1zcVZuSitpQ1R5NVpQUVBSMTg0WjNhYlhuR0I2eTJXbVo5OHA5d2lQczIr?=
 =?utf-8?B?YWJrMldSbjl4TElyd3dmeHpwaFFYRGZWQkIxczhUVFJIbUFlUHBLODZ6VG9z?=
 =?utf-8?B?K2RyMktLRno5aXYzY3lLMHlMSVJMcDU2N1FSenZqZ1E2ZTBlQk1JLzVKS1d2?=
 =?utf-8?B?aFhnN3ZteFZNeDROOHNkRzFXL3hid2lDL1l1dkhTUmNab1F2UlZ4eWZhWUtF?=
 =?utf-8?B?TFhOZE5qTEZiczdpYU9LOHoyaWk5WEttbkRiaFdobzI4Q0kxTjRLbld4NU9O?=
 =?utf-8?B?V3RaR2tibHJHTlVtb2NCM1MxN3lxVFlxQnlNL3F2T2JPelZ0ZkxHaDZKR2hM?=
 =?utf-8?B?WkJ6N2R6OWRoU1lCbHBiOXJKaTNrUmVFTTNudHlycndIVGxrU1JaZFZwUjVz?=
 =?utf-8?B?UzNnQ0I3VFlnekZKK1FnTEVUUFJ5T0t6Zm9EbTg4dkVQYWE3VklZZjJ6aCtT?=
 =?utf-8?B?QlA4OWIxczFVbHFHbjVBMmRidFoyN3hqMHVkeVNDQmtwbGFhOHpQSzFYcHIv?=
 =?utf-8?B?bDZTQm5EQ3ArZ0xOaUxGblNwcS9CSVhrOHVqUWVlMGVIMTRMUDIwSlJMc1o5?=
 =?utf-8?B?YTdXZE5EK3U3MUxEOUtQT0hoa3IyNGF4ZzQ0TXZFY1p6cHdsSGVMdnl1QkV5?=
 =?utf-8?B?UmZ6ZTlNOTdWNVlvZW5lUE90K0oyakFZcXZjeGttUVZ2NTN5NFBxVXNsRTkz?=
 =?utf-8?B?YU05NEQ1N0drZHFIREJIdXZEU29iekkxTkl2RGJCcnFyRWx4RzdQMlNYOFhk?=
 =?utf-8?B?QUNESDFHcWZ5TVRvQk0wbzdzUndNWno3VnZYamk4VzZQMWt0amd3L01sekxs?=
 =?utf-8?B?RG14SS9zUkFqY2crSzI5eDhVdkVZZ1lEM1BWZ3BUY25pQnhvSUtldWxCNWFG?=
 =?utf-8?B?c2dsZFNRVjNnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UkwzNUtXV2ZVOU90SndGbWh3S0FjSzRJeTh2WFFvNWJSMEZGRk9OMUpJMHBF?=
 =?utf-8?B?MitkNW9UendRdm4wYzFWNndVQTdPdzJlMVdsRXVLV1FnSjk1MEtYMm9WOWRB?=
 =?utf-8?B?a0RPc3hRc2JyWG1Bc2xrUFI0OXpEcnBZeVgySUdBb010K3VTRVBacTZMUWJB?=
 =?utf-8?B?N3RPVThEbU9leUg0OVc3V3VJNnE1QkhGRjBoUmFBYjY1cDM2RkxtZUszYTBh?=
 =?utf-8?B?SUc0cys1VmpLWU16WURERnJSY0FOMVk1ZExXQjY2RG95UzIwaEQrbFQxZm9H?=
 =?utf-8?B?d3g5SndNYkVnTjc3T3BiTlo1UEVTZmc1SCthQ2xxOGMvOWFpYmRiR09oMlFP?=
 =?utf-8?B?SCs2RHdJNmozc1FIekRnQ01UVlBveFJnUEJMSWJFNWlZQUFnakdaSzlFVENz?=
 =?utf-8?B?cm53SjZWOEQvWWw3TWk3UUkzTjN1VWs0TURLTzcwbWhoQkNWVnZFSkk5NHdl?=
 =?utf-8?B?YzlOdldDdEpUTGJ0L08yMUtzQ28ramE0VFZkUWpvMC9RaW1DMkxCK09uSUd6?=
 =?utf-8?B?MlgyaU1rSjBSc2tlY2tXZmVkcEs1R3Q1ZzhyMDA2NndsenhudjQzZlpnWHRP?=
 =?utf-8?B?SnkyUlFsY3lISzErSmlwdjE1UEhkMEZaek5pbGdIUEtTTjh1eWdKMUFNNzNC?=
 =?utf-8?B?SE9SYUpuRjhndm10akR5LzNGVkpZRWJlWU54dGxpY2E1c3JPa29PVWRxalI2?=
 =?utf-8?B?K0d2WkJMYUVrbkVaSEFhTkJTcnpsMGx2Y2pyaFhtcDNSRU5IaGg3dUp3UE9w?=
 =?utf-8?B?cTVGWG5YMGpwblkwdHZ3S09paXh1NVEyUSs3SUxEWFRFdlNIeTZWMkp3Mkxa?=
 =?utf-8?B?aUFtZHIvelp6aUNGL1pYWGt1cmtzMlJVQzFFay95K2MwVmNrUWZSTnNCQndJ?=
 =?utf-8?B?dHpxYTcraUxueVM5Ym1wdVh5TTQ3TDFBZmhNZ3JiaG9BY3J1UkY5V0ZvcnBR?=
 =?utf-8?B?ZWJzMGxKazJ4UGhpSG9ra2FabEVuTENxdngrNVk4YjAvdTZ5S3cyWWIxWSt1?=
 =?utf-8?B?OWsxRkZjWkxQQnFuQk04eGQvV2kraUtyK3p4U1R1QUdudlZPSDIrRUN3K0JI?=
 =?utf-8?B?aVJXSDZReTdDNGpkK1pQcUZjS2RDWFlXQnJHMTIyUDBqUFRxdEhoVHI2MTlN?=
 =?utf-8?B?NzU0WkNiNHNFVjNHS3dFbVQ3ZWs1VHN1ckl4Y1RCRU8zYTN3M0NJMlhtQWlk?=
 =?utf-8?B?ZU0ydFVteWd2WjZrdjc0MUdjdHdaaURFUkNXcTkzRFNiVHpBNlJvcXVjNWZj?=
 =?utf-8?B?WmpmdHN6V3FYN1UyTmdrcklVdzI4a09XMUkrTW1adE5RWDlBZE9zTUF6REIz?=
 =?utf-8?B?MlR1STlJQlA0ZEIyVzlBUklUVHk5NW9CMUJlSFkzaTRoUDlGVzV4Y1RaeVpJ?=
 =?utf-8?B?MlJISEZWaWZNZGVwWkEzUVV3ZXZ5T1E2bEpRbnN4OGkwYWNUTExoVHhvaU04?=
 =?utf-8?B?QXlkMmRzTEEvcW5Gd3lMcGtYN3VQZ0hzMnlaeHlZdEZpdHlsNzZiU0JmZ2lB?=
 =?utf-8?B?cDVIa1k3akp2anBiWUN6Y0FFZCttdVg4em83TXFIOEU3ckN1b3piK285dDFR?=
 =?utf-8?B?NXBpL2tKeGRRSndROWxtWE5DWU9uU2tVQ0tFaS9ZV1ZWTmtpYmpHVTMxT2U2?=
 =?utf-8?B?aHFhM1Z4ZnYyKytBMHUrNk1taVlUZ2xMVzdsTE9JZXFCUFpXUTF0NFRldWR6?=
 =?utf-8?B?QWM1RlFDRDdSdjhTOGluZlg4bXV0T2Q4ZzBiYlREbGpmWFgzSFdWWnVxZXVB?=
 =?utf-8?B?L1gwZnpmdlE3bVZTMDM1Tmh3b3JCRUhOcHBTdUJGbFdRSEg3dEVuMm9OU2Mx?=
 =?utf-8?B?ekY2VkI1REgrSFA4emRIK2dEN2tPUFFMVXRCVWx3WnQzWU5xT1ExVHBFS0pq?=
 =?utf-8?B?d3EwYWxnRTdsMm9TY2NLUzdyYWtDUlFWaXdUSjRrcDh2cjJwRTZ1dUNNM0gx?=
 =?utf-8?B?TURxSnJzWVhOUHJscklJektWL2MyR0Qrdnc1U0RDeE9ET2NVUisvRmYzM0ZR?=
 =?utf-8?B?a1k0djRoQkE2UHRkUG16M3k2THI4RFlocEY5NFRsODU3d0x3WDZucjhJdEZT?=
 =?utf-8?B?N3VUbkJiNkNjWUxYRlRQWXJYMzczOVZSUXpKYk1SZVFaSDl5Ky9ZNWs5Uy9S?=
 =?utf-8?Q?a/7o=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 002840a7-63d6-43e8-73c0-08ddb84f44b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 03:27:55.1020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +LWDdAReie5rZX+xp8g46MOzINS4a7A56FbykXPVrI453PUnPy4oAJwQ36yS04T9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6380

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCb3Jpc2xhdiBQZXRrb3Yg
PGJwQGFsaWVuOC5kZT4NCj4gU2VudDogTW9uZGF5LCBKdW5lIDMwLCAyMDI1IDExOjQwIEFNDQo+
IFRvOiBLYXBsYW4sIERhdmlkIDxEYXZpZC5LYXBsYW5AYW1kLmNvbT4NCj4gQ2M6IFRob21hcyBH
bGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPjsgUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZy
YWRlYWQub3JnPjsNCj4gSm9zaCBQb2ltYm9ldWYgPGpwb2ltYm9lQGtlcm5lbC5vcmc+OyBQYXdh
biBHdXB0YQ0KPiA8cGF3YW4ua3VtYXIuZ3VwdGFAbGludXguaW50ZWwuY29tPjsgSW5nbyBNb2xu
YXIgPG1pbmdvQHJlZGhhdC5jb20+OyBEYXZlDQo+IEhhbnNlbiA8ZGF2ZS5oYW5zZW5AbGludXgu
aW50ZWwuY29tPjsgeDg2QGtlcm5lbC5vcmc7IEggLiBQZXRlciBBbnZpbg0KPiA8aHBhQHp5dG9y
LmNvbT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2NSAwMC8yMF0gQXR0YWNrIHZlY3RvciBjb250cm9scyAocGFydCAyKQ0KPg0KPiBDYXV0aW9u
OiBUaGlzIG1lc3NhZ2Ugb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gVXNlIHBy
b3BlciBjYXV0aW9uDQo+IHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcgbGlua3Ms
IG9yIHJlc3BvbmRpbmcuDQo+DQo+DQo+IE9uIEZyaSwgTWF5IDA5LCAyMDI1IGF0IDExOjI4OjE5
QU0gLTA1MDAsIERhdmlkIEthcGxhbiB3cm90ZToNCj4gPiAgLi4uL2h3LXZ1bG4vYXR0YWNrX3Zl
Y3Rvcl9jb250cm9scy5yc3QgICAgICAgIHwgMjM2ICsrKysrKysrKysrKysrKw0KPiA+ICBEb2N1
bWVudGF0aW9uL2FkbWluLWd1aWRlL2h3LXZ1bG4vaW5kZXgucnN0ICAgfCAgIDEgKw0KPiA+ICAu
Li4vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0ICAgICAgICAgfCAgIDQgKw0KPiA+
ICBhcmNoL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDMgKw0K
PiA+ICBhcmNoL3g4Ni9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEg
Kw0KPiA+ICBhcmNoL3g4Ni9rZXJuZWwvY3B1L2J1Z3MuYyAgICAgICAgICAgICAgICAgICAgfCAy
NzggKysrKysrKysrKysrKystLS0tDQo+ID4gIGFyY2gveDg2L21tL3B0aS5jICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgNCArLQ0KPiA+ICBkcml2ZXJzL2Jhc2UvY3B1LmMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgNjcgKysrKysNCj4gPiAgaW5jbHVkZS9saW51eC9jcHUu
aCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIxICsrDQo+ID4gIGtlcm5lbC9jcHUuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEzMCArKysrKysrLQ0KPiA+ICAxMCBm
aWxlcyBjaGFuZ2VkLCA2NzIgaW5zZXJ0aW9ucygrKSwgNzMgZGVsZXRpb25zKC0pDQo+ID4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2h3LQ0KPiB2dWxuL2F0
dGFja192ZWN0b3JfY29udHJvbHMucnN0DQo+DQo+IE9rLCBJIHJlcGxpZWQgdG8gb25lIG1lc3Nh
Z2Ugd2hpY2ggaXMgbmVlZHMgbW9yZSBkaXNjdXNzaW5nIGJ1dCB0aGUgcmVzdCBsb29rcw0KPiBv
ayB0byBtZS4gRmVlbCBmcmVlIHRvIHNlbmQgdGhlIG5leHQgcmV2aXNpb24gb25jZSB3ZSd2ZSBy
ZXNvbHZlZCB0aGlzIHNvIHRoYXQNCj4gSSBjYW4gcXVldWUgaXQuDQo+DQo+IFRoeC4NCj4NCg0K
QWNrLCB0aGFua3MuICBOb3RlIHRoYXQgdGhlIG5leHQgcmV2aXNpb24gd2lsbCBhbHNvIGluY2x1
ZGUgYSBuZXcgcGF0Y2ggZm9yIGFkZGluZyBhdHRhY2sgdmVjdG9yIHN1cHBvcnQgZm9yIElUUywg
YnV0IHRoYXQgc2hvdWxkIGJlIHByZXR0eSBzdHJhaWdodGZvcndhcmQuDQoNCi0tRGF2aWQgS2Fw
bGFuDQo=
