Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB836213E85;
	Mon, 21 Apr 2025 08:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223340; cv=fail; b=az2Meuzf7NxIynkBBSSqpBfRcmzCM0F3OBMdqiEiVun3+EU5BrCiS14o4dFpNKTociH/h0AzGbCMMo1DBnuqlKz6Pt/P6O/4wxNhD/kWu2s51z4ayskkKElVzhbnCDLqglG6tgVAnxWQhdHJzQwqtWLw+eNXSdQRxb+JjdqRZZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223340; c=relaxed/simple;
	bh=ToBQCAe9DFsp4Y9Jqhj8yqI3FimXlhJo1UmRknX+RI0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=fbl9NFt63I10+CLNi45rWWyHUIknGq7t06EBJvCX/SAdCCkLAverf7MIRSzLok5vWubu5WaJpdy6Ol9g8E9LxbAGLpHudkZ6fwj5fCJpDQqJhcs2MZuclIgO8zaRX/e9u9avzcZ/12BVJvdNF1GNPRvEosLtZwf6HonYBVaKVQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Su0oi5U8; arc=fail smtp.client-ip=40.107.244.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Su0oi5U8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKUc6cp4oIpon++WMquCeQcFIhmpQF/lEF2GAhESHbb33+Tyl7hHHcDhD8OKbBR2whYLumJjv8ivEQ4Gj9EoXacBU95AqqZNNRMYE6zsDdC0P6kReHR04hWeqhxio0N6aQRAn5sFhoSg29D+Rjdp/LV+NVumg7Tx90Tvm9ZDg+9qPzeejC3rfuhBLs4vUOT6vQSUjgSolswufV1iDnwfDwetoW/cp1w8meElQQvyvYZokpu7VqLiaF44qJx+34E5PlcovWeq167nOzMjTYGXLAgQPxglMhQOVAB6H4ee6kWcFiK1sutiXBGXo2CWCNAnH/ez5A2oqwfLQ5Jkiyre2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6QKmFF9tgWPwAFXTFoD7fa9hhagHnoDBcYSpd3iQ/M=;
 b=WD6ppK1JHtZXIMOj/0vP0Lh3R2VDulXRyguqegT5TQR16jXTUFI29cBqXDs7qZuXHefEk5xqSDx/MLMjetAsW9n/vdQX6MdmgtxeR5TNUwonC+OLP/jXuZreVhsARbaME2JmuAgOqgTyBuVm+hRaB9gBDK7rsic0eFfqc3dGLvSmfmt/uEDX89N5tPpi/FtGEfx+iqEFydGW0CLrhDVIbDIVSIHSupXfKTelzl/3qzAOnvl/gAkjk9uhRMXaOJxddjENLBHZd8rxOm1+5GMh1w99jnfObpeVyI1Q4i1V5W06hss18GuaAHDn21DvntOMg7+TTDYabFN8KjPutZncAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6QKmFF9tgWPwAFXTFoD7fa9hhagHnoDBcYSpd3iQ/M=;
 b=Su0oi5U82axmYwLGgwIRPd/18JeFpOxi/F2NrIoJktfDFyS/eBqA40AKKpgvCSLxed/cHNR1AK5x5HYb6+slQz3NltNLAMupHYoVBSDwdqabJx3+CjanQ2xBV+OKNA8Ug0nL29jnhoIBvIDJxiqnS3ySUGc5WlDju2FKQHZrrnK7r+fypOAV9bBgMBNqf1SXo+6VaCLUlo/p8N6zeU3Ls5IYWkema6vsWs+tpxMtOfySm273VKgYJ6n+Z35neW8gjFaSSBpFkTQ2DE5mkRQV2K+gCm2sfVDGtzi3qstIrDCB5YU/2f/vG6H8ZahZFjAdIDpNAx3vSaFx+MZlScDkFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL1PR12MB5754.namprd12.prod.outlook.com (2603:10b6:208:391::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Mon, 21 Apr
 2025 08:15:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 08:15:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Apr 2025 17:15:29 +0900
Message-Id: <D9C61DDI99JX.31T59XPQGYBB1@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] rust: alloc: implement `extend` for `Vec`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250406-vec_extend-v3-1-ec5c5c0acf2a@nvidia.com>
 <Z_OwmEKHgsZlt2cs@pollux> <D91AOKOTDXWC.7R5K5DI87QU4@nvidia.com>
In-Reply-To: <D91AOKOTDXWC.7R5K5DI87QU4@nvidia.com>
X-ClientProxiedBy: TYCP286CA0020.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL1PR12MB5754:EE_
X-MS-Office365-Filtering-Correlation-Id: a6bc818e-14e8-42e4-c851-08dd80acb013
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RkpwdllXWlROeGhKTkpQNmdaU0I2Mlo0YTlLZW9VTENLazlZSm9UbnVqQ2N6?=
 =?utf-8?B?S040cFJrcWxsa3orOVB6a1VDZStENFh5YldtZHNheWtXelI2U0c4L3EwclVO?=
 =?utf-8?B?NzdBMmJrWU5YOWhqcldrNFpYS2xJODRmWitQc2taQVdGSHNON3pSS0hGcHVs?=
 =?utf-8?B?UlQrZFhUZ21LZkQ4MTV0aWNYaXN3dGF0WlcrK00reG1wSUIzZ2hRZHpMRklv?=
 =?utf-8?B?cXpGcUY1enVYb0tPTzVOcWdoNDNqRHJzWW5xWVg0ZVpidkppV3J2YWFGNnFx?=
 =?utf-8?B?SGxqbUJtMG4raTRNMFpYMlVlcDdBYTFVOEk5L05jM1YyNno2VllKZ1VXV29N?=
 =?utf-8?B?b1I0UWYrSEkxQlMzakgzNEkwUnZJaG0rc0RvWm40bTJiNTRVcTlweWJlVUpK?=
 =?utf-8?B?VTVrZjQzajRTTXJJNElxdk4weEJCS2tJRVdaMjJsdFAvUnZYbHUxZENQYXF6?=
 =?utf-8?B?WTdGMWVDZnBjYUJYU09pd1p5amgySlNhek1wY0ZjcW02OXRTdHZuc1JPbEo4?=
 =?utf-8?B?dVpGV1ZUSCtRSm5wQ0FDa0NiZVZKeDl5OVdUcXBmc3dOVUdNa3RMRU1JTGtF?=
 =?utf-8?B?cUN4c09FMDVYQjE4WHZ0QTFUY1FTSzVGeWxFQkVhK1VkcnpCYjUwNW1VQVRm?=
 =?utf-8?B?aUlrTDlKZVNzWXo2b3hvV3ozc09TTHBES1dTQjVyOHlKZXk0ckpUMjNWUEUw?=
 =?utf-8?B?aGFuYmJmR2NIc01Fc2tLdlFPMDVDc1dpOVVJVFI1N0Y4VnVRSGhOQ2pyUm1V?=
 =?utf-8?B?YmJaZGJEaTIrb0IwSE5OQnRld01qQjcyb2JGTjFHclMwbkVOdisyd0RGb2NX?=
 =?utf-8?B?aXNnSEMvQ28vbG9Na0NKVnRyNStUSTB6NmRqWkVmRGZsM0JrQVJ4L3V5TE9T?=
 =?utf-8?B?RjBmVXl6VTY3NEJaaGhjZ0NXNUZpMXZYZ2JhTE9QeEhGK0JKbjdLK3RpYi9h?=
 =?utf-8?B?T0RqYWJrdlNFNFZGbndJVVZOMWl1czh0cFBaZHdqR2ZkcWhZUUtsbnBwUHdS?=
 =?utf-8?B?blNDdlBlS2o0ekRzWURrN1RvbDdHeDc3RnlDcnkvaThTMUpPTkdhcG1lUFgz?=
 =?utf-8?B?SmMvR0t6QnQ3ZndZOXJ1UmNDNnQwTHYzN2h2QVhCdWt5bEVUUkVNSGI2YXI2?=
 =?utf-8?B?RlZoNGRueDhHYVdrRXVoVnphQUNsUUhUSG9RUWVieWJLdmJmaElZUk5mc3d4?=
 =?utf-8?B?Vys2TG1zUi9Bb3NEWitNeW80OHZwS0dRMjJKZjdvZmJSdFZMQjVuQ3dVelhB?=
 =?utf-8?B?RUJ6WU9ZL3ZCb1lQM3AwQkNvL0wrS1RoR0FhWC9hMFVBeFJiWitjaisySnJD?=
 =?utf-8?B?VVM2ZWYwZW9aSWlwYm9CTXh2SG93WHMxQlE5WmlwT1JXS1ZCWnUzS3ZsMmJN?=
 =?utf-8?B?T0xuVmNBeFBqd25mRDgvdkxKZmhLenVvQ3Z0bGtnRGtkWHFJUlh4WmR5WGJN?=
 =?utf-8?B?R01zQ0cvbWpxY0R1RTBPOEdhOExQNHF0c2h3RU5va2o5cndkdGd4WUs1MlZq?=
 =?utf-8?B?QmtlQjQvQnkwaWtYc0NqYmVqQkZtbGk4czNzbWw3RWtOUHU3dUt5SkUyaEZH?=
 =?utf-8?B?Vk5GRzRFRjlSR0FRTEw0VlBCTVRCU0Y1K04zT1FwQzFPVDk4S3lkNzRKZWFr?=
 =?utf-8?B?MmN2MG9LLytwTENlUndGSlR0V3JTNEtzTVV1ZTA2S01DeG9MRVFzeEJDbEtL?=
 =?utf-8?B?YkNVQ3o4ZVdMeVErcUNoYXIzeFNnMm4zMXJud25Qc296RGpib3ZCSDJaMkp6?=
 =?utf-8?B?YmRnV3NGM3owaDFrUDJtQkZQYUZ5ZUhrTkFicFlQMVk4YitVQmluSytpbnAr?=
 =?utf-8?B?MldtZVU5d1BvYTNiUTRsTHpIYlQ0VXdrMFhvVnVycmQzSkVxbnB2bzhXTnRL?=
 =?utf-8?B?d201WFZRbjBtSzhxKzdOU0t6NTlIbFU2L1I1MFZzMmk2ckJoaW9OQXJITktG?=
 =?utf-8?Q?8NTCFo7Th/M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXg5UjhocThDOXVZQlJyVTR4MHVGenpqQTFQYmYvVUNuWStUWEEzUDhUSGlZ?=
 =?utf-8?B?MWpFSWhwOVI3VTZtMitmOVd6SGYyaG0wbko3d0h2N3ExSCtsS1RDbTUvempo?=
 =?utf-8?B?am14aWJ4aEtUdjF1Y2JyOTdxV1dsb21QZ1Bic0xqMWFvMlNJWUtKd2dVYk5V?=
 =?utf-8?B?L29rZU1vdHZGSjRUdDgwWnlpMFh3SGdoNkNBREo0WTE5dGVRNytRbnp3UG1j?=
 =?utf-8?B?dWRidzQ4NllzWE9oRGZuaWc5eVJpYlROTXhlMWVzTjdzVHY0YnRyUUNOeVNY?=
 =?utf-8?B?akk0WWFmTGpTTXFSUjE0MHZzU1BUdzNWdmdHdmtjTFkxdmRUd1VBZWhpaGdI?=
 =?utf-8?B?UUVJVXd3M1BuVFRCQmI4N3BnWDlCdlRnTFI2UFNoS1lxNmNVUXNvRWV5MjZR?=
 =?utf-8?B?U21ISjlQU1ZzbkR2WmZKZmprTzNCSDBwZjJTalRxTHdWUEVNT0MyN0lRcjNR?=
 =?utf-8?B?Z0FIRjZaR21iUHhTdzcxblJEQ1ZHUncwYXVwT0tnNitmTXl6cUllUUxvdWpE?=
 =?utf-8?B?STZQT1RqTHNxZ0dFamhwc3d0SExaUFIwS0JMSlJ5ZFJCcUdqSG83a2duZnpX?=
 =?utf-8?B?QkZNcW1pbTM2RU5nYlFVOXlUK1dTZ0txTUU5Wm5Ob3JSMEhCMSt1aHhOWER0?=
 =?utf-8?B?Y0tSTlhXV2pkblBpZnB4K1paVjdTMi9tOG53NWt6ODlCcnZuRERuYjBlcjJh?=
 =?utf-8?B?czJXenp5cXZKOUZQRXJNMUN5WFZYTHBxWVVPVTBZUmVUaGUvRm1NeFFWakVh?=
 =?utf-8?B?MzM3eWhVbEViZFVuOU53azVQWnBzYnUxNmxVMjQrVzRDMnlHVy9XU1VuRmRB?=
 =?utf-8?B?cEVyYW9nWnFYdEJFR2pEYWhyVXdlcXl2eERvSC90V0R0Wi81ZzB6Y2w3Nkh6?=
 =?utf-8?B?UVJsQ0tkcWgreForSmJ3Z2NzWTRRNENiV1Q1WkZWT0ZMbytMZzV4T0FCZzE3?=
 =?utf-8?B?dk95TEZBY0o4aWJmTkR3d25JVXNXNjYvODc4V2JxR1pFTGZYSUhHOTZHNWh5?=
 =?utf-8?B?K1UxdTBhTFdmREZXUm5nMFc1dFoybFlLNDJiWVJDRUVuM0szLzBBUmZrTkxj?=
 =?utf-8?B?Vkl1S0tnR2c3YzF2d3dVSjJrSGxzZ2FhVUJZcUkvVnNYS2lKRzBFVVV6aGlh?=
 =?utf-8?B?ZWlCaVZKQmQ5SmQ1M3B6UkJ1RTBZalNDT0k1RkZCaC85aHhYeVUxZnJpdmhH?=
 =?utf-8?B?RllVVUJtc3dGemFJTnBXYTZCZ0IydEhrUGZpWS8wUHFkb21TY2ZxWHZJcTJ2?=
 =?utf-8?B?UEkrQ3Q4VllVcDBMcEVBV0l6L3p2RU1NMzJ0SElCY0d3N3VUd2wrSUlYMVFN?=
 =?utf-8?B?R3Q3SHBnWERJbzJTeU5jRWRpampRZkx2MnRQV2xYbW8yVHB6Z2xvdGxTQUFy?=
 =?utf-8?B?bDhNRDFtT0t3WXpxUU1WV1ExUmQyMjFXYldIV0djOW9OQmRCeEtGM2tFUEkz?=
 =?utf-8?B?S2g0SHUxV0t2T1EzUXVTbENBWlhaWVdVcjUxcVVRVTVCRnVIRkg3OWdicDlm?=
 =?utf-8?B?TytHTC9NeUoxc0dZaUZDb2JwR1NzdTl6NGQzR1lsTUZCd2F6WmhjUmxkR0VN?=
 =?utf-8?B?M0trQWFhSHQ1Z0hjM1VCaHI3UEk4bG16SVlydnpJUUNST1ZCQnlhWDh1Zm5U?=
 =?utf-8?B?WEZsM2xScjVtSGo4L25aV3Vya3YwS1R6TStPMVNNSW1QTWVkVE9LV09ySUdG?=
 =?utf-8?B?OUEwM3BmamxadzJMczFiQXBScTBBb3FmM3J1T1EzeUZ2bk40VUxNK3lRMTBY?=
 =?utf-8?B?Sm0rT2VUS1VtSU5BM0FqS2tzZ1BqeHhJN0ZWUDM1ZU1YTlMrMExFRkN4U2xM?=
 =?utf-8?B?M3hlZlVOMm1oRENRZ01NMk1NczRxUUtoWDVpaWRZVVdDTE5hc1VpL2hEWTY1?=
 =?utf-8?B?cWp3MlJhVDVhNHkzSWdkYUZ3cXllaXNUUXdmSkQwcEMvUEsxdHhhRG1DbE1N?=
 =?utf-8?B?TlFadnY1UUdJZlRsdU9heVEzRHlqejRiRGNKVEl1RW1ISEFGS0JKZUYvTmtI?=
 =?utf-8?B?c1M3aS84WVRWcnAxWlpJYkc1KzM4VHVlRURUOCs1ZDdFWFBuVmwrRERLb0JB?=
 =?utf-8?B?RUxReTE4STVQMkxocU1WVzlLd0hpWkg3ZnZxMVRTYi92UTVjK3lVbmNsdU1u?=
 =?utf-8?B?bDJXZnAxNHdBRzNkYzZmaDR6dEpQeUc1azBvSDJrVTJVTVdnWDE0VVJTU2Yx?=
 =?utf-8?Q?rJMz56eUJ5IRVs35TN4/doGoZ6lddVlhcy+7Ua3V/1He?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6bc818e-14e8-42e4-c851-08dd80acb013
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 08:15:33.7837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wIKCbn0gBHYr2lrZmckFS0Ozh6hbqAuhSEbUtLDWK9ejl2N7Gy7oD4L7GADrB4ga+h+J6u37Sc+st3aud2kNWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5754

On Tue Apr 8, 2025 at 10:34 PM JST, Alexandre Courbot wrote:
> On Mon Apr 7, 2025 at 8:01 PM JST, Danilo Krummrich wrote:
>>> +    /// Extends the vector by the elements of `iter`.
>>> +    ///
>>> +    /// This uses [`Iterator::size_hint`] to optimize memory reallocat=
ions, but will work even with
>>> +    /// imprecise implementations - albeit in a non-optimal way.
>>> +    ///
>>> +    /// This method returns an error if a memory reallocation required=
 to accommodate the new items
>>> +    /// failed. In this case, callers must assume that some (but not a=
ll) elements of `iter` might
>>> +    /// have been added to the vector.
>>> +    ///
>>> +    /// # Note on optimal behavior and correctness
>>> +    ///
>>> +    /// The efficiency of this method depends on how reliable the [`It=
erator::size_hint`]
>>> +    /// implementation of the `iter` is.
>>> +    ///
>>> +    /// It performs optimally with at most a single memory reallocatio=
n if the lower bound of
>>> +    /// `size_hint` is the exact number of items actually yielded.
>>> +    ///
>>> +    /// If `size_hint` is more vague, there may be as many memory real=
locations as necessary to
>>> +    /// cover the whole iterator from the successive lower bounds retu=
rned by `size_hint`.
>>> +    ///
>>> +    /// If `size_hint` signals more items than actually yielded by the=
 iterator, some unused memory
>>> +    /// might be reserved.
>>> +    ///
>>> +    /// Finally, whenever `size_hint` returns `(0, Some(0))`, the meth=
od assumes that no more items
>>> +    /// are yielded by the iterator and returns. This may result in so=
me items not being added if
>>> +    /// there were still some remaining.
>>> +    ///
>>> +    /// In the kernel most iterators are expected to have a precise an=
d correct `size_hint`
>>> +    /// implementation, so this should nicely optimize out for these c=
ases.
>>
>> I agree, hence I think we should enforce to be provided with a guarantee=
d
>> correct size hint and simplify the code. I think we should extend the si=
gnature.
>>
>>      pub fn extend<I>(&mut self, iter: I, flags: Flags) -> Result<(), Al=
locError>
>>      where
>>          I: IntoIterator<Item =3D T>,
>>          I::IntoIter: ExactSizeIterator,
>>
>> And implement ExactSizeIterator for IntoIter.
>>
>> The only thing that bothers me a bit is that the documentation [1] of
>> ExactSizeIterator sounds a bit ambiguous.
>>
>> It says: "When implementing an ExactSizeIterator, you must also implemen=
t
>> Iterator. When doing so, the implementation of Iterator::size_hint *must=
*
>> return the exact size of the iterator."
>>
>> But it also says: "Note that this trait is a safe trait and as such does=
 not and
>> cannot guarantee that the returned length is correct. This means that un=
safe
>> code must not rely on the correctness of Iterator::size_hint. The unstab=
le and
>> unsafe TrustedLen trait gives this additional guarantee."
>
> Yeah ExactSizeIterator is not the solution to this, since it can be
> implemented without an unsafe block and the implementer is perfectly
> free to provide an incorrect value - so we cannot trust its result.
>
>>
>> Acknowledging the latter, I think we should implement our own trait for =
this
>> instead. Our own version of TrustedLen seems reasonable to me.
>
> That sounds reasonable and would greatly simplify the code (and remove
> most of my fears about its optimization). Let me explore that direction.

Well, that turned out to be an interesting rabbit hole.

Leveraging the existing traits seems a bit difficult:

- `ExactSizeIterator` cannot be implemented for adapters that increase the
  length of their iterators, because if one of them is already `usize::MAX`=
 long
  then the size wouldn't be exact anymore. [1]

- And `TrustedLen` cannot be implemented for adapters that make an iterator
  shorter, because if the iterator returns more than `usize::MAX` items (i.=
e.
  has an upper bound set to `None`) then the adapter can't predict the actu=
al
  length. [2]

So in both cases, the model breaks at the limit. OTOH, in our case we want =
to
gather items into some collection, meaning that we are quite unlikely to ev=
er
reach that limit, as doing so would likely trigger an OOM anyway.

Which means that we need to come with our own unsafe trait
(`ExactSizeCollectible`?), which will have its own limits. It shall only be
used to collect things (because we are unlikely to reach a size of `usize::=
MAX`
in that context), and will take the lower bound of `size_hint` at face valu=
e,
meaning it might collect less than the whole collection if the lower bound =
of
the iterator or one of its adapters ever reaches `usize::MAX`. Again in the
context of a collection this should never happen, but it's still a limitati=
on.

If we can live with this, then with a bit of code (because the new trait wo=
uld
need to be implemented for every iterator and adapter we want to collect ou=
t
there) we should be able to provide an efficient, one-pass `collect()` meth=
od.

Thoughts?

[1] https://doc.rust-lang.org/std/iter/trait.ExactSizeIterator.html#when-sh=
ouldnt-an-adapter-be-exactsizeiterator
[2] https://doc.rust-lang.org/core/iter/trait.TrustedLen.html#when-shouldnt=
-an-adapter-be-trustedlen

